Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23831160B2F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:55:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6BBE16BE;
	Mon, 17 Feb 2020 07:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6BBE16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922508;
	bh=jp/ID6J+f8h4cqjeS9s0ndLa9SxAH0vGvnLIgsc5ysc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bneN+6GorOYS4xvnKTd5uy5YuUWNTYbKJEN0g4+JfaJltnEdn9FGs6fXeMxuUZB5k
	 Tz04KovTSkRF3y4qw8hPfUeU76e/F0GJYz1JMfGBROY+WrC4Bp397h1+pO14h2yzTA
	 mbNexp5HwwDhckA8bxzTju7DU61KOKDVfsePlxYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D4CF80334;
	Mon, 17 Feb 2020 07:44:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6520FF802FB; Mon, 17 Feb 2020 07:43:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3ADDF8028E
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3ADDF8028E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="muGhFo1e"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="22Y80l+Q"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C5F0C51E0;
 Mon, 17 Feb 2020 01:43:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3lDAjzOIj+9xl
 0Uviyyg4YICTqjd5DlgZCmlDUQ+E0U=; b=muGhFo1eJt2pej7+zET/+0V+tEhsk
 MuVyrWdcsln5GkdE/PLf/tgcU/CebUwLDeiAjUBaaLbWOi4OVPrGASDdJuvgUj5S
 u3wzagc5P/nm3t/tC6XdwZlQad3TJUD1k/1623eqGYIw1w++XKeXVvYQGWGjLidT
 VMf+x9IoYcUELe5d3v5BwUr/sgvmLqc4ZBSXQKXDBzkovGH57M9T2A7/WMp/eYVb
 rK5GgqA4ILWDLTXRjGjld/B5GppeDdMjAJXZ1B0KvM/chgY7P+FsaNNhKvqg5s79
 7Mm/4PzGgspiBWK150QU8u7IjCxBsJckWAAu25WvTTSRIM3JxR/3tzPSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3lDAjzOIj+9xl0Uviyyg4YICTqjd5DlgZCmlDUQ+E0U=; b=22Y80l+Q
 E0uwP3twi0LKdVtRVWQ49nfiYYHvVfLQzkhLX8D7T09hSqfMq87I414dcAJPyZiQ
 N79w1AeHRPj+ahC1DR81tMUlrzPkWUzdlzIi8MfrmCYcn2wPaaJ1g2IGgwlD5NRM
 vSs7NeMR+FmXAzhSBr/ooUBD+H2ix7ZjZLyCQCeflyhKTQ7YQ4WqESMUq8LCwQbH
 55yiSj2okBaSe+imPd59B/Wn1Q7Drqn2TuJG5OMT36Vj6L3NRZYhxmgguwYw4Dch
 nYIubWoLRcdTbltLxeQbKxIl5lC1Crnx5YKCm2v2qjhcguqG9e7Ec4aGkrPkBFF+
 v+01DFcTmnIZoQ==
X-ME-Sender: <xms:9TVKXk3qxGth5nybN9EX70iuIOHgtOLf6Mu95OY65LG1bkoQWvz1pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:9TVKXuzF3Mi1YJsdi1u6pdJ-n7oSC5M_td8BL3y1Jiwptqfm50UlAw>
 <xmx:9TVKXnuTPFDSFpTgS2uu5PVuHHtw7kFUW_hDFUizCWAMvgBZQElCng>
 <xmx:9TVKXgQJAFSfshpb0Jx1uWNqntb_7IkTnwGmeHnotgwYRz-537wuhg>
 <xmx:9TVKXoGc2jg4pO8XJ-cMKCgUVVNw67m8V9DvwhzxkRN1Ffvmoz8_Xg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 117C13280059;
 Mon, 17 Feb 2020 01:43:01 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:33 -0600
Message-Id: <20200217064250.15516-18-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 17/34] ASoC: sun8i-codec: Sort masks in a
	consistent order
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

All other definitions are sorted from largest to smallest bit number.
This makes the AIF1CLK_CTRL mask constants consistent with them.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 559dec719956..36ce281286b5 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -81,10 +81,10 @@
 
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
-#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
-#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
-#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
+#define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
+#define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
+#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
 
 #define SUN8I_AIF_PCM_RATES (SNDRV_PCM_RATE_8000_48000|\
 			     SNDRV_PCM_RATE_96000|\
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
