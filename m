Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5F33D6A79
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 01:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E55F31B0A;
	Tue, 27 Jul 2021 01:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E55F31B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627343955;
	bh=Gn3RqZTx/eGY6X0euVWdmeh2aguTPteQFVb08w/gYpI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dUWBatpmB0p+P2h/4v09QFpvSkqNWTlHdEqCXKRN2kfuT9ncqWAFsohpu1bQPrQiz
	 PYFyHgt6dNqLq/LgdgWBZ5Te2cJTDRgOQIf5Du9F1z9naD0MykWmZifC91aBscf+1t
	 sP1d19KuuHCRIDGXDBF4m0ZD/PLneh5n1BXS8z2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CDD4F80132;
	Tue, 27 Jul 2021 01:57:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B94A9F8025A; Tue, 27 Jul 2021 01:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DB82F8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 01:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DB82F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OwnYV9rl"
Received: by mail-qk1-x732.google.com with SMTP id b20so10708195qkj.3
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 16:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+c223BNKCjVr89i78fnlRgBQMhpUOGJDxxcmZA/6yCE=;
 b=OwnYV9rlnUfJo2RkKot5+W+rdsLUN7+zWrFy/pz8wdfqaTIej2jOIu+LgE2i3AE2nf
 wJ1xojtvCrbUirSLD83/obiHk9C0NaQJeHN84Jvf8rNF9IdC2bfeMHCV4XWuHaSVYrzn
 Mf0g4AHDMwR19nzAkIKwpw/xksa2aupVpgwHzQVzd5/2A18a0DQzcSpL0ShCOPBLYxVB
 sGy/zrevQ2P/oSF7X0G3mwfdXv5hq+PmtMBMMe12omsVY03LP7HoWRAj/hD9/rRbfCXh
 foGUXykUrM0OvoCBuftU56SdJXlPp3be6Gs2ybNAIsDSFfIlanwbCXWzPUtECc8aQpMk
 7tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+c223BNKCjVr89i78fnlRgBQMhpUOGJDxxcmZA/6yCE=;
 b=O5hNuS0Ob298KpFew8zIukutgSKjEYJBqI91ziLf41bu+daTNC69ZVMLZuHNyMmkFu
 O+Bt2NL2RhurJR7whM35lxgEYzg8qYnZtUWrOoW6S4RIRQPoTg5aqwBbwBulghN5qcDq
 3coeDQoVjwmYwX4quX+0AXc4+UxCmHJ97lnnvQgnUnr6BjCswc2Rn2gksvIRJVLE3rQp
 rKXA9pMHYuwOL4OzqxnIbMYX29utaJULboui6b6suUVgpv62oik8Y7PvSP8zDhpNcVUV
 m5xJnmkeW8Ya4bTcpUxiQU5kLmz46GgHjCcXI+ROEHEDQUIQ6P4hzSDjYUfMJSeuJP1o
 GN/Q==
X-Gm-Message-State: AOAM533Kj3Iw+OdoiR+epPwKA/r+z4WLoTfgIE9JnizzrsLp/9Zgnskj
 Tp4R1xwjoHLhoUSss8TEiCEujZwEQVROhD2cMwU=
X-Google-Smtp-Source: ABdhPJy2JU1ynaciVOwS/iwo88bT89yMDXeJN4d1VYgvkEp69wZdpxn6I/9NlfOvGTmgOWQap/tbBlqfqfI1ksBQUCg=
X-Received: by 2002:a05:620a:893:: with SMTP id
 b19mr19600194qka.487.1627343855508; 
 Mon, 26 Jul 2021 16:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
 <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
 <s5hwnpehm7y.wl-tiwai@suse.de>
 <CAEsQvcumEDOKgUB6h2-im5QabhPfaSaU63RF8pegPt5ZCPx+Pw@mail.gmail.com>
 <2db5d44b88ace1c25af4a45b3469a425fe1d81a5.camel@mediatek.com>
In-Reply-To: <2db5d44b88ace1c25af4a45b3469a425fe1d81a5.camel@mediatek.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 26 Jul 2021 20:57:27 +0000
Message-ID: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: chihhao chen <chihhao.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 Takashi Iwai <tiwai@suse.de>, damien@zamaudio.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
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

