Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EFA764440
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 05:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33336828;
	Thu, 27 Jul 2023 05:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33336828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690427987;
	bh=QXTFMPZ75ZclvLt2leSzwRgNP0ref9H9TkCnXPoWaFk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cy++rEF0L827YHqRk0iUXIDMBzQIZlEUKMfsQA6DTaImb5utXOHLS+U7EqBrCazmY
	 eCeZDsS18CLQ/6uHGSQ/yUs6o+Ofj7NI+gzoDEnAYKsl0gMvnGZvjGOfKQFQzhp8k/
	 vHjd/tAxLi3VFHqQ4RoQllQFbPwhnbtGUL+43jbQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1089F80544; Thu, 27 Jul 2023 05:18:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00CF5F80163;
	Thu, 27 Jul 2023 05:18:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3C78F8019B; Thu, 27 Jul 2023 05:18:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79D27F80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 05:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D27F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eKccrBuC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690427920; x=1721963920;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QXTFMPZ75ZclvLt2leSzwRgNP0ref9H9TkCnXPoWaFk=;
  b=eKccrBuCV+2MaK3FLlOJdZjBpz/kuwyhqJZW9k3XV77YmUQ60lKKqc+4
   9UjsHyV7RuX6hEBLDgfEzXdpX0ddIEITA6Llj6OvjmOcpYtwN7hwfyxJQ
   QR90V85y3FRVRc77pZD3zGZGOg4tlQ0rjtxV+b1zQg6HPTI4cic7AF98w
   nr07/zZKaMTgHVLf7R3mEAILEySYQee8AJFriqam01TE5uxQxfroW2lyJ
   ODEOkdbUw6V/amNNLZ82NtRWCE+iWJQ/p+/VpFQsG4pmQOPTc/w5VevE/
   XINwkWtG0V/dcs+1xOvLGwFtR1I0pQd44eq2gjTjKsuAVRdBOX4fTOlw6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399129127"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200";
   d="scan'208";a="399129127"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 20:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726772070"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200";
   d="scan'208";a="726772070"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 20:18:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 20:18:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 20:18:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 20:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTeOMc0FC3k571xM0NrW7QOAnC1dmVw47TsoFTYnP7zmH1FMchfwlEn7Y9z2LzXlLRG3SId3S3FiRYAsjWfvx7+JkRiV5XHS+TAd37bPM00UQn3xegaWzUaqulxcHX8jZyCR24XYupXC7EiuWTOKwBDOFTmgXlHg8cmaYF9fjpB5Ed3JpOlxWF9hsfInnXvuNNQ/qN7wF5uPfpwJ6gHIvtErgmhOS5QmBXhY0EYd4cOM/gWVPgk0yXonG2IfZ8HEHo9dG1zzfml4p9u9rMEsHggY8rq5cnSSdpFdTWr9w9/pPABWB8EKUKCQHMFXkbTqFPWbOMKRGbxivmfwN3s3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3scCrBvS+z4X6Zup6ZAo43aQc62jyV5Isi7wG9CiKTw=;
 b=KUCzbafCJVaKMUUEel0/lvZdQXQP8BOtvomtEpdXhWfvmKuJMdVHKASFO4O61GTfGJnIDtbljK8LOuIz6SIi6R78z79uJyZwgvjNt3Z9Kx8KjFPeO/1eJFgIiMzNAT/rub6Ewqgg4dOvim66aW4XZD0jiqPvNW5aP/47pVNuKn1zlHHD0PN+xn/g6qz+2Kr8HFRx4OvJ24ttwA5zQcE604ZvJ8bfusbdDTVXNwgQgDDAcp+EP8j4WpMn2mowHIROVs7hRGAAuzAr0N41IRrAIUez5hmFmmOG3jJ+iXS8axmFYAEPDh5QJZiyhUwGJQ0T5FtLmwuk70zmL0Yt15RzVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by LV8PR11MB8722.namprd11.prod.outlook.com (2603:10b6:408:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 03:18:32 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::12c9:6f97:4016:eabb]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::12c9:6f97:4016:eabb%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 03:18:31 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajye Huang
	<ajye_huang@compal.corp-partner.google.com>, "Zhi, Yong"
	<yong.zhi@intel.com>, Terry Cheong <htcheong@chromium.org>, "Bhat, Uday M"
	<uday.m.bhat@intel.com>, "Chiang, Mac" <mac.chiang@intel.com>, "R,
 Dharageswari" <dharageswari.r@intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, ye xingchen <ye.xingchen@zte.com.cn>
