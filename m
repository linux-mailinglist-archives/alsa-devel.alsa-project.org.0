Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5F7663F1
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 08:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8430846;
	Fri, 28 Jul 2023 08:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8430846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690524848;
	bh=UDPhK4RG+voqrts7KkmNFldQ959ijTyUVhtNq9yoCXE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tcut+rMJn3veigG/evCZddspgYOZfqRHWeSFq5y3uOkXZCRMTZFfnrt9qvysiWg6Z
	 mvLjX79MAa7klnndp3v/xIPyGCw8r+aeO4cOSZdBec5XUpokQdHybCkEDKLFSIsS7E
	 xn36A5U9ot3H1LduuxbuQpMHeeqGOKtGW5uiSfM4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E33AAF801F5; Fri, 28 Jul 2023 08:13:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85630F80548;
	Fri, 28 Jul 2023 08:13:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C43C6F8019B; Fri, 28 Jul 2023 08:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 162CCF800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 08:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 162CCF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lfPh3Cz4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690524681; x=1722060681;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UDPhK4RG+voqrts7KkmNFldQ959ijTyUVhtNq9yoCXE=;
  b=lfPh3Cz40sLqMW/vfkXD3NMOxmUZZmj+HL4oe0ySnmqHDMyWZJI+09Ss
   EccExpvDuU2vfZEofK0Uld992K+//GTcxpR2kx2i7WttqX615cLHsic5n
   523CbTMWken5fTnjcbgO0ESKcOF8i3qPI24lJEJvEsHIsojGp4ybs91Vn
   8Xni5The/6ywr7mWid2Ck79EzprM/eTQHTF5WGEuq5EcdQurzCTKE90gW
   Yp1cEU3OwuLmG71sLF/v+lcoeRKi0smcGY28Or2G6Z9Nla6cKpinIQwCn
   T9AOZ6tyTVB+1t1Fcm0RDv8qVeSRHQvavBjyGYrC0D0MlBECCd6XKTTdH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399451835"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200";
   d="scan'208";a="399451835"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 23:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797315642"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200";
   d="scan'208";a="797315642"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2023 23:10:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 23:10:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 23:10:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 23:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoPvvTb1IxMFqb+u6PS4cUz0bRJ5YyR/wJ4fmYInRl5mPpMbvTM3UT4m4f7L2Bqi8PlUVZjuSafFXs20Hgtvg2/6KkxTOlFPcoPmvmiYzC3mzfuNSiGr9KjbIMD68rimOmvheyvWsxaCGqfwgkndubdaaYG/K21B4ymeAj7+tRez5LVawHGr/GAvWTaxE4j0R7CAXLSgN8ZefYSmDRLpoNKxQgF9j8DKsPMUpmvNZxwb+NWQNjug9u1ZXaa4vgKA0emR5TtXXTYy+8SVpUgiwm2Nb+MiAE7DnfyKDbidvT6rrwtmAkN40Q6u3fTt/otI8dBLmjLdg9jSalHQlnjCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c9nWnvhout87vwQX2MZl9C5KQoAJcA+GsrgmPkpCUI=;
 b=W8+NypvFIhQhe5iYcETZ0C0D73lpWhjKD6eiZ8a8Ukz7QKIayPwWjCZyg6GdNdswEwy1V/GGkjtZMDsknkRTbkP4xi4k0/NwInXn6djUMj8C+JxIlvjc7HQpO5PAuDDWdO7x6qQoXFAH/Ajd5uBMRnma2MpkvzvNslsFhaKgQ2wvqxEybDieeILidMBrO8COMDm30oDO3GzAdu/NHO206sEkVIBgFIbS2gCbu3CYmLqo2gJK776i6sGvXXmhi35jfNeecOY0kbZ4UVR39PEyWmJk/gMKgCH4SIMfixi3FO/eNt82MAEVDKVnopxrgLbJ+pFoqllrtzHQYVT/eZ+qTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 06:10:44 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::12c9:6f97:4016:eabb]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::12c9:6f97:4016:eabb%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 06:10:44 +0000
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
Subject: RE: [PATCH v3 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
Thread-Topic: [PATCH v3 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
Thread-Index: AQHZwDUZO6mj1TKwEUKaGOiVkgw2Fq/NZsAAgAFLSmA=
Date: Fri, 28 Jul 2023 06:10:44 +0000
Message-ID: 
 <CY5PR11MB62573C5E84F29D3B211492889706A@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20230727104354.2344418-1-brent.lu@intel.com>
 <20230727104354.2344418-2-brent.lu@intel.com>
 <ZMJESOsmm/0ta+Nc@smile.fi.intel.com>
In-Reply-To: <ZMJESOsmm/0ta+Nc@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6257:EE_|CH3PR11MB8705:EE_
x-ms-office365-filtering-correlation-id: 4e47dd0c-747a-4f24-15c7-08db8f3160aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QHNYnWoOznO+PNBnKd0Th7SwvxOoQ08F9yRkRLwqktKzkAd/M9daOqf5FU/IRJDqGzTSxtepu4umvDwnlj6C2S9N8EdyadgBugbkRbMW841eXipvDjzihO1+ocYPDJiNS4R2/NlSrUjB5fZ88phUq0OBz/eZL5AgyTZbUWpU1HSICPt77bggc59TDJ3jImgK8Jjs6jZG8YiG6Kf37Muh26rHh50+RGJ6FYUL8T7ml1gxwiC3WGu9MDOwjmbPDTxFyNqkwPOdnJu2LFw4ONsGGVsYdC8gsRMFG3Gn81hq1ylq8iZI0/Da+4CJeOUqfQVMGgbKs5IwPVHfZ1YA1pMaU3W0Yg43dBBeM3nJvGWnZmIQh5aMH2sgKT5Tzlk7B4gd8+G2VLw3kANzVLGR0PO5BO4ZCw1jh70cztGlDmh+X5YApseBqIYR+BWAf8zrhtMLcAyiHQ18cfVKAXUVsr/OtihWl0wDYrlTTJCpz3O8bErZVA688Sr5+B5bhnSW1UYLk1Skuaq+dqjNOPCOBrWHJAaOXPnMEcMEsUGw+F7RDaBJgTWRlG18pF0+sWYD/r6pYteJjNrT3ytStD+HV/MVSpMPHWQaRK6vnZvyt7k0drAjmis/Tt9xQzzjLP/KMiajLN4K0qugZM0ROT9RJ81pYQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6257.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(7696005)(54906003)(9686003)(26005)(478600001)(55016003)(38070700005)(86362001)(33656002)(2906002)(4744005)(66476007)(66556008)(66446008)(186003)(6506007)(8936002)(71200400001)(64756008)(122000001)(82960400001)(38100700002)(4326008)(6916009)(76116006)(8676002)(52536014)(66946007)(41300700001)(316002)(5660300002)(7416002)(11716005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TcOYV3u8Kg9oYzNfJDNpA43npHlWZEN+29tgCDEnCec6VLglp2ME8YDmeSyN?=
 =?us-ascii?Q?mA91EgK1EPT8Ie3mScd747cw7nkKJWTCSdr6xs40VRGRIburc956OlzLHI1G?=
 =?us-ascii?Q?z9utPsu83ZUSjzC8WukP9PZUyYTo/iQJB8Fl+HsiRhDWmKfMUrwkbWKUp/oG?=
 =?us-ascii?Q?eYzXtsR5IuvmvNmFkwBV87aOFtGkd+3/y82y0LNtZlp8gX1NMYVMXwxjC+kz?=
 =?us-ascii?Q?AvjNDh9GCQg72jxncVN+1vwkJhSg2PvZ9ugQ99I50WJJ8vKBqLSP8qysLE/C?=
 =?us-ascii?Q?rgyWxrwiG4joy8OKn3veMR32pBHgU5LwgtwORKkRl6+g3pViRFB5M9OM2wh0?=
 =?us-ascii?Q?JVjTbR4tqfF3Sao0x55atLGydYfAwOKg5agVCmbD4L8x/M2Fy6mIEcTIak4E?=
 =?us-ascii?Q?H+o+GbBfrbqFudm3JjFvep+JglTtd/gabaAWYf9YzzDGFVySN5VeKBosp7+u?=
 =?us-ascii?Q?LbC6BBGU1cKWzh67CBvMitb6LkJSB8IFEOuTK44XV9Cq+NCLdkm7dnbNiCvx?=
 =?us-ascii?Q?KnrNVzBCljHSmiLh0zRbsbl0ZETzaSZ+lzYw9szebeYFUnwqcd9Q5JpT5vlR?=
 =?us-ascii?Q?ALGdmcqAAku5qdkKgCrhiIeajv+jVUcdswqaOk2OJyxWCyYSu2Kl//6Z3mSM?=
 =?us-ascii?Q?XF72Aulc5SwydxK7ucTLUftx8U61aaPOZKHUyqlTm3n8RKbp4zOxkYHZS91E?=
 =?us-ascii?Q?vu+nPqdFj6dh0ZR7I6HZBBD7WicGnH9u1EDvjaAZeIcsDqvlasBi0qM9xwov?=
 =?us-ascii?Q?Pbc/bO8QHc1QKdtcVSs1MkR4xVx9YzTCldTsFKdrrQJrAPWga1k+eFv6q593?=
 =?us-ascii?Q?Z0RPMKadU+Io8m7PEBXTLBRdxvbmay1+FOj39IgmvR5XxeJ5ZvKlG/vxFHXO?=
 =?us-ascii?Q?hiDFyBhRr6pESMbBEuUiJEZ91Qag8Mt41Jqj9Pt6CQpb6/Vmxq3wFVp3RbGT?=
 =?us-ascii?Q?F7AXzlsMsRGtXy8SQHVhfZYt2fkNwlw9ARMzIKafp/qZ23g/WxovwYIzitxC?=
 =?us-ascii?Q?0dk5zRjfZbMK3FM/8YAk5H10hNUBR3qisSiMhDr/ZEw6kY0A7ytdbbAbvMvz?=
 =?us-ascii?Q?XQ5hqUiflitkosnFuJJACDhy94IxoVQTwSr0u2PSQE0Lw07lJI4OPoIN1av+?=
 =?us-ascii?Q?SNhfXLmvS7lm027kiqi48Er4vBIYnlTCiHpqqCW0I4N5PVsHQT4GjoMt7Ksp?=
 =?us-ascii?Q?jA3NImpS3uPI+Qg7R46yRkV6JDQWWpPZlIBME56mM8pt00YMdZ2zpVBmrd8C?=
 =?us-ascii?Q?tOeFXMVBROFkdiKnmobzsqV2thqbzUnPVwl/yAX3jjk91ns2FqtLYvuQAGDG?=
 =?us-ascii?Q?9avp6lF4/wV/YMvnONbf6Bd7RPyoRky8TZjDwPPfhqXDPG71gn8IGYbYgmx3?=
 =?us-ascii?Q?NyDNcBm+6+SQFloZcQV0xaWTi7ctdRCjOg7nGs4j1kCtGpRfej64taUKeBKa?=
 =?us-ascii?Q?15FdpIWFp7b71/aWO3EWpr3W9+MxEUZ0l1A3YIWYMntiWyTDIkw2UB6xsbD9?=
 =?us-ascii?Q?Fz3SwqNthqBWToX98EP88x/0FYV85EoOllODXIxrY7/Y3sAtj0f8baGndhrc?=
 =?us-ascii?Q?aoPOQZ5onCbCyvz1NJE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e47dd0c-747a-4f24-15c7-08db8f3160aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 06:10:44.0551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 RkYQhhrp7nkxHr+v4RufWJqR2FF1/PVysjDYYe62QFJp3j+co/aAAAwozWxCfkXVpnQZvv6n9Y1B2JiSvbygCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8705
X-OriginatorOrg: intel.com
Message-ID-Hash: OUDJUSEAXSYVH6ZRT2HAMN2N2P7ULUZS
X-Message-ID-Hash: OUDJUSEAXSYVH6ZRT2HAMN2N2P7ULUZS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUDJUSEAXSYVH6ZRT2HAMN2N2P7ULUZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> >  static int max_98390_hw_params(struct snd_pcm_substream *substream,
> >  			       struct snd_pcm_hw_params *params)  {
> >  	struct snd_soc_pcm_runtime *rtd =3D
> asoc_substream_to_rtd(substream);
> >  	struct snd_soc_dai *codec_dai;
> > +	int i, ret =3D 0;
>=20
> Redundant assignment.
>=20
Will fix it in v4 patch.

>=20
> Maybe (maybe, don't know subsystem preferences)
>=20
> #define MAX_98390_DEV0_NAME	"i2c-" MAX_98390_ACPI_HID ":00"
> #define MAX_98390_DEV1_NAME	"i2c-" MAX_98390_ACPI_HID ":01"
> #define MAX_98390_DEV2_NAME	"i2c-" MAX_98390_ACPI_HID ":02"
> #define MAX_98390_DEV3_NAME	"i2c-" MAX_98390_ACPI_HID ":03"
>=20

Will include this change in v4 patch. Thanks for reviewing.

Regards,
Brent
