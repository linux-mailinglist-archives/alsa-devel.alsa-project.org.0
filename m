Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 312E541E505
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 01:32:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C25416B8;
	Fri,  1 Oct 2021 01:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C25416B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633044772;
	bh=pHRvTnHfGgnqh/v0R1f5YE6ZT6SoDo0AztUExzT7QLM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LkxXGCouxn8KGFdb3RreMOWPAqyE17gQT/hDVxF6dc1fPmnvtFeUJNitfWr1TgRR7
	 HzudlY/ixGYfmqN4+m5n4GYBSPYSHgJFrbkqugn5gx39l/7yci82T3/ZJLQvM3MH8O
	 Xmf0lpqIginY15JsVZSIDI6yQ0FPSh8ZTQHwWtKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2AC6F804D1;
	Fri,  1 Oct 2021 01:31:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 579F7F804BC; Fri,  1 Oct 2021 01:31:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2123.outbound.protection.outlook.com [40.107.92.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFC0BF8032C
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 01:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFC0BF8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="aNhmcLya"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9cPRBllLlrWJ8ovdCmVyPuKNhBvaRCaBno0IyfAv+9wRP1eTwK6+EqyZDu9xeRWJ4OXD9iDa56Q/W6GQdeYHb6a83AA9xtGrsDR6/ZaVKcCqcBStcCbhRKMbO6dOnR1E7hbNN0rWRQJBuX6NesHEm3YBtwiA4bx1CVp+N1NGJkwUYHpgkxvKw2ibmdbBbW7vBuTjpANEGvVttGCye0ZIzhWmMnnMHnqaXplDqg97Z3azgrZxCZ2jH/GUuKYGeVVC7ElUNGio+g+EHYqNzChTRSHNZqlY6tU70Rl66uFKVwQ9z+4NPH/c/hotAVOmFlFcUygLrfHz0DLcH7JhSYmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYkf/P4CdAweGGME5i4UNLbiUuei2CpYY8mJ9137Ykk=;
 b=m+x2vHstNWFSv7cDAlcAnzaFRVICs8qn8Iz0IahGydwApNyySpufj0ji13iGjPg/HPYX3O14d3917wfefY1JT/RH+OCfRpy9mWFZs2rcUm2C9AzXt4Omgx8dT2tcglG35j+H0C4Ljpg6JIDxwxlSHykHDX7oD/AQl1Kf0fZckUxjYFZGJ7RIoUBGtnwHdlQSAMHA5bA2JH+mFnBKdiP34Mtl6f3FSNYlFsTPqh0RddFSbz95tE9RgEoZWzHXiWHEyHVres+2D1PqJeWaHWJMcRXGF3tShYfWflfPJdzQSqYsQhfxoJjHSu0QGXOCBFyxmRAa+DSNhnYC0pWO8kW7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYkf/P4CdAweGGME5i4UNLbiUuei2CpYY8mJ9137Ykk=;
 b=aNhmcLyautbvC8Gzv4flVh0XOwusZP3AGi8hPWWe5ELWxKGLRE45t0U7yB7sWeinmqc5DCEodRk10M13g9kNxUGb5sdR3rwgkzNiviujNEVFAjf2sa+pZ4lh7fQXDXxk4dYBqGhYbNcFEkEX3sjaSwppmhTBetrMNCPRR3G5nBQ=
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 by SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 30 Sep
 2021 23:31:23 +0000
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178]) by SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178%8]) with mapi id 15.20.4566.017; Thu, 30 Sep 2021
 23:31:23 +0000
