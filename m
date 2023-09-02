Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA2F7909B9
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Sep 2023 23:09:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92939DE5;
	Sat,  2 Sep 2023 23:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92939DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693688984;
	bh=u8foQukjHiYH/O7gXYdWoKCmQhG0/XDI8XfTOo0YtW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MCUqVaIh1z0lcZOlUuHRHAfd0CmTSq5+r0Kr3wbUPV0zN9HFOHIMTwf/h+DXmYZvE
	 ScIBzyITVR+XqpmbvbI92vUtQwjIyyHHscbsiE1Y70A9wU6XdJipMl505HlFdzj43K
	 kZj9Rl65b+8ANDDhPFQ4w/hdsOY3AEoHayYWAXP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25FFAF8057B; Sat,  2 Sep 2023 23:08:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B28F80587;
	Sat,  2 Sep 2023 23:08:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B896BF80527; Sat,  2 Sep 2023 23:06:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DC93F8032D
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 23:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DC93F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=RqsQcz2q
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A69E466072B5;
	Sat,  2 Sep 2023 22:06:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693688806;
	bh=u8foQukjHiYH/O7gXYdWoKCmQhG0/XDI8XfTOo0YtW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RqsQcz2qqfbwRmIUhx6YrMIkmgv6bEQVkFrpTJA7rCLoFX3xAkbtosy1tMAEwF+CW
	 gQTRumGwMC04SMKtwqziHaAGzb9PJYxV4NDQPb8cdG7hEazhzxXcfxXqZT5TkmoOPt
	 oAx9I/Ec9PVJOU2xV5Wm5X2UZfakzuPewFKO6wSiNzFCs6jwcQKm1WqP9WxuB8fJDi
	 qBCIVrrpvOr1IoW/LrIhqN92gvSgfhhA4gn4kovuplAepIkq9AJDlC+Qinv2fuZ34Z
	 bubUKCtBL1Ep/tXnj9Ff1XZyY5D5EVTOihdI6g5Goada+OEjxNIk2jbeSoo4abiI+z
	 CimCviICtGRAg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 7/9] ASoC: cs35l41: Verify PM runtime resume errors in IRQ
 handler
Date: Sun,  3 Sep 2023 00:06:19 +0300
Message-ID: <20230902210621.1184693-8-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UIPB7GUOEYBM72IPLSSDCYOJGMWZ42Z5
X-Message-ID-Hash: UIPB7GUOEYBM72IPLSSDCYOJGMWZ42Z5
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UIPB7GUOEYBM72IPLSSDCYOJGMWZ42Z5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The interrupt handler invokes pm_runtime_get_sync() without checking the
returned error code.

Add a proper verification and switch to pm_runtime_resume_and_get(), to
avoid the need to call pm_runtime_put_noidle() for decrementing the PM
usage counter before returning from the error condition.

Fixes: f517ba4924ad ("ASoC: cs35l41: Add support for hibernate memory retention mode")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/cs35l41.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 6f2ad0d3a75c..66418547a4dd 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -386,10 +386,18 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 	struct cs35l41_private *cs35l41 = data;
 	unsigned int status[4] = { 0, 0, 0, 0 };
 	unsigned int masks[4] = { 0, 0, 0, 0 };
-	int ret = IRQ_NONE;
 	unsigned int i;
+	int ret;
 
-	pm_runtime_get_sync(cs35l41->dev);
+	ret = pm_runtime_resume_and_get(cs35l41->dev);
+	if (ret < 0) {
+		dev_err(cs35l41->dev,
+			"pm_runtime_resume_and_get failed in %s: %d\n",
+			__func__, ret);
+		return IRQ_NONE;
+	}
+
+	ret = IRQ_NONE;
 
 	for (i = 0; i < ARRAY_SIZE(status); i++) {
 		regmap_read(cs35l41->regmap,
-- 
2.41.0

