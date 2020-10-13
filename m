Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0CC28CE39
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 14:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67933168C;
	Tue, 13 Oct 2020 14:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67933168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602591584;
	bh=x0UFrDmsXp4pRyN3b/2KAnmVtcFIOzPmN60HEJF7H7U=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FTC1LOPY6zylNZaRyf17IAeoU9cfFe/SDkjgux4IkgD3ClD8OVxzshElW3NXNQ2wh
	 XsnvSicu+NBXY5Ra0UKVrMcp0nZkh/o32U6nZ1OGCbOP6/YvsWRWr9rzcZ5z1MXhF3
	 Xj3LkPyLjaof6UspYeMlDxfqUxArakWIKLQhDgxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18581F800F6;
	Tue, 13 Oct 2020 14:18:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30DD5F801DA; Tue, 13 Oct 2020 14:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37CFAF8012C
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 14:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37CFAF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="OIewM+3y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5l9y21XhSilciOnVt//Duc0kGclmJfXVhy35IcpDgUXdBcHVKfJrzA6T9BA8NcTQavC61h02UnaFgiWIp+QHveP75MmX6f31G12F177BI+T5Zh1bPmOetLg76H9vNWSS6rMA5/745+ckmugFJ40mrThfjziqEmY6PEAm3V6W9yKaASJtxCVVEQElD0+E9NezP4uRVOnjatAXVHFuUdCWolTYjUTEESoEauo4KnUBOhqyPHTeS/U1GSuRQxuSqAbn14G5DEKQn9grzfGvaLmh+exQeWwkj1Ro2ITW2jjwtqCgia44idT/QiTiqO3aMyErsiqMHwsTsZeXT10yf9b5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JaE7/bqemLdRxXcnYJy1Z/duOlfz84lZtnvipj0N2E=;
 b=UB/2Um3xAZaVlloMqLtwGS/2LmrvBwSOCip8+0VOqOOOXiF9NnxZLfqQtoycc7wa5+UtK7pSm+8oJztC7Xv78tNIMO6q3XAl7sKune7Fykr8bp3J+hBIq/MFWBu0OCat7PVR+AtyKEfPzUMN4BfF5PjLfqRt+CIG4kLXnBcpT2sBusFUJxt5UrN/VeyJudVz9r9ZX1DYGjMySyTHCMq4dVQBI+bNpIJ9VkfattxcujyRVQubfMXB+2lBQERSckRd+W7QIU5f1yVRnWXN0n8vZEVIsCS9tSRa7KhrsQshIZTRCuVksdWUmOMf+5g1A8qRa/fBNxLottY8KyzWt7kTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JaE7/bqemLdRxXcnYJy1Z/duOlfz84lZtnvipj0N2E=;
 b=OIewM+3yzD/NjNFaQh/VCreBBFZegOwRWO++9jH55lyqKeYPVvbW++NtSr/HWPCMNS3MtBxhy3aWupqkGfseP1CVSJZQNdrMhEZxn3u2DKe3Mu73spjN4EcKStBHUECg+Quhpg3NjR2jtTX2KEegQPJbIfP81CZPfaZD04pYmHk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB5198.eurprd04.prod.outlook.com
 (2603:10a6:803:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 12:17:43 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 12:17:43 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/2] DAI driver for new XCVR IP
Date: Tue, 13 Oct 2020 15:17:31 +0300
Message-Id: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.127.156.60]
X-ClientProxiedBy: VI1PR0602CA0007.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::17) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.127.156.60) by
 VI1PR0602CA0007.eurprd06.prod.outlook.com (2603:10a6:800:bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Tue, 13 Oct 2020 12:17:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a737392-c1ff-4a87-67bc-08d86f71fc7a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5198:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5198E8C7D1586FEF515C48ADD3040@VI1PR04MB5198.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WlyDB+Bqly34esfairBbcCvYfjWZJuPrxhFiB4uLsbfmgADlnoTHd5iphX6ytHL4hQNpfBtkQ92eCPRFzuRntkLCbarpoR5PKtB8s1MSK+TxAJVunIWqj4AYw6ffguDBj2Io0aNe70D6a4VNNnZSDHf6/vqr+M9ptVDqRzdawGADeu5q/ifM/39BaVfvZv0X3vs/P3zgF2PpAtFefMeBN7Pcxhh82eD6i+Pat9145kWFts/HnJXgHia+RNvJUeBGPCQ2Xt9VbU4MVdTXHqdFJFEQPM6+aNFP2EhdxFhYo5YpEmTywlbMWbbGDWN1v2Ubjc95gHPqUwKL/BLL8Z33JJlyQBmMxEATbVFTqZppu+9Vc+wa3OFDZrmb/hIdNhdLUop30ZDve0qbgeKQ2wWjHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(186003)(8676002)(8936002)(5660300002)(66476007)(6506007)(7416002)(498600001)(66556008)(16526019)(66946007)(1076003)(69590400008)(956004)(2616005)(6512007)(6486002)(26005)(6666004)(52116002)(110136005)(2906002)(83380400001)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gwt5oawwT9FgdIraAybNjl0HGbGJGngkX5KO8e10EbYlLFB/i6U20o3VjQ+B2dHEBznX6YzS5985eneoNtsQMl5iHG+1p/cWm9nffRMtafimpAhT9iSshobmr7GYlw4R9g0ou8cD07HD0VAHb3maQ/qemgbpKn5S4t2UUXl59LxH8HFg3g7ekeGwhBZ8WbpiH1nm+44MeYLGle5Smyu54tcNuxFyqAkCBR2DRMouTl1YqcZtqyrv1l7DO6Bea0Win/2r8YOAhlynX2LFG0BueKQmCY+4JkD/afluJE+/F6LmarDQrBnytdywk9k8eYFci4jkehA6rWYG7uNxFGJjoQEN8vQtxdrofsCOsxqtSBgeIIwusnDA36+BmXO6xRReIex05e5B0LyQVu0KV6yjFosr68BE+BYDvLahZ5DaFANrkQ+wrpNxPNvBanzpTriekZQD6C8B1qhnVR7L/jDb/GQu5/SXjaXr9PTrG3zEf1weJ4heYFRcI90zhJRK8aC8Hrj4K8QE3LcGfx1WP5IFspu+6oKCVYmErENk2DmtUoESjjysT4dyE5QqnmkjZZhhXlP/HjSl7Vv4bbOXYZRtHULe3ESa71CbRuZvSvo3KUF6rbCc2pxXoDkkBl/6LE6+CGT4b0NK6Tk/UKS1G78qTA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a737392-c1ff-4a87-67bc-08d86f71fc7a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 12:17:43.3671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Vn3I9D8iCJ0uNTPSBAsY7yG2CZ60f5mek5nEWoBscpA/k2D0vwb9fYrD2oQmFpKkiRJAhzY3gaNSiUJWxJyQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5198
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

Changes since v2:
 - used devm_reset_control_get_exclusive instead of of_reset_control_get
 - moved reset_control_assert into runtime_suspend

Changes since v3:
 - removed "firmware-name" DTS property from both documentation and
   source code by porting it into SoC specific 'compatible' data structure.

 .../devicetree/bindings/sound/fsl,xcvr.yaml   |  104 ++
 sound/soc/fsl/Kconfig                         |   10 +
 sound/soc/fsl/Makefile                        |    2 +
 sound/soc/fsl/fsl_xcvr.c                      | 1359 +++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h                      |  266 ++++
 5 files changed, 1741 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
 create mode 100644 sound/soc/fsl/fsl_xcvr.c
 create mode 100644 sound/soc/fsl/fsl_xcvr.h

-- 
2.26.2

