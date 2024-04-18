Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3AB8A91F7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:18:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 488EA93A;
	Thu, 18 Apr 2024 06:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 488EA93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413931;
	bh=CEhhY76HXmCbv3jsBJ+i/+GTiOhN8ynXGwnjUecK7Lo=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Hea10VMOwxgh2gIQ4etm1secuwQL6kqqY8u70DQoTBL5QPD4fOV+W4sSCEnxfarWa
	 9hQ+3drPmmgYQqxktL18PyS5NUIvM8SPsuF+nyr2qjm9jX5FR3WRtVkCJNBYNq9d2p
	 zSkbAwhMRLct6Z7KeKRDKvvMNW1jDNpQvqUBopdM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75A2FF805B0; Thu, 18 Apr 2024 06:15:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77C93F8080B;
	Thu, 18 Apr 2024 06:15:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C085F80691; Thu, 18 Apr 2024 06:15:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30E6CF80691
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E6CF80691
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Hr1KOi9V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIYrnwpTA7riSGwJ9MQDh/Y1WfBj8YnPjFVjB8cj0cNakJTJZiEMkdMdelbuRhklQA6SZe/CAskD8U1P2KMJ35M72KiuvaGakWwMk8sNgpaSvz7FPC/i1O0XsKZigkl1V6IV/RHDzow0U6yqVkapNo+DSKcatLQr8Da4nlWhM8o1UvLgtO3xrpe2sk7W5lNYhtHF+3bZlAidkiaAl8budmOxDD07SSZrydpzCHJb5DFd0AkFURNkt5TCwwZoJbZBQmAJQZnO/CVvlbVeUArj5CB6mWgbAMxp//kwqXBbyS88T7/aVu82yp8OYIpvzRo3178EkqRlSfcNfoBPV67kIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ncm2RPDI65bPSQcuOqjLhAh734Wl+ZrPG76kx//yxLM=;
 b=n8RlxW2kSEdivvoZRzRcWNGNAhYzXcqNe8532rN9yICPmdlIbsYfequYoJ2pDRXC1AlLVG1xmXVN76XCUE8X/swcOWq4bpWO0hVuKnfSNcjUVSbj135zlaD44WNCciTJKJ4HriY5Hu5efBVkBQONwgZxJJaigsMT4PYWP8Pb3+x07e/xom9KP2ESMajJt8VHIoNNqUs3lbylx4MWUP3irFNAxZIu87mRy2PgxujzkISGF0cdShyAUahvWYOV3fDAelAOXCwp5XLhMGetTHNXDZSRlQQRjGIlWr6PS9JtiucEEFAAwUprKJ15iKIXRuVxUeG+zFHYRW30qSeILCnxvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncm2RPDI65bPSQcuOqjLhAh734Wl+ZrPG76kx//yxLM=;
 b=Hr1KOi9V35Gy1PECYdFL8PbJKIHNYB+IHr58cOlDtUcYJan1VNy6XKunSgjd6gHrlUMe5Bak5h+P267rBxjvhKhVYW7zyaI/VMucxGLr6AiXBuTEKXz4LYPMHZiRJZ+/8ukEqzTnU/1Dnb/YIHceFO+tutZmUr8mQRi1BfTDtZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:14:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:14:56 +0000
Message-ID: <87sezj71dt.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 17/23] ASoC: mxs: Replace playback/capture_only to
 playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:14:54 +0000
