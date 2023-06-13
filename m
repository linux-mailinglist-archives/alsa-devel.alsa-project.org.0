Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C872D739
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 04:00:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 410CDFA;
	Tue, 13 Jun 2023 03:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 410CDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686621647;
	bh=UjdXFZkLQniPUhshFFAH8XX/ckzOeQB+AWxWFDVHzfo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W3xhpttG+ErStw6fnGw5BvjeIsi6/zB0OHFBHm3jb8yAlzj7WTr7f5gf7t+MB9YU6
	 NPGwYtZuuC+zFiEC5otqBtyLvqHQ5CNMHF+9nO/bsnL2aCvF/sNYAnSuLTtS2GRfvE
	 myoMZQZrAWnnoRlNn78d019e/PoGBRFtzk4njLQg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC9ADF8052E; Tue, 13 Jun 2023 03:59:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F655F80132;
	Tue, 13 Jun 2023 03:59:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30AB5F80149; Tue, 13 Jun 2023 03:59:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B87EF80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 03:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B87EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J/d020NG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686621559; x=1718157559;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UjdXFZkLQniPUhshFFAH8XX/ckzOeQB+AWxWFDVHzfo=;
  b=J/d020NGZElbYa8iAToqjvcarOnMzNuSWyIRMza7oq/xIZJ7cmVJL2h3
   2v9rPzGlXiNXuHXEaKgdOiPcZVXCo6jwRTKPnn3Z60W0Aa/4z4Kl5B5Do
   2O4BK0lJwLJ9PAUjcwH9cI3jJBIQ43gcfMU5HYogK1D99yT1RQ8k0XHS7
   GZa4sXzAm/ZEYOCSWcCWMtUw4KNdM6B1uHHLUQuzd/XOYqoeXTGTlk1co
   I+q03KuEFJfZRylVEqVsBcN5cj1VXu16jSE3y08Xi+VLDLCEAhV8bb5xJ
   enQu9NXkgJuZH1QYJ/92+lG0OACI396gumGm+5klLtgufZUJZN/3EQp8O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="357090651"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400";
   d="scan'208";a="357090651"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 18:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="855905089"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400";
   d="scan'208";a="855905089"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2023 18:59:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 18:59:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 18:59:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 18:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSU/u1QIruSK2OgO89UpllVpk7l7FPCQZozp6raVwF2Y+ODk2SaZdvwSGlfLp5h7/k9uANL7UGlen+IUs1rWxYHfzJEnQ/IqqNamANcVQupAy+1ZfC8wbpIedffE8cApj7NQu+9TkMzZFqstbB8hLEA6RAMGW7Axo+YBhIij+CM3GSpt2qcwlfuRs8Snf93xjZAyofEZCg/FgfBShhbXhtWYpiNWCTKn32ICRwiBBGhCe7ccwWw2MUwzXRUFyKEksGq1oWpqmMOHUyICmLmomoNqtewAxYv6dPxG4H0tPnR+4+7B/dlQR3oos83hOFHDUOD+Tp90YfR3aGFkJR+/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88f/NW6ldqGini9EO4vlYj+Ww2thhO7byVP5gv8+Zd0=;
 b=j5qpU03EBSoTiYWARSOPoar3XCLBF3nFKzW/q5cYh7aRWlDNqOR32SgLGALN8Id3UcFmfwWnvCsI6AUftkVCC2DrONxQwKcKheSfa890NHP2KXRwFmhsKqH8DAfUk8igPylLnd+hJNdmXH2xwuS7eCXZeL6fGJoej8E3EYsaIiBctZT0wF39Gj/eN7kr91iKhC/ZuundB2QQ/yzq1DOLoRwa+FmTHsH2s997jFvio5pHrxPvOJAkvEwqjY97DWy28T+/WoUL5kqPCgfsV5rEMXuIUvT5HZxrJlCoux9NePuqXtgS5V9J9oLFZaoPcLFql0NDUoiNqK91HnpGiSXTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 01:59:05 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::77e8:9cc7:fc36:d617]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::77e8:9cc7:fc36:d617%6]) with mapi id 15.20.6477.028; Tue, 13 Jun 2023
 01:59:05 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de"
	<tiwai@suse.de>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH 1/2] ASoC: add N cpus to M codecs dai link support
