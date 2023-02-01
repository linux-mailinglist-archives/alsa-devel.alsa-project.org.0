Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 730BA685CF8
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:02:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E1E7826;
	Wed,  1 Feb 2023 03:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E1E7826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675216971;
	bh=NTJpSrWTMDoe6YpwlNI0LpR+uf0YLAbNI4nkTv/EvOM=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YjNc43MAXkbh6RBjxhxhyK4eJKNUnBEtIdEdsd0n6n0cErY4/TeAd6ph5p04gvdts
	 tq5XRTyGVvu0GrJGyo89VXCCJSiId+FL5KnpcIQ65Hf5J1DGXT+5+N4qUEHiL2J5jZ
	 l7yd8BBzWn279zN5F5ATVYw0HW1jF22SqF6fRkI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C1BFF8057E;
	Wed,  1 Feb 2023 03:00:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 672A2F8058C; Wed,  1 Feb 2023 03:00:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_PASS,T_SPF_HELO_TEMPERROR,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from outbound.mail.protection.outlook.com
 (mail-sgaapc01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 340A6F80570
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 340A6F80570
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=K3Sz47O8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JD0nQaiGZ9R2jWqKSDPgwN6Ic1JSlJlfQrZzDXXUyslnJ03D1LpT0gcXykGqI2LKy0AG/VZOhaoDm3cfntUkgLWeu60s62PtWUpidda9hxkqTroVwuNuEITgt+OWtwVW2KeEo868JMnfSadcHT1pfJ/bwn6FlC6yoy/FAgN6sNj6uXvBHlthqilFB11Zitt3NJKGYv/L9TK+lJHuipfNzCf2/5YhEfWjdd7/q4mANgzeOje1mndqSUyY4TvdGnUKb9PwCWlw9XyQslg3TSfkMkKZO5Ip8DGNHC9xV/+VDOkAJ6T6tMhNJShIJcncOTSX30W6uCJTq7ou3sIFb4bhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coBHrlAr0T6W8W4/8UZ91ajg0ummsYruUap48JIUyjE=;
 b=Wsf40XxM9aj2aXR3fFwmXHsilVC6Fo1HotEO8Y32/bUVspoUXf+HnWEPzWiq1LGhqWgsopbyam78bBO72WIC+cxyGh3Z2c9U6bjY+02XLCTiDhjCtFsswTrRh3SWsSzibgcG3kwbEWFH1nGW6SfFF6yXijve/Hdq7fUY+1omLBXRXB0iH0cRCvfcd7iHn5QVrB+mMS7YiX8j/F9GHeJ3dS6mBdn7juAo10IBJov2ZnMxPPRlXlkF0W8OyQ/dHPRsZPOFdHK7/wKCqYaTuHcrXLPI0sHwJAprw53oYTvc0x/VHEd6JV/dnJexDK+9gPMxRrGHBy8pmJRLbOB8MMz9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coBHrlAr0T6W8W4/8UZ91ajg0ummsYruUap48JIUyjE=;
 b=K3Sz47O81QJqtT3BTX30sFpAyBIknKxtZ0sxm2iQipCOuH4A0R5JMeavblIZfB4cJX85r9ioFjwF/Xw+sjst+zsGngLyvyz3LmIRXZ2uTfGHPK/NAJJH4oI1F1cgM0aPTy3a2d723Q+k3tdpIeWtF3Y//Ggtsd47tPhsv7O7Mmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5600.jpnprd01.prod.outlook.com (2603:1096:400:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 02:00:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:00:18 +0000
Message-ID: <87zg9y5emm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/15] ASoC: rsnd: remove unnecessary ADG flags
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:00:18 +0000
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: e59347ac-0c16-41ae-bac8-08db03f81179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tOfFPqY3qSabNYOZDMj4a9m6EoPVyG7TyTnqud5pWDa2Fy7J7K9w776AaY5efdlA72vub70R1n0hdu7W4ueQAzhTKriXQAzK1Vvq7YLVp08oTZC7rw4YYCakQEKcgw+pMkBrhiCzjNXhe5lOkfZKXYbUGzxOlOsUN0BOSSWOiS3dyyMnFrcPsbpaUW4GGO/Rb+yZL5aP+rP39jIvZfnhSOXsGmwyQgVWTg09ntP/1MQolxeVVesu4Zsk/8BlJH3ONg6ARflacOGVU8wuziDSh/E0jxoJyddh+BDEB+iS2dyXNv/9fLIHUO6ThmdMFSpe/1vhutXxOVpnqeRB2JKdnXG+cX09MWHWce/rHDz/gZvDvEjT/bcen5SLRSWOdyqg4TIFFIQyu9fkfcQdhma1Rs4oq0uyt1J61WNSTeh9TBQKi6+clMePm40pC2wx/vByzXuQAVOVhYRGcM6IXana7sXWb/C/qLUyFAzlcJjXDuX10GMZrK3hjMs5sf5rrgOv2Jj+BPT/5MdjUtOwUqSwD7KrKnKQ5zXx0DUzqUzshwrV5NVCL/cOaNEGTnPLRwWqOlc73OqEr6sp59/zo4v0+Nl5tj/GK6myVnvWo2Q3gC7EOW0g2yCINxmgtRFkw9BL9UzSc3w9xi2zdX0kAptVEyYlPtedtttsec7sobxP3GxPSytpLJbGfscR0BKUm5kwuB2B9+Cyf1qPl/CsyogxDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199018)(186003)(83380400001)(316002)(41300700001)(8936002)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(6506007)(6512007)(478600001)(26005)(2616005)(52116002)(6486002)(86362001)(2906002)(5660300002)(38350700002)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wT/sFQpa4n/a9Py+MopkbbKeg2klgk2e5Ltk2OF79T+cbt3fLBCS+qnJ11/A?=
 =?us-ascii?Q?11faOnMipZ8NwK0YmwUX86L9z4+gFOMCFa8bikoBHVmvB5ceoMCbz6RvKvjk?=
 =?us-ascii?Q?LJP5eB7UM8kf3C+XzkE/sMT7kGRaFYHi9MXCVMjYM/qeMY1inhtZEqxao67a?=
 =?us-ascii?Q?yJTt5pnfwVERutZ7SSPOBMhNUkEcIxlexJLghIp3SX0oRhm/iUEvaRDSe+Xg?=
 =?us-ascii?Q?Bz5zqo4bJN27xqswLQ66csADhCsEGeSkY7hYiPDItSBXoegw+iw+ju7Ty5bq?=
 =?us-ascii?Q?xwjd8LLaLtAaFsEUUjpd1MQFVsBFFZG0LsPDRi+VBdi2HmsciNJAFplGbBFk?=
 =?us-ascii?Q?qY9VO/ahVghRq98I9mNwxOBUDaQw5Id6xKxtDr0mBgV2SKaaIKOE8rth8ssK?=
 =?us-ascii?Q?nIDzW/w8qnt5FDS30viH1/zQoFfUYHiIvXFzrWwAJx1/AD8Gp3YD84Mwy5Fm?=
 =?us-ascii?Q?PwDuHCAQS81z1k2thSL/OX/YuLwkvmeTpd1WWttLtCu++PFBPU0LN7aK9/Zd?=
 =?us-ascii?Q?fzflsignoG1zD6Ae7knIPFiVknGQDdtoEi9OEkiV5KyySuK8wfoQaFO+6UmM?=
 =?us-ascii?Q?8A0nQC570k3CmOsv6qYvcjPxsZo6HEG6vSYj7lyNYw83GVdq/LWf3WnUCEvH?=
 =?us-ascii?Q?XHusFBJq2sHMtkrNLRuUPtaD8SOtcx10gpN7QP8mWFV8yI6y6U1/cRgFO11F?=
 =?us-ascii?Q?Lw22eTkApgMmZd/ECPhGEAne8NtMYuD1Ka47/8Wi4VqebVeroQWzAwDLEt5V?=
 =?us-ascii?Q?1hEhOvBYUjOR394gBHA65J9FgkpBOWJfxKz7Iy7v3axIAvhCUciRDYU1tKQ4?=
 =?us-ascii?Q?IB3VugD4D6eCMAc7vRLbacRmU+ka5JfBOrX73p0nSGkXFEzjv8tq3jJmH05G?=
 =?us-ascii?Q?SiAuTanjgFNaHkJLwkZrr9yAvBE40gPcioEbZlF4TY97wjkcDka9Vupsf9rs?=
 =?us-ascii?Q?WOWG49HKGFn67FOxKdW83Od+GApwkEvq02RSQqYAuR9tq3wMfi2Nm8ZaJQsA?=
 =?us-ascii?Q?ipOT47jjsX9X6mXDGcxZ2i3K/PPpawt6C3AzNliQu8333a4jxTHQZJYDiogx?=
 =?us-ascii?Q?2yghKRi725PdYsF6CjpAmWS9q/YC5/10VcNrknQ4XjuYm/h3gmDbeQ+BeiCw?=
 =?us-ascii?Q?flJxk7ZJCg9nYL75gjtkBY/wd82Q8WJS4S6Djhl9nDSTEIjv1mfL8is7dnGP?=
 =?us-ascii?Q?FKtLKitUlstwt5JSjl6KIcgh4eV5Z0vadw6JHXbN5URWYmjm3ea1zRhKSsmq?=
 =?us-ascii?Q?hDdC6SaeJNwywzw+DY349zw9oSEyftrzsiyve9M6Zw/Wh6PYLbiOCo66PU5C?=
 =?us-ascii?Q?DnAOmmW0oesYg5FGQHgVPLo9o1P9VDiJHFyGWrWq0wc3xzk4m8upnuLLrmXK?=
 =?us-ascii?Q?7+YtbyueQCUiLh3HJRj6702CdBUsf79R3qwuoL4dc/ACiBtoELY/WhL22Aeg?=
 =?us-ascii?Q?Vk4ig0ydacdcoiWXFjw1IuYUINOvJPTbI+ECppQRkjvzATz6lG20SFTkbfvw?=
 =?us-ascii?Q?wld0Ag5QOwMScQJdHujuCawbGH1z9Ldn2KJmaaRYp7oJXaF/rtt/b+2ZndEc?=
 =?us-ascii?Q?elbiD3BsqnbOSj3rp4iE2BPZfujgjx/sNZbgl5SlG73Yj9HSM+TuY26eF0+H?=
 =?us-ascii?Q?4kg+7lTeanq3lLP9vJ3qMyc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59347ac-0c16-41ae-bac8-08db03f81179
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:00:18.4113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgMnMwyjnqNqlh9kRARbom1+lZuuHnae/8h93kJ1iaY8FEnZlnrakXKQTf1yZWj05XAHuTpjtAAEHo1NC5KRT595tLuG9xNjmEttH7wj29gEX320XvddDNfXAau38Ka6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5600
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

