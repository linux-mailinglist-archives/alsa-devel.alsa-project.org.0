Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F97D8C7F
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 02:11:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2010DDED;
	Fri, 27 Oct 2023 02:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2010DDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698365501;
	bh=3KxTK0ZE9BUNKMjMxLzfTiEflQh2+mb/lSt9X4ZiVP8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GdxBZrWyWgKkb2R6AXBaMgxCXE9AFxQX3PiIFTYJsr/OdDoB3nIqTWM0Fk/uROuJl
	 2JnbkgRx9qPo3lcWhbUfoUZEknJV6aHfezZszqsUIMytkNQQ/y2i33aVKcxHJ9pa/o
	 BQl+koHTmNmCiJknMW/zacjGH1eIHYZPKpj8f+LM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7BBBF8055B; Fri, 27 Oct 2023 02:10:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 147D9F80570;
	Fri, 27 Oct 2023 02:10:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46438F80571; Fri, 27 Oct 2023 02:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4A85F8056F
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 02:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4A85F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oNO3IbXC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOTjkP1Udm+j2M0J/oJZV7bBYUbAxL6y9wN8GFgc8B6WC5XH4A8qmjEVd6M3GQ5d1uTuLvydi/Zwy37SmsTtxK6QjgqbldrIF58Hxdg2PQggM5VAE5ylLp3Ng2fp3Jzqrlc6kbzKfd9YzZ/pqQZbbN5mfmFi8kG600eIAhEDiQ/2Ty0o00qx5YpuXi71ib53TYefIQ6STF/PUvcd8igOLM6wNv3zrFCqJ77AfBAk9uJ2b3PsGVdgxajJ2N3j1lU8s/9ZlZCvl52w4B8BQ86+ytOuyIssPhRCv3OlIr7S4rkIUJQpyZdceJhqgWPtVpK4z1Vljj786BKZwQxr2adf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij3PciYT4w5XMQKZVCzxwgK0U6TTzeJMROJswCT6dzo=;
 b=fzSWoP3tAT/U88D9r+qk8AJl1Ck+eAlP0KykpWutm+ItnbQIDW/84c84ehEtZagdndTzz50IK5vz+IAjcJ9VVSEIBWxNC1G8RQGWoS/ks4YZzU/FQijqW2lc4cXoEKvAzXAwtQ8jReN9gGvQgyiKjrfAQM4LzqI50UV+fbPXDKrV0AsjPcdelF+pWPwUhFl1T2NQOsA+d8WyCv57p6nBZdVygEzSqE2el2lz9XxK57kjnUM/pHzusLnfqQiVnur7OUWM3rLUZZc8vCKH0xKxmA2XO7GqQAJr3crtL0y3IojEByABm8rF1FznEBC19SSLPPY2ioH18jsZzfwWK7Dytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij3PciYT4w5XMQKZVCzxwgK0U6TTzeJMROJswCT6dzo=;
 b=oNO3IbXCQ9JrH582SoHaeweC9qR6Aok+hw//tLX9hCFAkWJwQDKgj0MZe0DOpE/Kiu408jIywvPhFcBvMog8XM5sYE/0m9uI31BLOgCqj6sTi3zPHnw06DNFhTAomx7BN6OurvVpVL4euVIsrjLtCc6kMrqa4yrv8oSdM5unXxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8788.jpnprd01.prod.outlook.com (2603:1096:400:18e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 00:09:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::9ac9:4ba4:a453:d84b]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::9ac9:4ba4:a453:d84b%6]) with mapi id 15.20.6933.019; Fri, 27 Oct 2023
 00:09:57 +0000
