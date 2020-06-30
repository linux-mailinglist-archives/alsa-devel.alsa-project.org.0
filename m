Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBEE20F549
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 14:59:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B9011690;
	Tue, 30 Jun 2020 14:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B9011690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593521986;
	bh=DvU6P+H3FGui+zRRkpyGqss1ejPkBQSpyHH1sPtUDho=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0+PkqTIppodSw/rP/rrCSbMWIyoT4uP9mZpOlUV3qMJy1GI+gWYSPb1J6ebGp963
	 ZkzpA715yDAFSTap9cMMp7mrpPuKjBkOG9CIZJHTCGYiEuNNQbVWnm3exkq1itT8hp
	 fjPNj0pgyCzioekD2dsbPZkIFwYwGRI3sQfk13GY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8582AF8028F;
	Tue, 30 Jun 2020 14:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 819E6F80252; Tue, 30 Jun 2020 14:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4879F8022D
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 14:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4879F8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Xx2bl8JE"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05UCvnbu027125;
 Tue, 30 Jun 2020 07:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593521869;
 bh=ccAR2l5UfUJRa3XDJKA2gVG365Re+jn/ntZxzTY+wzw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Xx2bl8JEFAGH+cr++w2VSP0tU+LNhAA6+sVBFC4zCn4YcTY8JSYhDx/0ZaL4dxW6+
 0ZjNYZuKNSZ32hJvaXUWKd0bJO7HPfBNf7RYoS/eEEpRz8fdQ6JfZ1zJQo7zY6CRn+
 AdcLETWcXgXFN+YRYn3z6oSeelPsSRRA3QKvDsoA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05UCvnFL081788
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Jun 2020 07:57:49 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 30
 Jun 2020 07:57:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 30 Jun 2020 07:57:48 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05UCviAJ084334;
 Tue, 30 Jun 2020 07:57:47 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>
Subject: [PATCH v4 1/3] ASoC: ti: davinci-mcasp: Specify stream_name for
 playback/capture
Date: Tue, 30 Jun 2020 15:58:41 +0300
Message-ID: <20200630125843.11561-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630125843.11561-1-peter.ujfalusi@ti.com>
References: <20200630125843.11561-1-peter.ujfalusi@ti.com>
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
index b93c1ee302c0..617440767c45 100644
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

