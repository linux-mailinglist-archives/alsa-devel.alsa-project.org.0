Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D823D3BC123
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 17:42:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FA1D83A;
	Mon,  5 Jul 2021 17:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FA1D83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625499756;
	bh=liVDCGPIuLOG4A2P67nF8q5dTE/q+QkGNZyxC4ikcAA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iU8fuGS1OJnUQoj8ikhgZsOVMeB7ycBUw9yQZ/miznB0pmbNdZrt+cFTlrbo8kbJG
	 RgejoOwu2nmKo8MTL6AYwGrrHZSW44mq8JnwerAcIaGCjxZa2TNpgiR/iWZzKA90ib
	 U15MwFra4UgJIaT/vLvL+z+qjRgfAYxGMysYQJYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4046F8025C;
	Mon,  5 Jul 2021 17:41:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B1A8F80224; Mon,  5 Jul 2021 17:41:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64157F8014E
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 17:40:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64157F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="NP9fu3yA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBgjEJCTA3EBsVv7pMdfBmYWoRYRGACc4uBuY5ARexcMfg9c5XyqQIs7acrypl9auiVM2iETOmDQAsL9xx18sfaVqCHfc4o9L4gjF/67il5cFeYU9W7JdWP/yygkLuF7rdLRCqBKbpD/66SAFZQstBbXKcn6zLJ9Ylq1oKlwP/HWDSRni6M5oT2eX7SAjj725ufmTxKYfOSMyRZfv1L1dPTnzGkWn6xjG1IhyXreI/73DUPyNy/QnH53wnfFOU6cJ5qX9f/3wuedsFhc6ZDderFMsW0dKxUoFuuMxuRRhuGkLy73JCglhIFwEqGGrJV945/29sHivt5/977WJ/Rs4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiUKBABkTl1FfNmzh4k/S6iEXv814/i9aIc+IK35YAk=;
 b=kFRj8Nm8kaDldh6V2ZHqUOEjeZUxuIeL/UHODWj5bhCXt5gRA8/H5y9EQFHt3LXihCwZelTA8SQ6JOlPKRgE1ulHp+nEShzA/7tcJhqsEj/eGW3EVHn+IzMklaUaoz1ljfdfLLXitN0Bv1WINl8bh6Zfn6RURGNoSb5ughhp/LYqjUqcDZQBMzKIaz7nf3cnfDd8k+Fi5jAYc0+Cv5FAaC5p3kSF3tBaWBTAdzFhJlLwnTG1ROElCMGD0XAbAW+W11Ne7w3n3aBXsVX6jq4VqvTLc9PF5FRM5VDjgp12EXXCMSE1iGzqhuYEeYHf4uv08z0EMj1VN3AkpByWwqakmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiUKBABkTl1FfNmzh4k/S6iEXv814/i9aIc+IK35YAk=;
 b=NP9fu3yAHqvEi/Z5Xap+3qargEKaDCQgl5c+68xCHSKs0OPu0qJZMMsGo+1aG7V2NTP4SCuNNwqQ0EdENxyy4rHpa40Xqt5ZkwxS6UpIVyQocNPuYCbKxFgluWH7psUcSbcbwY5R2dCDvDhVIPbBxSRV5oUGNPde/a+SrCy91Fc=
