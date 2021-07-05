Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9B3BC310
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 21:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8346216C5;
	Mon,  5 Jul 2021 21:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8346216C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625512828;
	bh=zRGIuxZBnTMoItay2nImSAhOi/kbnBcIqn34qwO/X8g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S2vufrSpIDxh/de/cSp4g7479gIW9EslXPsnV1q5MKQsA1GdwNXbwYKqWvbIAtyfU
	 OyozOMtlYiJodkxvStHmh0Ch7uE68qCRHioU/poidTfSQDuPGAFx93lPxqljqsw6QP
	 5Xniiq8TI1LcP436Dk4MFOsUJlZgutjGowBCRT2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFFCBF80124;
	Mon,  5 Jul 2021 21:19:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2653DF80224; Mon,  5 Jul 2021 21:18:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2041.outbound.protection.outlook.com [40.107.101.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D321DF80134
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 21:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D321DF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="u37b9iZq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akjRyXi2x3nNnA8z6WwtpE2UVytwcE8Jo/TWzZKHQB9aMr+0YXp4UFzz4iWZI72M2nsQx6i2RqDGnEPFgeKSEDdg1fRE0qGKZSsmm8KVZbzCRAQ6/Pj4JZJgbgyctIfJiO3b7gEJhRdCRt8HoAnapQNU4LTQ784WhW1wn/pi9RohmwV5AW+Rr1mXkpwnc/rWBjv0lw3Vu5uMuVFvuofBePHOawXFkIjgDXLMKQ6gn+aB3wEgCDDQ7BTQp1gGy9//S1b+Tm39Pz0g5wFGt1mhD3y72LFUSym1aWb2DyoHaMVmrlI5iicKu8+gi68L7f9h1E6zMu+wvDDOGj8Rx0SSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCzDYKXSFIcS9VH4CmffsV2tIamCctDj26XHKnbnVkw=;
 b=oaWd6IAdK81zD0yhZ9CCEE9xMu+A0Q/6pQLqVvG8Xtt3KxC5OpEmzL2CcdtYaq4Bn1OsgWjXUEP9zae61gj99f+7Dhqt3Z4SeQ8efu8kbHTshlhKUDwOZnbJe7RvtfymU7TzAHbsICss+NzoJ+FABlBl0LiOyL/+C/W8BZDcslJpQTY7BG++ROTxQIq09BakIQY+VlKrQYRNxBrei2RpDK3uQ0FfTjBm4FnSvAjD1iZdSgyFigorQsBSJ+SOWSi+WGpj68mM8qhfilrNx/3JGAUZDy7MGCsUqxAv169bNS1zNASGJdF1VMgy68YPsZl8Y04azcA/3BQ35XWzVldrWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCzDYKXSFIcS9VH4CmffsV2tIamCctDj26XHKnbnVkw=;
 b=u37b9iZqGaQAoPb93h4c9gE9JAduQEfl3oEOcQrx0cukcPQGOFeRIXEsZZMSrFuAY0wcbb/QDug7I6V/TT+Sp4PvLOk4yv5xxRG9lv5gCAVnOeWf17oKu4EY13O7vZi9SGSigvDdzgIfcCgAWmEYzPOEN8hAJ1l8aAvV5nxUZ/U=
Received: from BN9PR03CA0748.namprd03.prod.outlook.com (2603:10b6:408:110::33)
 by MN2PR12MB3214.namprd12.prod.outlook.com (2603:10b6:208:106::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 19:18:42 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::9) by BN9PR03CA0748.outlook.office365.com
 (2603:10b6:408:110::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Mon, 5 Jul 2021 19:18:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 19:18:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 5 Jul 2021
 14:18:41 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 5 Jul 2021 14:18:31 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <peter.ujfalusi@ti.com>,
 <alsa-devel@alsa-project.org>
Subject: [PATCH v2] ASoC: add stop_dma_first flag to reverse the stop sequence
Date: Tue, 6 Jul 2021 01:06:17 +0530
Message-ID: <20210705193620.1144-1-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d672c81-a918-4de5-d237-08d93fe9b3b8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3214:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3214506F95CE0305EB9E8204971C9@MN2PR12MB3214.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fyGIdyP5G1BbNm1E/EoTd2kYAeeE/OWvcTTSsSJxioCQiwjD1qPQ7xNUrPWnghb2JSGbb72J5RYU0Og6KG9Nej0d5/vwvpNir+XzhNDmAgqPeumzReJx8Kv4KqtgzKeOGscDA2IHjTLOp3b/6nICixizF495mTvYb2PclVZHomHthGpSw7BrG47dTubnJIFiy8MiDnZO6dDYdvRzpP6XZIQORH9vwQ4LqebX41b/thBQGdojHypRdbbOHnsoz8XZMt4d3of6W7TWxn3j2BRm5lFJMUJsp62ECzhZzZ7r8Uoz/Ik6ug77nEbedDWs8MZE3ibMSdUSUXvADCuj72MLSiTTH5E66flIT9BZalCOnm2sXdFH9cOfLsD6eqI70XXFQoeYgnpRMciIYUt7Fie+yUi1Eby/WHtSVwDfoZpjd3ChP/B1aVKD+ViNALKQtT4LlM4JPluNNPz8hhVP9xUbQGt+/4IJx6kuYbU9EhqFjzzjOIuni4J86Nn28p9xohSmJFpVccJos/P+qmcXxiCqnbpfh/WS6utW02KEAivh0iIRgCjmf4waBURfdk3HQustc+98+D5VDg9x8/JqoyWElfzbjivK/oUr9yU1gjauyxaDEG4sCysPxO6thm3BZL+VXbGLSjFio/4Hh76Vo21SPFpSAK+Os0XXZc3pQHQfh8upmuHgfAH3TchHzrVyjZTejH2f8AuJrgIbbE4h6rDDtjREDEVTABZbV4C4s6nEKC8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(36840700001)(186003)(70586007)(44832011)(6666004)(70206006)(1076003)(7416002)(316002)(81166007)(8676002)(83380400001)(82740400003)(26005)(36756003)(356005)(47076005)(2906002)(110136005)(2616005)(54906003)(5660300002)(86362001)(336012)(82310400003)(4326008)(8936002)(7696005)(426003)(36860700001)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 19:18:42.4270 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d672c81-a918-4de5-d237-08d93fe9b3b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3214
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, amistry@google.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <vijendar.mukunda@amd.com>, Alexander.Deucher@amd.com,
 nartemiev@google.com
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

On stream stop, currently CPU DAI stop sequence invoked first
followed by DMA. For Few platforms, it is required to stop the
DMA first before stopping CPU DAI.

For Stoneyridge platform, it is required to invoke DMA driver stop
first rather than invoking DWC I2S controller stop.
Introduced new flag in sound card structure for reordering stop sequence.
Based on flag check, ASoC core will re-order the stop requence.

Signed-off-by: Vijendar Mukunda <vijendar.mukunda@amd.com>
---
v1 -> v2: renamed flag as "stop_dma_fist"
          fixed build error by removing extra + symbol 
          sound/soc/soc-pcm.c:1019:3: error: expected expression before 'struct'
          1019 | + struct snd_soc_card *card = rtd->card;  
 include/sound/soc.h                  |  1 +
 sound/soc/amd/acp-da7219-max98357a.c |  1 +
 sound/soc/soc-pcm.c                  | 23 +++++++++++++++++------
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 675849d07284..aa63282aac2c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -982,6 +982,7 @@ struct snd_soc_card {
 	unsigned int disable_route_checks:1;
 	unsigned int probed:1;
 	unsigned int component_chaining:1;
+	unsigned int stop_dma_first:1;
 
 	void *drvdata;
 };
diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 84e3906abd4f..a2bf49f81a80 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -742,6 +742,7 @@ static int cz_probe(struct platform_device *pdev)
 	if (!machine)
 		return -ENOMEM;
 	card->dev = &pdev->dev;
+	cz_card.stop_dma_first = true;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 46513bb97904..062fb6fcc03f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1015,6 +1015,8 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 
 static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
 	int ret = -EINVAL, _ret = 0;
 	int rollback = 0;
 
@@ -1055,14 +1057,23 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
-		if (ret < 0)
-			break;
+		if (card->stop_dma_first) {
+			ret = snd_soc_pcm_component_trigger(substream, cmd, rollback);
+			if (ret < 0)
+				break;
 
-		ret = snd_soc_pcm_component_trigger(substream, cmd, rollback);
-		if (ret < 0)
-			break;
+			ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
+			if (ret < 0)
+				break;
+		} else {
+			ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
+			if (ret < 0)
+				break;
 
+			ret = snd_soc_pcm_component_trigger(substream, cmd, rollback);
+			if (ret < 0)
+				break;
+		}
 		ret = snd_soc_link_trigger(substream, cmd, rollback);
 		break;
 	}
-- 
2.17.1

