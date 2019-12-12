Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C73911CFBD
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:26:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DD5B16D4;
	Thu, 12 Dec 2019 15:25:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DD5B16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160788;
	bh=X/4vz64KfjezDl6mG5nLdvYRAI6tFe1DAkRzGruvDRU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LpMDZ0xSu/KYZ7si1COAiRhK+lQ2AaqGiHngfVp3xTtFWa1099Enn4OXkgLhWFSSL
	 ATkfS5jiWpPoq1Msk06dHlQeJtW30URnYhRnvgS7Wm3gAV/ofS2ix6qiOHWhrtFdv6
	 arN0V4p7jbTHFAYTz8PZqFa1XdbJPYNLYTpRvI2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39B46F8028E;
	Thu, 12 Dec 2019 15:19:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59F1CF80139; Thu, 12 Dec 2019 11:46:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140052.outbound.protection.outlook.com [40.107.14.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A1B5F80139
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 11:46:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A1B5F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="P1p0XSU1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EX8cZdl8QvGX7R4JytCP3Wz0z9xRSorRLb0Ko9w8HuMteYyBKHoJCmD5rEuu+eQSrFPqHJjfG3VBFuabGaGG0cyR9m8IIVwm3pyxCJF25nFFt2WMWoYBgJ0JlPtgEJvXeEZkqu8HLZoX6BEXIFZZAqG65v1DKJXHnph1UMrB8U4+5DhHpXk+UKVMzVSy28I+73uAggG4+i3jQeRvdsNGogajkuA9mxo7pIycOVwzTPr5b+HAiHvayQf7iCDsz+3wkQ+OgxMMPQQgN1sP5yevO+++a1DuAt1aYHkSkDPVXdSEtYnzID70j3/NZWvddSTG3LXywU3Zqwr8GdZ2mrCsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnTjRFjYhVoxkqZNHppMo+vEwFiBIVV5CCD0ceUrmUo=;
 b=X6iWJ35dQEnKhGUlqcgkcneGFqcgWlBp2Ufo3s5zv807uh8rfgLdGTtCNRYOviEbc2N+I0P2JHvots68yD0wyEhLiYCihGCv/VgZhEN3sVDJwsvqxioo2F2FHHN7px0Y6UkMMq3HRoFWKPX5dMGuiD4m/HVGYjTtCcvU/kT/FjDIyolg+leWU3eiEVAJfcknIZqqMzLbA8xxVF7duY2X+ZNOUITanGUuk/H2UUjCSjlEfVFan08pAtm2NLMNTsMCK4poG15RLvOc0iCSOZks1lPLwT640Hs9BXmTnJSbk1ZjAQxJnFVcnAfnJ0pRZs6WXaDDSCERYqkBvR6PqM7mSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnTjRFjYhVoxkqZNHppMo+vEwFiBIVV5CCD0ceUrmUo=;
 b=P1p0XSU1iueYpUCE2nkJznZCdbYZwk0cVyivroWLXxqB12g/xEbKTXpGnOZDj1EIVWNwF7RNVIKznYns0lB2a/NkusA0b57j1pznQWubqvQaeXGRGbfPsyA0Hy+3/lFYRwSUx0R6pvDdvdW37ImulKy7U2BerZBDcu0QNelLGWY=
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com (52.133.12.32) by
 VI1PR04MB5501.eurprd04.prod.outlook.com (20.178.122.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Thu, 12 Dec 2019 10:46:32 +0000
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03]) by VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03%7]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 10:46:32 +0000
From: Alison Wang <alison.wang@nxp.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Thread-Topic: [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of
 unmute outputs on probe"
Thread-Index: AQHVsLyIRDFbzLs7vEuxsFkXl6DgTKe2NokAgAAA1bCAAAyIYIAABwsAgAAETYg=
Date: Thu, 12 Dec 2019 10:46:31 +0000
Message-ID: <VI1PR04MB40620DD55D5ED0FDC3E94C2BF4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>,
 <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
In-Reply-To: <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alison.wang@nxp.com; 
x-originating-ip: [2409:8900:1a00:e142:c82e:42ce:2772:3991]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 711df4ce-9451-46d6-ebb8-08d77ef08d1e
x-ms-traffictypediagnostic: VI1PR04MB5501:|VI1PR04MB5501:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VI1PR04MB55019A9911D0246BCBF6861DF4550@VI1PR04MB5501.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(13464003)(81166006)(44832011)(8936002)(52536014)(55016002)(4326008)(54906003)(5660300002)(316002)(9686003)(33656002)(81156014)(71200400001)(6506007)(53546011)(66476007)(64756008)(7696005)(186003)(86362001)(91956017)(76116006)(2906002)(66446008)(66556008)(66946007)(8676002)(6916009)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5501;
 H:VI1PR04MB4062.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pG7JmEa7g8bFpHBeqHZM4AHGdO7UL09DZHT65kBcLdDPj0R54NnmbQCUzeEnvkstIsQde3pG0Esy6G+hzpAn7wNnuX6HCIGA9FTlAFI/XvQKj89c0XtfibVByRanJlC1vPXT8H9enTcKOCbx0uNHpNe4LIyfmHaaAmMUdsdMowiRcC4vNCsmj/ATOEukKYlBL/PgA6ogbXJ3U2fWSBZ8H4rcO/2Hmg7n76K6ReimEgncr9+wPix6eijsVX4rN0/zAeXLTezOyFVZezo0Cru8j9zQscC2OlxYYOjFwNBqd+TBjwJM6QbZAnjuywvQzhyQmSAsmUe4yiDQnMR/mCjW3pSxtrdwAkRDhKuuwc+ghT6bERar+FEzpqDAADntSqIyh6AniHBWmnfa6G2FiEe6kT+e6aYykFksdNSaTDIkGNrnx8cZBAnG/2yrs9EhkAO/PCujQcZ4/YQKGYaIX8RYxGSvD230CrN7NX7SBMDRIIg0i7vUZv1jZY5nPA+2mySd
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711df4ce-9451-46d6-ebb8-08d77ef08d1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 10:46:31.9769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YiLOOAa/3eA7yZeNPRzcvTJNspoUGIpCuYLqA0cZu3AuzNI0JL/Xi9R/NQFN22LOng8J5zD8UMIbNiiQCNnrrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5501
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:28 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi, Oleksandr,
...
They unmute with standard sound controls:
static const struct snd_kcontrol_new sgtl5000_snd_controls[] = {
...
SOC_SINGLE("Capture Switch", SGTL5000_CHIP_ANA_CTRL, 0, 1, 1),
...
SOC_SINGLE("Headphone Playback Switch", SGTL5000_CHIP_ANA_CTRL, 4, 1, 1),
...
SOC_SINGLE("Lineout Playback Switch", SGTL5000_CHIP_ANA_CTRL, 8, 1, 1),
...

We tested this standard solution using gstreamer and standard ALSA
tools like aplay, arecord and all these tools unmute needed blocks
successfully.
[Alison Wang] I am using aplay. Do you mean I need to add some parameters for aplay or others to unmute the outputs?

Best Regards,
Alison Wang

On Thu, Dec 12, 2019 at 12:08 PM Alison Wang <alison.wang@nxp.com> wrote:
>
> Hi, Oleksandr,
>
> In your patch, outputs and ADC are muted on driver probing. I don't know when and
> where they can be unmuted in the kernel before playing in the application.
>
> Could you please give me some ideas?
>
>
> Best Regards,
> Alison Wang
>
> > -----Original Message-----
> > From: Alison Wang
> > Sent: Thursday, December 12, 2019 5:25 PM
> > To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> > Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>; Igor Opaniuk
> > <igor.opaniuk@toradex.com>; festevam@gmail.com; broonie@kernel.org;
> > lgirdwood@gmail.com; alsa-devel@alsa-project.org;
> > linux-kernel@vger.kernel.org
> > Subject: RE: [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of
> > unmute outputs on probe"
> >
> > Hi, Oleksandr,
> >
> > I think I have explained the reason in my email which sent to you yesterday. I
> > attached it too.
> > According to my test on the boards, MUTE_LO, MUTE_HP and MUTE_ADC are
> > all muted when playing the sound.
> >
> > Could you give me some ideas about this issue?
> >
> >
> > Best Regards,I
> > Alison Wang
> >
> >
> > > -----Original Message-----
> > > From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> > > Sent: Thursday, December 12, 2019 5:11 PM
> > > To: Alison Wang <alison.wang@nxp.com>
> > > Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>; Igor Opaniuk
> > > <igor.opaniuk@toradex.com>; festevam@gmail.com; broonie@kernel.org;
> > > lgirdwood@gmail.com; Oleksandr Suvorov
> > <oleksandr.suvorov@toradex.com>;
> > > alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org
> > > Subject: [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of
> > > unmute outputs on probe"
> > >
> > > Caution: EXT Email
> > >
> > > Alison, could you please explain, what reason to revert this fix? All these
> > blocks
> > > have their own control and unmute on demand.
> > > Why do you stand on unconditional unmuting of outputs and ADC on driver
> > > probing?
> > >
> > > On Thu, Dec 12, 2019 at 9:20 AM Alison Wang <alison.wang@nxp.com>
> > > wrote:
> > > >
> > > > This reverts commit 631bc8f0134ae9620d86a96b8c5f9445d91a2dca.
> > > >
> > > > In commit 631bc8f0134a, snd_soc_component_update_bits is used instead
> > > > of snd_soc_component_write. Although EN_HP_ZCD and EN_ADC_ZCD are
> > > > enabled in ANA_CTRL register, MUTE_LO, MUTE_HP and MUTE_ADC bits
> > are
> > > > remained as the default value. It causes LO, HP and ADC are all muted
> > > > after driver probe.
> > > >
> > > > The patch is to revert this commit, snd_soc_component_write is still
> > > > used and MUTE_LO, MUTE_HP and MUTE_ADC are set as zero (unmuted).
> > > >
> > > > Signed-off-by: Alison Wang <alison.wang@nxp.com>
> > > > ---
> > > >  sound/soc/codecs/sgtl5000.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
> > > > index aa1f963..0b35fca 100644
> > > > --- a/sound/soc/codecs/sgtl5000.c
> > > > +++ b/sound/soc/codecs/sgtl5000.c
> > > > @@ -1458,7 +1458,6 @@ static int sgtl5000_probe(struct
> > > snd_soc_component *component)
> > > >         int ret;
> > > >         u16 reg;
> > > >         struct sgtl5000_priv *sgtl5000 =
> > > snd_soc_component_get_drvdata(component);
> > > > -       unsigned int zcd_mask = SGTL5000_HP_ZCD_EN |
> > > SGTL5000_ADC_ZCD_EN;
> > > >
> > > >         /* power up sgtl5000 */
> > > >         ret = sgtl5000_set_power_regs(component);
> > > > @@ -1486,8 +1485,9 @@ static int sgtl5000_probe(struct
> > > snd_soc_component *component)
> > > >                0x1f);
> > > >         snd_soc_component_write(component,
> > > SGTL5000_CHIP_PAD_STRENGTH,
> > > > reg);
> > > >
> > > > -       snd_soc_component_update_bits(component,
> > > SGTL5000_CHIP_ANA_CTRL,
> > > > -               zcd_mask, zcd_mask);
> > > > +       snd_soc_component_write(component,
> > > SGTL5000_CHIP_ANA_CTRL,
> > > > +                       SGTL5000_HP_ZCD_EN |
> > > > +                       SGTL5000_ADC_ZCD_EN);
> > > >
> > > >         snd_soc_component_update_bits(component,
> > > SGTL5000_CHIP_MIC_CTRL,
> > > >                         SGTL5000_BIAS_R_MASK,
> > > > --
> > > > 2.9.5
> > > >
> > >
> > >
> > > --
> > > Best regards
> > > Oleksandr Suvorov
> > >
> > > Toradex AG
> > > Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
> > > 4800 (main line)



--
Best regards
Oleksandr Suvorov

Toradex AG
Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
4800 (main line)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
