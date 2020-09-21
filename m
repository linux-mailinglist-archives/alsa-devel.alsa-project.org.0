Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6977327327E
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 21:10:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E334816CB;
	Mon, 21 Sep 2020 21:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E334816CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600715438;
	bh=f9NksGo2y1RsCeVymjbQpSY2fuudcXy+Dl3GhoIn4lg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vfVxNRoDJLU3HpIOeZ5yA9MOzkefGivMMRlrn+YbetZp6/nTYfprWwaiobtZRoZht
	 vdjn4PhiP6PkxPu59vnNHtoGmFVXmRzeugPNWJn8luGDMuWMRcZE9O2bKCMiPCJo3B
	 gBX1laRSfDU0bG3ZJ75SDJH279uJKtAK44bSJ9E0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07D96F801EC;
	Mon, 21 Sep 2020 21:08:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3598AF801EC; Mon, 21 Sep 2020 21:08:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00057.outbound.protection.outlook.com [40.107.0.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEE7DF8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 21:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEE7DF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="HK7AA0W3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7/5DN15MoV2GUvILFgCIPigtqSss3TwFL2W9SLiAVG9wVvzJN0BDYcgSD9lDM59DqcSBFCqx5PJnp1qGMhEHDvyjLsEIlTWAKvxj+m5o2uf/NdNIrdGDvz1I6ygv2oK3vNXCJzQx8gJ9KUBPzbB2Yh5yuKG9xrCD8wPm7zzNqtadb/T1bPOSBlIUichUu5K6VRUAU9Mz1fvGphguyxN+CAgpeopOPeQ3tCni8eE7jSjb4w4vtZ+Qi/3K4qnlYeUI1JOtSsT68ptYXnWf0cv5NHGqBvu6bvkifm792C/g7yLWy9EwSlp/1x3VDhoh7u78YpQSIu5PfJ1LhqYtJlpxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyVfD+77YLM+p9YDeL+KP3qhhC52aS3w+51EqVmhJK0=;
 b=MmoaT3EvczyfaDihbct/MTpDmQsvaLv46Zz5wSjCP1YKZhApqAlKP5szNAApmyHsQUrcRBWt/xRLDLdd+k6Yxj6FlWrFYU3VTh/+k5wLIRGahu7OqlxjfIqxksTHpZPvb/X2aXaDgq5LWe0d1t/sn66PgesyjBsMMkaI0iVdqk6fzRf5+N/ZLWtoHOQwv0oCbw/h9c7TYOrIWa7SIVIkxElwzYNCNAbnEIKJ8sXHnyvOsoOSj4yT5yvjnyAjgogcjk1hxDj5xsJIZgCB7jz0Okx7QeHnE8N4251W9YWqtxEVd4achgwu2NDQzS+LdDTJS7DobokrFqH6lUrIJ7GDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyVfD+77YLM+p9YDeL+KP3qhhC52aS3w+51EqVmhJK0=;
 b=HK7AA0W3Qjn8YvbHwxJDkK37rtR6PfMKqzIMwgauc/znkZZhedkYEhFEE3VSdzS3NvLr77cPlmIF2wRxy5K+DvzPYMfeT9+169Bik0nAkflqkh5aeYbkZFiF2CsAhG6SBO7sG7ZRbZjGTtFmlUqajzvfMFNIn4+QJj8M+4fIz5Y=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB5984.eurprd04.prod.outlook.com
 (2603:10a6:803:d6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Mon, 21 Sep
 2020 19:08:42 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3391.011; Mon, 21 Sep 2020
 19:08:42 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Viorel Suman <viorel.suman@nxp.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] DAI driver for new XCVR IP
Date: Mon, 21 Sep 2020 22:08:10 +0300
Message-Id: <1600715292-28529-1-git-send-email-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::21) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-116.ea.freescale.net (83.217.231.2) by
 AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend
 Transport; Mon, 21 Sep 2020 19:08:39 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c1bf6b0-4855-4f1b-596a-08d85e61c110
