Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4A66AD96C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 09:42:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18D4F13D6;
	Tue,  7 Mar 2023 09:42:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18D4F13D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678178571;
	bh=RDEXrbNGtglhXCh77BvwpL28RL9fskMAEre3duIuNaQ=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=nXuNUTjuDeQ9omgFdMtga8wK3AQ3uO+de+JOgkAeLT+IlPhaty9LfLrsrAkxu9JgZ
	 cX9jlJE7ht99M0vrgyi9/9CRB4cy7nkCF3t6a5UTsR1eP4T93C1YwHMP3RHxvqdTzY
	 uRRq389Lbk3B04NDF1LV4XtuQ4+QdGaINkRr1agU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFA90F80533;
	Tue,  7 Mar 2023 09:41:50 +0100 (CET)
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/2] ASoC: SOF: amd: Enable cont_update_posn variable in pcm
 hw_params.
Date: Wed, 8 Mar 2023 14:15:09 +0530
In-Reply-To: <20230308084509.1496256-1-Vsujithkumar.Reddy@amd.com>
References: <20230308084509.1496256-1-Vsujithkumar.Reddy@amd.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7X6ZLJZBXT4RVAXLNK6YPOYLKLZ2KFNC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167817851034.26.11118522256164505514@mailman-core.alsa-project.org>
From: V sujith kumar Reddy via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Rander Wang <rander.wang@intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6176F8053D; Tue,  7 Mar 2023 09:41:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DATE_IN_FUTURE_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F981F804B1;
	Tue,  7 Mar 2023 09:41:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F981F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=x+QiA0GH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJyMr89UaUTCzi+aZVNk+GrrlIkFTbBHVhQyplx0c/I0ilv3t0YOiMPMr3ms2Vh6ZcifITssDoSAGBn4vPQY9hnoiTpW5O2/bOQyO4jOBirqhQnr6UaVrZRV2+nVSdDCgLY2+0rZfFPt+aWH5eAifxNE6ZIoxN43rSm1RHVH1KO88BK+LOCWRIlrFhetRdRjw49NTXwKXQn/X9+Qg1Ah7JojFmonRhNKs9pgtsq7hqLTRSraPY2roo55jME6qiFxfTrQkubwnIEqyKG+QgDnANO7S3mFHsiozz1nVyXrixiTpYD+jcLX7gzQqmeplDqVdyW4cv+HN7ZC7OXvaY2MlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlUjspXbTsTGULyUXbPL+dgvmilKBlsk8ji4BtCrRp0=;
 b=oU0yE9AMSCjbGz9PDM66YFwWqEE6Q2S1R030ME+cv+JWpCLAkhP9xAhPPd7jeSYxzWIpb7YKSy1zMf8Tp+e3q4o1JQMb6HO2vp4l2c6jEP/WYK+7cC4Y+kr/4pTpj9XlBinrsdlv6jrqH7AQMTlfGYTwRQWZhET6EsFhgrrmB5Ger7QGzmOkXwM/Vx7iiq07T3N2kG4W4OsHVN2/i/Md+umX8yEAAstSzhfO2yeeNPI8YRJrNAwch+/EoWOFm9qadNceG/mQPJcDS9LXEFenoLpiOQK+mB9l+z7TXMzHaAw7IfndN1bWVCgxCp71RtKcMkCCUnkGUcJ4YSfW9/UbgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlUjspXbTsTGULyUXbPL+dgvmilKBlsk8ji4BtCrRp0=;
 b=x+QiA0GH+bmrwDzunuc5629GwInbpjXZrjMNERc4xD1ZzONgnMNipOXezdePu+Tx8/gKMJ9s5hekxp+/c+hHO1+epvQ+rGvBqvl3L7t+upx4Os59cDX8evocSnINyhckkvKEkyahGeZEuJ+qcRq9vU1/4P+NXjbrbCmSq6FJTFY=
