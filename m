Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FD376FD8A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2D09836;
	Fri,  4 Aug 2023 11:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2D09836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691141964;
	bh=PlPaKh4mcCvZh8ptVqBFkBSfPGdYVMkcqNeF7m+2HJ8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R604r2g4WWyX52QzN+dgVzK5ik2XmcalI2w48mtzA4Y+yWYyUJzzz7a8VihTnQ2y8
	 6giry1ZAkkV/QBC6X3VxM4q5JzfcQkdon9/LbyEo7+qFz1OB1QpfCZH+D5YNPp3xxm
	 M/kqV3EKJGHuwXo5iy+zgcSO5upVQchVjaLfRiH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A09B6F80570; Fri,  4 Aug 2023 11:37:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49EF6F80564;
	Fri,  4 Aug 2023 11:37:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BFAFF801D5; Wed,  2 Aug 2023 02:52:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 134B4F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 134B4F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AhpeNzvn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiyO3Bilin+EAP6cisKbuESEES4qNV/HjNP24gIauJRTrT7/3rBbvK84DToc/x1l77mLM7Gagc4Z0xjv/fk65hC0H5Y13IL6yqqZ+xjCJqMeCZDCm0vBXEqW5zD1N8pXRhzHlZ/WB1o4MYSZPKB/5Q9o2XcE5HlVBg+dokdlUZ30ZLk9O1ptHG94ftJqy2kSEy/Bu9Hvhobjtomnfyi0RIksgo1T4MwwWpuLhIJ29ArGMEeic5HN5BTmwCSb8GiYENbgu4uXLm/EhixG+lHAa69LQsiMNctfTZx9966DhYeIXpoDdcWOLG83o0f2w+IkhnL8DzK1ZhowHICq738d/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhQ3OtaVUAET6yCak2SAD88KVhYPZGw+IgleQ6zgSfY=;
 b=kr2BUTGwn4Qi1tr4FVO57IU49YwJ+tbzHXA7Ykf7kY7kFeHuVqK+pA2Jarl6JLyHhoSWuyN/6x9ZMdi4yqtYYgiVKb+Kr94KMyXvz7fQ2S8RSHVN+PYmTDf9G8sLp568PBuzpIvG/T8V2K0JilYn+45PzRXUbz4sH/tiie+jvaRqsZdvgAMEf0U5x6PmBtxL5sxRve1j9o+ymT7MXAp7QjMmnJkvnZuNajvwCK8c54KLuEnDqgu6kvxJfTs7RxxcS2FOa0vNZXRUbeQb3eQkLUi1hnMIdQbFYyO2+6cMtLHhjECD+oEpxVBol/4lDrA/sow1jUSTCAX/4Lb+fzvA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhQ3OtaVUAET6yCak2SAD88KVhYPZGw+IgleQ6zgSfY=;
 b=AhpeNzvnR56AnQQUFPWNmJYsA6HLOapXPRnz4fzQh7C5ZCWm99PWga7PWcvkmFsHnNXIJgO/nM1h5BO8Xj+Yr2dWNeG8E6PUSetZAN/l/N5mzPJe48nrkP2tpuoRbR+GwqV5OqH8vXHX3KWSooxcVJv0Q8G0QZfrJxgUoM96tJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8858.jpnprd01.prod.outlook.com (2603:1096:604:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:51:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:51:49 +0000
Message-ID: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Amadeusz" <amadeuszx.slawinski@linux.intel.com>,
 "Uwe" <u.kleine-koenig@pengutronix.de>,
 Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>, Ban Tao <fengzheng923@gmail.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Chancel Liu <chancel.liu@nxp.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@csie.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Daniel Mack <daniel@zonque.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>
 , Heiko Stuebner <heiko@sntech.de>,
 James Schulman <james.schulman@cirrus.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Judy Hsiao <judyhsiao@chromium.org>, Jyri Sarha <jyri.sarha@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Padmanabhan Rajan
 b
 abu <p.rajanbabu@samsung.com>, Paul Cercueil <paul@crapouillou.net>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Samuel Holland <samuel@sholland.org>, Scott Branden <sbranden@broadcom.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Walker Chen <walker.chen@starfivetech.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Yingkun Meng <mengyingkun@loongson.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH 00/38] ASoC: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:51:48 +0000