The flag LRCLK_ASYNC / AUDIO_OUT_48 had been added to handling
special case of Salvator-X board, but it is not used on upstream.
It makes code complex today, let's remove these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 2c7958620524..776dfff8016b 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -32,7 +32,6 @@ struct rsnd_adg {
 	struct clk_onecell_data onecell;
 	struct rsnd_mod mod;
 	int clk_rate[CLKMAX];
-	u32 flags;
 	u32 ckr;
 	u32 rbga;
 	u32 rbgb;
@@ -41,9 +40,6 @@ struct rsnd_adg {
 	int rbgb_rate_for_48khz;  /* RBGB */
 };
 
-#define LRCLK_ASYNC	(1 << 0)
-#define AUDIO_OUT_48	(1 << 1)
-
 #define for_each_rsnd_clk(pos, adg, i)		\
 	for (i = 0;				\
 	     (i < CLKMAX) &&			\
@@ -341,13 +337,8 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 
 	rsnd_adg_set_ssi_clk(ssi_mod, data);
 
-	if (rsnd_flags_has(adg, LRCLK_ASYNC)) {
-		if (rsnd_flags_has(adg, AUDIO_OUT_48))
-			ckr = 0x80000000;
-	} else {
-		if (0 == (rate % 8000))
-			ckr = 0x80000000;
-	}
+	if (0 == (rate % 8000))
+		ckr = 0x80000000; /* BRGB output = 48kHz */
 
 	rsnd_mod_bset(adg_mod, BRGCKR, 0x80770000, adg->ckr | ckr);
 	rsnd_mod_write(adg_mod, BRRA,  adg->rbga);
@@ -514,12 +505,6 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 			req_48kHz_rate = req_rate[i];
 	}
 
