Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAE23D7F95
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 22:58:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F2971F13;
	Tue, 27 Jul 2021 22:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F2971F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627419500;
	bh=Y10SO/p3h9zEb5EMars7ZwsKuoXWKSxavFgT7WnbPPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NnwTMlqHiB/uc7WUd1wTBAZEVFPM6Wlm/7kg2gxRF1EaHCiYnN0U+HRrXA1QSBbMM
	 pPddCte/99ICTX4ACrSCGqAFFpZ0GL/6iPhJOHE+ydg6sTRIaKvxyIcnKrsonJIXi2
	 naTxfjA6aBfpTRo0wr6F+/hoELM0YZXSt1XL/y+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2777F80276;
	Tue, 27 Jul 2021 22:56:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78AB8F8026C; Tue, 27 Jul 2021 22:56:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55BAAF80159
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 22:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55BAAF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SUbPn6lw"
Received: by mail-qk1-x72b.google.com with SMTP id b20so137259qkj.3
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5//oOHuSPsYAOusVOhmt6ZgP2slz+I2zua77g1mYYaA=;
 b=SUbPn6lwVRpg1qvmx2Gz6SGev667SkmIlLC/m7IhRKiH13GNsAYsP6ceNmlSECoogo
 nkUxieCmaA6gHCBrORehT7/zuQDVdvcxyM5CAUWDRDRn/2PE6uir8Ri9Z89RCmfsVWCT
 aPxawqBaLqgfs43o4nVcV+RI8II0loe3NcE7JeSmTdyQA6FzkgytjyOr5Df3/Jd7IpTy
 CrMBrXo8up0luhc2QJH74bL1KMWojl9pnq/3IPjCiMZvAh2eC4QwAi+8Roa1GgrPoAVG
 kvfaqUEutJ87vTsLV5o9SrsihgvRXZkTRPQisvdm6liznJ5jrMuL22lO2hIEYgHbOzVA
 CLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5//oOHuSPsYAOusVOhmt6ZgP2slz+I2zua77g1mYYaA=;
 b=VnDG2bASNOmFe+u/4QS3G6hD9cQk6Qy2K5+TrvO+M5udoCTXV3RRKeA1o+r10oA1EC
 r2o4rVh8pFN023VosNV17WOtHcZACC4yDGdDpdYXgEdNhLWwhlkC1AVvqySI54qDkTPq
 dBGvBEN6ozmWILXIOq0mRx5mW4giW0HR0/YqOTlY/C9IcjvDovIuDakNeX5BgJWGjOAv
 p1IofHO6ouglrlCju6dYUReKJ3damVRy7ohhvKxZ0DW8dzuwkvOBebAq+X3yJZz8QK9e
 zhYFJ1Hrq6qNm0NpKIUx2Nrr9EWQzIOl+LcOOUoZaxV/nAkDHfmxFDmJbEYYLI/PtTNM
 R4fQ==
X-Gm-Message-State: AOAM531WnllgNkhd2ZFgL+ncxsMIXlxy+WxpT0msQUO8CMIFoWHSGwoB
 kT/X0SQ75R3gwwiBSOMsakqpvbiSmOdQNaH6kNA=
X-Google-Smtp-Source: ABdhPJz7USORpL2+8VeyVekCt4fwAiubyQ7qL3dJ1KSS2Qo5gpjZOC1Sc8LR8htHJIar5jyg7NMKFHtV5DGPf2kytGM=
X-Received: by 2002:a37:e44:: with SMTP id 65mr23697309qko.193.1627419401647; 
 Tue, 27 Jul 2021 13:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
 <20210727102744.30364-1-chihhao.chen@mediatek.com>
In-Reply-To: <20210727102744.30364-1-chihhao.chen@mediatek.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Tue, 27 Jul 2021 17:56:33 +0000
Message-ID: <CAEsQvcuOQ_Tg0bRbsegECdBUsGxa61ei9-Z2bRbGvQ9FmEUPbA@mail.gmail.com>
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

On Tue, Jul 27, 2021 at 10:28 AM <chihhao.chen@mediatek.com> wrote:
>
> From: chihhao chen <chihhao.chen@mediatek.com>
>
> Hello
>
> <6>[  150.347456][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
> <6>[  150.347517][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.384289][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
> <6>[  150.390920][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.438156][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
> <6>[  150.438226][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.473547][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
> <6>[  150.480165][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.513375][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.513439][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.546161][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.552678][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.584347][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.584418][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.617760][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.624253][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.657906][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.657982][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.689571][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.696109][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
>
> Chihhao
>

Thank you. Chihhao Chen!

I see both EPs have their Clock Selectors (ID 0xC for EP 81 and ID 0xB
for EP 1) selected to pin 2, i.e. Clock Source ID 0xA.

I'm assuming this log is for the vanilla kernel without Chihhao's fix.
Please correct me if I'm wrong, Chihhao.

From the original commit message for the fix, we know the correct
setting for Clock Selector 0xB should be pin 1, with Clock Source ID
0x9.


Takashi Iwai already shared his perspective that this is a firmware
bug on the device.

I have a hunch that the firmware bug is setting both Clock Selectors
at the same time regardless of which one we want to select
specifically.


Chihhao, please try the below patch and perform another echo test.

Let us know if the echo test works or if it still fails and please
remember to share with us the relevant dmesg logs.


Thank you,
Geraldo Nascimento


--- clock.c.orig        2021-07-17 12:15:06.416028360 -0000
+++ clock.c     2021-07-27 17:36:16.954774954 -0000
@@ -324,9 +324,45 @@ static int __uac_clock_find_source(struc
                                              sources[ret - 1],
                                              visited, validate);
                if (ret > 0) {
-                       err = uac_clock_selector_set_val(chip, entity_id, cur);
-                       if (err < 0)
-                               return err;
+                       if (chip->usb_id == USB_ID(0x04e8, 0xa051)) {
+                               if (entity_id == 0xc) {
+                                       err =
uac_clock_selector_set_val(chip, entity_id, 2);
+                                       if (err < 0)
+                                               return err;
+
+                                       err =
uac_clock_selector_get_val(chip, 0xc);
+                                       if (err > 0) {
+                                               printk(KERN_ERR
"__uac_clock_find_source: Clock Selector 0xc has pin %d selected",
err);
+                                       }
+
+                                       err =
uac_clock_selector_get_val(chip, 0xb);
+                                       if (err > 0) {
+                                               printk(KERN_ERR
"__uac_clock_find_source: Clock Selector 0xb has pin %d selected",
err);
+                                       }
+                               }
+
+                               else if (entity_id == 0xb) {
+                                       err =
uac_clock_selector_set_val(chip, entity_id, 1);
+                                       if (err < 0)
+                                               return err;
+
+                                       err =
uac_clock_selector_get_val(chip, 0xc);
+                                       if (err > 0) {
+                                               printk(KERN_ERR
"__uac_clock_find_source: Clock Selector 0xc has pin %d selected",
err);
+                                       }
+
+                                       err =
uac_clock_selector_get_val(chip, 0xb);
+                                       if (err > 0) {
+                                               printk(KERN_ERR
"__uac_clock_find_source: Clock Selector 0xb has pin %d selected",
err);
+                                       }
+                               }
+                       }
+
+                       else {
+                               err = uac_clock_selector_set_val(chip,
entity_id, cur);
+                               if (err < 0)
+                                       return err;
+                       }
                }

                if (!validate || ret > 0 || !chip->autoclock)
