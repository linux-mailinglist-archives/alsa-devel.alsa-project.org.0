Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 191512050D5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 13:35:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59FB017AE;
	Tue, 23 Jun 2020 13:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59FB017AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592912120;
	bh=8kSNQ7xQx5B2EgeP6gTLARTM6E6/21Rs3he/OGSCRXY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GKWf1booSgO6SATwmoTG0asWZ8Fr2GMNrvRFsQpP/kmCDHYZy1CCf8wVZ7KQcOT8A
	 un982XjyXlxzmFZg2+FU0yc94MfzFOnwJIc5xrizqg/3EHH90fJkNE267Hd1GXrGwi
	 /RB/rTgdEIuJPdBA5aWdPah4ViWhnNWLdfCvWszI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 805B4F80234;
	Tue, 23 Jun 2020 13:33:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D76E9F80249; Tue, 23 Jun 2020 13:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00080.outbound.protection.outlook.com [40.107.0.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF52F800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 13:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF52F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="ai6ermZk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7qylII9MuXotPfuIdmT4H6WyDCqknfDBNhCdDh4lGTDMVMe013U8pOKF2Cn4ZvHRhobvTgOQSbKoXiNXGSAmGP8eXOFyhLdnDlqBFKI+OPlGsS++y/7u4oIAta/cOn9IzEReQ1qUBOYoKELaXbt9Pzz9Ug9FkTjc99skH02WaTyiVrG8kWa1h9MaN9clQRxQ8OYvyGws3Y8gKq4YYO1z8gBwksPx0vTu+Fo1LE42WY1hJQrAJNvj2T2Z3bya0i/iDA+5OXIwx4L8L4qFXR/nDm6ntyoVlyaOQlaP8y1lPWIoAxqdobU3RXQpIgDg/M4sNJT7vdYRg99JY6kXy/5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2h+zOs5R0eliKb/t+GzJ425evISynD5H2FbKyoioAw=;
 b=nmKMHrsQl49+Xcdh/+WX3AHMM9W4G4zjnbPg1GdBpPcj1LgmArE8XFLhnN+XPld/ehQeqB4sK8L8cFcvg8evxb9zSG8Vam4haDHEpuc4VjWArakvY3k82w7ypZxU6tbbCJMlYa90s+YU8Fz0LH/qo37F7G2TcR4audNLLpcD9svUXc0ek+W+hXFYRmNaY/EuaCyE8wRkgGyxkokc2aTVy62yGv2WuEPdmcnTALMU/a51qsJ3TKC83MQWOHjS+b35KMXEqo4snDPvHGxP4teZKmqMs9jd3rTKxEBU9CUmYQ5NN2ifIU1RhG9TqFTQ07R3asHhILKj1iQunxa3k0ExTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2h+zOs5R0eliKb/t+GzJ425evISynD5H2FbKyoioAw=;
 b=ai6ermZkFR7LfD7vTruyqRpHXYpO9rhfzF4DAXoRRW1fk572DGhjmiAFF+ocC9+GxTenL80wB+kK/3EZHzEL/2JWgI1grRXZiPwXs9nlAWu2m7DkvS38ObF2Y1hmkBcDBxTE1dsizzpuOgGcMB2eH1uVbsxfMtk31EGUZgtbQQ4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0401MB2558.eurprd04.prod.outlook.com
 (2603:10a6:800:5c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Tue, 23 Jun
 2020 11:33:28 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 11:33:28 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: khilman@kernel.org, ulf.hansson@linaro.org, linux-pm@vger.kernel.org,
 rjw@rjwysocki.net
Subject: [RESEND PATCH v2 0/2] Introduce multi PM domains helpers
Date: Tue, 23 Jun 2020 14:32:59 +0300
Message-Id: <20200623113301.631-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0131.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::36) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (83.217.231.2) by
 AM0PR06CA0131.eurprd06.prod.outlook.com (2603:10a6:208:ab::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 11:33:27 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9035f05-f04c-46d7-804d-08d817693fcd
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2558:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2558B8FD27901D6207683AD5B8940@VI1PR0401MB2558.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tio7f3P4SM8NAquUNfg4XIi+ddw0SSWa/h+qCbjUxsbcxOkzSnyBtqe2+8FfFl6L2sHUStPrBWcnQqRPThrdF1Rw4xedP+J43nO63JBAcYmSTyMs/Ekop0Zrpznk24sptf3YlR/b44/MryUMQu6qdwCy6KK7ZkQh1ria68Q7F1wlNpnvz9nOmFQyNM32W14iHnt9fNeA3dDjB8zRcEl+fYOQPigjna9QcLZeIRNNoQlXVRVdk0hw2hayaIUdUjgsKiur40/+XxaAipp00BGinqZvG6Mk3Wl1EYbs87HPTeERd/oBSfqDqTcBo1gxw9M1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(66946007)(6506007)(4744005)(4326008)(5660300002)(498600001)(44832011)(66476007)(8936002)(66556008)(956004)(86362001)(2616005)(6666004)(8676002)(6486002)(26005)(83380400001)(52116002)(186003)(2906002)(1076003)(16526019)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1nHRGlNWpKvPbfa7d+nNZl8tZa6qXiqCXAN6YAlIV4mBiQSlFK7+MhSNpR+6gaxPogVrs+AmpigXMCY+xjxYt4k9D1zK4MxldPtTcX5iyK7z/l4UEh/QcRZu4cPrbKsXo+3/dcYhigYC6HGDwscaRsa187WnLUy100fRkwl5IOUgV6lNUCla1QD5EBZDmSmlWDlAzw0jYi8uLMufE+8JMz04zm4tvfvZ2n2Ey1VKk8T7Kl4NMZ7sDceGPMWIAWEWmviwNQUymHDXO5teoxj9Yk8sni3fRh0yNWKw1yxuM9meWy+Su2vjvTPASPajMJGckPd5h1Gv4nTYrHmLZMMdsx5BHbSjgn3806GTrB1JT19sRzSPgtRglhjhIqH6BAcmX1fl0JyeQ1kMU78NHMb9BbX3GZZMP76LjknvlLJcFb59iMfljVz2gLyh9pMU0D/2SHu4TNaKi2MskLClaDpZP5zTWOU8DAZlu1/Lymz2Vgk=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9035f05-f04c-46d7-804d-08d817693fcd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 11:33:28.5860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkBqLzG+n04ZiP6Ks6uMZ+feB1rUFVkJhgjyl2LoAikOB0MyF+NFdIRSE5r7n6gJnEfAFf/ScquZ0PDki0rEBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2558
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
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

i.MX8QXP/i.MX8QM has IPs that need multiple power domains to be up
in order to work. In order to help drivers, we introduce multi PM
domains helpers that are able to activate/deactivate multi PM domains.

First patch introduces the helpers and second patch demonstrates how
a driver can use them instead of hardcoding the PM domains handling.

Changes since v1: (addressed Ranjani's comments)
	- enhanced description for dev_multi_pm_attach return value
	- renamed exit_unroll_pm label to exit_detach_pm

Ideally would be to have patch 1/2 merged via power tree and then I
will submit again patch 2/2 on sound tree.

Daniel Baluta (2):
  PM / domains: Introduce multi PM domains helpers
  ASoC: SOF: Use multi PM domains helpers

 drivers/base/power/common.c | 93 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   | 19 ++++++++
 sound/soc/sof/imx/imx8.c    | 60 ++++--------------------
 3 files changed, 121 insertions(+), 51 deletions(-)

-- 
2.17.1

