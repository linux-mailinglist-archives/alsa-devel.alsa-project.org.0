Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7B86F4F49
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 05:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C43521355;
	Wed,  3 May 2023 05:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C43521355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683085935;
	bh=AFClTy2hE0oZEnU+mdwdS2eMizyJTni2QwwauWT5LrI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DNSwNYWXXogdcdm9jwEvpkP2u1Nx5MqmMiu/Z26KS1n21h2LXqZUuhpmIVc35Gc8g
	 IGowyH8azwctUtT4cyLA1gEeO2Cu7FUFt/yj3bICPHVNy3c91QKCqqg4ShZ4jw3WcD
	 X/NsOfjedFq6f51KVI5vENjomLjnZEb0aRbzJfNI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC928F8032B;
	Wed,  3 May 2023 05:51:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05565F8049E; Wed,  3 May 2023 05:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A1E9F800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 05:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A1E9F800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm1 header.b=z3GG90cf;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=bMUc/u2M
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 54DB33200B99;
	Tue,  2 May 2023 23:50:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 02 May 2023 23:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1683085845; x=1683172245; bh=twjvR+8FUi
	ccRKqC2PlVe9ds9MWJ3LKswPKdW5p38AA=; b=z3GG90cfz8byZ5GngRGyFI7qPe
	6eVXu/I5Rwq/9wTH/Jd6/KtFRDYnzeYkFhB60Hy5euWQd9eUugHcBSxmRIgGm3l/
	dZygZgk9T7A0QCfJ+Q/c0uyEotymgnS1e8s/Yz6zfMJmjWrmMXmkRLhUYgC919++
	iDniABXW4ehfCubeOnDDsq4spne6e4i+Vre/E/gz2Tt90HaLFUjs5EwLOmTYcw34
	+3VO2xX39A56HM6vDoU9k3urkA0AwSbEMr7pX0Dfvm4F5lbbEQkfnxQH7wrHPuK4
	W/Ce2ClkWF6JvdnotVnICJSuGp6Zrw/QrlsCIm6ZLbvRM2ksLOmBrSf8Ng+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683085845; x=1683172245; bh=twjvR+8FUiccR
	KqC2PlVe9ds9MWJ3LKswPKdW5p38AA=; b=bMUc/u2MrRh2i2PIv8Q/hC8Tbjlx3
	VATcB/uIHKdg3+cEOVtFsqvqah3jaZbcEId8wluYr0zZxLJZ3gSPns3SF5a6gYYF
	zg2WxRWowx8B68/UwCvcwtbZDURz7vsooUNmaWzQEbyAYzpAzhl+5w08qxfKhz1N
	ocJpmqYWXka8Dk5ePxN11PfQe6mya7TfRrNIA8PR6zIwAS6FC58cQ+nRFeu/uogg
	NDcIJb4Gdy2u8GLNoxEmBBsDgO9KVnc9vtoNaMM6jdbicw+Dvz+rdKoG1DWATDyi
	un8S5cwg9gj5Cs8e58/HIkwTN0tAbzeDPjSzw+TORKrwJowslik2DQ4Rg==
X-ME-Sender: <xms:FNpRZH5B8bIdem-i6d5yFYyS7QA4bY6Ex0H5jKQxF4vzPouXPUzMXQ>
    <xme:FNpRZM4yrt1dP94fagg-4ueHyISGF-zRgLQ-yNMtW-wPMnYaCzTb2Hc6inBvsUJeP
    V2_TLW7UZwiWvCvElg>
X-ME-Received: 
 <xmr:FNpRZOcNGVbvckvzdSI5xKuaq7-LVnkzcQQzFtLup1BAwNAb624KUGrA-qfL>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfedvjedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
    nhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfdujedthfduudekffefkeeiffdttd
    dvhfegudduueffuefhfefggeefteevvdegnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:FNpRZILh_5LXitJVcCWfeeb1cZdzh4MGZkmmQI6CcYK2HGSKghR6vQ>
    <xmx:FNpRZLKUqVdROu54vzw6_9_hCON9AMJiq94P2vzhoSRwHUAwFr-01g>
    <xmx:FNpRZBzYyp80pd_bhOncjFIHq_h0H6YVps347FA9QDR3JCa38jddvQ>
    <xmx:FdpRZCXGu2iOCCOoHjB_D82PtT8kgxOsuuNaAYLbNu9ty5UmEj4dpQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 May 2023 23:50:41 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for 2nd ASUS GU603
Date: Wed,  3 May 2023 15:50:35 +1200
Message-Id: <20230503035035.254346-1-luke@ljones.dev>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3QJATCLWJCULAJRGNLTDLQBYKH5DNMRC
X-Message-ID-Hash: 3QJATCLWJCULAJRGNLTDLQBYKH5DNMRC
X-MailFrom: luke@ljones.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, tiwai@suse.com,
 "Luke D. Jones" <luke@ljones.dev>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QJATCLWJCULAJRGNLTDLQBYKH5DNMRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add quirk for GU603 with 0x1c62 variant of codec.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3b9f077a227f..4a585050edc3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9501,6 +9501,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
+	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x1740, "ASUS UX430UA", ALC295_FIXUP_ASUS_DACS),
 	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_DUAL_SPK),
-- 
2.40.0

