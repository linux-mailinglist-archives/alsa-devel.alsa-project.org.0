Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7291E5F9902
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 09:05:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A9AC1652;
	Mon, 10 Oct 2022 09:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A9AC1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665385518;
	bh=swsXyiZMej1bmt0gRYrCgGl/2EBAqzuOT5AGP3tXFQU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n3oJM6GJW0YXcPxIwVHDVnOWTABYdMMnw1/5Q9Ycv0wEZtqpV6aNq5LoAk2qaNuYK
	 tlGQrshHjbqzrKGLPp7pSVf4xsrcoqXC8u/kiHJ76XojMAzPT0ZjaSDp3WoBShq+Yw
	 5QupP35HONSsfAZPKqLSyooieFS8JklU84kPL6+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA9EEF8032B;
	Mon, 10 Oct 2022 09:04:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 514D1F80107; Mon, 10 Oct 2022 09:04:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE532F80107
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 09:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE532F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev
 header.b="ipZmpqFb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HynA1yT7"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B32E5C00D7;
 Mon, 10 Oct 2022 03:04:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 10 Oct 2022 03:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1665385448; x=1665471848; bh=jr/yrDrSj6WhzrDOCLLva7Gql
 0cAfGglhZZtqKViZwk=; b=ipZmpqFbboo8JPmqzwOv679nDMC68l9ItOktHU7o7
 9NdGluL2TtJ2OvCzXUvNtIXldSMfe9lXPi7oDLiA03SNIGNFH7UkfM/zgC4y88dP
 ybuFD6jjYJW7nOsTKzHvq/G4fvuQmx5Dc1ugbDr08+I4PBSaDPxSdRG4Z6HvyCuV
 trZxdIrw4ZeW+HdUBix5Ka7e3WjpP19GdzBPfXWPZfbUn1Spht84Tr8tOLVrtHS1
 fwmzdjOJuqVECT5w42bG46CUtrzsLegOvHfcKAfd+PqymOD6LBihiPnERCL0s/ah
 rg50tz7obKXLbqZVTGvIwoyhbs5nOU4dnxWMgzCSOz/Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1665385448; x=1665471848; bh=jr/yrDrSj6WhzrDOCLLva7Gql0cAfGglhZZ
 tqKViZwk=; b=HynA1yT7x4gi6h/VTUnjaiCCgG3bkNm5Q6PBEjkFy7Fkk2cYVPP
 ObOtkPZV0WpIj+HmC6i4G/sGruW1IckEOXWLnLGWGlg3vmODy9P93r4QmUTvSvWQ
 e+8ixQQv6bxGfyikxbK4Lb2IMSYpUbXIXVxVCWlFFi9OQjTaDZ2a7FJFvMVSvkeA
 odLMn+mxEyxBEr16SYhhzj+AJVwBY3aKbHqkw83kMtBEdcOOkEdp4RA1xu3uFYSV
 Rtjm66502vHSUIa5cEFmSTF2ji6UyfeVO/Y9837Wn0GCEoAwo70Ie+R0Zqe3wB7/
 WKYa0vFL2QLlcvExeZty9hwNEmGO6OvOTIg==
X-ME-Sender: <xms:58NDY7NMJPpvFvoEcYFS5byrEHtqk13yy5ss91SgUCu9g64VaefSyg>
 <xme:58NDY1-WV1Vb2psYgsWTXJFnezT93HwhkPLJjgq529ITJOISitmkHBtu4ZkaM45EJ
 mWSEfHINaH5plqnAxA>
X-ME-Received: <xmr:58NDY6S4WAAM3MAb-iJ7duk4B_OdKzvdjMVtut8u6mm1qVE5-lOBmfAV3XCp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejfedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
 nhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfdujedthfduudekffefkeeiffdttd
 dvhfegudduueffuefhfefggeefteevvdegnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:58NDY_thvY9PVEYr3jAJMmrlKdafWqwpmsrzmWsptCt5iaMWTTIcEA>
 <xmx:58NDYzf-UZOpuiwzKyzlFP1eKKBGHX0VbmLgyp9Ku4GYNkedDhxkWw>
 <xmx:58NDY71D6fGEKsE7TpRIiTWKuWoti5NSESkuj1hRpW8Xx56CXAk4ow>
 <xmx:6MNDY0r7M47rU4YPNwDjAMdtlhmUqfctyu1fUSN97c_nMoyN6Ac5uQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 03:04:04 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Subject: [PATCH]  ALSA: hda/realtek: Add quirk for ASUS GV601R laptop
Date: Mon, 10 Oct 2022 20:03:47 +1300
Message-Id: <20221010070347.36883-1-luke@ljones.dev>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, "Luke D. Jones" <luke@ljones.dev>,
 tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The ASUS ROG X16 (GV601R) series laptop has the same node-to-DAC pairs
as early models and the G14, this includes bass speakers which are by
default mapped incorrectly to the 0x06 node.

Add a quirk to use the same DAC pairs as the G14.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bce82b834cec..1ffea762ba57 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9422,6 +9422,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1c52, "ASUS Zephyrus G15 2022", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
+	SND_PCI_QUIRK(0x1043, 0x1f92, "ASUS ROG Flow X16", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
 	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x834a, "ASUS S101", ALC269_FIXUP_STEREO_DMIC),
-- 
2.37.3