X-ClientProxiedBy: TYCPR01CA0009.jpnprd01.prod.outlook.com (2603:1096:405::21)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f06f27-0afc-48fb-35c7-08db92f2a7af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4SwlCIzN1GXiiZAtURmfCZnwQnvJWx4nyiLaRjtdYkwA3nG3oxQqI1BMXZfQoA/n7DW+EP7+MKfXHqSj4uf5C+oKZWfXFAL5t1bFN/ybKQiivBC/kax3wWy4CRLCPoYnjXNdVprZdmSIgE7Y6DlBi/FteMd/0Lgax4MSH8Vn26qX/ABvEAlnopzhnV+7T/gfBJ8fuhRcDhutkFeQ58h1WfOCuC9Eo3tnYDOFVAIl/TcqggdGzfciJC3Yapl/gE1YZ8wZRZtNHZLjuWzSpa/5o/qbn2gtPmHK7xzesE+TVrOt7VOUr9RAfLN7o7v1J5/uXiz0XXzuDjw6C/3E972Pm+pfp3DGZLzDoGADcOHEzvm9zH4g80+Na5hDjyf/MtEymClncPdmHmyAF5zxLhYuQRA12wNLs5OqYVC3uQIwEA6b13zV3Gc9NeYjft6sH30SGsQs1g/9ZTOReQkuPU/swjvsLF2FGxcOx+2woAt2+oEJjklrNu7w11PClfWuYnfHIOlux5Rrqdfk7d9odw4g1XOYDK8taHjxHW0pb4KevqKuv3NDHW5OgfRF316Vq75lWP46JUaPnzmQ9r65AGpkcDwwA30cj814Eb9zBWKyRsjo1aLs2sQEw2Pq3lXvZJfS33Wl6O/xYCtYOIuABQJSLkWUycsHrLxxhoeJcesgbkI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(6486002)(52116002)(8676002)(8936002)(54906003)(478600001)(110136005)(316002)(4326008)(66946007)(66476007)(66556008)(83380400001)(6512007)(38350700002)(38100700002)(921005)(41300700001)(1191002)(186003)(7416002)(7406005)(7336002)(7366002)(6506007)(26005)(5660300002)(36756003)(2906002)(86362001)(2616005)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L70oY3YntSUV5+4/b+RGY3A5si0Mj85QPS1d01XgrUkFaUyIegrr5sIgZHoz?=
 =?us-ascii?Q?NXSNFd51MDFBPiLuLFtCDcfslAByI5azaqYyvGbEQLKBSlLJNpgwqyQkQVyS?=
 =?us-ascii?Q?fNqcJ4QB5moTxM8b48qkwuQZ7gZnGYjkXOQtUuSGZKfAgqoVoheIXgqkB1x1?=
 =?us-ascii?Q?FV/ACa7Bj5UpyBDMxRb109KN/7dMcOzPfT9cbuhcSUCG1MBtxUCweyM3WUza?=
 =?us-ascii?Q?dGCm6lDGje8af+DM37daef1tStBQm4nIkpjXE0cMYbDKhobRHeHs1mUDerzA?=
 =?us-ascii?Q?LFU63vpKXnQaxEc4jWS0r2PZVgRgazaOCDjZQPlqtt073XkyMU2rpyBnVL2U?=
 =?us-ascii?Q?uCDx69AlWAUBDVnFMG80y9bhu/GNaCkSLcEZWOO25DGKcc/bsA8su/WnystY?=
 =?us-ascii?Q?qt0ZrEx/WmAoBUSsii/VKkFqa8iy60mY/8Lg1gVLENXRg7BOXjwCP8CLpE8p?=
 =?us-ascii?Q?WkGy3oV1HYbs6jhsXcqMfqcV4wGP6yXNDr91UHZLKVqCLD394uMUthw34Mju?=
 =?us-ascii?Q?6wnIvZ6ToHU+wTf+DoV9faC+I0tQqNERU0VQOG9J00ww+MlbHBlrvXwg86Jo?=
 =?us-ascii?Q?lGa+cqDi6KKblVAlq1urru6U/EiiNzvuBxXTF9Wjonv7wfh8rR71LWtNWPDQ?=
 =?us-ascii?Q?o+Pprr1pkAS610CA+NAvQmDCww7XcLwIPvNnQ1SwCx9rRDjumGbZcD5Dqevm?=
 =?us-ascii?Q?47dihaXmJ4IWhls4ws4NYVmwKahb8QzKAatL4AcqB8LbhpLh20I8qGubpikZ?=
 =?us-ascii?Q?yve8NdJXdN1ZSvVaTa3ZOvEmpOl9UAwnAEic3dcB8sgX+2fcstdz6NaJcO9V?=
 =?us-ascii?Q?K35l7bwxjFA5az88JrlZHXl8QH7mSIYy+vpgRzQ3aOFpPBaMQcCU2cNHc4ic?=
 =?us-ascii?Q?z18GSDb754JTNa/V8mmmvbJ+C9PZFQRL3KabIFHlmO6AZv6ZmpD8B1Nxhhop?=
 =?us-ascii?Q?ChEUVjNa2rNx/P+6FZ2e4xC8exZ8KxzajFCoVaWhyJaeTjfvYNAA9WzLloY0?=
 =?us-ascii?Q?bVGGGYD/tK1mc98ewgDuYTMLMwrVU3n53ITBzNoWQjweiuHR3zQDn9E64KtX?=
 =?us-ascii?Q?1PmP0HcfIezRwvxNDulXhGf6YJp/zIdN7AI0yKqnObdOGfB2LuxAPHd7y4YB?=
 =?us-ascii?Q?2JwF5gffAU7W65T3c6iJek0Ukb2QBMKGbN+ZFialliq96Oy3nMzkFUEpF5Yv?=
 =?us-ascii?Q?oQTRuv0INFL4OEP89yqRRjAX/BdT7ScR0DgRxuwJ4S3i22r5CYkd9U/NyoXT?=
 =?us-ascii?Q?N/8DQHkYArCAZvtpme+Zqky6Hh3tlohej7mARAFEehbpwXbqe5sFqL4ou+1O?=
 =?us-ascii?Q?8RAgCJJjAW+KVmZmRXhb9idt/EcnetQVliCYe8mGt9DjFoLNrojDGnmqTGGM?=
 =?us-ascii?Q?G4RfLqBfF0IuASF/1+wY+0UgigObZQQBAM99KeNYbmpRqL+fSrLebS7MJCro?=
 =?us-ascii?Q?d2DCh4o+T8Ugn8YwvygZS9O7deXq24kbB58GS7rPHBZ81ccBV+q17OIXsoQW?=
 =?us-ascii?Q?hoMun66+C4YbUoWC72uoVLWlKFSAyyG6t+Yq4lT+jFHxwVZzXOFccsJluJap?=
 =?us-ascii?Q?h70PiET0LqcuHOyRS4si3hhQeWNkrtTbK7E5/FNUQrlva7/IepTpofdqtJbr?=
 =?us-ascii?Q?mj031+Fk3Y1B6Tor488+Aho=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 46f06f27-0afc-48fb-35c7-08db92f2a7af
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:51:49.8442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9gR+H7dpHAGjEs4m02aOohIOYX2pMR9/h/MyLmjjaKq8f829+AiVFmMyrOtr9kh8BfKlr9mfQhsLBFLHNjHtib/RbhxQLu3mqKVEwT7jJbjFvqiiEOuns9oMo+I3xq/k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8858
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 4EJ4M35KB75A6ONUF5SM47X25YYGQWLG
X-Message-ID-Hash: 4EJ4M35KB75A6ONUF5SM47X25YYGQWLG
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:37:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EJ4M35KB75A6ONUF5SM47X25YYGQWLG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

