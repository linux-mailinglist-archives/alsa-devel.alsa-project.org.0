Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D961DABE1
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 09:23:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F2C17B1;
	Wed, 20 May 2020 09:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F2C17B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589959386;
	bh=Be9VivMQnz7NpX66hFrKgHDLPjBZCMzlWeJfg5yM/r8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mzhKyqr3oooRn5ZSuQFifv2yMiA29krBfBVKSX/+U4c1Rv2l1vBa1+tNuYVPGub6e
	 TknoCfRFTsQPoU+TL4TBA1F1DEcEfHlCUc/50vigDeijBIKfoj3CDCYGjCBhlZ65RJ
	 g925lOlLdV27jqmJl7nba9ZCb6sM8CTZ/HrXA5VY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18EB1F80272;
	Wed, 20 May 2020 09:21:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EE24F80132; Wed, 20 May 2020 09:21:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6BC3F80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 09:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6BC3F80132
IronPort-SDR: 6RBp3LhTs6DzUBBuAJXd2DrYd6xb+TAdLbljFMn0aCzBsGc1lIZcvPSiqwtsdbleV+GsRFNxiJ
 i9tPqqDFaxLPHk0QidnV0IUNT31jSCEjOhg4IIaHUqWo58E0A3LGdTKpcvKGhxeM5iP9vNoxPi
 UhfNtL7Ba+7+etceVqwq3zg3OuQsyFxKmFeZxnFdzepNgaRWPLNNQfHNathSiqXUDjfBmZDR1i
 o2X1xVqLrJ1/WL2tPzoFj6y0vQhjux2tamfCmYdCvQJyX4v+WPYpMTsPQZqZncP30aLCCAcfiW
 P+M=
X-IronPort-AV: E=Sophos;i="5.73,413,1583190000"; 
   d="scan'208";a="8907982"
From: Pavel Dobias <dobias@2n.cz>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH 1/6] ASoC: max9867: fix ADC level control
Date: Wed, 20 May 2020 09:18:59 +0200
Message-ID: <20200520071904.15801-1-dobias@2n.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX04.axis.com (10.0.5.18)
Cc: broonie@kernel.org, ladis@linux-mips.org, Pavel Dobias <dobias@2n.cz>
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

Fix swapped channels in ADC level control.

Signed-off-by: Pavel Dobias <dobias@2n.cz>
---
 sound/soc/codecs/max9867.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 2e4aa23b5a60..6d49a1cc98c6 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -58,7 +58,7 @@ static const struct snd_kcontrol_new max9867_snd_controls[] = {
 			max9867_dac_tlv),
 	SOC_SINGLE_TLV("Digital Boost Playback Volume", MAX9867_DACLEVEL, 4, 3, 0,
 			max9867_dacboost_tlv),
-	SOC_DOUBLE_TLV("Digital Capture Volume", MAX9867_ADCLEVEL, 0, 4, 15, 1,
+	SOC_DOUBLE_TLV("Digital Capture Volume", MAX9867_ADCLEVEL, 4, 0, 15, 1,
 			max9867_adc_tlv),
 	SOC_ENUM("Speaker Mode", max9867_spkmode),
 	SOC_SINGLE("Volume Smoothing Switch", MAX9867_MODECONFIG, 6, 1, 0),
-- 
2.20.1

