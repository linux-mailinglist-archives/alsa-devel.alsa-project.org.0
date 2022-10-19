Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54760372E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00A7F59EC;
	Wed, 19 Oct 2022 02:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00A7F59EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139906;
	bh=CMiWYu61sWZ6sSsHZ3Tqrk6zINYFn2kP+o0ovFiLgMY=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VMJy2xFn+LhoukudxGXkHXSqbDWLN5LRBkRM1MXMO5sr18gQUF6LdIs4ckZiSWVYD
	 e1l5B0uIJdj1VxfpzEQPGTcyOQHHvpjy25GlYkrB/lQBDN31v+ZX2MsGYVfIzRlHND
	 j9GyLRU9BOr6UvcBP+WMz1zrRRWD1BGEjN0pH+2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF362F8055A;
	Wed, 19 Oct 2022 02:37:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A698F8055A; Wed, 19 Oct 2022 02:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B837AF80552
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B837AF80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="lrvEbdPe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds5khCo0HSoHeDXhTCYp1ZA24fEFuuqyx5XDDqRmlNxB2SLGDtxdI1Q2wFAWYSHMqHGSv618Ztz2bfaq1TTSrhEbstxDwMCdrkEG2yri26FoFtmSiwtHR3bCSvqPhIf56qw9lPvIfNYu2oTezuRssy3Nsvbc6n7QEbCXcGWllzAV7cgOXDDUCxRovKhiIy8+h0dhTc+dK5iqARk8zU30wL18lL7xPF6FFxvTTVZzNQa4q90Mv957pg1HfQhC3MJyTurHy2ANmRFKIhuzPmD0+GqaProPmYf+YrZFfkPfjcnzZhWT3bw8Ll4VxqEKD84mi3oroQFrmH3twgLFqLVs/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gHj0Fejq3wRdLUgOQqhOahOVCysZ6OppWKmTOWvyTI=;
 b=OmAd9CD//TsTjRuRsRYrVVocaVUo4aP9B5N/ZrmSYFBD1lYShC7EeAuziP0lQ1dkamILRMSoZVcSnRIbPqX6ELL5H7RmSe3GunQLd1dFS5E9yaTi4eV1Ai5S2uTQqmhkmmJh+gKrHHhcM8YKTDVrRU7PF2j9H83JYdgsMHDmEBZMvDSkIctPCATVBkCd/SZnMCMsiDeX9uxCMmLIqoe+exkHzNkfTX8tbNU0ok8kgu4g/regsH1MFwVgBu/MYbyFXMX5vGowEn7c3G5UmJI0rBIx/MNXVrWEddXc5qn9G0U9ZUL+vqv6miyJFtnA8UNBOGdgbLCiZtSEi0L4u4ImoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gHj0Fejq3wRdLUgOQqhOahOVCysZ6OppWKmTOWvyTI=;
 b=lrvEbdPeJ8HiaG/IFXY3VPgWoEY7F/TixK1eAqJhmVXf9wtwe0qa9CKw4irO+q5wcllTjLv+eqt/SNTSn+nN6gbpqyTQs6al5XxoDkXhZ+WoZO1vX0gs9XiGlBqJmxAVEaEpa5ud8owtELL9ss/vK7aL5dalz1zdUOWzDCnoMFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5576.jpnprd01.prod.outlook.com (2603:1096:604:b4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 00:36:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:36:51 +0000
Message-ID: <8735bktzrx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 06/11] ASoC: soc-dapm.c: merge dapm_power_one_widget() and
 dapm_widget_set_power()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:36:51 +0000
