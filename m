Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263386BEB00
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 15:20:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2E2CF63;
	Fri, 17 Mar 2023 15:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2E2CF63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679062815;
	bh=qDh25MIbzRLxzMtauBVUUSgfgT09pHlGVjynGGJcVTk=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=l/Xz5ItCCbnt88YP4FFzAdNrCEdPnRBsID/jkhcJqZMjiZAjr1KbREPXc/0p+WDme
	 xDcxB0oisi+Rp/HqpsD9uVa4zuXCNpbwVz4orFvlYeb9NH/JNanQiFZR36z51FtLRH
	 Ky1Lw2qD1ZNW6GP8QjedNOO7iljXpwKcg5gKdq2k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86EB1F8032D;
	Fri, 17 Mar 2023 15:19:24 +0100 (CET)
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirks for some Clevo laptops
Date: Fri, 17 Mar 2023 08:18:25 -0600
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRGA5TBSLLS2MJZRPSFARHZMJGNTDN5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167906276359.26.3908012498848335076@mailman-core.alsa-project.org>
From: Tim Crawford via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tim Crawford <tcrawford@system76.com>
Cc: tiwai@suse.de, productdev@system76.com,
 Tim Crawford <tcrawford@system76.com>, Jeremy Soller <jeremy@system76.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82092F80423; Fri, 17 Mar 2023 15:19:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BD44F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 15:19:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BD44F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=system76.com header.i=@system76.com header.a=rsa-sha256
 header.s=fm2 header.b=ITd0E2bw;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=vbb0+hgm
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 5D6E45C00BC;
	Fri, 17 Mar 2023 10:19:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 17 Mar 2023 10:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1679062751; x=1679149151; bh=nZCjnYQuDt
	Ic5SKcMl6MLPQR7OpMzSgOgwrW7xPjVHo=; b=ITd0E2bw7bdQApJjmDY2+doOKe
	dDbeghE1Ow3G9QGWtvOkjs/dJB23KFlOEXS+t1dFHyaQuw3MhaMsYTZGVsZc4eEu
	w+4kTsdNXmd8rrP5Dowz+dcjBSYRaesLaxstjzQvzEHYxPLnMzmEfS6DZvm4S7Jr
	5vfdMKVLVxCnSNjTvUPyxEnMaskCHOp4O/F2oUPAf1voP25ZgNz+IRe9aN9w/Ys/
	ZTGd0vg9Ec76fXTZmYc7t9y6fLGvnt9iFZuhmi4zAi7y1P/I+IHBSLUtLWVk1xnI
	LLIXFV9TT9A0MDUisfgBHOjKuqfnAuHetWRWKilNZJlcF3Dp9DNZHQizT9PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679062751; x=1679149151; bh=nZCjnYQuDtIc5
	SKcMl6MLPQR7OpMzSgOgwrW7xPjVHo=; b=vbb0+hgmzAWP6fT+l+58DstNylM0m
	X2GbZEgnWfR6UImPq55Vt4UhfTeOsvoqiidF6s+GmPnnSeUGoH/RwsOeQ4wm8vmb
	uhGwxB2+FaZ1vW8nAKZjDUfj/L+nEMvn2bmF+YWknqwppgF4ptJVvMNdVdU9cx23
	cqvwfb6nmqbnu65qIzO1h52LYPKsvZspeNXE8JJgs5w1hm84ZJUhGfri5cGHS+oc
	UFMzpjSCp+zbmLSY8JmQgSeAEBuwHWJ5i7tsef2v2MaP+01hzkqPP0t3KWdYo5oH
	AWNLpoDq5bLNgBIQQ/FxJZvACLlY+8Zk5FyBg6VZhV4PPTr03aMK24vWQ==
X-ME-Sender: <xms:33YUZCy-wzdTIk2GBwWJs1gRleyq79UOW59LKFqkfi0XA3qXNg1ARQ>
    <xme:33YUZOScuVuVWjjDNhsy9UeowehpE3ZcZuMbdLkhwHK4uKcGU-Piu8F3K-AzVrVGK
    KNlJpdfMyLVTx-xRQ>
