Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 573F4685D00
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:03:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFE9F1EE;
	Wed,  1 Feb 2023 03:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFE9F1EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675217032;
	bh=Xurj5brCBY7BWbMIQ9l/quobrCR9Dn/nc6otInZZgo8=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nHNcRZxSFD6zBRs/0PQPwL1wMrHcvlntUNX4c8H6w1eT3Rp2NQ/WXuSBtrJo80cPu
	 b2rdiGPekXbxTX3SNV4j1J1oj4L/L8JWVhJSGQ0kUMGw0Wkvo8aHnXDVOzIHrWGYmV
	 vJICBHCRDTzUWOiOhljEzR0FAeR43b7qeLHJ+M54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 231B0F804C2;
	Wed,  1 Feb 2023 03:00:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30686F805B3; Wed,  1 Feb 2023 03:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::711])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CAE4F804C2
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CAE4F804C2
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LZqFxgBn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfpFx6OAQGtiVrdrGkbuPOpR3Liub+jXRS522pYyzw3OPDPh8a/2/xv/3tPebE3P8DEBNvguwgi25Z17zgqPK7BQJQnwTxiqyvLwScxOfAAPCYb7yVEouQ1YA4LeQ390cvv9XUkagq74ngdpbYIUGjdVjEDsPOIpzjlnARgrt/LoNW5kb3gDUCEo7EO7kS49I7/hah/aRW7c0bspMtDO+RVyKbQZextt/Fgkljp5yLxmMEC6iEJVAis4275QkCZmW+tXLd1xd+6+55JOvgDlYmVVJr/t0fVu1AyHcYDCZEA1OJw9DuQ81lEBqZ7zIfMQrUjb5MKMnEIZ7fDsH5Et8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4WwqfzlsBRfWDVsGxKQrx5KuSKnLyesZZWnNJetVMY=;
 b=QIQ+5s4XixKVonCoHzGhzzjibvCD/ldAQkZZHn87MI4VHdjOvb/mXH09aVcWSxQrIqEX+4NCsfNSqlXumVwW5YyizRxeE5l2dp/JZQcJQ8g+a4w+qgk98uR5rxMTY623D5ORoraS3QwvxoT4HYCCAhZpNdkTwn1A9TBWOZ0PN3U9N1WEf2ljc/kD6rUhUZH27vjK6UEdSDmd25mKRIqGERx/yWohn+KRyRG7GBhRqYoa906ox09AH13TTrZKSmsBSTyHgsOuY95R3MBDMmatdhjC6izDZZQIPtBYwpOe2ui/2z47eL4Y9h41wIAIxr6ds7wIFDG/JSBmodZbVyiAUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4WwqfzlsBRfWDVsGxKQrx5KuSKnLyesZZWnNJetVMY=;
 b=LZqFxgBn8S/7JOck3AMKWlHNeO7WTbE6zoARyJhOiXPMPAPty+C+UyxKKm5lH2RRkI/qCAmpn+9hx/mt6pp5amrlzK93d5ydAxL1K0mE5SiMfgamHC9H2ScIe24AIp6kGMf1CbsGtVIwsiiutXTkPrLVEbAKqemVtZaHMd6I5Ew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5444.jpnprd01.prod.outlook.com (2603:1096:604:ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 02:00:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:00:37 +0000
Message-ID: <87tu065em3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/15] ASoC: rsnd: use array for 44.1kHz/48kHz rate handling
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:00:36 +0000
X-ClientProxiedBy: TYCPR01CA0172.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: d73f20fc-304d-454a-11b0-08db03f81ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/w51HuFqee3Lpj9dThYlVKaF0fFdSC97KN1G3ul29gVq4oyWC4jY44p+lvLz60lC1E5HNQ9xne7P2FW4AxUBKRyDM8Dgaci6SSTqODn/C2TQDGakF/aDnjQvVP6hxwOoX+akFWCjfWknZ1sAaNX6jFawv3GAje7xINbBp7ockKSDNTik6eyDh8HL7pGQWOt5v2rrVTjpLKrox6bHMh7AnUmMbTrn7gAzyVCq3ekk4SJlpUm5SPtjXbpJ6wsEMXamq3QlUjgLI5IuOU52YmX8mBMxTpnAzgqD/RzMBn6cjny/y+CLOnvgAK8Z260Ay8VuFZ7OJLLgLv0ZDxy4wbGXNnFVIlX3idweEVS6fvtR5dIYrPe4cfkU+ACw65Y0wYA/8vJr0Ffyk1ALSbver03WhS9V+lMEgZjHAdaEh1tB7/Fg5pYSUr6+gfH7yIB2yOpQ0aym0puRtIMmcOBKG9AGUwr+ELuWbTENyoO+SrLSLefHrxD9UJ3ZYllpzkg8dQBMo3ORd2qIIaYTsnht4ujEIXlehvhq3/lYWqi3qg3Fg9iS6/lvLvvUbXmF4NgxoAu9pF7WIFLUcf9m1+kpdp3B0BuxZJ4+fgVSnckIi6T5mTUaxrAvrAHx++NrdvlaS3A43ci9hvjOdXiGPUqw3FLps38JsoJ4dTfpOE6OYvFfKnF4irwPWX32VQyoaM7Oh3qtUTeAe5ahP6qs2gTFlXF6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(2616005)(36756003)(6506007)(186003)(26005)(6486002)(478600001)(2906002)(86362001)(52116002)(6512007)(38100700002)(5660300002)(316002)(38350700002)(4326008)(6916009)(66556008)(66476007)(66946007)(83380400001)(8936002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OgytsNERo3vyzjhSZPeue3TprzV050MywuiM9ony95u1311mUju0/lrvmG1G?=
 =?us-ascii?Q?BM5ewja1k2l3OchiKrT9OINQYMac2+Vfyvdh1WKjyJO362mebQUDcy5OC2pt?=
 =?us-ascii?Q?1OHM4zQMskwfcsRkHYL7iX7dBj/AuWAWE2lwEbLe5uso3/MKujhwvjzeb4Ar?=
 =?us-ascii?Q?TAQifHcaj8QNE5ASjoJ0e+U/gxBONlATlvVDtVNMTtyMDsbCf0W/Cnl6LCMc?=
 =?us-ascii?Q?hxOkjlWAqOudV/vvR9bPpOIPoIhDblvvUJSQix3onapOVWURA+Oh9in7TFfr?=
 =?us-ascii?Q?K4GFM5i2eOFNkIAJGRcbwTOPo5a/V12XRPcooylcmiDtQoBWDTXpbx5SksXO?=
 =?us-ascii?Q?UrVDhHZvbWQFXhWBOnbyhAEp0Ieeqqi7rkAauvulLHGo3MNvL001Hew313T+?=
 =?us-ascii?Q?azm1S6F9IX6wfOK+C+lY7Phf2x2S6h9r1xM8+m8D/VY2RwSsG6BFLBwSxQWO?=
 =?us-ascii?Q?QxatQzs/QjXiPXSirC0epCAkhdVC73z8KZZNiaxd2rn6LXYWL9M0pDRadAuF?=
 =?us-ascii?Q?l5RWIuaKAPtwMk6jZB/karhhpmXIoq+fr5kHdTZsmmo1SftitQbSGe+ZoUqV?=
 =?us-ascii?Q?pKCy9Sr0bU6ozSP3XawvXCGP4FYDZ1ktjpZj/uTU0BxWM1SzpCIL+V8QPYpG?=
 =?us-ascii?Q?1NKbBKsCin7FzbcrDUaOzdqnXH5vcY5jsftasvRYfz0/+/7nGj2xmJ0qLYog?=
 =?us-ascii?Q?j+M+XK1buGXo+iBY5NmMzwPnyrNxRb3+5kBakt865RBe5p//QSJHaYX6ivjp?=
 =?us-ascii?Q?w2TVBtm5vPUTUvgxGA5yPbcQcT+iwgzYvgLAoj5VzFsVSEyGwVYUqz0cC97N?=
 =?us-ascii?Q?X4Wj5V5wuE5oUlHo2k+5cq5ktJ7HNTi78VnRy8WTkCHpg6W7JoO0j3iQCCZp?=
 =?us-ascii?Q?wTRTL+wibCK+JIQY5S4ieYyL2Ea+3ELbAlAkUV3Dz6MlOdBJa8Mm/yxjPKRz?=
 =?us-ascii?Q?TqKJMwYXimJ+zAvYsLsJjuNioce6ztvWuAO0Ll5x976klGc9YI87AUE4v5ZC?=
 =?us-ascii?Q?1UGWP0iSD1hqY/g/E8R/zZI7PvsH0yVG06W7j8cV0FGIID0s86Mf4eDvFx1i?=
 =?us-ascii?Q?HezI0QOMKdGmBjJA8YVLoWqSQRGyIMf+3HSVwP5e1jG4/IL7s4S8fJ6a/Syy?=
 =?us-ascii?Q?iHhLexmmxmrHRu9LJs+e37uc4eziuNohZAH1t6hCPn4ar4uGQAj9ds/ztE7r?=
 =?us-ascii?Q?bfKohp6iU+Pl+YpSBbPirMg6f6Le9P6oby3HAJ0XLNjZeHx/HqcF82xFVT5H?=
 =?us-ascii?Q?240iOManJfg+R5XXFdu1FwLftr7dKxK6mts6SotIYWUsPyy9q4BKNS5xP49E?=
 =?us-ascii?Q?WMcZ4Vyd4oeQkGp0ULA6pz9mBKKS1rpp/m9D3wl2UrDp6bUYWCZ8lTzqsFLO?=
 =?us-ascii?Q?qDYct2U/NEU6ERIKZPctoVmjfn4+la4N+I0apZpnI2nO/GaGDPko6+4SAwb+?=
 =?us-ascii?Q?8wV2dZNTykhkyLshRDEqA2xVwVttgo6Vrj5M5G/gG6vF/uNyXoaUu9dWiQiK?=
 =?us-ascii?Q?iXwUQ4VkspXaPPkQMFJL+Ul8TblTGjEPHezwKbkwAbF2AwhwagAlPUojcxBL?=
 =?us-ascii?Q?lclSQiq0/mC12Z1f/YF8NdMr/iaA+iow64CHu8J+IdB9GIMYbyXbShOqP1WX?=
 =?us-ascii?Q?AOhbBiNpg9Fc07XF+ubSk5s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73f20fc-304d-454a-11b0-08db03f81ca6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:00:37.1725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LR8qGUEUSInuIewSe+91N3JBPcoRM49iHRWOXxLDMfKIQDWQVpiimCg1lzEFMYcnUfqSwwpEfOsx6qyLmdMS8qW0BJvmhFIEQOT77vUD1SUPRuIH5y7rzA7bP5+nn+ma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5444
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ADG need to know output rate of 44.1kHz/48kHz.
It is using single variable for each, but this patch changes
it to array. Nothing is changed by this patch.

This is prepare for R-Car Gen4 support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 60 ++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index ff8e8318edb0..00df32be4a4a 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -25,6 +25,10 @@ static struct rsnd_mod_ops adg_ops = {
 	.name = "adg",
 };
 
+#define ADG_HZ_441	0
+#define ADG_HZ_48	1
+#define ADG_HZ_SIZE	2
+
 struct rsnd_adg {
 	struct clk *clkin[CLKINMAX];
 	struct clk *clkout[CLKOUTMAX];
@@ -38,8 +42,7 @@ struct rsnd_adg {
 	u32 rbga;
 	u32 rbgb;
 
-	int rbga_rate_for_441khz; /* RBGA */
-	int rbgb_rate_for_48khz;  /* RBGB */
+	int rbg_rate[ADG_HZ_SIZE]; /* RBGA / RBGB */
 };
 
 #define for_each_rsnd_clkin(pos, adg, i)	\
@@ -124,8 +127,8 @@ static void __rsnd_adg_get_timesel_ratio(struct rsnd_priv *priv,
 		adg->clkin_rate[CLKA],	/* 0000: CLKA */
 		adg->clkin_rate[CLKB],	/* 0001: CLKB */
 		adg->clkin_rate[CLKC],	/* 0010: CLKC */
-		adg->rbga_rate_for_441khz,	/* 0011: RBGA */
-		adg->rbgb_rate_for_48khz,	/* 0100: RBGB */
+		adg->rbg_rate[ADG_HZ_441],	/* 0011: RBGA */
+		adg->rbg_rate[ADG_HZ_48],	/* 0100: RBGB */
 	};
 
 	min = ~0;
@@ -316,10 +319,10 @@ int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate)
 	/*
 	 * find divided clock from BRGA/BRGB
 	 */
-	if (rate == adg->rbga_rate_for_441khz)
+	if (rate == adg->rbg_rate[ADG_HZ_441])
 		return 0x10;
 
-	if (rate == adg->rbgb_rate_for_48khz)
+	if (rate == adg->rbg_rate[ADG_HZ_48])
 		return 0x20;
 
 	return -EIO;
@@ -356,8 +359,8 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 
 	dev_dbg(dev, "CLKOUT is based on BRG%c (= %dHz)\n",
 		(ckr) ? 'B' : 'A',
-		(ckr) ?	adg->rbgb_rate_for_48khz :
-			adg->rbga_rate_for_441khz);
+		(ckr) ?	adg->rbg_rate[ADG_HZ_48] :
+			adg->rbg_rate[ADG_HZ_441]);
 
 	return 0;
 }
