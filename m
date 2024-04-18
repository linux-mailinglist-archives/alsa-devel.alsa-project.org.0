Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6EB8A91D7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B12E283E;
	Thu, 18 Apr 2024 06:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B12E283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413679;
	bh=hHaNyYlnhCaM8uaABNfNFiPDmdxNfDmajYy3TVHCny4=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CP4t1K6uYYlpvvTQVJXnt1O6WB0L7uXNRdJyjsBUspm9k7NfIt0j+jiOfi0d1irVU
	 yBa07waUS93L+TTMYj/aMcrQstT6RwpsOmd7tOLykQF1OCSVFdCJQJPtN6gryvkhpd
	 UuRI9XYIKVbUPdG5K03oEq7Oc6QvYwEEygBuZ+pk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB1EF80579; Thu, 18 Apr 2024 06:14:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68168F805AE;
	Thu, 18 Apr 2024 06:14:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 900ECF805A0; Thu, 18 Apr 2024 06:12:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1CB1F8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1CB1F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=F9aj57qp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLqDjKTvwzP6i472p39GYqfSX9xmCctm4zPgVGfoc1vftUc/vP1ghea2FUddzgEP+QV1HqryD5B4DA4tqkeHMKWzxiYb1VBDY5N+0RTWBEgIpwBQCerZmS4P9NFyvWb9wD5jryqrX6oKjInF/Od5mBZiPsdqWovQRubuOTnVf52btx/djSVBX/P9fWaOjLosrKQdAeaJUZBDtUgiJxTV1eaNwJSCJpv3xduzYX7of1YJA4LZfjpdOGZ4ogmq4Ik+ZEYQXuEC5Cc2AWxhuJNwUrW7EJO8c6K7a7oX9w/Is16GVgF+UPR4MGp7kAdWtxfQBNkMoivrQViY4Cd+4UBeNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ig0emtaAXpylDYN9VLfVhDO5DaX/xxl6u/U7wbU0iCw=;
 b=Qt79OYDdkUaxVSPrAUWVIOfzVIegFm8TSXhgjumem4rjn86E9FqnMKPLwuomuxaV7Rb2nHp3f1DuSgUX7tr/cqmiU4V0rO2YBRmINFuBd5Z5+md6EdP1cbj55hkzXr8i1H4UgKkB5QDybXJH1NFfxD53SfMMYeOF5fmqWHxIP8C+AX62Pwa6nQ5z/mBqe+wjUEi1At+xOV1JL5tgXQKrVfM9s/wVZQYfdtE1pMB/CHhwj5PsH+NM+rTFXXKZuJ2eT4ADPN0Tjbbkk8oM68+8TaXSBiV4b5PVdUDtbrt0hcyMvMR9grM40vns42/ge208iztKxPQourFk+C17JyJbgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ig0emtaAXpylDYN9VLfVhDO5DaX/xxl6u/U7wbU0iCw=;
 b=F9aj57qp+Ch+NqT0j4jceECqBk1Pphd5QYXPwGtO9U2U7acN9dXg/zO0hzsKTL9W0K2kElcXhQvv61Ps44EmDvJHmvuoNqWjlfN9toP2GATLfIi5Ur1qgNqdFHDhvfcEK2c4VxlkoYWy0I3hSUIkz3hZ3yy84u1PSU17gW0qTcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:12:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:12:31 +0000
