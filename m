Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A98AE23B3
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jun 2025 22:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53453601D6;
	Fri, 20 Jun 2025 22:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53453601D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750452252;
	bh=3o3enP6gjXLnljiFd7ndTlddk6Nfp4Cnl8ZvP4RUJHk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Kee7Xu4GDuowTN92rzqYUKCDgwYP+0lKjdABQyYOqJmNR80C3qU/woYXexMwuxZCK
	 JZmyOEzwIHzdjm+hmVK/fU/GfziPF2OTP4GV74t7j/4pLFc45xKd7JeMQ6uvaRWZ91
	 piq6Z9nhxQWZYyQRU8BHb03/SGLfYbNSBGllAsNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3C25F805CA; Fri, 20 Jun 2025 22:43:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 971C9F805C4;
	Fri, 20 Jun 2025 22:43:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9095FF804B2; Fri, 20 Jun 2025 22:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75 shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 658EFF800D0
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 22:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 658EFF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=system76.com header.i=@system76.com header.a=rsa-sha256
 header.s=fm1 header.b=eVh0yDOt;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KVgQXAOu
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id F35A11380407;
	Fri, 20 Jun 2025 16:43:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 20 Jun 2025 16:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1750452212; x=1750538612; bh=MqfB1VFU89akPL6GOO216
	jAk5pZgShUHiBQYAQqS8lM=; b=eVh0yDOtek48aPcfjSdtFr5+l2J8ahPBU1xEh
	NsrkzM34g2Kc4g4J2PwuvIMbItBF8CkcnEbr5WGTcCVVsIIrN9Y742T0KU4JaKhL
	iJ8nXcrVR+ppPoLVAxrHn4dRN/Q59IalPrnO1ntfoOgOkpvhDEUTXuzxj14ycKmr
	/DUg3I4x/CCSHRFi+NdGUFZ+NvXOQf/tp30bhZ2LPMj1N6pewYwerazkxBvKSEql
	VpZfRUKdBWBlySebYZPCC6o18ukADwBwXKNi+zf93QXqhwkHV6N8ZiXcm1KZ6Qlh
	YrkZs6u3i8ywZn9uK3rcxS5giSyRHeETxtn+JKjKngkNa2bOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750452212; x=1750538612; bh=MqfB1VFU89akPL6GOO216jAk5pZgShUHiBQ
	YAQqS8lM=; b=KVgQXAOuZnFeppvFJCIRhMqw6++S93FJUVaE7PCf74T3aGTqzAH
	hi53x7VywYfEhrf5rtlXYTVOAR+xX/G9Ny6ExosjWzbgDYpvz7MD9UQT1ev5DhSO
	JH2m4i+gYX5v3Z4rnKO+FwqJNvYWxUYPrGocOj6Sd+Q3KKbhZ+9ix0goLkEaji/p
	cQC0LHhT4CO4wicvBdo2CFSy58MPanb2N0TsOEwrwNYMEJy8fG0NVlgLQ7COE1lC
	GWpfipj+IbHRAohx4uCi0+Lp8+2el7/x7j6yH3/p5/rrD28mdrfNcX0IqYk4tFjf
	yqAHlZok57urixTEF2E73xVYZzotwsckVtA==
X-ME-Sender: <xms:9MdVaN8LyuBVYToST-UJUuQimFYU-eMI6M0eqMfhaKgRXkJmT-uvyQ>
    <xme:9MdVaBuEO9g45ztEqnFgvBexo57kwLrjQSgMCWwRMwIzvp1p0EVIX97j4AQSJy9A4
    AGsTvMBY_8U7tOWuA>
X-ME-Received: 
 <xmr:9MdVaLDZS7S91SvzesZO9ebHcBFnSRLI8mDHVLogEptaredx5LkQ1-ZQa2vYbgBilRosE6ge-GLjZFeZTTjIHtIllgENPn0KFaLYALI>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdelfeelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:9MdVaBc8A32zeKJeE7V4EQ1sKh_2JFeGrvYy0hYCiL6Igj0EG3FQkg>
    <xmx:9MdVaCME1bU0bRZpFgc3V9Gch1DvPrpyJilhBSpMkCTYvNT8GkEZtA>
    <xmx:9MdVaDnRlHj7xWSS83kArM0qVOjEBp4gh7ZQOl27-CNKylxbB7RZRg>
    <xmx:9MdVaMvcf8xLIyBfLIkFahQrQ34Ju35xeLk5XAhbcsjBOuYs7u3aKw>
    <xmx:9MdVaLL_JdEC_AI0HNwFchVdJTr3ytV8BA6SrTyQyHftVgMMca5EyH39>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jun 2025 16:43:32 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	productdev@system76.com,
	Tim Crawford <tcrawford@system76.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add quirks for some Clevo laptops
Date: Fri, 20 Jun 2025 14:43:29 -0600
Message-ID: <20250620204329.35878-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DU37KVS6RJCDGMYUJFNWECNLXZ6G7KL4
X-Message-ID-Hash: DU37KVS6RJCDGMYUJFNWECNLXZ6G7KL4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DU37KVS6RJCDGMYUJFNWECNLXZ6G7KL4/>
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
 sound/pci/hda/patch_realtek.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cfcc204264aa..13bea7863bef 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2657,6 +2657,7 @@ static const struct hda_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x147b, 0x107a, "Abit AW9D-MAX", ALC882_FIXUP_ABIT_AW9D_MAX),
 	SND_PCI_QUIRK(0x1558, 0x3702, "Clevo X370SN[VW]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x50d3, "Clevo PC50[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x5802, "Clevo X58[05]WN[RST]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x65d1, "Clevo PB51[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x65d2, "Clevo PB51R[CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x65e1, "Clevo PB51[ED][DF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
@@ -11131,6 +11132,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x14a1, "Clevo L141MU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x2624, "Clevo L240TU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x28c1, "Clevo V370VND", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1558, 0x35a1, "Clevo V3[56]0EN[CDE]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x35b1, "Clevo V3[57]0WN[MNP]Q", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x4018, "Clevo NV40M[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x4019, "Clevo NV40MZ", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x4020, "Clevo NV40MB", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
@@ -11158,6 +11161,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x51b1, "Clevo NS50AU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x51b3, "Clevo NS70AU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x5630, "Clevo NP50RNJS", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x5700, "Clevo X560WN[RST]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70a1, "Clevo NB70T[HJK]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70b3, "Clevo NK70SB", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70f2, "Clevo NH79EPY", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
@@ -11197,6 +11201,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0xa650, "Clevo NP[567]0SN[CD]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa671, "Clevo NP70SN[CDE]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa741, "Clevo V54x_6x_TNE", ALC245_FIXUP_CLEVO_NOISY_MIC),
+	SND_PCI_QUIRK(0x1558, 0xa743, "Clevo V54x_6x_TU", ALC245_FIXUP_CLEVO_NOISY_MIC),
 	SND_PCI_QUIRK(0x1558, 0xa763, "Clevo V54x_6x_TU", ALC245_FIXUP_CLEVO_NOISY_MIC),
 	SND_PCI_QUIRK(0x1558, 0xb018, "Clevo NP50D[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xb019, "Clevo NH77D[BE]Q", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.49.0

