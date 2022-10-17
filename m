Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD56601DAA
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:37:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F6838E3D;
	Tue, 18 Oct 2022 01:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F6838E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666049858;
	bh=S3VnA6HFyhCb4pm7gl3u8l4JRYPS+WACkvOsQ2Q6eps=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgoCglH2O3gV5QyVujwbuhJmY7g6kyFurezzP3fdGQfkSBOaICrlC9BPLI1SE+U9/
	 TlG9zXSssIDpzeAVuutHsAcEL0X6D3nJAs1wwW6Gubkrk04n22gp9v69FQn2ioqR7v
	 h743Jx+msmm5qm0iZB9XLTCh46AvNDmzwsKuQvOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1D4F8053D;
	Tue, 18 Oct 2022 01:36:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4606F8053B; Tue, 18 Oct 2022 01:36:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A6C1F804FE
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A6C1F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="lfitBL8c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4v1s1Z4lPk3b0noQWeWc1wJD8Jzj3pc0O9kHxYbynZc61fjh0ZvJsTiRtq5zK+bfcUGe6Gj/bOuyrMJXcNXs50AZOWpjA8h5rLQNZLSW1ypz14lVDiN/TX8KsRYgkD/AQBHT8b6SghzKQrM1DPaf5lmrOdjbLrT/JYsgk3+PKIMSujRfrPJfn3c7TNTKEfCd0hgx6EUqKuU5f+iOwKfoS6vVAo+xicKHD2SQzVdAypSJ8NZy5DhXBiybIJMn6ZEhTDwolV6Dz4JqpDIZxSCamK0GC3tCvhACiQyYz0A44SHoV00UsouVXJqf+gIVs5Xrk3LSoo0izUmRXWwfTe42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hVES2iAtj+Ki3Uwufdq4G5tHRiKssq2SKKEWfnNUn4=;
 b=d9fVPwRebuwwOw6zjtB3AzCM8oNpH1w3vOZ3QY2ivZAAdvCnOLubC+sSwZLx8EKQRlnoHsGemM8c9ee33ODy+fGn+qx1/aX0DGYEnHhNc/ERFtUBi5sy5RCiBjVI/6jQZrcU9RdrgNHaS5V4/u99pp172WfIE1C0KpAt6raWjxhvzyC9wdh/NleOyR1Jx5M0NvplQbQ3TW0BmtrQDGaOMGteG+oNKWExfEyrVphC2VlJlKQjDAQU/i8ziphFCOu3IOwJUZ8DKPswTroPKr+5OfJYXlhHPf9bEHAOZAwnAJ1mtcNKHX/4KTp0AJmEv77Cm22KBBzuBh4wDgxOjH3/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hVES2iAtj+Ki3Uwufdq4G5tHRiKssq2SKKEWfnNUn4=;
 b=lfitBL8cRTEq3ryJG5O1hJuGewGx2y1ZQAHkvNHKB9s46/8uZ06hRt79/ZJx52yk29gUZO0STL/pEd03z6hn4DuN4X44Jt9mcFfFX3okyIzuLtKmsOmyvzTF+W4ZMg6aQWjWMjH98uLN2RCwcUBfs49cgTQuXOWdJKwOkExhIfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10199.jpnprd01.prod.outlook.com (2603:1096:400:1ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Mon, 17 Oct
 2022 23:36:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:36:35 +0000
Message-ID: <87zgduowe5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/11] ASoC: soc-dapm.c: tidyup error handling on
 snd_soc_dapm_add_route()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:36:35 +0000
X-ClientProxiedBy: TY2PR06CA0024.apcprd06.prod.outlook.com
 (2603:1096:404:42::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b26fca-64ae-4738-c7e8-08dab0986e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rG0IXcLVrjzLY4d7keeN3h58qm8lgroGeTj1PM28nU7YVYyjGXnyMQHrRb6UUjabFySmLn4spx9PhW5qVuSIXWs09yOYzL9skteVcT14hP7g2cB3rqTmllJBz9JR99MZwdGBk5e2Mu/Cdp9Y5p7gJRocUdLy37yggqHbIewZYg2OMuARHKmHqlO17GzBpu9YM0H+nzztWGVaxQ0CrflVxyGJykatZdU7kuNZw/BPfHL2X0NDPOT5HRGvtS2+PeIHCpjTrOFaYbFElbkxcNqk0s/wkK89utMhtIzY/pOiJVdwRQE4raqGximz3CJWQULbvCpDqNYiTOZs9vNRApt2IxJ5ieXsIAgvOqGA1LPBlca7SLINXY/Hb+CW8ZRKPN5l7xN9DUW5Xt1G/4eBmNv9y6H7AZL8BkPPEQlpdNlhCV1ENaRCAzlppCOqDMiuMnJUPyb4iaO7mWspItU8e/wFrnv3e+UCLN/w2LAvfw6mq0KzGoTjU+C7uS39jffxj+IMR6pWJjqrMez6Dm4WRi07iuABdP3JORuqlK7/joSliFYt03/mktbw8hNQgHG7cxYK8v+DBM+BixiWwW+ei8aR9ae6fnR7PBXBi1j4Yfq17NfcoQqkc48r+t0/fyRFWLs/PVqMco4x2rwIwzv2/fekN1UikfN+pnR+l7urCWP/q7FfuVYbguo9JgxDTd4yERraW/kPVxfXESlMelOGb2hU5Stud1JSo+5LoHo9O7CUaJnoa23Vd5gsa2p+P+Cmy6/Xv4ohsyYqTOeJAUFzBSYr9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199015)(41300700001)(5660300002)(2906002)(8936002)(316002)(6916009)(36756003)(6506007)(52116002)(478600001)(6486002)(66476007)(66556008)(66946007)(4326008)(8676002)(83380400001)(86362001)(26005)(6512007)(38100700002)(38350700002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L4q8TbPdFcj5F+pGctZTIjShS7noXXlSNiVi28auEHLuicXjh6pcDNmtNCZh?=
 =?us-ascii?Q?/QQa7NKLD3kxzVMuRiSshZGRY/o+R87wN0W1FfDhJkoFwSOLi55WlVt5E/H5?=
 =?us-ascii?Q?QCCZ2nCkrcGDBpGxjh7MF7huPhW7e8EVdYmXSQufBqcTVIAzP7emXrG54Nwo?=
 =?us-ascii?Q?SHxd0KiYd+Bog5hBNPjPh1EmcsPY7N4RE943diGfRvZqzxDVbLzjHpCTIm+Q?=
 =?us-ascii?Q?PGOoKKWSTWv/AU5eIs3ayYU84C0fjd7ZefMtZMNVs8P0zVr+bKg/plcL2GqF?=
 =?us-ascii?Q?1MnR/TVaWkCg1Sdmh2JRSni478/FGChjwbgZKVXY113ekPcBEBMZYVrhH3l2?=
 =?us-ascii?Q?WW7KtRIzHMCqXC1HkIlCQo2efg3BtDR5/nLhmoa20rLJ+EeTLqDpyC/AjbEG?=
 =?us-ascii?Q?sida1VL9+pX6nwW2/kdTWsx6A14nd+LEjROuq+JyjmC46+ubQ697KMJJYelB?=
 =?us-ascii?Q?CB9dHtabJOG/dSUPwFCJSCRP45okgsN/NpG3CkGJBvtH3Hr6XpLTgDkxsXVX?=
 =?us-ascii?Q?aOcB7l++Lh6ozT8a/mVP9esl5nhZ9bYitwUdGN/4mnYhtaQL3Q+AWLYOp+GN?=
 =?us-ascii?Q?qHy57J6JFGsHKu3hO5/+ETUagbzgJWoC3jm1sY8o8RMoVdN5TND+eEsW8CLn?=
 =?us-ascii?Q?LjS3TSJgBncQQRAzlErQIjxlqQkRo73ZrvTCIFOiB8yh8nUfsEN8/8E/lYq7?=
 =?us-ascii?Q?HXGyP7W3pAKpssvwqExG7/ddWc3GW9qaoa5XDkTZUqNf1poLiFgv+9RqAzCB?=
 =?us-ascii?Q?eAwXgpGHOppu47WNY27+iEyFeELa9uYgY0v2G+XGMJFeVnHkZglO2WC7A4Gr?=
 =?us-ascii?Q?hF60fKzSlmxFbHfcUfqm7RGP0cT6r7ODnP7RpultLxvS4cPGcgbhoY9ffnbg?=
 =?us-ascii?Q?p3mJputKfR3runi1z/ecmZEdo7yYlETn3riWdymq7zsZO8mVTDNsKKoJyy1u?=
 =?us-ascii?Q?vOO5thlfny7KF0wA3lP7lgHjH4wWO1aIWfH1x5AwkZ/4P8RDU+evYkSL8klI?=
 =?us-ascii?Q?T88Knyaukt1xk5zty4yqlN1fLm6fwtg+SMxUtnos2JTg0BFG65FSmsNG3xLf?=
 =?us-ascii?Q?daj6isZd+FCyz6dqW8WT+UTk8hlaSIVyoGV+Uph+dZAyHGV4yM+ksNaxadAt?=
 =?us-ascii?Q?zq74sDODKrJ3ANX7jEo4ZP666dTvpTbIYltBGjzyYNy5lk33NETQt3L3fVRq?=
 =?us-ascii?Q?Uhbl9rS34Id1IHGm4CliMJlRA4PL3ZqIDsWpNY+hvf7QXzFIITvc5IerPoGJ?=
 =?us-ascii?Q?cUOn0VIlhBTrdYGL+m1TsC3BJCVGYeLcEnuzHoMH5XDaqEphReCfejWuVND5?=
 =?us-ascii?Q?XdzZeNXKq7CKVIUJtY7E9qvVI4PkznS5tmPHUk5kS/7QjKj89NeaPLd9T3BW?=
 =?us-ascii?Q?j1PXyeVXSYK6E0ce1O6mVmC0GecPePixwfFRhaOxgrXJ7RhluFySKKxLhIs8?=
 =?us-ascii?Q?K8e6X9C4eTDesMon9CaYyp7oZgR9He8hQ1WJp5MomK/lvkzSmsSvMt3/hLDx?=
 =?us-ascii?Q?kN1A06KsI5Y002T4+PJMxmuIQRo7JI2lUa1+YForFqm76mqyKpyxvESQgNE7?=
 =?us-ascii?Q?q0prqq8R2BAyovfzcBicGgeQLzx/mi9a2uIrI07VVhRrNVDlG51DN3q05+o+?=
 =?us-ascii?Q?Emv8vhNp1w2Im1e3fTbNJ84=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b26fca-64ae-4738-c7e8-08dab0986e01
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:36:35.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1emxR6a9nhKEirdfqwZvRvrPBqHnfD7Yt/BgdBSWOaCena8bEAbB58GFgG7SIPPCyFjvIu3FmEHZ6GT0JGZocAVN31rH6vg4M9eAak12U3b4RFMW8SYKUCsT/o8/p2bD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10199
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

Current error handling on snd_soc_dapm_add_route() has some wastes.
It indicates *own* error message *only* for sink or source,
and return error directly at (A). OTOH, it has similar error message at
(B) which indicates *both* sink/source.

And more, (A) is using dev_err(), (B) is using dev_warn().
(B) is caring prefix, but (A) is not.

(X)	int snd_soc_dapm_add_route(...)
	{
		...
		if (wsource == NULL) {
(A)			dev_err(...);
			return -ENODEV;
		}
		if (wsink == NULL) {
(A)			dev_err(...);
			return -ENODEV;
		}

		...

		ret = snd_soc_dapm_add_path(...);
		if (ret)
(B)			goto err;

		return 0;
	err:
(B)		dev_warn(...);
		return ret;
	}

Above snd_soc_dapm_add_route() (= X) is called from
snd_soc_dapm_add_routes() (= Y).
(X) will indicate error message by itself, but (Y) will indicate
own error message at (C). (C) is duplicated.

(Y)	int snd_soc_dapm_add_routes(...)
	{
		...
		for (...) {
(X)			int r = snd_soc_dapm_add_route(...);
			if (r < 0) {
(C)				dev_err(...);
				ret = r;
			}
			...
		}
		...
	}

This patch (1) merges these error message (= A,B) into one,
(2) use dev_err(), (3) remove duplicate error message (= C) from
snd_soc_dapm_add_routes().

By this patch, it will indicate error message like this.

	- error message with prefix
	- not found widget will have "(*)" mark
	- it indicates [control] if exists.

ex)
[if no sink with control]

	ASoC: Failed to add route SOURCE -> [CTRL] -> SINK(*)