Received: from MW4PR03CA0006.namprd03.prod.outlook.com (2603:10b6:303:8f::11)
 by DS7PR12MB8347.namprd12.prod.outlook.com (2603:10b6:8:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 08:41:05 +0000
Received: from CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::47) by MW4PR03CA0006.outlook.office365.com
 (2603:10b6:303:8f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Tue, 7 Mar 2023 08:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT090.mail.protection.outlook.com (10.13.175.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 08:41:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 02:41:04 -0600
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 7 Mar 2023 02:40:59 -0600
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/2] ASoC: SOF: amd: Enable cont_update_posn variable in pcm
 hw_params.
Date: Wed, 8 Mar 2023 14:15:09 +0530
Message-ID: <20230308084509.1496256-3-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308084509.1496256-1-Vsujithkumar.Reddy@amd.com>
References: <20230308084509.1496256-1-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT090:EE_|DS7PR12MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 854cd720-5789-4509-116b-08db1ee7b0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ER0n06jFVWmkuNwiau6RCCCp7sQn447RDEj703t1uFwZc7Qw88ZAmImhmg5bDwIvXtMBzk1ifbVLH+ytxMrLSU19GavzS73QaZ4yYrpYSGgU0OgxM0hmdqEmhig5HVr54+0TzSQ/TsIhiKtGqXw6HKtDqBojaKGmNccsIQJz5OV2/RtKP/G8Ow8oGUdF6911gfM4PmqQr0DixfZXGFWjz0AJ3oyaAKSIeGQJItCOx98YzM6DupAyF6eAxgWvE2ftv8H5IM/VM1qwaJL9DfeDbCdtVOUqmfhyMyuUoKpeY+VTb39W6lqFZ0/WM1InsWUW5/qMkJ6qv/O3M83b4nAYkn42P8O6Ea61tlGIUp6AO7KAQwttiOENGX34rE5eWedNFYtlMqxuhkta8WrYDE0cf8zMdqkIAy4P0iCJjbI6+n1A//aj9fqE/CkEmMoJ9VjU9/g6AYrVnm2xffbMwhVD5tJRmdDrS4rRyZRhBg81keeZDR8qbS6VKdsrdDDjQHBS0btTBziMqPfXSCvaWEhxc+qlMLgyHK52BY5wVkM7QIPyx/rAjg/yJm2Rhym+lfqL8xAU7gxoMLCcrSd6DMUYhs3Af+3tWkPdbwqm3nAWl83RAEzXn684wPmM1bN0ronK87045n8f088MPxJJwqvCXa+uEtIBI6e5UFE4p7wxaYSgERigeWG2Dg2/LLIGyr7AeKzbnUTVSKm2Vs+uPHol+cvUSHeSIb/ny/PBq8u9jWw=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199018)(46966006)(36840700001)(40470700004)(4744005)(5660300002)(7416002)(2906002)(8936002)(41300700001)(8676002)(70586007)(70206006)(83380400001)(54906003)(316002)(6666004)(110136005)(478600001)(7696005)(4326008)(40460700003)(1076003)(40480700001)(336012)(2616005)(82310400005)(86362001)(186003)(47076005)(426003)(81166007)(26005)(36756003)(82740400003)(356005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 08:41:05.3307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 854cd720-5789-4509-116b-08db1ee7b0c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8347
Message-ID-Hash: 7X6ZLJZBXT4RVAXLNK6YPOYLKLZ2KFNC
X-Message-ID-Hash: 7X6ZLJZBXT4RVAXLNK6YPOYLKLZ2KFNC
X-MailFrom: Vsujithkumar.Reddy@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Rander Wang <rander.wang@intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7X6ZLJZBXT4RVAXLNK6YPOYLKLZ2KFNC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enable cont_update_posn variable to  update host position
in streambox for every dma copy.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/sof/amd/acp-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/acp-pcm.c b/sound/soc/sof/amd/acp-pcm.c
index f342f0bac4a3..0828245bbb99 100644
--- a/sound/soc/sof/amd/acp-pcm.c
+++ b/sound/soc/sof/amd/acp-pcm.c
@@ -39,6 +39,7 @@ int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substr
 	platform_params->use_phy_address = true;
 	platform_params->phy_addr = stream->reg_offset;
 	platform_params->stream_tag = stream->stream_tag;
+	platform_params->cont_update_posn = 1;
 
 	/* write buffer size of stream in scratch memory */
 
-- 
2.25.1