Message-ID: <87ttqdq623.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: ams-delta.c: use component after check
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wmv9q632.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmv9q632.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 Oct 2023 00:09:56 +0000
X-ClientProxiedBy: TYCP286CA0335.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: dd12c656-ce20-4a9d-be54-08dbd6810d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sFet2bnlVA5YbQGttbsrTGX3+Ob7mO9CFSd0Lj9hxizCaK03Ta5FkuL/JZeLM0zgJU2SEhU54a8WbVlTSlct0UWOi0NWIn4pXu/JTNaZ/MQyaV09c4PrfjvquLS8vn6FEdnGIDGzy6dae96k+0QkYskeCesbWFZE3OiYkXKSVvHtCqAo0XTOGWLdPKyKO5hdkOoqBi53D7CM3L+f1y3EdHSinzqvGhcdNjkYSoHaoI7DKiL/6bo7FvW2mlobRLgWyNB+ofnJv4YDWaYstPHoPqw6hI6/oWJV0XBU60bYr+koeFLHNzQHHZYuL1I7/JcuFSaG0ImWT707QpTkOmF9msC9LpHDi8/bMBtN1t/9KeFOVI5dz2tX+mTZcLMQqqBfiTXBuqfDmpoWnoHuLT04OwUmtShz4aZTsAVzZuLxzUEPUXLLrfjAtvOWJtDNs3IviXwGZjzkjFoXUREhLDNKqELoz9rSHAnFOctThv28vyKWcaH15xvN4zSY4hmraKeT2JUXA6ykU/1DS+ImpYc4NUBTg+Z3w1tNyw0aDtKCjpU/pv2GpTLoYnX70ITAchI/QWeHeLdFRJNKj4f3smD+Gizs4xqf8LtBMIEndWqCbkA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(8676002)(8936002)(2906002)(38350700005)(41300700001)(4326008)(5660300002)(52116002)(2616005)(36756003)(26005)(38100700002)(6512007)(6506007)(83380400001)(66476007)(86362001)(66946007)(110136005)(316002)(478600001)(66556008)(966005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+DSd95KDNpC9v4a8d7GTlnExFBzH8dLM+9UCDZY+viaze652U4Xplc32a55n?=
 =?us-ascii?Q?TKTSifUfOop5ZZ1Qf06nyTZJE4Wxd5ztjX/iqRaA8fdBBEztxJFLQaGy9yGH?=
 =?us-ascii?Q?xihqlZxxdLKUOgeZENkc180k3BLChbdpeIQeKJfDm3/V2p114ZTaBJMgH2P9?=
 =?us-ascii?Q?gzIOeCyNFyNIs91uxM3/9Cdcyj/hVAAvidOXj4fm/BuDzGhauEa8tujyO1tg?=
 =?us-ascii?Q?1aMN5ji8aYnD/tPgPpLRCZSunWpTv6OlfayU5o6FtYMYL8SRWdvxpndypI4B?=
 =?us-ascii?Q?uiJ02IhdNUZC4GVPEH+WZjekgLGynlS3t8MXD9vu9u5/ZPJwiBOQd4nFhwi0?=
 =?us-ascii?Q?PCcp+7xlkvw5CpeKjBT4ZK8kN4Y7nWarinhDzQR2IKrmREieiwDhYGd/izsm?=
 =?us-ascii?Q?7TcrKy+Zf5G0oV5sR3+fi2JVLeONmAO8z5e5BtloD9jUGBp/gUoZ5tqgTt2J?=
 =?us-ascii?Q?IwgFHm/Zqm5xWhDR8azt7bkernmpNyF29Cw/YjbFxlCnG46RJl2TVnLxHaSI?=
 =?us-ascii?Q?eSiNislKpo02h/ene+ZttBvq5lgtd15OqvUs79VC56c6FoMdTzFE00w3lMNT?=
 =?us-ascii?Q?wPoosG12eGUZ2ILhlBUaj6+ba0t6scfrkpsh588ms4ICIM2e9I01IZuH2qbj?=
 =?us-ascii?Q?FZyl6jQP8pKsggafTKGneyGTaLquVZ3GC35+KO60o2saIKWQ6ofDKgSujNuU?=
 =?us-ascii?Q?zLdqoJOpmto8EDD2OcfNLfS9+Wo9yUV6a0km0WCsIYAEpExWZPeVvvTBmNPI?=
 =?us-ascii?Q?QjqK2E91c9rS+L4skuNE/SGEbus5N5mqv6e6UKkR/eyRILEj4SoCRBTJS5Fj?=
 =?us-ascii?Q?adanT2xW5LUvkdsDqKNd4hhMOezxtVx/5W49J/BkV5ERXMQtAXTAe5X6Sq0z?=
 =?us-ascii?Q?+KTWuzo6Uk7f91bh+b4S62cNrwSWdaGNwaQ8lN1/ia/qr6qKWfkQaPwdnGCl?=
 =?us-ascii?Q?+dksfXxQ7SIYM57HvP664B+sHZMXiSSa5/vIiTCbuCvodhQ36D4Pcl+AT8EL?=
 =?us-ascii?Q?w6N22N4r3N9BGs2sLtgvdlnn76Nrrj87tLv1U9vh1HeXZgNSRACtmBBohQzb?=
 =?us-ascii?Q?Q2Z5qGyT7WQddYcmW92NXYeS9uhA7UtvqqpnLpPVv1Xehxe6AmZ54HqQwyNl?=
 =?us-ascii?Q?nI/r6RGp+EtJpc5MFYxX7hU1/rAfXN3vdMBJl7vkNrYceQKl9aqlLLi6p+Kj?=
 =?us-ascii?Q?VYPXvKb29eBHLmiOXF2InHsDftBmmKPsSg2jIoVJtcw4myTPg9ikdT2AoRZc?=
 =?us-ascii?Q?15SF/IiPaSllzOw2BzZp4pX/FKKThtQcMsUkLb5bAOU13CsJ5LBr9X9/PaVP?=
 =?us-ascii?Q?PQQtmHKeOlGARGqh7Ln8rVt5bpIASSVKpgFHNAKENrk8SBB0nQZO7KvWMMiA?=
 =?us-ascii?Q?/UxV2+kVn2P+nyw2t7xR/jukbUuaZLl7VJlsk+laMwtRNxLBIp+3gAUl7u3P?=
 =?us-ascii?Q?Qgj7KL1SFEqdAgc6092tpbWYWQccJsrOxmf44q8avRpz4ETtt+afej5Yv0is?=
 =?us-ascii?Q?Nj/ez/NpvytwoA85g0Y9bsl5qCg/IX71k70PVOvxXTMlDRxeZ27l7P0ya/tI?=
 =?us-ascii?Q?VyZluQUsEayIw/jxKPB7BAnkV355Gh4oTUFV7fxhjjUbcBwRVK8eSGwu36YL?=
 =?us-ascii?Q?nrtpM1Yy1dKtUc5CIA/4hNE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dd12c656-ce20-4a9d-be54-08dbd6810d95
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 00:09:57.5985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rt/F0ves18Cti7JlIYARcmSIGtCFqyGSSlUHYeoqM5tl0dkURzCxOuStf9xPJptyEr6Z63NDGOZ3+ifvMUl0DEZ3D2vtro/gvHQ87NLp2B4jhD7eJ8s4fpPIKugpR9y6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8788
Message-ID-Hash: E3SKW2MS2P4CM2IWO5NRXYTC4WMTENAE
X-Message-ID-Hash: E3SKW2MS2P4CM2IWO5NRXYTC4WMTENAE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3SKW2MS2P4CM2IWO5NRXYTC4WMTENAE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

	static void cx81801_close()
	{
		...
(A)		struct snd_soc_dapm_context *dapm = &component->card->dapm;
		...
(B)		if (!component)
			return;
	}

(A) uses component before NULL check (B). This patch moves it after (B).

Fixes: d0fdfe34080c ("ASoC: cx20442: replace codec to component")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/3e608474-e99a-4866-ae98-3054a4221f09@moroto.mountain
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/ams-delta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 0c1ff65fcb86..bc54124adcb5 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -303,7 +303,7 @@ static int cx81801_open(struct tty_struct *tty)
 static void cx81801_close(struct tty_struct *tty)
 {
 	struct snd_soc_component *component = tty->disc_data;
-	struct snd_soc_dapm_context *dapm = &component->card->dapm;
+	struct snd_soc_dapm_context *dapm;
 
 	del_timer_sync(&cx81801_timer);
 
@@ -315,6 +315,8 @@ static void cx81801_close(struct tty_struct *tty)
 
 	v253_ops.close(tty);
 
+	dapm = &component->card->dapm;
+
 	/* Revert back to default audio input/output constellation */
 	snd_soc_dapm_mutex_lock(dapm);
 
-- 
2.25.1

