Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1E3EC7FC
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Aug 2021 09:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72AD3172F;
	Sun, 15 Aug 2021 09:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72AD3172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629012886;
	bh=fKuJXTDXchW81ilDvOy/aJGiEjnWMBHKGkmxHRVYRfQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nAxy0JKkVRIgp4VqQ0ZYLWtDrECtjinGnSIfSW8gGUU3F81pt+0UOkezPNigYRvq0
	 0CppcnJnXXUy7UwLopqrVJ/DEw9t3nIsjG0J0QNvfnWcZBlKNaIRqu2KfaDW7debnt
	 gzGTlTNWHIiSdJoHOtQo29rQS7rpRAYlmDt127Jo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84233F80508;
	Sun, 15 Aug 2021 09:30:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F041DF80127; Sun, 15 Aug 2021 00:46:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51367F80127
 for <alsa-devel@alsa-project.org>; Sun, 15 Aug 2021 00:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51367F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=tombom-co-uk.20150623.gappssmtp.com
 header.i=@tombom-co-uk.20150623.gappssmtp.com header.b="ZiGmsYvH"
Received: by mail-pl1-x636.google.com with SMTP id w6so9432102plg.9
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 15:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tombom-co-uk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=/p/AlWyP8M9N5zLquf5wX/0RU+ZA4WWIHT28Ac+xSz8=;
 b=ZiGmsYvHMtYHgt0yZsNLW7miB2BWa5D5chQAgg2fFHeGBbnGB+RZ+sZA1hibY/NBMV
 VzrNdvgn013aTVdcLIau0QO0ttXEUCakD6oOS62my9Y6e8YwnBPCS7t2xPwDGiLhmY9V
 AP80w1VybUj8DFMKfWDbFF7SBcQeOzfG0pp4vLaLNuhSLRXu5N+c+ucDjTw0IsaJV3Ll
 9jTaMgs0Xasz+IwauGYwzP1mGWIVuGCL1tER9bCo7WR1af4iu6lDq4etqDxYoEJ6WRAO
 WlLVOvP+z3dvpl4wKfp1xrjpUfq0eDa7LeJZZvP3FK61jXUT/vBBzR14npKW7UQE/XUD
 Tl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=/p/AlWyP8M9N5zLquf5wX/0RU+ZA4WWIHT28Ac+xSz8=;
 b=eR6OHqsYWsMm0saLnZqCblQOWhvBwAl5WhvfGbYyeyPgdutb1pd1A7td1QnuankqIZ
 wfsBvdT5EZyghKTmOOuMMGsGi72hdZejFIRIqJb4SCys9+vhDwgsHWZyF3XnOCt0hiNg
 p2yQouOslJO/zM5v51BKjs/CMwygb+T5G+Yft2MICnxOMBAe5ooWSHYlIIpCc3f7kKUK
 YaBMjo3bx+wWxXS6iclGHtSAsHwf9ChYsI+gTfOwuJ4zUvww2XR95rIpAtNiaDho/z1N
 hzpYSW6ure+JM0Jlt9qET0iCe38xv73kn64V7BeF3sq3wbg+0UDYiwUo/o5YB0GZYx3h
 nn0Q==
X-Gm-Message-State: AOAM532V/3RGSSXlN7EzOYLxqOhgBGlg1aP47qkHOzaAEcC79XcIr7BW
 4Tz2+7Sicf0fELfRmx4vGOBmOw==
X-Google-Smtp-Source: ABdhPJyjXtG/QiK941IOluP82ln6hje+AKe/2/zb4wvPH42YlCrKyhfgQulJU+t03bYv1ujoKOkhqw==
X-Received: by 2002:a17:902:8348:b029:12b:b2a0:941b with SMTP id
 z8-20020a1709028348b029012bb2a0941bmr7326770pln.62.1628981166822; 
 Sat, 14 Aug 2021 15:46:06 -0700 (PDT)
Received: from [192.168.10.193] (c-69-181-163-252.hsd1.ca.comcast.net.
 [69.181.163.252])
 by smtp.googlemail.com with ESMTPSA id v10sm6561089pfu.100.2021.08.14.15.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Aug 2021 15:46:06 -0700 (PDT)
From: Kristin Paget <kristin@tombom.co.uk>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/realtek: Enable 4-speaker output for Dell XPS 15
 9510 laptop
Message-ID: <e1fc95c5-c10a-1f98-a5c2-dd6e336157e1@tombom.co.uk>
Date: Sat, 14 Aug 2021 15:46:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 15 Aug 2021 09:30:27 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

The 2021-model XPS 15 appears to use the same 4-speakers-on-ALC289 audio
setup as the Precision models, so requires the same quirk to enable woofer
output. Tested on my own 9510.

Signed-off-by: Kristin Paget <kristin@tombom.co.uk>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 218d1aa0fd14..8b72064f8321 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8319,6 +8319,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x1028, 0x0a2e, "Dell", ALC236_FIXUP_DELL_AIO_HEADSET_MIC),
        SND_PCI_QUIRK(0x1028, 0x0a30, "Dell", ALC236_FIXUP_DELL_AIO_HEADSET_MIC),
        SND_PCI_QUIRK(0x1028, 0x0a58, "Dell", ALC255_FIXUP_DELL_HEADSET_MIC),
+       SND_PCI_QUIRK(0x1028, 0x0a61, "Dell XPS 15 9510", ALC289_FIXUP_DUAL_SPK),
        SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
        SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
        SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
