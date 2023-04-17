Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A68E76E3CF9
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 02:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CD1C827;
	Mon, 17 Apr 2023 02:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CD1C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681691796;
	bh=+a7xq7iJPVLoWDcmmRXsUim5Mp++u52XLu5ufYRvHns=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O2/sX+xp4WRPHwqFlK6gsSS7mZoID3p9F5PYoZwlQGRLnXVYiUH5ilTegzCweudzJ
	 4limal2Vzs/KNaS84LPvQpGSMIjxF2ssCmgIgZP2IYqJwAC3F9pnxZ7zqrNQTvgLCh
	 loumQG6G9Y5F0APuZQFVbx0Da6tak02kW3vGzENs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFABEF804F2;
	Mon, 17 Apr 2023 02:35:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D7B8F8051F; Mon, 17 Apr 2023 02:35:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1E07F80266
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 02:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1E07F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=a0RPZvHp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO1oo8sjcXaca/p9P6KuTUcPuRFSxVLydxeLs0lOS/Zly19SNywjYiSvoO+NWb62QQ+F9u/rJ1cCzFeQTbIm7zW0n2Pf8dHTR4wATRS4pS3JBsQpvbQhqqfFFITb+RhfdOaERqsjH1yt5gd2aK5yBGQ4pJdJ9t2q1Oe4EPUkvc5Lkcm9lbIMnV0wgePzw0X2iqGgNgU63ZVqx9sy867R3f58pP4JWnghUVHWOqRGa48Zw0qJtASAp86FZvLAr0EWqdysZqOuLL/EciqOG9ASEcb7KN0EqsvehC9l6cSSwBUsyICvjYxBlIPATuUMxE/svvL222QiSvtuBvnKjFeOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGRpMTZYh26PHAM6a/6qiKOkJR5WKm2V+d4xrqzHoMY=;
 b=YCl0uVwcjq+EF0ZURp0ObXlyV7yTfSuXTbOqP21YRnO66/UPpehWzA3jKde+Wflq57DGlwPTbYzieL63KlpBsr+wDGOYTGQTMXUggE6W1MO/gCYj1m44R8svLBVQ2StI+09JHWqe0vXdL3LYOomHNAJ1uQllC/xtAtbZSlgyTkR0A9O5ISbJRnD0aMBkPfwObI7TixK3tYbYQykOsdnppiwct0p5YaGe+1s+GFfppeH6b4nUFVbc75p0jEjZ/nNoSYxCvp/23qVluKgbqvzmkoaUEVJzNdKSu5RKEOdfED/e7le98ZjGQDgDO5xcFtB/KkhJgsOvOHJwYP62ecYxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGRpMTZYh26PHAM6a/6qiKOkJR5WKm2V+d4xrqzHoMY=;
 b=a0RPZvHpFCdoqXtEnYMVyxFTA1gCYgAEs5FucVtId6uMqVWu5cPJQRWIZK/T7CxaIwwcKem2Gft74vtZFa3OQq8JCxDacH0vAFfgeLbOSWOumkJUiO3ANFtqCRqN1yXrqTZrcY3FoKsiyVmpTGIGmvNZk2aXa0XOf1M0fNmIc18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9388.jpnprd01.prod.outlook.com (2603:1096:400:1a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 00:34:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 00:34:54 +0000
Message-ID: <87jzybtkgi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 1/3] ASoC: expand snd_soc_dapm_mutex_lock/unlock()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87leirtkh2.wl-kuninori.morimoto.gx@renesas.com>
References: <87leirtkh2.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Apr 2023 00:34:54 +0000
X-ClientProxiedBy: TYAPR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:404:14::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: e54ac614-5aa7-43f4-28fb-08db3edb907b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RTRv0y2Ner5Gpk6m6CnKOSTgC+CINyVxF1/q9wJk0oulMXL8zqhGTl750xx6bofFP/5Pme10nT1y+gvESyLemOId5wFqddL7M4MzqllxR7n3q60MDcQEp6+f3FYQhtdJfAP+qCtBKWCMRM7rXXcVSMC0gRTLmtVt6Ho7fUuebxAhUYql1kiaaEWaiLGIvOqx2255NGyk58HMLFxjnBGeGgQPZxzu9Y27B4ZX3S+oQJsn6Yv7wW2e/gCVcxoWUjSQOKy3+U5k4DciaWDKlX4vEUsrZWRrfX9ZCnRRdTVoKhZdIOW5bZqwd9UfhsbTGo7ip4KdIuy1i1tHLc+BzEwmXdslATse0bPFe3OIrAYzY/OCFz6GbpvvnIdAkBiP1zxnb7fUxYUhq6MJmo0UYa04L8dtYsCwgIjad50xLhGYyZsG1J//imgm5pvZWzC8Wd2uhRuDhKleBiGb/yHEPK9auGEwvWlZItEmEDv5tyLxkKjW+s8Ue8YZmF9d6i0NTfEjk8k6CvPRXTpvCDnV3k+N523BK2kk5q9F3MgQ+jAbz3bTw28jVsrRMR0oHC9duzHVpvgc2Rc89wALZl4gPSZ3SNAuuk+eBzMGkP5X4V6K+Uda58kxC6NbV5zZI6/8ws57eaZNJv+tViD0BMKCxSskiQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199021)(36756003)(2906002)(30864003)(5660300002)(8936002)(8676002)(41300700001)(38350700002)(38100700002)(86362001)(478600001)(2616005)(6506007)(26005)(6512007)(186003)(6486002)(52116002)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(83380400001)(309714004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?REVT69IQPVqYF9Tm2PqPXe/tUx0CZtFN3UxcHlRMI6Aw0dk0DuTaaG5Xpxnj?=
 =?us-ascii?Q?RRG28IkVUWDTF1JNWQjntDJ84lV3Lh1JTEgAuynJwsnfGN8KbNqXeH9XmtGj?=
 =?us-ascii?Q?1c0Qwvf/+Ked+xYsjeivsdai0Hqbq0mRWVF3da8C3xIp8arLdUyrO442oMmv?=
 =?us-ascii?Q?v5vjWYVvDgs4NSSpU3+tuzOujZODofEVLttirk0taa4PPROqkacPIaWCFKKe?=
 =?us-ascii?Q?SQ0HeNacmxKpzRSnJewms/2hFlTZ6/ezdUTgRSnQ5gRXoAPPUQwjE8/ThvZD?=
 =?us-ascii?Q?rLFHYM8Kg7yi/bCNCc4M5UT5cY9GfaI8MoVcSY/xV7G5joPwcS+OohRDtRQ9?=
 =?us-ascii?Q?Krf/6OLQ+3lHAGJqDOYvUIK2hsZ28aRvC+Ux7KWKtbdWek6i6jexXWrsvosJ?=
 =?us-ascii?Q?TLkeND5p/w5ApOOlwZL+lPM6KRT0pCsVMUuJN8yALTgk3huq3gkNLDaWkQLV?=
 =?us-ascii?Q?5POmWA3yk1e2HZatkqu5kUPPc1mCzVVc/RymqQqJOqsvs/YFGN2Jc2NX4zUv?=
 =?us-ascii?Q?/6c++OxZ+cQlMInPRT1fD7xVCFopdxvfWZukBQ756RkNWKtp7JaoyNd7IICb?=
 =?us-ascii?Q?2mR1OXfxgT0zQeNzgP+2h6MlKDvRWFViqd6rh9wPvpdXFNCFjyupxb9+qPoo?=
 =?us-ascii?Q?3BYahTFSir4Xa8kCofoPUGrOBR9OnhQYBRqCOSGdx7NTyQfP7qr8N/8cOGKu?=
 =?us-ascii?Q?v7lEd93iwd/9OeBSDtS9VI0eqFVDiBF2UeZukQVlkBlm9t+PYdW/aLu1FQjf?=
 =?us-ascii?Q?YqUSPPFquTfTA0gbmVbtQIylWh9b0F37A7dKhjmqNzDTdrvIrL2iUGJiR27F?=
 =?us-ascii?Q?/8DALoryjSsePkiaKVmCVvx5d4MFJCzpJjGs8iN4GhKYxWupFLK5VO4wfwsm?=
 =?us-ascii?Q?sCcZKEqyD9PCTMEsS8ivq35i5V++OojdIIJ+SQ3eZfi/3s01/Iam7eXnx8SA?=
 =?us-ascii?Q?1csqXKR/q7L4tMkG3KaKjCfMQaLflMEHobIPx7i9uj+JT7LTKAG/oDaGW5wW?=
 =?us-ascii?Q?IUJG7JPYn8GWXBzDGlNKZuQJkvfNup4qEbGOscKNGiHjPPGQw6EyfyEFoF/v?=
 =?us-ascii?Q?mjwf+5urbEfSMwUggZrMmc1F217wYIn7/7aKkXIpaN/N8/bFeZCapmPnVimL?=
 =?us-ascii?Q?VTzC+QeM9X4YCYR0E8LHDWMbt7hdt1MDeCUntfpMMBJpBz0BmcU7yijvw5kL?=
 =?us-ascii?Q?G7n84SzLX5jXP2ywEDlrQr8E6QfGFKKsx24umb4LDf/U0ZMejswXLNJGwtJy?=
 =?us-ascii?Q?ciuYNKPcQexHSgUJ+3b64+yBnnsxvmhMboaIPoCMP8CsQ7VmUsbTvFr9rWSi?=
 =?us-ascii?Q?ioPems3KaP5ir6EOUG5OI9OC8r2R9gQQliLgwM61y8/UKpuHcL5wrVszOjmY?=
 =?us-ascii?Q?UZ8yWr0eIHmXe0XNsPmFUDgVrxoQVtNM+HLTBtgkCGp0fKpy701mzm1Cvc/3?=
 =?us-ascii?Q?MH2zNqlsO0qyJj5/J+6rFVSCRrtnBCXTcVMDlVd1EouliUAO7g8zj5bKI8be?=
 =?us-ascii?Q?oL1v7iOVcMi40PYD1fRP4Hwbyph/L7DrXcIehdOMsKlmDw6WHMTSjeL4eYEw?=
 =?us-ascii?Q?Sc4ZWSnY42S3ZpXVSHVNqLed7wYGSSM6C5uRwwnZBGOgux+wux9osjI7/jQz?=
 =?us-ascii?Q?V9vqlcJDWvjt3v5pw7OjeR8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e54ac614-5aa7-43f4-28fb-08db3edb907b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 00:34:54.6898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ROAXK1RexiqAuTMydzRPrs/bW2uc5gr/oxA5yEiO7WS4HLzvt9+a3o+iPAWMq6uFKkNcg5CI5prYhhbOmYThmLFyWtqMz8xju/y5Wsw6PptSclWbZgsiIQovItcEHmG8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9388
Message-ID-Hash: 6MBVFGROLDJMZB3GXAQRVBKKCDGUXKJ2
X-Message-ID-Hash: 6MBVFGROLDJMZB3GXAQRVBKKCDGUXKJ2
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MBVFGROLDJMZB3GXAQRVBKKCDGUXKJ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc.h has snd_soc_dapm_mutex_lock/unlock() definition and
many drivers are using it, but soc-dapm.c is not.

1st reason is snd_soc_dapm_mutex_lock/unlock() requests
snd_soc_dapm_context pointer as parameter (A), but sometimes soc-dapm.c
needs to use snd_soc_card (B).

(A)	static inline void snd_soc_dapm_mutex_lock(struct snd_soc_dapm_context *dapm)
	{
		mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
	}			   ^^^^^^^^^^

(B)	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
			   ^^^^

2nd reason is it want to use SND_SOC_DAPM_CLASS_INIT for mutex_lock_nested(),
but helper is using _RUNTIME (A).

The conclusion is we want to use "dapm vs card" and "_RUNTIME vs _INIT"
for dapm lock/unlock. To enable this selfish request, this patch uses
_Generic macro. We can use snd_soc_dapm_mutex_lock/unlock() for both
dapm and card case.

	snd_soc_dapm_mutex_lock(dapm);	snd_soc_dapm_mutex_unlock(dapm);
	snd_soc_dapm_mutex_lock(card);	snd_soc_dapm_mutex_unlock(card);

