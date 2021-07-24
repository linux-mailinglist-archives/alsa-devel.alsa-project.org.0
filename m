Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9360F3D4A28
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jul 2021 23:44:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07DD31767;
	Sat, 24 Jul 2021 23:43:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07DD31767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627163073;
	bh=euQRcixncpsqXPHyWycUEL0ynRD+rvj4VCtigEj3oQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pmqmufXAEsl1TCbrCcYRoDDrRjTQhXGdcuWbq3ZPBzJAio7aXdmOq+ZdUPjdsJ0Fy
	 RyJ696l38gCYIjWOQ4fTaK/6TlryEcoQNUIOU3W3hhwWzpePl69I4yXu0yNwiTTB4n
	 P+mx/kpE6VHzBVVYVcQc96C8fwVebThJOGiQMID8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B617F80086;
	Sat, 24 Jul 2021 23:43:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38BB8F80227; Sat, 24 Jul 2021 23:43:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67ABCF800DA
 for <alsa-devel@alsa-project.org>; Sat, 24 Jul 2021 23:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67ABCF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QgD3Wnqb"
Received: by mail-qv1-xf36.google.com with SMTP id db14so2427978qvb.10
 for <alsa-devel@alsa-project.org>; Sat, 24 Jul 2021 14:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Xubroawzwj5b5qwwsClOnfd6twbJAitiIsQAo4rrsQ=;
 b=QgD3WnqbVmU3Mr8Ylc/G0vDxkmiy2A94zG94MoBLgx1F3HocbImPbitOKNnBo9QOFk
 lAdZuS+nhp2nz0QwaLPAC6O5FGkAP2mC1oBR85sKVoDyrxx9M8yQl2DMDHVjzrlOIEmo
 0KLqsEy9AeYcw1VNv+DERNjp29mybxP+8ZNT/7QLhVZJmEgq0ZdL5Nct0B+hpAfMYDVN
 wqxgut7Qb+gConRtsGDEmlSVkcwAyZE1V1CNphwxdEnpmPwDlAFOewE7c8Fbbr53BG5b
 OUaQ2TY2tA26Qg/uWofLMpw5ILblzF3hgskxi8HTbfIJqckk+05/VaJNAYSnV8fzvjSt
 9GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Xubroawzwj5b5qwwsClOnfd6twbJAitiIsQAo4rrsQ=;
 b=EptbOYS8HgeYdQHuEQ/cDCLUDS2zvLwiPrLaiFTB1VVUsegWe2J5ercnrKK9ngQRS6
 PlZ7Ad5R0N8Fhrqpvx20+H0a4KyJHYXxmWBtcrm4QjBbuAvD0KoWkEw80/kQhBRP9r+z
 qHoDu4dm30WGcsmwK1QrMM7nsoEB4SLOLMgiQPi/dgM1n/zpP6bVgCHbORST331z3mPj
 iiAFzSncjQ+Yerv5rOhoXIlBE8OsKXOZl3c2uALcFvO/yILEp3Sg9WgzuuNj+xr7kDTh
 gOPoCB0/Bhs4UycFg4/Sd2xX+fm1L2yVEj2XzTdlxMJJj5pU+gUEU8gPCLdOjjzU/mj9
 4FeA==
X-Gm-Message-State: AOAM53022qgNgPeW1ElMuYoIwYgCZ7gKhLBjk+w4f8NsftV2+X7ElsxY
 3pyBU49YUwXNeaj+ZaL+FsTxBB06hK1BDSFO19c=
X-Google-Smtp-Source: ABdhPJzMkwWaAEWUP64MJj/kC4FFv+hFSt1ASdvUpOEersKGdA9TvyW5c+cG79/4TUOzRaguIJnexg77HP4TO27zto0=
X-Received: by 2002:ad4:5ccc:: with SMTP id iu12mr11189760qvb.21.1627162977350; 
 Sat, 24 Jul 2021 14:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
 <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
 <CAEsQvcu3jXa4fXJAu7nvT+G+-S2bZ1BPkcuwnT4VjbrnW1Pkog@mail.gmail.com>
In-Reply-To: <CAEsQvcu3jXa4fXJAu7nvT+G+-S2bZ1BPkcuwnT4VjbrnW1Pkog@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 24 Jul 2021 18:42:49 +0000
Message-ID: <CAEsQvcuHyaWQQKYqydgv-XhFo7byaARYFGrPmpCu8XSRgTPDTg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com, damien@zamaudio.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, chihhao.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

I tried to convey in code what I had in mind.

It's a rough sketch and very much untested.

--- clock.5.14-rc2.c    2021-07-24 18:30:09.773718208 -0000
+++ clock-one-to-one.c  2021-07-24 18:35:52.276412366 -0000
@@ -54,6 +54,61 @@ static void *find_uac_clock_desc(struct
        return NULL;
 }

