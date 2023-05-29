Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 905B8714172
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B49D206;
	Mon, 29 May 2023 03:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B49D206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322218;
	bh=wfLehvedU0NPILE+pG+bh/jihKWk7aQPjrsSGiUumPk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Wi/V7/bOnsyQfjDWLREPckw8OF8VhuFyvh11RRThCyYD1/t7EhaHmNbH6WRINNBrJ
	 vgP439TU2rtvlgfdZxfx1g/482VfYbrGie2yXPnsMat7m1lWPqTPZJbAvSc5CPwqqp
	 woLMv7HRkKeWiaHoWSBt1MmrHPOlMVXsaeXLZ0Lo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC20BF804FC; Mon, 29 May 2023 03:02:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA53F8026A;
	Mon, 29 May 2023 03:02:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 744B0F8042F; Mon, 29 May 2023 03:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2EAFF80086
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2EAFF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=K7VrVss+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjW1jgw8KgmOuOjUdiGFWlgqPclXbt3z6tV7z6KmbYZhJyZp+e/CRRUA8xhRBbyAfy7sYdIdGr1krEDa7oyDBsBmOKWPKNMp4PqLOYXZyNs9VHY69E27JdBlXVd6wqqy7mfZEoJ1/Ic3NOixZT0I1c3680INTxshTreoR4H4Eg/Y0SXLucDpPFQR5Bexby5TFE3BJTw/3NBj2HmWmotzlE1H2e28ven9zeBqWMJCHb0VP3Rk1Xnr7BXzOf/ZQ1cJLfAy3jhVurtKHhZMyIC4xHCF4p+/UC93/KfAN62co0XVqg2z2/XVr+jy+mU2nGKB7D7/3ucZV0sv2AIQYASZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TklTFzZJyf+cHJY5IMqrBfJ+qhmIV34JoYwycJiHX8=;
 b=R38MhQ3diq74UYnsICmBQO1BUVS0CFE/8Ea2/pn2XWR98ARAUqupZtgbTGUDIqFp7XLTWwoAM4FeMDYdNSQ+E81FqBllcx4hyQRSQo1J+2Je4/FPmD4OIdfYrbyHUjyWVa/v+q1WXMUzKLPKf5dLNkzWk5a4JJXf/PgmbgPhtJcE13+yutHHSobt2r2pN6/Cd/F1vh+bzjdVPMFh3jqrTsKItEMgAdFZRyXV4NKJaiegsbXfeRdAq2kVFbkOMMDAa4xm/yrCzdDkPnTWzy9EuIlZ+bckwbsW3KdWvg0dSKE6H+j92bhrOpuzQU4S8h0HddzCRQKWYfn+TPe/xyk9Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TklTFzZJyf+cHJY5IMqrBfJ+qhmIV34JoYwycJiHX8=;
 b=K7VrVss+C6E8nYhlBCkkitZRjjpMWdVMrEfLA95Iysp1a+Clz6AWzYQnmK3BTZrzG9TWkr8+NBKoAIqZy48C7j24NYey+vJRiYaopviRtJx/avLmJ1yD3Nf/WTBAdwy2xluO99RfS7rZbE7nfvrgn3UeYT9/0AYTmbIbWMLfWvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11557.jpnprd01.prod.outlook.com (2603:1096:400:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:02:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:02:17 +0000
Message-ID: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, =?ISO-8859-1?Q?=22N=C3=ADcolas_F?=
 =?ISO-8859-1?Q?=2E_R=2E_A=2E_Prado=22?= <nfraprado@collabora.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, "chunxu.li" <chunxu.li@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
 Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>, Wang Yufen
 <wangyufen@huawei.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v3 00/21] ASoC: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:02:17 +0000
