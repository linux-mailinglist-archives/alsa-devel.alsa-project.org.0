Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE511CAA2
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 11:25:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9023B1667;
	Thu, 12 Dec 2019 11:24:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9023B1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576146339;
	bh=33DxYKgHCfUxyF+4CZD4sWx0+11bxq5UZ7phkc3b380=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=si5E9m5KN6wDfKoP9RoOPUG1WspuRqlqjYAF98vtpCi1EOEhzMmBrZapPUlEd0/y4
	 Pm/lb02ZtEIx7OUa0qZAHoe+AmVDAqPWWZ3oMu9OyJP5eZtYy/6yavXPor1NC7A9KD
	 obes2ftwKdCIBVzMWAaxg88qwT5Gl1CrbhnHlpqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08A99F801D8;
	Thu, 12 Dec 2019 11:23:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C48AF8020C; Thu, 12 Dec 2019 11:23:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20130.outbound.protection.outlook.com [40.107.2.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 821ACF80139
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 11:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 821ACF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="sYwqdpGr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAwEkmlduOM9lPkfGRpxiKYo7ogR2Gt9wDjkptkvPOoNEdooAuPVAXCIbtVP4PQeF0ATtOTBmNuApXDhvicPfe3WXMq+zuQ6CdcdRr3sN44G1kAV6/xmuel3oPjikDBL09Xaob73h6gc9qJNmDAX3VE6Pw6PcHQ+smr7SbsiLjDJzdqugvxP9x2FpETPZBbVRtgvk3hu64IiHZFmFmnZPwvXEZk/GDd+QaJgWkQ9F0dFNs7ZVx9hkjO4gFGn2YP4FCbI52MPuqC+u8ZV7u3IESKUcRywcrBCc3Qe/aRwIT+CaPfFk5lghJ9Ce7PyzHg6li381Nso0yWAHy2lZI9dLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDTuJuwidxTew9MufapxdOmHT5aegh40dF4S7K2S9R0=;
 b=hGm9xnGzE1hACHUfvt++17xgo/XquWPAZFxPv4rNWMkOzkTheQRSlthP8UgbYCPDXB8+Z7z2PQgHgDITL4Eq2oW5DC/eNtoy9T3puUAdyYwsm8B5mryx7DAR5lLgSY3teSv0fuKIz6WmkyKJO7hNXw4LZinik4TBM28lZAmD75RC0qGMtm3WKJ3qWt3cSlKKIjqhoHLEXo8mlhaR7tg/GBnigmOvyZ9T1SoqkLCa7GasWSzgbTnNVCiYzaEo9sy0FjKBruT8YMdk8V+gGsTlFcFjlRGSv7+Tl7y3vk6IjT9y+LxlAbwv43g+R8qM9boYDpMk8CtIawOh4A+SupBpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDTuJuwidxTew9MufapxdOmHT5aegh40dF4S7K2S9R0=;
 b=sYwqdpGrsR0CFO96043M1cYl8RjfLqX9DBkNbDmFu45sf1QPmkMYxTwxhrvfyru3Oa7IhtGkkYx/3CctEpzoBPrfLZmlxuUQixmEfwjORL4lTHUq2gkGJJHPhpmyNw2LVWZ4B3cjLHGtapAfdPgS/ZoZOQtzf3bWfMFz8zSeR0g=
Received: from AM6PR0502MB3702.eurprd05.prod.outlook.com (52.133.24.15) by
 AM6PR0502MB3687.eurprd05.prod.outlook.com (52.133.20.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Thu, 12 Dec 2019 10:23:49 +0000
Received: from AM6PR0502MB3702.eurprd05.prod.outlook.com
 ([fe80::859e:e6e6:4de3:55a9]) by AM6PR0502MB3702.eurprd05.prod.outlook.com
 ([fe80::859e:e6e6:4de3:55a9%6]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 10:23:49 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Alison Wang <alison.wang@nxp.com>
Thread-Topic: [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of
 unmute outputs on probe"
Thread-Index: AQHVsLyIRDFbzLs7vEuxsFkXl6DgTKe2NokAgAAA1bCAAAyIYIAABwsA
Date: Thu, 12 Dec 2019 10:23:49 +0000
Message-ID: <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:208:d4::30) To AM6PR0502MB3702.eurprd05.prod.outlook.com
 (2603:10a6:209:10::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAUjwdopt98tYu81LdaELKL21/04+ld3VjOUpl6+jJfOGbBIuiG0
 5q4yR3FycN+J30lA/+Ytlo31BTpcwoULx1MFNqA=
x-google-smtp-source: APXvYqzCKNlggHGHxjigKZmCUVgZ+cip+vMnJTOoLKhRoOGQy0ad43JDjmtQNArXx1kh3+4ZLk8QYR6o+8xZQWPIAVU=
x-received: by 2002:a05:620a:21d4:: with SMTP id
 h20mr6976008qka.468.1576146225713; Thu, 12 Dec 2019 02:23:45 -0800 (PST)
x-gmail-original-message-id: <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
x-originating-ip: [209.85.222.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12833b7a-0449-42d3-e659-08d77eed60c6
x-ms-traffictypediagnostic: AM6PR0502MB3687:
x-microsoft-antispam-prvs: <AM6PR0502MB3687880F163087683993BE96F9550@AM6PR0502MB3687.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39850400004)(396003)(366004)(376002)(136003)(13464003)(189003)(199004)(66556008)(316002)(66476007)(66946007)(8676002)(107886003)(64756008)(52116002)(26005)(5660300002)(66446008)(44832011)(53546011)(6512007)(9686003)(4326008)(186003)(478600001)(6506007)(55446002)(2906002)(6486002)(81166006)(71200400001)(54906003)(86362001)(6862004)(81156014)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0502MB3687;
 H:AM6PR0502MB3702.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FHQro30ppUGYEJ0sX8l/CNlKfk9MDpP4M91yADg4oe79JsP/vvc1EnxKDH4avEzQq3x9QmrbI6hhv+sCvFUSYkDPZ3LIDmV5dmuW0N9Q4mYugsrs0LzLb3NYtZ3lb+J4ESVlTEKJPVNOufY5U3M6Gq7wvJ7kamDBu52kVhqv4IqUWwyJLTJCGmJFFKHM2Qw0QNmKr7/lFPwn2Pi4yEcH6+QOhjoEQgIMq6YNuuCPcV4NOBS5NsfY+dT9JhFsUgKuKzu/LxXYQDs9dXzoCEXzy1J6luincRu8JVxpRKzup/uOsx5ioK7QjWBc9vHQIt8V2rwtK+qRqt5u0BED3kmhVl3eOvunQOkum2d35xc8vkXNJS2wqoELrNtiUSwKRpRTXHOBEonqWLvQXkYAKX1+/SoNxBKIc96YcO6GyHq8o62UlhuIa215tyvSCf22NKxp9i9jquU/Lljrkyv/Lo35pBEUqIbQkEkBBSyw2tMzd56VRPyHDfyBwezNzXL64wkb
x-ms-exchange-transport-forked: True
Content-ID: <66BFCD98B6F5D94995B2F43B51E48B05@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12833b7a-0449-42d3-e659-08d77eed60c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 10:23:49.3460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHFf0OyDfGcMa98N85Zu+bzjlwK4E/pQsJpEYVRit2+d2EZ0dmSAez6WoZR4vZu966AkBz+UWxOp5mvdb3B+Ts2cGoF7smE0nwnoVfZ3ISw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0502MB3687
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