Current soc-dapm.c is using both mutex_lock() and mutex_lock_nested().
This patch handles mutex_lock() as mutex_lock_nested(..., 0),
in other words, handles below as same.

	mutex_lock(&card->dapm_mutex);
	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_INIT);

Because people might misunderstand that _init() is mutex initialization,
this patch renames _INIT to _ROOT and adds new
snd_soc_dapm_mutex_lock_root() for it.

This patch also moves snd_soc_dapm_subclass definition from soc-dapm.h
to soc.h to keep related code together.

Because very complex soc.h vs soc-dapm.h relationship,
it is difficult/impossible to define these helper into soc-dapm.h.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h |   5 --
 include/sound/soc.h      |  60 ++++++++++++++++++--
 sound/soc/soc-dapm.c     | 119 +++++++++++++++++++--------------------
 3 files changed, 113 insertions(+), 71 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 64915ebd641e..87f8e1793af1 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -527,11 +527,6 @@ enum snd_soc_dapm_type {
 	SND_SOC_DAPM_TYPE_COUNT
 };
 
-enum snd_soc_dapm_subclass {
-	SND_SOC_DAPM_CLASS_INIT		= 0,
-	SND_SOC_DAPM_CLASS_RUNTIME	= 1,
-};
-
 /*
  * DAPM audio route definition.
  *
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 3833184c187f..0e17e3230c7a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1364,17 +1364,67 @@ extern struct dentry *snd_soc_debugfs_root;
 
 extern const struct dev_pm_ops snd_soc_pm_ops;
 
-/* Helper functions */
-static inline void snd_soc_dapm_mutex_lock(struct snd_soc_dapm_context *dapm)
+/*
+ *	DAPM helper functions
+ */
+enum snd_soc_dapm_subclass {
+	SND_SOC_DAPM_CLASS_ROOT		= 0,
+	SND_SOC_DAPM_CLASS_RUNTIME	= 1,
+};
+
+static inline void _snd_soc_dapm_mutex_lock_root_c(struct snd_soc_card *card)
+{
+	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_ROOT);
+}
+
+static inline void _snd_soc_dapm_mutex_lock_c(struct snd_soc_card *card)
+{
+	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+}
+
+static inline void _snd_soc_dapm_mutex_unlock_c(struct snd_soc_card *card)
 {
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	mutex_unlock(&card->dapm_mutex);
 }
 
