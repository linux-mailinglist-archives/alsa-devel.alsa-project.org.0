Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB165CBF2
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 03:41:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D52A8153;
	Wed,  4 Jan 2023 03:40:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D52A8153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672800095;
	bh=psesaEXGXJTYOWSwuExhO2pO0vaC/huLVQXjRC4jpx4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LxaE2/Ohuyrn4ZKtUk5n6f6LpSOuJWBPKF2Q8YORPJ2fnJec8TtCxvvJNJYzJe6x8
	 kYgwtUkQ363UmK0yZ5tw69V1Gy1OPSBI1dHFQ4lUKPLFPe9hHVCJrTH26mPFj+9Zuw
	 l5LvHHzUHFIoNuSSAQAJ8M4cEUjlp8tNZSb4iMUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E44F8047B;
	Wed,  4 Jan 2023 03:40:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 290EEF80539; Wed,  4 Jan 2023 03:40:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2072.outbound.protection.outlook.com [40.107.8.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08353F8047B
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 03:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08353F8047B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=s8nE2jlY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADl+Ar+dnG+ZzNNBHi3qiuRIZHaEl/IO1c29D7JHwf19PPhAkJYG1C2GyhehSv+iNxufMFsD/2CEHB1cjAAINpiRE+toQ6bXWywViaSIu8JR+pcjMuU1m+b570xNIqoJY1QXY0wYQXPlqUlWseXTb49IwJ0xddcUFozK+AWgMMnEeJcm6q5xvXd8xPTaYMvhpWSLq5zmcZWuUtWrEmcf2nE3ODjVN9wn1+01bJ/iKdpkfUrJalXrKYjM5fTN6kYAynZbgXLeVGswfdDqqOIT9I0ZZpxI4nNR2IDQIGmbzUnTYAavLt1czcudm0G9eysYH/D/KzbrKfhTLyZZZepnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYScTKDIqxEFmzlvyDqyackzUBlK9qg6ncWn2rsEdGg=;
 b=dn08FpN0SFXp3nuU4EpffjjhX1pnV3UEQ69/3YqfgqUjTqimAuKRCHAlb60CcZ9X5VbtImprnNGSmJvXb+albShn/ZkcNRwszyydIxBz5UJEe2DExhNIr3o5uJxn5E55eZLadOYbKAdOSvJSUpIAYTOKBqU0zLEz6VMlVbxmiFD09PIVS96ABr28uRqytb17DyXYUhurJRTkXpDvL0ziAQf3SE9z2SsKr+Hss04IICauTS3NLrmrscl4NEYBkRiDH3C6YeTpY0g5ybWpKIgp6nQFRFXP1CkQkrhEYHG9AN2faayI3TnSnf9ab2q28WR3m+4HJ4XPENixlcHd9/yhqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYScTKDIqxEFmzlvyDqyackzUBlK9qg6ncWn2rsEdGg=;
 b=s8nE2jlY9F/9Dhfdsid1zrUIG5TSaRGRsZgtce3RzWITop+9cbOGWcD+Hl31w1Ut7vS2e3SjBfwn8kCPcj5Z0oXUhodSJVzxa1RNx0/neEdThg0Tna71WO99lIswdEr0T5iLhRh5ADwakc3LA6cU/0Mrmb4klXLjSjoXpbq0rv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:5b::30)
 by PAXPR04MB8491.eurprd04.prod.outlook.com (2603:10a6:102:1df::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 02:40:22 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c1e7:eafb:408c:6ae5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c1e7:eafb:408c:6ae5%4]) with mapi id 15.20.5944.018; Wed, 4 Jan 2023
 02:40:22 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [RESEND v2 1/3] ASoC: dt-bindings: fsl,
 xcvr: Add compatible string for i.MX93 platform
