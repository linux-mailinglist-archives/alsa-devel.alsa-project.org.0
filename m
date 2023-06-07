Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF14727345
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 01:45:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3692E828;
	Thu,  8 Jun 2023 01:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3692E828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686181534;
	bh=E2eCwt7qkU7LdauJxH11BMjrQnn13YMQvX446QNbNsw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a397AP+mdpsrp93Pc68WyBG8c8OT/v/vhOdIjgYPCbBxuAf/yvHh0f/0c92FR3Q+q
	 nYD6ZXR8h+eBY6gjVXf8czSkauL9y2d/jRsI78aD7FynlezN7MI1o90xfi/AzPuAHx
	 tdSJRZAoaQZ6Rggpe+QqH7g7YbHNrvuhE/uv0I58=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0A78F80553; Thu,  8 Jun 2023 01:44:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88591F80548;
	Thu,  8 Jun 2023 01:44:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 568A0F80549; Thu,  8 Jun 2023 01:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C034AF800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 01:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C034AF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WVEQIplq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzJSYqq45nSsPsNKy7IbcC2gW0OZVSkwTMQxTlzzjG5LX8X4WjgZ+exR9bqFDY9M8MIIeAMeSZKnPWhZVm+wfRHoerySjZFwgMFi+SEMJehVLXtTQ5/wEJrrJuCO8JEhYPPje12QX+DG7dStGzcGgONRc4b80hnW9tV9tbVBLgp9tO69qRf707OKm/Lk5Iu+SsmodRRISb+r2dx4t8TIjDbZjh9HayUxdgMfZ/U2toaEp0ojK+/C06oQbmWDDcIwvgIkgy5LsJP3UIhFz0q9H9kbG0/S2LY2odOuwZMo5Ww6nfuI4LB5BJN413bxEC01/s8gv9/o1xVIlKa3J1bnpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2dDgWZ1lwZDbtLxyn0VkYXLlSbrymhX7dubZAyFH5A=;
 b=IIln2n+Pul4+DQKJ+dem1NLu6tIc9B2922JX0tg0wpBQyRdCGLfOsmpbV3JUNm9VM/aONYFy31gZkOPUqvEtFMQUKyHOUVj4DSppS8OtLzA8z7p4y5Ry+NIrkdpdHH2Fl0BGhsfiV2xXGwsLX/3Y2pStBvnAqjdV8aSltkf9tZx+ZCUshD4tQjSgXyXpVl8n4ISWSNzw53icVZHTNyELG5XI5zmbaWGQluusvXjR7AliWAvnnVukm0qPqLdyEJBVgflRnKEGdnTgMZnPNGdBUFm2SXXHSYFjF5aaSeRyDgUYz1ZdTTlyIGJJEktHzHwPRn4KmCiBxBuNo2WKOPcUGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2dDgWZ1lwZDbtLxyn0VkYXLlSbrymhX7dubZAyFH5A=;
 b=WVEQIplqzTNJnavzH3zeLBi4R5JC8QLU8jw4LVuuTWCodtDein713qAw4bRB3ezgMi2aoQ80rUyYSdtE4g13ZTo56eF6+dNkh1LdcKpxss5Wu1TU8x9vsJ316zAWlF6FveycK4HBqsb7GUjzpIyE7etPfi+bKXQIYDzX/OkjDR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11782.jpnprd01.prod.outlook.com (2603:1096:400:3fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 23:43:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 23:43:52 +0000
Message-ID: <873532hm8a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: add new trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
References: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 Jun 2023 23:43:52 +0000
X-ClientProxiedBy: TYCP286CA0320.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11782:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f6af5f-8082-4529-6f45-08db67b10cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	obfVjKcDzavgpVkdbjKapZSXtlUNg5/N6lvwmBomDGoEULrO0yYYHx/icv2l62qX44oBQq5MbuZ/MAOqqi+YjNY+JokFAzK5j3VBQIRS+7sgGtLNIrK2dVllSCBkgNZ0zVbGOrZHUtNjl8fVlv5EId7YiAXASlCbxwd0TNfgHVLOC7Mtw8FU7bnlb7BHaUFMweQUUW/1Yqxf0gRYcpm9/a35Iz4aoqc1uY3/clJeNXOJEFAgETj6LjBR2tcphgKQa6sWypbefKJ+tb+L59tdz107giY0kcEB85ZxvSg1ypl1N2QJXISaIrTsSn3iqLldYxJbZdzyJx8I2vgrQeY/EreBUjgBZrXA74/AIj6x+KFFaZb2FkU18EyW8BiyKm5SDSz+lgjDOp8zuMcahe8oiMEYinsb8M+56fDa7roTHpC7pSFW96727UI3rdqCsjBOGQLDTM3E5ZxznoNflOB6m75d7mke4MmmFHqw5+h6TGYjOQdOn7S6GJTzqmn7FW7t/S0lTQbLU675Cq56JaJA1NwDNel2jf0vjdXWKfg6niP4hr5Rd3lgHyRdWYjR/cdcMltqPL6Bg+M1sCz3ripJpFfigPrCJbTJGb/29hlW1P3x9rjkqt2gaSCNFh12NU8c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(4326008)(66556008)(66476007)(5660300002)(66946007)(316002)(41300700001)(110136005)(2906002)(478600001)(186003)(38100700002)(6512007)(26005)(6506007)(86362001)(38350700002)(52116002)(36756003)(6486002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sOUQt0Wzlip1OW2HQwpFbUBGnQO6Y5PJA1joneLKtgu/SKP8ZCXLohhFSqqw?=
 =?us-ascii?Q?jJ8IKyteerdnKZL4qhrdHF4wI1gPY9r0mBiogbabpRNK4qt3d93MZeX9TH7U?=
 =?us-ascii?Q?GPzREcmaL69CA1xqEFX2xQbSYPXApWy4/pc21ZccXJVaKxvW8RhxGK7J941P?=
 =?us-ascii?Q?OUgFxp+rCnRlxJ4xPlWOhcLy/ILyOXu+wXQLHMSSB3nzWWep6kMDpHCLEqS0?=
 =?us-ascii?Q?0QyxSPhbEhJGiV/KPfXoIvLzPusWzNL8N5hFPs0CpR68m4nq3RedOFlA6l2c?=
 =?us-ascii?Q?dwtpeap5ho9OpaykIwe/3W41RO24C3O3kXCw7L27w3ewP9tzYpGawTvQxTeo?=
 =?us-ascii?Q?2e1+N4kQ+IKRzh7VhbjLXKdSf50TyfBxE20cpb4rYW5m4gZxBSlKEfukiS/x?=
 =?us-ascii?Q?dyzFmaozrmCIDELslFBI9ZAvNSSl67mQ1+qTvJ7WUgaPDEoLdoRuN1JGNiTt?=
 =?us-ascii?Q?9jbTZI3FK0VzOPKGeMfAxzMn/MXUuZAtsSxXJfuBWdyQYKGuTe6Ymb/a7p6D?=
 =?us-ascii?Q?9UZV+O7nrzWBOP23yLwv6anWfiwGxzVJSTfLYht5G3hKLh+iUS5Bml2UH7Bi?=
 =?us-ascii?Q?7PbPBevDDo7g+Y16VEnNurO12W8nrIigkUKglAZ4i+UHPMs674CRjdNgJyaL?=
 =?us-ascii?Q?KbHTzTprKzMQtGEkw5fjXLsXlNKareGJeKR6g0XPPNICC1SGMpko/YbrSdnV?=
 =?us-ascii?Q?KyBnAffDKWTufKnQLp+/y+3LVxUSW3RFKLkJwIedev9atMPwNolI3aucuGHp?=
 =?us-ascii?Q?e9utoXrZ/YrZ+H/Dnqilb5/1AuOs5sKqtDN4LXB4ZciDIrkyAvuMbZ20l8Kp?=
 =?us-ascii?Q?ONfNdN8nSbOi/380PZLnIs//4tENhgScWItxpi+q0rJIrQzvg6V84SSqcc5D?=
 =?us-ascii?Q?1+WKwsgVBTA21XcSnAZFSNKQzGRXO89KCqGW5kGIi2PkwAU0tFzgQVznninw?=
 =?us-ascii?Q?3GjtX1wI2V49pQlfTNYD8/vEYPfGJbSuQU78p/+YsqJLHoQpGaZ99CueeAwA?=
 =?us-ascii?Q?++q4mza1g1lGb0iTNc15qYVxEBFGQGresGpyE9iGVonSG3mF2hZdt0gz8nBe?=
 =?us-ascii?Q?UfAK+/hP91DrAp5iLBk0A1xyBpYEA9hKhj5ThdowVnv1u0ya3DjG1umVyP3L?=
 =?us-ascii?Q?G9g4lQm/wy1kZCgkYQKozWqU+SgD5zDcfHta9Fjvd/vaQaNyuoHBcPZWOuNl?=
 =?us-ascii?Q?wA+exF222GwBoAPEPwU04zv49Ce6M93MyxB/HW0OR9NVAOpCzPvXee+lwkgH?=
 =?us-ascii?Q?tzYrqln2vOmxQ/o038w71wsmJ29VXALTgT59d31C+KvII2ru5sMnsNb7cpJt?=
 =?us-ascii?Q?COdc1mLTZMbOCwLK8Pv01lv7cpMwJBZ5YWC4SXgz7fNP8yOfOwaDflqtFPaC?=
 =?us-ascii?Q?5IUlmsCTHhAzxnT8Gycy28n9obPXNElxG+II+UCGBA2qy1Vk7s9BBu2t3QPF?=
 =?us-ascii?Q?9Jjcn0jjFgtwyWkIGfS2Vi3+voAa9KRIvSI5gTiNuOCEACPUxmMVdWD43o19?=
 =?us-ascii?Q?1ooUIs4JaLR2OOntiSrfq/SpoZQfOD9B9qyC5pDod+GTWDdo2TPXMMjvdNW1?=
 =?us-ascii?Q?0CxKOy3r7oRHd79xpuorlURRlKosbfbM613K/KIHR4JgbwBle5wprPuxvbA8?=
 =?us-ascii?Q?v8/S2nVXByvwY8uLBV1y68s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4f6af5f-8082-4529-6f45-08db67b10cc0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 23:43:52.5532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gK6MiFwT3ypOnYm2B3kHdLWljV1HeN4dzbXgu681Nmprx295rg7UH++sd1d/vat/civjgbhAaEUQocdoQs7NuRJkvKNGUTOJuf7jbMn5RVbIh59vHDzgGRRQNZb9Fkno
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11782
Message-ID-Hash: JA6G6QAZQARUTFBU2CWRPLF3QMK3TAUY
X-Message-ID-Hash: JA6G6QAZQARUTFBU2CWRPLF3QMK3TAUY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JA6G6QAZQARUTFBU2CWRPLF3QMK3TAUY/>
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
 sound/soc/soc-pcm.c           | 115 +++++++++++++++++++---------------
 3 files changed, 91 insertions(+), 50 deletions(-)

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
index f16402ee5a19..08b3cbd1754e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1071,49 +1071,78 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+#define TRIGGER_MAX 3
+const static
+int (*trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream, int cmd, int rollback) = {
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
@@ -1127,34 +1156,20 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
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

