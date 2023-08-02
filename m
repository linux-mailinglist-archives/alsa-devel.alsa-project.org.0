Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F77B76FDAE
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:45:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5B1A84A;
	Fri,  4 Aug 2023 11:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5B1A84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142333;
	bh=PNLLC7Q+MUiEbadt+I1Gt/h5rQJTglX2TWRNJWuZbFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZpffsigIXM3zYBZGmv6xiI+MgOxEPQwg0FrU6+Ii8phCIOspzRxE5+NLYTLzBnN0I
	 ajLwCmctbh/O7phc52BvH7Z7pT5mdIp3tET3KTj2Y6FvqlgYpMGkZC9uPMNHGfl3Wb
	 pZywUZ6ynljSv6CzfoX+wgojI61nhWjFb8e1OYbY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4C50F805BD; Fri,  4 Aug 2023 11:43:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27E6DF805AF;
	Fri,  4 Aug 2023 11:43:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A43AF80617; Wed,  2 Aug 2023 17:38:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07610F8060A
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07610F8060A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=DO3nbl0F
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3492971f72fso3354365ab.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690990680; x=1691595480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kwwam74pzhHFEUqT4XAcAOsJClTD9hVWsEI9hEoiqVk=;
        b=DO3nbl0FHNkDFvmxD4c7Suq0WyVDfJLaVTQ2rGf+rlgEk/B2mQv81BCZlYE1+uQtqs
         0rZDZEnkZtek27ZgjhfJoCgSK1JKgRFCM0dWIX6/2jNF3xagNWJZk1FGE3+2EMurFN/Q
         dBtEbDDU9YSC/Ric2fqyBvTHtIMWCgKROKfzywvEs7SOBNtuq/O7S2daU8Cv8YTlmroX
         mQec/RmfeGecLYavGZoIIvQcfpNFSE3NKqrbT5Wt/l1zAp55Ov7bw84NaIY5oXpRBhcj
         Xey8KOC14knBgxxNDjLHD8ZlOY4BOfdchEy3AKJ51DNuVQO+EHa0F8zcxjcONpfCPt+L
         ojSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690990680; x=1691595480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kwwam74pzhHFEUqT4XAcAOsJClTD9hVWsEI9hEoiqVk=;
        b=kdFMWpZlyqwXDtNX0cfbd00NVOoeHBRnxG+ylO4ntPpgIbNbWHMhJ9yVJEnvxtlI43
         BcF3Cs4c570JFNQ6wI+3LkDqlsisY5GlCthYusCk8qhKWTE4s0NAFgCY85XKZk64Ljox
         vM8Dh4xp8ntUsi4QJX3SQmvRmrUYFy/qYWx+sxxj4/2F3CXrnhVB2HxShvyVedvfHS5N
         VwYHI/H/KJZM2NECXFJtcjHvkUGketYZtpBDgH9WGwaWqem8WPyLW92pOQGykY0X8w4q
         D5mGwug/nLWPYKHTncvbBQizaML3lJk9JFYCgCivgofiSIlonBpuK1Jrufkun8QeImir
         FCLA==
X-Gm-Message-State: ABy/qLaSSaYBDamLuGbIVc6gR33j2vVk9o87zyTY9ZYUUMDvjrLE86mi
	DYNPgXSSQQ69I3nzKHlEkks=
X-Google-Smtp-Source: 
 APBJJlGQXuWWIjRNew/Vj6B5cF4LBmmOlXRxbiBDJSdDXV/KmzqBWo/+bX4Ga7KBGZaoqE27Vleetg==
X-Received: by 2002:a6b:c30f:0:b0:783:6e76:6bc7 with SMTP id
 t15-20020a6bc30f000000b007836e766bc7mr13512517iof.2.1690990680143;
        Wed, 02 Aug 2023 08:38:00 -0700 (PDT)
Received: from localhost.localdomain ([173.23.87.62])
        by smtp.gmail.com with ESMTPSA id
 g8-20020a6b7608000000b00786f50d6bf5sm4556830iom.19.2023.08.02.08.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:37:59 -0700 (PDT)
From: Matthew Anderson <ruinairas1992@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Matthew Anderson <ruinairas1992@gmail.com>
Subject: [PATCH 1/2] ALSA: hda/realtek: Add headphone quirk for Aya Neo Geek
Date: Wed,  2 Aug 2023 10:37:29 -0500
Message-ID: <20230802153730.39273-2-ruinairas1992@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802153730.39273-1-ruinairas1992@gmail.com>
References: <20230802153730.39273-1-ruinairas1992@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ruinairas1992@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E3EI5MBCKBL27JQJPTAVE7V64EKHXNVO
X-Message-ID-Hash: E3EI5MBCKBL27JQJPTAVE7V64EKHXNVO
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:42:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3EI5MBCKBL27JQJPTAVE7V64EKHXNVO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This fixes the headphones on the Aya Neo Geek handheld.
Signed-off-by: Matthew Anderson <ruinairas1992@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 44fccfb93cff..33f9beec8179 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6521,6 +6521,20 @@ static void alc294_gx502_toggle_output(struct hda_codec *codec,
 		alc_write_coef_idx(codec, 0x10, 0x0a20);
 }
 
+static void alc269_fixup_headphone_volume(struct hda_codec *codec,
+					const struct hda_fixup *fix, int action)
+{
+	/* Pin 0x21: Some devices share 0x14 for headphones and speakers.
+	 * This will fix ensure these devices have volume controls. */
+	if (!is_jack_detectable(codec, 0x21))
+		return;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		static const hda_nid_t conn1[] = { 0x02 };
+		snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn1), conn1);
+	}
+}
+
 static void alc294_fixup_gx502_hp(struct hda_codec *codec,
 					const struct hda_fixup *fix, int action)
 {
@@ -7016,6 +7030,7 @@ enum {
 	ALC269_FIXUP_DELL3_MIC_NO_PRESENCE,
 	ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
 	ALC269_FIXUP_DELL4_MIC_NO_PRESENCE_QUIET,
+	ALC269_FIXUP_HEADSET_AYA_GEEK,
 	ALC269_FIXUP_HEADSET_MODE,
 	ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC,
 	ALC269_FIXUP_ASPIRE_HEADSET_MIC,
@@ -8440,6 +8455,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
 	},
+	[ALC269_FIXUP_HEADSET_AYA_GEEK] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc269_fixup_headphone_volume,
+	},
 	[ALC299_FIXUP_PREDATOR_SPK] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -9934,6 +9953,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1f66, 0x0101, "GEEK", ALC269_FIXUP_HEADSET_AYA_GEEK),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
-- 
2.41.0