Message-ID: <87edb38g29.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 02/23] ASoC: soc-pcm: indicate warning if DPCM BE Codec has
 no settings
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Apr 2024 04:12:30 +0000
X-ClientProxiedBy: TYWPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: a49aea4f-c43e-421e-6736-08dc5f5dc457
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e2opS+QrRWzf8zjT2sz2bwQqM82PBUcOdUptx5oX2Lxyh+rqiZbWJdtN42TwGGAeXb6TLV06cFVGkfmUc7cBMfuNchNJ6sPc7Uo7j4G/hR9CeI304/qAaBVByp4NB9zfsIsl2I6M8rA5FQ6L2rY9SlzwFgaDyl3aiRoczHzPwjdTi9D+oBJvgajGY7RD7Tt4phX0sSCyLRLV5Y3P/5QeB0jvFmZ3w3Lvq/Gf3HLX/0KbJp9baTkd3TBzYsPjeDXQmmH8ZMoVNXzufH0TV3yLejiXhLHszH3Z+urSNJ6077kNFdFUe92HROZz7Mgn+6q87iNRG7R6aEddNR3f0pyia/i7tqN/6yPIVOoP7iHdFyVc2/vAJ3Ew1QLkqBrbyH7fTTxSqY0U6fDXaYcOXuwtaV+Sa1j5A1ZaXgZUePpRycIVSSyEInJXOvMEQQMgO8gkq14KGq2e35hlKHc0o137OOKEvcfL2Pw1tdJtOXEE1UbdSNz9yNQp0MUK6wninb0XqVnuNSaL9xORx1ieIMnJ5pi9SO/MBtjyeOyCHUhPkrsMT8aSNYZBVpKMFF/HNaheUMeNvrHr5GssQFp1r2u7VYq0XS2tDje7v7y5Il3T/yVx61RAWCsmZn6t571yaEm7nQ+Wa8m8piPrjl38nic9DlxyOxfThxHdDx+tZvXGODYtnkcxy119Kmj0OElCqMUCmbTSfFt7N8qmBNCXdhsTWN2XVd2t3SBS90OJLMRflRc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?ShJ2m8cVRmZ+8IeksyCO5oJb2706i5NoBwIoy2w1AwRx4lVs/Ub+s/Xtci?=
 =?iso-8859-2?Q?Mj9GWcLezJceXAaWNeLp3ke8MpST4DjYKOqvGL03uLdE0zdarTydWGr6r+?=
 =?iso-8859-2?Q?O7HjVC5w416PeDeqcBDWMx4Zv4WAJXSla8I/pkDqCG+b+7C4d7Jv53rFQo?=
 =?iso-8859-2?Q?YdSki8u05TK1yGVlCcif6uqQHVoW3CZIam0ZBkKiKM+yIvtNQuiqfYtzmv?=
 =?iso-8859-2?Q?BpdbrOCxZOHNsnTfDJ0w0QeuZWtGHlcSZr773DRu5kNYcS3lQcxfV/TaYB?=
 =?iso-8859-2?Q?jWFgIWM7p9Eq2R6FcRetFwi1SyiY7N40uDxIicKQdVE7TPDKjMFZeSaxWR?=
 =?iso-8859-2?Q?AM5hVDfRin2T9zR7cRPx11/1X2y5WQG5F91SSBtnG8hyJwrTiTZsequ77z?=
 =?iso-8859-2?Q?KoAFHZuUBihgozdMlL+8Q4gaAczzh38luw6ct9Qh0Cn+IygPl/I140dvAZ?=
 =?iso-8859-2?Q?c23Usf0mujlnTYhyWlT/iN/hedbB2TBurzCIheVfkvovpqCDXHeJFQlbkL?=
 =?iso-8859-2?Q?MSLj015R/g7azdfLpNW0XEbZuD/CMtoHJr3U1orlntrMS9MqSMOdzMFHom?=
 =?iso-8859-2?Q?0W2f8Y9C77c6JxtK+3dnWFQ2BML7diykZQCXwsodjtJe4IVtWlOwdp7PfT?=
 =?iso-8859-2?Q?4ht7vPvEKdi254bsmdyaqrPB3ELRTCAxjQJhEYlTtoj633lkLMN7JzypdP?=
 =?iso-8859-2?Q?HFwuQ60jv5dRAkFzOHTxL7KW4Jm1xswaPwy2hhiSB1P0s2aWTijrO9T1rg?=
 =?iso-8859-2?Q?OSuq09pOIH6I2ITY/CZHhy9gylsf5PI0wum43IZbMGjKiuRi4R0z8hJTRf?=
 =?iso-8859-2?Q?qYJheSHy8Y4c/pXwrpvCq+gochIgG0EdC3DvbLocPrqTrK7QUh/AO7DVGE?=
 =?iso-8859-2?Q?5s0bKZXVuSBGpbE5L2gdvBlrIt59NbWLRYzR9ZVDRNT/PXg6aMDMLn4hQp?=
 =?iso-8859-2?Q?J+3iB4rJScuBfhXfiB9+PYt9ZPTGd69Jmu7S8EYhm+PxBp+wVnBohxVk4S?=
 =?iso-8859-2?Q?DTAbcO20If3J0rg9HkJ58vp7btokxFVkfGZ0Hk37H2sGVLsXFqztCq3y2K?=
 =?iso-8859-2?Q?wRs7XU2xLKZGM+tsU24N1IXQwsdHluFNvLaWmax4xatO7zy4sjf33XjdhU?=
 =?iso-8859-2?Q?CB0ZRCRN6bTAPZ874QQP+FWdwVrlrVi7N+Cn5kLs2NtMgY0lXhNAi5aGfY?=
 =?iso-8859-2?Q?v51HYfD009zdkbjYAzvjeogs0PDjHmGjZtkipK7fXsoZ2roRE8R1qKXSm4?=
 =?iso-8859-2?Q?w4FdGoI7jkwotIC9GskQgCyCChoIciR93qxiMeLKHzsmSax4zuD1CC3Mgd?=
 =?iso-8859-2?Q?hCMGfS50Ckj3wKC4ikz1VOfsa19kYLPRKWxLBWMUHESE2nf5G0lpbND9e1?=
 =?iso-8859-2?Q?lYBBz7BWLSrCKy4L2/WmlIHykJycWOAflPJpjKz+L7aLGky0vlgZIkHPe2?=
 =?iso-8859-2?Q?twbtepIUjzALKxsWeevQ2YV8dtWJru4voJArW0Rdbr3bofi/4XDZ82VhJw?=
 =?iso-8859-2?Q?7zzF5dmgB2tFztq32rlrTD+ICYZx7xqH/NqX9mtVwLirxuRwvXDDb4gAkB?=
 =?iso-8859-2?Q?cJBLbWdQXlnTGtdsHl0X5YBgmAckjWgXyCyIYX8eQslMkKPgPv5B8AXI/5?=
 =?iso-8859-2?Q?jJ0gw4vIs+MscduV0f6187fvyTtINzei7PIkTL/9g4U0KHVwvua5T5E3kW?=
 =?iso-8859-2?Q?MNfr+mB+f63u4YbNGM0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a49aea4f-c43e-421e-6736-08dc5f5dc457
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:12:31.1708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RNCRaqTAamW1fu3IfQXswKch0luZwt6q7RiFlx0QjxojJ73lDXrvW8UGz8EazXnP2VeOwyIBGWd8EXDnmtk/Aa3Qe+/4Eq+jGlqcNPYHfexdZWs+ki+BqslLHbVMdMGJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: J55XTOW75UZB4OJV6RQDSOU4YLFXQZVP
X-Message-ID-Hash: J55XTOW75UZB4OJV6RQDSOU4YLFXQZVP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J55XTOW75UZB4OJV6RQDSOU4YLFXQZVP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Historically, ASoC doesn't have validation check for DPCM BE Codec,
but it should have. Current ASoC is ignoring it same as before,
but let's indicate the warning about that.

