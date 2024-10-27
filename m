Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FEB9B36F5
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2024 17:44:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F7A4EA3;
	Mon, 28 Oct 2024 17:44:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F7A4EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730133892;
	bh=FfNk8I+mjQn3bM3n+9hlR4/TJBS6DhNfRocxYzTffS0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b17sStz+Aj5UoGCzYTF+GMQCiheeSFNu4CX6+ZFjOJSQuQiwi+3XDMjhMf03kJENh
	 jMWztEjtRCLH5XTZDmesb1NFrNxGPx4MAsPjN95jtNs/j+s9MsxW2f9jcRKZgFAO0V
	 UJcYjBTkkpulkE1Q5x6yO14zHglOZMo/hNO7Y+No=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94016F806B3; Mon, 28 Oct 2024 17:43:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76B2BF806B5;
	Mon, 28 Oct 2024 17:43:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1623F80269; Sun, 27 Oct 2024 23:17:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B42E5F80104
	for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2024 23:17:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B42E5F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DeIWEYvv
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2e2a97c2681so2622738a91.2
        for <alsa-devel@alsa-project.org>;
 Sun, 27 Oct 2024 15:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730067422; x=1730672222;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlVBKyzyVEcrMiwiyfAZvoqJg2MA2IkLbNP36j/gEss=;
        b=DeIWEYvvJamrc0NEFax3oUef1SlWBAesbgiCKf0WlrzNXEIBtyWTFcm0L9XjnpWooc
         NZRdNOUuJzIyHotqYviP01x2k1ujgCme7xxp+pQhFRmREEOyYVYO2qBnV3rKmt0AdRNd
         BsEVTPoqfQc9Kr848F7ZdFisWHUyTDVl/E6TmOsxLjX5y1iXaL3ZxbL6WX/Spp2pMCjB
         dG37DDwBZqcUqmVMLIkGybhzx9IgXihdLmBRqhiu3eOCsr8IThk3bj48jCL0tukTEJhd
         iAF/r+gcI2pc0ptDO4CExbZxoBbsAt05vHjgbnLHqrtbZGBALbtnKMFW4F7dYCDfxjAC
         qLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730067422; x=1730672222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlVBKyzyVEcrMiwiyfAZvoqJg2MA2IkLbNP36j/gEss=;
        b=HugmRn9i6SUzl2lNIkTQ2qHeJbUgwAx/mhHx8r4L4TOABy37OaHFUWmDSMT47p6zNX
         Cyc2l5r4yvZbF0Db1koeLGbp9nDLDVDjcOu0OwCXf+dkF6ekfxNLZGhh/pSiL0gvi1/A
         atcc7ybhaARNh+z8HSHs6fwGp8cvQLNkYWvFa7oJ2gjcBu1CRpyINwh3zUHy6PQPy7k/
         MU+fbJ3LNlrVb0mnWbs8CXPzNjuHfOXgqDZUxL+w8yjI6aIVxhDH/FJFQHGGwsg9dBwR
         BY1T/6dNqDmO4Qfnq/rKS33j4xEsuzL4zmYO9V6c1ohzACAuHEnhO0WH4x0MnL718Bia
         Ogow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwrRLGjce4xEZllN3Ytb8las1e1GgJxkq666tu1QV9cXtSwgPgSZUMvRNczbGG2anM+V8diVDwkSv6@alsa-project.org
X-Gm-Message-State: AOJu0YxWO2cZSFOL+le6jY5448eDq4kk464HGhrOLJNA4NCYK4MdBECu
	yzWi7rq7IpeTsPORJew6Nji/Da9v2lYyFlk0HcgOrcFcy0wn7dTQ
X-Google-Smtp-Source: 
 AGHT+IEB70GCebAhFLvFL16d0ZUPWVH08atumYvquHryLNwf9YYWZfC5o6C2i612B/sijw2eCz9B3Q==
X-Received: by 2002:a17:90a:4e0a:b0:2e8:f58e:27bb with SMTP id
 98e67ed59e1d1-2e8f58e283fmr6404631a91.8.1730067422109;
        Sun, 27 Oct 2024 15:17:02 -0700 (PDT)
Received: from
 codespaces-c8bc9f.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net
 ([20.192.21.48])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7edc8696918sm4590721a12.48.2024.10.27.15.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:17:01 -0700 (PDT)
From: Piyush Raj Chouhan <piyushchouhan1598@gmail.com>
X-Google-Original-From: Piyush Raj Chouhan <piyuschouhan1598@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	pc1598 <piyushchouhan1598@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add subwoofer quirk for Infinix ZERO BOOK
 13
Date: Sun, 27 Oct 2024 22:16:55 +0000
Message-ID: <20241027221655.74885-1-piyuschouhan1598@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piyushchouhan1598@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: C3KBCR5YVJNGYSR4BLAH5E74623DG6CA
X-Message-ID-Hash: C3KBCR5YVJNGYSR4BLAH5E74623DG6CA
X-Mailman-Approved-At: Mon, 28 Oct 2024 16:42:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3KBCR5YVJNGYSR4BLAH5E74623DG6CA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: pc1598 <piyushchouhan1598@gmail.com>

Infinix ZERO BOOK 13 has a 2+2 speaker system which isn't probed correctly.
This patch adds a quirk with the proper pin connections.
Also The mic in this laptop suffers too high gain resulting in mostly fan noise being recorded,
This patch Also limit mic boost.

HW Probe for device; https://linux-hardware.org/?probe=a2e892c47b

Test: All 4 speaker works, Mic has low noise.
Signed-off-by: Piyush Raj Chouhan <piyushchouhan1598@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3567b14b52b7..075935707f8a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7551,6 +7551,7 @@ enum {
 	ALC290_FIXUP_SUBWOOFER_HSJACK,
 	ALC269_FIXUP_THINKPAD_ACPI,
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
+	ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13,
 	ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO,
 	ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
 	ALC255_FIXUP_ASUS_MIC_NO_PRESENCE,
@@ -7996,6 +7997,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc269_fixup_pincfg_U7x7_headset_mic,
 	},
+	[ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90170151 }, /* use as internal speaker (LFE) */
+			{ 0x1b, 0x90170152 }, /* use as internal speaker (back) */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
+	},
 	[ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -10989,6 +11000,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
-- 
2.46.2

