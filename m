Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE005A510D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 18:08:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A311675;
	Mon, 29 Aug 2022 18:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A311675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661789296;
	bh=I0ezOt1Euv4gM5BjQaVhaytzvQHvyzxNH24pb495loc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9pqDBCboW7GAW1AG1ET3bQc0Hp+4xCXBg9JUuW+D3F/fsJXE1cnnO52DEpTAjIy4
	 c397bO1IdSMn4nZ4a3HzZyJMzaqDyZxZ9/NMVp8OJA0I0o3iLUv1EW6zWbnVBG3y2Q
	 1rDdUiTajc4aJ9neoedUBikax5uY7HyWo8kKaKYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA32F80548;
	Mon, 29 Aug 2022 18:05:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A438DF80217; Mon, 29 Aug 2022 09:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62441F801F7
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 09:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62441F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="Rd/HW/vP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYhPTOxkfk+Bw+fqB6Mcq+Rhoa2emh/fIss7Vu2Xr+VZjR68sC02thcNuXAEwTi+f7a/2sU+8gwGemyI8nynynUgCTeeBSVy9ZNjrrQbU+OwOMvvPvzHtwcR5KLR4acPTp2yE+GwGyfqizAYJ9/3VHwUI9AXpLouGvW86B8REwbaoeXJQWUUBaK4LH+4Zp6lzIBSPEPGxTph5NBDwB+XY72twK7fAVcaKn2+DwaUTkL6Mp9AB83pNCrfHlw5VaBbHe1DsKEKcJd+q6mvkKqnSgRHxIAD+vmRD0L8jmXMD6Bk1yLILHMO87tduSXz/iMDwBbqovx8N/3C/K2Cx9sK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wno8CxvdVRt2yJyFix02lqnTMx472fE5QdDyrOjvw6g=;
 b=kNlcw8qSCO9aH+0NxIF0JqE553GlkIEuzSJpp9SWkO1T/0YGtkdL/U7KHyAaD8AO/RKvMoz1lzDDzNCQWIGvUVETPhd+IPz0SPYSz6LxwKi54kvOdEwnkmEAjg9yyYsNh5GAAtHIn3e4Dwkxe/4vJNqoqvYsfEsuZ5JFC5qHffNlcmMt8ckHB5E9fjGEqLwu/vUo/GX9yhwaTNALEOOSmdXOsf39s4TBUurG3vWPjALvOPZUt5q6tzJ4vK2u/PdYSVjUXPoIik5UCCnEVb/VGkZ6Zq0WM81FGywO+5Bg5jKfZHL3FJe+JIZm1vNIVkEFr4TE9ETRF1Q1EJoByoHgjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wno8CxvdVRt2yJyFix02lqnTMx472fE5QdDyrOjvw6g=;
 b=Rd/HW/vPOo+d5l9hJex0lfPM53EegNsmfLz82lxr3CEkVfLNAcPtNVhBJVaOzKj+u70OMj2A/XPbDRtVh7ORUeM5LQ+bnaOir9mhIeVG/yylNutw6M8NHIGZTZFs+TY2G1fzKx8eaNAmZJqBcxLFFzkKqexa7PwpjJPf1arJS/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DB7PR04MB4220.eurprd04.prod.outlook.com (2603:10a6:5:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 07:56:12 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3139:70b4:6648:bd32]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3139:70b4:6648:bd32%4]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 07:56:12 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@nxp.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] ASoC: fsl_rpmsg: Register different CPU DAI drivers
