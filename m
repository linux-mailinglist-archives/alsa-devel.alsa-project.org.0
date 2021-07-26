Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685B3D7147
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 10:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB191AFE;
	Tue, 27 Jul 2021 10:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB191AFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627374800;
	bh=LjvGLqey1vo+kPssdKrNguqtP2Vf+zOzZjU1ZQIn57Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fjsvUm2MLXIploChD29jGeNvlSDkwnIu9M01WCwaEX27QVG02Hc2JjdPm3kmh8U7Q
	 TTnsXi19VVBjhrK5h0xvjfRpRHPQ6EFXTQg8cnYgNofwpFaEJKbUr5o+rrKbIEaSYq
	 sBrx8s/v8nBp/SJWP4OA2kPMr1xxZWQNo8sGhCYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3EF1F804FF;
	Tue, 27 Jul 2021 10:29:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BFA2F8025A; Mon, 26 Jul 2021 16:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from forward106o.mail.yandex.net (forward106o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::609])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0B37F8020D
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 16:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0B37F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me
 header.b="cAipfvoB"
Received: from myt6-2da614b3f5d3.qloud-c.yandex.net
 (myt6-2da614b3f5d3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:5f2e:0:640:2da6:14b3])
 by forward106o.mail.yandex.net (Yandex) with ESMTP id 36257506020A;
 Mon, 26 Jul 2021 17:01:30 +0300 (MSK)
Received: from myt3-07a4bd8655f2.qloud-c.yandex.net
 (myt3-07a4bd8655f2.qloud-c.yandex.net [2a02:6b8:c12:693:0:640:7a4:bd86])
 by myt6-2da614b3f5d3.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 I36awdfoTD-1THOdvb1; Mon, 26 Jul 2021 17:01:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1627308090; bh=UodZOI06rDrTB+iyDAnoxBqxuoxjS4F7HBFZfwph550=;
 h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
 b=cAipfvoBsYgncq41Lmxb4cL09r6TunYB5OkP/TYls0LkKmAgOGfAs/ecQGF8NKESz
 yZrfJ0xbmoIi8irgMWyJsqHhEk3pnfUdNMLojdjK7djxRlAEYmvIVRLvpaLWWSc9mV
 ivzePyLvEGZpaH3SVMFMMmhWLHyNKFRJO7NIKz3M=
Authentication-Results: myt6-2da614b3f5d3.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by myt3-07a4bd8655f2.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id olJ9yWy468-1S2i5Tbq; Mon, 26 Jul 2021 17:01:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 6/8] ASoC: cirrus: i2s: Prepare clock before using it
Date: Mon, 26 Jul 2021 16:59:54 +0300
Message-Id: <20210726140001.24820-7-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210726140001.24820-1-nikita.shubin@maquefel.me>
References: <20210726115058.23729-1-nikita.shubin@maquefel.me>
 <20210726140001.24820-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Jul 2021 10:29:07 +0200
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

From: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
to Common Clock Framework, otherwise the following is visible:

WARNING: CPU: 0 PID: 97 at drivers/clk/clk.c:1011 clk_core_enable+0x9c/0xbc
Enabling unprepared mclk
...
Hardware name: Cirrus Logic EDB9302 Evaluation Board
...
clk_core_enable
clk_core_enable_lock
ep93xx_i2s_hw_params
snd_soc_dai_hw_params
soc_pcm_hw_params
snd_pcm_hw_params
snd_pcm_ioctl
...

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 sound/soc/cirrus/ep93xx-i2s.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 0d26550d0df8..4d3179f03202 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -111,9 +111,9 @@ static void ep93xx_i2s_enable(struct ep93xx_i2s_info *info, int stream)
 	if ((ep93xx_i2s_read_reg(info, EP93XX_I2S_TX0EN) & 0x1) == 0 &&
 	    (ep93xx_i2s_read_reg(info, EP93XX_I2S_RX0EN) & 0x1) == 0) {
 		/* Enable clocks */
-		clk_enable(info->mclk);
-		clk_enable(info->sclk);
-		clk_enable(info->lrclk);
+		clk_prepare_enable(info->mclk);
+		clk_prepare_enable(info->sclk);
+		clk_prepare_enable(info->lrclk);
 
 		/* Enable i2s */
 		ep93xx_i2s_write_reg(info, EP93XX_I2S_GLCTRL, 1);
@@ -156,9 +156,9 @@ static void ep93xx_i2s_disable(struct ep93xx_i2s_info *info, int stream)
 		ep93xx_i2s_write_reg(info, EP93XX_I2S_GLCTRL, 0);
 
 		/* Disable clocks */
-		clk_disable(info->lrclk);
-		clk_disable(info->sclk);
-		clk_disable(info->mclk);
+		clk_disable_unprepare(info->lrclk);
+		clk_disable_unprepare(info->sclk);
+		clk_disable_unprepare(info->mclk);
 	}
 }
 
-- 
2.26.2

