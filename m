Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B47C746879
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 06:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DFA186F;
	Tue,  4 Jul 2023 06:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DFA186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688446209;
	bh=skTkvuQKAgSmn7QG46Dqtlze/kPeUFTFlTnnsiPs4F0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ATV2M3f75pJy3ZQXsF7Bvt5H9qTizP3NUXmw1ThAEv+WYlrDZ4Q7XA9okzWDg8dhW
	 a1ZoS311z8NEiVOwD0UQSqpoPTN2qfbSWzeVgpaQW9G+/m41TA9T/pruOTP6qRdU1F
	 rJ5BQ9/Ret209du8/lk7nxrT0BPnPu37dmNqghw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5D9FF80588; Tue,  4 Jul 2023 06:48:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C034F8057E;
	Tue,  4 Jul 2023 06:48:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AF41F80125; Tue,  4 Jul 2023 06:46:53 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F8A3F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 06:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F8A3F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm3 header.b=Ql2fXgnd;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fDVYWvV7
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 3CDC55C028C;
	Tue,  4 Jul 2023 00:46:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 04 Jul 2023 00:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1688446009; x=
	1688532409; bh=qtNU07zM4dIX81fMsjLGpYDh19Y5tjgNSmmLajH29Pg=; b=Q
	l2fXgndMPIBD89DD8OgEBTDupan7Pswoh3VnLimZ8x9AWo4PcY4TZrZVZoBMnLTq
	FDC9R4Uy66HGBVJQD8OnNgC/EsxOTjQBz+8SXEmD5ylhM6oXMNfM5cKWdSpUa3TE
	kfEuWtPta+fPjUQW7vfRWJYC+AA7kMLiKxckua/vrI5G1yebZwcQQjEmIDFXU3vN
	72QICvZdRcG/vsa/FtS1i/pChgXvB2LuCwhHB2ZBHGFk8NkR7hPoFIEXW5j5xQQ0
	pAQ15DYaSQNIo36/JACfLMBFAPj8nTcEygtKSmZdWUhLyuTvlqFnosPTrwccgszy
	rDruiQNnPbuEFuWilnh+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1688446009; x=
	1688532409; bh=qtNU07zM4dIX81fMsjLGpYDh19Y5tjgNSmmLajH29Pg=; b=f
	DVYWvV7j41dXVsOTcwihvIcVarkN0CDIXuzS2kQcLnlmI8RtSDh8MorF/CU9V4yg
	BZdI7sGMrd/WWx+SQ8qNvSgG4lUdYTJK5kqVE3an6qXQjHzrTRekKEvS60sxBSIP
	8fXV+QFVnrCmQNdQWAaWyYdH3d95nFwOz+EiQ5LFWB22YVDoEWwcXkzexAKBOEPi
	HIWbKjbY+3QUu7hKD88lFMjvQlXKV2tmXNxQk6q1P0lL8lE6zfmutl2XLmEuyHYA
	d8QDljlt1lqUJXaETjyIfIe9ozz/hdOYrnOcUEAR7oGJZxmQuwvDHh9QoYJjwraj
	ZVXfAQaQlHC6WJDGTlqVQ==
X-ME-Sender: <xms:OaSjZJgRQ7XhlwewqQnz2BJmqpO23Z_SuMSCXAfyIWF5WeWM9ysPrA>
    <xme:OaSjZOApc7_XHxD88NfuEOLzfX8yJF2SEI-tCJAiNNvIpz57iSWGW6WH-OScLaHiR
    s18WfVWZDNzl84sXLk>
X-ME-Received: 
 <xmr:OaSjZJFsiM3DjCN1-dRQgGg21d6H2GEy4doq2dPw5qtmrV0MuvMlKLTi2kRg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudefgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugf
    fgleeltedvveethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:OaSjZOTrLy2KYmqMcYpEN9U1tS4TYfb7HGDZXxYe1_KrSphXUCLUIg>
    <xmx:OaSjZGwMyrX0MH2ZyJEUz6iHT8-zk-kWU5FeKH8a3xumlIP53ZJhhg>
    <xmx:OaSjZE7uporj4XISVnOvm-YSRwdwN7M2qxbmA6DPss0hwlwCqyZEXQ>
    <xmx:OaSjZI4wLfz2fZAG8zx6E5EoPqWHpYSlgjyyF2XfNvgf-CVe7gwHLg>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jul 2023 00:46:44 -0400 (EDT)
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
Subject: [PATCH v2 4/5] ALSA: hda/realtek: Add quirk for ASUS ROG G614Jx
Date: Tue,  4 Jul 2023 16:46:18 +1200
Message-ID: <20230704044619.19343-5-luke@ljones.dev>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704044619.19343-1-luke@ljones.dev>
References: <20230704044619.19343-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WJOZU2B4TZBCUW264CB2GPJYVPBP2NZD
X-Message-ID-Hash: WJOZU2B4TZBCUW264CB2GPJYVPBP2NZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJOZU2B4TZBCUW264CB2GPJYVPBP2NZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds the required quirk to enable the Cirrus amp and correct pins
on the ASUS ROG G614J series which uses an SPI connected Cirrus amp.

While this works if the related _DSD properties are made available, these
aren't included in the ACPI of these laptops (yet).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 50becdc86daa..ba3c113f0be1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9632,6 +9632,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1c23, "Asus X55U", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
+	SND_PCI_QUIRK(0x1043, 0x1c9f, "ASUS G614JI", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1caf, "ASUS G634JYR/JZR", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
 	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
-- 
2.41.0