Thread-Topic: [PATCH 1/2] ASoC: add N cpus to M codecs dai link support
Thread-Index: AQHZmOrHPkgdauUN4EaHwUHrwg/kRK+H46KAgAAbI1A=
Date: Tue, 13 Jun 2023 01:59:05 +0000
Message-ID: 
 <DM6PR11MB4074686E17F4E7D12C58BB6BFF55A@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
	<20230607031242.1032060-2-yung-chuan.liao@linux.intel.com>
 <87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4074:EE_|PH7PR11MB8600:EE_
x-ms-office365-filtering-correlation-id: e7b24bd9-e94f-4509-8aae-08db6bb1c480
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fM+SlK06DHCrEcfoGnY8DU7pA/diAh2tQdQOELoraf9mfXz28sMWfhAFMR/MylxXH2eLr7JLe9wlucxYXyq0RKsz4fopE4FK4cy+pF/5jgvH6wUCPh5pRTzDJY9d9++trgS1d6rNEP/WBNo78cKHt+dRaktz1oCz7oKE9pNq4cFDOvcAYDcWeaVXJZN4Px7NgeqOx0KTzgfYaeYSetEb86gZzn/L0och5ON2Vjsy66UTub0zTzc/l1uTyN9Yo+GkslTVuVsUcyoBSPTtp3Z912xJf5WiFCZMC+inZ+6Rrd9Kmbi61gs1PnJk6pddoMMNyk3C+f8h6iSGtbR5ihFNHkYZ6otKYxgf2aie+V96rLzGAuga+LuH4zHeGe+CyjQTyQefENaEggFiwfWHQPfJm0U+ppYsz2TtgDXTEvanERfif8PGEDpJ3FDTDJmDYUVKjAHFGOZ0claFdx9gop22KGaHnJOC3o7WDjN23OH//9c8VkdSM+GRUETaoIU1/RDxeKKbbooAR2zVs5CFLKcx4O/7NOgf5RZMKzpXniwWjWs+pPC9Kf2covUxgZsAEhO1Y8GAkPgrLLW5pE1UFr5fWvtgcXdlqge7VrDwx3BaaM36iouG/6+sU6p+xYF7DsGFZNT05XK5x1l6P87wCXLN0A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4074.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199021)(33656002)(66446008)(66946007)(64756008)(76116006)(66556008)(2906002)(66476007)(186003)(38100700002)(82960400001)(55016003)(4326008)(6506007)(9686003)(52536014)(86362001)(7696005)(5660300002)(478600001)(8676002)(122000001)(316002)(71200400001)(8936002)(54906003)(110136005)(41300700001)(38070700005)(26005)(53546011)(83380400001)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?19u79XdzqYUqdq2oe+cwSDwPterra7gbgkVENRlSGVfT4e/S9C6GpcGXkKo0?=
 =?us-ascii?Q?hePVsK/cqnyx2LuHxKJ4RZ1s/f9afgK9ZVIZThSq3FmjYtYFScirR7W0e+jT?=
 =?us-ascii?Q?EJBbMuOMVawiRDbsjyF+NOHvQYneHA6tkpef4cWzOgqXww9ngom0QZKEe6aJ?=
 =?us-ascii?Q?6XdrDdVaNfdY7zWYJQGde4ym1LYDNgHD0kfmqWdfoflrSczefsw/kyt+rl8f?=
 =?us-ascii?Q?9SVdmZS349nIVtzLhcSbNqBUhLbw2wBFZYcy2DJt/Uvi1qMTmxCLDkf5DegW?=
 =?us-ascii?Q?Fh3OyuvRuEtkE749DYWUpZ2S5VlRbOky0DstoE3TASIyp5wtYiE3Qp6xBRal?=
 =?us-ascii?Q?E6sujRR36xdqY0kEL9ZrnHEFscgaeCOQEq/LdRDmRe2tJZ8+yuY0KKPBJNRR?=
 =?us-ascii?Q?sv/P9utxMkprtG4egTgb3MxjB/L0v2PWana7ZD0RNU5+D97UY61G7pxeUCzs?=
 =?us-ascii?Q?D9Ut/GhGEAuCM4gwPIGVvu0qn7ArZesnDFYBa8GK99ZSFYy7QMHkrE3xCyL7?=
 =?us-ascii?Q?FV9ssjXFLLFcy7EbZlOAgJLbViXB0vdF213pOSwaEmH+Nx8WRn21dvY8BWpj?=
 =?us-ascii?Q?FhZrrTW+8Fq+SX41EwyTfJ58XRtuvbAarZjNqFO/RAqt6bgTTqLV0qfX+wTi?=
 =?us-ascii?Q?D4TqI6ExVrdr+8kXOUnKmsUSV4HECtmFF7F+jF4APldDxfKlKG7x1VL7sQqt?=
 =?us-ascii?Q?TK/V8wdet1ckViboaCwdEv2weowk4QYt1/q7XArgi0lDaeK2tLdDQahivSFA?=
 =?us-ascii?Q?P5WXZKuFGp3z47HNRqKzgU7ugnbJYE1t6dc16ZzXjLD27fNT3qTbODP/lspi?=
 =?us-ascii?Q?qs1+wrUrt4eGBCCSFAQanitbTs2kDUT5/R3yLDmLmcgGdNfRQg+ZirPR2lqc?=
 =?us-ascii?Q?A31afAoSPdXleI7tqE6Xi1KxGIuWbwU/giZIj/JngrPsD/N9y4EYYagNq50o?=
 =?us-ascii?Q?MJyoSI3lQsF1eZO9WHSmWFKAym5txprpvkEoHOs8c6wBvghhLojGjVTTOQI7?=
 =?us-ascii?Q?8XFQHPMI9axNx+S3CEr24l7lwYArw3fyBQngwCR2dIEKXHztYIg0F94ymMrB?=
 =?us-ascii?Q?PyUA42tJk6enkYmrMwdeWXGq9YoR6B+vwe+hzEnW1uSxJ7F9oluN1aXp8iUi?=
 =?us-ascii?Q?UvcvK7uphgEcZAd6PXVFItXLql2UC0cd2C1KtkWHOwApOtqIYBfm4h3e7mgh?=
 =?us-ascii?Q?dCI3uDwVl8YK3vE6fyrhzq0MZzO0O91pEgokSRrVuh8XgiYPotPqPyYzlMf4?=
 =?us-ascii?Q?JkzyaFhK4Pw6ab5OZwQMsFbk7sAwsGpDmQQZi2sl3e2AKEH1fUWqZp+Ynph4?=
 =?us-ascii?Q?QQ9yQyFGpUQ5K/ZEMJmOSZgkjqj2zQoQmR1E1HBrZpJt51dxZ40vVALeZsa1?=
 =?us-ascii?Q?yhHKt1T2DD59Sa8BGcw3qlgSuvKqDgrC1v9+P7qc/EorrwlrA5CWury29RSq?=
 =?us-ascii?Q?+9UpfPiMR9pN+LaWqj/mfk+Rs7yGI19e3VE0IKpdVJ345Q9fTLKU5ddiRfVV?=
 =?us-ascii?Q?dNBR66L/Ve7kZUOUzoeP/Qdst8kDox2+WRlQWQrTP/MLhsH59TiwPpGSFfhU?=
 =?us-ascii?Q?YPATT1guiEHkOjszOqJgfem0YRFhA+xJWJNhXjxp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e7b24bd9-e94f-4509-8aae-08db6bb1c480
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 01:59:05.2827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 pBL7DwPNa43343XLkk5Hv2gm+6mhHYHllZ2OXEmVU/9ThO4AlfY4houX//VfmUpCLG3HAWurK3UkFUcplwsSrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8600
X-OriginatorOrg: intel.com
Message-ID-Hash: TYKDDMDBJAT2657JIMIZPJSBWGNP7BA6
X-Message-ID-Hash: TYKDDMDBJAT2657JIMIZPJSBWGNP7BA6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYKDDMDBJAT2657JIMIZPJSBWGNP7BA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Tuesday, June 13, 2023 8:05 AM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: broonie@kernel.org; tiwai@suse.de; alsa-devel@alsa-project.org; pierr=
e-
> louis.bossart@linux.intel.com; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH 1/2] ASoC: add N cpus to M codecs dai link support
>=20
>=20
> Hi Bard
>=20
> > Currently, ASoC supports dailinks with the following mappings:
> > 1 cpu DAI to N codec DAIs
> > N cpu DAIs to N codec DAIs
> > But the mapping between N cpu DAIs and M codec DAIs is not supported.
> > The reason is that we didn't have a mechanism to map cpu and codec DAIs
> >
> > This patch suggests a new snd_soc_dai_link_codec_ch_map struct in
> > struct snd_soc_dai_link{} which provides codec DAI to cpu DAI mapping
> > information used to implement N cpu DAIs to M codec DAIs
> > support.
> >
> > When a dailink contains two or more cpu DAIs, we should set channel
> > number of cpus based on its channel mask. The new struct also provides
> > channel mask information for each codec and we can construct the cpu
> > channel mask by combining all codec channel masks which map to the cpu.
> >
> > The N:M mapping is however restricted to the N <=3D M case due to physi=
cal
> > restrictions on a time-multiplexed bus such as I2S/TDM, AC97, SoundWire
> > and HDaudio.
>=20
> I like CPU:Codec =3D N:M support !
> OTOH, I have interesting to ASoC code cleanup too.
> So this is meddlesome from me.
>=20
> > +struct snd_soc_dai_link_codec_ch_map {
> > +	unsigned int connected_cpu_id;
> > +	unsigned int ch_mask;
> > +};
>=20
> If my understanding was correct, this map is used only for N:M mapping,
> but we want to use it for all cases.

