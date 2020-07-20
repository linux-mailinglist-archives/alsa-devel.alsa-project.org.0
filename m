Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E522585D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 09:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D42B1661;
	Mon, 20 Jul 2020 09:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D42B1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595229781;
	bh=HuNOlycnT7cCLIb47BgTfT/tteWneNn9G+0sTg+Wfjk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PxV6JUSnHrbnC2joSoLtCJXKzXXRij6e2eSlMrYk3Rm9L+GhXgRe4KOc6WO25ocn4
	 r6NIROzmT2S47rSRpLBmCk7BleokT0J5bh/iqV0B2bExWEDOIWzIL1Akka8K+mrWkI
	 rE4hIsmzvzXoahMx0MwDH0ElXRjVz/mwYjnLMY6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C774F800BF;
	Mon, 20 Jul 2020 09:21:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FBD1F800F5; Mon, 20 Jul 2020 09:21:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60043.outbound.protection.outlook.com [40.107.6.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02898F800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 09:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02898F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="L27AvMuO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxEKylQMbpUP6Ux6Qs6udjQjbO6oySoFGgppfKGSHom2xRTaDcpB1mLO06vAJDX7ivL7nYlr+trwebJdMmUa84e3KmTezNyFHOQXCRg1cAH6fNMJHc2cmT0y5nt5MWACx8zHjQQUXbYsnDhLiMfVg6GTc1uLgcaA917xPjc4jAyMH++REdt2CCW91hhLvNPbWeN5R2UAMI0SLrpZ0i3UAvnmgBr+TgGTCn2sTFLfRyE/lLfaeHQVjuuNFw5Qxlbz79wjd3fTl2JaKPJeqeImFr563NDo3zejHAdfTdUcLv4KVMc3WGjQ6VUtwyUPFpP0PISaw1Q1X1L1HhbiOhgJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lchBF633V1/LhaFVPdTD4lougfEpqEo/qVDaTscGSEo=;
 b=gz3m8+l0oMkTumml4J4yBrwVcNAu+x3qQX5POvE6jBD3lqBsiSkwvW+dVd2eMlffjAty3hu0rSxHT+JoWNT92Zp8PfG161SliVe+PG9BuRuILEp8W+g9wKUlNy7zsPSu4ZNSS0/t5lpQwY1x1TkBjiI4a9MMp+gxth38fXeMXlgubYZVJmDj+MtEQm1icyEXEjHrPYmJchUnw7EI+xa1bFfLta7NDNOHmEEkpezMagkLv6Jgs09/0/7Tp0B6hTGi6utc/LPlpvZdYwQF+uXxvcLVsBDddBhzHthX9DKeoZNbXZ8nJdQH0p5XWVhbx23Wzu6oJdVFg9v9FdG6vSCyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lchBF633V1/LhaFVPdTD4lougfEpqEo/qVDaTscGSEo=;
 b=L27AvMuOEd7UzJiI9gb3EcVQDSnvyJti4AeZUa8G1e02IndSvSL+ymHX7niMpIe9i7QxVvZgMDEc3vopi6azxYo0nKD/wFqnhUVHvvSA7c0Ab1aObrDwXmWMTZSLNoGtjzEOhCl4rAsWbgLv+VqGAN1vaplHrAP4MGz0A8C3New=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0402MB3344.eurprd04.prod.outlook.com
 (2603:10a6:803:10::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Mon, 20 Jul
 2020 07:21:04 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711%5]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 07:21:04 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/7] SOF IMX fixes
Date: Mon, 20 Jul 2020 10:20:39 +0300
Message-Id: <20200720072046.8152-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM0PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::36) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (83.217.231.2) by
 AM0PR07CA0023.eurprd07.prod.outlook.com (2603:10a6:208:ac::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.14 via Frontend Transport; Mon, 20 Jul 2020 07:21:03 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67113e0d-2b07-4d81-aca5-08d82c7d7657
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3344:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB33445B56D042ED057A311030B87B0@VI1PR0402MB3344.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBIWcN2wQLJxSEl8tnIuVDx8myAEyjBl0LanDlnlb307ZPoQ29xEQYiVa/FxZNeCMA+LvNtSX4otqa3NpgG/uC/cAxz1LhuPOhENKv0y7BbgdBquHJAWRzqqNut3IEFkd4EXVpiI0vms2ZrwhTwbpZBqNsAqhYeBoq/czJ5LM1pPmjCC6maG905dzbKbmpahGo5Ofo9aw+GvI2cyQvuJFFKGMOZ2B/2y3BzXaGLl588RjEkkx9g6JJhxTefGAifLZsKSnsgaI/3WQBehBhNHPs76hH5noawdaxdfEin92flycU9t7Lktvm8TiZXTkvivybNWtDKrdCqaRfYue8SMaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(316002)(6512007)(66476007)(66946007)(83380400001)(4326008)(66556008)(6666004)(186003)(6486002)(2906002)(52116002)(4744005)(86362001)(8936002)(44832011)(26005)(1076003)(956004)(478600001)(8676002)(16526019)(6506007)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 9DuOercu+nlKtZVtHh7RB0OwKV6L0nGyccHee5NSdJRmyMznIJex3LI6iRiQsyFxYHxeEJPERcrOqo5abPjBb3KMGUA4SMk9C38X44X58LaSRY3CupYHkE6ZdMVQZilABeAAxyibc01SKIp//SYr32IYZmSZ6uB/EHAdRMsKxVM9jide3eJdGZ/6luyqw6aI9prZ+PKJPKyVb41VHGIehMJnd11d355svN0qd3M+g84zyy+GM+UtaKmckyPMSWDOYb9tlv6tcmGnBB9+28Fcd++KulLNoBJDdfaP2w4uYJWcKCz9KVZpbkNOgyCks0ISb2TceT56xrV52my5haV8DlJIyhzbxd32tkqGiX3FtVxz9kFA2i8wXZ4xEoJnl3AvypRg64HdaI41Z04Q8uHU6QZaljEhyVMixwN26aYxMcBwHwzkwYw9T3B8grS5gnaK309B60FFOdOCViUlouYAEXzgzTEZ1EloRE/xWW2UPBM=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67113e0d-2b07-4d81-aca5-08d82c7d7657
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 07:21:04.5564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EALIyqUK9vVpGyxvWs/WIpqVy5o3m4Kp6pFD26+wEcD48HqKtrNzWfv2Oyi5rhvjzMDEk3+z1+BVQfL9HYp5Cw==
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

This patchseries contains a couple of SOF IMX fixes
found during our first IMX SOF release.

Daniel Baluta (7):
  ASoC: SOF: define INFO_ flags in dsp_ops for imx8
  ASoC: SOF: imx: Use ARRAY_SIZE instead of hardcoded value
  ASoC: SOF: imx8: Fix ESAI DAI driver name for i.MX8/iMX8X
  ASoC: SOF: imx8m: Fix SAI DAI driver for i.MX8M
  ASoC: SOF: imx8: Add SAI dai driver for i.MX/i.MX8X
  ASoC: SOF: topology: Update SAI config bclk/fsync rate
  ASoC: SOF: pcm: Update rate/channels for SAI/ESAI DAIs

 sound/soc/sof/imx/imx8.c  | 24 +++++++++++++++++++++---
 sound/soc/sof/imx/imx8m.c |  4 ++--
 sound/soc/sof/pcm.c       |  8 ++++++++
 sound/soc/sof/topology.c  |  2 ++
 4 files changed, 33 insertions(+), 5 deletions(-)

-- 
2.17.1

