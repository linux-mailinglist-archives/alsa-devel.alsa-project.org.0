Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB66C98F1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 02:12:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD6A2DF3;
	Mon, 27 Mar 2023 02:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD6A2DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679875951;
	bh=yIrpt4FzGGN8KixYYhJA3cA8A6hNAFM5JVPuzFbE0/s=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=upzBRz/XtoTaQ7NofBQiWM0chqn9/0zi4pziIcQfu+gPaXidXuI4nPpX8jNUxIt3l
	 u8W+0hZHaYJmEvht44QZ66axumuIXbDoDtPLCo+7YpP9n7YvK+NxGDdK00OgIhzTM3
	 EexdMShxP2sI42MT2Qz05pXpDCnh1Qz0orvR/yR8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C266DF80568;
	Mon, 27 Mar 2023 02:10:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9A2FF80558; Mon, 27 Mar 2023 02:10:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1FB4F80551
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 02:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1FB4F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dO7NzRtJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hyy2V0fjSRojPT2aDZiRj4oaRsehEew20kBNBtJIUJd4sG5kZrJCGAf4t9fy3cLhfSTbK6FA5o3/Lb1q7ISuwsrl9hKh4U700buWF8Elw7/6NRvhahrjfE+QGGr2KjIyWD2iuGUOXdWfVzVVLiGJaMSbI0Dt4YN881ippjiUO6PUjBrLBAEvHOu7Nv5UfarQ46vFrC/wcHHdT14tgpg6Q3posIgoGWp6AEWzrDhu2PtdrspR8eegY2xNTZMkPd2OsNQcjv7kokt3b4tsDmjJkLp+UNpFUThsjS8YvpfWPxjXQzLQjJ05XYXqnBfSiIoAp7/atbE+GndN7zI+dvfy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1K+UEq1UoEvvYmu6oxtsXU9E2y0ErGBR/B/4rEz12JI=;
 b=Arn6SgyWSD1IvJx+3qsStSBNKQmcEsR/tsuhfN9RweUldMkqZVsAiEGBN+dqRUHTNvyLzc1YinBg+j6pgenggeFnlWpr+T2i5qcTB/SLYcyGSgtBX8fs8b0KIkc5flWnT5SH2mcZVqo5B7tpstEPA4DS/yBbwFA/QKn9HLytZtAG3DPfdkxqGEi/9tM3lKrBgtWHxWAmjavS9XbAcd4KBUWd7uk83OjGsMwlOfyLJme4hcQ5yPNVV9aYEFNFXnwI8kBuq4Sdjym88zXgoiLaRWIlemLX081weWaEydupxwhJ9jEcMBtVRDkhRKO1X07r+3pE6k7QMQhvnV2JshDuYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1K+UEq1UoEvvYmu6oxtsXU9E2y0ErGBR/B/4rEz12JI=;
 b=dO7NzRtJKMvnMHisczmJFmYai9fnKmNONjRDPtpeBbXBdbEOeLIGwS5TRqTNScqXw8GW7n27ui9jse/YZnNbmSnwJIlstXOt85BzEQVLmbNDRR1E0h8zG/ln8D4gZLkgYMMHFrlhIJKESZD3g3JRffP4n0uYD9HoxktXVBY1FmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11465.jpnprd01.prod.outlook.com (2603:1096:400:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Mon, 27 Mar
 2023 00:10:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 00:10:21 +0000
Message-ID: <87jzz36olv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/5] ASoC: soc.h: remove unused params/num_params
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 00:10:21 +0000
X-ClientProxiedBy: TYCPR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11465:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cba4be-5bee-460a-027c-08db2e57a78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oMqiGiKE/RXYoqdpP2h+CM+rJGl4e/1AEYMoFkBsAVmi13uJv/owOhf6074g8kxIQuNgxkuvIBl9USkYjFfya96DQ+Ky/UcBUh14GogPgC95a9ItcAoIpnqXY9q52X4jfXwIUg3LgHqOlJ2wOkH3+8lzYkofiBFm2FHCB4VrdAOofAL4xJAoilLdUd7Z3A3aiI+/EA0kMrvq2IyDBdH4aZjnG0EMLcTN3ubCQBoUFvnVm+Dlyz04qTQd5FIbGj5/xMv+/v6O9iqRqoQD5u68YvaGYKxTV1I/RhIxfoNtqQyCsuk0zFgQhPc0VXYaNtlTqsagUcnE/67YwiUBA6UYq20R5ZBO06+6oVcSDUSqIuIHFll/Quh/9A1OuUVeF0Ce3nXecVn5srj1/4korNPrYQb2RqTTo0KxUF40PTxyh+a1wuqalfbJNSVSgLOnHZJkqW4B5SvxKCXz4a170xJJSzyGOrAVXQjCSFVFsMu9jMFOwfnEnhi3b5XGWS4WC+O/V0iNIvoynnD+X7cXlrZMgaIyYSiHdUrfLy2f2NrNcsU0/S3XbZenSmope2xw2xqbb2FDwibIjXL+Ikuttjc2Tv3IPs6h1ZazJsEK8iOWJKN9U7F41b6oWNyVnRP+Ozsa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(83380400001)(2616005)(4326008)(66476007)(66946007)(66556008)(6916009)(8676002)(6486002)(478600001)(52116002)(6512007)(26005)(186003)(6506007)(316002)(2906002)(36756003)(86362001)(41300700001)(38100700002)(38350700002)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jW0YD/9I5ZnjJivIM9XtgdJY31Pwpa8IyFLiFtpgHkPbaaYXm/3yvWOWbBMF?=
 =?us-ascii?Q?6CqLIxUGiv6ujk0U8jD9qRAL0xhEythu2vuCWfvKP+7FAY1MeFLxkbKge/U0?=
 =?us-ascii?Q?4V1obMj8HYny8Y1eNTckW72DP5P/or/nsJmRRI177MHz98uiPysSSgHttZDZ?=
 =?us-ascii?Q?geO+1Mgh/CHjq+8NlVDxkBqBjtnKhj1S14DFh0a3AsMQQE2eTT4zTgSSL2s4?=
 =?us-ascii?Q?pmfc0sxDdSEF97IOjSe+yekh5Xog9afxBlqDKzRqOJ075fhqi72a1tHfUpsv?=
 =?us-ascii?Q?TifEa7gplQAd1Ia89NpqRmkw7s6wkbjxqN/B1z/JPJEcdpPutcucUuXjE7ui?=
 =?us-ascii?Q?c0g/6GSIu1VTEjy0Kq9jUoeXGTVb1Umqq+I7WIJcxC63NhJ5oAYiIwho7oky?=
 =?us-ascii?Q?0V4p6pnqVhqm23SglhHTLvyUK8qkqZq72PWPGWSB4fOzyqR1q45r0DP5C8LR?=
 =?us-ascii?Q?bnd1MGLTDdUK5I5OcFtbrobTvLNmoVYkXBjem5+g//DIq8btaPFCR8krqFi7?=
 =?us-ascii?Q?5aKuxASHgmhBHPpoFQyys7xUA30OLYig9ibY6fBFzWPdHFpLWNeqYRr0y5/t?=
 =?us-ascii?Q?zjiI0gy7zeVOqHGjTZ2Eunkt5yh+YJJ4e8CAi3eIW9QCmY5wHUy7OMEc/mbH?=
 =?us-ascii?Q?ynE7ud3e6SvqibbAMxWdwrjkqLSKq1AdN08Wjeza2Pmw83x1XmeTeIMsLTql?=
 =?us-ascii?Q?jw4D5xTqbOyZY0BayO+9EGwNLtv8wXqLS6FxOtfqORCGzYDfIBN6pRTK+8y0?=
 =?us-ascii?Q?2w9USniWtylWtYFyk4r7Cd9QZygPhTrbtVacJFQXNIQRaj4mRmpoSp9UMqdE?=
 =?us-ascii?Q?QZDEuNtE+pyj1Zh/PfeuBJuC1AuOoVXf09Isnt1sdxc1ZCBQisKd2E3xm+B4?=
 =?us-ascii?Q?0SKLC2e77Js6G4Fe91nvE56F3lYoH548IYV0a3i0JtM3dEU3sqmqcAdgDQYW?=
 =?us-ascii?Q?Dl09TyaQbNDbwFydfhpMrkfCAqWwjC9u77qe1oxd88wBz5NT7Vmdz10a6m2y?=
 =?us-ascii?Q?rS1v3ZZ9Lqb+Kl4ZsK3/FbwwAud/YslNy2YA8c8oHEGd3KfVQ+PZwR/ZGezP?=
 =?us-ascii?Q?oqYACYi4+e6eAczZc5gAeR0nFSaL0hzBG4ON/eIu2Y25sy6lbyEdu3vHgKCX?=
 =?us-ascii?Q?LfK+mFMfiniqHb6Tn6OdB9Y/uX9KBrUpfqAWJ6l6EAq8RvC95zjB9Z6Fl5bW?=
 =?us-ascii?Q?iwukY2Vjc/G/MXBij34ixOT83BVNa5N2VGUjVmDlZhVJDu0ms1uMQhI9F8Qu?=
 =?us-ascii?Q?Z3ROdR3X5YmjKtxvyuykIjsBqfNOrTVyBbrZ1Ey3/xaMNh5twiQeig0H6m8A?=
 =?us-ascii?Q?h6xjvG1MczhxMpB9FcBxAWbgDo//WGtfxOGgdGIl4gkqj4NjUy5AiOm4rHtM?=
 =?us-ascii?Q?tw3yMl9B9axGcXBh1skp3VsYh4TCWnqf0zwWDuJQ68s4GjFOF9zxQg4GuC5A?=
 =?us-ascii?Q?/C3t+s/t78CV62neQ137cCKePBFRcEL8rB79GAMelkWrrZ8Pu2jkgFiidt7c?=
 =?us-ascii?Q?VqCj22k+vEA17Fr+olBxMA4dpXXddBlBPIBhLfac8HUkFVkILmjS0eEOLE3F?=
 =?us-ascii?Q?Gt2fGo61vFioGrfafhd6oFg3wj6j0DSaEgONxoDB3j+8W18aBDWrRmd0Vor3?=
 =?us-ascii?Q?+AlStuXZ+zsO1/qxwoXoxwU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 95cba4be-5bee-460a-027c-08db2e57a78a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 00:10:21.2849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8HO52Zw21QrsNYMT3p3LG6EM0xsDuIBQ9eX1z95Vh1iC8y43WqTCEN48LAUJ3Pu2V8+qB9g4Cwad02iMbJO7pqFyRlLk7aFBGXkJTBLqn9jK1jTErfBfA0jQf1cHv1kO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11465
