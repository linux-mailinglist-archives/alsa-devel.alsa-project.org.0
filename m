Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A737D685CFE
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:03:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DD0E86E;
	Wed,  1 Feb 2023 03:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DD0E86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675217020;
	bh=XauARPb4yfsArZgBCAe1snDIeUZhOWAPvHqQAmGVjfw=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=h6ae42V4ysanKZdcxhdpOGRQUxX8LzaM9zOfucBrRTwo09kP6vFRj2JricQeI6ELw
	 LulB8nICjA6Ak6jXNan7HXtOSKdLJ4iDWygvBD6sOuFpy3XlrfkD9pCslVVpLdbksG
	 DmYn8lWV3dko9EWt3ayrbu7TnP2p8trG19EgduyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 834BAF805AF;
	Wed,  1 Feb 2023 03:00:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B469F805B0; Wed,  1 Feb 2023 03:00:48 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FAD2F804DF
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FAD2F804DF
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SXGWDcZq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLfckeL8fkMBpEdfFMYe/JiwTmF4NjMI1STCC/yB5LAT1hlbVd2vQtVU+xTRlx7IKeePKrxhS2xNOfOjF9B3Eq1oTF6Gsfeor0cv1j6ImAa1OMj5BGDPQhb9KqAi30lGBWe6gkmF8tnnNPwDWnCqmVPGdQMNwxVDaURloNKODaBDlAOu35BVIp4NuTXuUWxzWS1kwAFPRWNBNYtCF0uU5mTShhUa2AowXIaAcX7dqqg/Ao2gR3Xda+8MiGxVyW53BMnpNj64P6cEJ58mWb5SjiKzWRTekB2BPQV7fH8GPCI0AsqpXnGLt7wxi8qqOSjf8Yqm+W/uu2Y2lCA0vjs/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EU3yJLywdFdPej+//P9ZbZ24ivzbiUMcfAFbSI5jQ+c=;
 b=fsLoBe6ukm/SRanCRck0cu5eZtYKvEJHUI3Qf+pQ+ZbH2HijXYT4efk/GHZ4Pi4e0gt6LIFYe6/+eKNUdG1RE09KEyI/mD/c1B9mAYIyHcAyQNiRUKc1XV8Q3DektmWtJxmiCb3c3IOf7HKhk+ihRn/PDcu2qdhm0FeWvk7YKpWUcDM1ND7Zv8vOSu4bqfdECPBaptSrNnP0p/niSuYkYak7Tc9HeIhk4P5DHYipJ7BnxmiROKkeK+w94tlIlQUK5ImgP5hq8ubfWczU8TKQPJL3CCBATaFAn5XkIY82jYCHY3w3VUUvj0FcWYqAWda/ZQCjIm+1iFyROKGw0ozXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU3yJLywdFdPej+//P9ZbZ24ivzbiUMcfAFbSI5jQ+c=;
 b=SXGWDcZqcH7+L7rIbcbhGjMLbtO9ahgc1tNERN12PiTS4sDTymaEguOpY37h1VLtDcX+3/M5XQhruzmfblgQpS9o7lyuq3f/qg8PDQTT/A735SJ/VVz1GaVc7K7T1KueO2b5x0ThWm+p1zckkGSUS3QqxqJ5Z7VHA+I7lAZDZJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5444.jpnprd01.prod.outlook.com (2603:1096:604:ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 02:00:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:00:32 +0000
Message-ID: <87v8km5em7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/15] ASoC: rsnd: use clkin/out_size
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:00:32 +0000
X-ClientProxiedBy: TYCPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:405:2::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: 682bc1ca-2618-470c-40d6-08db03f819e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 176m6unVEmoJj7aEUwFLf0sbuGYuXb+bcGmugWMgAHW6IWt+MByYIFbcPSW5FE2e+Xwvxe433l3kyaR3GSF+dVFUBclUsjyOm7V97I0ay8iRjOVC8F5IRJ09tMRwW5K50FRCT48BRQUXZNjuKhnhytYTuwkqJ833ET43/zuU/ejlFf0xdu2QI5JbFlcb4I8f7djfxd8+5/JJoSfRMWnm22pTLFRHlIO0vREFa8TiJuHpz33u+ltdcsHbEc8IhOj8FBZp3GP9rJ1zWgPBPwaMkQmrz9mDrCySj+kT0VGfH2PPD8KY+RwFmWS4ncZnNCB/MNr3dxvcfzzaWo5VpPWO4RMK8LtpTHAqtUccfTEKaaXCXP4HHE1VJM7aWulSPm/rYtxthpYM8XGWmut6UuUTXraqOlZVQbfTxrVJgPzGqkeXNS3C6FCiF5KtogVVb06GOkqygI2yRqXYBIQYt8nubyhKCv14UXQCUk1Wuui+Rk7wmYYSCvlobyFLK8GlA2yj1iwzaDqbvp2gjISOoWlRVX8yGe0ceLqMVQYadtSAhj07VoH+B1WoXicO9A9OAvqkrzmFbwME/196WpmGfgwVrIdOor6yjSIAbpnCP0rFmcZntrs3GvFgFI05653XVHJ6OQIU4yhzTKnA9B1NWs38h/k488NwX1PtQqGX9Kf11ho1UTOdF9pgOPqOZNrAZHGWOsVE9JVrdJU+geJ2DumU4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(2616005)(36756003)(6506007)(186003)(26005)(6486002)(478600001)(2906002)(86362001)(52116002)(6512007)(38100700002)(5660300002)(316002)(38350700002)(4326008)(6916009)(66556008)(66476007)(66946007)(83380400001)(8936002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f7O2Vp1w83rEFgKm9tn1/Oe3KBWZXBJszfMxyo8zIUO0s6xa3tzy8JvVZmdU?=
 =?us-ascii?Q?d6KIyoRyG8y+p7DTFOjQEorE/kCvaT8YcdMCzr5fs3vaD2wT4bFzViWtHRFv?=
 =?us-ascii?Q?U0F61y46aCwZGZ0klsCZHSkKUUNn/e+qHwi+nYqqVE5barz6px45zi0L52Fx?=
 =?us-ascii?Q?UavK5rBLO/wRP1OVSegpgqRQg1+AgtAk6C9IRPMMdyUTuVPZxBze2vD9z5jb?=
 =?us-ascii?Q?iwdXc6KJIah/QcUPsYv+3uSG1AZ5tcl/0u5H2h42173bBWjn3qSPuGsEL04s?=
 =?us-ascii?Q?794ozU2ddcIGApm9JLW6WD2IfxoWD84GT71/qxLRYcKB1Wjc9/+iie3elE2e?=
 =?us-ascii?Q?5QsjL+fvm4RIWlZVhjF+Xw7DP4s4w8eXMWGTpg5beXjST+mFzkPjM2SWJv0m?=
 =?us-ascii?Q?q8BfSnIvT2zMchEs7Hbt3qdOM5CA3YodNtvs6eE+SLLFto+C5ybjMQWqJnXq?=
 =?us-ascii?Q?ImuhinbGFOFD4cxJwvKja/+wmUEXvHPVJEnnMI6u3z1jbV1tTp68pibMREgs?=
 =?us-ascii?Q?yxqUm+qsNi92kIOmTM35HnTNw9YsMmtihqU+uOCahwPAhUedMyTRMt5CTS7m?=
 =?us-ascii?Q?7jmwVqdNNfkmHI36wJR8R17SuP5DsYeVvvzb+N/imU3Yps0QOQyb+FpJ2fLh?=
 =?us-ascii?Q?80dkupXIE6suVSZaG4fGw2em932WHbldUk+r8cAj1SxvXcWPjq3zz/BZuPLx?=
 =?us-ascii?Q?AJr0zIrJ1VvlJhQU7uM3UwIBVHXh9PYcft7fNgwnu+HHSdrZ+ZCt+HWzTskk?=
 =?us-ascii?Q?h0aVGTzG1uvgx6e6NTr+3G+sxPQJyZqPpKyc9uAiEVzn8q/G9wG/GzQlbOdR?=
 =?us-ascii?Q?TBgrzAdkvj8SUyuId9eofMxJnOhkCyU7MHGHdmKLM2TQsGHd519gWswMxGo3?=
 =?us-ascii?Q?v8rsGqTSmLXjgH72sy4K005aZ36tevcDWOCmNXegfATrv0ZchMYoxn/g+4NM?=
 =?us-ascii?Q?fGBXR0Ta3/XM/SSJeIpUyQwzObVTVsAKyZKZa3gvrEu97G+df/vC9+RGMIGG?=
 =?us-ascii?Q?YD6AxFwVqlHyzRoHmCREdb1ZMY55Jh3vJUVk2WH2LQsnxHbQec89JV4Km7oN?=
 =?us-ascii?Q?ysqtwobggGCsDwN8XOOeZ7uMtPa6XA3ri9PhtkzoXuKswhXTwiK4CZUA+sHO?=
 =?us-ascii?Q?m7lg8UQTSZEWwc/b6sy8xJVfjNeh0Q6bnxFvtOg/9soGgU7pnUf2253630ys?=
 =?us-ascii?Q?DJe3Q5Ek9CTZ37zfZpvBjA5eLZgL3743g+BLg/GKCPxKCL2UIjEv8NaKdpUl?=
 =?us-ascii?Q?Oe443x1knXHGrMG1igMHpKzmXwCNbEThpLT1B7mj+LzWqsCKrXN5J69ms3Lm?=
 =?us-ascii?Q?5fWbSdVr4ULvNn8J4HE0keLv2tJAEvJKxoanD4p/M9/jf+AAWYha+iWLaCng?=
 =?us-ascii?Q?9Dc3JPFHT/WZEMxLajhNi2uiI7/ek7O83L3lQsbLMrfLFHSfxtGLanoIkPC7?=
 =?us-ascii?Q?O3zEkVTCKRtA0DzJArsbPkMWUV38+9pLpTOgfgpT9R4idI74TJKovQCbE2Is?=
 =?us-ascii?Q?a0rMk/fsvK1Ms25jPiYqwJNgOBln21pxCrH7Q9aZyc51s3yd3EgYAQKl7AeI?=
 =?us-ascii?Q?DPT78HLiZcnSlFdw2eNJHhiP9QESAWBRIyhsP+7BsbwW7QOVuZF0Ml4fqN+c?=
 =?us-ascii?Q?whOUNBa4xgktXYVWAmQzilU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682bc1ca-2618-470c-40d6-08db03f819e6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:00:32.5287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPtPp5CMM3PYYF4CJLvduwP7V2QC1WAHOn4azikXkMVc11zDjvVNkSzadMMIMnfd6lJ8i1Q6X9SJ+tjnyeM8ASzDOJMvSAQzwzie1qF5sckGIi/e25j+Nt7xN4JJ5PZt
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

Current adg.c is assuming number of clkin/clkout are fixed, but it is
not correct on Gen4. This patch uses clkin/out_size to handling it.

This is prepare for R-Car Gen4 support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index f937cd4fe09e..ff8e8318edb0 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -32,6 +32,8 @@ struct rsnd_adg {
 	struct clk_onecell_data onecell;
 	struct rsnd_mod mod;
 	int clkin_rate[CLKINMAX];
+	int clkin_size;
+	int clkout_size;
 	u32 ckr;
 	u32 rbga;
 	u32 rbgb;
@@ -42,24 +44,24 @@ struct rsnd_adg {
 
 #define for_each_rsnd_clkin(pos, adg, i)	\
 	for (i = 0;				\
-	     (i < CLKINMAX) &&			\
+	     (i < adg->clkin_size) &&		\
 	     ((pos) = adg->clkin[i]);		\
 	     i++)
 #define for_each_rsnd_clkout(pos, adg, i)	\
 	for (i = 0;				\
-	     (i < CLKOUTMAX) &&			\
+	     (i < adg->clkout_size) &&		\
 	     ((pos) = adg->clkout[i]);	\
 	     i++)
 #define rsnd_priv_to_adg(priv) ((struct rsnd_adg *)(priv)->adg)
 
-static const char * const clkin_name[] = {
+static const char * const clkin_name_gen2[] = {
 	[CLKA]	= "clk_a",
 	[CLKB]	= "clk_b",
 	[CLKC]	= "clk_c",
 	[CLKI]	= "clk_i",
 };
 
-static const char * const clkout_name[] = {
+static const char * const clkout_name_gen2[] = {
 	[CLKOUT]  = "audio_clkout",
 	[CLKOUT1] = "audio_clkout1",
 	[CLKOUT2] = "audio_clkout2",
@@ -424,9 +426,14 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
 	struct rsnd_adg *adg = priv->adg;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct clk *clk;
+	const char * const *clkin_name;
+	int clkin_size;
 	int i;
 
-	for (i = 0; i < CLKINMAX; i++) {
+	clkin_name = clkin_name_gen2;
+	clkin_size = ARRAY_SIZE(clkin_name_gen2);
+
+	for (i = 0; i < clkin_size; i++) {
 		clk = devm_clk_get(dev, clkin_name[i]);
 
 		if (IS_ERR_OR_NULL(clk))
@@ -437,6 +444,8 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
 		adg->clkin[i] = clk;
 	}
 
+	adg->clkin_size = clkin_size;
+
 	return 0;
 
 err:
@@ -470,8 +479,10 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	u32 req_rate[REQ_SIZE] = {};
 	uint32_t count = 0;
 	unsigned long req_48kHz_rate, req_441kHz_rate;
+	int clkout_size;
 	int i, req_size;
 	const char *parent_clk_name = NULL;
+	const char * const *clkout_name;
 	int brg_table[] = {
 		[CLKA] = 0x0,
 		[CLKB] = 0x1,
@@ -555,6 +566,9 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 		}
 	}
 
+	clkout_name = clkout_name_gen2;
+	clkout_size = ARRAY_SIZE(clkout_name_gen2);
+
 	/*
 	 * ADG supports BRRA/BRRB output only.
 	 * this means all clkout0/1/2/3 will be * same rate
@@ -571,13 +585,14 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 			goto err;
 
 		adg->clkout[CLKOUT] = clk;
+		adg->clkout_size = 1;
 		of_clk_add_provider(np, of_clk_src_simple_get, clk);
 	}
 	/*
 	 * for clkout0/1/2/3
 	 */
 	else {
-		for (i = 0; i < CLKOUTMAX; i++) {
+		for (i = 0; i < clkout_size; i++) {
 			clk = clk_register_fixed_rate(dev, clkout_name[i],
 						      parent_clk_name, 0,
 						      req_rate[0]);
@@ -587,7 +602,8 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 			adg->clkout[i] = clk;
 		}
 		adg->onecell.clks	= adg->clkout;
-		adg->onecell.clk_num	= CLKOUTMAX;
+		adg->onecell.clk_num	= clkout_size;
+		adg->clkout_size	= clkout_size;
 		of_clk_add_provider(np, of_clk_src_onecell_get,
 				    &adg->onecell);
 	}
-- 
2.25.1

