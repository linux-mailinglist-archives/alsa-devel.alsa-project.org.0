Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD776C1AE
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:54:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B469844;
	Wed,  2 Aug 2023 02:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B469844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937694;
	bh=ElhcncEscVJh6kQNQTT0zW/VMsi2AQBLI55VaLV0UP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nh+x3kTKqsG/miKRef8GJqs6DWgrwwPQIK4vgT9KO+jIslqOI5/+CkKo3I6GdQche
	 kTTR/+lIw2QhCtvDN4wTGkKotXnvEHmwqBerlr9/SnhNlYwr4MJvdPimRcaBEOqvYm
	 eX4PWgWMUpE1YAFsbig5k3jT7VSyAuhjoA6PRmnQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1495F805A0; Wed,  2 Aug 2023 02:53:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DB9DF80535;
	Wed,  2 Aug 2023 02:53:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14D79F80588; Wed,  2 Aug 2023 02:53:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F062DF80578
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F062DF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lUxPf81j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmyZ2pQfeAFjrmEe1j4nmwo/OkHWQB5dPMDthvQFvoAhKCf55VYWyrhhxxaqKBcTeMnW5Wy6SSutPlCeuUsxq9eUfNxcVuYK9lryZHRdr4OW6cPB2d+U092C6ThzJNQgPa7jEcwInFu2YFifdFWTXn+psC2lKSm0HvZBJ2rGDg2/R7rlBxVy09y57jz39bRbZ3S8AQgOZlA3MsA+d4bMsYAB5OhQEpBbW6UFrBYvDIq0PqqCns7zHQ7q6dHu5q3ROtyOkW6L+e/gn0I0RW+1Ut6rKi86j/9eeko822IENIfA1e/gyQZuC3vg9LRI3jU9FV1B/l/0x5zeJfKQTnxS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UArWovGkyY/QpFe2RCYWBUrzlLsbFBs/YnsnPkiHSyE=;
 b=NsXIQJS5S8sPaDdqP9O5EEtDks6oE+c8+1p40IF8YyxVrrj7+h3YEpK60mOHOSCe5R6eYE5W7s8iU9MUlNBZxqACzS41YBjLS5/JfzbkgsDhi7QjNzyZ+MGMRD75rIEcKKPOJQZMG2I1IHgV9zQU6t+SIYriXktCQ5OH2IGsLA5AGwxgKQ01PzLIMuH3QUUZDgEiN/3IFOS9CcH8Jo2pYOfvNnrGf6C/8hDgQ2FVnGVSzw3ceU0tM80cQEfyfpmyFim1cUfH9H7/ysavjl8PzHshvvlTeyFowDk18+NL1XzjyN94NCWjvzxgL9B6Uu1go/wsrRPKL2TGzbgBEMJ7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UArWovGkyY/QpFe2RCYWBUrzlLsbFBs/YnsnPkiHSyE=;
 b=lUxPf81jF5hMNkQCfh4CYeK6YMHKAjqx9xVqdr3siAbOinA0kGwHh6FU0pGjmbri6jddMNuI2YIyT5ksSgDfuRSTgBFGg4OMAuKgi84TyC/31SYALf5sw+IE26Wuo6XFmQ+Sx8eUn4hdKbWKYqmAd3k8RJ0aCynBNclwjzQszls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB12016.jpnprd01.prod.outlook.com (2603:1096:400:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:52:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:52:53 +0000
Message-ID: <873512uuxn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/38] ASoC: amd: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:52:52 +0000
X-ClientProxiedBy: TYCP286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB12016:EE_
X-MS-Office365-Filtering-Correlation-Id: 6992543f-6e14-48f5-06d6-08db92f2cd82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	stzOsNmRzLxnNfjnLGKZmQoBAe1dp8h7EhNe1eNhGFjR9s7BNxwxnQLNuhIgRI1tusjXyriJ1/0evVO95kOyeZlnrWHaGKgXI23vJwnCySDVZCaYrXwm1LNjt1omU1OrjvaHJAxsaPGlGFbE2F9Bob8Q6fGa3Vpyk8N9yvYiXO+EufJ6hqkrQc0OHeO42MDKkbwJi3K/OCkH3nCV5SJ6DqHhGlaN3VE1mT0V3PyYHoZSt6/Zta8pbJWVPF/ovnpFs3QjRenZPz9NDfZJpTytXjbqa82Wb9+sI6FpMoar60xFA0JYqWR7jqgJSZ+r2LtAiDaz1hfvaCFFXvARlDsKbwEVeDDpITag1iq2Iz5AKI156P2kJ0OuxEyba1rk1/57NafGhaJYqfEm3i8p4fl8F/cYsbAZseFtpjSwkr6iAscf42aq8wS+syKvWIbWCIC3lfKGWl6DVplfaK+EFo8JlyeiF31Ul6rMCPm8md8FZXAZ6xAj0D0oCeY3OrzkSU7RXpaWwjTrScZ4wB7YLZ8eseQs2IeOrglcEz2wgaNMoBMq+ROQEfj1vDKVX2gFXAt8YOj3fygKbWJDJU79o9A5th3+SFNv08JFz+SupghbVseRiE4HQ33BKIOUTSZ5iydq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(2906002)(5660300002)(2616005)(86362001)(478600001)(110136005)(38350700002)(38100700002)(316002)(6506007)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(6512007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jv/zX74nQS18LN7JNZcDcJnRQefDIGYL3ZbKU0pTX9InkvYfMuMIqv7ExhGi?=
 =?us-ascii?Q?1nTEUi4PCsMA6LZNKr7p8hXl4YDMU+izyGgzL4llgFV4hNgG+7biF1ndhs6l?=
 =?us-ascii?Q?MubKdN7yLBdFpBJhmKXaZfFMVgO2nwfemmWyWgDCPJvxX4szI4KP7KEqPyLw?=
 =?us-ascii?Q?jsCh6nFSH+Y1zh8oGNhwQc3OjtO0bIeX8Ru6CFMwvyvN7Qz7EyHx8ghVaMrF?=
 =?us-ascii?Q?2mHyXURvsXyiCjg6DbrbOSKWyV2ck9EnCIS56t47yiEMhE6gQYDq0R8vOPtj?=
 =?us-ascii?Q?fFemj5uBGkzyoaxnde2WvT+7SxuE9oIaOLc5vzd0bQe/A7M7TwWPHxdmJ5QE?=
 =?us-ascii?Q?RkJ+biph/gCPnstDTpGM/TtjznqIu2AVXcXCimC6dhMbfihM+7FBVr/RQQWo?=
 =?us-ascii?Q?YEGg1goznLGyBjeJ6Pz1e6UVnKxgeCWwA60wWkm4ar9PFWSYlhqSWw6mMIiK?=
 =?us-ascii?Q?dPRxfKSnbGpT0upyXI5l1SeLasrNQJ6d8NrG7nxV73MdGIKA/b8HiUbat9XK?=
 =?us-ascii?Q?UBxZ7opMIALKwLMobO7DMLb7+KW88RYPlxWlvKHRZre0foK2rkDzTDCPthwo?=
 =?us-ascii?Q?wYYQYPW6Y7l2kqNTTe/kRuljgt5JIMLruL6TQibwi7I4kk2NzC3l9y10p7As?=
 =?us-ascii?Q?oKSqyiUC2K5G2UOO7JjOOrrE0Covbn3KfmRQZ24tAjTt5fR7QCfvTWlWS8Cw?=
 =?us-ascii?Q?eWqMbpKX/Wp4aPNRkDygPoi23DU7zhxtMlt+/RM4B4F7qRqbWFxEcupXB4SS?=
 =?us-ascii?Q?8hq/Di8vsf66BYkJUdIV8hWaqedLaIAHUJQ8NqqZoKr/t7qlumKDV7m4rx0q?=
 =?us-ascii?Q?WTvQ2K7mfeFFLoM0LANzu/gQfQxpmDCyhVhdQz+tfw870FbvptbvCqF5Avai?=
 =?us-ascii?Q?3TtB7H2qB6nhva+yIAJ43F2rUmuGNgFSMZIeU6MlRWMdeWV6nYetPeovZ94c?=
 =?us-ascii?Q?eeibBLw/0l5+Km2wo1VyfwzqlEFzYMjKh9qEMZaH3Bcbdz4xcJcBpS/veoft?=
 =?us-ascii?Q?z9IK6CLu2SsRUX0idd0x303pwIXcWIk/gE4BYTYMG1woYigp9l7vJOiGwojA?=
 =?us-ascii?Q?+TqAjNRvqF7k6+r5v2eESrFVPW+nPGe2mIbRMCRNcTsCfVzAmEIHfQAtU6Kc?=
 =?us-ascii?Q?6YeXPnUv8CQCCPQSbAcXcgJGoJLaRe6ZusEtS2HEQ6OiU3/mgMTWKWXZzQ6l?=
 =?us-ascii?Q?iOTv0a3oSTYTq6eRRDD2dQAfKDEKzQbuQ8IacM5ZaYg4+nnElLh5LrWoVUT1?=
 =?us-ascii?Q?GI4f1jbsc2mkUEk6A5I4eql1iLaA4UgVSTWhnWSdMOdioxiZ2et5kwdAZ9Dq?=
 =?us-ascii?Q?55Nhb7XDSuzw8AyuIs9htZFZWDMXsBcBq7Ad39SFOdTWxq4wHruNW1+/cWso?=
 =?us-ascii?Q?3/wa+WiXd6CFo8zW82kGpbCfW/If8mmCtA0hxxf1T8TpsZOGaiz8sTiaJ28w?=
 =?us-ascii?Q?SL5aZ19vN2oj12xDCTbKv7MvMG1qzl4g008sBof9sm9mTCdD6zoMt1JF1X9J?=
 =?us-ascii?Q?xRL8XHI00xx3/GdjK8WrunRo+edBUqCWwl1r6RuSW8rNEh4L2WT36X6Al+to?=
 =?us-ascii?Q?SZKpubPoLWxDR28tYM3+X6mODi+TBmfxZ8InW2Z36+YZ89Azpp+9TR4E2M+0?=
 =?us-ascii?Q?SC8ogFnWZVyNhiUOZOQuRUs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6992543f-6e14-48f5-06d6-08db92f2cd82
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:52:53.1667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fJ8rtRkAe/B7W0MhvIrfo9SqljYO4NaHmP6dmX7LNLJ7384DmV33OP3gIZv8Tmr2XwtuX9SKGCt36t6VDRDSWn0KgB4U7KzTGCW/DGxSAC/b1EFowtRIbT78Nwa08Lnh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12016
Message-ID-Hash: YPXUOC73ISBLFRMLLNKWMQEG3WH75QGR
X-Message-ID-Hash: YPXUOC73ISBLFRMLLNKWMQEG3WH75QGR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPXUOC73ISBLFRMLLNKWMQEG3WH75QGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp/acp-i2s.c       | 24 ++++++++++++------------
 sound/soc/amd/acp/acp-rembrandt.c |  3 ---
 sound/soc/amd/acp/acp-renoir.c    |  2 --
 sound/soc/amd/acp/amd.h           |  1 -
 4 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 09dc5f2c0bfc..df350014966a 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -539,17 +539,7 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	return 0;
 }
 