snd_soc_dai_driver has .ops for call back functions (A), but it also
has other call back functions (B). It is duplicated and confusable.

	struct snd_soc_dai_driver {
		...
 ^		int (*probe)(...);
 |		int (*remove)(...);
(B)		int (*compress_new)(...);
 |		int (*pcm_new)(...);
 v		...
(A)		const struct snd_soc_dai_ops *ops;
		...
	}

This patch merges (B) into (A).


Kuninori Morimoto (38):
  ASoC: soc-dai.h: merge DAI call back functions into ops
  ASoC: ti: merge DAI call back functions into ops
  ASoC: adi: merge DAI call back functions into ops
  ASoC: adi: merge DAI call back functions into ops
  ASoC: amd: merge DAI call back functions into ops
  ASoC: dwc: merge DAI call back functions into ops
  ASoC: pxa: merge DAI call back functions into ops
  ASoC: bcm: merge DAI call back functions into ops
  ASoC: fsl: merge DAI call back functions into ops
  ASoC: img: merge DAI call back functions into ops
  ASoC: sof: merge DAI call back functions into ops
  ASoC: sti: merge DAI call back functions into ops
  ASoC: stm: merge DAI call back functions into ops
  ASoC: pxa: merge DAI call back functions into ops
  ASoC: rsnd: merge DAI call back functions into ops
  ASoC: qcom: merge DAI call back functions into ops
  ASoC: ux500: merge DAI call back functions into ops
  ASoC: sunxi: merge DAI call back functions into ops
  ASoC: tegra: merge DAI call back functions into ops
  ASoC: atmel: merge DAI call back functions into ops
  ASoC: intel: merge DAI call back functions into ops
  ASoC: meson: merge DAI call back functions into ops
  ASoC: jz4740: merge DAI call back functions into ops
  ASoC: cirrus: merge DAI call back functions into ops
  ASoC: drm/vc4: merge DAI call back functions into ops
  ASoC: samsung: merge DAI call back functions into ops
  ASoC: mediatek: merge DAI call back functions into ops
  ASoC: rockchip: merge DAI call back functions into ops
  ASoC: uniphier: merge DAI call back functions into ops
  ASoC: loongson: merge DAI call back functions into ops
  ASoC: starfive: merge DAI call back functions into ops
  ASoC: hisilicon: merge DAI call back functions into ops
  ASoC: codecs/wm*: merge DAI call back functions into ops
  ASoC: soc-topology: merge DAI call back functions into ops
  ASoC: codecs/cs47lxx: merge DAI call back functions into ops
  ASoC: codecs/cx2072x: merge DAI call back functions into ops
  ASoC: codecs/hdmi-codec: merge DAI call back functions into ops
  ASoC: soc-dai.h: remove unused call back functions

 drivers/gpu/drm/vc4/vc4_hdmi.c               |   6 +-
 include/sound/soc-dai.h                      |  26 +--
 sound/soc/adi/axi-i2s.c                      |   2 +-
 sound/soc/adi/axi-spdif.c                    |   2 +-
 sound/soc/amd/acp/acp-i2s.c                  |  24 +--
 sound/soc/amd/acp/acp-rembrandt.c            |   3 -
 sound/soc/amd/acp/acp-renoir.c               |   2 -
 sound/soc/amd/acp/amd.h                      |   1 -
 sound/soc/atmel/atmel-i2s.c                  |  16 +-
 sound/soc/atmel/mchp-i2s-mcc.c               |  24 +--
 sound/soc/atmel/mchp-pdmc.c                  |  18 +--
 sound/soc/atmel/mchp-spdifrx.c               |  14 +-
 sound/soc/atmel/mchp-spdiftx.c               |  18 +--
 sound/soc/bcm/bcm2835-i2s.c                  |  24 +--
 sound/soc/cirrus/ep93xx-i2s.c                |   2 +-
 sound/soc/codecs/cs47l15.c                   |   6 +-
 sound/soc/codecs/cs47l24.c                   |   8 +-
 sound/soc/codecs/cs47l35.c                   |   8 +-
 sound/soc/codecs/cs47l85.c                   |   8 +-
 sound/soc/codecs/cs47l90.c                   |   8 +-
 sound/soc/codecs/cs47l92.c                   |   6 +-
 sound/soc/codecs/cx2072x.c                   |  11 +-
 sound/soc/codecs/hdmi-codec.c                |  44 ++---
 sound/soc/codecs/wm2200.c                    |  12 +-
 sound/soc/codecs/wm5102.c                    |   6 +-
 sound/soc/codecs/wm5110.c                    |   8 +-
 sound/soc/codecs/wm8994.c                    |   2 +-
 sound/soc/dwc/dwc-i2s.c                      |  18 +--
 sound/soc/fsl/fsl_asrc.c                     |  16 +-
 sound/soc/fsl/fsl_aud2htx.c                  |  10 +-
 sound/soc/fsl/fsl_easrc.c                    |  16 +-
 sound/soc/fsl/fsl_esai.c                     |  20 +--
 sound/soc/fsl/fsl_micfil.c                   |  14 +-
 sound/soc/fsl/fsl_sai.c                      |  24 +--
 sound/soc/fsl/fsl_spdif.c                    |  17 +-
 sound/soc/fsl/fsl_ssi.c                      |   3 +-
 sound/soc/fsl/fsl_xcvr.c                     |  16 +-
 sound/soc/generic/audio-graph-card.c         |   2 +-
 sound/soc/hisilicon/hi6210-i2s.c             |   2 +-
 sound/soc/img/img-i2s-in.c                   |  14 +-
 sound/soc/img/img-i2s-out.c                  |  14 +-
 sound/soc/img/img-parallel-out.c             |  14 +-
 sound/soc/img/img-spdif-in.c                 |  12 +-
 sound/soc/img/img-spdif-out.c                |  12 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |   2 +-
 sound/soc/intel/avs/probes.c                 |  10 +-
 sound/soc/intel/catpt/pcm.c                  |   8 +-
 sound/soc/intel/keembay/kmb_platform.c       |   4 +-
 sound/soc/jz4740/jz4740-i2s.c                |   3 +-
 sound/soc/loongson/loongson_i2s.c            |  16 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c  |  56 ++++---
 sound/soc/meson/aiu-acodec-ctrl.c            |   4 +-
 sound/soc/meson/aiu-codec-ctrl.c             |   4 +-
 sound/soc/meson/aiu-fifo-i2s.c               |   3 +
 sound/soc/meson/aiu-fifo-spdif.c             |   3 +
 sound/soc/meson/aiu.c                        |   6 -
 sound/soc/meson/axg-frddr.c                  |   4 +-
 sound/soc/meson/axg-pdm.c                    |  18 +--
 sound/soc/meson/axg-spdifin.c                |   4 +-
 sound/soc/meson/axg-tdm-interface.c          |   6 +-
 sound/soc/meson/axg-toddr.c                  |   4 +-
 sound/soc/meson/g12a-toacodec.c              |   4 +-
 sound/soc/meson/g12a-tohdmitx.c              |   4 +-
 sound/soc/pxa/mmp-sspa.c                     |   2 +-
 sound/soc/pxa/pxa-ssp.c                      |   4 +-
 sound/soc/qcom/lpass-apq8016.c               |   4 -
 sound/soc/qcom/lpass-cpu.c                   |  40 +++--
 sound/soc/qcom/lpass-ipq806x.c               |   1 -
 sound/soc/qcom/lpass-sc7180.c                |   5 +-
 sound/soc/qcom/lpass-sc7280.c                |   2 -
 sound/soc/qcom/lpass.h                       |   4 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c             |  88 +++++-----
 sound/soc/qcom/qdsp6/q6asm-dai.c             |   6 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c     |   3 -
 sound/soc/rockchip/rockchip_i2s.c            |   2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c        |   2 +-
 sound/soc/rockchip/rockchip_pdm.c            |   2 +-
 sound/soc/rockchip/rockchip_spdif.c          |   2 +-
 sound/soc/samsung/i2s.c                      |   5 +-
 sound/soc/samsung/pcm.c                      |  18 +--
 sound/soc/sh/rcar/core.c                     |  27 ++--
 sound/soc/soc-dai.c                          |  44 ++---
 sound/soc/soc-topology.c                     |   6 +-
 sound/soc/sof/sof-client-probes.c            |   6 +-
 sound/soc/starfive/jh7110_tdm.c              |  16 +-
 sound/soc/sti/sti_uniperif.c                 |   6 +-
 sound/soc/stm/stm32_i2s.c                    |   2 +-
 sound/soc/stm/stm32_sai_sub.c                |  18 ++-
 sound/soc/stm/stm32_spdifrx.c                |   2 +-
 sound/soc/sunxi/sun4i-codec.c                |   6 +-
 sound/soc/sunxi/sun4i-i2s.c                  |  18 +--
 sound/soc/sunxi/sun4i-spdif.c                |   2 +-
 sound/soc/sunxi/sun50i-dmic.c                |   2 +-
 sound/soc/tegra/tegra20_ac97.c               |  10 +-
 sound/soc/tegra/tegra20_i2s.c                |   2 +-
 sound/soc/tegra/tegra20_spdif.c              |   2 +-
 sound/soc/tegra/tegra210_admaif.c            |  12 +-
 sound/soc/tegra/tegra30_i2s.c                |   2 +-
 sound/soc/ti/davinci-i2s.c                   |  22 +--
 sound/soc/ti/davinci-mcasp.c                 |  27 ++--
 sound/soc/ti/omap-dmic.c                     |  22 +--
 sound/soc/ti/omap-mcbsp.c                    |  28 ++--
 sound/soc/ti/omap-mcpdm.c                    |  22 +--
 sound/soc/uniphier/aio-cpu.c                 | 161 +++++++++++++++----
 sound/soc/uniphier/aio-ld11.c                |  62 ++-----
 sound/soc/uniphier/aio-pxs2.c                |  55 +------
 sound/soc/uniphier/aio.h                     |  10 +-
 sound/soc/ux500/ux500_msp_dai.c              |   2 +-
 108 files changed, 792 insertions(+), 688 deletions(-)

-- 
2.25.1

