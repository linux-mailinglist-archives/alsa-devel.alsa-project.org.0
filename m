Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9001C82921F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 02:30:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A810EF2;
	Wed, 10 Jan 2024 02:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A810EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704850204;
	bh=d9f6/M9XCQGgdZ9totNJ+PpaYmNM1/sYXDeWk1dhZSE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JsRFyn25KpVoBGAQqDrnYpSNhWFYLu6kDmQqXggra6vipyxwrWZK4wbForjlFR1CX
	 Jkl/9yEb1aEmgD9iuiwzjnA5mCJEz8mVpJHKIm6nd/3lnKRztJGy37h4BYoXIWbDq7
	 heDB5NQX61t3wkJPuUZkWkYda5NyCgcTV90IIcN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55F3BF80636; Wed, 10 Jan 2024 02:28:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BFB6F80635;
	Wed, 10 Jan 2024 02:28:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49914F8057A; Wed, 10 Jan 2024 02:28:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EC50F8057A
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 02:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EC50F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iiw4ym2X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0eVm6YiWGA07BlY2YHgMLNEyDCjdHVAoYR0hUvBRuv367nD0DrB8Zqbx7vW0XJeDmxdLPoZgYp9kCHojztrlcAtpGSygfAU1PFcqPEEF92nocuyL7e/8XHimRfgciyxe+XH7d5R8PEL97GsLlgGgnzcYyg4pfDcmjW6iuCKmvDl+7E7PKs+dft5xZ1qS6ZbL+IXmi5YaN/1wQplqWrN72YpXHtB31bEcj6ElxwMToMvgV22cbT10GAKzxuhDW7WD82FfmG7FuTm66cYtyF4xT10UuxoELRe8tPYGn3O6mb3H2ULZ/UXyadd3/udLR9zr5RRFyBXXATeoUT8ldVVxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAIa4Kd0pz7d+chRoOgVwcxyuSeo9hdyZ5YDsV4aWb4=;
 b=ImHyvtvCk9G484e91utEyduMmGUlsm8x1LmNdVoTPH8J0/zf795KTVJLa64qS7bA1kUCoqXnC8DrYc3eOBzfsR60rklQdApy+o+FBKhxUlSbC1Ah/CeCPV2ikT8C8NpL8KABsiJafYWIKzyaB2DUz9zdMRapy1M5PtRDEkTmupC7zte9q071kJE7q9/nkCglaTEhcfOkxTOq8Vemy6tOv/wpE0mzPI3ipL46+Vu+YyEU68xFlmnzqiXaJCRjnqDrFMrGCy1ctC/dJCzsdgiO7SMEaGrVNy8V8g4id/qo+enceaBeirow6qtTEi1bjW3sO2nHxN/OkkCNaI4fj9W73A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAIa4Kd0pz7d+chRoOgVwcxyuSeo9hdyZ5YDsV4aWb4=;
 b=iiw4ym2X2EFWPVdNnG6FtNk1K5nmGFW+TRexdqfoqVBQfuZBMyucGRrkAhmyy8CFA+cf26UgXrqIPJ+oGLdMWbI4rUe5Vz0GiC99s5uCA9PXqp5GdloWGbivoSAbRCfFJ1JbYRtocvY96QhkNVI4OTmr3yPHnepNB4Q0+tlFVl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:28:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:28:22 +0000