From: Ryan Lee <RyanS.Lee@maximintegrated.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Thread-Index: AQHXsZF45/jZbOMADUKIjx+r35kUIKu3/BEAgAAPiFCAAAR+AIAAC+UAgAAIKhCAACX/gIAD0nCQgAEkjoA=
Date: Thu, 30 Sep 2021 23:31:23 +0000
Message-ID: <SJ0PR11MB5661A19958E5E41125FDD695E7AA9@SJ0PR11MB5661.namprd11.prod.outlook.com>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <20210927160622.GE4199@sirena.org.uk>
 <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
 <SJ0PR11MB5661814BCC6B79EDE1B0967AE7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <c5031731-dd58-ff7a-857e-b9e1b748d3b2@linux.intel.com>
 <SJ0PR11MB5661A2F6089A9AEF4143C11CE7AA9@SJ0PR11MB5661.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB5661A2F6089A9AEF4143C11CE7AA9@SJ0PR11MB5661.namprd11.prod.outlook.com>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=maximintegrated.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5154ecc7-fd6c-4fff-8410-08d9846a6a49
x-ms-traffictypediagnostic: SJ0PR11MB5663:
x-microsoft-antispam-prvs: <SJ0PR11MB5663E551AF8CDD201F237A0DE7AA9@SJ0PR11MB5663.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OmMEqMLR4v1NhSh71UfptqOnooQEBkj0LaeGTQghqT4qh2MDc35w1Z8cgl+nyDS72fwj/vPs09F6X1DQf6kWTU08ezYWxUpjmYzNLlZjVcO3HQKlrzSqtWNMga3QfzZ46HK+cXsTKjrkctP4f/yGoehwt7tmLIfcug7sA72U6SGM5AWqmN/mGBypxcPq0+mbxNUS5GYLNPB4gnxV/ju3+UXRZKqbr/28Sd278PpVc3n094GBHyEDjvRS6RhidbKUwA6LGIkXxo6mkNuLe3GRAUZnqAagizCKuQs0g5PvvDnTHqe5yoOJzTDX7y3rWL+VlosgeZ7IDpSq5He2eo8MHFjiEy4/pF84zZzaamOtt4/eTNEAQz+Dsa4D3TWmqCLRGNYkidFyDkD+3lYHb5G8TXtkBEjGWhKuhV5psrfzualCm1cTB+tHoK903jFsYIvqkstl5HhUOLWHwOXwKPkvgV6Yvo74ujh/8lNsciGopz79h7TJaXAn0NP1U1D7kq/CXcE28z9OkcErqBYXKmElm4lbDS5fkud5nVrUhfHEBh2gZyGh25/WZgHuWOeEKLN3Uj23UZx+znyQkHPuBP6nbADU3Xk2Uk+HEjlaYYccgjOw7MuTRJycRILCkvw/B2LQwRH1ajrTDm/8IRxPooNHUyaKJgcfgSHJk+S19oJBy2vqF50RzC4bI1R2xi0uQkZOWxkLu+NEvzO6uZuV6HVN+xawkS3LQSFxn+u1xTIIRrgh0zGufLqAi7uEHVku0zTJByKgWpT1XifxqxHp/tRclHVK9cb9nHotSd2ZcZ9/M/H21iF9pgPeuCO+HXEQgyuHXq8GqW/RRFWR1DWbv2ewB6L4yfzetqswr8I8K/1xWdE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5661.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(2906002)(83380400001)(7696005)(71200400001)(6506007)(38100700002)(186003)(45080400002)(38070700005)(55016002)(966005)(5660300002)(122000001)(508600001)(9686003)(4326008)(54906003)(8676002)(110136005)(33656002)(316002)(86362001)(76116006)(7416002)(52536014)(66946007)(2940100002)(66556008)(66446008)(64756008)(8936002)(66476007)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m5fSLobYQiulgynhAAccrJnWmWNlgtJ+ChKqGfSXPPG9/dEpbNELofUwMBee?=
 =?us-ascii?Q?UjMWznDsnzrlYeMuQYV9651/KpfK3chAFkHV+niIbehsVm/D9uWz4QAVhcXe?=
 =?us-ascii?Q?yLPxH60z/4SSvdyul7pO7TXZyTDmhk6wkN9pD6mWEi6m16cO+kmkzjSA1jfb?=
 =?us-ascii?Q?vJPmnvIPCQ7JUMgerIb4EITiaxrKvwiIMS8mHt2+VTSS7GGIoCpymrHgxi9i?=
 =?us-ascii?Q?ffzUFT82JCO/H3L0hVCgZVYodqQkrTAEv2P0rcyBfH8KtNTU/NEAuSV2AOuy?=
 =?us-ascii?Q?jvCj6U4qtOzC95oM/SXjmKHKkq8jfb6QnkjvhqnNhlm1TGxKnJuyEFqy1m/U?=
 =?us-ascii?Q?3/WZK2AY33c6n9SpqQ9reALTbPZzfztkhK1w+BM0t4Zz6FmXVPvYM/GCvz7V?=
 =?us-ascii?Q?pXjOvBDkiKsVy288lsFg7oIrqp6dZMD9Q68ApkbG0SZ7ShU3IB9E5fzU6JZP?=
 =?us-ascii?Q?elokN+fDIA7LLGPozgdVlc93AlLnUMpeULKyd/+e37iZxXgj7/7ddAm3DFHr?=
 =?us-ascii?Q?lIwOpZ2xZ4fK2uaMnOiKYy43/bmThGSnQIJr96k6CvNa9Zh2VOaE15/ta0DH?=
 =?us-ascii?Q?XBEgHJsdJng5UKqY7K10yip9pVksmnwnL8jFg9llkgAZAcoV+us9flYatrvk?=
 =?us-ascii?Q?BfD22SI+5bQzofZYplOaXt7blTO9koEmjmI0FPZfnlKl2a+s+knwKWuuegp0?=
 =?us-ascii?Q?6Zo2/Y8HixZsi9sd2w+6IR8VmYCitblUGUDzFhiz+HujSP4mvUrqm72+hFiJ?=
 =?us-ascii?Q?jKjGM0GoQmzvd0qlUPz7e2FIXeKCaALTgCNPR61N2WLtvMZm034SbmLvOC1h?=
 =?us-ascii?Q?Ix3Sv/HzEhBy7Dj1QylVbHseVMqaqn74VtuHrj4U58istGf42qhC9kckVW6c?=
 =?us-ascii?Q?FIFGkEGjbOOz+AVpK7HueP6GjlqiQ+IGrFl5bD0PWK4O07zwvAxGOgV9CRe2?=
 =?us-ascii?Q?vjO9yj8YuN/tBt5tQGj0TY3gJYcrMA5N9bcH8leXehTX7djPXY2zz11hB6C0?=
 =?us-ascii?Q?xA4mPYXCG+rhlcKpC0iM2dlU80eULSKRtgw8uIBbukJstfw0Q+jiVlbTemDB?=
 =?us-ascii?Q?OEa94h2dMYgKJ+1hA3rSwZmjbU5ZnqfWvTGHKYTsyPOFt63oCciyrVJTlCMV?=
 =?us-ascii?Q?oAzDrGK+/NLmUcBY67pG5F3CCCkP7N5jqXIRGiEiEHJwbeQY4S0R5q+knY7B?=
 =?us-ascii?Q?68KDkWwHxWdTzYVex8VuuLksXuTaItWAeyIq2GdRTMVTH/5O/vLISKEGoD9u?=
 =?us-ascii?Q?7ruDwk9CB1S7ejIEgMGRhEIDv3/Uu4iGa+BzLd1vF3+04HpMBT+blBFnHTUZ?=
 =?us-ascii?Q?MU1/v0n3pVE88p4tLQGOfLUO?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5661.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5154ecc7-fd6c-4fff-8410-08d9846a6a49
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 23:31:23.2595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vpK/W1I5A+6LP9ytuQTZFCDZ134TQePjn8uU9fY2LJL7fsajRWUmec+dhOTnbKzItRqhhtXaGxYM7MhBP83yk4dZRKUbIqQEhIzF7YK02I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5663
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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

