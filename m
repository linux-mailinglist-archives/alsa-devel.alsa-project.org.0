Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203E17BB64
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 12:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D418715E4;
	Fri,  6 Mar 2020 12:15:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D418715E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583493370;
	bh=dcwB5Cfp/t1Pvc/a25F1g1RcpS4OBv5wDTP8ouzX9o8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jB3HrdX2vazWyDrGsN/3Z4Us42uLT/tVpRuyxsWnqMt4CevRzmjq8jK+vSiRUZrcf
	 jSIwoBtNYlkzGNsMVlTMDdqJGtF98l+ap0paSRWXCsCrlfOxYq/7yM5bOEmhpqDEe4
	 ro8u2Gy0lKg1xB6kcRKGTyUHDOAz5D/px7/2o8gE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBADDF8012D;
	Fri,  6 Mar 2020 12:14:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7A71F8012D; Fri,  6 Mar 2020 12:14:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70082.outbound.protection.outlook.com [40.107.7.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBD49F8012D;
 Fri,  6 Mar 2020 12:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBD49F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="iZJCUlFZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMYrDJ+RiLV+fUzn0Lv+jhLmLDb0FgPUQbbnlBNnafGt/x8HB5wLI/Mn2wg8bzIVr2GzCEJJTUVG5TlsapCLQ7pS5MlhJXtO8vQaDjAk6i7bIHmZ+aM7/xjm2rAO2yT4WnaMZknHrSwzZN4P0jm8+1+ht5UjbQIDF3Cq0xct/2fXVNKaA1UtjnGx4j7ANpFui3qxvZiBQP3Eegg1K3jBX9BPNrD//0McNwRkRZ3ht/oPOqa40npMT+dUx4Apyl8Rx4ZuRn+1eECKhU3HoebaUJ8dbSuQs7kPqMxY1RGAo8x2UbOjyHxuzyU2lNTzKVZf5MXzcKWOOqPyD5oz8CJCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezsP6mbDe+fbWpsAiBJaO+eQ/7GhRZnesqHLLSKP1ek=;
 b=G/nR84zVpRMAkMTOFsSofB+9tRD6onr5iTnpCyeg8VxmZptz4jiE8Kxlt8+eyLZMF6oO0gH7qUUQiJdIK504if0OB7HuCGbBuwM1dG4MQ3e2jObabTcXdkEEExezwTcHBFK9IxTc+uSFbPU45c6ZDxHCWnyAptbdrpKGVu0IioHvMHt+F7tfesAYmzIvIgF+/CT5CvRQEHerbKEELgzcgvKz1yYBUZVQ49tDvRhwVGyAmt3xTYL1qD2uTwqek2PKvHRIoTLNKGvx+w7wWQ+E1FbclKzK4M2C7Nsj3X6dR1Fy8ZH4TxSPTOVUlrl5a35XKUXlY0Os+f3mlDhF++bg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezsP6mbDe+fbWpsAiBJaO+eQ/7GhRZnesqHLLSKP1ek=;
 b=iZJCUlFZ6g5pLDq6ggTZxgA32vwq2+Mj5MJ/LequhgSMT/a+1/5O5Xu3clnNqJ8BsvmWGX7I0faHAP+221Bzk/ssq0sneVrsfFTx+juVDbFa61gbxBRsAEVEgfSEIyWacD4JhlcLbjQzCNSuVJ+GeHvMF+0ALF8oYjGMTLdNfXk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB2830.eurprd04.prod.outlook.com (10.175.21.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Fri, 6 Mar 2020 11:14:17 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0%7]) with mapi id 15.20.2793.013; Fri, 6 Mar 2020
 11:14:17 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, peter.ujfalusi@ti.com,
 broonie@kernel.org, linux-imx@nxp.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Add generic FSL CPU DAI driver
Date: Fri,  6 Mar 2020 13:13:51 +0200
Message-Id: <20200306111353.12906-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0039.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::16) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM0PR02CA0039.eurprd02.prod.outlook.com (2603:10a6:208:d2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Fri, 6 Mar 2020 11:14:16 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c4ea8a6-a15d-4e81-83b1-08d7c1bf82ab
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2830:|VI1PR0402MB2830:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB28307DD46000678FE7B8F357B8E30@VI1PR0402MB2830.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(26005)(44832011)(6506007)(7416002)(186003)(956004)(16526019)(8936002)(81156014)(66946007)(66476007)(6486002)(2616005)(316002)(2906002)(4744005)(81166006)(8676002)(66556008)(478600001)(5660300002)(6512007)(4326008)(6666004)(1076003)(86362001)(52116002)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2830;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLm3slKn9JPS+yGemICk3VCio56efBc3lYeUUjNxSpI+FOsTm4F8fXnI0vcoQrlS6y2brTujZp1f4QKYh6VieTq/g2Y3N2JN1/WOvCoFBORO5GWhQYCOqiw73l+km+7beoA58F/GWIZb2rL/T/EhCtCIK8vG/2np4jg2jNTp0KcvI8FCKdF8fRNReOEwzkLUrmQ6MXtLzBsylavOKkOHehPIptvs4x95jUxWMJC/1MWeIXxTuhR3tyiUMH0PoXSoETksrS0IGgAGbkA2gALQ37rTxOYJ0hf1ymkeZYo3/O32D1i3EJHSZf6mpZAELYN7yc0LWYPNWhGqMObQSzv56mUB3D7Ua2n2b7HQMNKp4V+H+0DAWAuUrSn+ZtB5ZwjFPAJVQzTk4RwqmUah9ul5gpVit/foSEeUw+gmeUVDNmT1MqP12nlVNAes+5AUpYq+iBuK3XZCkD1I+sVTHEDDmtBliLuzNMoQ8XMmwPhBJxa8esdKUZkwKRkxRoSr6BmI
X-MS-Exchange-AntiSpam-MessageData: s9fYuQvGBrm0FRVF/he4iYTKVwpCa/xDclU4YmSeYU0wR3XA9ocwk5v+68Kw2uq0EAX6lgZoGsgQ4u1uQlz/rKe6oCcNTGtr59icSndUsBJDzznbndyZcnd3uh6DvfwSQyAkSiaKNlQ0BBrgNKS1hw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4ea8a6-a15d-4e81-83b1-08d7c1bf82ab
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 11:14:17.6824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdeAYfU6JppZXeRz/LjFwMBxy+v3EmpQYEVMvO44cU9tS0BalIrLcat8MoTiUqn7fVNdti/JFElMJPDxMG6PWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2830
Cc: Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, shengjiu.wang@nxp.com,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

On platforms with a DSP we need to split the resource handling between
Application Processor (AP) and DSP. On platforms where the DSP
doesn't have an easy access to resources, the AP will take care of
configuring them. Resources handled by this generic driver are:
clocks, power domains, pinctrl.

Changes since v1:
	- added dt-bindings patch
	- add missing signed-off-by
	- do not hardcode the name of DAI driver but derive it from
	newly introduced dai_index property.

Daniel Baluta (2):
  dt-bindings: sound: Add FSL CPU DAI bindings
  ASoC: fsl: Add generic CPU DAI driver

 .../devicetree/bindings/sound/fsl,dai.yaml    |  97 ++++++
 sound/soc/fsl/Kconfig                         |   8 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/fsl_dai.c                       | 288 ++++++++++++++++++
 4 files changed, 395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,dai.yaml
 create mode 100644 sound/soc/fsl/fsl_dai.c

-- 
2.17.1