X-ClientProxiedBy: TYCPR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:405:3::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: aa645bc9-d8ef-40d7-f134-08db5fe05932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UA64++7+JkaUc3ZZ2JdcwN0cbqn9DYDk0Wi45Cny1ce3ETIDk4TXg61Hs6aD5zPtotpYnJVauYI/6P/hyq3e73+ps1arUNTk9I445+ZSUEhOdJVM08jPi02R2TcTTlFqNb3Cjh04jUnLpCbIYL1bdoPZ8KbF4rtYDr5420zTZDk+w8J2PxvoYe3hLO5V4Xh8jbsgRjEcHnvgW5sKSGX9rmyjNzBsl2rvmGx8q7u7x6SXmmfwRzQeuL2NDSXz5yLP7INmsL6/2iWre28+OsHfalXxokKBgc1ItFTIgVw0kqNLOaDT+gA2mxPg0XTDG3gVzLQe/Au7IgzcKC9q+JEFsBGX8iybKn+R9p1nsCsYC9si4fQnOquKVOOpx9e8rmUfKwoKUkvHfqBM4WAN9kGJB9gaRRlZ5KoKXeJgiKPyz5Q5wYWw/2EXMLjVGlgwPa5WvzeuLIihWxEE1JOA6tSAYdtTBNMrA4GXw2D6swWbB/yvmYanv4ZAmpHnIElfPljrVxXijDTivfPLIDCG5Y/0l4Sc6UpCcRGPFnR22wXhakYZnObR7briRYgLZBSY55yHIip1sD9XuIqVwlIYoU3JKRztFqQr6vPqqedJuiSJQ5nGnoXCg9DhEkfQdL5H79Sc5g3dvr+1eP66BWcQDnSOBhZwSwVB/SpERLbhtQCTqn8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(54906003)(478600001)(19627235002)(8936002)(921005)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(966005)(41300700001)(6486002)(52116002)(86362001)(316002)(66946007)(7416002)(7406005)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QGMFQ16ydTzBsoePzHEIvISKd9SUTjNUk0Uo4vc+k5myrH1rGuBDtoj6Ol8g?=
 =?us-ascii?Q?6NufTz6Ts56+7KF8iEsFqy0BsIo8NumspA9UTDCl/oe8yvtVHe81smJBijpu?=
 =?us-ascii?Q?q/SoMXrwQ+XW52fYqCHmPFPLSfmyp3Y1NKtjmvef6bRFszIF0JnIN9tJhBr6?=
 =?us-ascii?Q?IffmeGxNgaekZPFB0F5UPO8HkT5ggl2WhxyOcftwsOG81+iOzssDsOxGSq7u?=
 =?us-ascii?Q?w5XlBaRPJQsFEVZa/RNFwxDd5hIa8Wn6TlLnNsJ+3uBNJCinCjSBxIrrdAsk?=
 =?us-ascii?Q?maKwRcHSHRSrfVOI2uw/IupLhAfM/nhWrrqvFzrGQyxANYuJeQKej2RbS9Eq?=
 =?us-ascii?Q?qw9TNAxszby5mP82tC1fyDsPrfWTzO2oSfIWExp8ElAlFLQY4ocC+ZmGew4L?=
 =?us-ascii?Q?Qozl+8blVvEvY+fNbqSX5SCo0ClqYtiu4cvbP28Y8GQBuGaz1C2JdErGIt1E?=
 =?us-ascii?Q?CrS+e2lzk4JIuzLcgUKcbVPiMwaatYmtHnJbd+C5If76mr7PfNchuuOIU25m?=
 =?us-ascii?Q?U1tYQbBY4uQdMxRLuOnYAJrW7sw9WU6hlehIkFIshGcH8OU2Qe0lJu130vh8?=
 =?us-ascii?Q?hR70L9vtGfZclzHppcrUp7Sn4F5qfBhyIjxTO6gHH5d6Wn9DhFI/NMpjXRiJ?=
 =?us-ascii?Q?P/1G+Z/ETY52FUEFUWcEfll+Unx0cIRty5absWA1QXJyRX28mYciyOyTdxyL?=
 =?us-ascii?Q?H54JRilDpQZYF6UxF0MWbdee+dyd+IE5EE30DiiF2jT7M+drchR8q3tdktPi?=
 =?us-ascii?Q?zlhrjE/orWJpgGQVsZ7xCPItBL5zUOVfRmr+N0QrgD2CCyQXFeveWfb3VdJI?=
 =?us-ascii?Q?DxAec6Bet9JH+XrpL91G3oQ5VeK0qgNQljEl35F/iYaKtduoYj171Mmvx35p?=
 =?us-ascii?Q?Cu0TY1R6rZ/HlPw6ySbVwzTla5FtqcItLsima0lRgfakpJWslFJK3/ZjPDg5?=
 =?us-ascii?Q?ZNTkhJgRuUtPOkd538qbYZ30JCSGobV2idkswi+3wipgzvvc47SJdq6YVaje?=
 =?us-ascii?Q?VgEBp7HnHEmQLfZNKyHFVJN/TxPz+6/IUIQgeyN7tsC7WkVDHfYKG0FJcKJp?=
 =?us-ascii?Q?apFiQ+r+q+31eQHy9cJrnEqAjGOuEmyvJ7gjgKhFG18xuVy0bE9LWPEutnHk?=
 =?us-ascii?Q?XRc3P+YIvLm/EB+ndKd1Kc/7sLKU1C3z6ICSSK2aZiFjokFG9+ZOQCNO4AAT?=
 =?us-ascii?Q?ZX315m8ZMrThIIPS7pD2+ixPhcp55qhXDJkxwTzNMo9ySycTK/fhzkSye2wR?=
 =?us-ascii?Q?QkkWQ6IA8D4pX0GA2ykPVeLUPdmMgsI0OvMSugS2V0S4zrG3uJOK/IAnTyON?=
 =?us-ascii?Q?zppNrmUPco+Qtqa3vZGW/bXckO3dCFtyLo3TIc9ygiwY3VJVKEd1uuibuuY7?=
 =?us-ascii?Q?nLEA49FDoWXmewQGQYhQz9yWjMpKQR/tsX61vdHvcckjQQdkbLnFpsNo2f2H?=
 =?us-ascii?Q?J1Tokvh43lT1QBpdCiauLKfWyu2+oNRpkuYcrwmqSeDmMFaVP6Nloto4YqHF?=
 =?us-ascii?Q?4ZLFhjU0Cep94lb5zip9bKlmyDZA/lBAo6FDByaWtEHxK0ra0Q0p9s5EfVmU?=
 =?us-ascii?Q?TlejADTnx1tD4uvC6JQF2sGZF5JBRc4iUgyDuTZdelgy32OdOc9G+T35830A?=
 =?us-ascii?Q?6QpNs8KXKCn4gGTG3OCLGZo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa645bc9-d8ef-40d7-f134-08db5fe05932
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:02:17.8046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9owrNPYImSfZItGLopcUb68qg4+IC3gvUYjv6PbpIASLGQhiKY3OjCAk+VOLEsDKj1mM2W5qdxqFDYEKqp9BabGLfrbHBY03byCWfYIdVJBKAkO3p/GyOgusldc5WMi/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11557
Message-ID-Hash: JYUFATRC7CGO5ZA5MLSOJZFBDBWV46BN
X-Message-ID-Hash: JYUFATRC7CGO5ZA5MLSOJZFBDBWV46BN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYUFATRC7CGO5ZA5MLSOJZFBDBWV46BN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This is v3 patch-set of dpcm_playback/capture flag cleanup.

