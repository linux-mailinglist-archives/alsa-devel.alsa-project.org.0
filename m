Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA33DD14A
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:36:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C92EF1848;
	Mon,  2 Aug 2021 09:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C92EF1848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889793;
	bh=PKYR0T0UhPIROgmnDVtt655mADq3N1G+ImIkz5A6tGk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PjoKvz702dnlvB8IlZ8pyWclWh6+nvgFfSYyKbE2Ix3/IJusro03ad8pUCQ218gqz
	 i70+08Cz4j2LfhQ2ktqbNEwgA32hsMsaSFmDRaPh6xFp6I+juJVkaDKqymUxqnxulu
	 fXGL5msXRADvLkykW0b1rddK7+5TyEMNstZYIsHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EE1BF80579;
	Mon,  2 Aug 2021 09:29:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0C1FF80578; Mon,  2 Aug 2021 09:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0C35F8026A
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0C35F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="iy2MPpOZ"
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="200605862"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="200605862"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 00:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="583812171"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2021 00:29:44 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 2 Aug 2021 00:29:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 2 Aug 2021 00:29:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 2 Aug 2021 00:29:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeWBIRft4iaGcdD5aVwYUwF7cq20e71qgFndgwwkTHmADaHqy2caSZpWr9yseTuoQXiCIrWklJqI3bl50ioQHotHgC0aBirJwv1TK/rSnSq6+ezJtKSuUi4sSis/An2MeizpX+m4KX9MgIanKwVotYUx3bE9B9ae9zLAPa1ajEEuzNcS/n6ICQkAIdg2mkRIvfKC1HFWmKDxoyTkjxJ6BYN77Ht/L/Xi8Z+xbaRNTXn7NUb4hSmLgdU0ykyrqZdprZSjxEYVrW9PAj1sOnZyHOFaS8zl8Dvq9C/iuxbnq7t6Xedd8IUxX6bo+wzveszQ6gqjeXy8xPVqZFA6qlm4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS7elaOLuAUXE60zcF+aDtj3jC5uYJ7+naRi8E/3kUU=;
 b=Ii+iPh+vk95GoGxW24CwKEYv5fjSfOi0zxBT7xXadSEu63pQ/KjhIBed3HhwR675SkCfrE6KHWBIKk96f0/LqFrpKJKk/rv/KZQDQKBtjEWPIiDha0PSkxpB5jJ/zDSUhHx6ypcZDn6t4Y5YFtvuZZc5XMs54Y5vc88UQh3dECbQKrOFCQKOfeiEDJTSSnML6U2MzWC3YiZd8GAlUzGn0c7mL5amh2u2dzjTuAu6YSCjCkKSoldBuSI63jd/SUSsMQhV0dmL5NvSM1HASMo+KYD2BfL9vYmwzdZ8ZmRhTKd0F4vxXDkuohV9+tdLjjdnfryFJ1BD570GE/RuDnO1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS7elaOLuAUXE60zcF+aDtj3jC5uYJ7+naRi8E/3kUU=;
 b=iy2MPpOZmCQUD10BxjGokk3/G5coepzgId/Ho9SEHN2Q/kMuBbupiEZnUjpsjB3TBqosF9ulwjGWib2KMwn8zZJ2XaH01dUiGQ+2rp33QIjs6yiEE+IST4NGtLLYuNTAf6VjjIITaDcoQdLBApDmwa7vkMT0He1QCfZQ5AnCQNk=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM5PR11MB1675.namprd11.prod.outlook.com (2603:10b6:4:d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.21; Mon, 2 Aug 2021 07:29:42 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::446b:ca82:9706:2755]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::446b:ca82:9706:2755%7]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 07:29:42 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
 callback
Thread-Topic: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
 callback
Thread-Index: AQHXgqjlTCTSEmKH6kiOgKR2bsgT66tWXGGAgACBKICACMy6AIAAFM2AgAALGQCAABAJAA==
Date: Mon, 2 Aug 2021 07:29:42 +0000
Message-ID: <DM6PR11MB4074EF8726AA5ED297871225FFEF9@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20210727053256.29949-1-yung-chuan.liao@linux.intel.com>
 <s5h8s1sfevg.wl-tiwai@suse.de>
 <a25d47a6-2599-7101-cd93-e5304b271948@linux.intel.com>
 <YQd2BM3wGzKpfZn1@matsya> <s5hpmuwz98o.wl-tiwai@suse.de>
 <YQeQxj7Ejh14jIoc@matsya>
