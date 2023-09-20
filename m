Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F677A757D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 10:12:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B184852;
	Wed, 20 Sep 2023 10:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B184852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695197529;
	bh=Ugd7ZwBk72e1PhSE8TiPWdqqQ62nIjhL5MjJItzh2AU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wl2lgPQE+FRJ0N5HF62xiKCDyA54rkf7U719nC66TeBUB8mE+OZW7InGtRmHOUlEY
	 yJE3PLV4apUbMWw5uo//nywEI5d2sOOqNPl6jQXr1s9nzG2Xzx1Td/QyB/xdeEn3ya
	 Cw2o/pAvsdsxqJG6t5UlTTai9ZhzNbrB4zrwxi0w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94444F8025A; Wed, 20 Sep 2023 10:11:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20CD7F801F5;
	Wed, 20 Sep 2023 10:11:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ABAAF8025A; Wed, 20 Sep 2023 10:11:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFE2EF800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 10:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFE2EF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=P25K81Y5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695197464; x=1726733464;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ugd7ZwBk72e1PhSE8TiPWdqqQ62nIjhL5MjJItzh2AU=;
  b=P25K81Y5oWzJ2RkT9I+zT309lDwYpTZhvO3RS3tXSreE67HjuBNpiPS+
   8jbeDnl0fSOSK0HGt94YV+Lj/kgx0dT+Y6Di/Gu5/ZIA6m2o2XgWT9hIu
   RuWNS9994VQ/UurIZU7pZL/9yyMfM1uIn7CY1bnpMEHYPVnd8uFUNh96N
   y8nUhsNPOyLHX8MH+U8klfPxvbx2NWjuWmKCgf5yBmLkK0cKxD9UB9TxK
   3W2O9GuGKtQEPF49nAzetX7aFiCKxqRoelTLUDsgON4hBh1sQCwSFesWn
   Kau+MglW5Cm1ye6JgB7zOK3lXcEw5qAoPdau9IY9nxOAwmSYwA2ne2Ijm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="360414584"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000";
   d="scan'208";a="360414584"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="812054141"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000";
   d="scan'208";a="812054141"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 01:10:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 01:10:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 01:10:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 01:10:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 01:10:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnpghY+u0eWtUtUJyePlUo+0gmh6BzOM85tdEnQEHZHxltFTEKHx0XC1CW1fKJKkxmmlBoimXlXCLBwsajfSNW6MHnYxj4ZaMS3LbPzdGgEq5uE/x3abLdCsZYgHMl1LC9Y81GYYozwgJ8njTZ3BG+a0BEau9xPwMlc6bcrMqUMJ4h4eEeP3jl8I6Pu0ZLNBZ4BgHYdJDKL9yBJxihVEFTS0lWrcmWXVaIVCswF+4i+/DJ9oZ3ObRVONdM335z7WwMezpy3/7PHJRXMTcrjnddzume9hVE0/HeavwNkd5nLVLk9zFr8Q88h6eTWRrZ2AQOY1mFQ6kVagzqfdtbO5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLS+Q3/Y/8smtlgySbyqxZAHdGpSKiHFIF5AyHYMAH4=;
 b=inRvsEzf7NkO/UIpsfpars6P77V4ELb97npkl4STG5cDaTCzFV0X5uAPMUX4dt/+rQEbzH8l38bvmRZQr9Mj85TJex5YDtVTuFVg+c5cPNk+4giMxsPspFAq7oSuR10OVjLf5TJj0HkSC8BoKN8VlERNRfsW3569Afe5+YACPkLpCp1tY5If95Dl0WtA5qnq/MWy8WnIYUHhmDGc5/lfp6rd/K+KLad/liki9EeeSE2/87xw76l41Bzp31Cotc9xhfsxkSMewdSc7exDdXCdeMZPwL8UKJVjWSxiR5va00fClQM699EFR9WogFlfnyShTXHckU3mLZjRPkEaXHMFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4080.namprd11.prod.outlook.com (2603:10b6:208:137::27)
 by LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 08:10:50 +0000
