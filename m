Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2107C80687F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 08:36:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C40783E;
	Wed,  6 Dec 2023 08:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C40783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701848175;
	bh=VWWxR8fxUuMkAG6pIviptDkjoOyvYcC3l+84YAX/2Rw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mPST6zMZXo9Hi0xAmgvDuIAbuu6K/+hiHbE6bI9sPg0w8qNpmw42GI3zaeTgJx32F
	 jiMsHLB0E1i8Vd8XkSf0BcUOHEPueuJd0RGlVGpnHRdPUMPjeDcdAqTbFNLlOWQh6x
	 R//qlouV2efr02syMxAyPJ9yyOvChYP4kMDmTOU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F1D1F8057A; Wed,  6 Dec 2023 08:35:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0155F8057E;
	Wed,  6 Dec 2023 08:35:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 027DBF800AC; Tue,  5 Dec 2023 03:47:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 597F6F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 03:47:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 597F6F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timbos.se header.i=@timbos.se header.a=rsa-sha256
 header.s=fm1 header.b=rlokd/YG;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=P/VDDstM
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id D90F33200A4D;
	Mon,  4 Dec 2023 21:47:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 04 Dec 2023 21:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timbos.se; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1701744434; x=1701830834; bh=NXwUl4n8iU
	E/Sic0XKbAlINVG2HJ0nQDdz/FDyyTIa4=; b=rlokd/YGNKgxJWolQaBE4kHD+z
	6zcEkRKvL2cc1zQVMoZjLoD/pmxa/MBzBUe4eRaiikL9PzHG48tU2XZ7dySaCXae
	f4esynw4FrdOulXvO8Sjj854LAetJRZXTY6hikWjdf9MX1SOu+nPAB9hVtfx02rp
	5ZpvR57iVGcKZ9dx+ZtjcNGhxdOce2vDv58P/96oXWravAs/MkzbKcJxb/I2xi6U
	8niJWIJuV5TfUQN8hGS7LpM+J/0S0hj4v/ruT0FUyjDGw67GaO6u5zNRnLb4/9v0
	yBK8elstyqqDZ2qdemSJF9iig15IANUkAZcLGoo+FojQFp5nAIanCGaThFJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701744434; x=1701830834; bh=NXwUl4n8iUE/S
	ic0XKbAlINVG2HJ0nQDdz/FDyyTIa4=; b=P/VDDstMLUlphPmASld0jwrrqwTRH
	5nzcqqmo2pVOAXQUXWHU37iBMrH8g4Ln8TfbD7W2ImJdM6j+WdnRIXQcKep1TswJ
	QK7CGOQqNk3u9Fn+TtTg5SR2WvMRJTiUDRUlMJPbGi/yU25CKQc6WII1RUOfxKov
	JN4WimkmSbqNn4K4Y6wQZqS+9Iu8w+LWXeMBYsa54PzvvpexjzDsgViHOnD2kePs
	5dzn3TjRYAZKRk0gad/tkRXv69vDSG0rh2N5WKPkhkNI5F6nLsTa+jxwkDXjA46n
	ezlgYEdKi5VJ3lw+4h6egNPpLq6vDrGVRlQi77HYroYMYpNoc7hT6y4Dw==
X-ME-Sender: <xms:Mo9uZYZz1CyCzrkHIcQt4vpd5OMi3KsRwWqO6g2aGSxoLeYQ8MQEGA>
    <xme:Mo9uZTawvfHyDMj6h83y3xFMTldymCum27b5IlQQyvKHJ6GxbiB8_bTWjosHZHrre
    68mvodLHBwMfQWSzDc>
X-ME-Received: 
 <xmr:Mo9uZS_jPJdcJ_dNT31W07fHcKz2A_KZx_-sEeRYTvXqyTD8MLV5K25HB3jLt0JcJ79H3YNpq9YyUbbATmDj-Y21Nx3kGt1xVDOiFAZvb5V5x75BVTv-F4E>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrudejjedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvihhmuceuohhsshgvuceofhhlihhnnhesthhimhgsohhsrdhs
    vgeqnecuggftrfgrthhtvghrnhepffffveelfeffveelledtueevieehieevtdeljeetfe
    ekfeffvedtleevvdevfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepfhhlihhnnhesthhimhgsohhsrdhsvg
X-ME-Proxy: <xmx:Mo9uZSphQI_uDEYMyKaMh62onBvM0j5j8zXcNP4UV5K9BWTWZ0pB4w>
    <xmx:Mo9uZTrfsBBYchteBzGYwCxiYEhQR6a-q3Rl_6BUvPkuzflOkFmEOQ>
    <xmx:Mo9uZQTEO5qw5iUd-85dHVOOh00-Z843kUn9HT22eHfh4twDTKM8bg>
    <xmx:Mo9uZSSXC3_6BZirYvU6pZS8fbe2e93TtjreOoMvAdTZSTtDUxpjOg>
Feedback-ID: ideb94765:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Dec 2023 21:47:13 -0500 (EST)
From: Tim Bosse <flinn@timbos.se>
To: alsa-devel@alsa-project.org
Cc: Tim Bosse <flinn@timbos.se>
Subject: [PATCH] ALSA: hda/realtek: add new framework to quirk chain
Date: Mon,  4 Dec 2023 21:47:08 -0500
Message-ID: <20231205024708.154845-1-flinn@timbos.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: flinn@timbos.se
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: C3VKSE7SPETZ4LOJFOPWILEZE3545GZM
X-Message-ID-Hash: C3VKSE7SPETZ4LOJFOPWILEZE3545GZM
X-Mailman-Approved-At: Wed, 06 Dec 2023 07:35:27 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3VKSE7SPETZ4LOJFOPWILEZE3545GZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Framework Laptop 13 (AMD Ryzen 7040Series) also has an ALC 295 with
a disconnected or faulty headset mic presence detect.  This model has a
VID:PID of f111:0006.

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

