Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A841E4318
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 15:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E60417B7;
	Wed, 27 May 2020 15:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E60417B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590585230;
	bh=onywPezj8EKna2LEP83eJc8v6u6MfjHrKjXKf/BoCz0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S+hsTwPmZ9eTMAeBRBuUkDV5/A7uuxYqUYbCZT3QdRCe5hMDnst0u9/uIQUAqdzU+
	 xajUypAU6/XgOSbtrCRdSJBh2OzmZNhCbD3yTqeHMbv9WOSu+Mzel28TKsqFWEvbxk
	 dcfpHyRI33zde3JYOu/oN8reP6ivWBMZq8nUhSao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 647D3F8016F;
	Wed, 27 May 2020 15:12:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EA44F8014E; Wed, 27 May 2020 15:12:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2615EF800CD
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 15:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2615EF800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="KLUMTbyE"
IronPort-SDR: pGK6gykSFLyahxt0pqmiLYxZglftChcLVGLMH6GJbpR/zw5LrqUKIFaUwF5QyF/eoR3CTOyhtw
 DNsykD+NEBEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 06:11:54 -0700
IronPort-SDR: JHC7aZfSHxm2OLwgG3wmQcmDhlhwNCx/oNGfuGmXGlVkShxdirvjcTHx/BGrTz0rMQ9UcVH/hZ
 KnPGYxhZAZCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; d="scan'208";a="468703825"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga005.fm.intel.com with ESMTP; 27 May 2020 06:11:54 -0700
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 06:11:53 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 06:11:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 27 May 2020 06:11:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaIICAhzoBrQnYoZoQRn5mAS4oNkOxVfywj40o5nsemUkasgZgldCX2cBs1eiGB/bLsoY3NvcQvaOOxEbmm8z17olzJQJAmWUKEMYnNGaSJH/YIs8ganLlNwm1GzobuwYCkjXrQrDVR5RAjcgZOOgW/AMcZR3SOe4pT7PIFc2HDcLPAnyKWffgMUxIkhbebkYjlayZvxlypX7OXE0QTaFU8Efgb9xf0wu9ywb8PJNP8B/EQrO86rIbxnz87ubANf7+gLl9xXHjQfC9x1hSTMD5cI4i7sVXa+HsDZnKnbfOz65JDgCrNUwhZQdppf6u9h5fHwik6uK4w5u/YEL167lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onywPezj8EKna2LEP83eJc8v6u6MfjHrKjXKf/BoCz0=;
 b=VP3I1+hVCAmvELIzRjSWczlMOli9KJlgbbz2qt+jy/4nfdWjOAjjPBfsO9WfmNdbn9pPJLwcIWuiuaHDog5fFBxvnOCo8043F+tE1LRrkRHX0xfl+StaTNthS+1hmUXs/rG8tnpyC3n5+BVZ2c6pxdHbQ9E06OH7+5G+z+d/2qchHQYW+zItCtpecAv3QrPxDgTqzGopiekbdL8RDQRXa/TF8cSNr4MqZco7uu7jV3C5vsKAgPzi+u76UGgkGLeJCK5zR+2yMZVWaJ7yfqXwuMvekKvrUmkBRW7tB8AWBJ4e9J4mrFuFhah/mY9R+2UMfnyr3UsndPfcvtlRnyGh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onywPezj8EKna2LEP83eJc8v6u6MfjHrKjXKf/BoCz0=;
 b=KLUMTbyEzVxuBWqH676SLCmr501RuV2RDpopRdVKaG4v4m0JBjMNHiMuFcp2IC2xxbjv2aHPxStCf4c4PDkjalgRsZJNzoFfKOCu2aOwBJxvH0U/Y5SwB8WVcLHQN70BYzD+O38y2pYREZN36vrOkjnsVn8xu7mTPov+LIb7c+s=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BN6PR11MB4146.namprd11.prod.outlook.com (2603:10b6:405:7e::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 27 May
 2020 13:11:52 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855%12]) with mapi id 15.20.3021.029; Wed, 27 May
 2020 13:11:52 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2 2/4] ASoC: Intel: Boards: Add KeemBay machine driver