Message-ID: <87zfxef03t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 5/6] ASoC: ux500: use devm_snd_soc_register_card()
In-Reply-To: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
References: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jan 2024 01:28:22 +0000
X-ClientProxiedBy: TYCP286CA0327.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 257ea162-928f-4c6d-5651-08dc117b6f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j7z2Mhx6U94x7pWrEsNmj3VTZVDKZkd/jhlxF4CIzqqY/SMG/eB61Y+ryiPNuyDCceb0u3VW8Aq8INI1lOLBf12Hdiiod6p9OUCJKBO47sgU4sLqHSZ+V/Ux7ZJSVjOmh0nkpbZR3fp0u4QmY//D4xHkgYU8gvLm6elaJOtREJtXMc8zfBl/U65lgWAkUjAyKhGfCWau4CQpxkpFKbJMZChdNFmi32IVv8QQ7Yl5v6r1LLsD7J4uOiTQKjBWsPLqWYRuHR5FBUfr1ZXO9vFd+LrCbRXXbp2bnWDSS11Od9lrTUVKXME7UEQBR4O65hP6F9gCVRP6z7BvXmBKm71211pfm1RobF0ks/aAZyHSuH75kVB0zfXckS+e0NXalBgzrmhb5oyhPdd03N31KX59eNvx4QvfNKxDHjlwSJm73DTg/2D5ufUIIZRYbj7rxOKG9aSCZWPIuwoiB6XQTD1HtWihtv/XEITL6FmJRbt8XOgFlY6uFmpHmbmc6F80HgnQUiMCWE4nVjLRTalTF+2PMoqTdbsv7UeJ83Jz6/Dlb+WLqjTm3gJBucPcySM6hV6nUKanavXyVBzXR3YWxNMU68E8+VYK9g3KUqoThLPjCOVMlV46or2gFGl6MNANRLdl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(38350700005)(36756003)(86362001)(83380400001)(2616005)(26005)(66946007)(110136005)(6506007)(6512007)(478600001)(52116002)(316002)(8936002)(8676002)(6486002)(66556008)(66476007)(2906002)(4744005)(41300700001)(4326008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g1zniObzHm3jvFy1i9MvMxiaETO58X8TY4K+mGs1B17rQzGTFkH6STVmbB3f?=
 =?us-ascii?Q?jWe71oU2y13MtgYUosJYYKFqjsd2wTg90GLRFnh+T/7/UDXmpteXNHBJ508B?=
 =?us-ascii?Q?QxuQMJl/rCTi7eAaWg/Ri3Zh7rpD9/TrWSim8BB1epsZh7raqzKBnhvWq/dC?=
 =?us-ascii?Q?b2zdSXpu8m4rPo/aH17HCcA59zBjG6MmCJvfaOOk5xhac07Q4kRNpNYNFfRV?=
 =?us-ascii?Q?lBB9fBlOZZdazGVnNiZm+bsvIWntrmYxjOMGO1yRaS1IicTyLKGkavG+j0WC?=
 =?us-ascii?Q?mmb3XWi9mggACEtZAwKWu+6pBQ/nHT0dzow7g9uU9zJJZJ3lcilrEkT5Bhc6?=
 =?us-ascii?Q?fZdW2OAWCAOSntGAm5Rb9GSXtc/rT5I+fQVhBI5ERQ2EockVPgKJLcIJDvIY?=
 =?us-ascii?Q?tvPAUVyoWggdL692TpahVAfAiBlaUPd+TzttG4Nh3Fa/LtGQqdKYEnitLOt2?=
 =?us-ascii?Q?eXDbXAT7APCZeF+Awq1IfGF1Hna+JTQvM9KZYfRnkK5Yoy8P1DXm8720wUL2?=
 =?us-ascii?Q?sKRcw1ufwnkFnqdcRUd9Btc4FKPP9r6uceypoBkwPV9N+cpWZCAImKVSHsCs?=
 =?us-ascii?Q?+pw1oPQKx2FQKCI3hX9rps60adPG3wSi4S1c1HRG67xCA4/BV10SH67b5puJ?=
 =?us-ascii?Q?fED/FilF1/K3cnpbD5MCHUfJw7oi7lAYiE14wgJd2cuNked2D0skcn3PCyNh?=
 =?us-ascii?Q?FNxbSPzDFQjmV7mS9HJp1S5k/raohf7LzgS34wSef9HCUVl8r11T9DWczG7I?=
 =?us-ascii?Q?9aqeo8TJdrC0i3f0dY2iJfHiPPqwJYrnWZ1O+SuvUYVipfotPt7pg+bUVadV?=
 =?us-ascii?Q?9/chG4CkGTFSUROVN31/So7L/IW2v9B6fPDCXSsgz1IYjqjO79g37kk/nyea?=
 =?us-ascii?Q?cd61LHevJtHw0F7CquTvoquX9ydPPUAdijVvSBfGzDHXEFh1oPK8V1vEEFee?=
 =?us-ascii?Q?//ie+VEg376bWQZ6wgh+4wRmMtUe4TiB7QlTa+by12jDNTeCHtbla9danFrS?=
 =?us-ascii?Q?OaIyOhNEqKw1bPXKSWlBQQWDY08jK3RuOkoM/padIbtK0paK1P/lNvpPopGJ?=
 =?us-ascii?Q?lHIoTDMLEBFBXQdDM91uQ7CNVEFLQIuwfsypxXS5uwp+K11wjZOlwalc1Cw5?=
 =?us-ascii?Q?tfIEo7cillJaQKQHMk2Q0F7bQVXsBAShvzaZ7yMyCWiFOWesgsdJYcG26bMA?=
 =?us-ascii?Q?N8zQXBmvjp57YNot2jnQwO3EDUlSm5SrO1w6hlZE7pIa1GKIsn4jjPZsIRSm?=
 =?us-ascii?Q?6SZY8qw57lwhkvzxAOgPrGp9rK0om2dgzWiQLph5IzVyR8gEQizIta6Yw2gp?=
 =?us-ascii?Q?0V5jREvV83Y4PCwgw899BFlpZ6F61/9Lq5jsaqXD9l4vmWtC4sG6qt/6TrJk?=
 =?us-ascii?Q?eGAXQ4z00S1M4lF3RDq3HYNREd4fVhPHgBrIJAK8ta6DW9xJwxQoUfIcnjVx?=
 =?us-ascii?Q?wmaAUJWX5K1bICFIkQMemBdte5lwjRueBc5q4eHlUL9nEjrQOXhSsttNENDE?=
 =?us-ascii?Q?bcpiE2EiyKfV3ywiflkDOljlTTOCKbtahDnh7xgaas8G/w0aGW/cJs7C5erJ?=
 =?us-ascii?Q?BT/tUQopDYBnhK5c/RH6k5XtCsrx5VaBpnH77ECdedUuVHsL0fUKug/nEAOU?=
 =?us-ascii?Q?UpU9ZN1O7AV81s6nlgi6Mqw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 257ea162-928f-4c6d-5651-08dc117b6f2f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:28:22.4925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wjnvi1BRyZY0P4Tcl6pgG15lQy60xRZu0MhLl+YAcJy9uj47CEXFpuHYT49ZMBNknXD6UJIrsX1ezvuS5o/0rJX7P1z0BEiUqT4LqKkgXh+IDx2Q5PPFOV5jnIXo7qP3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8341
