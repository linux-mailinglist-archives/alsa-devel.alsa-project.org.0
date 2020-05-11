Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 276691CCFBA
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 04:27:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BABE61607;
	Mon, 11 May 2020 04:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BABE61607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589164063;
	bh=dBBgZTfNQDaUnBAZHCDaVImKIVP0MIeYKGVvuXJcZjA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kbCSR+knKZlj4i/hWaremrmufWD3UwbdXp4ftwvUwQFywYmSuG6axgYjmqFphpnHH
	 2b8LwgzpLU7W1xDmLAN3pEQ7tWvdq8hMLJ7G7GYNh9EgQyCs24aiqNN/ycCsAlDWuE
	 hOxRtn30L5KMUguGAyh0Cd5b3MvTSQ4wSWKuu2dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 702ECF801F2;
	Mon, 11 May 2020 04:26:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD19BF80157; Mon, 11 May 2020 04:25:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8A8FF800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 04:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8A8FF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="wFW8un/C"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GhhOGIr5"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id B29825C0092;
 Sun, 10 May 2020 22:25:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 10 May 2020 22:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=H6xPRGcm8Wv/4aaDO7Dtt7yERf
 Jj8UndFlacXH+crqg=; b=wFW8un/CO/eT9JhFxvCVQxi3juvWaNqT31+VflG87D
 uJxyEMMyhoNuvMpYr+LRyGNrIrnNc32pTMGaaqG91km6Ehh90N45JvYzQDoCU2lS
 4AMI02w4qhwTFm0TruWuE9tHG+9j7eSgLX1fcoCmibdQVyenK8NDXwHQbdCW5H/9
 Ej2wboMbSlSO7VMN1sPgUwDLaY1fOe8Nqgp1x3qr9l66AeuN27IN7OnWNAjEp5TK
 sWF2T2/z708uzMoLmRRYc3Ss9Z6rXbksVZP4xOhsS/PgsgUVmaSqNWjicOo62FQG
 31452esib+OoZ8ejirMXPSAN827cpbI2Lt2s2sxYSBEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=H6xPRGcm8Wv/4aaDO
 7Dtt7yERfJj8UndFlacXH+crqg=; b=GhhOGIr5OVvrjgG6PofqGJOELz53xHF0b
 uhvp+285bXESWY7jd5FbTePFOSZW3s0W3+I6/Zo+aPKCtNgo0z1oxsx0ePvk9qgz
 LU6IqgDa9MOIFLXG3NqXfnTez6CGBTpNhxHompJEeHHUrnxuOadffFXBt5rBsJjY
 GmRTesgYAuUCtS51dipR40x4y0DDmuUzpMETaSLz90Q42cAQZwCo56pgZvhz2ees
 NC0oDx4zpgIfopTvUMq8FqQtWnqe51C+fPLNkmQM2wjnLATw+eDja/j7IlF5+xI1
 1ath3LOKfdgjERFtH8HPEvR1fIptXGirACef1XgTNqMmQJ1hUTKew==
X-ME-Sender: <xms:qLe4Xrb8wTf8Gmj9I6MwuQJMcwEaSMEJmonDMHlF-rc3gkkQx43rdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeelgdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtddtke
 fgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucfkphepudektddrvdef
 hedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:qLe4Xl3PnZx2CcgmrkwS6IhcAicTQZWsZQpg2LGGhwQrSfrhEFhUvQ>
 <xmx:qLe4Xhhu0xdxDiNsxYzdrhp4UJdSk-VTsP46JySflwUliZwznmkkVg>
 <xmx:qLe4XqqPFju2iOfZBHvgo5jRXvxmcH4BRiDjD_L9z2v0JS2FjogIlg>
 <xmx:qLe4XtcgWN4p-w8QrzZel_4hFa4qogkvv8xVt_TpQ4CyCeTMEsR0SA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 23F233280060;
 Sun, 10 May 2020 22:25:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: fulfill missing entries in Kconfig
Date: Mon, 11 May 2020 11:25:40 +0900
Message-Id: <20200511022540.161363-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

This is trivial commit but fulfill missing entries in Kconfig for devices
supported by ALSA firewire-motu driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index f7ed69d60310..25778765cbfe 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -150,8 +150,12 @@ config SND_FIREWIRE_MOTU
 	 Say Y here to enable support for FireWire devices which MOTU produced:
 	  * 828mk2
 	  * Traveler
-	  * 828mk3
+	  * Ultralite
+	  * 8pre
+	  * 828mk3 (FireWire only)
+	  * 828mk3 (Hybrid)
 	  * Audio Express
+	  * 4pre
 
 	 To compile this driver as a module, choose M here: the module
 	 will be called snd-firewire-motu.
-- 
2.25.1

