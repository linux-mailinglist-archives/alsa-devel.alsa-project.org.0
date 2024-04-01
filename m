Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D78947B1
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 01:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D76218F;
	Tue,  2 Apr 2024 01:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D76218F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712014083;
	bh=U/VNJsEFPLA5CYNcrhuPnk6EHECSMn1oOlMByMHdMtk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RfVrwhW9SE/MH1KmnICYZSxVrlsaFthHSaTuHI8e8FoSbkKgeLpWHRUUFgpCrKnXp
	 o6CgqMV+26ThjPjJrSxlNAEL0Ha4g2pnlVKAmv0icbZMK/o7MBm2Uox4MF1mE4SPpL
	 BCJ6tlcBblVlxMXeg4rpf3WZTWD0A7ROCwGYVsUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5626F805A9; Tue,  2 Apr 2024 01:27:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4E03F8057A;
	Tue,  2 Apr 2024 01:27:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31F05F80236; Tue,  2 Apr 2024 01:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 081C0F8016E
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 01:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 081C0F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=m5m0jfMI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koJsTXSA8SK9OdpofAu1eLt9E6huyVRviOgm+HIww+vpkUQIne0p3EdmCx1pFYGYpQaHHrjtGPAU2V5RwAwBGGlMX/o9jSCQumpNUNjEIYJr3gC0i+euX76hUpyxOy3ezcEWbE5/QsALSI5zD0UzUFpn2vpChAlCoVwJT8AVk/JtP7xj2vR3huRvoRXQcRzKTywQmb56uOF9uG4GrvbPNTvQecev6D/spqhwncTlCI3upmNsHQILvMTilhiCQCpwok/GGVdeBR4OoqFIGxud74nsiniziBF3XxoEatk7T4k/lo/mrHilrP4wDRJVlA38gAV/UVRH9YQtJADL0GMA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b47w42CNZEcKWlBFaKuiM5ghkQI9r+64HdbjLHY2MSw=;
 b=XS/NUY0yCOMzFEVDOGW7Z1wQ1h+GrHStig7Q9fcmhtBH0SUYaQYIDEoHbQsVuGUQa5QUmjcnZkvsJEaMeK3gx/uR7AH6EQsgrwPCiIlfOt3C5OJox/a66WGDEtQXjd1/nJtqFY6OZdmgMRACdtGU694xilMrrZcI4Kbdg8my4tlXThUfpegoiqOs1vsDOWqp3g9fCMsSqCXPFhM3Cd79SQ0o1Yg6+TOvSoW0tWZCzeiLDSasoIRFcMis2afxFP4bwvuAguIxy9HRiT1c1JsA2fIsnYQit5Cbb6JW5TLKS7aHkdGCKD2wCu9Fs+uhkBhCP4QcZr5/Udwlfdk9647m1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b47w42CNZEcKWlBFaKuiM5ghkQI9r+64HdbjLHY2MSw=;
 b=m5m0jfMI8MJseTQ8XKNL9ecq9GYYmZBZKaqRlMdcXw1wG4lypYdQdDYI+sssHZSKZYAK1XWcml1G1HxYtfLnkxopbG9LN0tITeqyWx9DORjcWzN+5WS/I2gdIZeGNGJt2eoYw7mNdlE/1scO4heVR7iIBMrGRy7Nx0oNvUneilY=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6223.jpnprd01.prod.outlook.com
 (2603:1096:400:77::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 23:27:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 23:27:15 +0000
Message-ID: <871q7o8y0d.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v2 09/16] ASoC: soc-core: Replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
	<1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 23:27:14 +0000
