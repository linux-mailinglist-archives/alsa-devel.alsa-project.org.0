Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B938F685CF4
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:02:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F6D21ED;
	Wed,  1 Feb 2023 03:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F6D21ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675216921;
	bh=XMjYOUM7lUqz+7TUOX8F3LAffkORiKtfkeVl+wyC898=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ISH9VIBj5IFYtCJyCxrqoe29nyK77eMeta0/EbZyR3R3/36GmoBx5GEBREjOcUKG8
	 UoyjciGBtGiQQkQyHn45W5Q2DslgwWFtf1ceomW71GXWgfZ066eHdHYPV6i2i0UlJM
	 rFShBF18qQhq/g/Ma2aBzy5508XMPVNIa/kQvt5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B15F80567;
	Wed,  1 Feb 2023 03:00:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A14FF80567; Wed,  1 Feb 2023 03:00:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::703])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9445FF80552
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9445FF80552
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KJVaUtUY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOR+VwI7WfDPbjlhvIK/4cBaO3sbM8PyQBT0OCRE2vqHTVYvJpF1grxtEQ/0AhO077otJ+Wr0sSohu+mf4rG/s5e9ZZgq6yBV4zG/zr6OlASblSypBREzCpR03tgqE6uGCuSZPXYZ7YS1SCz1akw29DmRJ1HEokTKXyOGsPN9nNGKiIhtu9EQFqhjIQWM4znyfKSZtzbc15AHNIaTC/lyr/+hYKYpk5SUOWGh3zUE7WnV4w/vnYgDwvb3PAABwhI/RRqLlJMQoX4f3k+GEJnAR4JeU5uFTktBLN78iRWavSxC7WQzhfDTwEy7FBd66+K2vc94dSXwaEau6peaGaYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eX0BcLYnTIDVQBDU3CTAwjiOFtV0ZcnRE+rnAnq4VnY=;
 b=NlMjTwOqVm1c3LMJKsJBiSYKJzkO2NRZvNbAMBTkbEgJeYndVzM1+a3TLcPVIxeoCSP2N3FDkr8tI/jFzEdaO3nnMtVCcicFLGa1Svp17066BE7rh42WupXEpOY+XaQuVZHqRc6azzk3/XpqIFVrrdC6c7haV1edapRI5mDesqK6TZoV55dXbj7DVOuQubHpLvHnz7Q7DUfKCtAf0BH7SMLkz0LX7rnnzE46CZux+duAA13wjlK0nPJ6wDiIoydHOzQSq75FkTBgrKUFaX2nkpy99hwLels/1TEKWBtZmjvEt/8DHKwGq3KPKO+hvAM4wP2uZ8JJvFpMMEtZLYpj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eX0BcLYnTIDVQBDU3CTAwjiOFtV0ZcnRE+rnAnq4VnY=;
 b=KJVaUtUYUgbLwSlpHJtvo2IOU22S7vPT92U8ANJ77BP7GkcuTeOuuIy+C8A8IdrOtuUESbKAtXXFgSzJDWIy0iMna2+/kWT9WheDzlrCbXr+VGvWHjCQwu5BDWbIyzPucxkveMDXWnoTYyGi1pDkaOYmvtlxMRaffNsrPZMPhNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10342.jpnprd01.prod.outlook.com (2603:1096:604:1fa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 02:00:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:00:04 +0000
Message-ID: <874js66t7g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/15] ASoC: rsnd: indicate necessary error when clock start
 failed
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:00:03 +0000
X-ClientProxiedBy: TYCP286CA0217.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ccffa75-b039-4c5f-32d8-08db03f808d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I1uyEtMMYktlHj2wFZp++Sbrqn3y9dqC+d5IRVGDbAg+hf/0nDcqA85IS0EWGtEwLMALNP3S+uVhttTLfIZj+RESYKN2QUTdMLMJVQKVzY7e1F7HfIZhjm6Ei08pTJKQ4fQJv7A2xl80ujTIovnjIRbSLUCIuI4KoRipl0sIx3sEijuvexwqF5xkGIA3Bzaa4BjPAKe/sIJOdXPvniRjjy3dFgXnReKfuT9FX+gPL2LWdZNE86XmHYTlBjtPiLGfmhn++jjy/sf1L7yBkzvLamPTGOHiiv85JoDjyQvE9Me6ElTGIQjI9skNvjwTxTtlbMH7YPsX0gUTabRIwfBBJyt9Zd3j4cLrPaRjyyr9Ds0q9H/y5W/uUqfVnBbcgTCbCZLZ/gHJi/w1W9XlbXxv1r4PKxFPGeM97GlnngUg0N7vuG2YaoNHdxpUq4zs9fte2nYPH87K5cv2F2u5pVfT8J3hOypJM9GDeKN/cdoklhagl33+SWmNfbDpERj7I8qLywKVXsmWv1qwHhUcu6I1uCm4ejICoGsBnBQ1iw77jGzG81nGTBOklGy+Z8gmdOKOxUStoYQZ1VitfweeLmyPM1UNAW4h9rUtDmfAwEduQ1BUzPDOH/ioN6ZGaASLxkmp2hC6bTqj/DVTbou58ZeQhyUDiBxt665Yz+9Q7Fbt+efS7d8N3Ji2CSo8RRtfNUwG0y6BdsRh7spOAJFEYG0oGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(86362001)(36756003)(38350700002)(38100700002)(83380400001)(6506007)(6512007)(186003)(26005)(2616005)(2906002)(316002)(66476007)(52116002)(8676002)(6486002)(478600001)(66556008)(6916009)(66946007)(4326008)(5660300002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hvd/Vunb4CtIFEKQYafIOZlNW8zEBC/9tRrkq7KssIaPGGC/6vU7yF3DAbJ2?=
 =?us-ascii?Q?vz5mAMaknGy6rP3PhXLRVLjaqBioAYLO2tbE8G/jm085KaFWh8LiVuNXuQia?=
 =?us-ascii?Q?VM4FWLxp4yha7WTgwT5Tf0Cj7PqmgV7x5NEJbO2Q+tdiX+YQmKfWntn+fZq7?=
 =?us-ascii?Q?kWcTz7FM96pJJQRIDfQNGrObsruNShKKrqXTaLJzGk7k07tmZj7DLMjF9cFn?=
 =?us-ascii?Q?K/RZbRrvbNJmFLQoECUAXZQ4J5Y/iH9cy9491+ii55j91Y0nXsdRwGj4tflK?=
 =?us-ascii?Q?wnKh4B+OVLcoL88QAJdWidcnIxwimORMSKVNiizWiWeF84h4otoiPr0YXnB1?=
 =?us-ascii?Q?Ta9QWkG6nRVb78qsszMemZ4/zNLW1bjUoKhj8eFYCAERPsWtJy3chCwukMYR?=
 =?us-ascii?Q?EBnbCV4Cy1tTFIVnhj/2jX2bgcn2FNMa5d3oX3TiBczcwj6Q/BQXEAePiahH?=
 =?us-ascii?Q?jHmjZrqvLvCw8hHy85GmYMmdKOrZJMosjbbQVLAB9+86DMQCu+8Pf1tJ7NFR?=
 =?us-ascii?Q?OLGlwNovZON/FnxUMUjeP5+Fa8Hv9SihVQGJhBcb38lqbFi0aQNMyoJMaEUI?=
 =?us-ascii?Q?duKlnGC3zeLY+YrcsFnm0h/ygXMSmz+h9Xou+MubibRDHj0nA6ljTKZADGWw?=
 =?us-ascii?Q?7p/AKTUGsp9IMdcXRgAC4KhQrqIwEaxQ7UuoYlIXnXkpejAouUOiUhViww/d?=
 =?us-ascii?Q?Ggx44+g2R8235VhcM99ADtCsr6/hpH+A1//0S2i7TlHlaq4VoyVZe3bZebAk?=
 =?us-ascii?Q?Iz0IbnHPHimK2FMIWRp+ro4KMmWRVBL/oGqvwYV1A4djRYxxem9BCK2An0lK?=
 =?us-ascii?Q?aBdq0WSQhkarGWqaG9wWHS88IbKMJVD1H6aE7AxRsPoRZ41UHtdRetelWfAO?=
 =?us-ascii?Q?VCLRcG3vYQEsWo8zfWO2ZkrmaJ5wI6Q2h3CMNP5jrt9qIbALkHETOVUqKai2?=
 =?us-ascii?Q?Fz4V4BV3BIDrYXBAntuSbu2hIp/1P7o+8pCAM1uaO2JkZRNCQUdCHMjG3qpV?=
 =?us-ascii?Q?xq40JMjtKbGMnnPA9hPwG91bJeOxK1mS7EkhlgNmnbaQPul6mEj0udBCT8VT?=
 =?us-ascii?Q?Xe0ZIACzq/5I2YoKCbH5CZOF30g8MdFbURxX6xPigk8DZCouJ9E/zoL4Ox1s?=
 =?us-ascii?Q?clv0s0yrD95C+H1VOsXmVF70fzSEqKxUc6cG5RvZ+n5oQbekb2q9mxGiTGcW?=
 =?us-ascii?Q?shB6aK3Oc8uqQposdQysjYPsXnZGJW9vbHUAnmD+/hcykvX0eA9rPyggi1ug?=
 =?us-ascii?Q?8xg6CZUiQVc9pBLy8johFWcKwKC8bNNYNbSQGAowA61cKoH+91Md9eTl4c6d?=
 =?us-ascii?Q?twfhbiqgK4ET6Fmi0gJXhky8SzeZqbpslfv/sSqpQf06nExuhemM2Fe2kQLx?=
 =?us-ascii?Q?Cs1i3m6/F3wXy9ChNlmFrlx3z7k93S6OYhsINGRHd4UD/FlcrISixWDsiexg?=
 =?us-ascii?Q?ANQ1UJegggMr9hVMYBNtGgYexTGMJq2iHOZla1tGDUds1vQO7Y3/n5IWCpEO?=
 =?us-ascii?Q?Bbg6VMvhW1jTbLnH4OWL7Vi8UyiiK/z/Anwk+Id6zjeNIdiKJ701MGJaB86K?=
 =?us-ascii?Q?VwG2/UYEWYPQf1h4qmKE4O5i2DPLlIDoog3+GRry9LLAogBVxI5uyAhICotQ?=
 =?us-ascii?Q?C4qlyga/Q3aY2zL/uonhBYs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccffa75-b039-4c5f-32d8-08db03f808d1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:00:03.9960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L444AxUC4rY/zqEbX3ihpIkQQfyXgM5OAN5RGn6kbeN2RrnlULTxw9Jg0qWi63Qn63Nu9+cHgpKsAHkwwIiTVd8RXoHNg1ihEDGweH4MesIBh7CnpLaTJ+b3KO8H7ULM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10342
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

rsnd_ssi_master_clk_start() indicates error message if it couldn't
handle requested clock/rate, but it is not caring all cases.
This patch cares it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/ssi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 7ade6c5ed96f..8ddee5b03ece 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -303,15 +303,14 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
 		return 0;
 	}
 
+	ret = -EIO;
 	main_rate = rsnd_ssi_clk_query(rdai, rate, chan, &idx);
-	if (!main_rate) {
-		dev_err(dev, "unsupported clock rate\n");
-		return -EIO;
-	}
+	if (!main_rate)
+		goto rate_err;
 
 	ret = rsnd_adg_ssi_clk_try_start(mod, main_rate);
 	if (ret < 0)
-		return ret;
+		goto rate_err;
 
 	/*
 	 * SSI clock will be output contiguously
@@ -333,6 +332,10 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
 		rsnd_mod_name(mod), chan, rate);
 
 	return 0;
+
+rate_err:
+	dev_err(dev, "unsupported clock rate\n");
+	return ret;
 }
 
 static void rsnd_ssi_master_clk_stop(struct rsnd_mod *mod,
-- 
2.25.1