+/* Behringer UFX1604 / UFX1204 have a simple one-to-one
+ * topology where there is only one Clock Selector, only
+ * one Clock Source linked to USB SOF and no Clock Multipliers.
+ *
+ * This function checks for the presence of such a
+ * one-to-one clock selector / clock source topology
+ * so that it's possible to safely set the one and only
+ * Clock Selector to the one and only Clock Source
+ * upon sample rate change without breaking devices
+ * with more complicated topologies.
+ */
+
+static bool one_to_one_clock_topology(struct usb_host_interface
*iface, int proto)
+{
+        int clock_sources, clock_selectors, clock_multipliers = 0;
+       int source_version, selector_version, multiplier_version;
+       int found_count;
+
+       void *cs = NULL;
+
+       if (proto == UAC_VERSION_3) {
+               source_version = UAC3_CLOCK_SOURCE;
+               selector_version = UAC3_CLOCK_SELECTOR;
+               multiplier_version = UAC3_CLOCK_MULTIPLIER;
+       }
+
+       else {
+               source_version = UAC2_CLOCK_SOURCE;
+               selector_version = UAC2_CLOCK_SELECTOR;
+               multiplier_version = UAC2_CLOCK_MULTIPLIER;
+       }
+
+        if ((found_count = snd_usb_count_csint_desc(iface->extra,
iface->extralen,
+                                             cs, source_version)) > 0) {
+               clock_sources = found_count;
+        }
+
+        if ((found_count = snd_usb_count_csint_desc(iface->extra,
iface->extralen,
+                                             cs, selector_version)) > 0) {
+               clock_selectors = found_count;
+        }
+
+        if ((found_count = snd_usb_count_csint_desc(iface->extra,
iface->extralen,
+                                             cs, multiplier_version)) > 0) {
+               clock_multipliers = found_count;
+        }
+
+       if ((clock_sources == 1) && (clock_selectors == 1) &&
(clock_multipliers == 0)) {
+               return true;
+       }
+
+       return false;
+}
+
+
 static bool validate_clock_source(void *p, int id, int proto)
 {
        union uac23_clock_source_desc *cs = p;
@@ -323,7 +378,7 @@ static int __uac_clock_find_source(struc
                ret = __uac_clock_find_source(chip, fmt,
                                              sources[ret - 1],
                                              visited, validate);
-               if (ret > 0) {
+               if (ret > 0 &&
one_to_one_clock_topology(chip->ctrl_intf, proto)) {
                        err = uac_clock_selector_set_val(chip, entity_id, cur);
                        if (err < 0)
                                return err;



--- helper.5.14-rc2.c   2021-07-24 18:30:25.042526253 -0000
+++ helper-one-to-one.c 2021-07-24 18:35:45.019503597 -0000
@@ -64,6 +64,29 @@ void *snd_usb_find_csint_desc(void *buff
 }

 /*
+ * find every class-specified interface descriptor with the given subtype
+ * and return how many did it find
+ */
+int snd_usb_count_csint_desc(void *buffer, int buflen, void *after,
u8 dsubtype)
+{
+       int count = 0;
+        unsigned char *p = after;
+
+        while ((p = snd_usb_find_desc(buffer, buflen, p,
+                                      USB_DT_CS_INTERFACE)) != NULL) {
+                if (p[0] >= 3 && p[2] == dsubtype)
+                        count++;
+        }
+
+       if (count > 0) {
+               return count;
+       }
+
+        return 0;
+}
+
+
+/*
  * Wrapper for usb_control_msg().
  * Allocates a temp buffer to prevent dmaing from/to the stack.
  */



--- helper.5.14-rc2.h   2021-07-24 18:30:35.219398312 -0000
+++ helper-one-to-one.h 2021-07-24 18:29:34.139166195 -0000
@@ -7,6 +7,8 @@ unsigned int snd_usb_combine_bytes(unsig
 void *snd_usb_find_desc(void *descstart, int desclen, void *after, u8 dtype);
 void *snd_usb_find_csint_desc(void *descstart, int desclen, void
*after, u8 dsubtype);

+int snd_usb_count_csint_desc(void *descstart, int desclen, void
*after, u8 dsubtype);
+
 int snd_usb_ctl_msg(struct usb_device *dev, unsigned int pipe,
                    __u8 request, __u8 requesttype, __u16 value, __u16 index,
                    void *data, __u16 size);

On Sat, Jul 24, 2021 at 3:20 PM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> > Dr. Iwai, perhaps we could restrict the generalized fix for the
> > Behringer UFX1604 / UFX1204 with some simple logic to devices that
> > only have *one* clock source.
>
> Okay, rereading the original commit log from Cihhao Chen I gather
> Samsung USBC Headset (AKG) with VID/PID (0x04e8/0xa051) actually has
> two clock selectors and only one clock source.
>
> Correct me if I'm wrong.
>
> This is complicated by the fact I haven't been able to find a lsusb -v
> of Samsung USBC Headset (AKG) with VID/PID (0x04e8/0xa051)
>
> Even so, my proposition still stands: devices with only one clock
> source and only one clock selector should be able to handle us
> selecting the clock selector to the only clock source.
