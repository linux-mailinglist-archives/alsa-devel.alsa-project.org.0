Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD564C0573
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 00:43:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67ADE18BD;
	Wed, 23 Feb 2022 00:42:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67ADE18BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645573399;
	bh=yQDDaek287Ow03a0bQ6Azy4TwUQmgpCNrneCyq5YYns=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gFT2lMiOQ9lbaT/UEPlO3CZnh3U8mk4OlvCtbJTU1ZXNQtwuzngYOIeXfX8jV5oDh
	 ySUtcw1seScXjkm2wg9IBkX/Nuzz778iKS2jOXs/nfJme9Be5dovtgaFlWZJrwiPAK
	 5wyK4f2nGO1Izv8IxP9ybbUUAb51jRNIe7RQHLF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0948F80526;
	Wed, 23 Feb 2022 00:40:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DF1BF8051C; Wed, 23 Feb 2022 00:40:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE4ABF80515
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 00:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE4ABF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c9JxOcZY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0904DB81D44;
 Tue, 22 Feb 2022 23:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DE6C340EB;
 Tue, 22 Feb 2022 23:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645573239;
 bh=yQDDaek287Ow03a0bQ6Azy4TwUQmgpCNrneCyq5YYns=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c9JxOcZYyjxm4f2MWJrwivWSICIIZGIXMw39b2oPN3RJgCkr4/8QeQJ+cnm37GD5W
 m/q5Wgk/ih72bGCixpgHNzhDoFenGeDWaVF7z6ctEZKlATTD7bfxsU+wT+olsyItuf
 TUBeZj0SJp3b2fAHHnDh/6h/s+LdiGbLCtHWCWzLdDJ9P85JHEq0AdYUWPXiYmN4Yx
 dKBCJXxU9OSiczyOTSfzWyiwSAgHB6CkP4nPVhCi587jqpk372KGk1TlSgudqvMc9Q
 QZJ7oARQ5+C761VEHYJezdBpgql7Pyz6EgG/u0oHNsZuKZP87VOQnkJTSUXELWqCoc
 /J4g1va2WBN/w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 06/10] ASoC: max9860: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 23:40:22 +0000
Message-Id: <20220222234026.712070-6-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222234026.712070-1-broonie@kernel.org>
References: <20220222234026.712070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; h=from:subject;
 bh=yQDDaek287Ow03a0bQ6Azy4TwUQmgpCNrneCyq5YYns=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXQpNAY7zn3V/6kRAwICAKuV2nizw66DThAJNqIU
 UFsiFF+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV0KQAKCRAk1otyXVSH0OlMB/
 9K9eLywZG+XzS9AW5beo1XV/IF05a/i2PncG2gsU1jzJZIYs8mTQuc5HGPTtdhyaUQUGIY0DpIYELa
 iyEHGjgYZ0mB8JPrCD6LefQhD3un4N0GsIFTGj5ySNk0ypUTWv/yL5CfnhoagvTQlk71eMXkQsvdGo
 RNJoi0r2sZClsA1KMcAsX628ZmYty3HhHQBSm/ml5RYM88xpovRLTMbakFVZRO8OafE98zLDNiRfT0
 H/eZiMhtCVaqJUSGraS86cJ1ccz+ifLFs+OkwiOLSZvwGSqdsiEUv/R+VAEyQgYDnNO6C9YvrvZa2z
 RIQVp4gZx/OauqijV2Yq1te34Md4Jc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Peter Rosin <peda@axentia.se>
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
the max9860 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max9860.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index 7c9686be59d9..82f20a8e27ad 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -268,11 +268,11 @@ static int max9860_hw_params(struct snd_pcm_substream *substream,
 	if (params_channels(params) == 2)
 		ifc1b |= MAX9860_ST;
 
-	switch (max9860->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (max9860->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		master = 0;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		master = MAX9860_MASTER;
 		break;
 	default:
-- 
2.30.2

