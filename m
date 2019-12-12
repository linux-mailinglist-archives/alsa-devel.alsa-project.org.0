Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 953AB11CFBC
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:25:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5698851;
	Thu, 12 Dec 2019 15:25:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5698851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160750;
	bh=+4DsLCSJjwNdvbRRLAk8Cv4OJjgAaxaB0TcgFQ3xhOM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JtZdpvk7lWHcZomDLRzW4VTuvl2vJNEV/ORLPZ9tn9RYwyNFLrCmEj5VqLaRt7dSN
	 9T1U6z1SA/nZFSIz1YlkjGIQzzyyb+NalCBALpkdrWqfTmbbIXWZi8a24mjxuekHjX
	 y8BTX83YVKu+phYmLQwpGvC2aBCRjvLovZaNfHeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78BD5F8027D;
	Thu, 12 Dec 2019 15:19:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F4153F8020C; Thu, 12 Dec 2019 11:07:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,SPF_HELO_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DE6AF800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 11:07:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DE6AF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="Pg/JkBGt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHOnhM6RFMo40bOebV1n1B57AEuTl1W5G3RLTLLIg+4X9cCxtOsFxfv1lxLV6f3R/j61lAcMsZ+NFUusSWeZqotXXswuunr3llvxXE0j0GPX8KCVuXvtY3bhVe8TP+0yaGhkepgwVEnJlE7uMl8lslexNtZNp6V/LgZMHGeJ+9cGbU+3eK+ygHRqhLXA9BJzAFcFcqln9bnZzUgtAbSrq1JSLT/m04POEBXl2Rkik7EaNqkYRYxZZFpieil9Wntvoyz9mZt2HLlBGVbaDXOQy/G4Ubu/cwyO4HoCLVeebJoRSmxrNlQwN6uQSdh5z1h//Jgug2IPuihO+emJ7wEmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfP97DmUT+sgNX5BL5pIB2byu5auRd36+YgRVZsU3+8=;
 b=WACkFjUo55b9savdKf6BHW3Yg9Xa36/uqrvkYBtWxEEJogedNTizPU+6tBw3viFIMn6vBC6g8FXmgqaL4hVPOujGDjutpnut9CTVpS3wLM0U/FQxIb32MXszCPlkbDeRqEx9BiJG/pDgdPUHkGdYgMKiV8g/LK+4RI8zbJjDFpakp7wel8yQNRNQPYW1uNgGp+LswtKzDx3yxMQcPyZOBzRaTSuIMIlyEwzutOdjh6FibrPQpTtKrqdC2GGEKaX4LfpXvEVwOW+hZ18bCbWsGLIMyxZP8jnf/re9S5CpL7WSrzyM+wfcvfgYgv9aYSNN91q5rohPZNxZ1q9yXBzlHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfP97DmUT+sgNX5BL5pIB2byu5auRd36+YgRVZsU3+8=;
 b=Pg/JkBGtD7c4oqXzsxcWT2fILS7P0n/u9bFHC3OUHMMDWm1hvBYXz6JN3k1Iy0+csLz57uzt1BhisI8PAE9tyI3EZkk0ULmT1nJuxhXneLTdz0S+Pomd1bxi4k7cbBxAVIPusNCHfWX1DwaQlcy+TAuAfhI6QgU50FI7UQZvL9A=
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com (52.133.12.32) by
 VI1PR04MB5152.eurprd04.prod.outlook.com (20.177.50.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Thu, 12 Dec 2019 10:07:39 +0000
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03]) by VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03%7]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 10:07:39 +0000
From: Alison Wang <alison.wang@nxp.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Thread-Topic: [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of
 unmute outputs on probe"
Thread-Index: AQHVsLyIRDFbzLs7vEuxsFkXl6DgTKe2NokAgAAA1bCAAAyIYA==
Date: Thu, 12 Dec 2019 10:07:39 +0000
Message-ID: <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alison.wang@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f9bf08a2-d650-49bf-fa02-08d77eeb1ea2
x-ms-traffictypediagnostic: VI1PR04MB5152:|VI1PR04MB5152:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VI1PR04MB5152793A65018DE4C04D509DF4550@VI1PR04MB5152.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(13464003)(189003)(199004)(478600001)(44832011)(2906002)(186003)(4326008)(55016002)(26005)(9686003)(86362001)(2940100002)(5660300002)(52536014)(71200400001)(76116006)(316002)(66476007)(8936002)(66946007)(81156014)(66556008)(81166006)(64756008)(54906003)(6506007)(53546011)(7696005)(33656002)(66446008)(8676002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5152;
 H:VI1PR04MB4062.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G/n1uaZN0D/ZI4W6Y5rWRaebdqtarFe5GyHB9Vz5eZ4hkomM8Mteh5jsGgV+SmNZpxBF9Jlc2qbcS+8pMDSS0Gd82XzElY/DXMZC/UbUYBFkCGh0g1F9wPNtZ9xBPaRlGUgYLnb6KgvOIrhv/qq7a9iemvzTxaAfJ4237mPMM6uND4sZiZh+5ty0qNLO060DQ0nuoXAYb11PJepuE/OmGI4eJmprKt53V/QFYfqd2esvBia5572hUVTBeHO0lXHvje73RShmGJOxaUy9xXgCspEdFaW7lygAHSxGJmK2X2BqoHQnC/ckAySiGZotxB6Of/ncO6Jlq2RCJC159pv3fGQwafLH/bEEgVOqDFS46a9MyAsKWJW28GfYmv6IRnQtFnYVM0JsnD9FGlOkum0IuGHa2YpKn8V+ZlAL5bzd5yMxs5tVsPi2790x4cxYMnn0X8GwH9K4nBCMF304cn0kBEORx+Lj9BftzFsxiffI4SXzWzUiXUJiZM/wDUTIcXMj
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bf08a2-d650-49bf-fa02-08d77eeb1ea2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 10:07:39.1386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rGjr0VhrpUPa1vJYPjMeKQocAf86vTO4pMaXtJcddpgIEpmsThngzyFzmZz7J+Y/z2r5Czs+nGu31IMPqUfWbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5152
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:28 +0100
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

In your patch, outputs and ADC are muted on driver probing. I don't know when and
where they can be unmuted in the kernel before playing in the application.

Could you please give me some ideas?


Best Regards,
Alison Wang

> -----Original Message-----
> From: Alison Wang
> Sent: Thursday, December 12, 2019 5:25 PM
> To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>; Igor Opaniuk
> <igor.opaniuk@toradex.com>; festevam@gmail.com; broonie@kernel.org;
> lgirdwood@gmail.com; alsa-devel@alsa-project.org;
> linux-kernel@vger.kernel.org
> Subject: RE: [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of
> unmute outputs on probe"
> 
> Hi, Oleksandr,
> 
> I think I have explained the reason in my email which sent to you yesterday. I
> attached it too.
> According to my test on the boards, MUTE_LO, MUTE_HP and MUTE_ADC are
> all muted when playing the sound.
> 
> Could you give me some ideas about this issue?
> 
> 
> Best Regards,I
> Alison Wang
> 
> 
> > -----Original Message-----
> > From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> > Sent: Thursday, December 12, 2019 5:11 PM
> > To: Alison Wang <alison.wang@nxp.com>
> > Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>; Igor Opaniuk
> > <igor.opaniuk@toradex.com>; festevam@gmail.com; broonie@kernel.org;
> > lgirdwood@gmail.com; Oleksandr Suvorov
> <oleksandr.suvorov@toradex.com>;
> > alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org
> > Subject: [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of
> > unmute outputs on probe"
> >
> > Caution: EXT Email
> >
> > Alison, could you please explain, what reason to revert this fix? All these
> blocks
> > have their own control and unmute on demand.
> > Why do you stand on unconditional unmuting of outputs and ADC on driver
> > probing?
> >
> > On Thu, Dec 12, 2019 at 9:20 AM Alison Wang <alison.wang@nxp.com>
> > wrote:
> > >
> > > This reverts commit 631bc8f0134ae9620d86a96b8c5f9445d91a2dca.
> > >
> > > In commit 631bc8f0134a, snd_soc_component_update_bits is used instead
> > > of snd_soc_component_write. Although EN_HP_ZCD and EN_ADC_ZCD are
> > > enabled in ANA_CTRL register, MUTE_LO, MUTE_HP and MUTE_ADC bits
> are
> > > remained as the default value. It causes LO, HP and ADC are all muted
> > > after driver probe.
> > >
> > > The patch is to revert this commit, snd_soc_component_write is still
> > > used and MUTE_LO, MUTE_HP and MUTE_ADC are set as zero (unmuted).
> > >
> > > Signed-off-by: Alison Wang <alison.wang@nxp.com>
> > > ---
> > >  sound/soc/codecs/sgtl5000.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
> > > index aa1f963..0b35fca 100644
> > > --- a/sound/soc/codecs/sgtl5000.c
> > > +++ b/sound/soc/codecs/sgtl5000.c
> > > @@ -1458,7 +1458,6 @@ static int sgtl5000_probe(struct
> > snd_soc_component *component)
> > >         int ret;
> > >         u16 reg;
> > >         struct sgtl5000_priv *sgtl5000 =
> > snd_soc_component_get_drvdata(component);
> > > -       unsigned int zcd_mask = SGTL5000_HP_ZCD_EN |
> > SGTL5000_ADC_ZCD_EN;
> > >
> > >         /* power up sgtl5000 */
> > >         ret = sgtl5000_set_power_regs(component);
> > > @@ -1486,8 +1485,9 @@ static int sgtl5000_probe(struct
> > snd_soc_component *component)
> > >                0x1f);
> > >         snd_soc_component_write(component,
> > SGTL5000_CHIP_PAD_STRENGTH,
> > > reg);
> > >
> > > -       snd_soc_component_update_bits(component,
> > SGTL5000_CHIP_ANA_CTRL,
> > > -               zcd_mask, zcd_mask);
> > > +       snd_soc_component_write(component,
> > SGTL5000_CHIP_ANA_CTRL,
> > > +                       SGTL5000_HP_ZCD_EN |
> > > +                       SGTL5000_ADC_ZCD_EN);
> > >
> > >         snd_soc_component_update_bits(component,
> > SGTL5000_CHIP_MIC_CTRL,
> > >                         SGTL5000_BIAS_R_MASK,
> > > --
> > > 2.9.5
> > >
> >
> >
> > --
> > Best regards
> > Oleksandr Suvorov
> >
> > Toradex AG
> > Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
> > 4800 (main line)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
