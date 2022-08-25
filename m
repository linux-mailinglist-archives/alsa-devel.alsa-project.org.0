Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A05A12F0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 16:04:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B43A163B;
	Thu, 25 Aug 2022 16:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B43A163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661436281;
	bh=Yd3nJRcA+h+KQ+HC/lgUi2YNwRGRzAOZt0pKJh3rolA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQigOz3YmCkqSbUpy9A1eVHBUIu+Sk8CHAksqxkFy4M7hr50a5ScgfIOMhpnLioAG
	 dBboiKbbEWuzBfEfbOQdNfF1LSZNOqeCkWGX5jKaJBeM5gG0GRrJ5S3ppv7tR/EGf+
	 z04Q6EYi4pbu0UUhOgXouGJ152VSHA7vu5cw6A30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 112CFF80537;
	Thu, 25 Aug 2022 16:03:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87FD1F8053A; Thu, 25 Aug 2022 16:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25C85F80245
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 16:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25C85F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="WGTOf7S4"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661436171; bh=k4JY6gIRcC+FC13JFoBjpofoYgJ49CT9VL+rB5MoeWc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WGTOf7S4c+SoeUUUcqErZTjpI0ULWQGgn7XDtYBYDqUOmswbmAhpPQxv3b7/v5B2L
 l6cODorEj2q1wJ6UvpO2O1abdISoeV1yXguMNrw6Zie2FJyLc54nr5t5Z89jKiu8Xm
 x3QfKElNGJkbgq75Fvor2eiyqK/lH8ntyIFTMzxo=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/5] ASoC: tas2764: Allow mono streams
Date: Thu, 25 Aug 2022 16:02:37 +0200
Message-Id: <20220825140241.53963-2-povik+lin@cutebit.org>
In-Reply-To: <20220825140241.53963-1-povik+lin@cutebit.org>
References: <20220825140241.53963-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 navada@ti.com, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asyrus@ti.com, shenghao-ding@ti.com, raphael-xu@ti.com,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Stephen Kitt <steve@sk2.org>, Dan Murphy <dmurphy@ti.com>
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

The part is a mono speaker amp, but it can do downmix and switch between
left and right channel, so the right channel range is 1 to 2.

(This mirrors commit bf54d97a835d ("ASoC: tas2770: Allow mono streams")
which was a fix to the tas2770 driver.)

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 846d9d3ecc9d..0df5d975c3c9 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -485,7 +485,7 @@ static struct snd_soc_dai_driver tas2764_dai_driver[] = {
 		.id = 0,
 		.playback = {
 			.stream_name    = "ASI1 Playback",
-			.channels_min   = 2,
+			.channels_min   = 1,
 			.channels_max   = 2,
 			.rates      = TAS2764_RATES,
 			.formats    = TAS2764_FORMATS,
-- 
2.33.0

