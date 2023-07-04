Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D00746875
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 06:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CA84850;
	Tue,  4 Jul 2023 06:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CA84850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688446181;
	bh=h3DZEPQSwdjsC+JXfXKVpDGDkg/Hg3q4noO0O99uNBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=suLPUngFAmxICj86wQZyOBfknz+Jkq/FGfsmH7GAdemlAbh6ZqmL4yrv3sBQQuqTn
	 DDlOhbcaOantZJj+tDJl7UyFkq1GWPbuuLICj/jNPARxI4beV17mSmUJKzmA97TgQB
	 8x+kLk+e/yxVB7CExy/pCia/jqz4u7r85drrTSMo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 592C1F8055C; Tue,  4 Jul 2023 06:48:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21AF0F80551;
	Tue,  4 Jul 2023 06:48:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8676DF8025F; Tue,  4 Jul 2023 06:46:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D39BCF80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 06:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D39BCF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm3 header.b=ksdY+n9Y;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mpfnWq1F
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id CA80D5C017E;
	Tue,  4 Jul 2023 00:46:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 04 Jul 2023 00:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1688445995; x=
	1688532395; bh=QP/VA6mshWZb0nRbRHngozKWeUQwurv7rryVbtBvaJk=; b=k
	sdY+n9YsdQfmyAMuzSRAanP523LZF0mkJll4HX3OtbUdpNmvtjy6/f3n929O4bgp
	jEPo/B86avWp0XZh4189KxQ9jyPcMET9xioVpnYBQbADybkK8gU2YJgL30wlacyi
	FiVVqepCB+trI9+4cA5xZbYDg0igE504+ZRYyTHKWGMZTau3OYhvV/wOHVUk8F4o
	9gMBH5C+a8YzJKICf6KPHINZFdw3UlcEvwl1Cjh5vpqSEFTsb6rCQl6y+Mk0Olyk
	D1IuXLquZp77AJ9zj7tL77UmlHDKDLx1dawqkCmj69RZ4nMe4iy58khrxHHehoww
	6/vdpWBInz9O2K41lY4Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1688445995; x=
	1688532395; bh=QP/VA6mshWZb0nRbRHngozKWeUQwurv7rryVbtBvaJk=; b=m
	pfnWq1Fck0yClA5YWbHivSIrmtsKVLh8XVKaNK7AU5YHv3XuGkP7m3uZow2H0gyf
	v1PmOvdTW0ZCf+b0am63/Ecqc4JTDSaBw1YcO1GFXkKDElAJZvJk5bS/1X/2MaTy
	PhHaSAcFkv9n1GhCD9ZyuxD3HtIwywGDZLbfK1SrVHGD7CJWgDsmqTjPLmVPUbR3
	r/ftz04FCaW5ZeW3U9f/PJOAJyrIT9gJapA0QW6gSP8vfHFj7hPeJagylbiOVPTI
	Qy6ORclnMe5t9m+rQPhKAhTVEyWXIqCUcgquzLNQX5ufKIddgBDzK+ygHI2K1iJM
	bj9oZ/xYApsy+y2+EN3WA==
X-ME-Sender: <xms:K6SjZAxcca5MZ-7U7sZK5V7TdgYL4EElaPJDK6FKS7nfID4T-Q6aBg>
    <xme:K6SjZEQV_akAHTbPQMEEBi7uu161Wt75sm3Sek-mhXk6TQ4-5QEgIVPU4W3mmbs4T
    xPB2yUY1X6lUVMNzCw>
X-ME-Received: 
 <xmr:K6SjZCV-7UtSijRwC9Of_PR5YfE4S-KQAdDq7eULJQUos6kQqWEwbjM8hrVf>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudefgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugf
    fgleeltedvveethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:K6SjZOhfc1j3w4FdyapxQv9N2PA5FpnyXr-Imm3adSsu8y4Gmq0shA>
    <xmx:K6SjZCAKbidM6Ro3irx2RS1xy4e2MthT7vTlTrYT4DbBKZzpWb2OLw>
    <xmx:K6SjZPKrWT24YZWN-aaKq_77hRvOd_VCz1_1tXZwxKsFvhPUfynPKg>
    <xmx:K6SjZDKfWi_Q32czh6hxTpgtmwT9zYrvfbcx1L7TGWfVvQa33IxkyQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jul 2023 00:46:31 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Cc: perex@perex.cz,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	tcrawford@system76.com,
	tangmeng@uniontech.com,
	p.jungkamp@gmx.net,
	kasper93@gmail.com,
	ruinairas1992@gmail.com,
	yangyuchi66@gmail.com,
	yangyingliang@huawei.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v2 1/5] ALSA: hda/realtek: Add quirk for ASUS ROG GX650P
Date: Tue,  4 Jul 2023 16:46:15 +1200
Message-ID: <20230704044619.19343-2-luke@ljones.dev>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704044619.19343-1-luke@ljones.dev>
References: <20230704044619.19343-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LFIXIBNJ7W7DTEQJDDJSHEQ4SRV63XGD
X-Message-ID-Hash: LFIXIBNJ7W7DTEQJDDJSHEQ4SRV63XGD
X-MailFrom: luke@ljones.dev
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFIXIBNJ7W7DTEQJDDJSHEQ4SRV63XGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds the required quirk to enable the Cirrus amp and correct pins
on the ASUS ROG GV601V series which uses an I2C connected Cirrus amp.

While this works if the related _DSD properties are made available, these
aren't included in the ACPI of these laptops (yet).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index afe8253f9a4f..b41fdf22157c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7068,6 +7068,8 @@ enum {
 	ALC285_FIXUP_SPEAKER2_TO_DAC1,
 	ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1,
 	ALC285_FIXUP_ASUS_HEADSET_MIC,
+	ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1,
+	ALC285_FIXUP_ASUS_I2C_HEADSET_MIC,
 	ALC280_FIXUP_HP_HEADSET_MIC,
 	ALC221_FIXUP_HP_FRONT_MIC,
 	ALC292_FIXUP_TPT460,
@@ -8058,6 +8060,22 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1
 	},
+	[ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_CS35L41_I2C_2
+	},
+	[ALC285_FIXUP_ASUS_I2C_HEADSET_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 },
+			{ 0x1b, 0x03a11c30 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1
+	},
 	[ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -9573,6 +9591,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
+	SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650P", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MIC),
-- 
2.41.0

