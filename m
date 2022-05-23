Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 687225310FE
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 15:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E2EC16F7;
	Mon, 23 May 2022 15:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E2EC16F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653312281;
	bh=UfittyCQEKFOLsknNbUcfqdwhysqv9tkLctCRZp4KPM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pEB+AZqkqezxmdCql8jvVLOk6AahK5SWS1kYnyRzU7+nLvdfcuaanoTwxcHNbzoWZ
	 Je2sqiOAmTM4jOQGoiiIcz8JusZ89MZLKNfn+upwBbkQJPEUEEyD9NFhJh0r5TfbSi
	 Ix1LmU0IMvTzWbdpH2cWOtvBzfl9CH62NW7/5Tv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 947BBF8025E;
	Mon, 23 May 2022 15:23:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9527F80236; Mon, 23 May 2022 15:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B463F800E3
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 15:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B463F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="UXWyzmF1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP8KCXq/xZwQjBLcwSbqWu2YWF0KbG2ESh5dB7HRZYMaCSsh5uus35eJaekPMKfndKvdVqmtKq/WdAXB7ijLl87mORd3TmwWZYpXd22d7tv+1U1fVByuqEdjcat3lZnnJxCVCuWC+93jKLjEoSRyFgXs9lDtUa3kd7aEE/jwu8D8EXCqNNYbIXNiCe4T2uG7njznURiiCBx0MCpzuEVVtqysLdeESvkl66/zfPMMmhT81S3Wk+Z0N1PJVhc5cGFwif9RH7Ily3wtuI0Rx0hiv/roUqjyQBRdJc3leoNc5pcgaBiayQ5KxoJOLacvAZQGEKOUUY4l0+zRgNTNojwb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aw5B1fXr5PIHRF8D9QLwGfVkeTnnkqWhQejsjduQUpo=;
 b=mO7JPl6dQ1H9nulUmF3piYvZfAHvwlR+WFDxXTA7DE8bdpqU+yzS4nGv0HFjvIStE4KY2zbCm2QH6KzQzftfbMxGGrCJnQ1nRd6gNjwZWBGAS1SzbdXyPpTPOZbPGIRwLkhVR9Ka/fCiNmMLdFNZ0ZgLQT9YkbntYsLIj2ue0pNasF5FlWo49Z59DQLus1K3ivv23k8+H4oNvMR6J1J+jBu7Tnbu/lfKTka4oFV2x9rMJn3s/dRTr0RB9I/24KfkVgHYMCqhaRKJ0GtisVRBJI18xvHWQnLs5D4EnKPQeUQEDgIkfIz6ofewEzmT0NMvZ9JSVuCXghilFDNbs/tZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw5B1fXr5PIHRF8D9QLwGfVkeTnnkqWhQejsjduQUpo=;
 b=UXWyzmF13JEskm6K8Gc4dPBjJ0tDlYCnjx6jvgqo11rPTpqMAkARyGEvK+5UcCUHLlQZQWMl1quH1mu33GD/CMz9SSbZpQjXo64W9EjPBsNWH9OAmUXUq/tV8jsKVpYbSsfuIbSFbAqmOJ4h7wAILGOrFRFyZrvH75nnWyqAuyY=
Received: from BN9P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::18)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Mon, 23 May
 2022 13:23:29 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::77) by BN9P222CA0013.outlook.office365.com
 (2603:10b6:408:10c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Mon, 23 May 2022 13:23:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 13:23:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 08:23:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 06:23:28 -0700
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24
 via Frontend Transport; Mon, 23 May 2022 08:23:25 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 0/2] Add Machine driver support for nau8825,
 max98560 and rt5682s, rt1019
