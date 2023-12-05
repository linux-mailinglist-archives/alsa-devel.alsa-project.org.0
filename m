Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC580630C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 00:42:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E89BE850;
	Wed,  6 Dec 2023 00:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E89BE850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701819773;
	bh=sveebmIP/A5PQ0/J1NvNbkPj2GKd7PobFCkYntoPgrI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qIHtNg07qu2HXcUyV62o7n3zDbiI1jj5XoxiS/6VNFYIqt97tuGvYbRTAFlxlM2ES
	 uqXtAA3WlV/fiWlhVtwPseeCVl0z+gIIQkOk60ZVPSmyY/IjuEn00aqm/quhvNBHMk
	 +M8DU2YhRmh1dZO5aRahFiQDtl+AvWIYSaNgTN5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E2F9F8057D; Wed,  6 Dec 2023 00:42:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3003F80571;
	Wed,  6 Dec 2023 00:42:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33719F8024E; Wed,  6 Dec 2023 00:42:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7102AF800F5
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 00:42:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7102AF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timbos.se header.i=@timbos.se header.a=rsa-sha256
 header.s=fm1 header.b=fujrqVsm;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=eX8n/ssS
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 36F6F5C0089;
	Tue,  5 Dec 2023 18:42:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 05 Dec 2023 18:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timbos.se; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1701819725; x=1701906125; bh=wR0aUc71JJ
	dl7lVlq3tJ9JTylgTrldMTIORN/gVs1NQ=; b=fujrqVsmkPr8VUBhxYV16ORseE
	Z/48vxolyX9I6vxeGuHu+QiI9pgZM9i5uBg+CFjtNHjx9yiWaLaR3yIicwEXCxtz
	BqYQArGioxvltiP3vpzooLPX8uYJ1vkD0MUBAgHio2tlug9cXllrdQFAAkJxm0bQ
	8yvgeBr0465cxne6x6u+DXdH+HcuFOlEJVZ2mcWBZ66O+FahArN0onx5B6b9lgrm
	VALfAZ35IHzsLz/jJh8h4AHEa5L0A9kKZdBt6EQzF5TZ9FsJO+0wBuUmxSSrJrBs
	gWF+jH70Ys0IMVAWSTuTf45OBfQ/6vn1MnMxPF3InaQIZ5hfrFEtsfxwn3TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701819725; x=1701906125; bh=wR0aUc71JJdl7
	lVlq3tJ9JTylgTrldMTIORN/gVs1NQ=; b=eX8n/ssScLi65KeZqjHBJ3lOjMYaj
	8CRatV1NLWG8gIZFDovnjwF4HFG8uqlrrBO6tM0A6SdciXyaphEPrBJJVOzkaJFn
	vETbmM3IyynvHWWrFdp/updTif+xbo/Xlmh9ZIYZhNLs986gttngd//tqEM+9rSY
	8eS0LE9pe56pfLlvCTuWwZ2nLp6gnkEJ01J7Xj6bglu6Wyo9/VjH6c1J0Ie+HF4Z
	4zb3DmL2XKHKWtyz6LLBPHnpieemk6qQpRdS5Y+5jM97yeNWyacIRzmyF3gNPsO5
	I8XchweI80fOVpq3MhFiKgC7QjFzHSuQFYV9xtBhmZRblxs0pF6dggfxA==
X-ME-Sender: <xms:TLVvZUBeI-Zl0SyBoiXMmKsC00nCGUy_QV2z8RR4nLo7xWWTrCK9Yw>
    <xme:TLVvZWi9sm6rYMB9GKm8DH1dTyGv_SfwNA_G2qcN35XgXIqRqcgsn2UEEiB8zw1G0
    EvD2p351KZk1_yix-o>
X-ME-Received: 
 <xmr:TLVvZXlthnsslUqTx3ZmnsVwNfsRyzSsB8Kh62ctd0lJtzllgb4ozN0I45UyBMr6XeTqgowuqalHBzvqw5HFIAkuqAalvuuOQKYV_3fu3VueWtpP3KdFSYw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrudejledgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvihhmuceuohhsshgvuceofhhlihhnnhesthhimhgsohhsrdhs
    vgeqnecuggftrfgrthhtvghrnhepffffveelfeffveelledtueevieehieevtdeljeetfe
    ekfeffvedtleevvdevfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepfhhlihhnnhesthhimhgsohhsrdhsvg
X-ME-Proxy: <xmx:TLVvZay-Bn0MM9k9UyfSNfYXaIY4rqCpj2N7Eqs9S4L0B-sI285QdA>
    <xmx:TLVvZZR7AXZARqJ3nN4rAOQW1_oW6lglXabiLjBoJr5hkSDIxRb3Dw>
    <xmx:TLVvZVYy_1hdR7Y9hM5UQW2HASzlIuhLJCnburC5PlEq1Kg5a8gUKQ>
    <xmx:TbVvZa5gHIyd_dOdo9E7VD6ImQ8EElart3nPAIQF0nRtoY6iBDdAcg>
Feedback-ID: ideb94765:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Dec 2023 18:42:04 -0500 (EST)
From: Tim Bosse <flinn@timbos.se>
To: alsa-devel@alsa-project.org
Cc: Tim Bosse <flinn@timbos.se>
Subject: [PATCH] ALSA: hda/realtek: add new framework to quirk chain
Date: Tue,  5 Dec 2023 18:42:00 -0500
Message-ID: <20231205234200.383832-1-flinn@timbos.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 366V7H5XSAPE5KDQQIN4QKHXDSEECCFO
X-Message-ID-Hash: 366V7H5XSAPE5KDQQIN4QKHXDSEECCFO
X-MailFrom: flinn@timbos.se
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/366V7H5XSAPE5KDQQIN4QKHXDSEECCFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Framework Laptop 13 (AMD Ryzen 7040Series) has an ALC 295 with
a disconnected or faulty headset mic presence detect and works with the
same quirk chain as 309d7363ca3d9fcdb92ff2d958be14d7e8707f68. This model
has a VID:PID of f111:0006.

Signed-off-by: Tim Bosse <flinn@timbos.se>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f9ddacfd920e..59f2578839ed 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10271,6 +10271,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
 	SND_PCI_QUIRK(0x8086, 0x3038, "Intel NUC 13", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0xf111, 0x0006, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.43.0