Received: from DM5PR12CA0058.namprd12.prod.outlook.com (2603:10b6:3:103::20)
 by MN2PR12MB4992.namprd12.prod.outlook.com (2603:10b6:208:3c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 15:40:53 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::9f) by DM5PR12CA0058.outlook.office365.com
 (2603:10b6:3:103::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Mon, 5 Jul 2021 15:40:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 15:40:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 5 Jul 2021
 10:40:52 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 5 Jul 2021 10:40:41 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <peter.ujfalusi@ti.com>,
 <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: add dai_reoder flag to reverse the stop sequence
Date: Mon, 5 Jul 2021 21:28:28 +0530
Message-ID: <20210705155830.24693-1-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b09641a-dda1-46cd-300a-08d93fcb45c6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4992:
X-Microsoft-Antispam-PRVS: <MN2PR12MB49923F58170EF37CE58D7DC2971C9@MN2PR12MB4992.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSMurKfsMPoTapXlB9qyrpTL6voheKm9N+FTCeVIq0PNv4G/5dlti0ZdDN2eQaT7h7uxvG0PE3/Lue475ka00Ucl669s65DaRq2Mm7jKGXCJEkmirLAsfa+ipzuGMHvHgQ7Ml5VVuqs8q+Zn60PJL2t4TdmTklPtnt8nyLqkh9g+rTWUH5sZIzb9cjQvNnpqF6deOD+duOok6+8ZO3dBQA7n5Lxi2n42xZAdql+xoqY+wDwcPamXd7Hky1aIw7rFEfMRXogq+dKRe6ACKrS2KSQgdZjPN08JyZpJJGanZVTDLvKCxUlZroo5Vy7qqw4LlbZAkPraYoAsQ/vuc5KT0zh1BnKn5b5QJhNZuchS5NgiglJ9NfakyniVf7DKqtuGtcMsgj5Z7i6dw3sLjDlzm75HX9jKcYgwdSWK8Pj8REXVNRgzQrC/JxFtXu/14KxaWGnAUAjlNuZnF6FI/BBBXCVmGxRqFJtF2yVEY/VD6qYwjfSarQ6K/rdLVIz1xTvIkpEDeXxHHOCNQcFgRZiQpnfuoed9JsEETJm1hiCXhf8LdXBr6Q655IevGfGE7D4GtyLM4JPitnAoQYKEMXqE4c94Zow2qdcfOL6py/JZEYh8CWQCFjpU/TYFNwoxfAcFT4nHnNFri82995icMgjep7gO1/YpbY3iSNOerM1nT5XZNsubb/91mhQkCKMqWAG4KgYRGq8yfOVJVUb1Uu7kr3l86c1ElkO/aTJuDtVIp1g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966006)(36840700001)(478600001)(2616005)(110136005)(1076003)(7696005)(336012)(47076005)(8676002)(36860700001)(186003)(426003)(82310400003)(86362001)(54906003)(7416002)(36756003)(26005)(4326008)(83380400001)(5660300002)(81166007)(356005)(82740400003)(44832011)(70586007)(8936002)(70206006)(6666004)(316002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:40:53.0203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b09641a-dda1-46cd-300a-08d93fcb45c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4992
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

On stream stop, currently CPU DAI stop sequence is invoked first
followed by DMA. For Few platforms, it is required to stop the
DMA first before stopping CPU DAI.

For Stoneyridge platform, it is required to invoke DMA driver stop
first rather than invoking DWC I2S controller stop.
Introduced new flag in sound card structure for reordering stop sequence.
Based on flag check, ASoC core will re-order the stop requence.

Signed-off-by: Vijendar Mukunda <vijendar.mukunda@amd.com>
---
 include/sound/soc.h                  |  1 +
 sound/soc/amd/acp-da7219-max98357a.c |  1 +
 sound/soc/soc-pcm.c                  | 23 +++++++++++++++++------
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 675849d07284..12f79cb70600 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -982,6 +982,7 @@ struct snd_soc_card {
 	unsigned int disable_route_checks:1;
 	unsigned int probed:1;
 	unsigned int component_chaining:1;
+	unsigned int dai_reorder:1;
 
 	void *drvdata;
 };
diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 84e3906abd4f..b0533b4b7b18 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -742,6 +742,7 @@ static int cz_probe(struct platform_device *pdev)
 	if (!machine)
 		return -ENOMEM;
 	card->dev = &pdev->dev;
+	cz_card.dai_reorder = true;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 46513bb97904..4a9a51e6c988 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1015,6 +1015,8 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 
 static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
++	struct snd_soc_card *card = rtd->card;
 	int ret = -EINVAL, _ret = 0;
 	int rollback = 0;
 
@@ -1055,14 +1057,23 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
-		if (ret < 0)
-			break;
+		if (card->dai_reorder) {
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