X-MS-TrafficTypeDiagnostic: VI1PR04MB5984:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5984533A8E73AC2BF755202BD33A0@VI1PR04MB5984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EruP5h+/AFSISNMsRM9QwHhphiK1wS2LqHJ/8TJN9bLt+MfcjNCMz4yHMVrkU2HwrIlbW0D7NvRxGuUg70QGCCC69kkhpd2y9yyuTWrNjcAaqm+Ic2xRMYhsYa2RrbSype1S5007IQe4xbhgxa7cP54GIXc3+EqjRFVYISRYJJLwPbaJVNL1yUyYteabRRTeNR/L3cuZxMw15dHD86jhhc+w1CUGbo8CTBOhkVQGh4EfzRfJ8rmYsJoOJUmVQotELcooPcFQ8hNkX0QacA6v1COuPAmdXtZ8czyP8ss7Ewf5+qX/8DWSzGh6b+i2X/gxbwr470peaEQtC1pml8X/0aUZN4gfKC2EnsICKIijPwtD/yoGnwtqTyrfKPqsv97eq8c1h5+OfolTXHeosbO00VoJHgvI/nsxENhd04/Uu1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(8676002)(26005)(7416002)(66556008)(478600001)(316002)(52116002)(54906003)(110136005)(2906002)(956004)(6506007)(86362001)(66946007)(2616005)(66476007)(186003)(16526019)(6512007)(8936002)(6666004)(6486002)(5660300002)(4326008)(83380400001)(4744005)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: tTCdqgbBrNx3eNCv+cOaVvWyLab8PGMBAPnI0m77FuLCWNBHV24QZNm46aKGRpupVLdzgi2W7DtepsLCseboe3c5xTU4EN+e+GWhU+POf8hxO6DDuqNJckJGhXZkeTczQ+OB9D823GWTMdUOc1VkZrPUCHyQfQSKs86U+/NY7iwVFJgAvLwhv5oNrmbo8wECU0NYyRy6lhr9UEmX6xscwMHbCQTnrBp+FW18VO6fqSIlg2yFgehSdFVoTH5fE4bQneEtihA8s72No05YS0w7wODKoIiP78PJZePBIwIcXv1bp2D9+CuSamFBaJREzMeToqV0MGCHTC//bjuIdxh5GufJXk0CTbd50WzcKWdV50GIn/hvyKl+LBu0oXXWEVqGlicyRmKFHdCncOmyQGFTM22ijd8t8+OzgXlQMoPRPrHD7/r2hUrEF1o7uN2392/S5hd0fRZ70FfaeGJ27nNP3MgQyanQvu16VTVOxqKL2Y1H09CV+NDuZKiU4aoXTd9QlJhy4Nk8xhb6ldIINNmW38QH/8bJYE0JATeAdgLodLwVfiJ/Gal9+zN9qx9cTtTVijZmM8ljwahMc6bPZue4AmJJ6DLE3sIj8SvofxAyDywdeWRfcPFktPDWb3rYGnIx9OcYQdd+Q2LxUIWcxTN0Zw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1bf6b0-4855-4f1b-596a-08d85e61c110
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 19:08:42.0076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9ITDky8mBpPoFX8A8+vi+rlBZcsku+ftX4nKx4Mgof+4P4JM7BbmhBIWAfFIfxNLjWcZaZTX4Kg1xSC6VUKWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5984
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

Changes since v1:
 - improved 6- and 12-ch layout comment
 - used regmap polling function, improved
   clocks handling in runtime_resume
 - added FW size check in FW load function,
   improved IRQ handler, removed dummy IRQ handlers
 - fixed yaml file

 .../devicetree/bindings/sound/fsl,xcvr.yaml        |  103 ++
 sound/soc/fsl/Kconfig                              |   10 +
 sound/soc/fsl/Makefile                             |    2 +
 sound/soc/fsl/fsl_xcvr.c                           | 1343 ++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h                           |  266 ++++
 5 files changed, 1724 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
 create mode 100644 sound/soc/fsl/fsl_xcvr.c
 create mode 100644 sound/soc/fsl/fsl_xcvr.h

-- 
2.7.4