Thanks Morimoto, I hope so, too.

> In such case, the code can be more flexible and more clean.
> see below.
>=20
> > @@ -1041,13 +1045,32 @@ static int __soc_pcm_hw_params(struct
> snd_soc_pcm_runtime *rtd,
> >  		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
> >  			continue;
> >
> > -		ret =3D snd_soc_dai_hw_params(cpu_dai, substream, params);
> > +		/* copy params for each cpu */
> > +		cpu_params =3D *params;
> > +
> > +		if (!rtd->dai_link->codec_ch_maps)
> > +			goto hw_params;
> > +		/*
> > +		 * construct cpu channel mask by combining ch_mask of each
> > +		 * codec which maps to the cpu.
> > +		 */
> > +		for_each_rtd_codec_dais(rtd, j, codec_dai) {
> > +			if (rtd->dai_link-
> >codec_ch_maps[j].connected_cpu_id =3D=3D i)
> > +				ch_mask |=3D rtd->dai_link-
> >codec_ch_maps[j].ch_mask;
> > +		}
>=20
> Can we re-use snd_soc_dai_tdm_mask_get() for this purpose instead
> of .ch_mask ?
> May be we want to rename it and/or want to have new xxx_mask on dai-
> >stream[].

The reason that we didn't use tdm_mask is because the N:M cases is not
a notion of tdm. But, it should work for the N:M cases if we rename it and
add a new map as you said.

> I'm asking because it is natural to reuse existing data and/or have varia=
ble on
> similar place instead of on new structure.
>=20
>=20
> Maybe I'm not 100% well understanding about CPU:Codec =3D N:M connection,
> but if we can assume like below, we can use it on all cases not only for =
N:M
> case.
>=20
> We can have connection map on dai_link which is for from M side (here N <=
=3D
> M).
> The image is like this.
>=20
> 	CPU0 <---> Codec2
> 	CPU1 <-+-> Codec0
> 	       \-> Codec1
>=20
> 	.num_cpus   =3D 2;
> 	.num_codecs =3D 3;
> 	.map =3D [1, 1, 0]; // From Codec point of view.
> 	                  // sizeof(map) =3D num_codecs, because 3 > 2;
>=20
> In this rule, we can also handle CPU > Codec case, too.
>=20
> 	CPU0 <---> Codec1
> 	CPU1 <-+-> Codec0
> 	CPU2 <-/
>=20
> 	.num_cpus   =3D 3;
> 	.num_codecs =3D 2;
> 	.map =3D [1, 0, 0]; // From CPU point of view.
>=20
> We can use this idea for existing connection, too.
>=20
> 	1:1 case
> 	CPU0 <-> Codec0
>=20
> 	N:N case
> 	CPU0 <---> Codec0
> 	CPU1 <---> Codec1
>=20
> 	1:N case
> 	CPU0 <-+-> Codec0
> 	       \-> Codec1
>=20
> 	default_map1 =3D [0, 1, 2, 3,...];
> 	default_map2 =3D [0, 0, 0, 0,...];
>=20
> 	if (!dai_link->map) {
> 		if (dai_link->num_cpus =3D=3D dai_link->num_codecs)
> 			dai_link->map =3D default_map1; /* for 1:1, N:N */
> 		else
> 			dai_link->map =3D default_map2; /* for 1:N */
> 	}
>=20
> We can handle more flexible N:N connection as Richard said
>=20
> 	fixup N:N case
> 	CPU0 <---> Codec2
> 	CPU1 <---> Codec1
> 	CPU2 <---> Codec0
>=20
> 	.num_cpus   =3D 3;
> 	.num_codecs =3D 3;
> 	.map =3D [2, 1, 0]; // From CPU point of view.
>=20
> with is new .map, we can handle existing 1:1, N:N, 1:N, and new N:M (and
> M:N)
> connection with same code.
> This is just meddlesome from me, but I hope you can think about this.

Thanks for the suggestion. I will think about it.

>=20
>=20
> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto
