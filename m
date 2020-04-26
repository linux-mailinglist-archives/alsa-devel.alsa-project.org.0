Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E08661B8C8D
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 07:47:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 681B116AF;
	Sun, 26 Apr 2020 07:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 681B116AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587880026;
	bh=HRU3H/NPKPHgLumzJuMBnkpi49o6LTaldib8RU4TZJo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rf2gXRj8u/Xf9I/awEEpG6w3ZMhCxraOKCs32zyGoLQz48B498Ikvw9AWwiq19Vlr
	 vpPGUcxbuOVUGkOiuqtaTbMWPgvyIEKKN7C8YsTsSUmtF92XW0Fo/8CUVxp8tDKSS7
	 cug/R+IvCBgSGOf2Jfq+md3osVi6naPi0edUMBQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7079DF80105;
	Sun, 26 Apr 2020 07:45:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 629CDF801DB; Sun, 26 Apr 2020 07:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9368DF80105
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 07:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9368DF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="VfXw3pMr"
IronPort-SDR: F0tuHDJezWNqvQMbYxlvXv5J2cfPo64sC7oLzklZWFVuNF75CpBCSPGYNIiERlhhyE7Aul1EZw
 MEohkFuFtg2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:45:09 -0700
IronPort-SDR: KUYlz9wjv2LdBj671xqSihojbOnn4/ZstjEKwwHCwl1R3uwZ8VLRQcMgsjuVvJgHnaKaLRxi7X
 exLJJh7YVDeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,318,1583222400"; d="scan'208";a="431313250"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by orsmga005.jf.intel.com with ESMTP; 25 Apr 2020 22:45:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 25 Apr 2020 22:45:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 25 Apr 2020 22:45:07 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 25 Apr 2020 22:45:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 25 Apr 2020 22:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETlmeNQhyg8Q91MHSky8ZqzNNwzcMDQ6k785sVg2kSJ37ulHZ/+ZWBmoWZSWFhrh0EALNvPXRXI7XbVgKCUDpyXxL4MPa322F2VY6iuvR5LU0wfxhHvPpwontE+9kk9fEDsiHbsvzx5B6xjNbjN2Or+3fViH8B7z6BaAimkz+zu7oOWKSIYjOQ+WbZZgNDB/ABY3WqSw6K/bzm5IySprzd86cq85CAlqH4CbJYw5/EEE43Gg4cH1tfkA8kFyXk96naodbFh7jDph15TxfgtglsdwM3bSo9JApfSH2oKIG4VMVfhFGO6xuycizEsLQr/agOiEQKQNQ5I1mMf1OcWQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUTlwl2D3Vud9WCUQM4KMXhP+GL4anWXe5T1lnA3tBA=;
 b=QpMjJ/byv3rzTZcK/7FEDZ2+2xhIRiVmonV3lOEyf1aWeeYKca46SS3iij1XD/myEjKQJF7FNIOs2H4+PAMSm6br8bP101q+3e2l/dpEceHc9VYiS9/MLnTWIQbSKKDZzpjlWdekd8nbs+azpyGp0nAeZOo1ajKPaCW/EAmzqU3N900gui7VtRlbQYmqMCc9obPDnNA9EiXDpKEjQAvui7bPEbxX2ofp+/7ieK1H0WafjUh+pjbktIgQw8niVXXoymWFHDcsygnKRBpJBQFQtZtvojp9NxmshQGtDICltD/tRuKg7tUbBx3naybZvN8kv8Zw+fmEanfvLWNwoDT3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUTlwl2D3Vud9WCUQM4KMXhP+GL4anWXe5T1lnA3tBA=;
 b=VfXw3pMr8euyUlsQQ3mFgikbhoNw/mD0DHZhgXkgJN6ha7MoyDHUbxcbslGkr5cYcoC0Zh/Yl3hnuNuompiJeHUtjwmJB3lDDeUMT+6Tnr3DOyCo91hczVRN0VTNIXPVul5HGB72PD2SDsvbPRYJWQAnwvmLjrz5Q2ycpBJ62BI=