This warning and code should be removed and cleaned if all DPCM BE
Codec driver has necessary settings in the future.
One of the big user which doesn't have it is Intel.
Below is at least already known settings missing driver.

	--- sound/soc/codecs/hda.c ---

	static struct snd_soc_dai_driver card_binder_dai =3D {
		.id =3D -1,
		.name =3D "codec-probing-DAI",
+		.capture.channels_min =3D 1,
+		.playback.channels_min =3D 1,
	};

	--- sound/pci/hda/patch_hdmi.c ---

	static int generic_hdmi_build_pcms(...)
	{
		...
		for (...) {
			...
+			pstr->channels_min =3D 1;
		}

		return 0;
	}

Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.=
intel.com
Cc: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 412e7b7d97f5..a79ca115f4e7 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2797,7 +2797,6 @@ static int soc_get_playback_capture(struct snd_soc_pc=
m_runtime *rtd,
 	struct snd_soc_dai_link_ch_map *ch_maps;
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *dummy_dai =3D snd_soc_find_dai(&snd_soc_dummy_dlc);
 	int cpu_playback;
 	int cpu_capture;
 	int has_playback =3D 0;
@@ -2836,24 +2835,36 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 	 *	soc.h :: [dai_link->ch_maps Image sample]
 	 */
 	for_each_rtd_ch_maps(rtd, i, ch_maps) {
-		cpu_dai	  =3D snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-		codec_dai =3D snd_soc_rtd_to_codec(rtd, ch_maps->codec);
+		int cpu_play_t, cpu_capture_t;
+		int codec_play_t, codec_capture_t;
+
+		cpu_dai		=3D snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+		codec_dai	=3D snd_soc_rtd_to_codec(rtd, ch_maps->codec);
+
+		cpu_play_t	=3D snd_soc_dai_stream_valid(cpu_dai,   cpu_playback);
+		codec_play_t	=3D snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PL=
AYBACK);
+
+		cpu_capture_t	=3D snd_soc_dai_stream_valid(cpu_dai,   cpu_capture);
+		codec_capture_t	=3D snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM=
_CAPTURE);
=20
 		/*
-		 * FIXME
+		 * FIXME / CLEAN-UP-ME
 		 *
 		 * DPCM BE Codec has been no checked before.
 		 * It should be checked, but it breaks compatibility.
 		 * It ignores BE Codec here, so far.
 		 */
-		if (dai_link->no_pcm)
-			codec_dai =3D dummy_dai;
+		if ((dai_link->no_pcm) &&
+		    (!codec_play_t && !codec_capture_t)) {
+			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
+				      codec_dai->name);
+			codec_play_t	=3D 1;
+			codec_capture_t	=3D 1;
+		}
=20
-		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
-		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
+		if (cpu_play_t && codec_play_t)
 			has_playback =3D 1;
-		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
-		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
+		if (cpu_capture_t && codec_capture_t)
 			has_capture =3D 1;
 	}
=20
--=20
2.25.1

