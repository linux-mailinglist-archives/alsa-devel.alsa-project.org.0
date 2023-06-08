Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A765F7277CC
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 08:50:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 163E3825;
	Thu,  8 Jun 2023 08:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 163E3825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686207017;
	bh=o56TsGCDACQyHIZmaIXc0S8UsVez4bqhhWvEen4riz0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P+KidsjtGNxOabinMZBAYlEdqAnwvfTzNjQjbAonG4XiB71Vs691ddbROqhfIOlab
	 ZbAwWtOr14pFXXabIdM7T4s7OvVg9UlZE34UkpdoI3oWb3k5E2qJFEzEAm1SH1lzhu
	 3rRyM/M4sxyELAbE4sXchFrZW4pur8ekT9DeW3sg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C055DF80199; Thu,  8 Jun 2023 08:48:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B149F80548;
	Thu,  8 Jun 2023 08:48:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 806D3F80549; Thu,  8 Jun 2023 08:48:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E275DF80199
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 08:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E275DF80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Z8YO3fz7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEmhmvs9Z15UndEYAZ9naL3VK823sQP3hgCbwwRdjxHxh3zlMfXo9NPs5EF5cz1xpWd4AM+fgb55oYebw8B36WCzfEFeZD8676nscGN+XOBZ7yNMEEms/0yO1en/P2jF++nm3MwLOgymaaDqh+GXSXnrGVgkZ582WVNYylr+YyS364O0TMBR3qoCFd//OczmVdxBR8IeKVzs2IJ8ofrbrXS3Lm4Xc6ENnEhjiXRce9vtcZmgFo5HDubQdFdG3NHfM8BfdtbckuKSzEzfGI9WQFhWpTb6FGY5EhRPuOyFIede04SuIoRmpLmNb17bmoMSjmKeYYfUTMs5ORXEZkQj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fpPMhbpfYxZQ5lm+Ei3wce4ynDM/kshsQrMsmX28wE=;
 b=WGCOz6WOGyS77acD6ZpKUGyu4tNqP2U2JCjuTkWP4YDOWZaRxwxsXkYkAFz9ejGwPf2WGnFte9BChA1t3EcLN2lX2ASNGm7Y0AxBR7zqMm77hTkdRTszOzkUCh0BdW3JEUc3BW4lqJARozeUJkK+4pYkeDisHKpQF/uR21xR3gCD7Rf56UTSIzYYWzWv4/3W4tswwMdkJdOHvP2+2mH/sXuUgVwl7sLx9WTAJiYvxFjMBia1oFzu7pPdush9Za5IPXGeGUTrmEQY+58dZAiBUQLHgmlhi4yEqqCR5XhhOSI+zHSnYcsJrV/+LhIBGjjUtU6n/S7rboaS/h36EbTeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fpPMhbpfYxZQ5lm+Ei3wce4ynDM/kshsQrMsmX28wE=;
 b=Z8YO3fz7iWS47lHSG2ekOUZjEZln3Eo6vEzgLfj7IM3oC5118YLubOFk9hRNQHrA9DQnce02lXIrSBn5VP/2UGn3ifLwNpvPVRSm33BQeFCFafXyEtRlZy7MVYYugyI9eoNw+ZwlexBePTJaQZNmwXLNANG6JdopSvQco77lYHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9300.jpnprd01.prod.outlook.com (2603:1096:604:1cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 06:48:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:48:36 +0000
Message-ID: <87r0qmfnzx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/5] ASoC: add new trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Jun 2023 06:48:36 +0000
X-ClientProxiedBy: TYCP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: ca897499-5954-413f-2996-08db67ec62a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sxb1gcj8VHIZAzvrzsiOc0o9ifFuw/yHDP5bleMwc71zbH1C6aYU8+3NZVQydQXun5bQf1Bdzdy5yc3KtlOEr8Jt/WgT6j5kyaAa3fVUiIQdZnEi9vNKzFhzkm3XsgLsuFrgkH4P/APuiEEZIt30K3C7MnDx4N5B0tIoJrUv3/ZZbCiPYqQlPLfR+1I4esKqtLW7idqTKHut8//PrAy7Ixn6xedD8WjreVVIqCEKgFFyL1xs11anavamSV+6Tgaf+oATfsaNr5lvY86lhucVilpc4tQ29Gs9eoDJ3kUhUn5SDxsv8FI/bPPD9PL5SVoC/FQkjfsVRuaR7aYcoCBJQP8gZsho7g2G99W6Rt/FMyoZItJ51CPXBl8suAYtD/AIjRBdV24upeHq+QFCux+y6tctfIaaFPqOihKWgDAmZPbLi9b4ZKciwZKrA0GBJOMSSH5Q+J1jKsGHsQQl43kCW/am5iCIQ+x6BqfJHfZubxePTDLEfqgQRdz/wU3asMg+NcvKUqs4t7BMBfZ+h2TTnjk5lvPbbhhC3dy2YJR3g/y6i7aIKABGW0EVZ4AvaIRPRsfV0MDh0jnunpnDD9sg1AbgvSiErVxon5r6qKUWFpRO+8Qk4oT96cv5inwm4QuY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(41300700001)(8676002)(4326008)(66556008)(66476007)(8936002)(66946007)(110136005)(5660300002)(316002)(2906002)(478600001)(38100700002)(6512007)(6506007)(86362001)(26005)(38350700002)(186003)(36756003)(52116002)(6486002)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9TT1MnkSSa7tcrIIWMWYYhK9pLIMfXZiJDQW6+hcHq9FeMx5TD5MCdlhydmn?=
 =?us-ascii?Q?vrNUMQ8AYjoYA1l6oqF7TfGoxABZtHccBUls0IIkDOt2EFTdYoXxOtX50vYR?=
 =?us-ascii?Q?vvoJXZDjjtt3kYb6KxGDF8Cfw/8CCZRWp7fWQoUNTzDeIRGwV9KuhAJZlhvG?=
 =?us-ascii?Q?ZeOFW9qXr1/wZJyfXpViAZ8mNe4f4jGhAKH2SYgfLooLUKNoRvJ44A4XJh2Y?=
 =?us-ascii?Q?uehI9w0B9xGfw0457ZMWU+83FcGpaU/lm3hwoGASPNwIFzRdIKuzLFvbTQiy?=
 =?us-ascii?Q?mYwlwkpyB/Yr/JtUeW6VWxEsfwyXjeDePKp9KAju0SfvQpzD4mGkgWm5/XE6?=
 =?us-ascii?Q?AWt+lVhZoeYhr9QKqq+5aRH4AcDvIPbrdkMZaLsIB+f/4QdM3fVCQu1gy2ET?=
 =?us-ascii?Q?3VfaxTXrydFsY91KLPNKRFzEogGIxbvcmTZy8RhfNju5mWifZUgoE9XlyTEo?=
 =?us-ascii?Q?nHdURtOtuLvqYK3ppkrTR0vhvhUiAxM/aLS+3SBPrw1XYYsGdKtlN69v7gi8?=
 =?us-ascii?Q?kRyGueqyxwEyNt+VNfzW5i40gNiVhBHvzTbsC3kBXSBFPU0qvwzqGDbWfS4L?=
 =?us-ascii?Q?jSTpL21+1x5q4OIJmuwQX6a7z3srIQkhOKhSj+CJZXdQS8wTCLdshYG6C5jL?=
 =?us-ascii?Q?1WjJ4vNiVQMsTpdIfiF9kaRId0b55UkdveMj2sLYuAxa19Vfij1gOecIHI8u?=
 =?us-ascii?Q?P9RmMUoP1NJOLa8V1SGjFjJiYQ9X47HIhXIApiji9OfGS3ea+s6g/SV0HbU5?=
 =?us-ascii?Q?0JXhU59ZXyH5m/UmPMWHFqlS5V/KGAG8CGOz660UlppPG9VydIo79mMBUPul?=
 =?us-ascii?Q?v1S0qprelL0eMS+9qrMETrWhksiqjKn8CeiKSByanxnV/pXIKpFW9Axo1dDA?=
 =?us-ascii?Q?SNyyLXjRky5cmzicfPFRCkZLPNA1MvspZW+z7tnXRqOeqG2ViUxEMdoXLEv2?=
 =?us-ascii?Q?d59+KbyrT/0ryGfKr07NGABkzHoUwAa8ADA7MjL0vf0Mc4jZvMrEYeIygOOw?=
 =?us-ascii?Q?wuXE1okM3L51lFOutVdE8eBqURSExBDpGdSPH/O5rX3Jl5Zq5SGAhP2nEWg1?=
 =?us-ascii?Q?lTRCUoPdNVBSXTw4A6hKojCMll0Y4p1l4XAXKQKX9W+Gup6KJQ6/ot0N0N61?=
 =?us-ascii?Q?OYA6T0vBcet8nq8dRpmGqSeZsYkDDqkp2cm6aMRFaiWsuicaq6hvDyJ/i9SS?=
 =?us-ascii?Q?XMlacUDg4bKNy0kzAwFEap13S+W6ybkSLCx9RyPoM62FYP/P/uZ9YOFKio4o?=
 =?us-ascii?Q?gDQYllB78xHAm0URQFFtMAFevoEiI6oC0pCk/UySgUdDZ7+M0IhC2f3rKWo2?=
 =?us-ascii?Q?ODhylHtQuSsWnfmWhEFulkg/8Jrd33VBmqEyZ5FNA7Mt2SIr+ImXy+ksESbr?=
 =?us-ascii?Q?bbG4sa7tLYMURdhU25hxl8Y7bwGWvFUGAJAlZcFpQw4pssixvoE5z2dLCOeH?=
 =?us-ascii?Q?LD2qeCmGO0FDrY9U/+hglrGdQoEtaQHwy6+upxNaTtKcYSlwG1fijH7q96Yt?=
 =?us-ascii?Q?7ggzLKFHN+m4lqJyWfIazs6hB28iGYH++t4g4A6BTMrveIRb1jG9Fh3bMiqS?=
 =?us-ascii?Q?BPlUiWkMft0aR4ZgMGGdyO/ydOnLaOMzaJOojKIO0y0AsgyS3O/0xrrCoAGH?=
 =?us-ascii?Q?zwM93TI1DV6HWWmQF7knbLk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca897499-5954-413f-2996-08db67ec62a2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:48:36.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9eXx6S79FdXyHbMUm4/nEwm52wmV77MhTRR+vQ7ktHWNv7YH1t6tJ7HNzQJ+xzUVxbVL6KPd46JLgpXQFtHHggyysLXYbwNivw+A/CTXs7TMRlTtdkpblr7WMt7wsens
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9300
Message-ID-Hash: FSADGP2VWGYE2GENPVA3XFW4ANCDV4OQ
X-Message-ID-Hash: FSADGP2VWGYE2GENPVA3XFW4ANCDV4OQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSADGP2VWGYE2GENPVA3XFW4ANCDV4OQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC is assuming that trigger starting order is
Link -> Component -> DAI as default, and its reverse order for stopping.
But some Driver / Card want to reorder it for some reasons.
We have such flags, but is unbalance like below.

	struct snd_soc_component_driver	:: start_dma_last
	struct snd_soc_dai_link		:: stop_dma_first