@@ -475,10 +478,9 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	struct property *prop;
 	u32 ckr, rbgx, rbga, rbgb;
 	u32 rate, div;
-#define REQ_SIZE 2
-	u32 req_rate[REQ_SIZE] = {};
+	u32 req_rate[ADG_HZ_SIZE] = {};
 	uint32_t count = 0;
-	unsigned long req_48kHz_rate, req_441kHz_rate;
+	unsigned long req_Hz[ADG_HZ_SIZE];
 	int clkout_size;
 	int i, req_size;
 	const char *parent_clk_name = NULL;
@@ -503,19 +505,19 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 		goto rsnd_adg_get_clkout_end;
 
 	req_size = prop->length / sizeof(u32);
-	if (req_size > REQ_SIZE) {
+	if (req_size > ADG_HZ_SIZE) {
 		dev_err(dev, "too many clock-frequency\n");
 		return -EINVAL;
 	}
 
 	of_property_read_u32_array(np, "clock-frequency", req_rate, req_size);
-	req_48kHz_rate = 0;
-	req_441kHz_rate = 0;
+	req_Hz[ADG_HZ_48]  = 0;
+	req_Hz[ADG_HZ_441] = 0;
 	for (i = 0; i < req_size; i++) {
 		if (0 == (req_rate[i] % 44100))
-			req_441kHz_rate = req_rate[i];
+			req_Hz[ADG_HZ_441] = req_rate[i];
 		if (0 == (req_rate[i] % 48000))
-			req_48kHz_rate = req_rate[i];
+			req_Hz[ADG_HZ_48] = req_rate[i];
 	}
 
 	/*
@@ -527,8 +529,6 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	 *	rsnd_adg_ssi_clk_try_start()
 	 *	rsnd_ssi_master_clk_start()
 	 */
-	adg->rbga_rate_for_441khz	= 0;
-	adg->rbgb_rate_for_48khz	= 0;
 	for_each_rsnd_clkin(clk, adg, i) {
 		rate = clk_get_rate(clk);
 
@@ -536,31 +536,31 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 			continue;
 
 		/* RBGA */
-		if (!adg->rbga_rate_for_441khz && (0 == rate % 44100)) {
+		if (!adg->rbg_rate[ADG_HZ_441] && (0 == rate % 44100)) {
 			div = 6;
-			if (req_441kHz_rate)
-				div = rate / req_441kHz_rate;
+			if (req_Hz[ADG_HZ_441])
+				div = rate / req_Hz[ADG_HZ_441];
 			rbgx = rsnd_adg_calculate_rbgx(div);
 			if (BRRx_MASK(rbgx) == rbgx) {
 				rbga = rbgx;
-				adg->rbga_rate_for_441khz = rate / div;
+				adg->rbg_rate[ADG_HZ_441] = rate / div;
 				ckr |= brg_table[i] << 20;
-				if (req_441kHz_rate)
+				if (req_Hz[ADG_HZ_441])
 					parent_clk_name = __clk_get_name(clk);
 			}
 		}
 
 		/* RBGB */
-		if (!adg->rbgb_rate_for_48khz && (0 == rate % 48000)) {
+		if (!adg->rbg_rate[ADG_HZ_48] && (0 == rate % 48000)) {
 			div = 6;
-			if (req_48kHz_rate)
-				div = rate / req_48kHz_rate;
+			if (req_Hz[ADG_HZ_48])
+				div = rate / req_Hz[ADG_HZ_48];
 			rbgx = rsnd_adg_calculate_rbgx(div);
 			if (BRRx_MASK(rbgx) == rbgx) {
 				rbgb = rbgx;
-				adg->rbgb_rate_for_48khz = rate / div;
+				adg->rbg_rate[ADG_HZ_48] = rate / div;
 				ckr |= brg_table[i] << 16;
-				if (req_48kHz_rate)
+				if (req_Hz[ADG_HZ_48])
 					parent_clk_name = __clk_get_name(clk);
 			}
 		}
@@ -654,8 +654,8 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 
 	dbg_msg(dev, m, "BRGCKR = 0x%08x, BRRA/BRRB = 0x%x/0x%x\n",
 		adg->ckr, adg->rbga, adg->rbgb);
-	dbg_msg(dev, m, "BRGA (for 44100 base) = %d\n", adg->rbga_rate_for_441khz);
-	dbg_msg(dev, m, "BRGB (for 48000 base) = %d\n", adg->rbgb_rate_for_48khz);
+	dbg_msg(dev, m, "BRGA (for 44100 base) = %d\n", adg->rbg_rate[ADG_HZ_441]);
+	dbg_msg(dev, m, "BRGB (for 48000 base) = %d\n", adg->rbg_rate[ADG_HZ_48]);
 
 	/*
 	 * Actual CLKOUT will be exchanged in rsnd_adg_ssi_clk_try_start()
-- 
2.25.1

