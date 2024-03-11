Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F2877EB0
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 12:15:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBD9CE80;
	Mon, 11 Mar 2024 12:15:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBD9CE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710155720;
	bh=EM8XPWbfV0XD9xkdDXT+z0zD2ZyvcHsveuuMSyM7+B8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mww4OajqEzL87sQYidjMTUuMb9D/7TEADj8iSbwdIQCEr77lwcYVI+y80LXjHY9fo
	 QBnMSUEro6wvdj2L4IV0oeP8Nx4g6x/MJsVhIkqhkPKUdl1BuuZ57BB1wHUmjXdD6a
	 qvDfFWQ4gsJVYAneQRpAdMhpeh6BcDOYfREQuZXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49B4CF805DA; Mon, 11 Mar 2024 12:14:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9802DF805B2;
	Mon, 11 Mar 2024 12:14:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A393F8028D; Mon, 11 Mar 2024 12:14:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4702EF8014B
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 12:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4702EF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=N4nxRk0w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGTFWJ/gt29sqYi1zrJJp05c7wnWHgxA/l0HOnsII09+Xl8yusr4cEZ1/2aKcDa96BIcIebQrLeLhwaa4lFSL0UTvJbEWIcledUglXCLu5qCqDaf5Bwvnsnrl72u1nSjZgQHYTg74pusKyXCJcxtVjKE8GzwHQDVACSmXUsvLEp1XAGMf+bNPLIW9FT+CSp+C7OW9kO3cDVzhLNiP7Q/zQ57M457Ceo+XgBMLYUMhNlyw65rRWay9rN6bee2wL+TYzol/hy1aMuHWOVnLAIwfRLIKPBjs+akqMWWXZOYgdX1X2DOd5C5ycsH95oLe18OGLvCyku2raR1zu1tBKsZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuGnluvR2OpU8T+Etj8q5BWSUnnutzKhdVoDcL7VOP0=;
 b=ICbC18GnA9ojmXdcNqC1ShItYwKsmKHMWMLcL0Y7LbeODywqvaIbQUbYDMhc3nYimpKwT/cs9u5xST95z/4Cppd+6odUL1T8QoOI4UMsGQe7sgxCtDbF+07OCvJWEG7FpvcrBw2tx/UD4D/f4CgaFG4vJUvWcvKUi13yH51E/yIE18zL9Ymq0oFo3SgcJVkpDFdVcE5oLL7SZf1zvNLQ5q+hWK0GGverRF7I/d/YDij5SsRPyB3V2z6KqfgfUyhdX9zMci7R800fopYzP8BRsKVr/m7GS71T5O6rcmxWXsSPhkBMlM900kdaVtSQ62pB0uS6qFnOTyce8uVkyN9f8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuGnluvR2OpU8T+Etj8q5BWSUnnutzKhdVoDcL7VOP0=;
 b=N4nxRk0wvL8ilJ9iFqfsMGDsrhLmJVQm4cHkYyBKEPwpY731QDptOtZ8e8+ZQhqgC9kpsemy0BNhs9cOGiTy4HvewMWHUQcox6eS4Gbf/ob74Xx4EmqhPcq4XbQQKo1wvQdgy38KZ1mHUkGtry/Xws51JPVTZfBOJTD2oNYClMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB9145.eurprd04.prod.outlook.com (2603:10a6:10:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 11:14:23 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 11:14:23 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v3 1/5] ASoC: fsl: imx-pcm-rpmsg: Register component with
 rpmsg channel name