Date: Mon, 23 May 2022 18:53:51 +0530
Message-ID: <20220523132353.1767614-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a04160d1-3c17-4b87-f6ba-08da3cbf6ce3
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB6108A32093BFC345A8D8697292D49@CY5PR12MB6108.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BZ15BDOFZnj5YuvC/HUeD88Q3H6Q4JcZw/cCGC+z0ex1N2+oz0X/z5wyGOqiye1jj4cgJm+UW1WP+A/SMQtibkGjsxatTzU2d5stHLV9fI5sGaYmsDI8c4euR4Kw4iBuq569Twn6S0dl5DqhHbCJJ1dChvY3zKGAzwAzRApA4ZIBqZVDmuhWyllgih9o7yOSBYgNYIlsTxv26dPT2WzUKkr5vSxosWF+jd9+Usfe+qVwE0f/NPehEVj7wZ5CnMvWldf8JCjd8VQ3Bzh3OW4PNo+dmUOKVClax/en7wZ0AsEa/zcSEM4LXn4yLjvapXhPMt64LD5tj6k1ik11sFgCoDKzr86rHVNBpMGo4B6dJQPd+R4HNRkopQ/JQh7BiTDsgwDuVy+G/12MHU5BbqyaqTtzfvLdyWzAd3hwVjufwS3pqtf2Vz5WEqJa1bJ9uEZF8f2xRPWX36fTBgJUl20YHOZhXPnE8zgIHru1aPHeJ1Z2gKrgSwHaKaNjL5NBlhRSgZm5wN06zl+ujJlJGBzZGamcWBnkDig3+8ZW4ANLYqoAifjuSIh42zNnYwuNeURCgQDZH/aXhSmFuJ+hLxQHBc7YAl1kfYgk/MOUZ6L5vO6g0JA6JVoCcyrz/3r2LNxQ3H2R2AeB6C9dm1trARcxL354fDdPLo2a6JE82vLx444wMuNthNAdwdhhdM+zxOT125YkZLWb++Z9EFPkI+9FuAsXK+i45tr27pYx2/aX3wSon0BUciLOoTNyz8VyHC0e/kjXn37uadWD7Xg+ftboWNTiq44ZCFqBz0bRfeyBktrCKz9SapkE8yQia7iIHBkUsmWpZxbx744f/ouSpAGCWA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(316002)(83380400001)(110136005)(40460700003)(356005)(54906003)(36860700001)(8676002)(4326008)(82310400005)(1076003)(47076005)(336012)(426003)(86362001)(2616005)(70586007)(70206006)(186003)(508600001)(26005)(81166007)(6666004)(7696005)(8936002)(2906002)(36756003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 13:23:28.8864 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a04160d1-3c17-4b87-f6ba-08da3cbf6ce3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108
Cc: V sujith kumar
 Reddy <Vsujithkumar.Reddy@amd.com>, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 Vijendar.Mukunda@amd.com
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

This patch set depends on:
        --gpio patch
        --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-1-Vsujithkumar.Reddy@amd.com/
        --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-2-Vsujithkumar.Reddy@amd.com/

Resolved  compilation error:

/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c: In function ‘acp_card_nau8825_init’:
/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c:479:15: error: too many arguments to function ‘snd_soc_card_jack_new’
  479 |         ret = snd_soc_card_jack_new(card, "Headset Jack",
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/amd/acp/acp-mach-common.c:20:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id, int type

V sujith kumar Reddy (2):
  ASoC: amd: acp: Add support for nau8825 and max98360 card
  ASoC: amd: acp: Add support for rt5682s and rt1019 card with hs
    instance

 sound/soc/amd/acp-config.c          |  30 ++++
 sound/soc/amd/acp/Kconfig           |   1 +
 sound/soc/amd/acp/acp-mach-common.c | 235 ++++++++++++++++++++++++++--
 sound/soc/amd/acp/acp-mach.h        |   3 +
 sound/soc/amd/acp/acp-sof-mach.c    |  30 ++++
 sound/soc/amd/mach-config.h         |   1 +
 6 files changed, 283 insertions(+), 17 deletions(-)

-- 
2.25.1