In-Reply-To: <YQeQxj7Ejh14jIoc@matsya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1d284a8-d9a6-45d9-7a88-08d955874b42
x-ms-traffictypediagnostic: DM5PR11MB1675:
x-microsoft-antispam-prvs: <DM5PR11MB16759B17A493B526E28A910DFFEF9@DM5PR11MB1675.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PByKmVxsqAW+E83e3KaxjXXERKoY/eBEjUq11rLPigQpq6JssYB3zZK8NXrimHnWgd7uqKcPA1MUCbUgiVR3agE1Rymk4Bz0Fd4MsPMDrTQdOyLyaTVL7b2+7u55i79GczAs6KC2YIH0dKJ2ftMlUMQxMxVoWoAu8S/ShLT7P5ohHppjGD1pX7iJIEhlhA5kw01knC2yhi1ILT9C2JxYrhdMuQdscazRTYIxg0/seqx9ogJRno70ZXlfXTqW0kAVjigQwskg5QEN2jpMZVZ203tGs+NKgCCVO5q8GhfupJRsktsvtfwb743sUifzI9c22hMNgEI58uEm3gjuOCVvs060YDHnMDkNItBkBeHgt6VXImWg/lzvhbV2rW/Yt8iPjyU6NgOaiZXRinBDb7d22/iA0RMuuS+ag1+XWRD/ixoaNucgr8PiCEomYqCaaJQIzW5w7amhsVqlGgKHgeCVit6QQztt9jVqRXrfMVLC5taQPyC8jwePRB7s/gOyU4qZyVN49KrhMmTcBR8vgGY6zebUMFdn5fVp0BWov6Ju+Q02koEm1TFXP5wgXLcGXzuQq3CnH9uQ3Vn8YO+cpAE9GhwIXo6c7cJ2/65xx50u/lwETbZbWVGQATZ9Y2NI9qD22hThq2id3/sjz8ubtOt4+RlcQfAHceSg63SA1h35pzN1EnQOULKn+9kroiCyMrEgwrDl36XHh86DgR22noubavCZxMAPt1Y5Uy4GVzs2mnA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(55016002)(4326008)(54906003)(33656002)(52536014)(110136005)(53546011)(38100700002)(71200400001)(76116006)(8936002)(8676002)(66946007)(7696005)(66446008)(86362001)(6506007)(478600001)(38070700005)(26005)(5660300002)(64756008)(66556008)(66476007)(186003)(83380400001)(2906002)(122000001)(9686003)(316002)(142923001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3BeHlvfsI+RRj0/2U0Ydr3KuhG27xi1rGzoFsBKicyY1EOXNETz21GbeaGeX?=
 =?us-ascii?Q?eYIdbxXp/M++rpG07yLStmIsUnrtYDSKT0FXDJm3iD2PKPszUNQx/dANYJfV?=
 =?us-ascii?Q?BTpruZqtY3eJ7AqcEmXHlIeFYtpuZHErW2WzRLwSh+AoTYHuhpeZfKOmkakR?=
 =?us-ascii?Q?NtbFYElZ2qSHtWygXVfaUFh7eqq9c43EV+v1lsJh+wag8qmbypN4hAQeAq0l?=
 =?us-ascii?Q?apA66RxYHbobA/6VSvQ+CtImZnNpH35Acp81SZQT7BTC5htxwZu7CZVWV6h4?=
 =?us-ascii?Q?M5ZW+o3FK4NqzwyOZZyPOdRovBgknc5TCScQG7ChemcFLEHqJ0TATgWfC+dl?=
 =?us-ascii?Q?28j5B2l7fl9qIs+7Vr+LO/izwlFTGBKJLLh7wt2w6hfSrxKSTfqTUJ8YLxms?=
 =?us-ascii?Q?DxArrgSoLgs9H/IYlkOyl9qWizOWu/ONEHhxtxahRVI44dVjV6fzvA5zL9Pb?=
 =?us-ascii?Q?MQimbk6cSsfPBMRIW5f2JB9s3pVjI0/yyXX0JKdF/A0uhZBwvBQljnM0nin8?=
 =?us-ascii?Q?0BssZdluvSlYMmN+LtBJhpYd00QVaXBRGN7aqHeer7N/6pNClbVjJygM8j/3?=
 =?us-ascii?Q?0lVpFxWEHnnGKbeq/t2CKw0eAWb8RLDT3Aj9HykUGy4Mij+yeihOdxsMM0C3?=
 =?us-ascii?Q?G9DX7fKT9bvo5tHdWj1Kc3feJXj/00Gmv01U2etdyRnZLbnQ12nsotgx7Bpu?=
 =?us-ascii?Q?9CZ/6AYs7DDkGYuPkhNih1Zqa9N9oOhV6hX1C9/7GpzZoKseBSktgGZ22n4Q?=
 =?us-ascii?Q?LwpCpOEoPriXkq5o01uW25zuf5D7lOEasEYDYwBpamiNSrkTrwkMZHahB/pf?=
 =?us-ascii?Q?jch2N4haiX/Vb8Q6f1MAiMpaJ4td/pIMMcBjGAd9yhC0Ax4j5ZD7NJeZGpNi?=
 =?us-ascii?Q?mNhPAlW1Ll0Pb+jmQ6G4YtGAza9CIkpSfwXWzbhasS5x9d8v1DiwtmYjXuHE?=
 =?us-ascii?Q?3di6ifldEvGrKaZYtTiWELhoPdvT58woDaj/6R7JuElG/5+kuqAWSBKxOBoh?=
 =?us-ascii?Q?LXblyOd/kLbYOPDogQeLMYTZvI1Tevqw7UdzQQMaICA/x6y57Q+Bhr6UW5Vt?=
 =?us-ascii?Q?nST7wJcfV0C8TXYZePB6sAmepPKlDcUr5OEObfQCU0V3lXbLKD0OiMY2vTgJ?=
 =?us-ascii?Q?j0PJTt8j7XELmM4kE9stZFPm1AgF08Axca5Cm+fx/26X3RTcvJFAGhyKmvoY?=
 =?us-ascii?Q?22RvZLOS0xSvL+zuCv8+PdyZ442kM579m6acbbWlsVdHDhW0vEBHuHhrTy7g?=
 =?us-ascii?Q?jwOLQrm4COsV0p1s66DA5TrLNYYpVslBDcgkmoSXEVjBZlkCHWge0Qkn+d2d?=
 =?us-ascii?Q?CV8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d284a8-d9a6-45d9-7a88-08d955874b42
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 07:29:42.0380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gsg13aswhOGsNL/DxCUOdZHPtmIdyQAv91spSLQLk/gU7naATQAO9e4dTnPh74gihSmMgGob7OikVL9XUuH3Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1675
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>
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



> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: Monday, August 2, 2021 2:29 PM
> To: Takashi Iwai <tiwai@suse.de>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; Bard Lia=
o
> <yung-chuan.liao@linux.intel.com>; broonie@kernel.org; alsa-devel@alsa-
> project.org; Liao, Bard <bard.liao@intel.com>; Ranjani Sridharan
> <ranjani.sridharan@linux.intel.com>
> Subject: Re: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
> callback
>=20
> On 02-08-21, 07:49, Takashi Iwai wrote:
> > On Mon, 02 Aug 2021 06:35:16 +0200,
> > Vinod Koul wrote:
> > >
> > > On 27-07-21, 09:12, Pierre-Louis Bossart wrote:
> > > > Thanks Takashi for the review.
> > > >
> > > >
> > > > >> This patch provides both a simplification of the suspend flows
> > > > >> and a better balanced operation during suspend/resume transition=
.
> > > > >>
> > > > >> The exiting code relies on a convoluted way of dealing with
> > > > >> suspend signals. Since there is no .suspend DAI callback, we
> > > > >> used the component .suspend and marked all the component DAI
> > > > >> dmas as 'suspended'. The information was used in the .prepare
> > > > >> stage to differentiate resume operations from xrun handling,
> > > > >> and only reinitialize SHIM registers and DMA in the former case.
> > > > >>
> > > > >> While this solution has been working reliably for about 2
> > > > >> years, there is a much better solution consisting in trapping
> > > > >> the TRIGGER_SUSPEND in the .trigger DAI ops. The DMA is still
> > > > >> marked in the same way for the .prepare op to run, but in
> > > > >> addition the callbacks sent to DSP firmware are now balanced.
> > > > >>
> > > > >> Normal operation:
> > > > >> hw_params -> intel_params_stream
> > > > >> hw_free   -> intel_free_stream
> > > > >>
> > > > >> suspend    -> intel_free_stream
> > > > >> prepare    -> intel_params_stream
> > > > >>
> > > > >> This balanced operation was not required with existing SOF
> > > > >> firmware relying on static pipelines instantiated at every
> > > > >> boot. With the on-going transition to dynamic pipelines, it's
> > > > >> however a requirement to keep the use count for the DAI widget
> > > > >> balanced across all transitions.
> > > > >
> > > > > The trigger callback is handled in the stream lock atomically,
> > > > > and are you sure that you want to operate a possibly heavy task t=
here?
> > > >
> > > > It's a good objection that we didn't think of.
> > >
> > > Doesn't Intel use non atomic trigger to send IPCs which anyway
> > > involve code which can sleep..?
> >
> > sof_sdw.c doesn't seem setting it?
>=20
> Yes I think init_dai_link() should set it. Maybe Pierre/Bard would know w=
hy.

init_dai_link() is to assign dai link elements only. No IPC is needed.

>=20
> --
> ~Vinod
