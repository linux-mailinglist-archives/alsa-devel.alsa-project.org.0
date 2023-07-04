Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9530746876
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 06:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D92B83E;
	Tue,  4 Jul 2023 06:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D92B83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688446178;
	bh=ApQyFk2s0Bg+yrkqLfCo0n7pQ0TVxCc+OMnTsscHJwc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AIOxqa7259b9jZEODfENkYIobuHKB9leOgnFDhB8Ez8sFXnH3gKnqy8/Vx7dv39yU
	 WnEi42jvLs0HbImaXPkKpWA7tdkIJ7z9XzGF4bO6HJyji9ra2cruPdUTyO1nw+lZp+
	 tEa79ksOBY6E21Ieljurpu5DcmfVpgkgh6703Z9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA94DF80549; Tue,  4 Jul 2023 06:47:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6CD9F80548;
	Tue,  4 Jul 2023 06:47:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2986FF80132; Tue,  4 Jul 2023 06:46:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8374DF80125
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 06:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8374DF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm3 header.b=CV9MwZB/;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Q5OnB1sc
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 420E05C029C;
	Tue,  4 Jul 2023 00:46:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 04 Jul 2023 00:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1688446000; x=
	1688532400; bh=lf7BG57d2imwAdxEp17ZgL+r8ob/5wcVGgce8xMXLs0=; b=C
	V9MwZB/AEmoEeVLMi1tWuoGUZARof18lBVyf93g0v/LRuXNudWh8om4HGPr530O1
	1O194cS1QmVFQAW8rSPe9tHo3cpJHAqP4jKM9NKtZq3YzhcmTh5qnG0jB7QO8WjY
	zx0qza+4NLGxyv2pAj4I17TAylXSTWi285o0SkABS+AJAda6YbxhLdeWfDymnV9C
	xhRmjogf/VGSINvJcQXIwf6LkOrsfsTgMNAgNAt1DHwPPGyFqh7wYkNlAWUskCIY
	5/0oC0qdSi6tJpPMv8B0kPFYe0y3k0B2YZrznRBdXh/A9LuNAI9lr96T91vIu8OA
	lmIFJKXbS2ZfLrbUi5XoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1688446000; x=
	1688532400; bh=lf7BG57d2imwAdxEp17ZgL+r8ob/5wcVGgce8xMXLs0=; b=Q
	5OnB1sczXB2csbLnAdMhz0lsvH/2oenF76iVgNODu7/T4PAgDU8Zfbx8JTdxkNDm
	x9SKQ8NlyG2Y2ZVLLW7/H93/6tUss+zwJkEsDl8pj2aiKztTBI2wPgy5v/MviRwz
	K18o5CYzikutqL67Y2h4wGZWq05CaA64l3Tw/qsRtvd5ZvbKvDjPyAdo3faF0HMS
	4b7aKxapmoF71uccu3UhnTgDmVTv+VwJLTJULgLlE0fbtp82so+h83dK5QNRThtm
	BSzp2eCEGoe+3gzvGwxL9Omj4Yl7hflFxUOt45lpnMkUdyUlTXb8bCyGBICIPGMj
	HFSmRzwU8qEQuN++u2kuA==
X-ME-Sender: <xms:MKSjZJOSifmdfX-Qxymq04cVc7hazcpl0X1VhmQ4CBSiqWI-GCwaXA>
    <xme:MKSjZL-WvbpqPtrOQw6APCndFdN-5sTX7yF16hL1vFYgDTwHIKxRuOybW2eC0KzAL
    r0hswcNi2P1ypXq7LA>
X-ME-Received: 
 <xmr:MKSjZIQhnWkk37j_eFh7Q-GMUc7bKr6T8N8m5Fge49phDRXEtZ0U-HGv-XgF>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudefgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugf
    fgleeltedvveethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedunecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:MKSjZFtJl8Yvd3vUxhW0IvXVZrkkzm2o-IPtoBUVjpsuTmfLgX9KqQ>
    <xmx:MKSjZBfCeUA5biQRBMYswfGasgMTOB8lNiUPfhqXwFyC5KevVTzYJA>
    <xmx:MKSjZB3qUjhL4QTLbO0fUN8c6vluxgLzygjvchNBoldFwJbgPz4TIA>
    <xmx:MKSjZB2-mya9SnioswtcFa2_qHe9VvO6zCDbm3A0n51mHi6jjK8wCQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jul 2023 00:46:36 -0400 (EDT)
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
Subject: [PATCH v2 2/5] ALSA: hda/realtek: Add quirk for ASUS ROG GA402X
Date: Tue,  4 Jul 2023 16:46:16 +1200
Message-ID: <20230704044619.19343-3-luke@ljones.dev>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704044619.19343-1-luke@ljones.dev>
References: <20230704044619.19343-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6ZXSLYN45BSHWDVQFLBSRQVLJEWONFHI
X-Message-ID-Hash: 6ZXSLYN45BSHWDVQFLBSRQVLJEWONFHI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZXSLYN45BSHWDVQFLBSRQVLJEWONFHI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds the required quirk to enable the Cirrus amp and correct pins
on the ASUS ROG GA402X series which uses an I2C connected Cirrus amp.

While this works if the related _DSD properties are made available, these
aren't included in the ACPI of these laptops (yet).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b41fdf22157c..1fae8e8b1234 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9592,6 +9592,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650P", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1463, "Asus GA402X", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MIC),
-- 
2.41.0