X-ClientProxiedBy: TYAPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:404:15::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5576:EE_
X-MS-Office365-Filtering-Correlation-Id: 541209e1-395a-47d6-7059-08dab16a038e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgVNYaZNaQuetkgFDOqbbz3R2GOaFUBTzfd1AvCInFOti7GUPU4egYj19pgI0KUQtOaVP80YiEMgmk+tSOnNCEtosESg5sBUHjTTWCgel6+cvbGC4X/CstasP/+8qrUgDvtSlXQY9xvKpDjEiaYAUgJff7vDRGg59kPZZnySvalenvIkU31BRGKY52KUg7Mo5Ji6osxDyvbv8MKmZMlMupKNEhWonJPqslraZDFGQJUMtXoVvGq8dK+jwzp8Bj9LLicDD+769AKa+SeC3nSWaMWt0zDwQ5ze37itQJpn6VEd7NXCo2S60gGzCFkgQETpkFkrFMLF9OEIlR2nwJIcUlelWFpkPfxVXp+Nq1Q3mWyFfCXhcTIiEqOcwn3zr2MDy36blLpIKPdRHpzmO2G9BjeBB/mYuM+6/ZOTgFl7LlsCKtNoS8zM/WTebrgEZaVOUZiOgaSLbFgDJ3JBz7YL3LxifCEtr0OIpOzgl08TUwlVe/fHk6m4JK+apWyNomCF5RF9ln0Mel3bMupMN6kHBDfsegXI2o9GCjqQk8rWY0g6EKd3HZEFKBdUQoxCA+azSYJN+YmXPMcrAQHm40FKJ/SKEwbCF3h8PXGBHRBEBuf5JhjYXDFXhFNPDcUqaNd5YAn5K4I2pYDH/lkU3XMUrLFI3YIHosPqzyNgDL1pvFHMecKoWXMMxqFmG9mGyjhJWB801Fm1idxcigYFqTF+rs63Ho9ddFfsQMNn5CPAik/XSrEwSTYC5PqL/+CpjP6CIgq9xuAQtJGf3Ps0Z11rM3JihQF9dHMtAKCb4Am4drY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199015)(38100700002)(966005)(478600001)(6486002)(38350700002)(186003)(4326008)(6916009)(36756003)(6506007)(2616005)(316002)(66946007)(66556008)(66476007)(5660300002)(8676002)(52116002)(2906002)(26005)(8936002)(6512007)(86362001)(83380400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lH/5zlYr8KYACSaJqad1F+bLjO7dmFg3CoKBe9OzN/b660j+f36lnK7iflb+?=
 =?us-ascii?Q?w8SliGU6BNNuURMwPcJe9YY1or2HiMR+OTWepTCRUwDQM9qs4OJjwjJE73Kw?=
 =?us-ascii?Q?Qr21tge1mrWTBR8k0ZRv3/ZxIVHoSlH6Kqwngv2I+VyJS01iHBoUaan7bYk1?=
 =?us-ascii?Q?M/XuRkTH7ZUCQzfY4FOxEoulwitnPFj9Or0kdb7nzR3ep4dsEuOVfNee+mBO?=
 =?us-ascii?Q?TD0juuOoPAOgpGxBje3lZS3nOIcj7aAKKNIPEICLYX0k4hGWDHn5oGdVQPsM?=
 =?us-ascii?Q?ZyBns2q7yLX394tsZJ8z292ykStb2iy59BciCYA4eZdHxqZuvgRP5NHQpewK?=
 =?us-ascii?Q?p28Ng7bUBeuVI6JPRrZ1oboeerLCapYCXHlCM/1y+D0heEONt+ebbZXTNh3J?=
 =?us-ascii?Q?2dpetnAgckBQcmBPfiuB8kebDOP6O2gxO4J1YlRBsIn4EbUKjDjkioHVkrp9?=
 =?us-ascii?Q?wazt86sk1z2TNSHcpZKhgc5D4NXiFAFgrhvgkKMxjDPt3Opp1aLRrI8G2wHR?=
 =?us-ascii?Q?loidEcJj8Onhw+pvkXB806SJ3mayDuU4JVcQZWk8t9YayC+sj4mFdpWnRkO1?=
 =?us-ascii?Q?ehCEqnZIZ51CnaXSBvcYvuyLtckdRR8F5cOHOqa41318oEmDcEjzMttBhd+0?=
 =?us-ascii?Q?70dS1mD43NmFkuWgm8cRSdceY4jKgIzkff1IjeyCCTlTq4rpgo5AD7TZ0Sa5?=
 =?us-ascii?Q?xoJsTNTrCTCsMmqWu84tC/QtBwPwCq6xpvBikn5Wjv9EIfyTIccm+hNMTTUF?=
 =?us-ascii?Q?8OcO4pIzpY81zbIDMZpPUF1A4zCBtfZGX/ssOt4xlr0VkAZ0k7f+UC5PDCFa?=
 =?us-ascii?Q?R+nPrfeVjViG7lrrt7JBiqHV2wTmiMDptu+6m4uakw+KAYjOcg+I3jnuAqln?=
 =?us-ascii?Q?BuZwbFMn+GukT5PQTiV6AaLHQzpFNHIF1pT64bcD5X/4IilD1FVVpppna88C?=
 =?us-ascii?Q?kTYAd9gRiG+YfsxoafHqiTSbupf8AAXvlxb76Fe7wAtx/TYI4CQPzolHJqxs?=
 =?us-ascii?Q?mOC76BHhOirLATXFRlcWcjtDOPfh6BJjRfjM0RfB3cUF7St6Yo51Bt6eDhft?=
 =?us-ascii?Q?EIv/31fMnr3bJSzriIxGlXFo6Auq4IrntggdFWcgejq3fN5r7Jqv/iSisMOv?=
 =?us-ascii?Q?IPlA6Lbe/soWuZN7XHwkbulMHh6DVZ3QxZYezvYxK0KegdFmB7zC87ZPheZ1?=
 =?us-ascii?Q?ncchwbaEmOvGKFAy9Fqvx2CLTppX+jCrCyCyIGbCT731Op8/fCDaeXa09A94?=
 =?us-ascii?Q?CMnzjMOp8i/ivAs9/EgSgOau7PwhXVZef4uFOHkxjKxn0Dxqy1Lj4prkNwK+?=
 =?us-ascii?Q?TJwjPfcqcMNlXnxHpBvsXIU8KWiubnwxYIs6S24DGHtUshrjaJSBRl/x0MaG?=
 =?us-ascii?Q?esrLxL5n9YpfSg8Fh7mUVwBTDv+cIXEptkt4OwjCvREekkpX9+spevFGDpPb?=
 =?us-ascii?Q?L9RNs4BaeAhcTJGUpEpAKQgJiu6XfqPa3/FXO1Njuuyk2A1e4+o4V4UYJ0ES?=
 =?us-ascii?Q?fiRz0DKWscEj9Cg4FzR5rN5ING5AmPozYXxiK2dA5A+D6smVTOaOdUtfjodw?=
 =?us-ascii?Q?V35DKhu8pvYELw6tpVWQhFOQrLqEuDyfkITQQAG8oQv3TgJjDLc8QO3++B7l?=
 =?us-ascii?Q?dTq1l+GYkqivdrrppZnKG/w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 541209e1-395a-47d6-7059-08dab16a038e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:36:51.2082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qWSewiWuem9rv55i+FXJCggF1KGB7poIhV+RSlcD+/sZirLxWK/Iz0W3mZOjyX3Ed2xnW/hHAxD/SjzsdZ5B4XLI/EPNdSgNNKhPD0na0GZ3scPYnxHfeTHGZ42ObN+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5576
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

dapm_widget_set_power() (= X) is called only from
dapm_power_one_widget() (= Y), and total purpose of these functions are
calling dapm_seq_insert() (= a) accordingly for each widget.

(X)	static void dapm_widget_set_power(...)
	{
		...
		if (power)
(a)			dapm_seq_insert(w, up_list, true);
		else
(a)			dapm_seq_insert(w, down_list, false);
	}

(Y)	static void dapm_power_one_widget(...)
	{
		..

		switch (w->id) {
		case snd_soc_dapm_pre:
(a)			dapm_seq_insert(w, down_list, false);
			break;
		case snd_soc_dapm_post:
(a)			dapm_seq_insert(w, up_list, true);
			break;

		default:
			power = dapm_widget_power_check(w);

(X)			dapm_widget_set_power(w, power, up_list, down_list);
			break;
		}
	}

It should be more simple, but the code is unnecessarily complicated,
and difficult to read/understand. This patch merge these into one.

Link: https://lore.kernel.org/all/87tu42owdd.wl-kuninori.morimoto.gx@renesas.com/
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d4281e776e44..7a170e16d34e 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1873,11 +1873,25 @@ static void dapm_widget_set_peer_power(struct snd_soc_dapm_widget *peer,
 		dapm_mark_dirty(peer, "peer state change");
 }
 
-static void dapm_widget_set_power(struct snd_soc_dapm_widget *w, bool power,
+static void dapm_power_one_widget(struct snd_soc_dapm_widget *w,
 				  struct list_head *up_list,
 				  struct list_head *down_list)
 {
 	struct snd_soc_dapm_path *path;
+	int power;
+
+	switch (w->id) {
+	case snd_soc_dapm_pre:
+		power = 0;
+		goto end;
+	case snd_soc_dapm_post:
+		power = 1;
+		goto end;
+	default:
+		break;
+	}
+
+	power = dapm_widget_power_check(w);
 
 	if (w->power == power)
 		return;
@@ -1897,35 +1911,13 @@ static void dapm_widget_set_power(struct snd_soc_dapm_widget *w, bool power,
 	if (!w->is_supply)
 		snd_soc_dapm_widget_for_each_sink_path(w, path)
 			dapm_widget_set_peer_power(path->sink, power, path->connect);
-
+end:
 	if (power)
 		dapm_seq_insert(w, up_list, true);
 	else
 		dapm_seq_insert(w, down_list, false);
 }
 
-static void dapm_power_one_widget(struct snd_soc_dapm_widget *w,
-				  struct list_head *up_list,
-				  struct list_head *down_list)
-{
-	int power;
-
-	switch (w->id) {
-	case snd_soc_dapm_pre:
-		dapm_seq_insert(w, down_list, false);
-		break;
-	case snd_soc_dapm_post:
-		dapm_seq_insert(w, up_list, true);
-		break;
-
-	default:
-		power = dapm_widget_power_check(w);
-
-		dapm_widget_set_power(w, power, up_list, down_list);
-		break;
-	}
-}
-
 static bool dapm_idle_bias_off(struct snd_soc_dapm_context *dapm)
 {
 	if (dapm->idle_bias_off)
-- 
2.25.1

