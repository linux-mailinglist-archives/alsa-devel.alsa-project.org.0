Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4683A571C
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Jun 2021 10:28:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42B4817A2;
	Sun, 13 Jun 2021 10:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42B4817A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623572887;
	bh=8Nf+MoB67YLM339eveBbAIFeOyjoBjOj4Vu11TXvulI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t/mV+Y+qJq2HO2bx7lIiNvqfOa1maeBKgGUwmTzDEJRr2ipBQ55ZE3tur7hWLfc4j
	 c28icsPbDufXfiLclCcLj6V+IBqXFrE4G6t2pAdBNOeOFBE2r6r5j2mf+lLG7HwTVa
	 U3MBfKNFBpFHzAXg6S1YT3X/fXG/qXilU5QnZHko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4362F800F7;
	Sun, 13 Jun 2021 10:26:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5F43F80165; Sun, 13 Jun 2021 10:26:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 259DFF800F8
 for <alsa-devel@alsa-project.org>; Sun, 13 Jun 2021 10:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 259DFF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="s1g3K7g6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="eFyVReI8"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1EB205C00C6;
 Sun, 13 Jun 2021 04:26:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 13 Jun 2021 04:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=tWgOY1fGTLtpGjqGqxjoiKe2f7
 InC3YOTDsV88IIhz0=; b=s1g3K7g6Gme37Aw/UqJZPeS1t3cSOJaCsz03eNKyCo
 n+Q4mp0WR/PJwJK7apHrJWEnhe4uhVbEPGRuX7+MFLvFdaJ0RtvpeRsIN1pQlpzK
 TTGAMoNzOXxVQsgk8DOxg4vcFzfrk2z1DxegSqlNvzzMF41KsGIY16b38EDD2SvZ
 nNBZ9NSvMdOMLumpEI9jEztui/jXPs26Th784ts6rK9Bzcexb1/n5oDzpFG7L+Gb
 9/pQNporEJdLQwOpmB7XYFrRJVuFmVvQ6jSPLPINkVWnVgAv8CLWSmygaBm9f6sl
 aYJev/zfVt62eGcXbU+hUmA18vilC7tkhSurvUad8YXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tWgOY1fGTLtpGjqGq
 xjoiKe2f7InC3YOTDsV88IIhz0=; b=eFyVReI8C3V8wmD47sRgDOVFwdPXtrS+G
 6vEcq6PQOuKEut1DkTnNuzpOQ3fDzh9QUDFlUI8yt0VvQU8T9EtuvofKUY7XHWPS
 9rWXnVb2BML75Vpix+1ryf8D5/j/lGLO1MrClfsw9RvXKOI9WACdA3FeqsgOH3cT
 PdZYrW+bNdLGK+TqV64zdKTGzEYdQwar3qkw0WmS3TZGAop/RgmcWdW2PvZygEPR
 puZIjbhIDsq7IepSlfMrCV5iiVMhj6vSHKX2wwpNHb8JUGZb6hqphdnGj+rbiNuf
 YVr5KM117QtkaPvnNgzpHLvn+cfI3gKMXE0lUsfwlUADtX/33e9sg==
X-ME-Sender: <xms:MsHFYNxNyIY--HUQGv18F26v3vAp2fzHrx3CyCd_qhQC1LiIEV74_w>
 <xme:MsHFYNTqAjALijonAJMeKdLo0M1wzHqEYEWrvRuxg2wW16fVqho9LqYStVweQr4mI
 nxzOA_-1uQ9rXrzTsg>
X-ME-Received: <xmr:MsHFYHXMCFuTJPvVznWblpN_OD4Wq-3PU7o0lxDixkEb6cSfW7eS-91GcYIjNWIxuwtlyHDB-Cp4oFnKvTC0FfiBAM9t8t_YDLF5DW92SrDjIzmEfDG->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvfedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:MsHFYPiXL-GKSLgMuquLY7kUZFjhpFVeTkQDQs2skAA0vI0H17LqkA>
 <xmx:MsHFYPBIsAhzpAkevsCDV23LDncuehs3m11__0yeWKT7PokS37EsEw>
 <xmx:MsHFYIJKvfKHKVf41rHvUMTNoQLHQFR6emuULJhEthBWELVoLIfGZw>
 <xmx:M8HFYE6qtLBYPg-Rzg3qBE6j_MotB5Uto3ywDIZE2SOt5LVOcyONVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Jun 2021 04:26:24 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire: fill Kconfig with entries for devices based
 on DICE ASICs
Date: Sun, 13 Jun 2021 17:26:21 +0900
Message-Id: <20210613082621.10900-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Nowadays a lot of devices are supported by ALSA dice driver. This commit
fills Kconfig with entries for them.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index fc6858131b59..a08a0dbfc951 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -18,8 +18,25 @@ config SND_DICE
 	select SND_HWDEP
 	select SND_FIREWIRE_LIB
 	help
-	  Say Y here to include support for many DACs based on the DICE
-	  chip family (DICE-II/Jr/Mini) which TC Applied Technologies produces.
+	  Say Y here to include support for devices based on the DICE chip family
+	  (DICE-II/TCD2210(Mini)/TCD2220(Jr.)) which TC Applied Technologies (TCAT) produced.
+	   * Allen and Heath Zed R16
+	   * Alesis iO 14/26 FireWire, MasterControl, MultiMix 8/12/16 FireWire
+	   * Avid Mbox 3 Pro
+	   * FlexRadio Systems FLEX-3000, FLEX-5000
+	   * Focusrite Liquid Saffire 56
+	   * Focusrite Saffire Pro 14, Pro 24, Pro 24 DSP, Pro 26, Pro 40(TCD2220)
+	   * Harman Music Group Lexicon I-ONIX FW810S
+	   * Loud Technologies Mackie Onyx Blackbird, Onyx 820i/1220i/1620i/1640i (latter models)
+	   * M-Audio ProFire 610/2626
+	   * Mytek Stereo192-DSD DAC
+	   * Midas Klark Teknik VeniceF series
+	   * PreSonus FireStudio, FireStudio Mobile, FireStudio Project, FireStudio Tube
+	   * PreSonus StudioLive 16.4.2, 16.0.2, 24.4.2, 32.4.2
+	   * Solid State Logic Duende Classic, Duende Mini
+	   * TC Electronic Studio Konnekt 48, Konnekt 24D, Konnekt Live, Impact Twin
+	   * TC Electronic Digital Konnekt x32, Desktop Konnekt 6
+	   * Weiss Engineering ADC2, Vesta, Minerva, AFI1, DAC1, INT202, DAC202
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-dice.
-- 
2.30.2