X-ClientProxiedBy: TYCPR01CA0014.jpnprd01.prod.outlook.com (2603:1096:405::26)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 799cb002-29b8-4869-e9e3-08dc5f5e1b15
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pQRNp0sop3pD2z2wm7qrYaoqBPUJscwJ3ra461hYBW56eLwy+90mfe8QzQK1BGQvmknmF2itPeWj7DBDuzinAWTzryqpeGhpwZZPUgNm8I0qGTI+d0gWzzoz8udKw8yOx88ORkxx1ExbyjYeeam+rRNhNJiOkMcQyPVV8NhlBS6RbOUA35LcKn9NaztkZ8wdXrExr75qYpzY0zUb3Ud8BSlGCacBUNbXrrVLSYQ9cG0BJLPJOQMC71/6Tl/yjfQENJoJlyT4n9+t7anGIvYwGrniagPTg1hE9sRjtd6LER6/tZXN4WN9W0bwEwQ6e3nT8emen10RZR+nmDR9+xe2lr4P1QkfAv+ENREEd0/2nAyPdQ24owo5WC1dfyAbjO46H/Mz+JWi4j+wtmPuSRf1a+OZYJlOgIIJumPxRhhzS1WXrnv9Pt4OKqf+kpy4dIpqkdzLFeVSAuRxtpmTDPlU9hydiMbYbntgM64w5Oeabqt6Bu2liWxI2iTMo90QrJEd9IMuGks7o2LK85wztpBxEC7GcVGDlYua2MEiitOoGmYeKmqXGBfkZugY8nHbu18NyUBSZvmBKRtAz36aOM6d4L2/Sa54/iF7ATU3ntgrPWjti7PMoHPVHAYXBVyBM7Z6go/qQJ2RM4XVAjf+oz4eCdFui+S96cOx+0ei4jprjmRz8sa/xSkLlVSjRquTVyh5XZ6QwJ5lFGuif3f+b4BfPse1BAologY35s+LJ3zsxEM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DCkNBDOFtxh0sFNX00XweX23cWPxs7VnAxffTVllZCNWgeMMFYtW+pUTZFvQ?=
 =?us-ascii?Q?ci1E4gruyMVD3v2WX155ZGN1k3KwX5K08/jR+T/mQ8+u10roAzPRR3DDZ4nD?=
 =?us-ascii?Q?bh8n4crvBrxvu8EBOWXCWzXeT4vhGx/yf1Y50cz6hFsCx47rsqloSyqPzZPo?=
 =?us-ascii?Q?LLA1My3rKOSdgi/TdEXu2lWhYAsauP2eQcoL/TlGRhYJTUMoAuz5Z5/0cz9H?=
 =?us-ascii?Q?cG7qcVliki+wlN5tEPbFlxvin5cLfjkicbe7PR2AyslQmY/DVhd48+Oo7nA0?=
 =?us-ascii?Q?rq4k3QuZlqYonbThw77sKbMH0Na58KjQxFjomz9m+LSGNGENt075LqeE18WU?=
 =?us-ascii?Q?BjhNPSFNYdcwuiIw4QwV3jTO0o/HW/kuaWTIheKs4abMSxAEqYH9KHkoP+GJ?=
 =?us-ascii?Q?d3lrcdBtk+i7pA9kyY02S1OOXjybG9WUfZnTkjwNYzE8vNPDeN9Cx8rjR0M2?=
 =?us-ascii?Q?khcTg/1XwPNCwbtbVcWE/wcqfasPwE729v95ALN6c5vVOfjcKSktClvJu/5T?=
 =?us-ascii?Q?5hJTdL/76tEgz5YsuZR/fCp7aUD4drXAkT9kJrFKGMrG8rVdBSvHxufYWYiM?=
 =?us-ascii?Q?9peVYYyRinpGx3bLAQoSf6N/lOVoqeiPBwaLh0t8ztoOilq8JzSAEXKZ4oqs?=
 =?us-ascii?Q?xi/hLOq5k3tpI2opra5rkYyeFEdCA2NfjgZPJkDnyQnMKAg8GqFFrE6/F+DT?=
 =?us-ascii?Q?qDBOKEXv0EYb5ywBKGXYYzrfCZ4WDw3SrAkhymJOB1DAHoJT7oIIZhE9TWHV?=
 =?us-ascii?Q?lfALlYhWTUp8xG+MAAGD5FLLTf+Nub2clKeOtCcXmt5mwEMo818HdgtcZPST?=
 =?us-ascii?Q?txgjSpZJKTL47j6C4USFWjSuDfG80Mb1oKl7n7awWTefCQTTQCYlzI9Xf38x?=
 =?us-ascii?Q?Uvohe1pi4H5jVSrCrrVzFFTJvLmkpFo1zA+wl67LvBOMDaOGJKb2Xb74N25D?=
 =?us-ascii?Q?Lj39+EQoRdQtmKfEkusjp/4IMlY7JhAV5ki3H7DiPtWsnEBthnskFAT7OGjD?=
 =?us-ascii?Q?jZv3391EvaEZAUe88euS4QDnc3pGotSlP4Oy3yF9uGWTUDMYNmVXQJ+EBHRM?=
 =?us-ascii?Q?kn+6sJID8gHJd33h11ObzSjVNO+rydB5+m9JEB7U1PAx0/hffuapkym7ovZ1?=
 =?us-ascii?Q?w6uk4iqZ0qk60uZm/VBaZxtdVhxxzvGLj+4rVLlTwCoKvBr1GX9xCJTu6oAZ?=
 =?us-ascii?Q?vSLumizd8VdZURqbEJN/+fSsWZrnQiT/fhvxW/5VVINgZTqKB9RbYf1o44px?=
 =?us-ascii?Q?OXJIHCK6jDCBcEiFHcbqDykWEAdzx1EpUaQwWep0ooHIQ+f3bQeFeU/mRBAR?=
 =?us-ascii?Q?MIDZ34sXR9sFCqW+xyZn0r5F7w+jLJkF/zL9VerPljfet9jlAOFTAoO0mBrA?=
 =?us-ascii?Q?y70SgpUd6ky1w6oeRo40CuoBuPyhi2av1P972WiNmBRKzW1ls5eZecaJEioa?=
 =?us-ascii?Q?6w77K7FpIKFnYvErEIFsXYBNgozYrCMsVZtODv5kWgFsfAPO7Yn17OqxI1lC?=
 =?us-ascii?Q?poLTpGVnPhOtUDhy8AW0bKpjoJvMDa8o1ZszEVBAKWeBBK8F3qT38r2ToPpd?=
 =?us-ascii?Q?sfodtD2lXofShrGDtZ1+X+eMx4VYh8/ogSasDOFQXFxdoXhbOGJERSCDkodq?=
 =?us-ascii?Q?3SJxp4L1Mk+CiYApbLQGXeA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 799cb002-29b8-4869-e9e3-08dc5f5e1b15
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:14:56.6909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 E/k+bmQ1ZVH0wXfGjEQmoyd0xat6E8rYvlZ8ZTvGwnh/gPRg2TjLKx2FopdFehHkkAuJQ9aDpJvSz2OP7vOm2j2aa7N77LdFVDz6/eHIB7/+dJLgNy2Fazc7NIJ0gktB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: TAY6BC724W46ZAB4Q462QWTXMUFFJURC
X-Message-ID-Hash: TAY6BC724W46ZAB4Q462QWTXMUFFJURC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TAY6BC724W46ZAB4Q462QWTXMUFFJURC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts xxx_only flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mxs/mxs-sgtl5000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 310e3ac77424..829337320d17 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -78,14 +78,14 @@ static struct snd_soc_dai_link mxs_sgtl5000_dai[] = {
 		.stream_name	= "HiFi Playback",
 		.dai_fmt	= MXS_SGTL5000_DAI_FMT,
 		.ops		= &mxs_sgtl5000_hifi_ops,
-		.playback_only	= true,
+		.playback_assertion = true,
 		SND_SOC_DAILINK_REG(hifi_tx),
 	}, {
 		.name		= "HiFi Rx",
 		.stream_name	= "HiFi Capture",
 		.dai_fmt	= MXS_SGTL5000_DAI_FMT,
 		.ops		= &mxs_sgtl5000_hifi_ops,
-		.capture_only	= true,
+		.capture_assertion = true,
 		SND_SOC_DAILINK_REG(hifi_rx),
 	},
 };
-- 
2.25.1

