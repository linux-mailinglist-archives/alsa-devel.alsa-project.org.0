Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3D25F98BE
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 08:58:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60DAC1838;
	Mon, 10 Oct 2022 08:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60DAC1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665385100;
	bh=M6Na5zGiuEOZvUIKJoCD/eYdzAPsl3xXXq/4xFEGLRk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DXyhvZ4huZUJTZPih8DNz1vru1L9KsJgSk6icHIrSRW4+2N4AOQEs0lwo6G2xuAzX
	 pX3/WV2SWH3sxTum2gszvS3UQw9WqTdgiGKGUa6E34CiVFXGTyc9sy/rYmg7kaFjMG
	 HxDhssdn5xFochzH/P2FqYZFWzyudxwVXDS5W9XE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9836F8032B;
	Mon, 10 Oct 2022 08:57:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62AD9F80107; Mon, 10 Oct 2022 08:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AE72F80107
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 08:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE72F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev
 header.b="cykmAfvc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="k4XCxcZ/"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A46545C0046;
 Mon, 10 Oct 2022 02:57:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 10 Oct 2022 02:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1665385032; x=1665471432; bh=M0xz8gCJgFMguwuRajN2lHrq/
 yFlTQty3u4N0i9n68k=; b=cykmAfvcPf4z2BqZWNe8nzG0sRG9yNdZG8v62FH1r
 x2pyXKJ/YUOApcDHqJXyk0HFKNumH3mzKPorQhuUXqZWKV4j1w2LmYUt/BfW2v+n
 c4wmFJB9EiM/dLMkIGo3csJZjESImyVWoSZv2Nb4YAc/7EYgzgyqtVFilxTs70O0
 LqlsRbQLMQp2t2UIHBcKP1nva1s63PIFmwFw1Fxd+sw1mGDq7NFw26aBiLELY+NM
 ociyR9oa3fB8Udh+OV2avwJBufPx3iHO/O8x/DB8nplYusQdpj5ViAM0X8IazscP
 +bUxXEIxmlTE02AOq4pTm+5hch6Tbg9ZJ+BynIex8AYtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1665385032; x=1665471432; bh=M0xz8gCJgFMguwuRajN2lHrq/yFlTQty3u4
 N0i9n68k=; b=k4XCxcZ/mXsLg6iwnhXNGUej0MLb/wxvbVdTtdCQ/dF3b1zfxkW
 YqGYYxWNCKHQwg2Rj6TZQ2khcTZ+/z9NUmwcjD/5/Dq5rvZj10M+m72dxfMYhq7O
 sOCXh11j9qw5R8IMh1JWBkzQeaGu3/0f+E+qqpNX5WZUx3OdStDpYZx6vEJ3hqYW
 9YAVmo1edpdL+zsqSvEXEuDee2RTUtZ4QCARk1MIBBNAbfM7hXdX8ZJu24QtDsks
 v9dxYqfh7JzgCJ6Xet6Y39/C3zSULsToQNGZVbAEd0eHL4mYJoVdIkA+/mtGZJOm
 wekj3a+IHd3D8tpLfytVignaoJEOz41MyHg==
X-ME-Sender: <xms:SMJDY4Glo4zAvQRGYvCCa1O3JRgnz2IxTATd6XH73Z7OJLPvgW1sbQ>
 <xme:SMJDYxV6QaFnm64Okndx4r0ewb1GL3Yl37mOkc49SJNXt1rrKnxe584YS6jzszV0u
 sLOgSry8Idhz28gQnI>
X-ME-Received: <xmr:SMJDYyIxTDUkxMrjkmmL0sXj48beZfaikuz-u8ShR2cnPPlOkvZErEZhjNgi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejvddgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
 dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
 ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpefgudejtdfhuddukefffeekiefftd
 dtvdfhgeduudeuffeuhfefgfegfeetvedvgeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:SMJDY6Hj0DGMwPzKHi8qSxzvAMagE5x9mxAc7Oxen-KAzpyooAYNlw>
 <xmx:SMJDY-VVI5WOQDnbvpK1HSRwiVK6ek5b4z691qvQP9lqFtfWz6sDYw>
 <xmx:SMJDY9PsOYXxQo6VhgwWTPnTnXtZKgjr2MH4FCKk62Pwr5W2HOrjKA>
 <xmx:SMJDY7hay42e9qTIBZ5A3HSmB1XIjwM0zoHlRxPFhLdpXWmJ67EJoQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 02:57:08 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Fixes bc2c23549ccd ("ALSA: hda/realtek: Add pincfg for ASUS
 G533Z HP jack")
Date: Mon, 10 Oct 2022 19:57:02 +1300
Message-Id: <20221010065702.35190-1-luke@ljones.dev>
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

The initial fix for ASUS G533Z was based on faulty information. This
fixes the pincfg to values that have been verified with no existing
module options or other hacks enabled.

Enables headphone jack, and 5.1 surround.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bce82b834cec..24406f81da27 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8449,11 +8449,13 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC285_FIXUP_ASUS_G533Z_PINS] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
-			{ 0x14, 0x90170120 },
-			{ }
+				{ 0x14, 0x90170152 }, /* Speaker Surround Playback Switch */
+				{ 0x19, 0x03a19020 }, /* Mic Boost Volume */
+				{ 0x1a, 0x03a11c30 }, /* Mic Boost Volume */
+				{ 0x1e, 0x90170151 }, /* Rear jack, IN OUT EAPD Detect */
+				{ 0x21, 0x03211420 },
+				{ }
 		},
-		.chained = true,
-		.chain_id = ALC294_FIXUP_ASUS_G513_PINS,
 	},
 	[ALC294_FIXUP_ASUS_COEF_1B] = {
 		.type = HDA_FIXUP_VERBS,
-- 
2.37.3

