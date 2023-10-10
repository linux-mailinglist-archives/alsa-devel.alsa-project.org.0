Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBB37BF02F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 03:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D9BAEF3;
	Tue, 10 Oct 2023 03:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D9BAEF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696900987;
	bh=gB2sxht7GFiyArR+Haa+7ZtVwPWrgKvb185hxJsqEHM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aW4Kdj6HfWouBN+cJfHI7ETLT/HN8bymv/BaauCP5TDu3YOfPEN/qAaAW27QjeEJc
	 9lsu81hWtP9nyBCIMDCxo+rftpPrdoeFIQX89R2NbsZfzVH/aEotxdPbxcLPHygZLW
	 lkbXDDOw4an8y5dhpmlQ9oUKR7PqKRrHEPYmYUO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A285F8057A; Tue, 10 Oct 2023 03:21:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05EA3F8057E;
	Tue, 10 Oct 2023 03:21:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF0CCF80570; Tue, 10 Oct 2023 03:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5168CF8055B
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 03:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5168CF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TnJefnOD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWgju6DrWHGFEfIjdFkTKnVTPEecdgxNSX48EW+ioU70mXm5zun/7b46LDLMSme2hgOX4QYS35fPZJDZDxb70KXdGeok+lF5qcUHEXl408nkQUY2jNNg44s9zjh5xxVTlsUZZ4tETH9adreZ1cxdkPmvlKPvjnH8srBg5oGAwgmu08XEUuam6A7qAsflKOKscNUBJWWceXLXWOkMeOyT58CI6izQbSvzvS77jUtqe1yRfZRCgTU/xPCKC3HmGRZOmopWDVapu18KSk6cbwta+tYRIoSTSWawWVQK92CNot+9IyeQ3cSRN/OgXt9uIp3EV4+9CIXKKESduiJiNofPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mPuFQFWJPX8WqU/et0h2ns/g7L9Oc7DfhOqQWkZV68=;
 b=iA/vmlgn3hTLaVwzRdvqmph5T2tlb45kCPoRPsk913O2xOlXmAHXLTEgvRzO4lRkl8Hc8rQnuky8uuQwyiMYhFALNajiv0gUMHAHFJQswyX2jeg8KKPvqZIMNEXqdE5L3Qx2Z20tYgx1GPYWa44dLEkB0r19VVvV9pXCb7mn7XDufIHbSABM23V5ZMvYkF599m5ZTOGFoVzhzP9FkdlF6QK0dU8wsK32W1LE6LhlKwfKu8pK3IE0AXFrGy+jXA0MAHr4qFNhyBFoXfuVSBcataRa6Y8zT6tXIDkoo7QMJ3d6Xg2o9Zb1TeWxaundGx+J50zIaV+SVLFRr2m0cuuUlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mPuFQFWJPX8WqU/et0h2ns/g7L9Oc7DfhOqQWkZV68=;
 b=TnJefnOD6b16zOJCO9LMwzCWpZCE2be+QZ4NAvTjbH9s/6OvmqEPnvXTfkzx4PXEmv59JMZey94EXaaugrstVcU+NriWkBgV0ZLppAHFyNIlFUPCr3T2UcKzYD7bRR+UhXVafUVrryy4i4CHhbHZJ9U7kBj4gQ8xWdXEtPclFjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9647.jpnprd01.prod.outlook.com (2603:1096:400:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 01:21:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 01:21:23 +0000
Message-ID: <878r8b8e7h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] ASoC: audio-graph-card2: add CPU:Codec = N:M support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Oct 2023 01:21:23 +0000
X-ClientProxiedBy: TYBP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fe9ae5-6cb4-4b87-7e44-08dbc92f3768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5CVfmlBa0HXb5Q/p+Uo8Lby6SV+tVgc+sDqj0qKhR/V975UjTcrc0/izBYFgKr6tgFz2I1S67MtOJISHg7nVgC45dgM/ceMo0eCOOgKo/1JFcvWqNcS03c1h8WXB/C8yBTcksrQrbmlsFOX0x9hoxibmP5yoouhor05XwUvm8uA0XM9nWbxApsyRbAslrGj814MHjpd1biXCCJDwWHalfRiIS6niXU0OheOPeYTY1qy5ezcq+SZzior5BSIs8I9mehK5v4prBmx0MQGKG7vxbEXeL1jQvy8GUIckaAvI9rPQrkadHxJccvDYJXeXtLWAeWz1N4cAUYk3cu2L+ItYVEzIo7mh8BpSo3x4npmaKshRU+xFr13RblSCsI7qmVNR4JAqqm7bcpDgneDJZ/aW+TzjD8WYEUdYhMN9Gx5Qd4A4L1c3cvbUCou3L1zL5CevFTLZUQyDoTOZsl+EvRcTQ1G2j6ONy9KtuTy1JPIv6wOI8vXVJUpnrtz0Ss/0ascCXBI/PPgPlObLvphF9VCaXDiUHdHdByLZzb3Y6fuhB2jkysDzesj1rmJws25fZa7kCvPpKXR4CL0YpI4srF1NSTYQoWBh/UO8P9/Tzb3TQCGkc/+xrFcfIVDiaa3APsPRmoTpzLw/LvTKWx66tGgEQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(38350700002)(36756003)(6512007)(26005)(2616005)(2013699003)(5660300002)(8936002)(8676002)(4326008)(41300700001)(316002)(110136005)(66946007)(66476007)(66556008)(6486002)(52116002)(6506007)(2906002)(478600001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WUHDpJza5nHJjVWoBWzywGAPKlpYm509p+QjgvTVJlEijET2srX2xvO2ts9l?=
 =?us-ascii?Q?UXn3b58A8T3i76wi+uD1gPNQL8buW5AzwFtB2OZSYvpfMdHh52XRm2DltlR6?=
 =?us-ascii?Q?PUSizEZdFSytOqQPE6JYy7Hm8Zgtv4Cp7UOqj2rmzRTy2rSdX5kP48jO7EeY?=
 =?us-ascii?Q?/CpSyZSqQA981r8IyIVEVObHp26YPAhzUIA/VIwRv0+5rjf1oNNACpJmoMw6?=
 =?us-ascii?Q?VOeQ+DRa454blqHE414En/QtALkiD1AKFXuaPgkzRBTf5pOrvCMeTKIhfPBG?=
 =?us-ascii?Q?tw8dZXnnaj6iM9wncz9KFxsmnUwJi69pJADZtAVVNRZnLRv9Kxu9SoerR1W3?=
 =?us-ascii?Q?uSEbDVmgGZq/h77MCf1iFQAyLcZyTMQemz7bXu2HYrPjAAqviGhj6hqVfuCb?=
 =?us-ascii?Q?YogHduBbpd2w9wP8eQxS+uIMpTcLsKJe2K+8LtLexNqriLF7uo/6y6CgRX9E?=
 =?us-ascii?Q?q1ispNNlg8IPZxPSkv12fkZ0nw599BciXzNMEBe5tPMOHv+gTMlgDR+a/fDy?=
 =?us-ascii?Q?Y37XR3MIYnEkTqqlOycSfrAvJ+eRNCLdmpRptb8Fawsy0E0ORZicbMOGIcN/?=
 =?us-ascii?Q?LihHWpBLpIHbTCOt/eEXCAIjc19MBLLJjTiBE2rG0okt+Gits12x8fLgKe+Z?=
 =?us-ascii?Q?Hq540Vu/a2FCWqiIE6Q66JGmYy9B/7Pu2c0L70OeJsMF5ggrmuQo4eUGolA4?=
 =?us-ascii?Q?K1BHmdmTPeEJWqmK2in1IiznrtF9EaKRoUpiutLaEfdDMM1CM7wTQB0eWqVG?=
 =?us-ascii?Q?7VuutKrupYIYzkfNTIvjLHo0Dg7epflcgh+6Wh78fKYcxMl4g06W8S8JPbr2?=
 =?us-ascii?Q?GGmkE6ajxD+Yo+vrBAti7J8WmyQAqNS6R569kQ0t57Nhwf72/QRY/Iu5btoU?=
 =?us-ascii?Q?OSruBGPaqgZ6nNlhTLtFPyE/ERFo9lUx8v123vMF2IC0IDrxWlDqKmZyfQWT?=
 =?us-ascii?Q?dL2BGjkWt99eE4Yy00Pa1hlY4Ou132w5SDYCGpW2+IxWAg/+T80qgCGZGLRy?=
 =?us-ascii?Q?8DlwPQwsJ0sYNeRtcEKsRl+EzM7wO4LHH0EHbgPM+1oLflsKGH4DKQCZrAyF?=
 =?us-ascii?Q?za7NR9koLRcvzdxBCSblMbC7L/jTHMI2YrDgD+wrHPJZnONySdNqLreNyLyf?=
 =?us-ascii?Q?2g/y0IrTykP9y830xMr2wgWg7AP/9aNWeaDzBZRUqnJAfQihQXVf7PzOA4gG?=
 =?us-ascii?Q?xW6ZqVerd0owXFosOuqeNb3zmfqiZu95IGG/bT8mSQ9Lj22CQ/C84B74k8YK?=
 =?us-ascii?Q?igf3alfsm5euEweoqc0r8R/OiLyMYysCVTmwu8n6varRvL/heFpLVTm6rK1L?=
 =?us-ascii?Q?6X/C+HB0+QpSyW3bWE5xh8GSK1SoWjxFfK3rVji2NoGvaDu4fCoAJ/BwuBFv?=
 =?us-ascii?Q?b48a1wJGRq+BNcYlUB1ck+qLIKwg/Nxe/iYqYKZzspo+A6nWNx22OVbF+DAV?=
 =?us-ascii?Q?9QwwFK5Q9KdSTvWlxPWqBDwJgH0t1x8Qmk8b8JmoI9QrGDGxFBh96SaNAoT4?=
 =?us-ascii?Q?e61bBUUpEo1ZuH2I8Kgn8rnpJNwqrps52s6jLPpu/g5iyiQKEtrGjvx+B5/I?=
 =?us-ascii?Q?Jo7G2yLxSDRoeig+rKTZVcXznOU7Yg6GsxKhqcpRXtfnJ5GDZmvIIzutp0SJ?=
 =?us-ascii?Q?QzHUCKBZrMb3ZGMnBtrquKo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c9fe9ae5-6cb4-4b87-7e44-08dbc92f3768
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 01:21:23.5640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 R48VfDVMVRwDo30REK1bQnqJdk2DK4lJg804IgoG38hx0toOjv5yN/j8t2n3J1PBZWw/1YuGVmIRJY1Zak/0DoDMq2wROzy/+2sbgCAwyhmk/e+nt5+6cT7sFG2HMLEi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9647
Message-ID-Hash: P5LSGDBZVNEHQOM4NKEOYXUV7VIWFW33
X-Message-ID-Hash: P5LSGDBZVNEHQOM4NKEOYXUV7VIWFW33
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5LSGDBZVNEHQOM4NKEOYXUV7VIWFW33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now ASoC is supporting CPU:Codec = N:M support.
This patch enables it on Audio Graph Card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 5d856942bcaee..009fef88d443a 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -515,7 +515,10 @@ static int graph_parse_node(struct simple_util_priv *priv,
 	int ret = 0;
 
 	if (graph_lnk_is_multi(port)) {
+		struct device_node *ports = of_get_parent(port);
 		int idx;
+		int num;
+		char *props = "ch_maps";
 
 		of_node_get(port);
 
@@ -530,6 +533,32 @@ static int graph_parse_node(struct simple_util_priv *priv,
 			if (ret < 0)
 				break;
 		}
+
+		/* read nm_ch_maps if exist */
+		num = of_property_count_elems_of_size(ports, props, sizeof(u32));
+		if (num > 0) {
+			struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+			struct device *dev = simple_priv_to_dev(priv);
+			struct snd_soc_dai_link_ch_map *ch_maps = devm_kcalloc(dev, num, sizeof(*ch_maps), GFP_KERNEL);
+			int *temp = devm_kcalloc(dev, num, sizeof(int), GFP_KERNEL);
+			int i;
+
+			if (!ch_maps || !temp) {
+				ret = -ENOMEM;
+				goto multi_end;
+			}
+
+			ret = of_property_read_u32_array(ports, props, temp, num);
+			if (ret < 0)
+				goto multi_end;
+
+			dai_link->ch_maps = ch_maps;
+			for (i = 0; i < num; i++)
+				dai_link->ch_maps[i].connected_node = temp[i];
+multi_end:
+			devm_kfree(dev, temp);
+		}
+		of_node_put(ports);
 	} else {
 		/* Single CPU / Codec */
 		ep = port_to_endpoint(port);
-- 
2.25.1