-static inline void snd_soc_dapm_mutex_unlock(struct snd_soc_dapm_context *dapm)
+static inline void _snd_soc_dapm_mutex_assert_held_c(struct snd_soc_card *card)
 {
-	mutex_unlock(&dapm->card->dapm_mutex);
+	lockdep_assert_held(&card->dapm_mutex);
 }
 
+static inline void _snd_soc_dapm_mutex_lock_root_d(struct snd_soc_dapm_context *dapm)
+{
+	_snd_soc_dapm_mutex_lock_root_c(dapm->card);
+}
+
+static inline void _snd_soc_dapm_mutex_lock_d(struct snd_soc_dapm_context *dapm)
+{
+	_snd_soc_dapm_mutex_lock_c(dapm->card);
+}
+
+static inline void _snd_soc_dapm_mutex_unlock_d(struct snd_soc_dapm_context *dapm)
+{
+	_snd_soc_dapm_mutex_unlock_c(dapm->card);
+}
+
+static inline void _snd_soc_dapm_mutex_assert_held_d(struct snd_soc_dapm_context *dapm)
+{
+	_snd_soc_dapm_mutex_assert_held_c(dapm->card);
+}
+
+#define snd_soc_dapm_mutex_lock_root(x) _Generic((x),			\
+	struct snd_soc_card * :		_snd_soc_dapm_mutex_lock_root_c, \
+	struct snd_soc_dapm_context * :	_snd_soc_dapm_mutex_lock_root_d)(x)
+#define snd_soc_dapm_mutex_lock(x) _Generic((x),			\
+	struct snd_soc_card * :		_snd_soc_dapm_mutex_lock_c,	\
+	struct snd_soc_dapm_context * :	_snd_soc_dapm_mutex_lock_d)(x)
+#define snd_soc_dapm_mutex_unlock(x) _Generic((x),			\
+	struct snd_soc_card * :		_snd_soc_dapm_mutex_unlock_c,	\
+	struct snd_soc_dapm_context * :	_snd_soc_dapm_mutex_unlock_d)(x)
+#define snd_soc_dapm_mutex_assert_held(x) _Generic((x),			\
+	struct snd_soc_card * :		_snd_soc_dapm_mutex_assert_held_c, \
+	struct snd_soc_dapm_context * :	_snd_soc_dapm_mutex_assert_held_d)(x)
+
 #include <sound/soc-component.h>
 #include <sound/soc-card.h>
 #include <sound/soc-jack.h>
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 36e6f261bcf7..f2f04ce693a1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -150,7 +150,7 @@ static int dapm_down_seq[] = {
 static void dapm_assert_locked(struct snd_soc_dapm_context *dapm)
 {
 	if (snd_soc_card_is_instantiated(dapm->card))
-		lockdep_assert_held(&dapm->card->dapm_mutex);
+		snd_soc_dapm_mutex_assert_held(dapm);
 }
 
 static void pop_wait(u32 pop_time)
@@ -302,7 +302,7 @@ void dapm_mark_endpoints_dirty(struct snd_soc_card *card)
 {
 	struct snd_soc_dapm_widget *w;
 
-	mutex_lock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_lock_root(card);
 
 	for_each_card_widgets(card, w) {
 		if (w->is_ep) {
@@ -314,7 +314,7 @@ void dapm_mark_endpoints_dirty(struct snd_soc_card *card)
 		}
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 }
 EXPORT_SYMBOL_GPL(dapm_mark_endpoints_dirty);
 
@@ -604,7 +604,7 @@ static void dapm_reset(struct snd_soc_card *card)
 {
 	struct snd_soc_dapm_widget *w;
 
-	lockdep_assert_held(&card->dapm_mutex);
+	snd_soc_dapm_mutex_assert_held(card);
 
 	memset(&card->dapm_stats, 0, sizeof(card->dapm_stats));
 
@@ -1302,7 +1302,7 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	int paths;
 	int ret;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_OUT);
@@ -1322,7 +1322,7 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 		paths = ret;
 
 	trace_snd_soc_dapm_connected(paths, stream);
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 
 	return paths;
 }
@@ -1952,7 +1952,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event)
 	enum snd_soc_bias_level bias;
 	int ret;
 
