Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA58214C854
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 10:47:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412F1167A;
	Wed, 29 Jan 2020 10:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412F1167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580291278;
	bh=+nJHHi6dQPhY/i03dmQOadHVWpIPPVT1WBSQWHhUaXw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCCFDbp0T6mXlZ/GUA3qW2HKrSKsG1mItmSccC3GfunXI3ECNHlZd/Hej3iDwztXz
	 uPHkPyPiQIe3xPcVGanebwzZCATJrxvOdKqWoz3HOVHJCr2Ed30wU11uaKL1tF8s/O
	 HiLFeyaWGHxQD2aetQjmRY20BK+x20qenJjxSLmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4092AF80122;
	Wed, 29 Jan 2020 10:46:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30D97F8021E; Wed, 29 Jan 2020 10:46:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00041.outbound.protection.outlook.com [40.107.0.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36A0AF80122
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 10:46:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A0AF80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="EDXctfbE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0YqFbqouyaCdEdlB1GK0PVTYtRnPgSO3bQVmmcyVbJuks1OeiO5gLr5SUAq4QDIwL9Ai8Fnie2OgPwfIiWu2fKdH+fReVBZOB1iDc/YPumZFDDCtlK56T2q1zYx2Ltl4UzpCgxZPRzNWqmbuw9yxFcSkR1BvUKoSbqbzO+Y2sknUckGqvoGoWyF7H4YjIkAYxyR5U+hvV8UZoKmTjyQAVtvfKcXjTbU5U6xD1YwCcWAWtwY1TdmeNnZ9+DKv9VZZVgmUE8vWn/vGyuASJurq5LstAOciSX10ET23oGnRCXqeEkBEMCXBio975n2dkuZ4/IyrLcf1he/Blktolvrww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az1KN9NbSpM1JrvMnUEGPd/IMCegcZlmIx1c6T/xHZo=;
 b=VNi8deFFMmTKrDQhPvP4PMXLeHFQLMQHESY92vU2M9u5Sb3xy0jnvAEM4RWS0kgAjfMBwkLIzUgSBorK9YXPGXflNl+l2Po5l1AaZesR8UGEnTObUyqd7TWwsJjjlgs3u/XzdNAUEY0KJJq/H5qZE5gH2EHOxBrCqh/X+KhhkvoIyFfCaSYqMAJQBmM80FfyeQJKzkLRqBKIXpjVZOPovRxykj/BuPICNjwujPJjF5hUwk/c9EWguTMkC/egCiib1Y/e8edPCIL7JPai/dI/u2IfOu4vgyT0ye/kBDTbWqNI2V4WU93//J9Ub7QfugYp1ZIQGObNyJ0lJw9Pqa9KMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az1KN9NbSpM1JrvMnUEGPd/IMCegcZlmIx1c6T/xHZo=;
 b=EDXctfbEB30C+8lbTPeeY1niCOGXyWSteyHlMC9Jsp4JHXRus1JFnceg73M3zv6m/nmqc8qThBCKrdVWGI3EhTNsHE1TYBhlnLL2+dK9iviE+LnuVYI8tMhayur4PF+6Lf+JBfmY0THBtqo+nAF4nSVfu3YYyv6tKuIqoP06pqU=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB2800.eurprd04.prod.outlook.com (10.175.24.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Wed, 29 Jan 2020 09:46:09 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2665.027; Wed, 29 Jan 2020
 09:46:09 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>
Thread-Topic: [alsa-devel] [PATCH v3 11/11] ASoC: SOF: Intel: Add Probe
 compress CPU DAIs
Thread-Index: AQHV1nq614aiIP8R0EGtBxAZC4MEA6gBXtQAgAAGEwA=
Date: Wed, 29 Jan 2020 09:46:09 +0000
Message-ID: <59777313561e5ec6f5a3a8a65e315375a3e3bf13.camel@nxp.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-12-cezary.rojewski@intel.com>
 <21b4a2ecdcf60bca06d7c82c8252bfd2a8ebfd5c.camel@nxp.com>
 <60090086-8f43-5cfe-0754-4c0b1d71da6a@intel.com>
In-Reply-To: <60090086-8f43-5cfe-0754-4c0b1d71da6a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0a854f14-8cfd-4831-bd32-08d7a4a011c7
x-ms-traffictypediagnostic: VI1PR0402MB2800:
x-microsoft-antispam-prvs: <VI1PR0402MB2800ABBFA4F1212D6D953A9EF9050@VI1PR0402MB2800.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02973C87BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(189003)(199004)(66476007)(76116006)(36756003)(478600001)(316002)(81156014)(44832011)(8936002)(81166006)(6506007)(53546011)(91956017)(2906002)(186003)(26005)(66946007)(64756008)(66446008)(66556008)(71200400001)(6916009)(8676002)(5660300002)(6512007)(86362001)(6486002)(54906003)(2616005)(4326008)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2800;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 53PKzUI3tepTIf48/pxKYEpU4MY+FoOoTRxx+Mn5Vv5X2XuTnldFrd1/vyyJyxRZQuZm/Ejlpby0OfZbDySaSsClkyWom1Erok52ITEK+uCexcYhi5r+XahnXuZeKx+2OsnANlBUzsiYlHkDQUukHXCwIc+vj2jBfIxzVM7jS3sxDJcUp5sEInk/5A+Wc8/5/ciWSL/1U4l7d4Ge81sy/TfcrcJJ6T/edcIAnWQnYC+gQz4hzMyafaQc4oI4hslL1Tb/5Q+tz6bZ2IeQgKOzBCraz6JPE+wOdl5qVGda9GNJGTCl55Wq6PdQlgxtqIcaHBGO+BG/fIBmM6dIpxwypgIqHUya//MmoWjBy3m3cmk12/0MYZOKz8P4Px2ZE5VpDym55BThG0haJb4x/wSxaDP4vLBKh12keKRClBsoHMf3EhKE/qEeXjozfDH9Wl+gfwHvPDFRFmGbATyY1UfhnNOXWNMSTU57CvHfZmb2UROf4gKNczQ9mGEopWxrtwkD
x-ms-exchange-antispam-messagedata: XliQr9ff4d1yj4lm6XQNyR194RMmS6V6A18rtx6Ap5uQKn0G4hOHd9lSFcnYi5UAQlvltRWMuoLKSNfrvsLBFzmDM9AQzd57E06L8eJnsCzfsau7LPdYh+YzUJVQ+W/pEF8AR42xqavVoUBb37WzNA==
x-ms-exchange-transport-forked: True
Content-ID: <778899846E47514EBC61B35F38E9A8EE@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a854f14-8cfd-4831-bd32-08d7a4a011c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2020 09:46:09.5770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NO3eHZ4LZO6FKuweihulr47zAzTKUFMM2TW1BVJtdjXGXUD9kD1kAyrw2GLeLkFQJ2Sa8V/LfmZOM8Dwc+1Lnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2800
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "daniel.baluta@gmail.com" <daniel.baluta@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 11/11] ASoC: SOF: Intel: Add Probe
 compress CPU DAIs
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

On Wed, 2020-01-29 at 10:24 +0100, Cezary Rojewski wrote:
> On 2020-01-29 09:04, Daniel Baluta wrote:
> > I'm not really happy with the changes inside pcm.c
> > 
> > 
> > On Tue, 2020-01-28 at 11:43 +0100, Cezary Rojewski wrote:
> > > --- a/sound/soc/sof/pcm.c
> > > +++ b/sound/soc/sof/pcm.c
> > > @@ -756,6 +756,15 @@ static void sof_pcm_remove(struct
> > > snd_soc_component *component)
> > >          snd_soc_tplg_component_remove(component,
> > > SND_SOC_TPLG_INDEX_ALL);
> > >   }
> > >   
> > > +#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
> > > +#include "compress.h"
> > > +
> > > struct snd_compr_ops sof_compressed_ops = {+
> > > +       .copy           = sof_probe_compr_copy,
> > > +};
> > > +EXPORT_SYMBOL(sof_compressed_ops);
> > > +#endif
> > > +
> > 
> > Maybe call this structure sof_probe_compressed ops. Othwerwise you
> > will
> > conflict with the real sof_compressed_ops.
> > 
> > 
> > >   void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
> > >   {
> > >          struct snd_soc_component_driver *pd = &sdev->plat_drv;
> > > @@ -775,7 +784,7 @@ void snd_sof_new_platform_drv(struct
> > > snd_sof_dev
> > > *sdev)
> > >          pd->trigger = sof_pcm_trigger;
> > >          pd->pointer = sof_pcm_pointer;
> > >   
> > > -#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
> > > +#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
> > >          pd->compr_ops = &sof_compressed_ops;
> > >   #endif
> > >          pd->pcm_construct = sof_pcm_new;
> > > 
> > 
> > Here you are breaking the non-existent yet compressed support. I
> > would
> > leave:
> > 
> > #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
> >           pd->compr_ops = &sof_compressed_ops;
> > #endif
> > 
> > and only override compr_ops if SND_SOC_SOF_DEBUG_PROBES is set like
> > this:
> > 
> > 
> > #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
> >           pd->compr_ops = &sof_probe_compressed_ops;
> > #endif
> > 
> > Also does this mean we cannot support both "real" compressed sound
> > card
> > and probes in the same time?
> > 
> > 
> 
> Thanks for the review Daniel!
> 
> Tthe example you provided is not very clear to me - same condition
> is 
> added for both assignments, but I'll try to answer your question.
> 
> Existing "sof_compressed_ops" don't even exist, as you said it
> yourself 
> so nothing is lost. Changes within pcm.c are gated by _DEBUG_PROBES 
> anyway so the solution is actually very clean.
> 
> While DAI can have different cops, platform driver cannot. I'm aware
> of 
> the problem but till actual compress support for SOF comes out,
> minimal, 
> probe-only changes were a better choice IMHO. After all, that's not
> a 
> problem to make this code smarter in the future - not a farseer
> though, 
> can't predict what you're going to add for SOF-compr :)
> 

Indeed, we can make the code smarter later but I want to do the code
cleaner now. 

I think I had a copy paste error when providing the example.

So, my proposal is to override the platform driver compr_ops field
with probe compressed ops when CONFIG_SND_SOC_SOF_DEBUG_PROBES is set.

The code could look like this in the end:

#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
          pd->compr_ops = &sof_compressed_ops;
#endif

/* Add a comment explaining that we are doing override in case of
probes */

#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
          pd->compr_ops = &sof_probe_compressed_ops;
#endif

Also, I think there is no need to define the probe compressed ops
inside pcm.c

So, instead of 

#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
#include "compress.h"

struct snd_compr_ops sof_compressed_ops = {
     .copy           = sof_probe_compr_copy,
};
EXPORT_SYMBOL(sof_compressed_ops);
#endif

We can do:
#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
extern snd_compr_ops sof_probe_compressed_ops;
#endif

or even better include a header with the declaration.

And add the definition of sof_probe_compressed_ops would be somewhere
in the compressed probe file. 


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
