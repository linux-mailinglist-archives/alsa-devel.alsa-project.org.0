Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAAC8C1B23
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 02:25:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2586414DC;
	Fri, 10 May 2024 02:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2586414DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715300745;
	bh=bnvwYv926nWKAZGDvo2Qqj7bZo7UubL53Rcgw6mhrak=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hMRSfN2WjJJ05d2r6l8EKb9OGxGmXwPHL2oqvCNdodOxeiCA04yzIZ15XxdhcGFT/
	 oP0GdJf457lujs015TTFQHIKWji8S1oVtSiS34YLsTM70+o34TY/DuRKNaaqjFUbir
	 DnqeJMoiVkoiU9CbYyGpOLUo07orjA0p1UWv2+Kg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1882EF805AB; Fri, 10 May 2024 02:25:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56EF7F80423;
	Fri, 10 May 2024 02:25:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0BD1F8049C; Fri, 10 May 2024 02:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.9 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33EBAF8024C
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 02:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33EBAF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SkJLpsC8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFt4k65tIpTTa2g1Dph3Bk1GRGC1zxhkh6DqndK8ONFr3l5cN2QR936Z1L3C2lG4dyx9l9lrZ/UxeTLHgbsG79E/Fos+MryDmomgFdFdyHwHrG3bwS6Pfff74X1rOijuf0CQUDtJE7c+3m2f6vFvxyD4Uhdp4FntcYD6RVBTELrWhWGywz180VDLdcrx0otDk1ju1Ii0h0ng44a2Z6+MijZ5AOCOURshTQElDgpB+9Wco6r9NUepcEsBI4ff6xIe+RQn3tDpZ0x9uEXJfOguOKTOeHeYRaFFsHc0EFEhFnUQ2uR4KFT+rXXmmISB/bPo3kYZN37tMiFiOxvwNP9lww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp6vvoHtM8h8omFpLtTDm5QclV5fLnIwNmja9Zd2iSs=;
 b=GEyCzEfq7xyS8c1uLvvWMMyeQzSR73IfaUF7Vhp4cDTjuxmibJuP6kY9EfabZbZ5xTY1VXSlfVBMuor9TmQ/JhenzctEDGtS1GuRhc3T7Ek56hcNb8ELqrVuMZMLIy2QI7H0csSWKvWZVwvLtJIpF89GrR90JDu2o3F9lg12FP2ZOsII5GpLofrmOzBz9SIVqhIzLk98+VIq1b9bnarpr2rb5YOz881biQSeiZMgdpz7OjzWA8zCa3GL8THwGOlBGStzxbksbVKWeLkt5KPa2UxKGj7B+DDF5OxOd3zDBAMyxXp0y+5kCGOrSc+EVU9F3TEzgRgeaRZ4C/+VZZsC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp6vvoHtM8h8omFpLtTDm5QclV5fLnIwNmja9Zd2iSs=;
 b=SkJLpsC8zlR52a/SRusedveCrltuEM4iMFTEI1AeAb+dqjtTScTuKmIfprpwdWJulD30L9+0UYL6Uh9DFePjyRa9cMxtB88qoujWvos7816/sust5E9eH8zRSiZwryfeH6n/NNOmWMJK/rxeAb4SOLZ18eQE9Qg5l55a6MHwehA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10468.jpnprd01.prod.outlook.com
 (2603:1096:400:310::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 00:24:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 00:24:55 +0000
Message-ID: <875xvmqzs8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card2: call of_node_get() before
 of_get_next_child()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "Dan Carpenter" <dan.carpenter@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 May 2024 00:24:55 +0000
X-ClientProxiedBy: TY2PR0101CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10468:EE_
X-MS-Office365-Filtering-Correlation-Id: 5384e3df-d06a-402c-417d-08dc70879e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|376005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hZMkUrnMzy/ifDUK1GP635l29Oi0Qs/5kI96G6O/xj+SxegADeVJZUaly0I/?=
 =?us-ascii?Q?QlheF2pLELtT5JFS+vjWEfXB6rAKyL3MSIsGtfvO8Wruc4aTv3Hv1skD1GBJ?=
 =?us-ascii?Q?+M+Qx5gGypSCVxvbkZwtad3hAFFdT20a5pP/iMNYEFvze+al83f6aWOq9j0q?=
 =?us-ascii?Q?2ws+sfIjVkPbfoxnM0mh0gtNzQWdClEMxl1SLFNmhXwda5htGQeXlTVzeQ9n?=
 =?us-ascii?Q?uLzC0jZKMqor6DpvxwO5P8/qrGAHFoRQtJrn+mXxOdhpqVxq+Ot8+afk4uf6?=
 =?us-ascii?Q?/RoJJUhk0j2+FkzKgJdQMGoFjXJ3zr5FYuE35wI2tY+YSQtoFaQliY889sDV?=
 =?us-ascii?Q?+BIoIt8Vve/9nzLYtrhJw4T0i/ST9MA1cdpBYBfme+oCdFqGNplnajxoeuda?=
 =?us-ascii?Q?/Ob9FPPNVcYUNlK/1hI9IRtfKSD9vA2b2XB8woWv0hzKl7TqBO7w9n1sqWSg?=
 =?us-ascii?Q?H7m2QX69N3+uaAijp4jLvVHRSlwf+F7p3dko0c/ZoD2Omo9nwodm8vrpAzRy?=
 =?us-ascii?Q?itVop5Me9iDQKdDGVEif3HBtPPNF94aaWDfeo8BHvL8VpnEPcHT5N6FqjVtS?=
 =?us-ascii?Q?PIzWj3YsPAL2fN0luXp1AOBUSDDeMEnjYgNzQOz/PtpoeN7YnliDg0lRhVIU?=
 =?us-ascii?Q?PVgl8VF5i95s/uEgY+7s+B6OsVp73OIyK+irg9nTpAcSzaNYRkR9nbiyVjUx?=
 =?us-ascii?Q?Wnp/kA4EWtubUKBhnT0lUVZOVgda+jgOum9zip1WKVa/l2XnKVxzKjXtnCIj?=
 =?us-ascii?Q?tgJX4FcDfQd3jmjm25VWnY7+CJG9sP59qzZcynpqsPAMYU5b9zPBWtk+i0G/?=
 =?us-ascii?Q?i5ENpa4BGvLGaCYHVevEynwnlFxvd1EycWZbHcI2QClU3b1mKzX2E+Bnkfxa?=
 =?us-ascii?Q?vPRuzsgrlx9HgTLQ2YqN9o7vx3CYwI2KNaoRYVFyf/5P5Ig5EY08chprdmjV?=
 =?us-ascii?Q?B8HnxkV14BItrh0Id6gxQ43DRYOPbGctcH4ExX1UIbTBJ+2RoERTXROJU0Y/?=
 =?us-ascii?Q?knJcGj3ovmAO72WUVsdjUqZWDCNDCfx4pN7xIWsONv2KzTbJoVNZE//2oalO?=
 =?us-ascii?Q?Nt6IswERy99PoZ9XNRY6SZ+Gwt6YB3C+rKc7Zsgs0yLQ+dpHo6d1K8/GW5PO?=
 =?us-ascii?Q?YANxRyISqo78l11qVwfHwrJpq3H4qXKfY8wRc+nnIDDcGGXIXsFhi+6fqrIk?=
 =?us-ascii?Q?9F4ofzNbTXqhn8lnTmLa31otBuDzp1cxXvtqUv8mpNLIPFcqoiI++Uun0AGQ?=
 =?us-ascii?Q?LSzPmy5BvM7qAKsiV3BMj965GwobEoa2lscM6lnFog=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DdAAUoKajYRjw+zrxSvpDGRURhNz08gRW26ehK74C/iv9PGi0nh/CsEfnkgw?=
 =?us-ascii?Q?kyYqxVA0BJusJE0BQ7aq1Ut5GXrP1LaDxCzfh1jgGyH1Iw6sR//S/cJByBKH?=
 =?us-ascii?Q?Zm9ArvckhOF6gpJvR4N/HggG4WrDYm28TXsO1Wv63EdtEUaR3uj+Mb6Y83eF?=
 =?us-ascii?Q?D/k0aj3tK7B1FedRRG/hAfhCCsG+pi2RfaYhCmudnV1MXoSrQzryG+ZUH13g?=
 =?us-ascii?Q?znX0P9gogsq7972STHUf9+zRWtVJNfAnEsdmz4vhPm8d8ROM4SdgUYU9K/oM?=
 =?us-ascii?Q?5rlbtQ3KwK0bTNntMXcX7K70AwFS5tfhUkhWyDgMfPFIFc7ywdD+lZhJ38oY?=
 =?us-ascii?Q?ki1rMYHaV1DYPcnlfE1pR/IpuqQuxi7Ztnz2DPUpXEi6fB+U7GHt9GIzRhpj?=
 =?us-ascii?Q?qMag+gb5ps70pf1wGbPZJDQJdYHwqPXOuOkE1dJ58X1u1w/piHN5iQ96EKqk?=
 =?us-ascii?Q?7AzIw0e2ifCHAFnvb3Bgx1sv8nQB3bC6/UhvE+4GqTVsLNCcbfZ3eYpZMd7j?=
 =?us-ascii?Q?xBVsPF+M4xYLiFTMVITIeW0Xuvl4M0+BM5p5xWQdVyvtiCYDhG7AqTCiomMd?=
 =?us-ascii?Q?JN9E5eJI4ryETXpSY7IaD7S5gE+DMKiwR8dXsq/gXNBR6BQk4whWmc+Mvdsv?=
 =?us-ascii?Q?hc85Kvmek6a0s+rgPYwuYx3J+wZZ82YON0ZtzGOvroMt41Y+CgoTI3dgKrik?=
 =?us-ascii?Q?Comg25m/FNL93xjcUDZ8qb63ZEraceY0QKsQS8qQp0JsAJypFUPH30hjbaef?=
 =?us-ascii?Q?gW8BhPxPXBAdq8n9Iut1Gf/TGC8zqk3EOhXOLcS4L6M49z8GSubXuDD43+Yh?=
 =?us-ascii?Q?vT1C6SQXc22JMWwQwbuzAAzPc2+PO07iEXph7mrsk+y6I2muxC27Rl77U3az?=
 =?us-ascii?Q?qPCkJlp8Ksve0/rZdKdqZ7F49ytrw6U9jC49dYPRiFo9+L9OP0sWiCX0Db1r?=
 =?us-ascii?Q?PKWEm87GzLsYXVxwDD3zxgQjkHSnbmGQBcTdipr3sa46DPsxMJ2c2buDU1aY?=
 =?us-ascii?Q?b0mHfDLenZfZkLInRTRqzQOB6kJK51a3PsD6GFT5XVy8RqcxxRhktd6Ztbly?=
 =?us-ascii?Q?/xXPIym9/8d3d6W7CAUQBG4h53hInjuYK7o9wES1abpwNMOtvB9CZ5ew3QDe?=
 =?us-ascii?Q?//JYNzWowQeV86CpxuepPWKF15XuWBZTvds47+ZsKsQW337+1+/9G0rUK8jp?=
 =?us-ascii?Q?oUvDUQnY+o1CNdFrWLCBeL0yxFL6H4m91sh5bjoOiH4mOmqUUCgy5ci4igAS?=
 =?us-ascii?Q?DGoPInhpZ6+K4ZOta22InxUs7SEDBw9odCTQF5mAolxeHen1Hq7CRugP8cXA?=
 =?us-ascii?Q?XTD36E9EgLoWZVBEJ771yOt9L0XQqcR1iUoce3+0CJ42XdgFDkLn4KRYvTp0?=
 =?us-ascii?Q?SH27NZIjgjE5Mey0zyIulzl8fWUQH+tJREq340lPljE5IF+f+EgXSYqwhTsw?=
 =?us-ascii?Q?dv7Sy+9Gb5zmwL1ILftoao58ODZ7S6FAj+lQlgvmPfalkcO4ses3thpTh/c4?=
 =?us-ascii?Q?jEts4hEMWO7poQVhPcxhB9iB6C7K2EJlHamXY9HAg6n1XrUWeZyscCfZwHeo?=
 =?us-ascii?Q?eE09cDvkERHr97zMCvPCr/1TWEydpj4HkZlDDWjGVMpDi8h5K2BZ7ahB4SEZ?=
 =?us-ascii?Q?GtdVep/rC2iwqqwR88/pGL0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5384e3df-d06a-402c-417d-08dc70879e49
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 00:24:55.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SgdCcR83wC6N16dYaac9SeurBmIVJoR7GOjx0xdvuUXlFnDxrkB+8r8w9OZYK2IcWNuHnQfWyVIDzbjR+0u5F4VQ/WXZhFsKtdeJq7cE7Bki1fba1UJgo5Y2fN4NOD7R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10468
Message-ID-Hash: RKVBZXZ27XR4Z4RXXWE2QJR5ZMO4PLFB
X-Message-ID-Hash: RKVBZXZ27XR4Z4RXXWE2QJR5ZMO4PLFB
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKVBZXZ27XR4Z4RXXWE2QJR5ZMO4PLFB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

commit c6f597bc598a8 ("ASoC: audio-graph-card2: remove unneeded
of_node_get()") removed of_node_get(), but it need to keep original
reference, so of_node_get() itself is needed.

Because of_get_next_child() will call of_node_put() inside, if the
reference count dropped to zero, then of_node_get() after that will be
use afer free. Need to call of_node_get() *before* that.

Fixes: c6f597bc598a ("ASoC: audio-graph-card2: remove unneeded of_node_get()")
Link: https://lore.kernel.org/r/f930862e-9d30-4ea3-b3e7-b4b4f411f6d1@moroto.mountain
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index c4d52fadebb6..81e84095107e 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1197,7 +1197,7 @@ static int graph_count_c2c(struct simple_util_priv *priv,
 {
 	struct device_node *ports = of_get_parent(lnk);
 	struct device_node *port0 = lnk;
-	struct device_node *port1 = of_get_next_child(ports, lnk);
+	struct device_node *port1 = of_get_next_child(ports, of_node_get(lnk));
 	struct device_node *ep0 = port_to_endpoint(port0);
 	struct device_node *ep1 = port_to_endpoint(port1);
 	struct device_node *codec0 = of_graph_get_remote_port(ep0);
-- 
2.25.1

