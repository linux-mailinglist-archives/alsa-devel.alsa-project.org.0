Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1370A233302
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 15:25:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F7C41798;
	Thu, 30 Jul 2020 15:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F7C41798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596115556;
	bh=d5a3rTYY/oYZ3a0rwJu3nM2tbxO6LsMBGgc1xFMpOrs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWcXGrKVZ5qBFu/LKTKMIZ0nyp2jTal06to10oigdl7Jwz3xTjhTgnGI0pDkrNCRE
	 izFbX7XxRz6DXs1bsXOdWe1YLgH5f+xYrxWWXDp/2QSYD6nnoVnomNlPJ9AJg2cFaA
	 0w9o28R2kQcXUbmMO7fkrZs0qj+9QxknG/c6vgnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B52E4F80111;
	Thu, 30 Jul 2020 15:24:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2341FF8021E; Thu, 30 Jul 2020 15:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16CF8F80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 15:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16CF8F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="H/fCxaFy"
IronPort-SDR: bbJZRZPnm+hs7hhdEHU94dgnzXozhbBjRsqWFqxcKH7e0SkIEJ6H9wPejOQtUZpcyL7u6cD7dz
 y/GvoRgMWXVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="131151957"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; d="scan'208";a="131151957"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 06:24:00 -0700
IronPort-SDR: I776F0NrFG552kLlO1CWyPFJn1oEtgWF544Rn0oaziE33SzxOkD3QlfoOZwcvFc/pSw6PjUigp
 f8Zgb+Q2ZSLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; d="scan'208";a="365170391"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga001.jf.intel.com with ESMTP; 30 Jul 2020 06:24:00 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 06:23:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 30 Jul 2020 06:23:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/sltpwQdAiufo5l+XoXxwxhOupS/kcJP1ER9qBRnz7ybJedU5se9345QuvMF7hxGrJEMuz4AMG7utM4DtRgAae3+m6q80tXdyK1O+lo5uFaEvaHdUbDjVZy07pTRLl6CUVHBSahR7yEDzPRQJlrvblXbRKsUVl+WLrVmacNwdeCJAfKyxOMgrdC61IhFHcSUzlPk3uVF66V80v7CJ2ufB607O8vwgB31W99KJsHV8V/mAuhbO/L24SO1/i+rp7tlE3aKZeUOuOd/HyLFxaWqaiG8UoyWy+3zZmNVywnvT9+ckA5YvCvKSTRjAOPqawZqnHnHV+QT2prXAmLfbmjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn9I8vmXvSCM3pPWZ+yOvAvXkQozqsESdQG/60kZXn0=;
 b=NjiEnARv37ZE3EQveP1zcdhHxz+9xJxbgtLvuDGjBkFL7Alaymseizdij8NBhUupzDp76/hfW5J+2Wv5EGGZG/N2Iw7CBB2snmWbHyOhJFmAKJr86k6+PnPF7y51kcA8U1QK4AyzaVD8L5WC0zwl4R3TaJlo9MQNvY+NAFIljM0l00wF+Tam+PpMG7K+GqBMBWd3RTPvGZ3yhAJaJsiIhWVaGU0Abwj9tc8+jjBBwh1v8Mx2OFSg04uU3bnEHwgTnznub1lxRhON5iuACIoAMJ0dDpZ8+nQm5FOCZb8EskjiBxQqA10/xgaiIfSpx8fhZ9E3LSEVCKboVi3tZnbUjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn9I8vmXvSCM3pPWZ+yOvAvXkQozqsESdQG/60kZXn0=;
 b=H/fCxaFy3uDF35KKVnj71oIj2V4dU0UJTJb+XVRMyXznQszWt6rXLVwXFmM7u9etbhi8vs+maE+oFilgOYGQDPofRoBcSWPdnjD+wohNgmpEb2DLLUx8EqrtOj+RqccvWxI/SUZGWy4p7sUpCso/7tonSjv+usckrG9FUF65zks=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB3930.namprd11.prod.outlook.com (2603:10b6:5:197::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 13:23:57 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3239.019; Thu, 30 Jul 2020
 13:23:57 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v2 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Topic: [PATCH v2 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Index: AQHWZkoGGca0TF6PKk6/guLEW+ciXakfzheAgABIxaA=
Date: Thu, 30 Jul 2020 13:23:57 +0000
Message-ID: <DM6PR11MB3642F476740FFDAB29C3B8DF97710@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1596096815-32043-1-git-send-email-brent.lu@intel.com>
 <1596096815-32043-3-git-send-email-brent.lu@intel.com>
 <20200730084219.GF3703480@smile.fi.intel.com>
In-Reply-To: <20200730084219.GF3703480@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [114.25.81.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3aae1587-ebff-4746-ea35-08d8348bd04f
x-ms-traffictypediagnostic: DM6PR11MB3930:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB39304F77FD2D2CBD83F5AB5397710@DM6PR11MB3930.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CED5KV+kMOmaj3g4iGKM6tbT+zUOhWOnRNOJ8NGWUsUbjlBztHvhSDal5vzRHBBrjv84eNvhQR9xWLtv52OeuItTbvNeam/uWjpU144zprCkEx47qhahC0Jxf/IeVvnNYi2lEX/zLvFNXNv6PPVBgGpLZEPV/KjArGmcgK8ZdZ50x7Lye3cOE7AzwEK9BF833RMLatk9EqLzmlzlG/GrGS08bHLapR9nRl+Z7eOW/9LDGmiVXzbFm39Ec8Ep2U+FOJ9X7tIoAKx4q0h1E/djqcAeU2Pzcmk0G3cQdkqPF5hPqFCZYTGe9KP4IekgkjFQiQmlOW4Op91D3gnzV8gqTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(478600001)(54906003)(6916009)(8936002)(316002)(8676002)(9686003)(52536014)(55016002)(71200400001)(7696005)(66476007)(66446008)(186003)(76116006)(5660300002)(26005)(4326008)(66946007)(33656002)(4744005)(7416002)(6506007)(2906002)(64756008)(66556008)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: h1CPt9DKWaCmJ5Q/gnCErkLBDhJPKVt6slOMItnyWEDNntUn/GvNeBKVIvl1uMVG4PGynoZT47xofe6DdUBffH9FW3SaRjc4kkI3DtRafvdyJ3Lz8sdFQTZ9OzA9m1zKdWwZdzKGCrkc7mtjXsqvmQQWnsrQ7H0J31JhFb2DGZlna3s3IhFmsIp2bXxUpUdl/HeiX/myo4aqF2eAqbhH/lLXw5RbZ/cyDJKjJxasJzGqpIKpXc+IlbNok40qoFjlypqYuoW907XMUsK2N5ikzsm4nf5Q0IlMmcB+DZTaIdlvlWqRztY99g0pyWeIg3lfAnhY5dIiXls5Ojs5Ko/+T1gLt7AO5KI5glGJVt4gnGYXa+NrPxBXDjR2YigtFDX5tYZrg3TAlToWoxoMU6mL9XP6SOm9y1DrK9it4Cj3ea4gcXEOUi8RCRSjZCo68aet8PyoIVwQKNQcNhl29v/O41W3ScD7LW4rwK5Jd4W0XEY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aae1587-ebff-4746-ea35-08d8348bd04f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 13:23:57.2142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LC3FknG/E45eGLiAoJsTr1tI1rTmAtkxG4j4uiO0n6uQqNLZsELDVqLOi+6E4EVtnwZModPswI82E2N3scXC9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3930
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Damian van Soelen <dj.vsoelen@gmail.com>
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

> On Thu, Jul 30, 2020 at 04:13:35PM +0800, Brent Lu wrote:
> > From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> >
> > The CRAS server does not set the period size in hw_param so ALSA will
> > calculate a value for period size which is based on the buffer size
> > and other parameters. The value may not always be aligned with Atom's
> > dsp design so a constraint is added to make sure the board always has
> > a good value.
> >
> > Cyan uses chtmax98090 and others(banon, celes, edgar, kefka...) use
> > rt5650.
>=20
> Actually one more comment here.
> Can you split per machine driver?
>=20

It adds constraints on BSW Chromebooks for same purpose. I don't see the
benefit to split it.

Regards,
Brent
> >  sound/soc/intel/boards/cht_bsw_max98090_ti.c | 14 +++++++++++++-
> >  sound/soc/intel/boards/cht_bsw_rt5645.c      | 14 +++++++++++++-
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

