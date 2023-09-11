Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CBC79B299
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82A8AA4C;
	Tue, 12 Sep 2023 01:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82A8AA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476736;
	bh=v5W7QXExVEQhZM4vJF8ZiZCOPE/f4kYGhLHbP5hWm/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IoRGIbqErVcfKrdUdn9JdN/i/4H7ckpet8c4uW2B6bUBx67achLHO7eKlX4SPkhTm
	 kbjX/wRgXQ2JM/CTm1ZaTntBEfPfElAjT6wUQtJ71MTaanGtDnMk9EVLN5azmXcoZo
	 YLrZnjZchWWlm5GMmhdK9s/kOQfr1gxsEtaL8ofQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46C49F80634; Tue, 12 Sep 2023 01:52:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E338DF80634;
	Tue, 12 Sep 2023 01:52:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52579F805D5; Tue, 12 Sep 2023 01:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D616F80622
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D616F80622
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DAN7Sip2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n10j5Kc7Nvu1P/2zLLiIQv/VH/nzAk42VOAtZd/FDSZCW+Qj4bMZMYqzDTlCh9+kIF/f74qebpW8JcqW+i+WHQnkhM2fb5nb5AKeozhjrIaHODg/EAbaJ7XeJtjSzheg7f9K/v1aukiFwrv+op0Xhl/GnDi2/9AZO50qNZTEXvuA1OXY4gzLwI2G3ZrKrDT03k2f0BebU7H1EcjBZZftxLrSMHc+AaASry5dDvdevg9Zmv6QdXdhJO6wRHWCU37JZPUA1UrA5LtP2/vwZoHfQkZAS0VrO7/us+PR6AJK2Q6SKOcvufDk9DLeizBLViqSsEKtn5REizuN09DKCV6ZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLuXRdGRb9ea6U0f6mW3pf54V923Yv/oZYI/Z/UmneA=;
 b=ISWIc3BEGqLVtA+pqs7KOYaPmRmKl0pYgao/zEXkqFJjKQqYCCl0xNDTKSRYdQtEWt6/acm3HlSOOCyiF08oGPakAQb31jjRB1pkDunR7BAyDHCc0YRVmgDvQqcW+GuNp+rOarkXXcTQf9V2J5XUY0jWFkiP8K4rS91lIaDlsAF0rVQs3qQRyUMhVY8k9HAxzXQI65i+G9zMNhMQpiS95m4HHbtQD7HPHd61Fj0T0mpCbQjbznG0twOK1Gl/1A9oni1HTnq64PmOLF5h0sVDylqKYxYD/xvXO1DOU5sZz4FqsTKObsmFJRuvWWYk3sbCL/RtWJZmQfBxZfpAT0urgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLuXRdGRb9ea6U0f6mW3pf54V923Yv/oZYI/Z/UmneA=;
 b=DAN7Sip2kfs8e0XA2euc0+70fh5Zp5SzIrF3Z9/63C3Uf7qVy2cTZ9xIFVL2HJZugoM1+ENRUc0qY+uMthbyjmjEGlTXM5ZLlWGjL8ni0s/r/3leAW0ubXQ2DiTu2PmHyBgGCHBNo873REreAtossh3oSfwen27LjVEsk4zDqvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:47 +0000