Message-ID-Hash: R7WYCOVARD2DJXI3CTYIQOVWIPO4ZMNE
X-Message-ID-Hash: R7WYCOVARD2DJXI3CTYIQOVWIPO4ZMNE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7WYCOVARD2DJXI3CTYIQOVWIPO4ZMNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No drivers are using params/num_params any more.
Let's remove these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  3 ---
 sound/soc/soc-core.c | 11 -----------
 2 files changed, 14 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 08fc69cf6b74..371c254aa74b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -690,9 +690,6 @@ struct snd_soc_dai_link {
 	const struct snd_soc_pcm_stream *c2c_params;
 	unsigned int num_c2c_params;
 
-	const struct snd_soc_pcm_stream *params;	/* REMOVE ME */
-	unsigned int num_params;			/* REMOVE ME */
-
 	unsigned int dai_fmt;           /* format to set on init */
 
 	enum snd_soc_dpcm_trigger trigger[2]; /* trigger type for DPCM */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f3450478e20c..2faa0d8d0d8e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2283,9 +2283,6 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
-	struct snd_soc_dai_link *dai_link;
-	int i;
-
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
@@ -2306,14 +2303,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	mutex_init(&card->dapm_mutex);
 	mutex_init(&card->pcm_mutex);
 
-	/* REMOVE ME */
-	for_each_card_prelinks(card, i, dai_link) {
-		if (!dai_link->c2c_params) {
-			dai_link->c2c_params	 = dai_link->params;
-			dai_link->num_c2c_params = dai_link->num_params;
-		}
-	}
-
 	return snd_soc_bind_card(card);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
-- 
2.25.1

