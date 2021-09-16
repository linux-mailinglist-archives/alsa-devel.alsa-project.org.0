Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 613B940DDA5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:11:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 005C1187D;
	Thu, 16 Sep 2021 17:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 005C1187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805102;
	bh=T4UKgb4e478PuWGsGTSazVsGJqE9At2zDZOaW/SLuvI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kc4JCiC7wzFJMzAcRu31SsyN6RkrFnA0xUqnCiaxd7rPwg47jE16SlZNGOwImiCDO
	 myVEwj9A5B16073JjjTvsLJECQdwKZkMek6IrxkhleBKSmEE7MgCRbpKxofypUfcPC
	 W21PPmdZ05PnXUy0E6HJBxbUYacD1IWUSNVD1o9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A955F80271;
	Thu, 16 Sep 2021 17:10:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8666BF8025E; Thu, 16 Sep 2021 17:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B234F80113
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B234F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CbERVau4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDA466112E;
 Thu, 16 Sep 2021 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805019;
 bh=T4UKgb4e478PuWGsGTSazVsGJqE9At2zDZOaW/SLuvI=;
 h=From:To:Cc:Subject:Date:From;
 b=CbERVau4Em7vRC9uGgoiDDJzCU4wBZrxqwGEJlE2/TF2D7mU22pKQDNyMSlnmvaw7
 FoORQZXPDFMbgcZgJx7l3razTW+EMFODH9+nNcKhM85xnLi3k6ue+DflGMWz7EKwNt
 PuCUVaEaz4brqhawxUqB1ELtlO7omCOIC8vdNTp+qj8+v6lzxodn6g4KnqzMchHKFq
 lZxYSxDSIH9nJXkgVYHC3CJuY28TgeRM6+4VNycTVHnBAD29+7zIVPGHuD/D+0a/Ns
 dxtOQT++CsUp/NO0zgYyzcKc9Ya707WsxzwZvgXC6DByv/mYsJanc1/MDoLvg17v/N
 fTmyegN0/3diw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ak4104: Update to modern clocking terminology
Date: Thu, 16 Sep 2021 16:09:22 +0100
Message-Id: <20210916150922.20183-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; h=from:subject;
 bh=T4UKgb4e478PuWGsGTSazVsGJqE9At2zDZOaW/SLuvI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ13+h67o9ZBe0w4ZQUgup+pCat5kK5YwX4PSZdBk
 /ypeSGmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNd/gAKCRAk1otyXVSH0I1tB/
 4pJo/82n1WebwNwebdlvwMzViNX+KwFegcVJwcr5yEKhXqzocFRMOWa/gLAMDqZR+ZhaUxkDadLSy0
 z9PbxH7xfFQzEmBQ1ylMcC6Qp+C0/qLB3t2Nza7XoHfHm4i3ZE00SqNlV2dCSOygjqQhBAFWiRCRjA
 g9t18TV/o+VipKURrfL4000ykYCsA8goY03lsuLkERDLMzhEIeV19jfMZoo5a2U5iiveOglcH7xQP6
 dRVSXRibtsNHJtEtrpoL42ggAjssVDv10HScw2iLtHE4MB5D0Tc+sbrkeyLkGHrgnee4nJ1WtPrkeu
 eg3ExNVKgCRyXClNPD1GEiCnDQ5dXR
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
the ak4104 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ak4104.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ak4104.c b/sound/soc/codecs/ak4104.c
index 979cfb165eed..dc4747c77a7a 100644
--- a/sound/soc/codecs/ak4104.c
+++ b/sound/soc/codecs/ak4104.c
@@ -81,8 +81,8 @@ static int ak4104_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		return -EINVAL;
 	}
 
-	/* This device can only be slave */
-	if ((format & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)
+	/* This device can only be consumer */
+	if ((format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC)
 		return -EINVAL;
 
 	ret = regmap_update_bits(ak4104->regmap, AK4104_REG_CONTROL1,
-- 
2.20.1

