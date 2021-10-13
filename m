Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6908642B505
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 07:25:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F89167F;
	Wed, 13 Oct 2021 07:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F89167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634102753;
	bh=AQzCEH0eS1WjK7lSVrD1P0Z/NlgO/fxvOodRtLhrMbA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LtyRDhAgGanxTDkH/d7AGEc3lBOZv0eAQlRvvj8zTeLSKh+VnVdGOpGK1j8Ck/Lmz
	 SnkC6QisJv8Pz3bp2BXbMr1iBl0rSVdasV6+iZtHUwhlLNGwGye4DFL06k3vTvkoz2
	 aP2KvSlaOn9TjZahFAW/3jVbU7LGfUdL0wf5ilH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34108F8028D;
	Wed, 13 Oct 2021 07:24:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FE3CF80269; Wed, 13 Oct 2021 07:24:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40076.outbound.protection.outlook.com [40.107.4.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A257EF800C0
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 07:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A257EF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="D9k6rnUo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5XQwqGLpEbB/ZPV3hjhUAYILUaLDHMG6rdC+dkPzPtKS6VBmqoNrWrjw9fR9+oLx9yNFSeoHPJ1G0hjclP7UxOZu+7aXfNW99PqjOjoJcs1VrygB0hexkDO0ps8rcB4jtnaaqn35OrKMVTr8mlvI1RjEyyATfrYXCql49WPdFbaD9SxRPDtbNnUYSwIAlP3VeWidBfoYOQA+FH3812OTH47JoH4byzntMepMjRTTUyam//tfa9npJ5w+ZLX4Vmsa49fVNp+CiOUSqp3lEQj88EkLHW+6q47fTlHlDoWyKR1VJU+dZrqOz7zLYIIUXWVJyO+Gz5nXisZdV6bcOOIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDuWio1L4h3+yxjujMhcDUAO+Hp+o076ELyoDo1UHfg=;
 b=XDEiobjIdVX5zuWtI7iekbIrSiRkB8PnRygm0T97h8sgoTPv6vtfhju397YTgN//SIB+FZvx9e9T3v1g9wq3NkZrr9k7tSxQaq7yv7xP2CzPyMnk5zJ6nEcJADfixsLzWeP0kU8QUjk1ws+08KgrEunAveijHskluQGagXY14BSnUAeKSisVzJoi0HibLgMnCi9aP1eOKAT9E8kRlXl2yNVo+qWAaFJ0jVzbQibzfmtS/6NH6i26X7WHQ+dKmkpF1UyRrgLXToG+GvHrQlyl/zJLOf/FaeGDSb/JEBAjhPfAXANmP3atz36O73wy07I+rbv1u0CvXkmMl4FPTMIjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDuWio1L4h3+yxjujMhcDUAO+Hp+o076ELyoDo1UHfg=;
 b=D9k6rnUob0To2JmF2WillColg1TKhH8lC2iGgCHTSzgxBgmUgbBih9PboxM5DR47aAPfdWNHy6Kpk611NgbrY4saY72jDwkwYUWB/VOg8N+zjEvren5o3wDhM8PCwu+J2hDTgMVw+YVjOb1/18E0thV7qeuSlcuZE2biOPx0VA0=
Received: from PAXPR04MB8476.eurprd04.prod.outlook.com (2603:10a6:102:1df::13)
 by PAXPR04MB9139.eurprd04.prod.outlook.com (2603:10a6:102:22e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 05:24:22 +0000
Received: from PAXPR04MB8476.eurprd04.prod.outlook.com
 ([fe80::bdda:a926:ddd:7d6c]) by PAXPR04MB8476.eurprd04.prod.outlook.com
 ([fe80::bdda:a926:ddd:7d6c%5]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 05:24:22 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm8960: Fix clock configuration on slave mode
Thread-Topic: [PATCH] ASoC: wm8960: Fix clock configuration on slave mode
Thread-Index: Ade/8l8YtsfbNm3JQKGBs4KZNAV6Ig==
Date: Wed, 13 Oct 2021 05:24:22 +0000
Message-ID: <PAXPR04MB847688DF669A1CC5243F761BE3B79@PAXPR04MB8476.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: opensource.cirrus.com; dkim=none (message not signed)
 header.d=none; opensource.cirrus.com;
 dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9cca2af-57d7-424b-f020-08d98e09b722
x-ms-traffictypediagnostic: PAXPR04MB9139:
x-microsoft-antispam-prvs: <PAXPR04MB9139074D7174778ADCB0B5ADE3B79@PAXPR04MB9139.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ygMluaVGtkjk7EW2FmHv2uITmxdlCMXX6hmf3hoFTY+zwz3i9wNaviaO8SMOgCu3YqOtX9x/E/i+E2pabar6qI24a43Omvb+jp+77VE9BhtFQALp2/ULY6NTOrFzMHKrMVErYpk1sjgQt4b+fBmSoaVwWyLjXy01ERQ6S1Bb7AeWSKNIR7agMRO2rnHWXM5PdJBaECmCYNsZ3mwlb6VWaflGKIAudSiMVm84QA6L6TdzIMdxKjJxooXnKv+QC1/c0E2wIiF6ZXMekZtyhFpFdLAHuTlSIH356MjRYRmkRu6+Rvh7QtynsAA2kQzWxxRoJ6K8SrkhfSGd9EVq47x+pCEnFk9oIYkbcxwYvu4ymsLbfe3qqRL+0rIzzSt/MDmu3kp9CFWQaQjL1CjM2g+tHC0HRkTKHU7YZjvuFQ/+sV+UM/VU3Qwx0VIBzyUhLU2BGoz4eCw4T14UmtZ1F2h17uIQW5Cy095DZd3IfeFZv7/1C8SkFDgH9woPOmIACDQjnPn+NA/SA6onXAmsDq5iyJ0S2u4HoVdjg171ei6sH9h89WIhaprToWb12r0hvkGYKPaRQyNhyl2U95epfqhst/zhj6NKUQHymbbf84PqM29gDR+YOHbkn/TX1fkjzRsxpuKzolbSWQg8zNNeFdO5ZLQCrKL6JOhfFxWV/pjNElpYOjRodNuxLt5Utcwau5JWjrg6Ec+gkt/uXz4l9+TOiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8476.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(508600001)(7696005)(76116006)(66556008)(64756008)(5660300002)(66476007)(4326008)(83380400001)(52536014)(86362001)(8676002)(55016002)(54906003)(9686003)(316002)(66446008)(6506007)(2906002)(186003)(122000001)(33656002)(71200400001)(38100700002)(6916009)(26005)(8936002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cydBPt3fExJm0fxMgIvZMN82h+qFQqap8T3bbGWw5SIorFQNS+CtXqWY1K63?=
 =?us-ascii?Q?+Jr2Pm4KEtN4cM465mpwnX80b/4mKeV8Bh5bL5lHDOwEcz70aIevnv+wH76t?=
 =?us-ascii?Q?WXUfz7lv8soboPi96MizFD2A12P1ODtUXfJ4EVNgaf7VpPU5DgzS1frV/w1F?=
 =?us-ascii?Q?6ju+P5wGWkE9QLE503RLjkm5uDHKS9vS8wi2klAiHAzf62CfDQmIeP00PAs9?=
 =?us-ascii?Q?HlowrvT1L2VeOoDRLKvozTSm/nEdr8SVHJaom1kPgw3PQCiszJ+/ynvjQIvW?=
 =?us-ascii?Q?oUGfcY9S/Qum3sAllktYi8sM02DI+8H9loM6F7myMpzlUWp8wr+tK3J0JuFq?=
 =?us-ascii?Q?F67leBYVJARvLbdGYjnqoiS5BhDVh336n157xgnD4WfRpk+M2DPUIV+pIjqd?=
 =?us-ascii?Q?1no9yT+eR5v7D1ktJWk009mOG5HtcScpJG0lIkRsIQhmuzE9cBpHInHH3Drp?=
 =?us-ascii?Q?mvHlGWmlQm8St2WjPa/ipwYiavdzT5Xdnx4N4OjbWCohtT2aYhneNVqEW73n?=
 =?us-ascii?Q?tgLxMznLIppoTMhTSfcaH7Tqn+BqxyYuZUi+4mGC7hqV7jfHp6Jbk0ZmaFrH?=
 =?us-ascii?Q?U9yYDWMnOLF7ekWuCutG7e9P0n2W3IIZC6ryVYtWdTcHZdaG4Q1gzkPL2ha7?=
 =?us-ascii?Q?4l4kEWsD5EkeHSVsvjWrCQ2wfCl27LdxL600Ge+jihsHB1KjgL1hwbvJ/bPB?=
 =?us-ascii?Q?mDYhPKDo7g58wMFsv9UTBL2bwLVg3zbhx+lwjS4WzrEnYzxQfgIqCu3cUoCH?=
 =?us-ascii?Q?/Fc0iWymFCINELCj87tKBa4wO6V9IVhSsKenDb1de7j6u+BmWk9YUCGZGUc2?=
 =?us-ascii?Q?dtYC4//7FmaO3LkFMTNTVhXa27e86HYCCjDwN9HrSoV+6df0bd38r4P2wfxL?=
 =?us-ascii?Q?vWaUvmijA2xAXMBnT1x+YYtJiKQi22w1S93+xp65GkqTspPwP3sQx8w+kaE7?=
 =?us-ascii?Q?1NPcedMrnOedHcs2QS0HVw2tOT3SGGYAHXetSE6eN7lsMAI3gtsKF4ELqOEV?=
 =?us-ascii?Q?uU4QELcuw31/Qoud4moX9VBkuEoM3o1qITru4xmRsDO70pPGa6i+oQBe9FFn?=
 =?us-ascii?Q?XWV5YzjztC1W+aIv2zengY39RY5poHeazMdeNa5g1WGhUifAmPI/eJCvOTpC?=
 =?us-ascii?Q?nepiblNV3zTfG5196xYIca1C44aWA6qaz25PpZ4ajexWSJBn6LTflCJMfHS1?=
 =?us-ascii?Q?sqUiCiatk+ZPCyPlxhy+E9HAXvC1mrdwMr+0T9MHfrQ9ySEgCbIcJ3Aw4ali?=
 =?us-ascii?Q?RKdDX21OrFID/kr2BkqFizNN4IHZEhmuDT3lZGrKjpFqFHVK6BNXq5s/BGU9?=
 =?us-ascii?Q?Wuo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8476.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9cca2af-57d7-424b-f020-08d98e09b722
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 05:24:22.7408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rh1YcE0Q1SxMDoXfG6z0ICnSDWKwzZ42olILQbeb1o0gDKKWRE1+BBpiVb+sHbGjIi3Etp+8sQ+nMuvqBFiGKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9139
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

> On Tue, Sep 07, 2021 at 05:11:09PM +0800, Shengjiu Wang wrote:
> > There is a noise issue for 8kHz sample rate on slave mode.
> > Compared with master mode, the difference is the DACDIV setting, after
> > correcting the DACDIV, the noise is gone.
> >
> > There is no noise issue for 48kHz sample rate, because the default
> > value of DACDIV is correct for 48kHz.
> >
> > So wm8960_configure_clocking() should be functional for ADC and DAC
> > function even if it is slave mode.
> >
> > In order to be compatible for old use case, just add condition for
> > checking that sysclk is zero with slave mode.
> >
> > Fixes: 0e50b51aa22f ("ASoC: wm8960: Let wm8960 driver configure its
> > bit clock and frame clock")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/codecs/wm8960.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
> > index 9e621a254392..9c6af76a60fd 100644
> > --- a/sound/soc/codecs/wm8960.c
> > +++ b/sound/soc/codecs/wm8960.c
> > @@ -742,7 +742,7 @@ static int wm8960_configure_clocking(struct
> snd_soc_component *component)
> >       int i, j, k;
> >       int ret;
> >
> > -     if (!(iface1 & (1<<6))) {
> > +     if (!(iface1 & (1 << 6)) && !wm8960->sysclk) {
> >               dev_dbg(component->dev,
> >                       "Codec is slave mode, no need to configure
> > clock\n");
>=20
> Looking through the datasheet it just looks like this if statement has al=
ways
> been non-sense, it looks pretty clear the clocking should still be config=
ured in
> slave mode (apart from BCLKDIV which is presumably ignored in slave mode)=
.
>=20
> I would be slightly inclined to suggest it would be better to just fixup =
any
> systems not setting sysclk for slave mode, but I am assuming you are talk=
ing
> primarily about out of tree systems. So I think we need to at least updat=
e the
> message here as well, it should probably change to a warning and state th=
at
> the we are proceeding with no clock configuration, rather than erroneousl=
y
> saying it doesn't need one.
>=20
> Thanks,
> Charles

Sorry for missing your email. I will update it in v2.
Thanks.

Best regards
Wang Shengjiu