-	lockdep_assert_held(&card->dapm_mutex);
+	snd_soc_dapm_mutex_assert_held(card);
 
 	trace_snd_soc_dapm_start(card);
 
@@ -2090,7 +2090,6 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 					   size_t count, loff_t *ppos)
 {
 	struct snd_soc_dapm_widget *w = file->private_data;
-	struct snd_soc_card *card = w->dapm->card;
 	enum snd_soc_dapm_direction dir, rdir;
 	char *buf;
 	int in, out;
@@ -2101,7 +2100,7 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 	if (!buf)
 		return -ENOMEM;
 
-	mutex_lock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_lock_root(w->dapm);
 
 	/* Supply widgets are not handled by is_connected_{input,output}_ep() */
 	if (w->is_supply) {
@@ -2145,7 +2144,7 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 		}
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(w->dapm);
 
 	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
 
@@ -2266,7 +2265,7 @@ static int soc_dapm_mux_update_power(struct snd_soc_card *card,
 	int found = 0;
 	bool connect;
 
-	lockdep_assert_held(&card->dapm_mutex);
+	snd_soc_dapm_mutex_assert_held(card);
 
 	/* find dapm widget path assoc with kcontrol */
 	dapm_kcontrol_for_each_path(path, kcontrol) {
@@ -2293,11 +2292,11 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 	struct snd_soc_card *card = dapm->card;
 	int ret;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 	card->update = update;
 	ret = soc_dapm_mux_update_power(card, kcontrol, mux, e);
 	card->update = NULL;
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
 	return ret;
@@ -2312,7 +2311,7 @@ static int soc_dapm_mixer_update_power(struct snd_soc_card *card,
 	struct snd_soc_dapm_path *path;
 	int found = 0;
 
-	lockdep_assert_held(&card->dapm_mutex);
+	snd_soc_dapm_mutex_assert_held(card);
 
 	/* find dapm widget path assoc with kcontrol */
 	dapm_kcontrol_for_each_path(path, kcontrol) {
@@ -2358,11 +2357,11 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 	struct snd_soc_card *card = dapm->card;
 	int ret;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 	card->update = update;
 	ret = soc_dapm_mixer_update_power(card, kcontrol, connect, -1);
 	card->update = NULL;
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
 	return ret;
@@ -2441,7 +2440,7 @@ static ssize_t dapm_widget_show(struct device *dev,
 	struct snd_soc_dai *codec_dai;
 	int i, count = 0;
 
-	mutex_lock(&rtd->card->dapm_mutex);
+	snd_soc_dapm_mutex_lock_root(rtd->card);
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		struct snd_soc_component *cmpnt = codec_dai->component;
@@ -2449,7 +2448,7 @@ static ssize_t dapm_widget_show(struct device *dev,
 		count = dapm_widget_show_component(cmpnt, buf, count);
 	}
 
-	mutex_unlock(&rtd->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(rtd->card);
 
 	return count;
 }
@@ -2632,9 +2631,9 @@ int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm)
 {
 	int ret;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	ret = snd_soc_dapm_sync_unlocked(dapm);
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_sync);
@@ -2703,9 +2702,9 @@ int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	int ret;
 
-	mutex_lock_nested(&rtd->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(rtd->card);
 	ret = dapm_update_dai_unlocked(substream, params, dai);
-	mutex_unlock(&rtd->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(rtd->card);
 
 	return ret;
 }
@@ -3090,14 +3089,14 @@ int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 {
 	int i, ret = 0;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	for (i = 0; i < num; i++) {
 		int r = snd_soc_dapm_add_route(dapm, route);
 		if (r < 0)
 			ret = r;
 		route++;
 	}
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -3116,12 +3115,12 @@ int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
 {
 	int i;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	for (i = 0; i < num; i++) {
 		snd_soc_dapm_del_route(dapm, route);
 		route++;
 	}
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return 0;
 }
@@ -3194,14 +3193,14 @@ int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
 	int i;
 	int ret = 0;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_INIT);
+	snd_soc_dapm_mutex_lock_root(dapm);
 	for (i = 0; i < num; i++) {
 		int err = snd_soc_dapm_weak_route(dapm, route);
 		if (err)
 			ret = err;
 		route++;
 	}
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -3220,7 +3219,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 	struct snd_soc_dapm_widget *w;
 	unsigned int val;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_INIT);
+	snd_soc_dapm_mutex_lock_root(card);
 
 	for_each_card_widgets(card, w)
 	{
@@ -3232,7 +3231,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 						sizeof(struct snd_kcontrol *),
 						GFP_KERNEL);
 			if (!w->kcontrols) {
-				mutex_unlock(&card->dapm_mutex);
+				snd_soc_dapm_mutex_unlock(card);
 				return -ENOMEM;
 			}
 		}
@@ -3275,7 +3274,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 	}
 
 	dapm_power_widgets(card, SND_SOC_DAPM_STREAM_NOP);
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_new_widgets);
@@ -3293,7 +3292,6 @@ int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct snd_soc_card *card = dapm->card;
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	int reg = mc->reg;
@@ -3304,7 +3302,7 @@ int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int invert = mc->invert;
 	unsigned int reg_val, val, rval = 0;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	if (dapm_kcontrol_is_powered(kcontrol) && reg != SND_SOC_NOPM) {
 		reg_val = soc_dapm_read(dapm, reg);
 		val = (reg_val >> shift) & mask;
@@ -3321,7 +3319,7 @@ int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 		if (snd_soc_volsw_is_stereo(mc))
 			rval = (reg_val >> width) & mask;
 	}
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	if (invert)
 		ucontrol->value.integer.value[0] = max - val;
@@ -3379,7 +3377,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 			rval = max - rval;
 	}
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 
 	/* This assumes field width < (bits in unsigned int / 2) */
 	if (width > sizeof(unsigned int) * 8 / 2)
@@ -3421,7 +3419,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 		card->update = NULL;
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
@@ -3443,17 +3441,16 @@ int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct snd_soc_card *card = dapm->card;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int reg_val, val;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	if (e->reg != SND_SOC_NOPM && dapm_kcontrol_is_powered(kcontrol)) {
 		reg_val = soc_dapm_read(dapm, e->reg);
 	} else {
 		reg_val = dapm_kcontrol_get_value(kcontrol);
 	}
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	val = (reg_val >> e->shift_l) & e->mask;
 	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(e, val);
@@ -3500,7 +3497,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 		mask |= e->mask << e->shift_r;
 	}
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 
 	change = dapm_kcontrol_set_value(kcontrol, val);
 