X-ClientProxiedBy: TYCPR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:405:4::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6223:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7iz/ystLdOUhbbzLBj30VVGv8No5HEyRI9uLXizSABTCqe0TgbAfAmsUjd5huGgjduLNdmPDRmV7i7H1MYXxwXSNrynnxzDYEy7VPRzKq9yW9qERNhbDRsHm32FdwyhkSkgxpg3aoe9AAb+O7ij9+4d/uTcQKAgV07gYIwF5eQlH4wjFnxzKmCokTRhkM6LBFPEH5xbNy//pMYGLabfX3+j8zRETaLpMBYLjTckmAK2rdJbaTFuH2Xh0dIUka8/Sg/b2lg+QStHohhKFyhie5Dk7uLEKhOTcN6GWDkLn3XLTaTqVp8PmyeHTGPNZWcVYXK6Eb3MJeK9JBHEsSaLkdKoED2qgJDkaic+FfZen+UkHZOl9pu16RYVLX3GNUJegINv73hi6OjC1o/31+fauuDP56yDrXZDSbSMtoJF/ZWvy80CokLCswS5GRzp3rSo9seBfVlVZm8kbxFt2u3osB6ejDv32d3ZTiavo6UoaXPD/QMQHdAsmuSVpn1Y2kNlOhFGkUZB3OI3/8gVfmRGrKO7V6a0wf3WDWnkgBaCMsqVv+UFhZ8dFKmjawNnVq1M62EqlitDTYm52kR79GPgZknbZpGhD1pofH4kBjdBORLxkHdx1QpdPQJ14fA6whYY3xfBi610y5TQTm5EgYfTBzW6Ex6QmHYH+Pi9s96CzyUxJVFGQpk877zDvalUn7RzHeFJtUqSbEn3On/TERUlUhw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ijit4zbge6+zPSEJgFqYUKWq8m8X69YKxsDhTlRhZGGHJHYnXAe6DCPDdcvR?=
 =?us-ascii?Q?pgIwGLAvFBbTBjnqd5xhQ2s36FJ5VerIDGVj/RTWYsmEf11Oy6FKXi0emc2x?=
 =?us-ascii?Q?xndd7Vc9/t4r2QIv9fNQBj8IGAjaZUjhG1TkMh7+ftOuDOD1nYbVTHiNnAff?=
 =?us-ascii?Q?p3jx7c3pyXCgu1KQlcpbQoN+oxP+M5KorWPeVFGwiuTvj8on/AXGuDtaufmC?=
 =?us-ascii?Q?/0vhnkFUJz2vNfoUt9wH8TIhMHoCoWv6sUCDkiETqu/fdE71X+shHYNYGSXr?=
 =?us-ascii?Q?f2hsaPa0SBl3H2GjRoiJ/tpJfIRDp9ijTUvZvdZ7vIPMt0gLGkxNa7QY/HD1?=
 =?us-ascii?Q?ZcsGQ2IIHKGzFgaf83Qt+uinKd9DcTHBhbpxndKuZvjtcP6Bng91KGw8ap25?=
 =?us-ascii?Q?edYy0vUJ+uINtCNqJaYfu8Y44tvDj82y2fhUdIVOpv/hh0ZLbMI8CdBdnYLw?=
 =?us-ascii?Q?FWv/tnBaEMKTwpZbkYHh1qvJHl17I3KuQl6BMBVeZczm66sewGaqaqxD+z2t?=
 =?us-ascii?Q?M1Rc8eTm21E4qgDvwyR946r/DSa8D9D57cenImBJnGgCL/BfgGTpESNZVtyz?=
 =?us-ascii?Q?WSnNBw5tpcEQ9dxPc28uZI+TY5nfAP8fodn0+7l5zLR5j7iulwO/A3D49vJH?=
 =?us-ascii?Q?LWc72XYQhi5rVfLFYhm50/eQIaXkXJBbVVrpMB/08MXqSga8Qli3XhZj/XJv?=
 =?us-ascii?Q?MbNDpOgeGwuhMzev1zJvTyA5Eh4BI+dRrNtyeFmOZRhUrPt3DLEmCRHJ+s9K?=
 =?us-ascii?Q?B/4zgi0UjJeI21h3OW0ZeBAx3EG2mP84iJGvAd0E9OMgA0xku/BIfSykulwD?=
 =?us-ascii?Q?ftp0MqY2TJtIWVwBZf1GMqWQPLUlrk5kWAZu3gR4qS9H4/vuStbDMgFRTQ3H?=
 =?us-ascii?Q?rDzDvDTuYYsLFVBRMHceCnNerahQNnA5tWrPN21k/6yZSymi1T4pIJeiJbRC?=
 =?us-ascii?Q?NWI9mA+CKTXl6RsdrEjwVunSHmnJTeg3923JT7DUyHfrMoG/81/l//7gsESF?=
 =?us-ascii?Q?KjtCwyx+Gnx0EjakHh36EfzByeVLfh2TwYOK7sClLWxQgp0mlE+zXZ7vygCC?=
 =?us-ascii?Q?RrjG1/cij7bk51PoeDtSDAaz307QkZAlfPjtJ/aw8NQwaOmUvBiQE2ofo+/F?=
 =?us-ascii?Q?bVz0q4ZS+sSaOEjZEA2/Gy8wFwM9rCFipOeGINR1TpOMkpDt8dXj5OdJJeRC?=
 =?us-ascii?Q?51ZAVVl0Ob2xhs/fAKzq6l8YPyVBWHW0Sn87uW4QAk28OeRU0jkOzIZlPUQy?=
 =?us-ascii?Q?4oCSlc1f41zWFeDVlw/xPxKJCtWfOD3RxjtnAMT/OUVa3Cn/gY1sxQKy752x?=
 =?us-ascii?Q?kwzZlrDLB70oXGPWbL8C2nr/KhSgUyNcw7hcwX+3zsEh1nOtG/M+pY58/3KV?=
 =?us-ascii?Q?QzyPIPt+YoM3myRoPlrdNgyu+X+1qDhXyPZMeTyquvbpARnZyWWQlzTL1+Zs?=
 =?us-ascii?Q?dUl316Wzmn761bihTnWPls/n6qJEpnRCvL/2wfB//anWtL4Nje1nae567KxR?=
 =?us-ascii?Q?zjjIw6hzvz8ZIU5AG3DN8z8VA6nd7TFfqLr6Btk/iko+5zF30t8vyAZWaYQk?=
 =?us-ascii?Q?CfxZOtm9tZCaMWm+wBaCjfUhGN2R9tqwOVMRcObCzTrJSuWkwb9Eu0di7xOg?=
 =?us-ascii?Q?VIie4Zp1TWOJ933+59RaztA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b71fc5f-cfcb-4ff0-1838-08dc52a343e2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 23:27:15.2944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 A/MG6/CiTTCeKvIQhzjk1/eWbPhQfu43AcgqG19e+P5QxLBuNMOqykZsiPGn5WyXErbeBMKTLmOVYa6fHD8LL2ouuzh3HZvf9NHPSE1gD1dOAK80B3NeFc/Msm7pBaL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6223
