Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDDE26C058
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 11:20:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1698167B;
	Wed, 16 Sep 2020 11:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1698167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600248002;
	bh=S2nU4KxbTZCrY6/5EAXr0eaUy0lFNnRt4B2bxMN7BPs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X17eAlVMiA19DTxc2TR9ZLvPe1i38HA+5ZTRp50ArCap8TRkkdP7v75s3K6KDK5lU
	 rlzPv5UO4v9dEwq9BoQYzsxmmRT7n+lZracVCLKKC+AcdMTGjBfMOeilVMTyZM1Sy8
	 me94nCoPHYq34gt3jK8wceyn+SLwCy0rTNsE1jSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F90F8015C;
	Wed, 16 Sep 2020 11:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFA27F8015A; Wed, 16 Sep 2020 11:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130040.outbound.protection.outlook.com [40.107.13.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE749F800E8
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 11:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE749F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="UulIMYgo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG4TbFfnn6lfoZFngOsGjYpBC+k2OpxDxRg7fOXUP6faEKqPQBaSbv3djwLlPncm7g/SO7LncHurejjzuqJa/XyKcayl1B1tKUuIzXWLWoy9S9qQ+AEd6TkLv5eJWFO14/ACvnf1ZmwElAjh1sF9FslsRGum/0upWUv/5UnmNiWxFJfZs+25lh4vvflj5kFmO33yrW5/shpGRI/23mjYa6j1KVbzNo16gcRzMAxhJUR7WhaMYGIU6XOjJ7MVMAvvwW+VHXY4zLpIQZeF7xPsX+eAuf4C3wzwn0DcgNigB7fPlwksuievIC3wLZNsfEgWf/CQ/yOoTSdrqsfVW4liKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0W+JBhcJXxevkXrhfJi9+MHuFb02MGMnxC7ND+2baag=;
 b=UD2ns4rykNvL9oLdZJQHs34SayZqSBHJpehkyKQ5+0B8UVySxLOml8KBhYZ70j37MemEC7LFJa1kKvHvt+ZHlrJPXcvhAAMTffh4oiwo4swVTBWc3XbA42Hm/3Pf9lWP+lW1VaJEj1lWTUaFcBnyEK7SP+g4VmE5jOcFD2/7qro+Enl4Qb1zHm3tiGSYzlQuxkrgk20Yha3ML637Vxqyd40Dx3kziwFkC73eOqg0Y/HhUmHCmnBOLY4xWJxReZ5ldi8G/2CzRu7m13QOQb/PLGYg/xoTimd1jhVcIYcohGbTnnLNTqUqjHmVx0f+kqvncJ17TJKRjmKuRtoUsewXig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0W+JBhcJXxevkXrhfJi9+MHuFb02MGMnxC7ND+2baag=;
 b=UulIMYgoh9SqdjZ8272Alojs3aMnyQJjOahLx7YOsKn0ZNBwuLtwUomt8QGbDbF6VQg8eHxsyFpnKqP5AT4/NrhQWpkkErZI/tNFhVMVNAHqtZabpGTr2fIRoF7FACSQJOUaZJGihu3qt5J1xrxmBQWvhkxNY8KE5wsNOHSYFis=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR0402MB3630.eurprd04.prod.outlook.com
 (2603:10a6:803:d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.18; Wed, 16 Sep
 2020 09:18:09 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3391.011; Wed, 16 Sep 2020
 09:18:08 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] DAI driver for new XCVR IP
Date: Wed, 16 Sep 2020 12:17:54 +0300
Message-Id: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0158.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::27) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-116.ea.freescale.net (83.217.231.2) by
 AM0PR01CA0158.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend
 Transport; Wed, 16 Sep 2020 09:18:07 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9483c961-1f30-40b5-f3f4-08d85a216d29
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3630:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB36304E4FFB9D79D1AE4AFAD0D3210@VI1PR0402MB3630.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 575ch9xSCc14cfhmsQYbnk6DVp0+c83lhEUcMfy+WW08ODq5mxZ13FBlgN3XAmzVxKjZ3kggSNi6X4mGoVbGNTsqPoHONHUJ2dbcqIwHVhFkP9g1LW5KGizSlzg8Nj25rbUKbjN1h5V8969kws9HEhsbrNuCsYB1HPHGeSQG/0Y0aSFrR0oFvKQilWJMblyzilsh4YCtED/4LghZavi/3KYAkPhyP2RBrLb2HV0utXWJTZPcG3x88mrR2dUfLdubBKImh3SE1m3fvVufRYkKNg822fw4BrE8sXAzOuVAWx2xiSuyYvYmfB1owzEYePuZXZXxpTegiDJ0oXXlaULpMerV+Eu6IAYVhDUyfQpBLP3tH2nTFzGE/ps4mFGFum7mKNOCXfcuIeowH/ahySJBRHF7j8k3qs4RckIhsCeI8oU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(6486002)(4326008)(8676002)(8936002)(2906002)(66476007)(66556008)(66946007)(6666004)(2616005)(956004)(86362001)(16526019)(4744005)(5660300002)(6506007)(7416002)(54906003)(110136005)(26005)(186003)(52116002)(498600001)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: nYxS4kE7F9K9AlsqTYoilSqZ9wRJMuzP1x5vLWFJwzTvMeGPlf6XmThf4Tfygrtq6SSdZglP6PM9xTKQK+FVHqlhPtjkC+wP31LNvwXW+8Nn//O1xwl2Bo8x2vzMIJvPW+a1PcvUbvK9OCJI0rqTcgJQB/mZQGf5aoW6IPuGbU8attlhluv79IMJv9A+bS/4GrSwzJI0ue6nBG2H+gO/yFdSIcS68IT4RGLTNUKPzxBBr3hTQRESDk3gF/iRaM/TntHCX1wkJH4t4xZyC7v57Dq9BlvDqsAVvjn18Oj/6muW1FpNp/u1kw3HsXUqmiDWWSEs25xAUHaNRG7LMofFiiEcFa8KoDQi7pZ2CsaxsEo6RDWjpPy7Q4xZav5sGH9qD5SwnFyQQ09M5zneDb/GWQh20T1AykpcuxM6d7ZBTbYRiAhgUFUioDO5h6MnIpdXRZULyP7dQcWi8Ww8ao/Y7soh0HDUU19H7N4DhYBnyUxUvWZoA41iWwM6M247LrICo8xGdSx+zptt6cDXuJ6TmYypRl7I2AXCuI0/NLrDfCU1ru94nN6WB6F3H1kvDTyTR2X5z32SewUgbuvUETR14kgfVo/WMjjACBeneHwRUsaGg12MpTY+gbtneakU9OvkjeXYDK5IwbZu9fu8HZI4og==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9483c961-1f30-40b5-f3f4-08d85a216d29
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 09:18:08.7110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIJB+0dYGnEzrq/Vm5RGDJD+wjLgDzmppOEZxN7hwUBy8ut1RxQ47lnoaeCysWbTU+714XV+rWfRYO2SR62z0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3630
Cc: Viorel Suman <viorel.suman@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
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

From: Viorel Suman <viorel.suman@nxp.com>

DAI driver for new XCVR IP found in i.MX8MP.

Viorel Suman (2):
  ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
  ASoC: dt-bindings: fsl_xcvr: Add document for XCVR

 .../devicetree/bindings/sound/fsl,xcvr.yaml        |  104 ++
 sound/soc/fsl/Kconfig                              |   10 +
 sound/soc/fsl/Makefile                             |    2 +
 sound/soc/fsl/fsl_xcvr.c                           | 1352 ++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h                           |  266 ++++
 5 files changed, 1734 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
 create mode 100644 sound/soc/fsl/fsl_xcvr.c
 create mode 100644 sound/soc/fsl/fsl_xcvr.h

-- 
2.7.4

