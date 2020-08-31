Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1984325727E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 05:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3A231844;
	Mon, 31 Aug 2020 05:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3A231844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598846110;
	bh=oQ64RIdJL5r09WTlG5sbrMkh/pNK6op+Z4u5uo1YWM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ShCpDxLLos7Z4DTTdCqW0eVugSehzG8FTdcRjwBtGAsX3KUejk4Fi9pb3gN+5dSGI
	 qrMrv31uOVAqab8aX2Kt9VgmMn8QgiINH12IwI95YNqiZzVYkgdHlp13VQsYYYHdz9
	 vqWfjsolv3wJ4HkVyHBFomGdK5dURwkKWGqAtlHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14AF6F802FF;
	Mon, 31 Aug 2020 05:49:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2FB7F802DB; Mon, 31 Aug 2020 05:49:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D7CDF802A1
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 05:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D7CDF802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="LiyCbH3Y"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="c5uHtCGS"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B55BD58055D;
 Sun, 30 Aug 2020 23:48:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 30 Aug 2020 23:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=IZc2IStvr+AnR
 7eauS4CeBaKA3UMEQWja2HUN/Gwnuk=; b=LiyCbH3YYEvxEnMZgbuR9NAgF1dq7
 f4ZxGdQ6McOGgY/irALiEv7N9OAw+6zgCI5zr4b/xtOs6vBReFk+jOGFHl4+Fo7f
 B2TpXN7pFpRP48/r3bHXaXrwJUyFTXWA6/JaDVbaXJdd9MbDKpC3KqclPXJ84O5G
 ypY3M6Rrwzjlzs+P2xe0NzCR9UOeMzc+DhBUM1yn6toz+BqMBxWmq0ZxxxIvKl/5
 EhqsaFBDEQZ9dafSEMVMpUO/vZc1NgJ1cXZRZArYRoJD/4GW13kJaCDA5+idltOQ
 5z6dfZ6nkYaqMl1ZS3x77bQ7NhdW79UQc3hXdr/AoAtE93s6EVV6QMBLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=IZc2IStvr+AnR7eauS4CeBaKA3UMEQWja2HUN/Gwnuk=; b=c5uHtCGS
 rnLqnXnjwuA766oPIi3d/Nu8GNOW2PW6O+lpkcu4IiNGRTGWFbBcf+TqKRTHWgbh
 Ey+hrpZARrOJUwGez4SkkHFSyxdvKg1PXlitRPgffcXL0+rxVxKv14ydgAB64+az
 k0g8Xj9CCGYcXDKTUkNu0mn7tVynCHYuvIANr0FRFMIlVXUbSj1RCJymTi8xZtCW
 OhuP1hkVqDuuRS+7HYn1FMD9zCWaqrTUODRf2qWEWdgaoucahXKZuzwBo0J4VXyr
 zSbwpU00nUwynyWEBnpNha1mnVaDnuO9aCERLL30O2Lu0iNb5hx3HXhK7DyBGPyf
 LF3t4ZzqOLaTUw==
X-ME-Sender: <xms:KXNMX2QhieCG8GV0bOl8O_qm72Y1-_KrNpnozTCyQO1rv0cwLQ80wQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:KXNMX7wriZbvv7elfYlTelNYz7CmFF82LbcSFdogI3XkZuFIviIq5Q>
 <xmx:KXNMXz3fYqZyyrb6wYSvgXCBnyX8S99MUsR_EAfXg-LcbNkCnT9slg>
 <xmx:KXNMXyBHyaO_OsmrCJlKCX1kR3wzUNnbvyDn_SzBBqRVvjZbGlZOAw>
 <xmx:KXNMX_gcxY5kO-R8RYkKaiSNMguX43Deesgw7Tnb2VlB_IGRrz56_g>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2601C328005D;
 Sun, 30 Aug 2020 23:48:57 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 7/9] ASoC: sun8i-codec: Sort masks in a consistent order
Date: Sun, 30 Aug 2020 22:48:50 -0500
Message-Id: <20200831034852.18841-8-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200831034852.18841-1-samuel@sholland.org>
References: <20200831034852.18841-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
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

All other definitions are sorted from largest to smallest bit number.
This makes the AIF1CLK_CTRL mask constants consistent with them.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 62d4b1b44e76..c25cdd3f3057 100644
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
 
 struct sun8i_codec_quirks {
 	bool legacy_widgets	: 1;
-- 
2.26.2

