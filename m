Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6F411AF8
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 18:53:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1087116D8;
	Mon, 20 Sep 2021 18:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1087116D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632156793;
	bh=xM6vcrXAiovYwD+IeaMAv6axdnWmmQQAf60hnfVApkU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pgMQM2x0i0xqsjBSa2wQU/0l6oIvqRa0kbxSzoWFlRH1FQUctHRskbkiZZpvBiIsm
	 29IR0ujwzqpcWUqyAORoBkMfEWMsfG25Bo+6NJqqOmcaIwRtjWhDxD+3shfPYoLMTc
	 p8QaVNWJiUGyOr0t9yK6w+DqpqkCkaLxwn17boJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11FE8F804BB;
	Mon, 20 Sep 2021 18:52:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A62F2F804B1; Mon, 20 Sep 2021 18:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CDD3F80279
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 18:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CDD3F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fa3c/Px7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0B83613B5;
 Mon, 20 Sep 2021 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632156733;
 bh=xM6vcrXAiovYwD+IeaMAv6axdnWmmQQAf60hnfVApkU=;
 h=From:To:Cc:Subject:Date:From;
 b=fa3c/Px7CujVrz67O6AdLIfviErllCEmYooPjsQ8oMEPKA77jMIkRUxlkwYeN80ZU
 myeCHAk8lG9t0qEnUNqubg3GEzC1/l5RbfBfeWXnZifTEHrz77fbakOETY00raOM10
 NG7cmvAP2VPBqpvWlzvWXtmlw9hX2idxXhypyS0XnZ3pgRsRnpNxEaAPtArG7hKHoE
 ABmef4mZlvL1arTnEPLLMLpzJ59BzxXXIoKk5grc8Wa2qgQb6IWlYZkERB/uRs5GL9
 ns3EfJSmC1hewQLyIhUnT/N6DxHoQbHCi43cGT0r5NKGqE+eJlEmoVyLn3QUJP6R5w
 LsmQvXtypdw0A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: alc5632: Use modern ASoC DAI format terminology
Date: Mon, 20 Sep 2021 17:51:28 +0100
Message-Id: <20210920165128.17224-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077; h=from:subject;
 bh=xM6vcrXAiovYwD+IeaMAv6axdnWmmQQAf60hnfVApkU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSLv4D1Tt00n3/8TtUuQJnETkE3FKuMfCUZQvfjDw
 5S68vhuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUi7+AAKCRAk1otyXVSH0FxFB/
 98beS9LuYeKssa40DNhLf3pnOpvusaqp4UNsDA29pWoKH5q1WzMSDzJmSh7dFueZseqgjCfrhUBeMV
 etGYwwob8UpGe+1bjgC9EycvFO95wjw87yeoy3USMP/cnPFOlyX8lV5RsQUP5eGvi01YdumsCSGGhQ
 aUYXF8aqsxpUJz3LXn3FC5gjZyM/KYNygYRXfzJm0fY9nCW0LtOZmau0e2heHv+8nYfIuTKPmDBU7A
 1FPsUGqRtNqOns/lBoPcIGwAECEH4rAM4nXS7/wT5TGvnMRrqRPnWrnhG4eHyPjUHwwZMSS3wA78Hp
 2idQyX8qHc5l7FDa4S+iA3Byc4fYsd
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
the alc5632 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/alc5632.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/alc5632.c b/sound/soc/codecs/alc5632.c
index 79813882a955..6d7af3736a91 100644
--- a/sound/soc/codecs/alc5632.c
+++ b/sound/soc/codecs/alc5632.c
@@ -815,12 +815,12 @@ static int alc5632_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	struct snd_soc_component *component = codec_dai->component;
 	u16 iface = 0;
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	/* set audio interface clocking */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface = ALC5632_DAI_SDP_MASTER_MODE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		iface = ALC5632_DAI_SDP_SLAVE_MODE;
 		break;
 	default:
-- 
2.20.1