Date: Mon, 11 Mar 2024 20:13:45 +0900
Message-ID: <20240311111349.723256-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311111349.723256-1-chancel.liu@nxp.com>
References: <20240311111349.723256-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8fa551-6709-447b-9390-08dc41bc67a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o/tLuZHYXuG8C9MXK5G59wPbgZKin8Z0ZcQkyaMBhtA3Wnwa2kUqkuv7pNCq/vFVTShUbsV5R6MrF3dsql9OTxpSWUKqlEnWQYwGAGkg1CGpzuITR2RB0Z1zeXFtefUgH6q4z7nHcvotVsP3C5faxn1g7WrXFPJH6LOwa7a4EFOI/C/07325l/6oR0s5qq4mVLBPK2tnWOwV1Vwh/ioOx40UXVMuiZtPTIxlDE7bKt5BF7wz7fkTctO/H2TP31vIJHu/qf0hqkWuaH1T35AlKp2KA9nH9e9zdG4r+ZG3cYbogq/QYlCw/k7NLEUftz7DeqDM9yXkZQfXVk5lVgclZsXiMN9dq784CMmUzVlyoLCnG2LaTiEoYcVa31WQyT6/HW2SY/Y1VbCtzK/3j6AhGu9/Hd7UuJ2PaXOwU9HzKHu1Gif91vu2UWlK/w6c3QH8U+5jz0W242JVee9/91u6jwb33MppsqUnJDrSUY7m8w4pdUbU8nelZBFQmdQ1PcVlev9iIJ8x/Cd85X5mCnkeTvenBotFGuJg8eKd2ebesit1hmvy12Z8lP3+S31vGXUNgJyrwMSoafbgnPk7AfmkL7yW65JeZOlozu3RuVeteMqh0yXsxhxYrNVr87ecVyORHbScfCQSlfUMyqzwidagXoUYsJvvEClkUl4qfyHd6PyACSu0QDSFwb3CR2nfVerF4/gA+6fFLOwqaX4u9+NpWyp/fUXvhSZCpI5T0kRxXkE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hjc12WX3V7nnHxYtY0v0iuygbKjqO2i5zuzAEpIz7qn+/Ls38m1XpNNPzbMn?=
 =?us-ascii?Q?NgACHdbgUbMvfdcy/cD2dR6RoH1a6ZUplJMPzErjZlY3MUob9lZkmtHKKULS?=
 =?us-ascii?Q?w0h/usnDBjRaLRd/zZTokkmUHToiFTDqNljfOYBy4H04lx2jtMcNAS79yMVu?=
 =?us-ascii?Q?omcuuh1T7oQfjuij4Q9OR2DGJCfjW4SSlHK+o+5v9g2AcJ71dVjXKv9u3m+p?=
 =?us-ascii?Q?2pz5fDUy/FgU9xG2c8YFiuf+6qCBnEwsD/oq7KWWNJ6pAPHvW4bkc/6N3xxr?=
 =?us-ascii?Q?13xaAjhNrkZOFMsXhVYmflYJE50jhmv+vrcDa/ghDu84LVA+PDd4X7ZbYrzy?=
 =?us-ascii?Q?abio1DVZDF0Sw2hTv/UV1Fehb5mvrQ9I++gxsZ5SzpQADHZ6WOvyAKE7cbv7?=
 =?us-ascii?Q?GuFEIQkbC71hUqw46+HUfo55qcd5p9vf8f2QFWYlYIt2DgdMr8WUTraZ+gcb?=
 =?us-ascii?Q?/y+w7J6HPSBgtZtOwfzSNf2wp9Sjzk7VdPgNpnO+TH9q0uqUHUd+aeZi2zi5?=
 =?us-ascii?Q?Tc7PnWBeu6mJLsKASIjKwAL+dRa+bjipDkoEqU1YT6Cd5ElcRRC971ofHJBY?=
 =?us-ascii?Q?wpiuy0UrFLxhI9iWkaWGgXoeCnpx4/foYnq+Q71yysAyV520FLmcPP/b8YFU?=
 =?us-ascii?Q?RRTxdkOOOvc53jT10t0GKDr2Y5Wz6JFSqNodbEwoUjI9KSaS7W1wVha+WTu0?=
 =?us-ascii?Q?KFlf2VhjjgZmriS2goSTF/RHrCwDNP0VBB0QbEZPbJdLIqx0p1W07cutkUb4?=
 =?us-ascii?Q?MQ3RJbC1B3URSEl9JZaDiz/CYbilgbz993Efl3N163mgx8QRghK70cYEuzql?=
 =?us-ascii?Q?1r2J4IGN+jOP4GGjWBwQifP+NfZdh5k00d/TpAp6UqsbjET0x8PA7vw1Le0n?=
 =?us-ascii?Q?FyZN0BBPAJJr/Ryg00FGO/Wiu/8PGhd2tKuHJM6xxim+LtI9xC+JPHHvJ0qR?=
 =?us-ascii?Q?Zc/vYBOXI9haCEBf53Fou2doGLfODOBQe/jAayUoCGVWsmTHQ2FGt4Z5C+QG?=
 =?us-ascii?Q?3ezvBdutrNEI7U5uJapbnEZ84BD350snkr+c4ah5vB/20SxcVxTsl1KtwAJ5?=
 =?us-ascii?Q?KyacX1K838o9Kdxjzb8XefU9wmd9AuPMhjG5awXAAgScrF6gymjlgSNLgbE+?=
 =?us-ascii?Q?C4AcNCL+4bHW0LK785MeWLChJ4kdQt6uRcr9az3ffQNsXncMcvTtqNoCh+Gn?=
 =?us-ascii?Q?0ivQM3wbzWXctfZoQ8H3eciAfqGkKw1ISlddYaeF+VVmic94JCHfQpp+KTwZ?=
 =?us-ascii?Q?/99NoXOdh1WGynX5x0KPHYTAbtSz1/hdSkV301kv93QtFm1UVUQcSjz6g61A?=
 =?us-ascii?Q?Vv2Xeb/pOHqxPVkAueWFijBUdDdn/LguUja257FMffHG6xsDLJ+9e+lRcqS1?=
 =?us-ascii?Q?UNJbDD8wzN2jtgEghAiuYrksnVU4y0Gy04uquD0vuyOD1ApHUZ71IBM5F3zE?=
 =?us-ascii?Q?foDbXvW0Q16aLDUjAF4VCcfc0zKieV07pbf7Pn9S7rCiT1gjuJMhV994wcid?=
 =?us-ascii?Q?yw53i1zGGUPrS63PskGt2Roxvi3s6WZO0ArOdgQbjIIWuljd1XvoOor2IoCn?=
 =?us-ascii?Q?gOQP0sNjUYPqLmtjPQVNdYhQ6PP58T4xqrtH/XvC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f8fa551-6709-447b-9390-08dc41bc67a5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 11:14:23.0308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LWBCPrjjSWFYeFb/dQG/7LNYIR+U3CWErzypn0GE4hbOZlvhICnQ/TmEO9iKxnvZ3sdarvF5ufBlQ0o2Y821pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9145