[if no source without control]

	ASoC: Failed to add route SOURCE(*) -> SINK

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 1796863bff1b..b4f876dff994 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2994,16 +2994,11 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 	if (!wsource)
 		wsource = wtsource;
 
-	if (wsource == NULL) {
-		dev_err(dapm->dev, "ASoC: no source widget found for %s\n",
-			route->source);
-		return -ENODEV;
-	}
-	if (wsink == NULL) {
-		dev_err(dapm->dev, "ASoC: no sink widget found for %s\n",
-			route->sink);
-		return -ENODEV;
-	}
+	ret = -ENODEV;
+	if (!wsource)
+		goto err;
+	if (!wsink)
+		goto err;
 
 skip_search:
 	/* update cache */
@@ -3012,13 +3007,14 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 
 	ret = snd_soc_dapm_add_path(dapm, wsource, wsink, route->control,
 		route->connected);
-	if (ret)
-		goto err;
-
-	return 0;
 err:
-	dev_warn(dapm->dev, "ASoC: no dapm match for %s --> %s --> %s\n",
-		 source, route->control, sink);
+	if (ret)
+		dev_err(dapm->dev, "ASoC: Failed to add route %s%s -%s%s%s> %s%s\n",
+			source, !wsource ? "(*)" : "",
+			!route->control ? "" : "> [",
+			!route->control ? "" : route->control,
+			!route->control ? "" : "] -",
+			sink,  !wsink ? "(*)" : "");
 	return ret;
 }
 
@@ -3104,13 +3100,8 @@ int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
 	for (i = 0; i < num; i++) {
 		int r = snd_soc_dapm_add_route(dapm, route);
-		if (r < 0) {
-			dev_err(dapm->dev, "ASoC: Failed to add route %s -> %s -> %s\n",
-				route->source,
-				route->control ? route->control : "direct",
-				route->sink);
+		if (r < 0)
 			ret = r;
-		}
 		route++;
 	}
 	mutex_unlock(&dapm->card->dapm_mutex);
-- 
2.25.1