On Mon, Jul 26, 2021 at 8:42 AM chihhao chen <chihhao.chen@mediatek.com> wrote:
>
> Hello,
>
> Attach USB descriptor of clock source and selectior for this earphone.
>
> AC Clock Source Descriptor:
> ------------------------------
>
> Value   Valuename
> 0x08    bLength
> 0x24    bDescriptorType
> 0x0A    bDescriptorSubtype
> 0x09    bClockID
> 0x03    bmAttributes
> 0x07    bmControls
> 0x00    bAssocTerminal
> 0x00    iClockSource
> Hex dump:
> 0x08 0x24 0x0A 0x09 0x03 0x07 0x00 0x00
>
> AC Clock Selector Descriptor:
> ------------------------------
>
> Value   Valuename
> 0x09    bLength
> 0x24    bDescriptorType
> 0x0B    bDescriptorSubtype
> 0x0B    bClockID
> 0x02    bNrInPins
> 0x09    baCSourceID(1)
> 0x0A    baCSourceID(2)
> 0x03    bmControls
> 0x00    iClockSelector
> Hex dump:
> 0x09 0x24 0x0B 0x0B 0x02 0x09 0x0A 0x03 0x00
>
> AC Clock Source Descriptor:
> ------------------------------
>
> Value   Valuename
> 0x08    bLength
> 0x24    bDescriptorType
> 0x0A    bDescriptorSubtype
> 0x0A    bClockID
> 0x03    bmAttributes
> 0x07    bmControls
> 0x00    bAssocTerminal
> 0x00    iClockSource
> Hex dump:
> 0x08 0x24 0x0A 0x0A 0x03 0x07 0x00 0x00
>
> AC Clock Selector Descriptor:
> ------------------------------
>
> Value   Valuename
> 0x09    bLength
> 0x24    bDescriptorType
> 0x0B    bDescriptorSubtype
> 0x0C    bClockID
> 0x02    bNrInPins
> 0x09    baCSourceID(1)
> 0x0A    baCSourceID(2)
> 0x03    bmControls
> 0x00    iClockSelector
> Hex dump:
> 0x09 0x24 0x0B 0x0C 0x02 0x09 0x0A 0x03 0x00
>
> Thanks
> Chihhao

Thank you, Chihhao.

So I was wrong about Samsung USBC Headset (AKG) with VID/PID
(0x04e8/0xa051) having a Clock Multiplier.

There are two Clock Sources, both linked to the USB SOF with fixed sample rate.

Plus two Clock Selectors which are host-programmable and can be set to
either of the two Clock Sources.


I'm still at a loss to explain what is going wrong here.

Would a printk() reveal the first explicit
uac_clock_selector_set_val() on the Clock Selector associated with
USB_IN sets Clock Source ID to pin 1 with Clock Source ID 0x9?

Or is it the other way around, i.e. it sets the Clock Source ID to pin
2 with Clock ID 0xA for the capture stream Clock Selector?


Chihhao Chen, could you please try the following patch for debugging
purposes and share what is printed in dmesg?

Please try one time with your fix applied and one time without, i.e.
with an otherwise unmodified vanilla kernel.

Thank you,
Geraldo Nascimento

--- clock.c.orig    2021-07-17 12:15:06.416028360 -0000
+++ clock.c    2021-07-26 20:45:58.713881962 -0000
@@ -300,6 +300,7 @@ static int __uac_clock_find_source(struc
         /* the entity ID we are looking for is a selector.
          * find out what it currently selects */
         ret = uac_clock_selector_get_val(chip, clock_id);
+        printk(KERN_ERR "FOR EP %x: Clock Selector %x has pin %d for
Clock Source ID %x selected\n", (unsigned int)fmt->endpoint, clock_id,
ret, sources[ret - 1]);
         if (ret < 0) {
             if (!chip->autoclock)
                 return ret;
@@ -324,6 +325,7 @@ static int __uac_clock_find_source(struc
                           sources[ret - 1],
                           visited, validate);
         if (ret > 0) {
+            printk(KERN_ERR "FOR EP %x: Found Source! Clock Selector
%x has pin %d for Clock Source ID %x about to be reselected\n",
(unsigned int)fmt->endpoint, entity_id, cur, sources[cur - 1]);
             err = uac_clock_selector_set_val(chip, entity_id, cur);
             if (err < 0)
                 return err;
@@ -344,6 +346,7 @@ static int __uac_clock_find_source(struc
             if (ret < 0)
                 continue;

+            printk(KERN_ERR "FOR EP %x: Found source by trial and
error! Clock Selector %x has pin %d for Clock Source ID %x about to be
selected\n", (unsigned int)fmt->endpoint, entity_id, i, sources[i -
1]);
             err = uac_clock_selector_set_val(chip, entity_id, i);
             if (err < 0)
                 continue;
