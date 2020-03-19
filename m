Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4110118B042
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 10:31:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD4B21748;
	Thu, 19 Mar 2020 10:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD4B21748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584610265;
	bh=3NSq01sP7hg9hSlhehU1zmhWYeSNPuNr6qnVwaXE3DA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UNIkSjLwilO0EjZ9LUnGbIPg4Pmln10yLcz1NQFZcM6Ik9rBbsmW3wMwUwcP+Q/lA
	 Qfusuf5wqSc0QSbphcBJPJT2AuGd08RORCLgmLtRreX6kSb7MR/LFx14vIkTtSrix+
	 4J3fUo5Phd6ApvYO8SxmrsrtJAVTQZnLnKmUh2nQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FB42F8028C;
	Thu, 19 Mar 2020 10:28:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF8ECF80232; Thu, 19 Mar 2020 10:28:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D167F800DD
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 10:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D167F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w11rE85b"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J9S981111804;
 Thu, 19 Mar 2020 04:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584610089;
 bh=1dqFYD+YvWSYD5r9z/jBYMnqGA1Pqw3GSKZBl9H07qU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=w11rE85bwPv7qqjtLCUKaHhLn13XyD7gp1+iR84fnPskQ35whhkhDu9/bQoNVrHby
 bjzvXZS4n1p3znPEiS5CXybgoM6cA5W9TZcL7RTtNxYP1eznLt2l7ja9IBvY7o74K4
 FuJK7RMQhjVwmhlj6OLJZ0SZds9QhgjSso1/7VA4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J9S92t052040
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Mar 2020 04:28:09 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 04:28:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 04:28:08 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J9S4ep088372;
 Thu, 19 Mar 2020 04:28:07 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>
Subject: [PATCH 1/3] ASoC: ti: davinci-mcasp: Specify stream_name for
 playback/capture
Date: Thu, 19 Mar 2020 11:28:13 +0200
Message-ID: <20200319092815.3776-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319092815.3776-1-peter.ujfalusi@ti.com>
References: <20200319092815.3776-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

In order to dai stream widgets to be created the stream_name must be set.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 734ffe925c4d..9cccf6b7a8a2 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1623,12 +1623,14 @@ static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 		.name		= "davinci-mcasp.0",
 		.probe		= davinci_mcasp_dai_probe,
 		.playback	= {
+			.stream_name = "IIS Playback",
 			.channels_min	= 1,
 			.channels_max	= 32 * 16,
 			.rates 		= DAVINCI_MCASP_RATES,
 			.formats	= DAVINCI_MCASP_PCM_FMTS,
 		},
 		.capture 	= {
+			.stream_name = "IIS Capture",
 			.channels_min 	= 1,
 			.channels_max	= 32 * 16,
 			.rates 		= DAVINCI_MCASP_RATES,
@@ -1642,6 +1644,7 @@ static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 		.name		= "davinci-mcasp.1",
 		.probe		= davinci_mcasp_dai_probe,
 		.playback 	= {
+			.stream_name = "DIT Playback",
 			.channels_min	= 1,
 			.channels_max	= 384,
 			.rates		= DAVINCI_MCASP_RATES,
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

