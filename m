Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30419AE23AC
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jun 2025 22:39:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1D57601EE;
	Fri, 20 Jun 2025 22:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1D57601EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750451951;
	bh=8hM94ZSFZNFpjJaLlDhbuI3WpCPpJvSJvdk/M5k1p44=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=M43qInbjuGSYRywQEvys+8EQMHrklEX6d4PPE+JsV1mZbDElVgMC+QE2/pCET6tRk
	 /5CCzflyX5OPfiCw92Pwuo8gjlNjdfEgTJDVxmYPRqCuTLyC8kFogQe10C/CNExXbj
	 +r0I6P5wwBvk8dTAed31xDfcGkQPJXpT27FYFScs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CDEFF805C1; Fri, 20 Jun 2025 22:38:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA3F1F805C1;
	Fri, 20 Jun 2025 22:38:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53E30F804B2; Fri, 20 Jun 2025 22:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91A2EF800D2
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 22:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A2EF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=system76.com header.i=@system76.com header.a=rsa-sha256
 header.s=fm1 header.b=tXzFLouw;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=L8w6k7t/
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id CF28C138047E;
	Fri, 20 Jun 2025 16:38:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 20 Jun 2025 16:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1750451905; x=1750538305; bh=LV8jsKYNU6GEZemXHtnFb
	dVJr5xbJ0OpecIoFgYAx1M=; b=tXzFLouwiVSWg+cLMHdDQIKMknRRf02Fk8nXl
	xL8IZaNo2w2HQ68DSAnp4+wTH9kr55Tr0K7H3aczsnJXyYu5h+G7/Dt/aNN81T/S
	3Czrt63PjXsKY59e5r6L9f+XCv2WaZp31R2bF2nzFpVOL4hLfPdaPQMmY9yKvtau
	m1DU+heLSnjrvKIB9DdtoEVljkKhYmF641z1vhZZLWBPSpR869cz5RfPG8rA6F0S
	F50bTWu2iNdAhspXL0qoH+q+PsPG5AR5LduATSSRez3ejsIyYXNOBZSLQX1zmlQL
	6/V9UL7d0ioBMtXR1QA2wmlbl/2FTdwuT9wQzFlMHbWFVGcQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750451905; x=1750538305; bh=LV8jsKYNU6GEZemXHtnFbdVJr5xbJ0OpecI
	oFgYAx1M=; b=L8w6k7t/5nYHz1k8vwhdKhJNZew7YJausZlvYRrY4I5OekffOBQ
	j7OuNXRY0W9zCbeEWeOqSVW981W5PaG9lBc3QCtSsysChD7rQ+g6gqfr+z1IdFqX
	VEXjVUOMUAfWvAR9+VvTcjGV4c2v5WYrreFx0CltPKfSQMbA45P64CYUlUNu50Dt
	TmhZCrpurrpwspUlGPR/wRWwykZ5GooGlHb6wHdgNH2twBjGX6hD70DJBHa52Vlj
	SYCROLykrv0m4Kj8HS3x6zfkylWMaCZBrmEGhvCyctiBdXJj9x5yAC0JOIwNZ5aa
	38BA+fpCZJay37TW8FOrykr7hgSaAEgTnww==
X-ME-Sender: <xms:wcZVaAM1s09VmTjZe2X3w_sm4q97h6Do8RL8ASQyo8X93RtezPK-0g>
    <xme:wcZVaG9gqLFEdWUyAT3VAB7f_Csviz7653m7mtXObtv4Y5nf9rJjEM5UM71aC-1JX
    3Dg70oD_J4o9wJ9Ug>
X-ME-Received: 
 <xmr:wcZVaHQhCQvFMf85sGYoPit8SIARvlEVXW1d1Ar5GPp4J9Cz0cN-MJ1p8-rNzxVVQcUAHk9qWZYruEfR9BNVUTvecBOVSGHW9bF1pdo>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdelfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtne
    cuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehshihsthgv
    mhejiedrtghomheqnecuggftrfgrthhtvghrnhepkefgteefvdeivdfhffdtfffgieffhf
    etgeduudekieefueeutdelfedtveeuheefnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmjeeirdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegr
    lhhsrgdquggvvhgvlhesrghlshgrqdhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepth
    hifigrihesshhushgvrdguvgdprhgtphhtthhopehprhhoughutghtuggvvhesshihshht
    vghmjeeirdgtohhmpdhrtghpthhtohepthgtrhgrfihfohhrugesshihshhtvghmjeeird
    gtohhm
X-ME-Proxy: <xmx:wcZVaIvixJqOKxTnU9M4vUvphzv9aBAd6LYqWvk4bHZ_9nQFdE171w>
    <xmx:wcZVaIcbxWf_KljZzZbFOmumj8tH1zTPwjMKD62oVLRrMSPY9WrRkQ>
    <xmx:wcZVaM2eAjlpFr-7Up2GtqSBJbzXq9EOG1odDX_bCgy1nSZSBV2lpQ>
    <xmx:wcZVaM9cYz6O54wgOYPoe37dN9TDoVGv2kyhO9aqXN4i2anNBqofBg>
    <xmx:wcZVaEY09w_FloJc3VkkENUEN8VRgLEwW_IaDFr4gtY65OkWK32Dv9yj>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jun 2025 16:38:24 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	productdev@system76.com,
	Tim Crawford <tcrawford@system76.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirks for some Clevo laptops
Date: Fri, 20 Jun 2025 14:37:56 -0600
Message-ID: <20250620203756.35280-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5KA4GMSEX62XKLE3QSKLFSBPANEORSQU
X-Message-ID-Hash: 5KA4GMSEX62XKLE3QSKLFSBPANEORSQU
X-MailFrom: tcrawford@system76.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5KA4GMSEX62XKLE3QSKLFSBPANEORSQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add audio quirks to fix speaker output and headset detection on the
following Clevo models:

- V350ENC
- V350WNPQ
- V540TU
- X560WNR
- X580WNS

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cfcc204264aa..54d6edf203a1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11131,6 +11131,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x14a1, "Clevo L141MU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x2624, "Clevo L240TU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x28c1, "Clevo V370VND", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1558, 0x35a1, "Clevo V3[56]0EN[CDE]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x35b1, "Clevo V3[57]0WN[MNP]Q", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x4018, "Clevo NV40M[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x4019, "Clevo NV40MZ", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x4020, "Clevo NV40MB", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
@@ -11158,6 +11160,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x51b1, "Clevo NS50AU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x51b3, "Clevo NS70AU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x5630, "Clevo NP50RNJS", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x5700, "Clevo X560WN[RST]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70a1, "Clevo NB70T[HJK]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70b3, "Clevo NK70SB", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70f2, "Clevo NH79EPY", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
@@ -11197,6 +11200,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0xa650, "Clevo NP[567]0SN[CD]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa671, "Clevo NP70SN[CDE]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa741, "Clevo V54x_6x_TNE", ALC245_FIXUP_CLEVO_NOISY_MIC),
+	SND_PCI_QUIRK(0x1558, 0xa743, "Clevo V54x_6x_TU", ALC245_FIXUP_CLEVO_NOISY_MIC),
 	SND_PCI_QUIRK(0x1558, 0xa763, "Clevo V54x_6x_TU", ALC245_FIXUP_CLEVO_NOISY_MIC),
 	SND_PCI_QUIRK(0x1558, 0xb018, "Clevo NP50D[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xb019, "Clevo NH77D[BE]Q", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.49.0

