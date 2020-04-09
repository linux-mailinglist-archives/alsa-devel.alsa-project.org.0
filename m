Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1241A2FEB
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 09:20:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4D651662;
	Thu,  9 Apr 2020 09:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4D651662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586416846;
	bh=/SPBEVZ9zxg/r2+vRrfueFwQdffb5KzJL3y/q98cM8s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pGZSFCZz46rKttUclKUbmRGVQBXC1a3L/SupuwlV9cKDHZkrvEUiy0qb+0iSbPdkM
	 PuWpok+svnbU5pbOQ2U629fXsoKGRewVCFmovOovFanbNPjE0wOLHwNICmsIvO/QUw
	 x/GQDWjo4CucuOUvkL+ieDmbKg20YWQpfta8oyJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 117DBF800CB;
	Thu,  9 Apr 2020 09:19:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54302F801F9; Thu,  9 Apr 2020 09:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6591CF80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 09:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6591CF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="fBHl3nAd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKNfJWcctU8ATMyifCvTrBZK4OcYPXdXBY11kfWUtXkZUu/HMZmAW+hSZKm1M4h7XUR6sdohlhC5pa9Fn5FmOPJciUGer7hCWk8LIENmTt9067fHO6GiAvCbu8A5PNMyCr76y3LqNDVPTll2+/jc3/uCJ54JpQPe9JDDGHPLjBDllZWqaRe3HYC54pw/oQq9i2srFL+ZSmfRqWMqU3wB7BgBr6bfjLI3WQkhVwCk1zFB7sHYxUPQfoOs6BB23ftQ2posmDL6TSedPaZb/PvV93/ki6LejeMOnY2bLPI2HtqNonPJswafqUKQYkqq8APJ7II828iD95Uu4/LPPtlc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mk8+h7R5wYqtP9UURofjAZhtSs0oAT6VipNz7xuQLks=;
 b=Prai0z353lsOG3ytZHvlhPBjGqPvlTNShVH5i60i3Mo9m0JmQTwC3L+hWG+FDGDyMz+wjiVuHNyzwT/FW2XkTg7Z07Ytbb4aJvg4rru8ZZK9jJn7YAXuqumZc7zE0QzQ8QlJ5xI6LXTisxa/+fdAEGb4YZuCrtD4idplzkAX3dxi+BiU+/7BTTUKdDch7b3BNtjCqfH07Oh+ZYHwA8QqtXoh/aBfQnMb7RjVypHQGKhnqcLPjNzG99ol70+ZlauEhNEfjetEnuJQxk8Ff8GLcFEbrsiQJbryRD/aOPvEcWriqjY3TqlNe4YyM+u0HmGDLfxmT8/2MpucTwLRwuuRDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mk8+h7R5wYqtP9UURofjAZhtSs0oAT6VipNz7xuQLks=;
 b=fBHl3nAdLFjki3SeAeo09xE0vJPklz6M71D7LXE5fENfWkavP6KduU/gIZqyJG4yp2CuPfEZofyfyhUDLME5uHR9Qd/DENB4PQnSRrfUTgX9BzyCX+NlTs4kePCdfpTfFxB/K34aEpEtnN+2l+6ztmu+9o6XqyPAO/wgCoGVy/g=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com (2603:10a6:8:3::30)
 by DB3PR0402MB3756.eurprd04.prod.outlook.com (2603:10a6:8:12::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17; Thu, 9 Apr
 2020 07:18:45 +0000
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::f0e5:c143:32aa:ed7c]) by DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::f0e5:c143:32aa:ed7c%7]) with mapi id 15.20.2878.023; Thu, 9 Apr 2020
 07:18:45 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 0/5] Add support for SOF on i.MX8M
Date: Thu,  9 Apr 2020 10:18:27 +0300
Message-Id: <20200409071832.2039-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM4P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::12) To DB3PR0402MB3835.eurprd04.prod.outlook.com
 (2603:10a6:8:3::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM4P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 07:18:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bbd7ccac-5399-42b3-aae1-08d7dc563d18
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3756:|DB3PR0402MB3756:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3756190099B6C37B62094601B8C10@DB3PR0402MB3756.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0402MB3835.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(4326008)(5660300002)(478600001)(316002)(26005)(4744005)(1076003)(66476007)(6512007)(81156014)(81166007)(66556008)(6506007)(2906002)(66946007)(52116002)(956004)(2616005)(8936002)(6916009)(6486002)(8676002)(86362001)(6666004)(186003)(16526019)(44832011);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iGGGFXiEk0xt9U4idbP3uU/TStipN4UeBIt44KGY6WrTWufBD0SlPK1Wh2ujhnYii12W0ukHkJCZuxtYfI/yz8CKkZ2b0hxcIghv7rAjUa5XHhMwHZYi2NF1a0+U5piFN9HCde24lQ4e1IPYd8i6apRIJRzkEHLaNzZop136Eucb3+Zk1MnEroGFNLMLCCSaUd9/1uDKfubXXchcLfeSA64xETPfX1zYYpqV4auk430tQXMWtOmSm1RwhqaWrtqvMWJCnxu4xL8kofDC0IgMf6ZBe9tcHnvhu24qEdd3/jQR2G8wuhHLrCF6co6fU5k06yKGXHXCt8dGnvUHdQkx/sasB1HEd7enc4eRW4V9Xy0GI3QRDmL+BnW3uOcZstOUYe3FR908ZQfBBZYfIglVDIfltjFu21hNkCuxMF4KDtCDDcAdCjZKSUc5xL/LoMwC
X-MS-Exchange-AntiSpam-MessageData: qWgNV3Q6/GsrVoB/t+yg7Gt3AYFqPp6xxjPKg3GjmfFtQyIm9bjrhWDpVyFHbA5NaD22JneY8LEQctOxWkoSdKHGAxhDSeiO9WKoNBIBfmOYN3rsfxhRj2EC0tHZIxVpF60xFyKF7elK5bRxUNrDzA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd7ccac-5399-42b3-aae1-08d7dc563d18
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 07:18:45.0447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOisoa59itoyKQCnxQpeWizdgUdtfH86zWc0Lkk+KufVk7lXP8wWzR5mUqv7tHOX0GamE8+1YxH0nKaZOEz2cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3756
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 shengjiu.wang@nxp.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-imx@nxp.com, festevam@gmail.com
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

This patch series adds support for SOF on i.MX8M family. First board
from this family that has a DSP is i.MX8MP.

First 2 patches are trying to fix some compilation issues, the next two
are adding the imx8m support and the last one adds the devicetree
binding.

Changes since v2:
 - add reviewed by from Rob to DT patch
 - fix ownership for patch 2

Daniel Baluta (3):
  ASoC: SOF: imx: Add i.MX8M HW support
  ASoC: SOF: Add i.MX8MP device descriptor
  dt-bindings: dsp: fsl: Add fsl,imx8mp-dsp entry

Pierre-Louis Bossart (1):
  ASoC: SOF: imx: fix undefined reference issue

YueHaibing (1):
  ASoC: SOF: imx8: Fix randbuild error

 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   2 +
 sound/soc/sof/imx/Kconfig                     |  32 +-
 sound/soc/sof/imx/Makefile                    |   2 +
 sound/soc/sof/imx/imx8m.c                     | 279 ++++++++++++++++++
 sound/soc/sof/sof-of-dev.c                    |  14 +
 5 files changed, 325 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/sof/imx/imx8m.c

-- 
2.17.1