Thread-Topic: [PATCH v2 2/4] ASoC: Intel: Boards: Add KeemBay machine driver
Thread-Index: AQHWLTcyFDBbEyDmPE2qYPH90n0OFqi79htg
Date: Wed, 27 May 2020 13:11:52 +0000
Message-ID: <BN6PR11MB1953C13CDAA8A6D793730914DAB10@BN6PR11MB1953.namprd11.prod.outlook.com>
References: <1589768242-4594-1-git-send-email-jee.heng.sia@intel.com>
 <1589768242-4594-3-git-send-email-jee.heng.sia@intel.com>
 <20200518170933.GB28178@sirena.org.uk>
In-Reply-To: <20200518170933.GB28178@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b477a3ef-678c-4831-9ba2-08d8023f85bc
x-ms-traffictypediagnostic: BN6PR11MB4146:
x-microsoft-antispam-prvs: <BN6PR11MB4146B05A64F9BA9F1537528ADAB10@BN6PR11MB4146.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xJkxc8VibvTA5QkqgitcDVSF/HztiDDIIzZB7dWz7GyOpehlji7Uq82PZYAru3t180Jf7BEJ+4lwkUP8uooGrz0g42eAhIivlB9txVJ84t3jij6mhIvguO4b6x+R3Nut/3ulS6SNk7fFnhVE3QskFCv2TgzYLmKfKYQgr+vXt282yoArYOvFpLjUUnxlR4MBcsAdaMSNJcq7xkSLC1vDg3ZDBJzpuKxdhFoLYaDWuyetUqwpj+vY0BegZxKCv611m3I7qxMghe2HenBYQRILXdpVbie+6HJ7SFfi2gSBDahhUi+puyKSOJTwiGok18cwZapf5bIaRap+Z+ALtyI+sQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(366004)(396003)(39860400002)(376002)(86362001)(52536014)(55016002)(9686003)(478600001)(8676002)(186003)(4744005)(8936002)(83380400001)(316002)(5660300002)(2906002)(26005)(54906003)(71200400001)(7696005)(66946007)(66446008)(66556008)(33656002)(6506007)(66476007)(53546011)(76116006)(64756008)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MtIFtqotJMxGfLkNFCEehHG/uArBIMHxS/5yUjdb5PSWQFTXLowU91ymrhZKlLuMeSPmq/ExZFB7TQ2L/Zma5k866rPIZ9MdC0d0EcuZSQUX7Hkjec/kqjUZ0g/hRrlHaiq13H8JGS85ZVSXmNvFGWuZC0ZlOQAgFHKQy3lymCGwkhFMoIu/eOMAtOHV0NsGrr98r2QT0mzLgmuNxUN1PuLGB5ayO9XNuNlPiobortibDlsYjcPPna/pBf9AhIYxL6wiU2UP7dDzb9wnVRinailjAgmHTbf2QMV5qqw7EOFn5tm/6M8mZjqtGcsh9kLiOidPTU/JkVLAzGuW4BbFOs8qdiFHQSaOyHO0FFaMHEdkt/nmw4uCs6vdvT/RLCBBASupvRMv1VuTXRKsYS4imR+IqrQrQMTgx1S5m9f31T4nTe3+zduP5he6F1i7dEAq27zAAQleQ/jnuzFUE8drId+pcAvpew3RJcFA0i8md5YyEGGucVOXbVNzb+SWYee1
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b477a3ef-678c-4831-9ba2-08d8023f85bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 13:11:52.2081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/DEqfWHtUhvw3qRKVSn7/C87D4z02mw1DKoUYSdU0IjntvyAYbW4qKjMg3lQJLFLKfp8qdraBkWCJd2kzVjLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4146
X-OriginatorOrg: intel.com
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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

Thanks but will deep dive into the graph card. Will get back to you shortly=
.

Thanks
Regards
Jee Heng

-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Tuesday, May 19, 2020 1:10 AM
To: Sia, Jee Heng <jee.heng.sia@intel.com>
Cc: alsa-devel@alsa-project.org; tiwai@suse.com; pierre-louis.bossart@linux=
.intel.com; liam.r.girdwood@linux.intel.com
Subject: Re: [PATCH v2 2/4] ASoC: Intel: Boards: Add KeemBay machine driver

On Mon, May 18, 2020 at 10:17:20AM +0800, Sia Jee Heng wrote:
> Add KeemBay machine driver which glues the tlv320aic3204 codec driver=20
> and kmb_platform driver to form the asoc sound driver.

Why do you need a custom machine driver for this, as this is a DT based pla=
tform and I'm not seeing anything complex or unusual in the code you should=
 be able to use audio-graph-card (or simple-card but the former is more mod=
ern and should be preferred for new systems).

If this is required the DT binding should be documented.