Message-ID-Hash: DOWL7S4PEUC4O3FVC34DPTHM357V6IX2
X-Message-ID-Hash: DOWL7S4PEUC4O3FVC34DPTHM357V6IX2
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOWL7S4PEUC4O3FVC34DPTHM357V6IX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Machine driver uses rpmsg channel name to link this platform component.
However if the component is re-registerd card will not find this new
created component in snd_soc_try_rebind_card().

Explicitly register this component with rpmsg channel name so that
card can always find this component.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index fb9244c1e9c5..b84d1dfddba2 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -732,9 +732,6 @@ static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	/* platform component name is used by machine driver to link with */
-	component->name = info->rpdev->id.name;
-
 #ifdef CONFIG_DEBUG_FS
 	component->debugfs_prefix = "rpmsg";
 #endif
@@ -822,9 +819,17 @@ static const struct dev_pm_ops imx_rpmsg_pcm_pm_ops = {
 				imx_rpmsg_pcm_resume)
 };
 
+static const struct platform_device_id imx_rpmsg_pcm_id_table[] = {
+	{ .name	= "rpmsg-audio-channel" },
+	{ .name	= "rpmsg-micfil-channel" },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, imx_rpmsg_pcm_id_table);
+
 static struct platform_driver imx_pcm_rpmsg_driver = {
 	.probe  = imx_rpmsg_pcm_probe,
 	.remove_new = imx_rpmsg_pcm_remove,
+	.id_table = imx_rpmsg_pcm_id_table,
 	.driver = {
 		.name = IMX_PCM_DRV_NAME,
 		.pm = &imx_rpmsg_pcm_pm_ops,
-- 
2.43.0