Message-ID-Hash: 5DPE25M5IFNA32EXQZJQC4Y25DQFVFES
X-Message-ID-Hash: 5DPE25M5IFNA32EXQZJQC4Y25DQFVFES
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5DPE25M5IFNA32EXQZJQC4Y25DQFVFES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Let's use devm_snd_soc_register_card() instead of snd_soc_register_card()
and ignore snd_soc_unregister_card()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ux500/mop500.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/ux500/mop500.c b/sound/soc/ux500/mop500.c
index e0ab4534fe3e..1696fa80b11b 100644
--- a/sound/soc/ux500/mop500.c
+++ b/sound/soc/ux500/mop500.c
@@ -126,7 +126,7 @@ static int mop500_probe(struct platform_device *pdev)
 		__func__, mop500_card.name,
 		mop500_card.dai_link[0].stream_name);
 
-	ret = snd_soc_register_card(&mop500_card);
+	ret = devm_snd_soc_register_card(&pdev->dev, &mop500_card);
 	if (ret)
 		dev_err(&pdev->dev,
 			"Error: snd_soc_register_card failed (%d)!\n", ret);
@@ -140,7 +140,6 @@ static void mop500_remove(struct platform_device *pdev)
 
 	pr_debug("%s: Enter.\n", __func__);
 
-	snd_soc_unregister_card(card);
 	mop500_ab8500_remove(card);
 	mop500_of_node_put();
 }
-- 
2.25.1