We want to have more flexible, and more generic method.
This patch adds new snd_soc_trigger_order for start/stop at
component / DAI-link.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |   9 +++
 include/sound/soc.h           |  17 +++++
 sound/soc/soc-pcm.c           | 114 +++++++++++++++++++---------------
 3 files changed, 90 insertions(+), 50 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0b47603c9db2..c7733382757b 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -158,6 +158,15 @@ struct snd_soc_component_driver {
 	int probe_order;
 	int remove_order;
 
+	/*
+	 * soc_pcm_trigger() start/stop sequence.
+	 * see also
+	 *	snd_soc_dai_link
+	 *	soc_pcm_trigger()
+	 */
+	enum snd_soc_trigger_order trigger_start;
+	enum snd_soc_trigger_order trigger_stop;
+
 	/*
 	 * signal if the module handling the component should not be removed
 	 * if a pcm is open. Setting this would prevent the module
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 10e4ea0664af..49442583d46d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -607,6 +607,14 @@ int snd_soc_get_strobe(struct snd_kcontrol *kcontrol,
 int snd_soc_put_strobe(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 
+enum snd_soc_trigger_order {
+						/* start			stop		     */
+	SND_SOC_TRIGGER_ORDER_DEFAULT	= 0,	/* Link->Component->DAI		DAI->Component->Link */
+	SND_SOC_TRIGGER_ORDER_LDC,		/* Link->DAI->Component		Component->DAI->Link */
+
+	SND_SOC_TRIGGER_ORDER_MAX,
+};
+
 /* SoC PCM stream information */
 struct snd_soc_pcm_stream {
 	const char *stream_name;
@@ -707,6 +715,15 @@ struct snd_soc_dai_link {
 	const struct snd_soc_ops *ops;
 	const struct snd_soc_compr_ops *compr_ops;
 
+	/*
+	 * soc_pcm_trigger() start/stop sequence.
+	 * see also
+	 *	snd_soc_component_driver
+	 *	soc_pcm_trigger()
+	 */
+	enum snd_soc_trigger_order trigger_start;
+	enum snd_soc_trigger_order trigger_stop;
+
 	/* Mark this pcm with non atomic ops */
 	unsigned int nonatomic:1;
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index f16402ee5a19..40a75b3d0e9e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1071,49 +1071,77 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+#define TRIGGER_MAX 3
+static int (* const trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream, int cmd, int rollback) = {
+	[SND_SOC_TRIGGER_ORDER_DEFAULT] = {
+		snd_soc_link_trigger,
+		snd_soc_pcm_component_trigger,
+		snd_soc_pcm_dai_trigger,
+	},
+	[SND_SOC_TRIGGER_ORDER_LDC] = {
+		snd_soc_link_trigger,
+		snd_soc_pcm_dai_trigger,
+		snd_soc_pcm_component_trigger,
+	},
+};
+
 static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
-	int ret = -EINVAL, _ret = 0, start_dma_last = 0, i;
+	int ret = 0, r = 0, i;
 	int rollback = 0;
+	int start = 0, stop = 0;
 
+	/*
+	 * select START/STOP sequence
+	 */
+	for_each_rtd_components(rtd, i, component) {
+		if (component->driver->trigger_start)
+			start = component->driver->trigger_start;
+		if (component->driver->trigger_stop)
+			stop = component->driver->trigger_stop;
+	}
+	if (rtd->dai_link->trigger_start)
+		start = rtd->dai_link->trigger_start;
+	if (rtd->dai_link->trigger_stop)
+		stop  = rtd->dai_link->trigger_stop;
+
+	if (start < 0 || start >= SND_SOC_TRIGGER_ORDER_MAX ||
+	    stop  < 0 || stop  >= SND_SOC_TRIGGER_ORDER_MAX)
+		return -EINVAL;
+
+	/* REMOVE ME */
+	for_each_rtd_components(rtd, i, component) {
+		if (component->driver->start_dma_last) {
+			start = SND_SOC_TRIGGER_ORDER_LDC;
+			break;
+		}
+	}
+	if (rtd->dai_link->stop_dma_first)
+		stop = SND_SOC_TRIGGER_ORDER_LDC;
+
+	/*
+	 * START
+	 */
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		/* Do we need to start dma last? */
-		for_each_rtd_components(rtd, i, component) {
-			if (component->driver->start_dma_last) {
-				start_dma_last = 1;
+		for (i = 0; i < TRIGGER_MAX; i++) {
+			r = trigger[start][i](substream, cmd, 0);
+			if (r < 0)
 				break;
-			}
-		}
-
-		ret = snd_soc_link_trigger(substream, cmd, 0);
-		if (ret < 0)
-			goto start_err;
-
-		if (start_dma_last) {
-			ret = snd_soc_pcm_dai_trigger(substream, cmd, 0);
-			if (ret < 0)
-				goto start_err;
-
-			ret = snd_soc_pcm_component_trigger(substream, cmd, 0);
-		} else {
-			ret = snd_soc_pcm_component_trigger(substream, cmd, 0);
-			if (ret < 0)
-				goto start_err;
-
-			ret = snd_soc_pcm_dai_trigger(substream, cmd, 0);
 		}
-start_err:
-		if (ret < 0)
-			rollback = 1;
 	}
 
-	if (rollback) {
-		_ret = ret;
+	/*
+	 * Rollback if START failed
+	 * find correspond STOP command
+	 */
+	if (r < 0) {
+		rollback = 1;
+		ret = r;
 		switch (cmd) {
 		case SNDRV_PCM_TRIGGER_START:
 			cmd = SNDRV_PCM_TRIGGER_STOP;
@@ -1127,34 +1155,20 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		}
 	}
 
+	/*
+	 * STOP
+	 */
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (rtd->dai_link->stop_dma_first) {
-			ret = snd_soc_pcm_component_trigger(substream, cmd, rollback);
-			if (ret < 0)
-				break;
-
-			ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
-			if (ret < 0)
-				break;
-		} else {
-			ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
-			if (ret < 0)
-				break;
-
-			ret = snd_soc_pcm_component_trigger(substream, cmd, rollback);
-			if (ret < 0)
-				break;
+		for (i = TRIGGER_MAX; i > 0; i--) {
+			r = trigger[stop][i - 1](substream, cmd, rollback);
+			if (r < 0)
+				ret = r;
 		}
-		ret = snd_soc_link_trigger(substream, cmd, rollback);
-		break;
 	}
 
-	if (_ret)
-		ret = _ret;
-
 	return ret;
 }
 
-- 
2.25.1