Message-ID: <87zg1sp8vd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 37/54] ASoC: codec: wm: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:47 +0000
X-ClientProxiedBy: TYWPR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d22d4d-0b58-47b6-ce97-08dbb321eba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CVbxOjHteEV5caRo6CCUgA9A12xoZVgcS3a0RvRUAFyGzN/aUxChU40c2a2JF1HUiTrw+gcXpXCm/JCX+8WcVmYqkcbgSTM6BglDNkyVhx9KRTkzYY1WuY3u6RxVz9PQTcTpjo1wpf1VjpzyHgH9P7EjZCc9mpsUewpGglfyNb0dsJ1yxG+aCqkXXDD6np7jbIzYdnWBNnnIdkVqKD0CNBFoQIh8NC0WXjVzQbVhU/hiuduAQZH7Qt7paoyrlkMYyUiX6WpNzNDqcCCFqkOFU4oC4E1fNxqvirxGMN6WblB90zlZO+fpmGJyuSTnhFDpYXENo3WlbrQ9G+FyN0HeLgdP8agES6uVrxhriH2vnsungiCUuApsqGtlCvPHNsYu78UZmC/8Dge9ZpeKHaNaSQgBQca4gZHApOKVuf5KNzAsn86NglzOxl/EnIMnl3KLSPqQ4IQdG29bbIaeJnXMv+sSFdvIOTS0vARvQS3TV5CZ5qb9ahnUxSSrIFtQyJzn7/7CEF7UHKONGl185EUqQaQAml/BUBrKz1gp3ijGx4JiukFZyINZ2ccdHW0ZbOiOKzoDs1cmtJ/+RxVPVRBz05YZ4CCKuIWJdpa5CqhY7h98Wr83F/UgThp7CMQMXx+F7sR/nvyGVsE+H5NWzuBi6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jl22lUNafb5csC9oHLkNflxEE9ItXvJljxWRK2gd3H6H8uc6ksrJa4T5sUvn?=
 =?us-ascii?Q?xyiUc3j83QZfWDgQ2lFAnRFCK6hmnx7qPDCzGpYHPI+74D36fNvZaNYmI2Hx?=
 =?us-ascii?Q?P8bqGwR533o7N2W3FrUf6nOsYExAQg+C7ahgmsVwl3LJiJvx4yNxb4Xymj9t?=
 =?us-ascii?Q?VdFQHxxkQD4te1lJkk+PyqMX2gXO6W0xt1BgYuVI2ucDbrKV+b+UgkDq1Ld1?=
 =?us-ascii?Q?VrkJjQvzE0O6WS/xUMofSPN3TNhqqYF9xS5auUCRzR19cs0XCt7qAwKAr4Ok?=
 =?us-ascii?Q?hJozAwdBgMySMZtBjISBQUaGYMKeQzHza7y298toFmEb563DXNzg0U7X55q4?=
 =?us-ascii?Q?Y0Y5/tWVFz9CPn9d8KAvSyO2ipkjoHPBb5nuG1bT17l9qoBRMGzsisK04Pjq?=
 =?us-ascii?Q?YpTWCwUv/l9JgK7Rn57gn0Ave3RyBtNrXbCAoVTW5ak3OyhE6dUGsq1mRyj5?=
 =?us-ascii?Q?hO03BnkQa6s/b7lCmZlQ5sHN3OUzuRmvcqyXOH84345GJnaxFGssWcSfQIul?=
 =?us-ascii?Q?BEYTzwjPs/iLDSsKDfA3q8xeWcXwSyhS9Ym+ySCURV1ti6GjL1FtlZp6yL2k?=
 =?us-ascii?Q?J2ejPPoFeCFDgS+Q1hbyeoSin2Vbj7MrWfI3kPLMmwpmRk3/hmGeMN5kNHjY?=
 =?us-ascii?Q?4ESJ2ljclBAgDQkkDBq3Pi/JTthJ9paVm2gHmvWAskxpZQFqUlGU42Cqu60/?=
 =?us-ascii?Q?2nbeE+xIP/6WUiGACJ3nPqH+4s8cKc858787q4Is576EYIuVdBtSC2NF2gKP?=
 =?us-ascii?Q?k3Lk2FJN4ogDRqUZupmAqgW03h2b4VGZTIaL3Oqc8QeHlIPYyen/mlC8F1I2?=
 =?us-ascii?Q?gfrmUAznfeAX1/vKkEu6Tsp40xX+Xw1dM8zIC1NfdIf03LNlRap1EczTvDnX?=
 =?us-ascii?Q?PzHodYV0Y0a6QyZF85LpmfmFs1aInHbgaeINi9lylSjPckNECU5PMMfgYcwI?=
 =?us-ascii?Q?AZ0tYR2sK94Hl1CX4savSQ8Mbv1LeT0VAah2Q5+e3sboEJq5mFOhOXMr38HQ?=
 =?us-ascii?Q?eRwFy7t4AjeprDfcsiHXldQLtC9Sf4TEUqrZOGGhBYCQBaMbcQHRzB7nXpxz?=
 =?us-ascii?Q?GI1ngf7c2vZLFuXI+xOtOOF7A8HdGqprmzT1/HS4H7h0FqsGQc+9zIvAhq42?=
 =?us-ascii?Q?2njhnhjxw73l7maeNCo2hY1dk0gIghwx3g0QQl/7HuL5vFdOZY0mbGIm8kq+?=
 =?us-ascii?Q?4B4Kf2qycZYk2GA98krOaADePZFekz8K2HjOTBZjixWl3+G+ll+UO573SjFz?=
 =?us-ascii?Q?N/bn2wuw7rKaZIh3QkMsUWaZCTQSK2xh+qBnAaghqbNOsbsAzRXDWTQ6Pkpt?=
 =?us-ascii?Q?JgXVWmZurQVGFoSOIhbKsY7EFGv2iRU3HN4uD+YSPiA9V2bYTbw5N4d3AHJ1?=
 =?us-ascii?Q?2qEgmjgOiSTdEMT8hO9Wp0Q9cRZPiMl45fXxPKtZ3HtNIeoWEEcGAk0vzu6t?=
 =?us-ascii?Q?vi1xxdNZskeqcX6VcpicxQ7BAb20tXkltcUvnuNeS/OfLnhPosLnLWrg3hVj?=
 =?us-ascii?Q?quxY9oiOFF/d0WI7w3ROHCPHghTelLOrL8HYlIbajU1IuYdd6PISFE1z20bX?=
 =?us-ascii?Q?sJBoGaUBRyoqmo/7+bp8xZkJSGCD3YHA7cNsD3NE4fqdtccCEakhRHOVwFjb?=
 =?us-ascii?Q?8EOUbNrdUmfERi/Frdov63o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 03d22d4d-0b58-47b6-ce97-08dbb321eba6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:47.3116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F3jJqfFgEr54IfOTPrn8efqM+pHa81FmxaihsJA+f6qPz5iW/rWFp/IzHL19oN3Q2Lf4U2wIFpkrBafmyndvo80aPOaDADXVbBz8OCDww5agarhEkSx/OGPMGRStLGS3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: CXLTR7NZ6M5MWKH4REVL4FKNLKJKB533
