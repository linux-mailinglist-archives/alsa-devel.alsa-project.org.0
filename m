Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FCF89CF09
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 01:43:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50AB827A8;
	Tue,  9 Apr 2024 01:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50AB827A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712619804;
	bh=p8Cf++9r0RALugUXRoV7NtIWOs+okJdCzCnb/VCAAMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQS9M7rjxkiLMTqRkORq6CdA6gcycWsCVTFdeoOiaIrkwkOK0xqUmDyHb2Y3j6u50
	 D8R6VYDcc3AXgZhsrSJE0YDt7+SaqqrE60SHdSuIy320ta0atGr0OVHEQBYoX02hBn
	 EM+5Eke67/44NJlcgwN9Do0JmlJUCZ1WgEWdXhYs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D96CF805AE; Tue,  9 Apr 2024 01:42:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2658EF8057F;
	Tue,  9 Apr 2024 01:42:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D0D9F8026D; Tue,  9 Apr 2024 01:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41C5AF800C9
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 01:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41C5AF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TruZFrtP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFblZY4n564XnChTsSXzynCGs1npnzcMB95z36PHh0M/WM94GmzCn2GZByF8I5ny3Z4SuDFOZ8WBayqEMcXh9dx8w+qHs2V2ZzyGeyiLbAQ5eMwJ4vTfl0Mv9X9LQSLK80v+ROAcNxwjHfKIE7I05yQxwDIVp8HnChWysy97RK1OvExSMAhSsvvYe/tCdz0skL+EfURlFH29lg6zNCUVvc2cJzbg5UgjZoiI5dYCuaBlGDk3W6y1k/ud4Vg2U1lREFNxDaIGZeDXyH31k3ayMID3KF+RuDqBC+AFM7za1V1xXnnWSKaFlTCSseAiZ5asjQs4fo6EFEmhs6wYvoHR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5TdME1jhfzx7nCDeEi8jVtlcjWvi9Y86c2QpOHRFjA=;
 b=GcSxs6Lij95ZMEfUBx5D6Dw2WRAv9MsQ5lhOOh2QGeaNeSVZiw4H4cJWdCiBAkIroqiJ3QBtaZQB5OvHZH+k0dHVYANjQ7eU825VLfyT3TlfDi8HuwX7mWbDehfskPSt2vUY2/QTutKKBySUzbAh0nAHb/QOUc1B4ox+ES7qV3olOkNoYk8QiAGKc7V8AA1qFmCVyDRNNVnimOJ7RQT5ptUIPy6aovBoVLW3uQTmLJwmx49N9NBVMW9pWMqome4HHx9xYyvaZFTqEdJ6c/A3CSGV+fMDZDMu810aXy6R6/ZyI+Zb3kGOY25QGug7V0Pm2FBVFt/RFxhvktMkWJKgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5TdME1jhfzx7nCDeEi8jVtlcjWvi9Y86c2QpOHRFjA=;
 b=TruZFrtPMJWTaDs/DtK3wRzfhme0SbgIT5OSSUsryNNutiMTM2vORZFlVKR+5y7+iWKP1+195IOOnYhQNv5cdI1ip+kCf3hC0hjEUtNmWK3/OU3adTWCUeCrTqLwIkhglPyZ7pteQCELxPgC6wFLNt9+qLQYDfsiBAXQQARBmeo=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6995.jpnprd01.prod.outlook.com
 (2603:1096:400:be::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 8 Apr
 2024 23:42:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 8 Apr 2024
 23:42:26 +0000
Message-ID: <87h6gb4e1q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup
 soc_get_playback_capture()
In-Reply-To: <acf98b6b-7c18-4f1e-ab8f-039c88679ab9@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
	<b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
	<87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
	<600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
	<874jch99m5.wl-kuninori.morimoto.gx@renesas.com>
	<40e23972-6745-48e2-81ae-4b93f2ee2dcc@linux.intel.com>
	<875xwwr60a.wl-kuninori.morimoto.gx@renesas.com>
	<87sezwecf1.wl-kuninori.morimoto.gx@renesas.com>
	<acf98b6b-7c18-4f1e-ab8f-039c88679ab9@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Apr 2024 23:42:26 +0000
X-ClientProxiedBy: TYCP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6995:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	32/yUpmjyU5V3ENXaXduESW3QOx6Ez+lIvQyTTCOJ6xGYHYov21hm7zJe7YxrbVJT1/fpU6ZR4QWIR4bClmclLM8SBTMcRIa//m1JxsvSoV320bF56yN0Fm7UVytxxYS6Be/NFXRPCHRTQkhs2yyGb08dY3kFVg8YMBggsOwgq7pWR9JYcn4aZykflpndh5bdE20tcos0PE0iveO5k4ZKZPc28dC5rwpCWeWEhiBRNOE16QFHxcAkjCNl5Hn5mRtIYvNIigFXblVBSNd3rzWZp9x4b1JUqSlFAHWMzHnf8jSl82ADfSPw/EaTMv3p+kvQKnKPhrCO2xJx4qlMQej41poTEg/8cAUYjQQYW513ZjCugG2YUWhrxZ/Ro2m8gDI8Pq8bpSLToB47dINSGml+2PG3g0tNJllz0Li3F/yMstkaF761GV3ejO8i4sdIFAgzmWSvU62A4iiRquCLFdgQWD+vNEtZOyjjxQHHCsrc6TABHQBRm5JUGC1HeXsn/D6qm/Ob1Jd2FthjEDWSbLuFQVPgtu4ILkgf6xkmdA8XfQoTc57b4IqYGLesbyJ7B97YG4gDbeyp07DKyPM6PHagfqOacY/TgCGMrm9e31dKwMLcZE+6qud4e1PpPlgco/8DcR9HOFocNc3cti4ZmXkzjaXTg9TVW38NyNOHNIBmgn1QL8WfzavZC3VT3JfBP89kzHGMqKWC31kGjIG87GwFNEMxp9Rv4eiGOnbDSaQdSM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(7416005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d2Q4I0spbGvOt7PtEG+6rGC2gpksZwqVJfSCFJ67vajJ93DMrs7INciQlflL?=
 =?us-ascii?Q?N712az01EYyZqvRLkAqMh+3Pi52lMDYYsoRQRa1qloQlRYgqjM7DT4OxgDzP?=
 =?us-ascii?Q?RdX2XMBE6PVgfgopeUwixhSZjjlEX6HHQqAGTuUJIKaNlfBWXI7C7WWrAp5C?=
 =?us-ascii?Q?XTdp+OhHBTi4P6Haqn3G3rk6f2ZJ14Am9GsNScZEf9uI8gqhF1c6djZwXh4l?=
 =?us-ascii?Q?RxpqrttHslwSECzmcuQWPYhSxDHKWDczz2rUFKe53idKNHWtrFCZvr32C/pX?=
 =?us-ascii?Q?Ga1Z+Zr7eHlA9OqCiTu7ggkrWzpm9XZVKdS7OBjKzSZrKh2ZUad+B1LFc8sW?=
 =?us-ascii?Q?njN+/1uiiHsDDC0KsEeXPmmmvxw0xH9YNGmBTzEW9D/ajJA+KZwTzilyvUuL?=
 =?us-ascii?Q?ukmklty0ohzzcBVC3B/kDuHuUB0cjcVpYG+CN+1voppyH7Zi8/vNI9HSoDuo?=
 =?us-ascii?Q?/ek9f3pR8ncsLGprkK4P+I3C2j5ZT86c0eitb60BIBroXXSCVTSkNvt329qQ?=
 =?us-ascii?Q?7xtHADHuIW0tF19eOLubERUekCt4ta6A4mf6bwe9QAUC9M53zvLgGbPpOewp?=
 =?us-ascii?Q?qdZ1zUP7bf7NHijTtRVuzVKTW7orrBeJz435xQDfpjYpmz1eLCfG0Ok0qsjp?=
 =?us-ascii?Q?+DfI4xZuY0/EwGTB9X53MBmxYGrZX42P3O26PODLAxNaL0nUP8q5kHcnibXG?=
 =?us-ascii?Q?OX+u/KA5b8RIsD5RB4vqZVlmtOYym95BsvN0CdiByTDF2IQHWSrcVOdlnFSW?=
 =?us-ascii?Q?/xwtdOgTl8iD6AUeH1JGyVoRdWb95xzS36llFtm5AaZRQumUvidPD1cm1nlT?=
 =?us-ascii?Q?Cav4ukyl0jIs1M0wJSO4KNsayWKJtkqfImnWQAkK55xHI9jof6Q4Uq9mKjgE?=
 =?us-ascii?Q?uLqm+/jYoy2pN1bM7ILtjRJz9Ka0hjn0TxQtF+amiLGRbQwQUPWuG6t5g5zS?=
 =?us-ascii?Q?lQoD4CdK+gaUl/48h8Jd7kuuxT8x+klk4DEm27vTIRgMIErifU+4P9G6tjuc?=
 =?us-ascii?Q?uQ6Z7p1Os26P4e52T509VzhhP/M48nsUI77c6k8Ek7rsVmfpnxy2M+La/OEr?=
 =?us-ascii?Q?5HeaTMkUrQB1hip/0fpoWPUb1Ch4X0Vlt0Q6CXu+ZfPhkgjgxxqSRMg1hnp/?=
 =?us-ascii?Q?Nft3i37djwSRx2nNqDKL0wjjxYzWWyPzYghFK7XtOufF+uEizAGo3OBIDv12?=
 =?us-ascii?Q?a6FF6Bykqvz1Oxc0+iho/JmqOzn3LRpXBosuvhFgZE9xNYMA0XW4UWBLzuzW?=
 =?us-ascii?Q?2xl5yEd3dRk+debLi5CZYcfVynGxHtxhKO4rC0I9h3p9/qpAs2fuJ6dAcqSu?=
 =?us-ascii?Q?oMAJabUb9rCd/ygQxiIMtpTz6G16mqUfGWwG+rsF6gAo/O/FIo49VcenirV6?=
 =?us-ascii?Q?rZF2bff+dqBUmQfNC5w7ro3Di6SOtEYbOQw0sFUjpfjtHUQO4NFGkT9tiTOK?=
 =?us-ascii?Q?9fwi9f97/LCAMbbbkJpmkBxwY8Ttp9yZoDaZnAUVRTu/Rs41qjfp6Fs71D/S?=
 =?us-ascii?Q?yxO9deTUsTM6BuqY36Rt7b575jnTgar4ga9jvZFsO0zbPZix8KDnIWP4E5d0?=
 =?us-ascii?Q?7LoqqX8u01DCwy3tQNPkc6vbip4RlMoscW05zF4gYdzuUpo6qQ3EvvMy16S2?=
 =?us-ascii?Q?MPTCTj09b2l+2bjx1a58cjg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1059eca0-fb60-4be4-bc3c-08dc58258bd6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 23:42:26.3939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F5Rb3Ug3uh36DRdMbMuePc6J5okLykBFuuFrNWZMJHdQchrwrVwF5Gs/p1w+ZVPjoN4vMaN+UDS65uhigxQa/cyx+8LzQ2dXxBYBAG9lznrO6IbwF3D4e3LkoWjKXtUF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6995
Message-ID-Hash: 4O3MJRE2OBFSI2F2ONJCSTJUQ6ST2IJP
X-Message-ID-Hash: 4O3MJRE2OBFSI2F2ONJCSTJUQ6ST2IJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4O3MJRE2OBFSI2F2ONJCSTJUQ6ST2IJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

Thank you for your feedback

> The code looks fine, but what are we trying to achieve?
> I thought the idea was to have a single field at the dailink, and with
> the example above we would still have two - just like today.
> This looks like a lot of code churn in many drivers for limited
> benefits. Or I am missing something?

Yeah.
Main purpose of this patch-set is cleanup soc-pcm code which is
very complex today.

After sending mail, I noticed that xxx_only flag can be merged
into new xxx_assertion flag. For example "playback_only" means
it must playback available.

One note here is that xxx_assertion flag is not mandatory

	dpcm_playback -> playabck_assertion = 1

	dpcm_capture  -> capture_assertion  = 1

	playback_only -> playback_assertion = 1
	                 capture_assertion  = 0

	capture_only  -> playback_assertion = 0
	                 capture_assertion  = 1

	/*
	 * Assertion check
	 *
	 * xxx_assertion flag is not mandatory
	 */
	if (dai_link->playback_assertion) {
		if (!has_playback) {
			dev_err(rtd->dev, ...);
			return -EINVAL;
		}
		/* makes it plyaback only */
		if (!dai_link->capture_assertion)
			has_capture = 0;
	}
	if (dai_link->capture_assertion) {
		if (!has_capture) {
			dev_err(rtd->dev, ...);
			return -EINVAL;
		}
		/* makes it capture only */
		if (!dai_link->playback_assertion)
			has_playback = 0;
	}

	/*
	 * Detect Mismatch
	 */
	if (!has_playback && !has_capture) {
		dev_err(rtd->dev, ...);
		return -EINVAL;
	}


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