Date: Mon, 29 Aug 2022 15:51:43 +0800
Message-Id: <20220829075144.2405000-5-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829075144.2405000-1-chancel.liu@nxp.com>
References: <20220829075144.2405000-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d769fa4a-8b0a-4cd4-c805-08da8993f0ce
X-MS-TrafficTypeDiagnostic: DB7PR04MB4220:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZSf9d/SGbFG2NSG0hSc8N0GPv1AO5vO1F7oTVgfKXd7MNRHaA9M0FRYxFyc21hJZMBtQ89EfxJD2+9Mk+V+RMXpxUC06db8Lucr9ASo705jaI9u1nVcj9OX2yOVAgFDD3HWn5Rr0vnUQGp+EbcGgwVInyHPKQBEaS5b/itrT5DdjEvamui9D+tofEVvvL442hpSyJkkn5ZzW7Pp1XjjLgiAE4QlfHuYv7/mTUA+iuPya2ZcgHASFi7W2TqJOO9ZWfurKgkymptFuWBKf2bw+OGnD1uD9b0rP44IAYJG170AbwZ4G2kEdWtUkXFFJPtzkm2GfOegqFDWRQbdqfbyylOrXa4P8pmlqBHSxJ4tTOlsWv6Jil1wXtnSgktRjNqG+pQG5vX/FN9jrrV2bkU0i+HJdH9WLgl3qpQyFD76b1N5/bICzvYAHqEUtNLalbXdDS2PJyoxa88Hb5bAY4lyCLtnLIVsDCU+9/4POowAE66HOLUCU4x3c/fyyNzApuXcjsKdWRdEWb72iajss9G35g6STwxg86Spbj7z3x4jYr90riKsFf+pLuBuA2ygZ/puL26hFPMmaIUfTprx2LDpofe84ibfNAsB2DAiTtxGrObfFcMQBKfOxXnZEa83UNjkhuAwhe5zelvmThbYU0CQFX6ER8GTN+E93jqSbv8SHG9TXhTPSCmlDSXxbjX5Zj90cLfMUP27n8zC5Bq0vLMbYjqqElYCew2+4wAHHAizEs4IkH3YMJrnDmHEHTGQiWda5cN4XImxSr0iiU7J6fz5Gka25OR/q0cAvU6J0r2tVi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4222.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(6506007)(38100700002)(52116002)(2906002)(44832011)(38350700002)(4744005)(6666004)(2616005)(83380400001)(6512007)(186003)(26005)(8676002)(6486002)(4326008)(86362001)(66476007)(66556008)(66946007)(1076003)(316002)(36756003)(7416002)(921005)(8936002)(41300700001)(478600001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2mYO+vTxcLBNiaDL4wB9TVK1+/SbI07MsSZfDoF7237PJFHFb6L8PXCtsvJ?=
 =?us-ascii?Q?HycyjORx+Sk1Dn5JziVud+d4iuXQ6XJCyHr9l5/Ze2BZ3ve5F9UcPoY+fgsM?=
 =?us-ascii?Q?oCDTqwPz6KtB6eJQDx2IpXw4RUimmdjdZbmRM57hJbnXvAc6ztfhXz8xie30?=
 =?us-ascii?Q?22jKs3AkQ2aTqafuyv8W00pQnVyTjqnV4eqtxF0svDg0SCjS3JmT40KxUPjd?=
 =?us-ascii?Q?epTYPPnJCaO3DtlS/baCJ8594rfYl9PTJUEyW8C3RRXZF8+nRghl9JnWXV71?=
 =?us-ascii?Q?kk2aYC4GHcZn56YmPmLpMcEUjQBWXlLG6tyMnhrqD0fhcBj/SRgqSbwRSE4D?=
 =?us-ascii?Q?jfwfhYiW1S577vCJF7ufbkdXLpQUXQ6C38+Ixw3EH74N8T8lUOQBhxSuSnss?=
 =?us-ascii?Q?WbEmAhu11A/9eYKg/dxwWUlZG/BxTEGCeXhyyIP5YY4M+dNNUOGUUcsRgG3q?=
 =?us-ascii?Q?G0iWpnczHD408SkdlP8UOdYh7smoRp1374TuZJQCRYX7xJfpKnzrj8q85N9X?=
 =?us-ascii?Q?60fEQq7SLpn72/XEAmNwh6GPiTt+bnrzH+iB3jUjWQBYT9y/2tVFxNTPQqjP?=
 =?us-ascii?Q?rCPY6IMzA7O33a71AVFUw39pS1RDP2vOHCX6qbVeoyHzxPGD9yCMyNnqeGGA?=
 =?us-ascii?Q?xnwQZOh2wUp3PuEjqZiETxWhdysJvCxnB59Dctm1P7k93vRD2I/AJwM3brpu?=
 =?us-ascii?Q?j2+L+z1K4D350/tREtyX2GczyYPdanjZLYdf9CCVnJMb1wES4gh6zjpqUri4?=
 =?us-ascii?Q?9jkpAYaIRaFJxowbaC1lcXrp5SjFI5WF2v/h+XV4Bf1akElTsn1pSEjgwPny?=
 =?us-ascii?Q?OF4MywNLxW3f7MWqGJbBIx42VsQBE5wTBkn+D93WaSfL1DBgIRxfpw/46bEm?=
 =?us-ascii?Q?Vm0UbV2WXxuO4rJGk1d65IuNGmW54MgBzuA0LUywoZq+FX20lQ75w9fl7O60?=
 =?us-ascii?Q?DYVvvbtVkPqe8SjVLhBBUlkhz0lHk09+MVHzOv/kTrjVTrZJ6B7ddlYx+N0s?=
 =?us-ascii?Q?YtVzBy8zAsiUrRnFKc+6Wc90gMU7IapNv2/conV5pgFyl/vm0yxYRQm1nYHk?=
 =?us-ascii?Q?YTB9nxHsoHIO9V4M+TEslYY/9IlGZGOut+6HWgljda9+Qzp61eCSdvlyjvo0?=
 =?us-ascii?Q?6EG6xHBbxmwcwVu3j94pg8DMTlFWx0GqgRhlZt8EHCUB9pxM37eUkZQZd3X+?=
 =?us-ascii?Q?C+RImXxhSBd2XFDSSNST2QH69IFDsjAmUezMmXhIj8IO9hHEz+9qtDb+rHlu?=
 =?us-ascii?Q?JBc8hf6C03q4Gnf5YOYD3oQxx7pP16kjqFSIZEbPS4UEf5LStGEfnVayHaaG?=
 =?us-ascii?Q?kc+ju51IagDpr7RAEFeXYY76aEt9ePeT+KrUuRCYmDyGqoUIzk6d81WWzG0T?=
 =?us-ascii?Q?YMMmtn5f/Li1A1ZiHhG1apQfYrrfc3bphjasmSIDugCg7K1a1wU3d1nCJUUA?=
 =?us-ascii?Q?8P0Ainb+8WHS4fh1WrWkKmCvge5m4HFKDnjt/lYrJXT3JDTqdCysgrRsxNqE?=
 =?us-ascii?Q?/pZjQVg/uHd89ix5999k/5ukWFzA8G/Ka1oP/zWo6ZSYeFHMnVuwMrTd1d5e?=
 =?us-ascii?Q?q38HKN8px2Fs4pWesJo2s/JTJCMMQzUT3HY/lO3P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d769fa4a-8b0a-4cd4-c805-08da8993f0ce
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 07:56:12.3065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RyT+830eSbnzQenxcGF7h8jH8hWsPconNJVYBvsndNjo66DVpkvfE4+p2uAVVQlFFkqZLuK90HmaeA9q8zkBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4220
X-Mailman-Approved-At: Mon, 29 Aug 2022 18:05:43 +0200
Cc: Chancel Liu <chancel.liu@nxp.com>
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

This patch can register different ASoC CPU DAI drivers. So sound
cards based on different rpmsg channels can link to their respective
CPU DAI drivers.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index bf94838bdbef..fde3d5006ce0 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -235,7 +235,7 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 
 	rpmsg->card_pdev = platform_device_register_data(&pdev->dev,
 							 "imx-audio-rpmsg",
-							 PLATFORM_DEVID_NONE,
+							 PLATFORM_DEVID_AUTO,
 							 NULL,
 							 0);
 	if (IS_ERR(rpmsg->card_pdev)) {
-- 
2.25.1

