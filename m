Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A14201B58F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 14:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0DE816CB;
	Mon, 13 May 2019 14:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0DE816CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557749542;
	bh=ABjrLo8Hh/CUuuHfEHA+KBPCJ6O4GhbAoUUbUaL+nRk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AweL4PRsfQClFT7NrsxRiRnSW/1H4o0WcX4K6Hg+iyquEJFRgYZaOYv3XmeBPpPLw
	 0QSwwe9c6YLEslwYMlJs4Q5R7FSSFS7vHQmzc1P04ad+rG2eRD8VzYzVa6jwF49CmJ
	 /rP3gouasz00awDKlXxYFJIIPOo6dNC4hipLlGB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1142F896B8;
	Mon, 13 May 2019 14:10:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B59F2F896F0; Fri, 10 May 2019 08:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D675F89673
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 08:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D675F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iWcSezDu"
Received: by mail-lj1-x236.google.com with SMTP id w1so1562264ljw.0
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 23:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=bOm9ipOAQKoT3yt7w2teP2ZJHPTV1AYorfftzT9YQw4=;
 b=iWcSezDuLaLGHTAyO04h7GQRYS54U+vmjti81GyZ1kaKo+t8XkIsiYEW8mtTYJABN+
 CjPwGeZ4CnC/g+npQyxisXNKV86PEbKhINHgJvjZCxyitPe2ct5/TAR3/aawpt6EfOmH
 tXo7AwAJWckQbSHF8IF7/emeH9UyyKzfNDluvpA4rw3cY1e1V8J4nJb8vU2QdtAogD+q
 tKGJmSNsXle/cKtcR+a8Ygvb/+0ZFxK70Lhih7kmWYaJx+kwoOi50OjLBCF1rRsjQZeB
 xtbX6CS9+PZEOfLTxX+CGfakmP7/MUHvpm6ImOD143Pv0PkOWND0NKB2ZyBgE8ZRKhS/
 xQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=bOm9ipOAQKoT3yt7w2teP2ZJHPTV1AYorfftzT9YQw4=;
 b=FX5PDlhuhOYo6+gmwpkMKqsivp76DuUUMNQ1A6sGE9fXncrVY+GNr+mZMLajhxtOhR
 99aqfhDxt7KoCCyCwJaGdb6QU8CHmHDyeSPyNZ1YAx2xT9MmJV/iXHH59FDNG4lKHmlC
 O6fL5ARMu+YmpSNTtN4Tb4gc8Y7TfMF2Jy09Sg3Y2Dmf4saBteXFyk8SuqYm8lI33UuO
 bDVciZAjwQpJdDu7tkOo7dtu5viIEkZunwKBkevLzaD0VFXgyVWAy+99eEX7Pg0aEoOh
 uEBhj7oV401+VnxsMdfEP3iHf+k68z2p8NOpdV2PkxHoELDu5nAWFuj7DRSFnxRib6vZ
 dr9g==
X-Gm-Message-State: APjAAAXOWmvC23MUlvlLH6XuEdN60E4vlmldGPOyQTDOC+MSLHbznsrZ
 suVB/mrPnhIurfmRV78edBL/sVlz
X-Google-Smtp-Source: APXvYqzh6QFNxk66qOxWeqI3QGSdHW3/EmHXy41kuaWS7cX2Rflcs4z8ua1wG6MoIMGt9JGs5FGtWA==
X-Received: by 2002:a2e:9713:: with SMTP id r19mr4924985lji.189.1557470993409; 
 Thu, 09 May 2019 23:49:53 -0700 (PDT)
Received: from [192.168.0.94] (31-178-116-31.dynamic.chello.pl.
 [31.178.116.31])
 by smtp.googlemail.com with ESMTPSA id f20sm1044630ljj.96.2019.05.09.23.49.52
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 23:49:52 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Micha=c5=82_Wadowski?= <wadosm@gmail.com>
Message-ID: <639c0531-3482-75ab-5642-ccfb64064914@gmail.com>
Date: Fri, 10 May 2019 08:49:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2D75DFC9EC19475EF43F38AA"
Content-Language: en-US
X-Mailman-Approved-At: Mon, 13 May 2019 14:10:19 +0200
Subject: [alsa-devel] Fix for Lenovo B50-70 inverted internal microphone bug
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

This is a multi-part message in MIME format.
--------------2D75DFC9EC19475EF43F38AA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi.
I prepared patch for this bug:
https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/1524215

I tested this patch on Linux 5.1.0 and it fixes problem on my Lenovo 
B50-70 laptop.

--------------2D75DFC9EC19475EF43F38AA
Content-Type: text/x-patch;
 name="fix_for_lenovo_b50-70_inverted_internal_microphone_bug.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="fix_for_lenovo_b50-70_inverted_internal_microphone_bug.patch"

commit 450484025b7051c8c078e95e906d7133967b9c36
Author: Michał Wadowski <wadosm@gmail.com>
Date:   Thu May 9 16:02:23 2019 +0200

    Fix for Lenovo B50-70 inverted internal microphone bug.
    Ref: https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/1524215

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 42cd394..36c18a5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5676,6 +5676,7 @@ enum {
 	ALC233_FIXUP_EAPD_COEF_AND_MIC_NO_PRESENCE,
 	ALC233_FIXUP_LENOVO_MULTI_CODECS,
 	ALC233_FIXUP_ACER_HEADSET_MIC,
+	ALC233_FIXUP_INV_DMIC,
 	ALC294_FIXUP_LENOVO_MIC_LOCATION,
 	ALC225_FIXUP_DELL_WYSE_MIC_NO_PRESENCE,
 	ALC700_FIXUP_INTEL_REFERENCE,
@@ -6384,6 +6385,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc233_fixup_lenovo_line2_mic_hotkey,
 	},
+	[ALC233_FIXUP_INV_DMIC] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_inv_dmic,
+	},
 	[ALC255_FIXUP_DELL_SPK_NOISE] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_disable_aamix,
@@ -6975,6 +6980,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x313c, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC233_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "IdeaPad Y410P", ALC269_FIXUP_NO_SHUTUP),
 	SND_PCI_QUIRK(0x17aa, 0x5013, "Thinkpad", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x17aa, 0x501a, "Thinkpad", ALC283_FIXUP_INT_MIC),
@@ -7157,6 +7163,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC256_FIXUP_ASUS_AIO_GPIO2, .name = "alc256-asus-aio"},
 	{.id = ALC233_FIXUP_ASUS_MIC_NO_PRESENCE, .name = "alc233-asus"},
 	{.id = ALC233_FIXUP_EAPD_COEF_AND_MIC_NO_PRESENCE, .name = "alc233-eapd"},
+	{.id = ALC233_FIXUP_INV_DMIC, .name = "acl233-inv-dmic"},
 	{.id = ALC294_FIXUP_LENOVO_MIC_LOCATION, .name = "alc294-lenovo-mic"},
 	{.id = ALC225_FIXUP_DELL_WYSE_MIC_NO_PRESENCE, .name = "alc225-wyse"},
 	{.id = ALC274_FIXUP_DELL_AIO_LINEOUT_VERB, .name = "alc274-dell-aio"},

--------------2D75DFC9EC19475EF43F38AA
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------2D75DFC9EC19475EF43F38AA--