Subject: RE: [PATCH v2 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
Thread-Topic: [PATCH v2 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
Thread-Index: AQHZv4iOElXQr78YhkykGlIThIMz5K/MPSOAgAC1oIA=
Date: Thu, 27 Jul 2023 03:18:31 +0000
Message-ID: 
 <CY5PR11MB625703D8CC3F26441A4E73DD9701A@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20230726140848.2267568-1-brent.lu@intel.com>
 <20230726140848.2267568-2-brent.lu@intel.com>
 <ZMFJf2MM35KBFR95@smile.fi.intel.com>
In-Reply-To: <ZMFJf2MM35KBFR95@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6257:EE_|LV8PR11MB8722:EE_
x-ms-office365-filtering-correlation-id: 0e77e3aa-d2ec-407b-950a-08db8e50278e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 42BUzpSv1rfamcp0iwH9fAY2SQbrppJkKXsM1U6zvfqzwnZLVMsC+Eik7UIIhYQ67QD3FTV306mKe0iFkFVRbB00gCJcvcsS8Znee/tgR8gjncdZWxepQsjcxJSU63JfQB94H5jChfDsQC1FXLD6qHuG+zwr245rG6xESFNylmGUL1OxweTmXEceZ1C30Wr0m4n3SI0GeYPcvZF8qzxOUvl7EO473pla9iAkDDOz7ulQtgDS+5pryKNYgq808sfGYnsoMrQGs4n8R1uM6mZ1EZxC0EtgT2vw+o+du/bbqwg9WwzHxWM7XakLxzdFOvUSjdT7g0ojBtGVltZZfGjDeH//mfv1Q39gb37SpYFhOOiytCFczTpmT1lrsB1g7CmfvY6ZidQo3uFiebxv66WfNWAu4inCfat6fMWMhR/0Wl7cICjUcDrIVVYhgVBKK6Ak3ziq6eUKGuryV+25RmcafeugmZZBVl8Bz8LRgBIvlf1gCUNeWCSuJYJhBUYrnyQNgpCrZFyjfa4sA7HN7RdQZxBKkcMqdSg/DR1wDg77+OtWlzLjtJOEcbc/2LNW4uDP/gkeWrp+GCu30rTfIVDBhP2CaXaP+/XoLHuyHaswNbM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6257.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(186003)(71200400001)(6506007)(26005)(2906002)(38070700005)(41300700001)(38100700002)(122000001)(4326008)(66476007)(83380400001)(6916009)(52536014)(76116006)(66556008)(5660300002)(33656002)(316002)(66946007)(55016003)(558084003)(64756008)(8676002)(8936002)(66446008)(86362001)(82960400001)(7416002)(7696005)(9686003)(478600001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?u/Dd5xsBZfVGRC7LvGwizLCaQOxW5/6XtjW5TRho/rTqUYF5Xl/HCxKEzuuw?=
 =?us-ascii?Q?A/FbOmHHTpeRDuL3T/gZ5pyqdYrjPwFkU5daHfIAj0im0gLkXZAofciP08/B?=
 =?us-ascii?Q?9UiFt2Z30ZnV7WUw/MGv2QS28tbvR5pbHvKcqZRAB1e9745qAVz4bDLgRKiU?=
 =?us-ascii?Q?PPETXgqRc+4m2LzRnnRwnz5QKrQYLH8vRYf9ajcvEQktrjWIPp/01pqbmovN?=
 =?us-ascii?Q?GbOSRzcAdAYs73vnQNe4O3DBGnU4mECZV4QnCYYPpdetcRsekhzSSN6VEQDz?=
 =?us-ascii?Q?WXlo5utDJx1mbQme/7xi+x/2tkfTW5fJJHpw5Vlv6s5zJfBdbkhvIgQy5OsM?=
 =?us-ascii?Q?cB47Y073usC8QoI6PsI3nsQVRta5ANMraLehhW9EpxsyxsrCLrnyEJXCWbtG?=
 =?us-ascii?Q?Won1ygsJY7FzJwDONyNG2tvuD6oxpPGbFUCAy0zxDU9Nah/dhbfnPEf1eoqt?=
 =?us-ascii?Q?rnKFPvD9Mevp+dlxLziwezhbKAgLdqfbV8MZ5YLo8CqdI9DSkYkwglhlIGTq?=
 =?us-ascii?Q?mAsPjLY/WhIvH6nfhX6pW9MgiXduTHyUa8MEaTjwu7ooG21FueUGew9HsaDt?=
 =?us-ascii?Q?m1SNGKzNqMCgVIM7aRb18rfn6s9CiydBtDyNPPBv8UGE84flj+LF8sPeH4km?=
 =?us-ascii?Q?KwR2FynTgNXatU3+6OT7eo/uu6UK2ELPwEN5GO9iFG3BHx4BZVMvD7eDWqUQ?=
 =?us-ascii?Q?w9ArMSCm+OTaO0Hgwp2i2XpxETPto7HX8MfaWmP9LijnaU4PdP8Sh7lUJMiq?=
 =?us-ascii?Q?z8KvI14U/SZtVnDLX30Pl904Mfy7pjPMBZFP0Higo1mC+qoQozxQ83wGcUon?=
 =?us-ascii?Q?hmYP8ZTz3I10ouqDg6wgDBHYf3ACS9Wd2qY9Sg+v6niWaIOmxNq9hpfcQB5m?=
 =?us-ascii?Q?fmnP1tCPcsuI5nHWOHNX4CFFkUdWxlZlleMEwxtuYQb1IO91bE3TGJcXvdMK?=
 =?us-ascii?Q?/ZYJU7nALZup5IgCl89f352TMvfSnRTX2npCmavEGPhGN2QE4Jjc7UuJLrb9?=
 =?us-ascii?Q?wvQzwbwflQzJbR8w7cLP9/mIkyS52v9WtxStoCSAIPBMEhUue8p/VxMN7ib/?=
 =?us-ascii?Q?IqOSv4ymiy/mDBiq1tk42e+LY+KsCUeQnvxjIIMRvryFzm9NSShP0rim7I1y?=
 =?us-ascii?Q?5TtPPUoI7zyd/3t1NEEGZbdrF94NFwG79ZZMVVoSEA1Dep4hHaRb2LRlLP6+?=
 =?us-ascii?Q?gZkus50vxcrGLAJCxwGj/6UkVEq2KsA7DGJ8asKFX8Rj6FKaVQ3ISqJpqyms?=
 =?us-ascii?Q?7WSBtq6OkOmlKOPkWwy0MgJ25UNmPd3wnwhhBjoOIwwF7HsGS9O8Tq7bCIus?=
 =?us-ascii?Q?sivX+JJNzqemZGFWNjjjxdW3J0G0oUqHyU6kzwof4IzZqmZmdfr4RlOfiuqY?=
 =?us-ascii?Q?5facwWtcx3WkJzLnhZRtHo0mpjGu3Vv9ojFhucgJkw1K93yMUmXy+017YtvS?=
 =?us-ascii?Q?JOlloHqR3fQd8+2/kWHtPuiWF4ljxAgiIgYZiv5M1zPqPXY2TiA1hkVq1fln?=
 =?us-ascii?Q?MKy2J2YpQN0gZi6Nxnc3Q0rFqzyUnawEIy9/+Gy7KYhTaCCw8edDgWx97uT0?=
 =?us-ascii?Q?yGC8maEEapzuwjELz48=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e77e3aa-d2ec-407b-950a-08db8e50278e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 03:18:31.4709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 PXTWdtKNEDDVmJ56xLNmHKTO4PCTLA/df6o520n+q/3aD6bwyYXkCZeeHV8i1H0YbKt03p9R3mCdrSar888UKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8722
X-OriginatorOrg: intel.com
Message-ID-Hash: VKH3OWNZRALEPFREMNJK74BGQMF7QZSM
X-Message-ID-Hash: VKH3OWNZRALEPFREMNJK74BGQMF7QZSM
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKH3OWNZRALEPFREMNJK74BGQMF7QZSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>=20
> > +		pr_err("invalid codec number %d for %s\n", num_codecs,
> > +			MAX_98390_ACPI_HID);
>=20
> I believe you have struct device pointer available, use dev_err().
>=20

Fixed in V3 patch. Thanks.

Regards,
Brent