Current ASoC DPCM need dpcm_playback/capture flags to use it.
But we are using playback/capture_only flag on Normal/Codec2Codec case.
I think these are duplicated, we can share same flags for all cases.

On v1 patch-set, we have noticed that it has been don't check
DPCM BE Codec valid before.
Therefore, it breaks Intel sound card probing if it strictly check
all cases validation. To solve this issue, we need to update Intel driver
first, but it is very complex and I can't test it.
Thus, this patch-set keep not to check DPCM BE Codec to keep compatibility.
But it should be updated in the future.

v2 patch-set had error handling mistake. CPU:Codec = 1:N has been possible to
handling, but v2 patch-set handled it as error. v3 solved it.

v2 -> v3
	- fixup error handling

v1 -> v2
	- Add Reviewed-by
	- Separate Intel patch
	- tidyup playback/capture_only flags conversion

Link: https://lore.kernel.org/r/87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87353uqjiu.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com

Kuninori Morimoto (21):
  ASoC: soc-pcm.c: indicate error if stream has no playback no capture
  ASoC: soc-pcm.c: use dai_link on soc_get_playback_capture()
  ASoC: soc-pcm.c: cleanup soc_get_playback_capture() error
  ASoC: soc-pcm.c: use temporary variable at soc_get_playback_capture()
  ASoC: soc-pcm.c: tidyup playback/capture_only at soc_get_playback_capture()
  ASoC: soc-pcm.c: cleanup normal connection loop at soc_get_playback_capture() part1
  ASoC: soc-pcm.c: cleanup normal connection loop at soc_get_playback_capture() part2
  ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
  ASoC: amd: replace dpcm_playback/capture to playback/capture_only
  ASoC: fsl: replace dpcm_playback/capture to playback/capture_only
  ASoC: sof: replace dpcm_playback/capture to playback/capture_only
  ASoC: meson: replace dpcm_playback/capture to playback/capture_only
  ASoC: Intel: replace dpcm_playback/capture to playback/capture_only
  ASoC: samsung: replace dpcm_playback/capture to playback/capture_only
  ASoC: mediatek: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-dai.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: Intel/avs: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-core.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-topology.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-compress.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-pcm.c: remove dpcm_playback/capture

 include/sound/soc.h                           |   4 -
 sound/soc/amd/acp-da7219-max98357a.c          |  20 +--
 sound/soc/amd/acp-es8336.c                    |   2 -
 sound/soc/amd/acp/acp-mach-common.c           |  20 +--
 sound/soc/amd/acp3x-rt5682-max9836.c          |   6 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |   3 -
 sound/soc/fsl/fsl-asoc-card.c                 |  16 +--
 sound/soc/fsl/imx-audmix.c                    |   6 +-
 sound/soc/fsl/imx-card.c                      |   4 +-
 sound/soc/intel/avs/boards/da7219.c           |   2 -
 sound/soc/intel/avs/boards/dmic.c             |   4 +-
 sound/soc/intel/avs/boards/hdaudio.c          |   4 -
 sound/soc/intel/avs/boards/i2s_test.c         |   2 -
 sound/soc/intel/avs/boards/max98357a.c        |   2 +-
 sound/soc/intel/avs/boards/max98373.c         |   2 -
 sound/soc/intel/avs/boards/max98927.c         |   2 -
 sound/soc/intel/avs/boards/nau8825.c          |   2 -
 sound/soc/intel/avs/boards/rt274.c            |   2 -
 sound/soc/intel/avs/boards/rt286.c            |   2 -
 sound/soc/intel/avs/boards/rt298.c            |   2 -
 sound/soc/intel/avs/boards/rt5682.c           |   2 -
 sound/soc/intel/avs/boards/ssm4567.c          |   2 -
 sound/soc/intel/boards/bdw-rt5650.c           |   4 -
 sound/soc/intel/boards/bdw-rt5677.c           |   4 -
 sound/soc/intel/boards/bdw_rt286.c            |  10 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  32 +++--
 sound/soc/intel/boards/bxt_rt298.c            |  26 ++--
 sound/soc/intel/boards/bytcht_cx2072x.c       |   6 +-
 sound/soc/intel/boards/bytcht_da7213.c        |   6 +-
 sound/soc/intel/boards/bytcht_es8316.c        |   6 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |   6 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |   6 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |   6 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |   6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |   6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |   6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |   6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |   6 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c    |  14 +--
 sound/soc/intel/boards/ehl_rt5660.c           |  14 +--
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  30 +++--
 sound/soc/intel/boards/hsw_rt5640.c           |  10 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  26 ++--
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  54 ++++----
 sound/soc/intel/boards/kbl_rt5660.c           |  18 ++-
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  44 +++----
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  22 ++--
 sound/soc/intel/boards/skl_hda_dsp_common.c   |  14 +--
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  26 ++--
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c |  26 ++--
 sound/soc/intel/boards/skl_rt286.c            |  26 ++--
 sound/soc/intel/boards/sof_cs42l42.c          |  12 +-
 sound/soc/intel/boards/sof_da7219_max98373.c  |  16 +--
 sound/soc/intel/boards/sof_es8336.c           |   8 +-
 sound/soc/intel/boards/sof_nau8825.c          |  12 +-
 sound/soc/intel/boards/sof_pcm512x.c          |   8 +-
 sound/soc/intel/boards/sof_rt5682.c           |  12 +-
 sound/soc/intel/boards/sof_sdw.c              |   4 +-
 sound/soc/intel/boards/sof_ssp_amp.c          |  11 +-
 sound/soc/intel/boards/sof_wm8804.c           |   2 -
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    |  20 +--
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |   6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     |  24 ++--
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |   6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |   6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  10 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  10 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |  34 +++---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  34 +++---
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  86 +++++--------
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  86 +++++--------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  48 ++++----
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  78 ++++++------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     |  60 +++++----
 sound/soc/meson/axg-card.c                    |   8 +-
 sound/soc/meson/meson-card-utils.c            |   4 +-
 sound/soc/samsung/odroid.c                    |  10 +-
 sound/soc/soc-compress.c                      |  11 +-
 sound/soc/soc-core.c                          |  20 +--
 sound/soc/soc-dai.c                           |   6 +-
 sound/soc/soc-pcm.c                           | 115 +++++++-----------
 sound/soc/soc-topology-test.c                 |   2 -
 sound/soc/soc-topology.c                      |   4 +-
 sound/soc/sof/nocodec.c                       |   4 -
 84 files changed, 512 insertions(+), 842 deletions(-)

-- 
2.25.1

