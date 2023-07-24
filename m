Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC6675E5D9
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 02:29:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A22DD3E7;
	Mon, 24 Jul 2023 02:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A22DD3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690158539;
	bh=uHfGZsWQlIaWPXIOISjEx33qMR61fUrzglPCK8bC7AY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=csNtJt4YK9/0yUGvONDJNzcHdEtpQKxqoOSkIMk9BuE/dJnPdz1Sz4SicjJ6oFcyR
	 EyiYppEvAMAGk8d2BWrzPFK/LxoYvrTYEXR9T1PA0hu0UXkglLAf1N7jxmIOOUvk4s
	 a2xfRglgmyfbCR9jDdQszXEGxqROTHmlSIciHrDQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6B87F80310; Mon, 24 Jul 2023 02:27:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3D1AF80544;
	Mon, 24 Jul 2023 02:27:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C808DF80549; Mon, 24 Jul 2023 02:21:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C02AF80520
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 02:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C02AF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PkleNIxJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFx7P08P5OKk60hJqHwI8bzQG71lLWThNPa05Ra4ihIcuY4PlLJefX6fu54BVi1JiMxbhCL1GlMnQs2NSYq7RUk08FKTkb4tkJuVI957E9Ym4512heWqYw5PKRVgA/Gv8rKbRrOR1a17QA2VlR7SrIveXtoqrKetNJQY7du1AI39NsSSi9RuMxyn5ith2Sha8J98BSRKlYbqVbQj41ZSgjc9yUl30BCMr38RMmYV71IYIjBae2dYyVay8wocBXENGvp+4OmjWkYJEe+/f9SG5vq7UvyKjdXNi77Lypee3BtA+WKn2LOFH8dQd2LiXILsXP6QZTtwv6uysJyldtXamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPQjkV/yUGqOnlH0brfqHlDsVtEbqQhTz6n3QSPRYAE=;
 b=KwgkzIyEsVS1Svghhc14z68ceBeIZ46juKrsvTNT17epg7AmlzECxv/GL8D7RUgfYUGb+LUQkJ8JxGlR9+Pg3wn0/PSzBgBzQSs3pNIWKauM6FHJegaEReFxzRkuma2b0qBW462e16Dqd/UcgpZo6g695CgGQcT9Zhn0wKvKWAiPFF28cl3WScWdZt2N0tOxYl76vOdKJsmnRjCflJtyxxZoOl5I037XusdhCoQqEF7rRBWTCmlxGiVhLrJWohZv9eVI735MXbfVrBX8zoAJft3/2ZVZjl6j1yD2NCKFCtgHMmEhNCWmZYR1RBLTU6fIu8MamvswOhcSNWzQEhyJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPQjkV/yUGqOnlH0brfqHlDsVtEbqQhTz6n3QSPRYAE=;
 b=PkleNIxJSbWZxlExP4N0HsikyUbdqxHo/7HfusDdYBi3B2NRaiuv0UTg804UjChvubqbELl559AvkIPR6tpdHI1CtamvUwivFgHzbOqMIHFyiJImTgE/NjmhFuTIjw5QhTqWCQk1rGvCwcAs8Ay1EtODL5mnOEG2A1i0ZJE3yGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11420.jpnprd01.prod.outlook.com (2603:1096:604:234::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 00:21:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 00:21:22 +0000
Message-ID: <87wmyqb1mm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: rsnd: use DAI driver ID instead of DAI ID
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
In-Reply-To: <87y1j6b1ne.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1j6b1ne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jul 2023 00:21:22 +0000
X-ClientProxiedBy: TYCP286CA0235.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11420:EE_
X-MS-Office365-Filtering-Correlation-Id: 741724fd-66e3-4bb0-5b47-08db8bdbe8d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GB1v10wMFnVSXIM3yvcjOaI5wkfLO46gBrDadxO8rGzm5ZW/14jsFaHY38Z71YajCzUoVnhjUNnG682IaK8Aad4AXO2fUfE6vlc3Usr4U+A6LnuJsED9KwQMiyexaPAXxdDuqcZbUjAWDtkLhYZGM8+bOGq+6Eghh6EK+ryzi8F45MyhceIbcJprLTC2Ma2DVwFOtRNn5eGo4fC4//e/Y7aMmWLELQN+0fIPSBElexH8RVi4SeqplElp5qzrijL+yBMx74W6TrWh6g3bkFujCin3zmSfgaJdD5/roJdhEdkC6MGPDfRPOa2KjYhdZVdEF+BhREA154x7m+6UfvwmCAIbwC1DklwnMSMxK6qmbou/DyIW7tmXqItOcm6jhSa31vqMpmJKGEtI4vTyVyCm55pifEBUzTTXTcaX/w9Uxn5WeB5DDBDp8GAqn5a+I//eqpRYxOchXr2D1UZfUkXMlR9FMYZixdEQqAVlqMc4f25wntUrpGklDacjdnDCDzbP/GZvxpaFj02vZeAddiOVEGF/Q2e4q+ITbJmFU+CWt2eNMA+uTnJ0S3KfwhhjwHVUnDXHcITBmMtB21nuzLOttzvClbi3R1vpJf9Zrt5CGYZHLFSZTCHb8j6U8zAH5v1W
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(2906002)(38350700002)(38100700002)(6512007)(186003)(2616005)(26005)(6506007)(5660300002)(86362001)(8936002)(8676002)(4744005)(36756003)(478600001)(6486002)(52116002)(4326008)(66476007)(66556008)(66946007)(41300700001)(316002)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zL6UuIeQfWWNT/Z8haH0l7bLaxOJQMgSbeY9ev5LVtN7Y0ohQmEavxg5Y3Sn?=
 =?us-ascii?Q?I5hwVR6XEEXYHK4eHisYBWYKRnt+kMrAwv6y6JPYp+CA85Kbuiv0Oy26Ogbh?=
 =?us-ascii?Q?bCKcok1vL0nc9Hl1bTwLeZH1T2DFmv9J0NAsVdrj4dTaiTgzWsYQmGAgg0d9?=
 =?us-ascii?Q?N05TfFAI35pRvrkrBy5+T/TcsEssWvAnnpUCb/OoGLFh9+y9Xe6pujWxngN1?=
 =?us-ascii?Q?cE16NSYxaQBGn1Ti9nBW1ERuxH5zWpfdZm93dMju930PZcQsOaxSjweOIqqx?=
 =?us-ascii?Q?xTuLCo8s2iC6IASQR8VTPnoV9g3m2E+auNVoFuhdwWruzjQQEbwpnmnmExqA?=
 =?us-ascii?Q?dIq6/o/4QxpnSzkYApso3jajMWuhtl83i9+CHDwEea0TEjHTtp24Ji5JYRJW?=
 =?us-ascii?Q?hDiEczs1LrK1aRAdZkyD+xjMO/F6o3JVc3GL5VrbCg+DTgdd+U3CyOamL8jz?=
 =?us-ascii?Q?V8qW+Q5yT6GpjCqHGoLqpMojUIdCazyevIFv58RIeas48uK+2/fp2Afl75sP?=
 =?us-ascii?Q?WR3P6P5KQOEP6iIDsPrtbJ+AgF8aIKwxT3wFO3AuF9IIq2rXWVb9UXzJ6YNs?=
 =?us-ascii?Q?x7inoBtrbd7p/P/JtfFt55VK9MMeYmRkVP3WhTH/EXtFMEVEhJYgC8ixG1TB?=
 =?us-ascii?Q?4RvXUs/C3FabLuwCzkvVymocBG/Y28nex1qezbaHpy1F8oFa5Z6084MVbthW?=
 =?us-ascii?Q?rOjC43SsFVw8Dyp/tERdnxjSIoEhtPZZtXJUer/u7jgWz/kpcKqzqyGrc6IM?=
 =?us-ascii?Q?i5W26eH7Qm1pqdvhdgSI9Ph4DJjEBd4n9uCKVGtGp8omqWvDl2Mt2bEkhvye?=
 =?us-ascii?Q?NIFzxa3mzx48HS+717TI86acR8Rw+VUFkB7PHnH52wnE+RPUvYl85JYQsL1x?=
 =?us-ascii?Q?oob0k+TsAZtnWp4f7jLfW4Hmx1Mj7Q9jWclFRPdHh1rA91ZbAkigGf+FjdqG?=
 =?us-ascii?Q?Jn1QmdQ7m+xnt791GGZjIRIXfkLo6bPowF96M0fVwjCn1lvsGbiGjg2p/9ZJ?=
 =?us-ascii?Q?irP7I6V7Ee5tFuPB735PqH7xcNrU3zSyy2lfWsr5ma3vGq4GZ4hulvE/9XpW?=
 =?us-ascii?Q?2pyxBfsL/8X19XaTpSoohok+/7j4rs9rjYWO7IPncZ04WlecpXjPmc3hpK9m?=
 =?us-ascii?Q?dSWVPv+kwo9j/ae1E9ikDzE7OxHUFumHSjpgiOE2id3FiTxWwmvBEDVzssoy?=
 =?us-ascii?Q?dXPSfb+7Wn488JQKcxk5+1xnlCV/UAJOJ0cSzzMK+o7/DzAGYxfNPAhHH6gW?=
 =?us-ascii?Q?9o0pWt0ZzlLhftFwYEcT9jwIawPNVRSq/PXFevUQu7BUzricmMs75UJgk9qn?=
 =?us-ascii?Q?osKRCtLnlk5GZTWZ9kiVG1fJ9EkdqQAwYH5Ke7Bix36BPkBLvwtIPnst/sAm?=
 =?us-ascii?Q?GBkHbGKg9XS8Btqb8PxK1sEA3Qs6r64jJ9uJwcgEjqXcg+d0tFWxkhDFPg0h?=
 =?us-ascii?Q?uNiQnIkbacXioWvq0mpyaDk93G+eI2ljUyTDjmsR28COLGcjnkjBviK0fLyd?=
 =?us-ascii?Q?zIYIDDW7epUGsh26y2cYxhx+bIJNALut51YRIlbOtILI34XFKFFS3ISrXP6/?=
 =?us-ascii?Q?/xjPjQ2lV6CrFKt4/Abz1jwKxCCVzfLo3WbHkWkBnlJrI9TYwjb3zrOT3lFj?=
 =?us-ascii?Q?UUGRTtpPujZN1UgZrX6moKQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 741724fd-66e3-4bb0-5b47-08db8bdbe8d3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 00:21:22.5823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IflDHJdL+o3HFFFHMDtD1atJE0i4qFvAE8+PY3KkfeU80Wm5mNw7gB51UIbC1YgqqHq+GvmPFh2A75tSY8lfMEk52ug1jrsyFERr1UMw7UtAMUR0At5GeUD/6pGUx6VD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11420
Message-ID-Hash: FR473AQK4AN7HUXUCI6DQKKVIVUAQDQF
X-Message-ID-Hash: FR473AQK4AN7HUXUCI6DQKKVIVUAQDQF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FR473AQK4AN7HUXUCI6DQKKVIVUAQDQF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current rsnd is using DAI ID to get own priv data without setting
driver->id. It was no problem for Single Component, but will be problem
in case of Multi Component, because it is not a DAI serial number.

	struct snd_soc_dai *snd_soc_register_dai(...)
	{
		...
		if (dai_drv->id)
			dai->id = dai_drv->id;
		else
			dai->id = component->num_dai;
		...
	}

This patch sets driver->id, and get serial number.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 6a522e6dd85a..f3f17b784025 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1378,6 +1378,7 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 	drv->name	= rdai->name;
 	drv->ops	= &rsnd_soc_dai_ops;
 	drv->pcm_new	= rsnd_pcm_new;
+	drv->id		= dai_i;
 
 	io_playback->rdai		= rdai;
 	io_capture->rdai		= rdai;
-- 
2.25.1