X-ME-Received: 
 <xmr:33YUZEX9jCJaVenp-OwJKFmNX5PsGKftm87Mw0mQdzf85AU1h23QN2zZMgzG3rXZjtL7Jv5geUR7aZdSvvEL8ajiMHMaH4t-6jeo9k5Ksg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhimhcuvehr
    rgiffhhorhguuceothgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhmqeenucggtf
    frrghtthgvrhhnpeekgfetfedviedvhffftdffgfeifffhteeguddukeeifeeuuedtleef
    tdevueehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:33YUZIhAE_gTtwIWYP8thzJ7KSijHREzup3PCRAzCDGRzFY2tl_rdw>
    <xmx:33YUZEBu0JVgi7WCDQna1w8Sb7FXdhvjtYgxFcVvWOCGtTITaJSSFw>
    <xmx:33YUZJINs7DKfuVjMGYX7QibqS3bSRPLjL7xkA1tOPYCVyEMjp5xaQ>
    <xmx:33YUZHPTRIYa1SsGmJvNKYEWugFAYsL217NjJmQb8qfzkseo6IlN8Q>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Mar 2023 10:19:10 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirks for some Clevo laptops
Date: Fri, 17 Mar 2023 08:18:25 -0600
Message-Id: <20230317141825.11807-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VRGA5TBSLLS2MJZRPSFARHZMJGNTDN5V
X-Message-ID-Hash: VRGA5TBSLLS2MJZRPSFARHZMJGNTDN5V
X-MailFrom: tcrawford@system76.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, productdev@system76.com,
 Tim Crawford <tcrawford@system76.com>, Jeremy Soller <jeremy@system76.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRGA5TBSLLS2MJZRPSFARHZMJGNTDN5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the audio quirk for some of Clevo's latest RPL laptops:

- NP50RNJS (ALC256)
- NP70SNE (ALC256)
- PD50SNE (ALC1220)
- PE60RNE (ALC1220)

Co-authored-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3c629f4ae080..d7beff1aed2a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2631,6 +2631,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x65e5, "Clevo PC50D[PRS](?:-D|-G)?", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x65f1, "Clevo PC50HS", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x65f5, "Clevo PD50PN[NRT]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x66a2, "Clevo PE60RNE", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67d1, "Clevo PB71[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67e1, "Clevo PB71[DE][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67e5, "Clevo PC70D[PRS](?:-D|-G)?", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
@@ -2651,6 +2652,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x96e1, "Clevo P960[ER][CDFN]-K", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1558, 0x97e1, "Clevo P970[ER][CDFN]", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1558, 0x97e2, "Clevo P970RC-M", ALC1220_FIXUP_CLEVO_P950),
+	SND_PCI_QUIRK(0x1558, 0xd502, "Clevo PD50SNE", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo laptop", ALC882_FIXUP_EAPD),
 	SND_PCI_QUIRK(0x161f, 0x2054, "Medion laptop", ALC883_FIXUP_EAPD),
 	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Y530", ALC882_FIXUP_LENOVO_Y530),
@@ -9573,6 +9575,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x5101, "Clevo S510WU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x5157, "Clevo W517GU1", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x51a1, "Clevo NS50MU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x5630, "Clevo NP50RNJS", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70a1, "Clevo NB70T[HJK]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70b3, "Clevo NK70SB", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70f2, "Clevo NH79EPY", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
@@ -9607,6 +9610,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x971d, "Clevo N970T[CDF]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa500, "Clevo NL5[03]RU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xa600, "Clevo NL50NU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0xa671, "Clevo NP70SN[CDE]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xb018, "Clevo NP50D[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xb019, "Clevo NH77D[BE]Q", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xb022, "Clevo NH77D[DC][QW]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.39.2