Date: Wed,  4 Jan 2023 10:39:51 +0800
Message-Id: <20230104023953.2973362-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104023953.2973362-1-chancel.liu@nxp.com>
References: <20230104023953.2973362-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:4:188::8) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:5b::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:EE_|PAXPR04MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: e888976c-88cc-4b42-8f95-08daedfd0667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zO+qvjrupnLv3Ua1rm9c2ZE3VT+cCJeXMJtyebmpE4Cf5MGF1eXY5L8+cp0ZaY6qhVzi+5oNil8qp7MYkJ/fYVAlHUtf86MEwQ8kZca+sLb7GKN+DGH6H3fN3Vh83FV/e7QevOPdiSDY+KqfdMar362ODFrNHXPM+RVq1hsADOhbmG2NNI2cgiKXGZ0qUDYnUy6NurifRDizGS+/Km/zmF/94IIwtQZn2Dv2PRmr9m4xS4jVHSP1vpoFIdBc5kVBXkuz4iChGCwCL8UJX8XCfQSfUBizLOcpyBIQx2ioRpS0N55Gqd+6juTeD/ylWAgaYadL1KTe5UJYpOtvABFsHrfqsHGgXfXk0H20fAB29wrdrSMhrgUvTGtLHmT8JpncBCbQJWNcNoK+uHQ7uwZfO9w/FW+7m1Xvw6Ri9XO7DqAui7fL9hReI1VR4JtLDfXMlh9OuZA+G9aK5VIgC83aSk//PD/GRKirOkVAYIulkgQ7d3bhSoYIq8zDOnAuBSRA4/gX6ySYR7/eRhYDs+GDnnEN8PEVkQOQLO8puwzrcrI65B+msB80rr4mwQiKnvaYKEAejyFxi5G3I7gn4NL/2P+YCEQsHvPYPeQn68C6t+jlW/sA3H5rjWTZQqYlBKFWJgauvCAmGNud7UsUX9ROzk9aQxcWsySPkOkiGw40Fcg7Dl0+JNUFuClyihNIsA6YkQcUkPX1PaTvsDFMpVTUlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB4211.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199015)(8936002)(7416002)(41300700001)(8676002)(4326008)(66476007)(5660300002)(66946007)(66556008)(54906003)(44832011)(316002)(2906002)(6506007)(52116002)(6512007)(6486002)(26005)(186003)(478600001)(6666004)(86362001)(1076003)(2616005)(921005)(38350700002)(38100700002)(36756003)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MY2XJ0yvkA78ACG19eiswAFaDFmHQh/atddHVtZ5G7e6A1V7KPQ4OD87hyYB?=
 =?us-ascii?Q?IljQ6p4SNIDWIXpKjgLCQgyaZc91k0Sob88mTof+g93fMetwKLsusSghz7BC?=
 =?us-ascii?Q?CCEU+IT3hBSl/xkyRgiwzEHAmpfqVv8fSFAShm3fjXn7C9gOs5sWXOp3Cr+k?=
 =?us-ascii?Q?xX8OiHm0YCx4EMXarHtCt0LxPikpmykJqZAIHed762tgPwQLeyzqnW4k0fMt?=
 =?us-ascii?Q?Q8CQ74u0mc00ReyMbZ2Gbj/GQ0GS8czmXk0MRZvWALb6sRxx8jlGzd6ZWWCX?=
 =?us-ascii?Q?FpuVjyi0OmpGOTOlTc0NBQNCwLWl0efxd3kULhvIxvN0Js34byYC0Q054U6S?=
 =?us-ascii?Q?rojeZT475LlrLV5f2pyw+L3bVBXHEXf1x4Z30Rgyxms+QGFRFT5YZBSpbl3G?=
 =?us-ascii?Q?n/qGeoEDaaSSf1P+gfckh9TvdUGh+ObQBUDoRmV2l8PY4AVOYlFUV2SY4Kph?=
 =?us-ascii?Q?fT0e9HgEYN7R+jMUbN4+PO7qDxGckz07opgeLQZnGc/gC1ldW2QTVSPs46CF?=
 =?us-ascii?Q?ZISZbmVRAA4ZVVAho0sqq/Yv4xPyMwscx5CeLWdJqT5b7WxYvk71doWrI4N6?=
 =?us-ascii?Q?uHsp5IqZgUpDlOm+cbbIvIkHDpQeBnKlDJYSfGRXEnBiwozP2qaVOU959/zU?=
 =?us-ascii?Q?Xn4Uyk9yuh2X+KhqU+kcbvv0n7QNMj5EL8/AnafBou5y0sD5wOfe0JZCPn6c?=
 =?us-ascii?Q?x/5l5PfxeWrYQ3FeJZ1NKiDXgbqCilE5UXPfh2VoUy0stkX1bEezvIDmp7d7?=
 =?us-ascii?Q?OaTtv6wVojmy9tD7+K5LDTz9l9vIIl40JAI9y7kABcgUdreLoSfwdD/TS5Sv?=
 =?us-ascii?Q?sAcFFo8nQw1JjL0njiaz03zPTvznIN1ZcrbvPkrTIrEPwDWgW+Lscj1CgBPg?=
 =?us-ascii?Q?YywswPyfVIJv35lOURBy5JG3X95c6cZY8cDfrJ8+CmxDbAvgpWsAtNgy/7A1?=
 =?us-ascii?Q?0cO2qiv6w5ste+JLnBsUqHDnwVSBtd05F3rSNKBfpCs082CuSg1H4JgWqXyl?=
 =?us-ascii?Q?6DzT6MzLaBp8HoYc86KmpWiA7r7wWLAtdN3GcMYFgaZpkkVBCzPpOkBzdx8j?=
 =?us-ascii?Q?XHJkSrDhEyNh6PeylvtVbZTgzEAXgW6R2eghdIKWuVSCcIk5A63MwWdU1Hfs?=
 =?us-ascii?Q?M/F0OjIImoM6WB9yUER5gizJfovQHOKzAKeWJLCaBjG90sUxIL36WWg96m7n?=
 =?us-ascii?Q?u9QfKSjNozoy65lcV4tQpF2mriwlsvoe926T5D4PVt917xkmSoQqQJ4g+cjF?=
 =?us-ascii?Q?GZNvytUue08MmTXiFhqlmG3cX7lwJnUVuDZPvE61nyYoQHY4Jm0ROYDkYUjR?=
 =?us-ascii?Q?lgbWThddyiLz+9pJT4dle8nOt2lzUFotINr3mpvPEKkQLiin3SKtE7VBzA1v?=
 =?us-ascii?Q?z5MONpgXGRiOi2MRA2kR4pzGOTAM91DbJ3Bf8Tk+4wrxjQK7XpJuKykaAhCA?=
 =?us-ascii?Q?YV6izmp6IOkwLa1yslRaIGqWHLgy3bro/hNxJWv+EiGYlF7+XblQDWiwNxUa?=
 =?us-ascii?Q?RFc/g57obp1myBCOSDu24nkLTRJ7tA7mtA5KWzKKMAfyQjWqVHWhWo8O8PPb?=
 =?us-ascii?Q?CK6rdJ188lPSEXToEgSJPESBkzYCvImwRKQLgIJr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e888976c-88cc-4b42-8f95-08daedfd0667
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4211.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 02:40:22.0524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLyi8Pbh6e6pNI46Bwg/dgYAj1LxT4d2p+/44cqEXGa5gugpxuLc2yV+NDDGTXd6RtTAKW3lIKflJaIFZbusnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8491
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chancel Liu <chancel.liu@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add compatible string "fsl,imx93-xcvr" for i.MX93 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 223b8ea693dc..799b362ba498 100644
--- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - fsl,imx8mp-xcvr
+      - fsl,imx93-xcvr
 
   reg:
     items:
-- 
2.25.1