> > >> Instead of changing the suspend sequence, can we please try to
> > modify
> > >> the
> > >> max98373_io_init() routine to unconditionally flag the cache as
> > >> dirty, maybe this points to a problem with the management of the
> > >> max98373->first_hw_init flag.
> > >
> > > max98373_io_init() is not called because ' sdw_slave_status'
> remains
> > '
> > > SDW_SLAVE_ATTACHED' and 'max98373->hw_init' is already true.
> > > Removing 'if (max98373->hw_init || status !=3D
> > SDW_SLAVE_ATTACHED)'
> > > condition in max98373_update_status() function instead of adding
> > > regcache_mark_dirty() into max98373_suspend() can be an
> > alternative way.
> > > I think it is all about where regcache_mark_dirty() is called from.
> > > The difference is that max98373_io_init() really do the software
> > reset
> > > and do amp initialization again which could be an overhead.
> >
> > that description is aligned with my analysis that there's something
> > very wrong happening here, it's not just a simple miss in the regmap
> > handling but a major conceptual bug or misunderstanding in the way
> > reset is handled.
> >
> > First, there's the spec: on a reset initiated by the host or if the
> > device loses sync for ANY reason, its status cannot remain
> ATTACHED.
> > There's got to be a 16-frame period at least where the device has to
> > monitor the sync pattern and cannot drive anything on the bus.
> >
> > Then there's the hardware behavior on resume: on resume by default
> the
> > Intel host will toggle the data pin for at least 4096 frames, which by
> > spec means severe reset.
> >
> > And last, there's the software init: we also force the status as
> > UNATTACHED in drivers/soundwire/intel.c:
> >
> >         /*
> >          * make sure all Slaves are tagged as UNATTACHED and provide
> >          * reason for reinitialization
> >          */
> >         sdw_clear_slave_status(bus,
> > SDW_UNATTACH_REQUEST_MASTER_RESET);
> >
> > But we've also seen the opposite effect of an amplifier reporting
> > attached but losing sync immediately after the end of enumeration
> and
> > never coming back on the bus, see issue
> > https://nam02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%
> >
> 2Fgithub.com%2Fthesofproject%2Flinux%2Fissues%2F3063&amp;data
> >
> =3D04%7C01%7Cryans.lee%40maximintegrated.com%7Cb9f84a1267ec4
> >
> f50b7a008d981edcc46%7Cfbd909dfea694788a554f24b7854ad03%7C0
> > %7C0%7C637683680607026027%7CUnknown%7CTWFpbGZsb3d8eyJ
> >
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> > %3D%7C1000&amp;sdata=3DrARkwTSB3DN%2BCYxGaehOhtCGEj1eLBl
> 6
> > Mk7QhynQSY8%3D&amp;reserved=3D0
> >
> > In other words, we need to check what really happens on resume
> and why
> > the amplifier keeps reporting its status as ATTACHED despite the spec
> > requirements and software init, or loses this status after
> > enumeration....Something really does not add-up, again it's not just a
> > regmap management issue.
> >
> >
> >
> I do not see #3063 issue on my side. No initialization failure or time-
> out has occurred.
>=20
> Now I'm trying to solve the issue with max98373_io_init() function as
> suggested instead of adding
> regmap_cache_dirty() in the suspend function.
> max98373_io_init() was not called from max98373_update_status()
> when audio resume because
> max98373->hw_init was 1 and Status was SDW_SLAVE_ATTACHED.
> max98373_update_status() do not get SDW_SLAVE_UNATTACHED.
> I confirmed that the issue could be resolved if
> SDW_SLAVE_UNATTACHED event arrives at
> max98373_update_status() before SDW_SLAVE_ATTACHED is
> triggered.
> Actually sdw_handle_slave_status() get SDW_SLAVE_UNATTACHED
> but this function exits at
> https://github.com/thesofproject/linux/blob/topic/sof-
> dev/drivers/soundwire/bus.c#L1765
> before reaching to
> https://github.com/thesofproject/linux/blob/topic/sof-
> dev/drivers/soundwire/bus.c#L1825
> I'm not sure how to solve this issue because this code is commonly
> used for other Soundwire drivers as well.
>=20
> I share the debug messages for the resume event as your reference.
> [  127.490644] [DEBUG3] intel_resume_runtime [  127.490655]
> [DEBUG3] intel_resume_runtime SDW_INTEL_CLK_STOP_BUS_RESET
> [  127.490658] [DEBUG3] intel_init [  127.490660] [DEBUG3]
> intel_link_power_up [  127.490977] [DEBUG3] intel_resume_runtime
> SDW_UNATTACH_REQUEST_MASTER_RESET ..
> [  127.490980] [DEBUG4] sdw_clear_slave_status request: 1
> [  127.490983] [DEBUG4] sdw_modify_slave_status, ID:7, status: 0
> [  127.490986] [DEBUG4] sdw_modify_slave_status, ID:3, status: 0
> [  127.490994] [DEBUG3] intel_shim_wake wake_enable:0
> [  127.491060] [DEBUG3] intel_shim_wake wake_enable:0
> [  127.491191] [DEBUG] max98373_resume, first_hw_init: 1,
> unattach_request: 1 [  127.491194] [DEBUG] max98373_resume, INF
> MODE: 0 [  127.491953] [DEBUG4] sdw_handle_slave_status IN
> [  127.491956] [DEBUG4] sdw_handle_slave_status, status[1] : 0,
> slave->status: 0, id:7	// UNATTACHED
> [  127.491958] [DEBUG4] sdw_handle_slave_status, status[2] : 0,
> slave->status: 0, id:3 [  127.491960] [DEBUG4]
> sdw_handle_slave_status IN2 status[0] =3D 1 [  127.492808] [DEBUG4]
> sdw_handle_slave_status IN
> [  127.492810] [DEBUG4] sdw_handle_slave_status, status[1] : 1,
> slave->status: 0, id:7	// ATTACHED
> [  127.492812] [DEBUG4] sdw_handle_slave_status, status[2] : 1,
> slave->status: 0, id:3 [  127.492814] [DEBUG4]
> sdw_handle_slave_status IN2 status[0] =3D 0 [  127.492816] [DEBUG4]
> sdw_handle_slave_status IN3 [  127.492818] [DEBUG4]
> sdw_handle_slave_status status[1] =3D SDW_SLAVE_ATTACHED, slave-
> >status : 0, slave:7, prev_status:0 [  127.492820] [DEBUG4]
> sdw_modify_slave_status, ID:7, status: 1 [  127.493008] [DEBUG4]
> sdw_update_slave_status update_status(1) IN slave:7 [  127.493010]
> [DEBUG4] sdw_update_slave_status update_status(1) OUT
> [  127.493012] [DEBUG] max98373_update_status IN hw_init:1, status:
> 1, slave :7 [  127.493015] [DEBUG] max98373_update_status IN2
> hw_init:1, max98373->first_hw_init: 1, status: 1 [  127.493017]
> [DEBUG4] sdw_handle_slave_status status[2] =3D
> SDW_SLAVE_ATTACHED, slave->status : 0, slave:3, prev_status:0
> [  127.493019] [DEBUG4] sdw_modify_slave_status, ID:3, status: 1
> [  127.493199] [DEBUG4] sdw_update_slave_status update_status(1)
> IN slave:3 [  127.493201] [DEBUG4] sdw_update_slave_status
> update_status(1) OUT [  127.493204] [DEBUG]
> max98373_update_status IN hw_init:1, status: 1, slave :3
> [  127.493207] [DEBUG] max98373_update_status IN2 hw_init:1,
> max98373->first_hw_init: 1, status: 1

Thanks for the comments.
I tried to find the reason why the amp was not detached from the bus proper=
ly and
found information about CLOCK_STOP_NOW bit in 0x0044 SCP_Ctrl register.
It seems like 0x2(ClockStopNow) needs to be configured before the host CLOC=
K STOP.
I was able to get a good result if I add this command in the amp driver sus=
pend function.
The amp driver receives the detachment event and register restoration was d=
one properly
after the audio resume.
I can modify the amp driver for this change but it looks like this needs to=
 be done
from the host side. May I have a comment on this? Thanks.
