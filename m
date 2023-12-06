Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 625D380725E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 15:27:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45B20857;
	Wed,  6 Dec 2023 15:27:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45B20857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701872857;
	bh=e7IuCEj9SNXeE3ht7hRlPZc+5l9xW26zJbt9RI7mEoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vu2P/zQQmbHIK1/7L8x1D//F4vVlQwMhTZvtlzY51xU5z6AdABSQ064LXPjoTs+gY
	 54JI8ZaXXUtpOIL3sYYezPFU9kcDMdBF7a7mB4YOVdGCDw4duMjG9rvk47fdDNlOGD
	 o8Ef1+DAdOK+bfpoE0SsmDtZiQkFwB6mp96reEC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2422DF80571; Wed,  6 Dec 2023 15:27:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6643F80579;
	Wed,  6 Dec 2023 15:27:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A69D6F8024E; Wed,  6 Dec 2023 15:27:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0037DF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 15:26:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0037DF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timbos.se header.i=@timbos.se header.a=rsa-sha256
 header.s=fm1 header.b=tjJYXO+a;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=yNZPKncR
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 1C09B3200B05;
	Wed,  6 Dec 2023 09:26:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 06 Dec 2023 09:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timbos.se; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1701872810; x=
	1701959210; bh=FSz6e4D8TLev/xnxjEG/RWNOwxwCdmaAQinIIjXpIbY=; b=t
	jJYXO+aES7AhAY5P3W0WK4AmzfngQSo5PMLuVqoc7LR0q3c0CI0pbWeUgShDueeJ
	uvQ7YsUdyHZr+cR4wLB7n//8l4vFU2AvKSyGSJ/+8K+CEEKY7r0zcV7Zm5YYNYmN
	9L66umhs/60zAogRqAuI0uR9gWDl1t40ktQsh1jXg6VjRmDe0B/g3WztdchPXdej
	P0LI6gVIoMKuE6j0QDbZ7Y1A28bb9tetimokC2zeeo5M23OfY0/oWebMeJiJ0RHm
	Yd3duKqm9zDhMIaROe3JrRIFbu/Y0xT+RS3nmGC4a5agDIQxKTnSbuijqyv0HUB6
	tXltgkB2UbMFr1vAImIDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1701872810; x=
	1701959210; bh=FSz6e4D8TLev/xnxjEG/RWNOwxwCdmaAQinIIjXpIbY=; b=y
	NZPKncRbsqxmRKuw/Lsf37LJpAhewP3y7zVVVm8SY/Cr/XBAt/a4MNC278kRzW/E
	C9NXZbiWu7/uEyTYdKDJoL7lz2apQEOpK86bbBalbAVq25gNZ+xZc2prT5Z5Jjkf
	5BT/pU2qO/BsagFRhLFlhIMyoqSLbF0CNoaDQJiy6XTTntIvTpgvP+EcbeUSc/2I
	J4TGpud+uI8pqVHt08uNCVqhWopdWDlASFiEIt78JaSHfqoMhtBBYs1dMkir5FsU
	qOeyACtwC7bPEYRRmWnk6063wWT8lZpWGZrHUx4RLnsVR1Y2z8iJInM1G3iR1ZT+
	JrB5DP4aBHWi50dLCLTuA==
X-ME-Sender: <xms:qoRwZWLItdwkIAt9b7I9JFTpGQpRGNEMpf29ppAOj35bNGiV6iKUwg>
    <xme:qoRwZeJ5vElgjeRql419nDriSyppkn6XLzrAM77WmPL6fCK5H_RRoaFL1ccmsrtUG
    vGqSW3RYAl76YUEjU8>
X-ME-Received: 
 <xmr:qoRwZWtJeQrljfYJ5-GbwkJCaBMwEeIAmc-L3tBwo22-kKJl8MqaBHr9sM79u54hWQSPq_gDPuEClH7T7kFT1l8vX8c1qSyOPUorn2w8lNghV3kOA1Xi1Wo>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrudektddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvihhmuceuohhsshgvuceofhhlihhnnhesthhimhgsohhs
    rdhsvgeqnecuggftrfgrthhtvghrnhepieegheduveeikeeifeejiedvkeetvedvvdeuff
    ekvdejgeefhfduveelfedvuddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepfhhlihhnnhesthhimhgsohhsrdhsvg
X-ME-Proxy: <xmx:qoRwZbbQIStusJ_WOy9TkZgw_hStcxkk6mkOBd3kdl_h50QGMYtljg>
    <xmx:qoRwZdYl9Taumepf2ycDCbo9hcxDXLW-akXkvVKY_1pIe-9qdVXHKA>
    <xmx:qoRwZXD8jZzev42_YEM3oV-S_8qmEZcgMkS789V9H0HAu13Wc7dZeQ>
    <xmx:qoRwZcz8od8j26ChiR-6aS6DxSCRhGv5foA6p2yUR6NeWV-FSoKheA>
Feedback-ID: ideb94765:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Dec 2023 09:26:49 -0500 (EST)
From: Tim Bosse <flinn@timbos.se>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	Tim Bosse <flinn@timbos.se>
Subject: [PATCH v2] ALSA: hda/realtek: add new Framework laptop to quirks
Date: Wed,  6 Dec 2023 09:26:29 -0500
Message-ID: <20231206142629.388615-1-flinn@timbos.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZW/dfeBFt+9wipXH@geday>
References: <ZW/dfeBFt+9wipXH@geday>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PSQELMX7BZFQWOJOZG6H3DNSKTF5W5DS
X-Message-ID-Hash: PSQELMX7BZFQWOJOZG6H3DNSKTF5W5DS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSQELMX7BZFQWOJOZG6H3DNSKTF5W5DS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Framework Laptop 13 (AMD Ryzen 7040Series) has an ALC295 with
a disconnected or faulty headset mic presence detect similar to the
previous models.  It works with the same quirk chain as
309d7363ca3d9fcdb92ff2d958be14d7e8707f68.  This model has a VID:PID
of f111:0006.

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

