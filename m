Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E461E411C5F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 19:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5100D16C8;
	Mon, 20 Sep 2021 19:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5100D16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632157643;
	bh=ea1vH0c1ywhVgw8kmnXuQG9RDFKi5XQmU9T+PZNTVbM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PdU48zsRE+YfqLLN7NBehDZGBeZaIbGtRjPay2wYTX53U51pZglrjiw+iD3pPJsrV
	 C5V7ywCkwYDDYT8bO8R9fu5U1Vw+e/6dmhGgLh8C1IKENKstwakNo3wfPOiSXrJ1mq
	 dxoP51ABUs+6TA0iF/MBHUEuaNvz+if4+64cV4Q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4682F80129;
	Mon, 20 Sep 2021 19:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC328F8025D; Mon, 20 Sep 2021 19:06:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D619F80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 19:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D619F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PQHPrFbA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1773661B1E;
 Mon, 20 Sep 2021 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632157552;
 bh=ea1vH0c1ywhVgw8kmnXuQG9RDFKi5XQmU9T+PZNTVbM=;
 h=From:To:Cc:Subject:Date:From;
 b=PQHPrFbAYlNNj6PxXbURW5V8xqEjP+QRZda8w63ZblYiieevCUYmiv+Ak8R005tjI
 /MhrqwfXmODeC+1oENU+CH7U9e185d/8jyg3QuQiUFg+9GSXL8JjjIs4HJ6VpEStPb
 9bGZ6In+pEB9rq/YqygEF5tQxeIpxgGQe00ek0UcvRDB9Iu+pforeRXFgQSMEzlc/q
 FHsNybM8NrwWZvu3HUUAtmy7mvL1e/PxV+leO3zn2nAROx7SisaBl7ffhR2HIVtoXK
 Vp/K2hzpIdY/NDjfd4ct4UyrecuW9/SjfBUbiaBjzN4YmG0SFJZFX0YfxIQgBg0vBb
 PxZYtbIyc2yLQ==
From: Mark Brown <broonie@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Benson Leung <bleung@chromium.org>
Subject: [PATCH] ASoC: cros_ec_codec: Use modern ASoC DAI format terminology
Date: Mon, 20 Sep 2021 18:04:14 +0100
Message-Id: <20210920170414.17903-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; h=from:subject;
 bh=ea1vH0c1ywhVgw8kmnXuQG9RDFKi5XQmU9T+PZNTVbM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSL7dDRzPPOw2DlnhQ2NH5tVBvN2Mwgp2tCbyT0hK
 GtEfdGyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUi+3QAKCRAk1otyXVSH0GtJB/
 4rtfCzQ8pZEWBz+Um3mTh24xJBTiPWJTY3NMbNhDCUpWdz6LxXHml2mbMKE9BOvsezllEJb1RDAsgc
 XW7cbYkkYd3Wxi8WnyxJlX9sv0zTruz6K5byVyJ6XAC6KCHO2MLk/9L84reDiRCk4YngxDcOyKJz5m
 MKXIiaGF+ES5AVgZg5J22NxD7avAKJRT+Hyz5SkZK1x4HhNGVdtZ6ty3QTFahc4U+yEUciOo8ssR4O
 q/T0EvdGj6Bvzy03O1SPKj8wSnc0DjIXVpdWKPhwSogZKgda+rD39FQ1XhtAdXYd2xkOVxe7dBbvyL
 LmT+KlXXTgrhOFslC8imoIDpDTWbNa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

As part of moving to remove the old style defines for the bus clocks update
the cros_ec_codec driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cros_ec_codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index a201d652aca2..9b92e1a0d1a3 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -283,8 +283,8 @@ static int i2s_rx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct ec_param_ec_codec_i2s_rx p;
 	enum ec_codec_i2s_rx_daifmt daifmt;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

