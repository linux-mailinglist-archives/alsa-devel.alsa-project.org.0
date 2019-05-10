Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E82761A526
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2019 00:17:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 572DC18B4;
	Sat, 11 May 2019 00:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 572DC18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557526621;
	bh=VevWSwqtyk6edF3xCTriW63fizwxGLPdmPwXrUEavUo=;
	h=From:To:References:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ERkZ1ijVvPVWldslUyTcxWZKS7d79hEfMu1nawfSdj/beiH156yizuM95BMpHq3F6
	 8lvVS1+QaBMhotJgGuPxpfNMVzg155MKxASWYDxZSxR8kM7IucIbJu2hxztknAcIIo
	 RPW1/umOYu1ZNgj8DeS5g57aePxrSuBUEpalpKHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9819AF89705;
	Sat, 11 May 2019 00:15:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D96DF896FD; Sat, 11 May 2019 00:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2564F80730
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 00:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2564F80730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o5GahpGp"
Received: by mail-lj1-x233.google.com with SMTP id r76so6306054lja.12
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 15:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=2g7SEOFiX64GTKL7pgsPHM9406dXXpPdGGxfMjFEBkQ=;
 b=o5GahpGpnEy/qafjr5SWmOD603d6516Fos1QVrghb16Twdbg6z770wOrmy2uCH6xgK
 d6T2uTHrFmAN21kxY1rdUbSSkwTnAIOAFusDe+Sf0jZvRnSI3W2sy2OFZrAZwpubSx6d
 GIIdCcXw8c/2+hhTAQ9nflkhaD/X/pzBb9cot7Kom/KwM7LHYgc7u54VIOwf92mbTgFH
 byrnz+ITod+z4ek9QOAIM76kkjj3bJVDSKmn23Ee/9TKeZpYxl4kgPhOgQQYvRRDNKA+
 a7em2U4qXyT17VNVB3iD/nZ+sxR3LTGF8DnegF0NiOv1Td8AvwOmXS2r8MiL3VtecW2+
 0Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=2g7SEOFiX64GTKL7pgsPHM9406dXXpPdGGxfMjFEBkQ=;
 b=t71DdR5cACeAykOL/P1RyN18bHn8BOKvlfxAais00b70BzOdb0ux8eIcRyEUS/k9SE
 xM64pkSknKbeWDuX1MdCdGdYpIFspPA5DGCVysFFwG/gV6e76uIlf6rOAlMZGoKvDjLt
 nqIzzupvZ0lSym1lNTp7wZThLBBOEn9RwalcAYDjDKd9wqp30HM7PWWVsZYyWnWDhi+v
 HXdLet1js2rQg37Z26W/MKubijCqalurn+BYuM1UgbQ1sx0kSfry2K//nKjs4HOgjdt5
 EipbZrt7DuuL7t5kjy74I6AEHJKrmWOb4NJl+bDVIVArjdjDZiVgz+143OFJ7jPXVxMS
 /AXQ==
X-Gm-Message-State: APjAAAU5AnMU6zidbQP8fkfwlnql7EnJECbJqXb6pQZqfCmPvf+TL8ZW
 F2ntPJQQGpGRz2ZPEb7YFHMB2W/T
X-Google-Smtp-Source: APXvYqxGnECbALgbRCj725+SO3teqK870my9ov7XNPXj7Tm19cpQMWXYw646qxk980kSiafvbe+YRg==
X-Received: by 2002:a2e:6a01:: with SMTP id f1mr4780470ljc.21.1557526510105;
 Fri, 10 May 2019 15:15:10 -0700 (PDT)
Received: from [192.168.0.94] (31-178-116-31.dynamic.chello.pl.
 [31.178.116.31])
 by smtp.googlemail.com with ESMTPSA id r26sm1744667lfa.62.2019.05.10.15.15.08
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 15:15:08 -0700 (PDT)
From: =?UTF-8?Q?Micha=c5=82_Wadowski?= <wadosm@gmail.com>
To: alsa-devel@alsa-project.org
References: <abb4a724-b561-9579-e821-b56ff00051c5@gmail.com>
Message-ID: <cc266f08-cbe8-28e1-c264-6c358274d671@gmail.com>
Date: Sat, 11 May 2019 00:15:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <abb4a724-b561-9579-e821-b56ff00051c5@gmail.com>
Content-Type: multipart/mixed; boundary="------------6529BCBF533E9918A1266686"
Content-Language: en-US
Subject: Re: [alsa-devel] Fix for Lenovo B50-70 inverted internal microphone
	bug
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
--------------6529BCBF533E9918A1266686
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 10.05.2019 o 23:52, Michał Wadowski pisze:
> I prepared patch for this bug:
> https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/1524215
> 
> I tested this patch on Linux 5.1.0 and it fixes problem on my Lenovo 
> B50-70 laptop.

Sorry, I forgot attach the patch

--------------6529BCBF533E9918A1266686
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

--------------6529BCBF533E9918A1266686
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------6529BCBF533E9918A1266686--