-const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
-	.startup = acp_i2s_startup,
-	.hw_params = acp_i2s_hwparams,
-	.prepare = acp_i2s_prepare,
-	.trigger = acp_i2s_trigger,
-	.set_fmt = acp_i2s_set_fmt,
-	.set_tdm_slot = acp_i2s_set_tdm_slot,
-};
-EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, SND_SOC_ACP_COMMON);
-
-int asoc_acp_i2s_probe(struct snd_soc_dai *dai)
+static int acp_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
@@ -569,7 +559,17 @@ int asoc_acp_i2s_probe(struct snd_soc_dai *dai)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(asoc_acp_i2s_probe, SND_SOC_ACP_COMMON);
+
+const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
+	.probe		= acp_i2s_probe,
+	.startup	= acp_i2s_startup,
+	.hw_params	= acp_i2s_hwparams,
+	.prepare	= acp_i2s_prepare,
+	.trigger	= acp_i2s_trigger,
+	.set_fmt	= acp_i2s_set_fmt,
+	.set_tdm_slot	= acp_i2s_set_tdm_slot,
+};
+EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, SND_SOC_ACP_COMMON);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS(DRV_NAME);
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index cc8284f417c0..1bf7b2e68a11 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -98,7 +98,6 @@ static struct snd_soc_dai_driver acp_rmb_dai[] = {
 		.rate_max = 48000,
 	},
 	.ops = &asoc_acp_cpu_dai_ops,