Received: from MN2PR11MB4080.namprd11.prod.outlook.com
 ([fe80::c414:6f14:4425:6599]) by MN2PR11MB4080.namprd11.prod.outlook.com
 ([fe80::c414:6f14:4425:6599%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 08:10:50 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Takashi Iwai <tiwai@suse.de>, Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>, "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>, "kai.vehmanen@linux.intel.com"
	<kai.vehmanen@linux.intel.com>
Subject: RE: [PATCH] ASoC: hdac_hda: add HDA patch loader support
Thread-Topic: [PATCH] ASoC: hdac_hda: add HDA patch loader support
Thread-Index: AQHZ6tKBP/fdeqaC7UynythkYAlbELAiG2KAgAFAyUA=
Date: Wed, 20 Sep 2023 08:10:42 +0000
Message-ID: 
 <MN2PR11MB408002C9F663ABAE56F0CE5BFFF9A@MN2PR11MB4080.namprd11.prod.outlook.com>
References: <20230919083209.1919921-1-yung-chuan.liao@linux.intel.com>
 <875y46xqz8.wl-tiwai@suse.de>
In-Reply-To: <875y46xqz8.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4080:EE_|LV8PR11MB8607:EE_
x-ms-office365-filtering-correlation-id: 3f89a3d3-9e55-44fe-e355-08dbb9b115b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fBaxAeYFNdNmxlNZOrIBtiX4bZx/6hT8/xO5EG4Z0AKyWdbPoYHz5GcTM9QrA9YGDQ42DueIMrvDqBxotIDxP/6HDIXMuc9KaYbraMhZAySdiWCgxSEy+roaXgsFxf9HOkynfctYkVeoZ/y5B0NS3r86o1/VOKU8Lph3j1TU+b3MdFLrV0BDR4DrAHCR7fQGs11GxSQGFKuwu08VrK8rd60xMA3qGen6TpRFtsHiesmpdubSfV2cfjK5Xo6t1iVNNp/MjA7r6QQHhncvsUIH858LPYhNmLssrBHCl7gPjdsnZiUehCNYNLp5GInUpw091PmLq+A5iS4cBs4kcVD2xiZ4XkcNiI14lbroGwGruEZe2lnuPiRRQYWSUOrUNFuOQIPv7+IxZ2SW2NtIRbiMKPn56BxTJl3E0R43IjPCIcfnVJAME2RlBLiFJzvys2//NSWUETTRg0SotFCx+lUYBLoLkCxftnbXpIcuKBo3PryhwxE94nkk/O3WrLMCMYWHoyX19th8cPqSnuI35cZhGXYtavDfe1NVIDUZyCRzdS0/nTn3xr9I5+w+9tyD5+/D2v4WdRry6aovAhbjxpQD2trSW6IY8QCz9b4YLpiWICgIxAFlUx+OYJB6IN9izQiM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4080.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(186009)(1800799009)(451199024)(26005)(52536014)(82960400001)(8676002)(8936002)(122000001)(4326008)(83380400001)(33656002)(2906002)(55016003)(53546011)(86362001)(7696005)(6506007)(478600001)(6666004)(5660300002)(71200400001)(64756008)(316002)(54906003)(9686003)(66946007)(76116006)(66556008)(41300700001)(110136005)(66446008)(38100700002)(66476007)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?EhXjQ91B0P9F/LJ+3i2zEx1H61vgs9H5CsRFPYv0y5JhiKbWtZ31+JW9vFeI?=
 =?us-ascii?Q?3pT3jtV+oWqT0AoBTYdpVyFq0rkXvkROCGTmVHSn9QaFVkcosoEDxI1EgCo7?=
 =?us-ascii?Q?nrDlmz8Jx34fRp1rZrua3kgFYGaJUxnmHVVyiuoQuBJtSemFwVqzPp6KyVIT?=
 =?us-ascii?Q?ahDuAZs6bfzhwjXO2/CWvZe/tcplJws3hCJ3aHBkMknpRCuQPmKDnl6HHW8F?=
 =?us-ascii?Q?bnClIoTcJMWh7KJ8zLIowGelObK+WTKpQgeA6cxbflpdn96q/AGh8MJ68clN?=
 =?us-ascii?Q?BQ6EOWoEVWRI7wMCxI0n2Z/OfPW4mN42PMA1x611j8gnwTXMsEEKgt/9obOs?=
 =?us-ascii?Q?Z1wOR7lrH9WDmfheK6HW268efmA5ogOYKND/h0s071iEr6Wx46WhI613En55?=
 =?us-ascii?Q?nhJHS1+/bMif3qBug3ONTvRQDdmvtKV/Afr6kvwDOcyEqoJSEF1tC5UnWJbN?=
 =?us-ascii?Q?QaCkq/tq4zqw3oFbYz5fuO+J7yf1fAHysuY/F6yLxd9h/uWLJ14INA2t2xgj?=
 =?us-ascii?Q?6e/EyEvlZQhjiCvOTSeQQyw1bpSeQ5n8FKuVQRpnqTVOUTj1yW9pBZj+UL/n?=
 =?us-ascii?Q?VXgmwvWUb6K8rsoYWk1I9LgZTo3dgbYRdLL8rAQ4zroqZvXn7rAhLMOAE3Yl?=
 =?us-ascii?Q?N9xZ1Re6iswgV6OVDxNAjIbwq1EPvjUe8ri1q2SKvXNBwKbaDLVhTaK3App2?=
 =?us-ascii?Q?QSn/XtNy/6J+0esOs+v/S4SJeZbMpSFccMRttVG5iIUbVY2/UuSG2qLOU79c?=
 =?us-ascii?Q?ipE1WNkKOqlg15ovGOKlGIaBw3raGOwAMmJNOh1SkFd22HBurqXz3svEL8eH?=
 =?us-ascii?Q?Snfxkm1XZDxQW85xAVZzyVlfxgcAgMeKAIoHQW3O6u5qwh+eAVdrvH6hiMdF?=
 =?us-ascii?Q?D6fTbm9eTc/6RVKNgrvVV7E4gkY+Hj5HHCt6JGYDOU3vWZK91yZBdPscqTh+?=
 =?us-ascii?Q?+3+alyLxV6dh8Xd/+OBE0LbUzbDOxfUTCq7Rw+9DH8Jz9oPo79q4p0I7RkTT?=
 =?us-ascii?Q?Ybc2i5rfKh20ffa5IwQKuaOIcdnc68fw2KdR51XJFDwFNY6CwzzmrVAJzp+5?=
 =?us-ascii?Q?szMc3dRylzQ13v71lVjJqhuVqRCnygFpmJgmXNHqfy2fBdiW0CiagyZtqiWW?=
 =?us-ascii?Q?Z29TXqB34PNY2H3yXsrXTvMJpUNhO9lHm9pX1EMDexf7LDl+s/xztMGQhWyc?=
 =?us-ascii?Q?l3ZydwdWNrPbdbi8BEVfcmfuZ4b17486iDClmnFo13pbCWVTgTKfz2ryTtCF?=
 =?us-ascii?Q?Ir8H2YaM5PTHF9zpm1aJfRdCzHUr4Z90J60WVIMzCrCk8hQFO8sJMmpi3XFC?=
 =?us-ascii?Q?uzr9Af4qsKun6WA6pdzcu4UI13283lWZYm4v4ZLsofAknkuudkYYL5ce9LrQ?=
 =?us-ascii?Q?t72LbwlFM1bOH7TQh4hiYMSZsxYkVrPrD8N6UlYmJd6DP24IgLqKFPLbi93R?=
 =?us-ascii?Q?uGczLsisFsWON+QJrIdGStrg0AanknPZGbZmZVh/yfjjQg+8uJkeGNvtjx19?=
 =?us-ascii?Q?TPjDRkBCOulwSbmS7pvDT5ra+VdvROaPzJR/UAik3Z5M8qg3mAjOjkk/V8fG?=
 =?us-ascii?Q?xaLN+EKnSwi+Ik7pDeY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f89a3d3-9e55-44fe-e355-08dbb9b115b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 08:10:42.7383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 pIaEu5qOAOTGg8lJ09Akd854XxHwWHP9PdLqTxnQ4fm66YW6nmI2GE9I+21SPjUwjXbBFM2SLu5rhTVNL76BYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8607
X-OriginatorOrg: intel.com
Message-ID-Hash: PSATGIX4JFNYIR6FPM3GCD2FDSTETJJE
X-Message-ID-Hash: PSATGIX4JFNYIR6FPM3GCD2FDSTETJJE
X-MailFrom: bard.liao@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSATGIX4JFNYIR6FPM3GCD2FDSTETJJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, September 19, 2023 8:55 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: broonie@kernel.org; alsa-devel@alsa-project.org; pierre-
> louis.bossart@linux.intel.com; Liao, Bard <bard.liao@intel.com>;
> peter.ujfalusi@linux.intel.com; kai.vehmanen@linux.intel.com
> Subject: Re: [PATCH] ASoC: hdac_hda: add HDA patch loader support
>=20
> On Tue, 19 Sep 2023 10:32:09 +0200,
> Bard Liao wrote:
> >
> > +#ifdef CONFIG_SND_HDA_PATCH_LOADER
> > +static char *loadable_patch[SNDRV_CARDS];
>=20
> Hm, this size looks wrong.
>=20
> In the code later in this patch, dev_index points to the codec
> address, and it's basically irrelevant with SNDRV_CARDS.  As
> SNDRV_CARDS might be 8 depending on the config, it can go beyond the
> array size, too.  Use a different array size to match with the codec
> address ranges.

Thanks for pointing this out. Indeed, the array size is irrelevant with
SNDRV_CARDS. I will change it to HDA_MAX_CODECS as it is the
available number that we probe the codec.

>=20
> > +module_param_array_named(patch, loadable_patch, charp, NULL, 0444);
> > +MODULE_PARM_DESC(patch, "Patch file for Intel HD audio interface.");
>=20
> Better to give a bit more description; when it's a codec address
> array, it can be  non-zero, and user may wonder why it's not applied.

Yes, I will do it.

>=20
> > +#ifdef CONFIG_SND_HDA_PATCH_LOADER
> > +	if (loadable_patch[hda_pvt->dev_index] &&
> *loadable_patch[hda_pvt->dev_index]) {
> > +		dev_info(&hdev->dev, "Applying patch firmware '%s'\n",
> > +			 loadable_patch[hda_pvt->dev_index]);
> > +		ret =3D request_firmware(&hda_pvt->fw,
> loadable_patch[hda_pvt->dev_index],
> > +				       &hdev->dev);
> > +		if (ret < 0)
> > +			goto error_no_pm;
> > +		if (hda_pvt->fw) {
> > +			ret =3D snd_hda_load_patch(hcodec->bus, hda_pvt-
> >fw->size, hda_pvt->fw->data);
> > +			if (ret < 0) {
> > +				dev_err(&hdev->dev, "failed to load hda patch
> %d\n", ret);
> > +				goto error_no_pm;
> > +			}
> > +			release_firmware(hda_pvt->fw);
> > +			hda_pvt->fw =3D NULL;
>=20
> So the hda_pvt->fw is only for a temporary use, already released
> already here.  Then...
>=20
> > --- a/sound/soc/codecs/hdac_hda.h
> > +++ b/sound/soc/codecs/hdac_hda.h
> > @@ -26,6 +26,10 @@ struct hdac_hda_priv {
> >  	struct hda_codec *codec;
> >  	struct hdac_hda_pcm pcm[HDAC_DAI_ID_NUM];
> >  	bool need_display_power;
> > +	int dev_index;
> > +#ifdef CONFIG_SND_HDA_PATCH_LOADER
> > +	const struct firmware *fw;
> > +#endif
>=20
> ... we don't have to add a new extra field, right?

Yes, I will remove it in the follow up patch.

Thanks,
Bard
>=20
>=20
> thanks,
>=20
> Takashi
