Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1340D225868
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 09:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A91FC15F2;
	Mon, 20 Jul 2020 09:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A91FC15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595229967;
	bh=0OVtiIMhVLjyKDbYCP8Fp/hgb5x858gRpcVc9jEyzFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gnl2dm7Df/sghwyxRwDOi74O0rZmlDcV94KrdY40vh0WmVKwANm1IJMge+2wGqHT4
	 UqzOcpyblFQIHZFd6CtYtUkNFbqgeonLruW79DVTaxuXf7G9i0YmPklcySuZrx5NYu
	 UdJMknozpIJEaj4gwDwEKXOEhROXS1kB2KmOR/10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DC1FF802D2;
	Mon, 20 Jul 2020 09:21:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6588CF8028C; Mon, 20 Jul 2020 09:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 906F8F80125
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 09:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 906F8F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="TYP/Nlen"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4WjRFIDUIrHIhDbDOOREEmCYO3F3hufvTaqKeZSMDNys/9SN2KZ8YP8wuSwosVGiQnfqLAF6MpLKxMtH42hrWy6cJkG3wWBxRB8ZFGun4Ib/vcvJ4qEKOPPgwmwt7z7ah0viNDd87XJANC8tJlE0+WeGJsvzJO/MfB76kn8x2JwYYGT2o77hDJbGUcMP/8kmUU/rLjgMVSnjouRJ8VE6cm6Owr4zIEwpVBSf7caER5ybm4vs3d1hcJNaEw+yIliliAH1tLik7x1eYWeVkzSF98yj0vqVKTAoPq3e35wa1AW28e71RWv4Ze50Qy1T09m22wbz7aB+9noo8zb7UG0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Obu0W0N96YdFBXOQTgzEk4n34waSl0fc/fO2PdGasW0=;
 b=UnEvmKOEiGQtHCuZON2eCpqaxuR55X8Rzz0iqBJd9f+3t7ue7ib65JvuhRyvQqo3PSJOnQYASQeveDSgLkxirXfgAH1G66zpOiUPgSts08PLH7oggSQcPAD+u5EfdBqMAkAnrcb41uTmi+7fAQsyCCIpLC3EGUXSBEGcmJbBkFv/yISRK+1isrkPAGupoIMs0kk7zEbtjICorb9jUS7T/wrzjVix0PpgJEPNxpUlf3Uuj+zNGelygdgA1IhPqs7l6Wkr/5Q9rF3Y+f8w9knt92JYdV1wLt/a4ZrQCC5IayAF7Bll/coSAbA8CDRLDZeihxr+KnFuTG+3JcEhLlr3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Obu0W0N96YdFBXOQTgzEk4n34waSl0fc/fO2PdGasW0=;
 b=TYP/NlenZ+3NA9ruNhfZVIS9R0sQRduw5MqdjKBx0ls0CN9VzOq1WHCcLiMWQjI4SqCBQbpeVbPNYumLTDB31ctZdwEykW0nPWPKbS8B0pb6jXuwszi58bGUnHLPqPrjCv+0mW+YEUlYaIeH45OWpDJuUVkMF5pOTNc8qEGrDEo=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0402MB3344.eurprd04.prod.outlook.com
 (2603:10a6:803:10::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Mon, 20 Jul
 2020 07:21:34 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711%5]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 07:21:34 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 6/7] ASoC: SOF: topology: Update SAI config bclk/fsync rate
Date: Mon, 20 Jul 2020 10:20:45 +0300
Message-Id: <20200720072046.8152-7-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720072046.8152-1-daniel.baluta@oss.nxp.com>
References: <20200720072046.8152-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::36) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (83.217.231.2) by
 AM0PR07CA0023.eurprd07.prod.outlook.com (2603:10a6:208:ac::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.14 via Frontend Transport; Mon, 20 Jul 2020 07:21:34 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7b41021-2127-43f4-45ca-08d82c7d8886
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3344:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3344FAB0C14D771DCF8C9A10B87B0@VI1PR0402MB3344.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lZUsVdO41SU31qfYzLT076VXzZ7s4szzl6W08NBlCUYiX8GPMmJKgkwKf/bXYhU3wuCGuUUobgDd1qmxVs5ZvdhE3E7QJMoisEb4ck7qo1zhd8jS165PG+j5gtzwvJFG2Slg8AJjnIrdqFMsa1Yc/9gcrQL9qyOz1n7Lqmyhg2S7wvH/Mp62RqggcPCqDI/icQyCRu2FqEDMLEE5DyoT1woXr3qtVBicsC/RTwZ466MvwQJeML1ElfpC5eMJ2jMogeGgL+K79NmvGVtwiJ8OvxncahHrSMfbbMxC3rJGcj/U9Iw+F2GpkJDTBZyWQy6GCmLL0uwRYSa1jBv3YJL4vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(316002)(6512007)(66476007)(66946007)(4326008)(66556008)(6666004)(186003)(6486002)(2906002)(52116002)(4744005)(86362001)(8936002)(44832011)(26005)(1076003)(956004)(478600001)(8676002)(16526019)(6506007)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: dpfqD2asHLdlBakHzVqR8jUJupD/R9V9C67a6syWWjhBV7kFfaLymLvIj5eJg9yj9vh3ST4NgGudfmnLvXzTUE48VfuXn49e1Gn2crh944PVz4wFPjtFecTX3He5VaPiu18TFhSYuJY6l4ljGzkpgWBP8Sjb/HE0SiI3WQ/iAIk0ldeHwi03Bf/4Vvxp8U28bG12Zk8A0ZkRh4iX5uju34CzEKGPHm9h2xxvlZ7l4t1Mbf0hs0UK0ipZMHluAZ/IV/b9X04Pw5TqZx9pFBOBWiSRua7XBzXexRjB8WQ7eAgcj4iM2NPPKdwrxJA6bOj4UqsVGj9EYcL58qmr2AZMvzh89KlktqUSfNNk5l2Ye/8cgSW4fr2N5hecSopIlo7z01XszaHoxzMM1GKArT7VBruUtdXMbZudQs6Jhn8oay27H/VeiT3JuM/olFjZsa7eaSQIsn4ysjgh7kTbb8/gzHSfUmkn2/gMo60EX23coWw=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b41021-2127-43f4-45ca-08d82c7d8886
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 07:21:34.9069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPKOcNRWrrzA9CRMEKVOlsK3VQPVTUQ6vLwBkOuLtqdnDJ/uPUvHwa6q4NIxaIVsBLJ92w6BnKzpIyb6BqHQIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3344
Cc: shengjiu.wang@nxp.com, festevam@gmail.com, linux-imx@nxp.com,
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

From: Daniel Baluta <daniel.baluta@nxp.com>

These parameters are read from topology file and sent to DSP.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 6a9703e5ff60..13e10a0c0b05 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2831,6 +2831,8 @@ static int sof_link_sai_load(struct snd_soc_component *scomp, int index,
 	}
 
 	config->sai.mclk_rate = le32_to_cpu(hw_config->mclk_rate);
+	config->sai.bclk_rate = le32_to_cpu(hw_config->bclk_rate);
+	config->sai.fsync_rate = le32_to_cpu(hw_config->fsync_rate);
 	config->sai.mclk_direction = hw_config->mclk_direction;
 
 	config->sai.tdm_slots = le32_to_cpu(hw_config->tdm_slots);
-- 
2.17.1