-	if (req_rate[0] % 48000 == 0)
-		rsnd_flags_set(adg, AUDIO_OUT_48);
-
-	if (of_get_property(np, "clkout-lr-asynchronous", NULL))
-		rsnd_flags_set(adg, LRCLK_ASYNC);
-
 	/*
 	 * This driver is assuming that AUDIO_CLKA/AUDIO_CLKB/AUDIO_CLKC
 	 * have 44.1kHz or 48kHz base clocks for now.
@@ -547,8 +532,7 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 				rbga = rbgx;
 				adg->rbga_rate_for_441khz = rate / div;
 				ckr |= brg_table[i] << 20;
-				if (req_441kHz_rate &&
-				    !rsnd_flags_has(adg, AUDIO_OUT_48))
+				if (req_441kHz_rate)
 					parent_clk_name = __clk_get_name(clk);
 			}
 		}
@@ -563,8 +547,7 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 				rbgb = rbgx;
 				adg->rbgb_rate_for_48khz = rate / div;
 				ckr |= brg_table[i] << 16;
-				if (req_48kHz_rate &&
-				    rsnd_flags_has(adg, AUDIO_OUT_48))
+				if (req_48kHz_rate)
 					parent_clk_name = __clk_get_name(clk);
 			}
 		}
-- 
2.25.1