X-Message-ID-Hash: CXLTR7NZ6M5MWKH4REVL4FKNLKJKB533
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CXLTR7NZ6M5MWKH4REVL4FKNLKJKB533/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm5110.c  |  6 +++---
 sound/soc/codecs/wm_adsp.c | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index ac1f2c8503465..0f299cd07b2e9 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2253,14 +2253,14 @@ static int wm5110_open(struct snd_soc_component *component,
 	struct arizona *arizona = priv->core.arizona;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "wm5110-dsp-voicectrl") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "wm5110-dsp-voicectrl") == 0) {
 		n_adsp = 2;
-	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "wm5110-dsp-trace") == 0) {
+	} else if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "wm5110-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(arizona->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 6fc34f41b1758..db847e80a9c60 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1236,22 +1236,22 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	if (wm_adsp_fw[dsp->fw].num_caps == 0) {
 		adsp_err(dsp, "%s: Firmware does not support compressed API\n",
-			 asoc_rtd_to_codec(rtd, 0)->name);
+			 snd_soc_rtd_to_codec(rtd, 0)->name);
 		ret = -ENXIO;
 		goto out;
 	}
 
 	if (wm_adsp_fw[dsp->fw].compr_direction != stream->direction) {
 		adsp_err(dsp, "%s: Firmware does not support stream direction\n",
-			 asoc_rtd_to_codec(rtd, 0)->name);
+			 snd_soc_rtd_to_codec(rtd, 0)->name);
 		ret = -EINVAL;
 		goto out;
 	}
 
 	list_for_each_entry(tmp, &dsp->compr_list, list) {
-		if (!strcmp(tmp->name, asoc_rtd_to_codec(rtd, 0)->name)) {
+		if (!strcmp(tmp->name, snd_soc_rtd_to_codec(rtd, 0)->name)) {
 			adsp_err(dsp, "%s: Only a single stream supported per dai\n",
-				 asoc_rtd_to_codec(rtd, 0)->name);
+				 snd_soc_rtd_to_codec(rtd, 0)->name);
 			ret = -EBUSY;
 			goto out;
 		}
@@ -1265,7 +1265,7 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	compr->dsp = dsp;
 	compr->stream = stream;
-	compr->name = asoc_rtd_to_codec(rtd, 0)->name;
+	compr->name = snd_soc_rtd_to_codec(rtd, 0)->name;
 
 	list_add_tail(&compr->list, &dsp->compr_list);
 
-- 
2.25.1

