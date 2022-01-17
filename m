Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9A6490975
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 14:24:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0022317F6;
	Mon, 17 Jan 2022 14:23:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0022317F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642425848;
	bh=jVy2ZoyycuiS4S7ICSr7v6N/6BqeqbOkelv81GUI3Eo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vlzo0C2NLPyxEulkVBgNkPbc/1kurIdZy2RUEFkGCrDt962ayDrILbNJfDoxh8oI1
	 8FkFq0KQ8FJew5/ZFQdtBB1GyxIO6tIFHlEyem0hEoL1JHnUcWNF9N1XVYaVHiRpH9
	 u3XLqTmKenHI3kqwshmTZnE3eJv8eAHtsidB0zOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E3C0F8051F;
	Mon, 17 Jan 2022 14:21:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9113F8051C; Mon, 17 Jan 2022 14:21:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 528A6F80508
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 14:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 528A6F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="YPyLSGZV"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id B7ED71F439D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642425710;
 bh=jVy2ZoyycuiS4S7ICSr7v6N/6BqeqbOkelv81GUI3Eo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YPyLSGZVQCMiiyR4gGxztKCKj8+YvXGtun60zrrNLm87nWT7qB9prTaf/CZOSJ5PP
 mKshbaLW+kQe7J0Uyu2lVBIIGgsFbSOEHK3+i4ZVo3Li7o3gZyfRUfr+Zr/GN3put2
 EKgBW9J5ZjCWUs+DM0Yy5tKyZQGCAwgtJWE1YFKAX2dqrIk77PLflVB1ZK40UokjGZ
 N2uWzTgIVxQ7xg40oC/8N54ZjaYq1FjF6x10YP8QXWHV9ZJh45XgY5uCfwBqQlQ07j
 +sULxKH1xX54SvzS0YMQUyZnJHOToDlf/KExChYbIpdagVwjwoTq0qrunGl1OGwct6
 UDAGtTCob1yCA==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/5] ASoC: fsl-asoc-card: Add optional dt property for
 setting mclk-id
Date: Mon, 17 Jan 2022 10:21:08 -0300
Message-Id: <20220117132109.283365-5-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
References: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, nicoleotsuka@gmail.com,
 broonie@kernel.org, bcousson@baylibre.com, michael@amarulasolutions.com,
 festevam@gmail.com
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

Sound cards may allow using different main clock inputs. In the generic
fsl-asoc-card driver, these values are hardcoded for each specific card
configuration.

Let's make it more flexible, allowing setting mclk-id from the
device-tree node. Otherwise, the default value for each card
configuration is used.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 5ee945505281..156d3c669274 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -693,6 +693,12 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		goto asrc_fail;
 	}
 
+	/*
+	 * Allow setting mclk-id from the device-tree node. Otherwise, the
+	 * default value for each card configuration is used.
+	 */
+	of_property_read_u32(np, "mclk-id", &priv->codec_priv.mclk_id);
+
 	/* Format info from DT is optional. */
 	snd_soc_daifmt_parse_clock_provider_as_phandle(np, NULL, &bitclkprovider, &frameprovider);
 	if (bitclkprovider || frameprovider) {
-- 
2.34.1