Message-ID-Hash: CHTGMFVGZRX67R4YYFYKINO6PBZBULRY
X-Message-ID-Hash: CHTGMFVGZRX67R4YYFYKINO6PBZBULRY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHTGMFVGZRX67R4YYFYKINO6PBZBULRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

Thank you for the feedback

> >  			/* convert non BE into BE */
> > -			if (!dai_link->no_pcm) {
> > -				dai_link->no_pcm = 1;
> > -
> > -				if (dai_link->dpcm_playback)
> > -					dev_warn(card->dev,
> > -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
> > -						 dai_link->name);
> > -				if (dai_link->dpcm_capture)
> > -					dev_warn(card->dev,
> > -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
> > -						 dai_link->name);
> > -
> > -				/* convert normal link into DPCM one */
> > -				if (!(dai_link->dpcm_playback ||
> > -				      dai_link->dpcm_capture)) {
> > -					dai_link->dpcm_playback = !dai_link->capture_only;
> > -					dai_link->dpcm_capture = !dai_link->playback_only;
> > -				}
> > -			}
> > +			dai_link->no_pcm = 1;
(snip)
> It's not clear to me how this is related to the
> dpcm_playback/dpcm_capture removal.

In my understanding, if "dai_link->no_pcm" was 0, it sets no_pcm and
convert setting to BE. If no_pcm was 1, it is BE anyway. So no_pcm will
be 1 anyway after this code.
And then, dpcm_playback/capture is no longer needed.
So it just set no_pcm = 1 here. But am I wrong ??


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