-	.probe = &asoc_acp_i2s_probe,
 },
 {
 	.name = "acp-i2s-bt",
@@ -124,7 +123,6 @@ static struct snd_soc_dai_driver acp_rmb_dai[] = {
 		.rate_max = 48000,
 	},
 	.ops = &asoc_acp_cpu_dai_ops,
-	.probe = &asoc_acp_i2s_probe,
 },
 {
 	.name = "acp-i2s-hs",
@@ -150,7 +148,6 @@ static struct snd_soc_dai_driver acp_rmb_dai[] = {
 		.rate_max = 48000,
 	},
 	.ops = &asoc_acp_cpu_dai_ops,
-	.probe = &asoc_acp_i2s_probe,
 },
 {
 	.name = "acp-pdm-dmic",
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 1899658ab25d..54235cad9cc9 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -97,7 +97,6 @@ static struct snd_soc_dai_driver acp_renoir_dai[] = {
 		.rate_max = 48000,
 	},
 	.ops = &asoc_acp_cpu_dai_ops,
-	.probe = &asoc_acp_i2s_probe,
 },
 {
 	.name = "acp-i2s-bt",
@@ -123,7 +122,6 @@ static struct snd_soc_dai_driver acp_renoir_dai[] = {
 		.rate_max = 48000,
 	},
 	.ops = &asoc_acp_cpu_dai_ops,
-	.probe = &asoc_acp_i2s_probe,
 },
 {
 	.name = "acp-pdm-dmic",
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 2ebe2099cbb5..d6cfae6ec5f7 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -198,7 +198,6 @@ union acp_i2stdm_mstrclkgen {
 extern const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops;
 extern const struct snd_soc_dai_ops acp_dmic_dai_ops;
 
-int asoc_acp_i2s_probe(struct snd_soc_dai *dai);
 int acp_platform_register(struct device *dev);
 int acp_platform_unregister(struct device *dev);
 
-- 
2.25.1

