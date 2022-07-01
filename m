Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACFF562AD3
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 07:20:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DABE169F;
	Fri,  1 Jul 2022 07:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DABE169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656652840;
	bh=3jM91X5G6c/6Z4bjJNhMXb949YHqLQnS92p13iAHjC0=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dzcTfUu9hqOnWB4ks46kFQQpjJZpx0iVD3xZq3paIHzFBMP9T9LhC03RnOIbw8ybX
	 Qiuih9VWeafoxeCNRnCpk+dTOt6zRZaN5GdVlzz+z9Dja6cPFbsB+23t4fvry8d+RC
	 r78bb9zzWUfBswFWiNYRdQzMvEm+6jScn2sJ/QWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8229F80552;
	Fri,  1 Jul 2022 07:19:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68ABFF80553; Fri,  1 Jul 2022 07:18:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E742EF80549
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 07:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E742EF80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="cUvwTJy1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWzcnLh+uAy3IH1yN5sNmnLg9u0bD67pouT09ENCSjoXpYHjax1z0rQejSmV5OOplMsfSSuhga5U4JAnKNrw9mwuxwjiH6EHU3QcHa6LdBHq+iARm2Ce34REI+wuYQwWsk53eqQHSvJB0gSy2kjTEQFbA4ZJ0DeD78eLTwlEabpdiTGfh4zb9NhlGVuHkh/c7BJOoYfG0aYrtwd51tcvOMX9npdfMcUl4hPudF1fW4rDLP59zaHbT4lIB6VzxemXhIkm287WlASPrmPlaLPbNuEcEypqaTpEPgiMaDCkNHtH1q0nV3JzsNachBwiB/geQaaS3vXobS8VRO5BLVqNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyEtuBDwwNDW5RVymBxDkUQhMCz/WmnBGTMVXv1Js1U=;
 b=LZD87C2vMPZH1LATDYSTo/qLRZiIliHFv31awjvDKhgSTXppzPm+nBqPnNzOIBexFN/M6UPqm9Zbzeqn7vWRsewUOKnJ2LKjVKuh2lioxMksEOfSbG/F5l5LareiFjjxAgP9PBjmWCQAXxZ+ek5DdQWRZOirWl1nWICyiAWpA9UF1/a1ydHbdb2VvkZKJdfKicTDS9aJI7zRvbnm3QtnFt73SPOpoNbXm3l1Yqam5NNfScxAAuo9zir7g15gOjD+qj1cb7YVcTdoCh4x7WG8koTrLkRQiXYxHb7B6T7pX3LIXAeNtESWs7AZCQmkBJf+G3tWxgyfc2GnU0esgchFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyEtuBDwwNDW5RVymBxDkUQhMCz/WmnBGTMVXv1Js1U=;
 b=cUvwTJy1vCVbdcDlSI2X5uAs9dU05Ku9ywaZmB/r2had4u2K5BppVZJqP3rrnvuZpM+oICwd4hh8bX8o4Sc7GIc/KLRQJFimWQKemTfjm/QuC5bAWRlabG20yaJP+/jvD80hGOexH8DOhhp5L5jKJ2AjibEIXtS5P6El9ZXUgMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB2776.jpnprd01.prod.outlook.com (2603:1096:604:12::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 1 Jul
 2022 05:18:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 05:18:45 +0000
Message-ID: <87bku9s95b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/6] ASoC: simple-card-utils.c: ignore Codec2Codec setting if
 it already have
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 1 Jul 2022 05:18:40 +0000
X-ClientProxiedBy: TYCPR01CA0128.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ea73e24-8531-4b4f-aac0-08da5b2128d3
X-MS-TrafficTypeDiagnostic: OSBPR01MB2776:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I2hGgDr2BX5wR2TWV2ybHDWgC/L8+FrtHRmWAyy1/kyEOa/VC9KxNTsRJt9R21d+ZCfPchDN/5sJr9VSBgEho5Jxvk7/TOgdmKdPXmVzPw8HbRvMMJpx/M1H6XLOWEeU3OUuprnXL1c/j1Oq9YqAfsuHtrigKvJ4dM3S12tGy/VVnrFd+yRpkZlPHhv3ZWNtjf4f7RzwKKIOpt3kg9C20O+L6EYLfMP77MlpvcPezzm9YKs2BPTg61xOe2LEFcqpQNCOQA6xqgpGRwspIsc4xnpFoSYx6W7EewtpWKf945NZahNZs0dRnUG3SvFdLH3BEES46vPh9tez+gfCBHiRArvNiOECXWWoVYehmHb/yj5j5AktrvMLBhc4IjHKsMtquRHn17iriTRqiUmEQRDFTR25OqryrlUgVRcY6EZS0Xjnyhb8h+ipcuR9g1OjWStwnfaF2NzXpBSN4qvM/Mz6/6WjYqOnN1agXouTIRg0OyiYdAP9t6B7mc9HvBAerI6J6jbgBxG2cmriqkYBRtUY3tQ8klfClWEoq/E1LKsOFuoab16C9C0Yl7KT0nWXdZYP3q5D9ZGdMq027VAyBVFpA1MwX6v22XCPrLHrVFqP4GZVS1BvZ+UISSG8HYJpc7u+G5bkxX9vIrbKsgFq1IHU/0kbfF89iQu/o2YdIK4rvsvrLneXu/g7nsF5yUXtH2w37kvIXnlDk15PibjAix9RsLcb+FchBtC9e6mvN8kxZRVpNn20PxgNybe95CouEVoAi1YhNZmKamguEbjSisWxAMUgH3fjlbxjWdrOyCe5fVe5vil2AYCT/iYIou4tMAe5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(316002)(26005)(38100700002)(8676002)(41300700001)(38350700002)(6512007)(86362001)(6506007)(66476007)(66556008)(4326008)(478600001)(6486002)(8936002)(52116002)(6916009)(66946007)(2906002)(36756003)(2616005)(186003)(5660300002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dnWIUm1epBpMEWsEp5Y1vrw/7VJ1zWbW+0cSS3faUNwk6DLNgifudN+8JxAe?=
 =?us-ascii?Q?wbDiVdhsaai5fZHypL3C2ZFdPh6HKklcI4kjHootraNe0yWudw7wv7PKAkdM?=
 =?us-ascii?Q?5noS5CrxI6MM6jxaGicQ1NcYw8TBbrfnsDnraXzUsv0rwAki04Fk5QAoiozG?=
 =?us-ascii?Q?MENlz01fUQWsZxKzhhQJsBFivXp7OHIul1AspaaYy9h7fiDetObpIGHkIWhC?=
 =?us-ascii?Q?eT0w8gIvWuRZ0CzKPwcvAD2+yF350Fb1CTsjm+d0/FDSdZxKLdfGvMsbY8rX?=
 =?us-ascii?Q?H5KwCjKSGshAv1cyuBztfcOC5qGaIFabjYQa6UldzJb9h4Lf2imFv014fca8?=
 =?us-ascii?Q?j5KQJv+o0nlqZQKRJ1y4xfCB3Y0N+Zl1XTg710Yo29H6lHJ5v3apqyqjAyny?=
 =?us-ascii?Q?RLQkgv+NCl1FBoOMJyTCGy13q3r9pzrTZCqXNgXfgANUfds2FBJrlUTz0fZA?=
 =?us-ascii?Q?I45vBMLuupzENH8XDMznkMqAg+ydSKAAcCI1s9AJIhLoHWqhb0h1/waREjvm?=
 =?us-ascii?Q?6W3GJdbZwKtLL8YC1UddS/clnplgP/NTTLNAK3lL0yQB+OzTWBTJp75BHPId?=
 =?us-ascii?Q?ODJrD1c7Kv3qaUJZ1lfV4cXDJm+SvDsReQajrZJPrLK0q+bUMOnBk8H8ccui?=
 =?us-ascii?Q?pQvI3EoSGWtGAeV2QdWQ+DQ+UdHnEYwgtiD6BslZumSntdYX0nZ8TTVCrxDs?=
 =?us-ascii?Q?zfMpB9pxps+dJOCxmunxsU0NRdn/3FrOzFjiTWIthudcKHTu3/xWsfrQHwJ3?=
 =?us-ascii?Q?lC+vsQWIfXyNhL2b3GqZjuz5Zy0YsbYWib02eKwyxzBUqs/+6JFcNlY8G8wq?=
 =?us-ascii?Q?73jwG4L6Ih3hjtHnOJmohaDmTY+XezyxnZmnVnqfLzZRizvfJpk1ssAgG/fY?=
 =?us-ascii?Q?PCq8jkpTkzwC3LAUL8ujLx4LjL3adn/OhRph7aGgOsmxvwdEiV2vi0z49hpK?=
 =?us-ascii?Q?IRomXYGG3RAjg/sHCoKgUsOZ4wsUHFTcrWNk5wkxssTZRe+iZawWBko+ibDR?=
 =?us-ascii?Q?eBQgK0qiavTj/T9T+AMULfJokfOwWl0vYEKP6X0Jc8ZP20Myx5V+8h/nN207?=
 =?us-ascii?Q?16q4d2KjpXIrqE/AF1hrWcJYHWpvkJ7GgVFJIAWXj0pD+e6ZTSclcgQ/JuZ0?=
 =?us-ascii?Q?LfPV0mYKdBosu5bUnxBTjDOBva83CH8YiW5Ubw2IDXo2mnoJsQ6/UslMxXHm?=
 =?us-ascii?Q?pK5NjK4JzubNlCs4AE/FSRCwEhAXIiwFzq+4TWlBmfZinvighQVTV3xK+9wF?=
 =?us-ascii?Q?DBKzdTX9pw1q87nbhAw5QC6CXx5nGDmbhDJInSsJkMcvafK3IiZvfYUVqNK8?=
 =?us-ascii?Q?FYgx7gIKKkfgKmSOmcHz3DD6xQFikC/F0w7jl4SnRkwdCBbudUdC5BkYc2Zl?=
 =?us-ascii?Q?2BNycVEoJmPeO8qq4TbaKdwl9c60eWhtYjOmLXJyV+CxJKSSVjF3N3/HCI+Y?=
 =?us-ascii?Q?70Vlg9oypl0KSIZ4sGPl8HpxZqD8/KfskFt5XLd76JiVIIP7St7INl18bekR?=
 =?us-ascii?Q?/+Zf2o9nqsrNnBgj5vrwyhG9sC5ZAiviTkDb09UBlG/5EoT+BUogUhmOQQ0U?=
 =?us-ascii?Q?YZ0gLUEN8goIaTaVuh5NiUfBCUjwx2TSmcQCNjcbIqH5oPKgKcNZ9K6oNuSP?=
 =?us-ascii?Q?6+bqnjrGOOK3yrDxgz4jHK4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea73e24-8531-4b4f-aac0-08da5b2128d3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 05:18:45.2778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zlUUFkGI7rdrwGejgAA6OHsSMcrHKCwZX4kcafva9s2M9MFIcfr1GMSQqmga4IaINJvVu/5PFeHnSWZAUGXXOhOzGLBgnCYoFWWk/udpFPCgv7eqsahxusVO5uX/7ap
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2776
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Audio Graph Card2 setups own Codec2Codec settings,
but current simple-card-utils.c will try to setup Codec2Codec default
settings if needed, it will overwirtes the settings.
This patch ignores default Codec2Codec settings if it already have.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a761af6b13b6..b8a3da692ee8 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -527,6 +527,10 @@ static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 	struct snd_pcm_hardware hw;
 	int i, ret, stream;
 
+	/* Do nothing if it already has Codec2Codec settings */
+	if (dai_link->params)
+		return 0;
+
 	/* Only Codecs */
 	for_each_rtd_components(rtd, i, component) {
 		if (!asoc_simple_component_is_codec(component))
-- 
2.25.1

