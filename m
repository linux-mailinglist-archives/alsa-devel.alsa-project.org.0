Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4114576FDB2
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:45:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 873B6210;
	Fri,  4 Aug 2023 11:44:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 873B6210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142349;
	bh=Qb7N5AV7b+64XpngLAX0DpMv7DNurHaxCzu3WLj6oSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IOrYyao2Z82HRYXMtzzkwYCVofjWpAIiMXzx3e3zbL4RDOgKYNX5jmjMbiA/c0v0O
	 H24FVmXGjC9UMmrVByDhxqtkkJ+8pTLzsl/vfVmPLCmgxHqP3Fre+VFVe1Iwwzo1hj
	 jWeFpy0MtG4AgDRK5Ep/glG60CpHAwH4i2fg6PeQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE9EFF805C3; Fri,  4 Aug 2023 11:43:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB64F805BB;
	Fri,  4 Aug 2023 11:43:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03252F8061E; Wed,  2 Aug 2023 17:38:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 966D1F8060D
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 966D1F8060D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=inTzu8tx
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-348d1c94fdaso3785885ab.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690990685; x=1691595485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohwe7sWJuQOwFnTKjN2+GTRcxF1Lf9US/VSNkGV+XaY=;
        b=inTzu8txCgciAR8I65Y61N8CeBtLfEsPEIKUD1xFOqdAVHPvfDx6sPYaThHOMv5dQG
         ub/4WuCHvkqHu5kQe9cmg2ANWPoUJOuN7aKrApEMDDhk6NNQUnRdu43Es0/GPviE8GBp
         zeMjzFV8Vh1VVL8mBR3I77coXxgxO6Xm5dnp8gzA7/paYNqIzkbAfPUiHx8BScbkRxKD
         lXnNRRvsJDuliSPsXxZvKu5jBlidd7IKJfbA0Ar27lQfvXvk57pokot6iKGIgs3+8/qT
         CGvTh9tnJxU/3BJoqhgBsVhqOzHFJ6vyWOJXiXUfk3aT55cQi00lY5/K/9QZao3SmPfu
         OBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690990685; x=1691595485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohwe7sWJuQOwFnTKjN2+GTRcxF1Lf9US/VSNkGV+XaY=;
        b=IdhddWtQL6FJcDUXrOD+vhwhl9WswEgD7gzpBY2GKGsLBeQfxhOwrdDjuDczMolTTT
         XLq1u0LAmgk6I3uPJrMhTFrsSU8AcNsNw2wcCL3UAhrz6GzTmNkZYnIfCxzNsLzoUbOz
         z/fxcwwYnK6qmJdWFiHDW8qxZpUl2PyACJ8ZToK7OCap+ubfiacUTiVsJPDAs4q7kcpl
         OpU8Ual+jQRlu1qDhPbX0SuMBA5D4CBxqCONpYVtWmjQK9rMEFR9TVspu2Q50IejMEva
         qKSYYsb0/ImIwDhVgPD5/CD5KnWpeGPsawn+H5kBjM8CkNJ+rzKwQ8Q6TA/wJRI6nDDj
         A2BQ==
X-Gm-Message-State: ABy/qLb0x/BbP3bxRvKbPf0PT0gcFV29M4Bcx5zcbURdBcTp+G5cni5O
	a8a55/Wm/uwvEngpkLmgEYE=
X-Google-Smtp-Source: 
 APBJJlH3/2Y8SBqCWEYPY2K1H4/Hbk2M+hOQ5vmajs5vp3cF83mW1qldpSF1BaFqrM3C6rEA0E8BjA==
X-Received: by 2002:a6b:5d02:0:b0:783:6ec1:65f6 with SMTP id
 r2-20020a6b5d02000000b007836ec165f6mr13164371iob.1.1690990685237;
        Wed, 02 Aug 2023 08:38:05 -0700 (PDT)
Received: from localhost.localdomain ([173.23.87.62])
        by smtp.gmail.com with ESMTPSA id
 g8-20020a6b7608000000b00786f50d6bf5sm4556830iom.19.2023.08.02.08.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:38:04 -0700 (PDT)
From: Matthew Anderson <ruinairas1992@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Matthew Anderson <ruinairas1992@gmail.com>
Subject: [PATCH 2/2] ALSA: hda/realtek: Add headphone quirk for Aya Neo 2
Date: Wed,  2 Aug 2023 10:37:30 -0500
Message-ID: <20230802153730.39273-3-ruinairas1992@gmail.com>
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
Message-ID-Hash: SZKVHWPNFSEOETP76JBCKLO2KMJ6NYVI
X-Message-ID-Hash: SZKVHWPNFSEOETP76JBCKLO2KMJ6NYVI
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:42:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZKVHWPNFSEOETP76JBCKLO2KMJ6NYVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This fixes the headphones on the Aya Neo 2 handheld.
Signed-off-by: Matthew Anderson <ruinairas1992@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 33f9beec8179..5d31cbe5d40b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7030,6 +7030,7 @@ enum {
 	ALC269_FIXUP_DELL3_MIC_NO_PRESENCE,
 	ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
 	ALC269_FIXUP_DELL4_MIC_NO_PRESENCE_QUIET,
+	ALC269_FIXUP_HEADSET_AYA_2,
 	ALC269_FIXUP_HEADSET_AYA_GEEK,
 	ALC269_FIXUP_HEADSET_MODE,
 	ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC,
@@ -8455,6 +8456,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
 	},
+	[ALC269_FIXUP_HEADSET_AYA_2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc269_fixup_headphone_volume,
+	},
 	[ALC269_FIXUP_HEADSET_AYA_GEEK] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc269_fixup_headphone_volume,
@@ -9953,6 +9958,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1f66, 0x0101, "AYANEO 2", ALC269_FIXUP_HEADSET_AYA_2),
 	SND_PCI_QUIRK(0x1f66, 0x0101, "GEEK", ALC269_FIXUP_HEADSET_AYA_GEEK),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
-- 
2.41.0