@@ -3521,7 +3518,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 		card->update = NULL;
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
@@ -3562,12 +3559,12 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
 	const char *pin = (const char *)kcontrol->private_value;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 
 	ucontrol->value.integer.value[0] =
 		snd_soc_dapm_get_pin_status(&card->dapm, pin);
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 
 	return 0;
 }
@@ -3586,10 +3583,10 @@ int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	const char *pin = (const char *)kcontrol->private_value;
 	int ret;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 	ret = __snd_soc_dapm_set_pin(&card->dapm, pin,
 				     !!ucontrol->value.integer.value[0]);
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 
 	snd_soc_dapm_sync(&card->dapm);
 	return ret;
@@ -3762,9 +3759,9 @@ snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
 {
 	struct snd_soc_dapm_widget *w;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 	w = snd_soc_dapm_new_control_unlocked(dapm, widget);
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return w;
 }
@@ -3787,7 +3784,7 @@ int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 	int i;
 	int ret = 0;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_INIT);
+	snd_soc_dapm_mutex_lock_root(dapm);
 	for (i = 0; i < num; i++) {
 		struct snd_soc_dapm_widget *w = snd_soc_dapm_new_control_unlocked(dapm, widget);
 		if (IS_ERR(w)) {
@@ -3796,7 +3793,7 @@ int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 		}
 		widget++;
 	}
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_new_controls);
@@ -4499,9 +4496,9 @@ void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 {
 	struct snd_soc_card *card = rtd->card;
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(card);
 	soc_dapm_stream_event(rtd, stream, event);
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 }
 
 void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream)