Received: from CH2PR11MB4198.namprd11.prod.outlook.com (2603:10b6:610:3b::31)
 by CH2PR11MB4360.namprd11.prod.outlook.com (2603:10b6:610:3f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Sun, 26 Apr
 2020 05:45:05 +0000
Received: from CH2PR11MB4198.namprd11.prod.outlook.com
 ([fe80::e5c8:f6c6:53d:3d99]) by CH2PR11MB4198.namprd11.prod.outlook.com
 ([fe80::e5c8:f6c6:53d:3d99%3]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 05:45:05 +0000
From: "Wang, Rander" <rander.wang@intel.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Vinod Koul
 <vkoul@kernel.org>, "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH v2] soundwire: intel: Remove unused function
Thread-Topic: [PATCH v2] soundwire: intel: Remove unused function
Thread-Index: AQHWG11EBZG50fJ2wkiGOSAo6dQ2RKiK4tbA
Date: Sun, 26 Apr 2020 05:45:04 +0000
Message-ID: <CH2PR11MB4198D1B209828E59B1AF10DFF0AE0@CH2PR11MB4198.namprd11.prod.outlook.com>
References: <20200425235448.3946-1-sudipm.mukherjee@gmail.com>
In-Reply-To: <20200425235448.3946-1-sudipm.mukherjee@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=rander.wang@intel.com; 
x-originating-ip: [134.191.221.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ea2e5c2-a0bd-4b80-7a46-08d7e9a4f890
x-ms-traffictypediagnostic: CH2PR11MB4360:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR11MB436002C0EC982673D908083EF0AE0@CH2PR11MB4360.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 03853D523D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR11MB4198.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(376002)(346002)(396003)(39850400004)(52536014)(26005)(4326008)(316002)(6506007)(33656002)(55016002)(9686003)(110136005)(54906003)(186003)(7696005)(8936002)(86362001)(5660300002)(66946007)(66476007)(66446008)(478600001)(76116006)(53546011)(66556008)(64756008)(8676002)(71200400001)(2906002)(81156014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mpskl7hAVNJpV5i+LG89V4cvFz90ExB1i+2KTo0dWNu2bxnCniobCijO703bhk0WzkK2CcDGH6H+JwxIpxrijP4TMy7N5opTlH+GrXblvVlIzA+S5ZQVwmwq9TGLQGGFLLcf0C+ijRUXP30YK57lK2sYbsSwZZwTis8dj8jFtZnyRQ8g15uLDLKPOwLO3URNZqLNxT/KtbntNWazh3lqBhqlMAOCV4mQfa1eF8tIoAlhLBMo1v5zEjnnhWiAMXv9OYks6OpXXZxGnL3Vp+e9HIez4c0WEz/SXjkYgqoeQL8+8V1anKogb7EE9JVqX8b/X9ljRLRf1ck5GDTE0SHnZTvXxu8K1IOGc2Zyd0oMH/PJwCo5A+rtiEqmiBk29MBOnB0AevmFGb55OXoCOPA+pkoYvn7tcni/o/3YAe/+5/KZDoiZKhzRfQ1WwqscEj6o
x-ms-exchange-antispam-messagedata: H+FVhPdHSzhRl7agx66EHc/yaF/RVz5N1v6cT63JWGoPNFo0A+/wysuEYFWFa96E9U77FKRDxcCSSOO/TxeV5qMANRloaRIks5MXJys/GiFyBK/Gh2AMoRx2x6fPiPVelPffSzicZcct+cKXbVSYhVEmEJwHAx1Aydci6Vpl2elCXoigCoHD+ao/zTE10KA6eLLrmHfHEg0h2MvzuUVXan0O3jKiPH8p+V0vw9tMteSZoWB3W0rW5We9XHD/WRuNqdNDy3XZI17u3LGn005gmZNlEKEGBNUardZ1saE+Hwi8+mRCSScIARY4Y1x6lrK4XGHKSjCktzIxrE6DuqCQis7azhIj0/A8LtWVwqPiItRVd2KS1hMaxSZgeczp5qIkYcTOSSDRHQdZmgaYCIRKdPiknyeuKVdPtDLuqAZyQ4/P8ii/bviRYQyu99c0pym7FxdtN2/U6FcazpHP8hdmTGiAn0dM6NmRsAP388ehG7b64YwNOKA+23LV8UcAyRhW73fVL0zJkv27rfTs32jULMxezDorv1+XwHrugELWaPrqHLYafipFEtcp01Nn5Gc6mpohIIghckZSPHR4sIPtm5U2nCFXJbyn3SlHt1UIcoUoU3IDzhRECxXua/Gt0WeoDbOZhB8+6B9XON21uMRzvNN9maJ7UNgzL7gNX6GpQE477xPKbnt6rrhkLlsrHiPZWp/3wnuCaisirIHRuyBLJ/KPYN8dRdxJfN3ObZOjV3Tu00mfsnlh7sUsAa5Wv1H8PB9qrPP2/EQ8Nub8cpHdosc4oi/9Hzcpx+GR6ayWn9AO9FDn5jybsIG8+wqSw01f
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea2e5c2-a0bd-4b80-7a46-08d7e9a4f890
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2020 05:45:04.8591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nnJ+B+gnQ9H3uMwOiywLrv8BBVUOhhC55PVHnlDMC7hDliA0HdAYcYlrwKnVRi1rCz+Qbq1A47a6NB/R7QyyWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4360
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

It is used by sound/soc/sof/intel/hda.c.   Please check history of alsa-dev=
el mail list. Bard Liao is working on it.

> -----Original Message-----
> From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of Sudip
> Mukherjee
> Sent: Sunday, April 26, 2020 7:55 AM
> To: Vinod Koul <vkoul@kernel.org>; Kale, Sanyog R <sanyog.r.kale@intel.co=
m>;
> Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Sudip
> Mukherjee <sudipm.mukherjee@gmail.com>
> Subject: [PATCH v2] soundwire: intel: Remove unused function
>=20
> The function sdw_intel_init() is not used anywhere, remove it for now.
> And that makes sdw_intel_add_controller(), sdw_intel_acpi_cb() and link_m=
ask
> unused, so remove them as well.
>=20
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  drivers/soundwire/intel_init.c | 162 -----------------------------------=
------
>  1 file changed, 162 deletions(-)
>=20
> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_ini=
t.c index
> ad7053463889..d90929a5043b 100644
> --- a/drivers/soundwire/intel_init.c
> +++ b/drivers/soundwire/intel_init.c
> @@ -23,10 +23,6 @@
>  #define SDW_LINK_BASE		0x30000
>  #define SDW_LINK_SIZE		0x10000
>=20
> -static int link_mask;
> -module_param_named(sdw_link_mask, link_mask, int, 0444); -
> MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
> -
>  static int sdw_intel_cleanup_pdev(struct sdw_intel_ctx *ctx)  {
>  	struct sdw_intel_link_res *link =3D ctx->links; @@ -47,164 +43,6 @@
> static int sdw_intel_cleanup_pdev(struct sdw_intel_ctx *ctx)
>  	return 0;
>  }
>=20
> -static struct sdw_intel_ctx
> -*sdw_intel_add_controller(struct sdw_intel_res *res) -{
> -	struct platform_device_info pdevinfo;
> -	struct platform_device *pdev;
> -	struct sdw_intel_link_res *link;
> -	struct sdw_intel_ctx *ctx;
> -	struct acpi_device *adev;
> -	int ret, i;
> -	u8 count;
> -	u32 caps;
> -
> -	if (acpi_bus_get_device(res->handle, &adev))
> -		return NULL;
> -
> -	/* Found controller, find links supported */
> -	count =3D 0;
> -	ret =3D fwnode_property_read_u8_array(acpi_fwnode_handle(adev),
> -					    "mipi-sdw-master-count", &count,
> 1);
> -
> -	/* Don't fail on error, continue and use hw value */
> -	if (ret) {
> -		dev_err(&adev->dev,
> -			"Failed to read mipi-sdw-master-count: %d\n", ret);
> -		count =3D SDW_MAX_LINKS;
> -	}
> -
> -	/* Check SNDWLCAP.LCOUNT */
> -	caps =3D ioread32(res->mmio_base + SDW_SHIM_BASE +
> SDW_SHIM_LCAP);
> -	caps &=3D GENMASK(2, 0);
> -
> -	/* Check HW supported vs property value and use min of two */
> -	count =3D min_t(u8, caps, count);
> -
> -	/* Check count is within bounds */
> -	if (count > SDW_MAX_LINKS) {
> -		dev_err(&adev->dev, "Link count %d exceeds max %d\n",
> -			count, SDW_MAX_LINKS);
> -		return NULL;
> -	} else if (!count) {
> -		dev_warn(&adev->dev, "No SoundWire links detected\n");
> -		return NULL;
> -	}
> -
> -	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
> -
> -	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> -	if (!ctx)
> -		return NULL;
> -
> -	ctx->count =3D count;
> -	ctx->links =3D kcalloc(ctx->count, sizeof(*ctx->links), GFP_KERNEL);
> -	if (!ctx->links)
> -		goto link_err;
> -
> -	link =3D ctx->links;
> -
> -	/* Create SDW Master devices */
> -	for (i =3D 0; i < count; i++) {
> -		if (link_mask && !(link_mask & BIT(i))) {
> -			dev_dbg(&adev->dev,
> -				"Link %d masked, will not be enabled\n", i);
> -			link++;
> -			continue;
> -		}
> -
> -		link->registers =3D res->mmio_base + SDW_LINK_BASE
> -					+ (SDW_LINK_SIZE * i);
> -		link->shim =3D res->mmio_base + SDW_SHIM_BASE;
> -		link->alh =3D res->mmio_base + SDW_ALH_BASE;
> -
> -		link->ops =3D res->ops;
> -		link->dev =3D res->dev;
> -
> -		memset(&pdevinfo, 0, sizeof(pdevinfo));
> -
> -		pdevinfo.parent =3D res->parent;
> -		pdevinfo.name =3D "int-sdw";
> -		pdevinfo.id =3D i;
> -		pdevinfo.fwnode =3D acpi_fwnode_handle(adev);
> -
> -		pdev =3D platform_device_register_full(&pdevinfo);
> -		if (IS_ERR(pdev)) {
> -			dev_err(&adev->dev,
> -				"platform device creation failed: %ld\n",
> -				PTR_ERR(pdev));
> -			goto pdev_err;
> -		}
> -
> -		link->pdev =3D pdev;
> -		link++;
> -	}
> -
> -	return ctx;
> -
> -pdev_err:
> -	sdw_intel_cleanup_pdev(ctx);
> -link_err:
> -	kfree(ctx);
> -	return NULL;
> -}
> -
> -static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
> -				     void *cdata, void **return_value)
> -{
> -	struct sdw_intel_res *res =3D cdata;
> -	struct acpi_device *adev;
> -	acpi_status status;
> -	u64 adr;
> -
> -	status =3D acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL,
> &adr);
> -	if (ACPI_FAILURE(status))
> -		return AE_OK; /* keep going */
> -
> -	if (acpi_bus_get_device(handle, &adev)) {
> -		pr_err("%s: Couldn't find ACPI handle\n", __func__);
> -		return AE_NOT_FOUND;
> -	}
> -
> -	res->handle =3D handle;
> -
> -	/*
> -	 * On some Intel platforms, multiple children of the HDAS
> -	 * device can be found, but only one of them is the SoundWire
> -	 * controller. The SNDW device is always exposed with
> -	 * Name(_ADR, 0x40000000), with bits 31..28 representing the
> -	 * SoundWire link so filter accordingly
> -	 */
> -	if ((adr & GENMASK(31, 28)) >> 28 !=3D SDW_LINK_TYPE)
> -		return AE_OK; /* keep going */
> -
> -	/* device found, stop namespace walk */
> -	return AE_CTRL_TERMINATE;
> -}
> -
> -/**
> - * sdw_intel_init() - SoundWire Intel init routine
> - * @parent_handle: ACPI parent handle
> - * @res: resource data
> - *
> - * This scans the namespace and creates SoundWire link controller device=
s
> - * based on the info queried.
> - */
> -static void *sdw_intel_init(acpi_handle *parent_handle,
> -			    struct sdw_intel_res *res)
> -{
> -	acpi_status status;
> -
> -	status =3D acpi_walk_namespace(ACPI_TYPE_DEVICE,
> -				     parent_handle, 1,
> -				     sdw_intel_acpi_cb,
> -				     NULL, res, NULL);
> -	if (ACPI_FAILURE(status))
> -		return NULL;
> -
> -	return sdw_intel_add_controller(res);
> -}
> -
>  /**
>   * sdw_intel_exit() - SoundWire Intel exit
>   * @arg: callback context
> --
> 2.11.0