@@ -4562,11 +4559,11 @@ int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin)
 {
 	int ret;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 
 	ret = snd_soc_dapm_set_pin(dapm, pin, 1);
 
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -4630,11 +4627,11 @@ int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm,
 {
 	int ret;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 
 	ret = snd_soc_dapm_force_enable_pin_unlocked(dapm, pin);
 
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -4674,11 +4671,11 @@ int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm,
 {
 	int ret;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 
 	ret = snd_soc_dapm_set_pin(dapm, pin, 0);
 
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -4725,11 +4722,11 @@ int snd_soc_dapm_nc_pin(struct snd_soc_dapm_context *dapm, const char *pin)
 {
 	int ret;
 
-	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	snd_soc_dapm_mutex_lock(dapm);
 
 	ret = snd_soc_dapm_set_pin(dapm, pin, 0);
 
-	mutex_unlock(&dapm->card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	return ret;
 }
@@ -4826,7 +4823,7 @@ static void soc_dapm_shutdown_dapm(struct snd_soc_dapm_context *dapm)
 	LIST_HEAD(down_list);
 	int powerdown = 0;
 
-	mutex_lock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_lock_root(card);
 
 	for_each_card_widgets(dapm->card, w) {
 		if (w->dapm != dapm)
@@ -4851,7 +4848,7 @@ static void soc_dapm_shutdown_dapm(struct snd_soc_dapm_context *dapm)
 						    SND_SOC_BIAS_STANDBY);
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	snd_soc_dapm_mutex_unlock(card);
 }
 
 /*
-- 
2.25.1

