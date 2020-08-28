Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 202DF25566A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 10:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 490B31875;
	Fri, 28 Aug 2020 10:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 490B31875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598603267;
	bh=9rWQ/+OmgayxxIDZI+GpXYEJUj/y9+x90u70zqEaCMM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZC9Yc2VNxPnmtMAf4I4njGx5KKluCtm5NLUMevZIRlyTAf2SWnR01by3umaQdz3pb
	 JmymfxERCfC96EQuB4k4WHinxkISNDcpbCnzOppakWvZf3xTd9m+zXYd5TP84Pxz7m
	 pHx07U4tIbU7Gb7Jpa8gJURG+ptzZPUyJ+QAswXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F50EF800EB;
	Fri, 28 Aug 2020 10:26:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A08F8016F; Fri, 28 Aug 2020 10:26:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9C67F80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 10:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9C67F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="FAWQVuRs"
IronPort-SDR: LMogGnmbJsINuoy6MvnLqsSmAaQ554PJBcpt3O1eosRjYoN+PrT86RCZ/WmrnLan/04EigHDff
 ZBbWOVeK2HnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="241444235"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; d="scan'208";a="241444235"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 01:25:48 -0700
IronPort-SDR: R8VesFVq3Qh+UJmPUUScci+Do93Sh/VBMvtkO6oJD3WWCbHIJ/KN2JGiwNgE8L52MRbeB6L9Kq
 Pusemo5ezzIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; d="scan'208";a="500945239"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2020 01:25:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Aug 2020 01:24:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 28 Aug 2020 01:24:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 28 Aug 2020 01:24:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXmT9d7zC/gWus6KGEh+DCSp04u1uxmgYlnJAzMBn9D5pDG1fB4rZ8Hsjo4e0/w5oipmAk3+sMPmHwvCpFWvSD8CeG0UO6FbYknFXl/Y2fgvxS56sH8H/E3Y2fKF1DoYV5R9yye3reQU/259P+DlJ3l1eok7BLG4mW90HaYt9NhLfeCeVVJax6o5oa2ia0QvcYunasBIiHDE0BODAqqY3SJ1Dt5iQwaj55kc2HNg6AsBDsKBQ8Ep7b6DVqs6dUFVxfEA9Sj9IpiajaLfvkBjUWBgg5KsHFQrBkX2Njtrk2V4Y9E/3fOtRgjAqBPa+ABTYPGfXjyyTY3Qgd7Lbh8kbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++Qn0JlIxYPlLlYcqPwf2SV55dV70krU/WLNVUV6zJ8=;
 b=TlNq31pVr9KlrDOik4vLBQJMujrAaS8QeCxCN8HmLsNmPBckYedErKWYsW1c20OMNiXG1wg0gXi1pGmlNN2YY22fjv3YmuwfDYJtAea61nPnEGQhHbNdcEICNnwZGRa9v/SLMrBWodIMSV9t1A42i2yviLEZ3jUGfAb4Y0P407dKrU3EXY543TmW42AOjzsNx8FXSKyXpkO/9WsxnvTEpRRxiHzGHLbbaKw8Gy6jgjJgHhdoDmPjkTSPUf9XK7fdgaWhnph5QynA3JW35Th3qW25j20M4+6vOcXNbzs3AwF5xDmf3eKEIk2lTGuHtlChXzySGfK0xZf5rDQF35629g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++Qn0JlIxYPlLlYcqPwf2SV55dV70krU/WLNVUV6zJ8=;
 b=FAWQVuRsKzbopmnRsTTX8ohJdFMwIwWIW8WTouxGsyPlUbaFKbqWT5G1vjqY/5Dlr1Nn96y0j4EVd2WoIqUeAXKcy7xgpQuqQjnqmuAUCH3crw9r/Gw+Q5O9Jw0m/gra+yiQ1O6q7gOJKBzNElPqRXdz71xQp3U4snoqRnCaZog=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.21; Fri, 28 Aug 2020 08:24:19 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::a061:bd5e:c46a:fa40]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::a061:bd5e:c46a:fa40%3]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 08:24:19 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "vkoul@kernel.org" <vkoul@kernel.org>
Subject: RE: [PATCH v2 3/3] ASoC: codecs: fix port_ready[] dynamic allocation
 in ASoC codecs
Thread-Topic: [PATCH v2 3/3] ASoC: codecs: fix port_ready[] dynamic allocation
 in ASoC codecs
Thread-Index: AQHWd4M3yXBG15jxxU2RZvDlHyLQ/6lNOEVA
Date: Fri, 28 Aug 2020 08:24:19 +0000
Message-ID: <DM6PR11MB40746716F856166D61EE573CFF520@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20200820182639.11572-1-yung-chuan.liao@linux.intel.com>
 <20200820182639.11572-4-yung-chuan.liao@linux.intel.com>
In-Reply-To: <20200820182639.11572-4-yung-chuan.liao@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.133.4.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1e1f79d-1680-4a31-9b2f-08d84b2bc2b4
x-ms-traffictypediagnostic: DM6PR11MB4692:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB469275D9274F61BE00DD9BA9FF520@DM6PR11MB4692.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C19e4RQr8hb8QFklkNgx8pik8740YtIsuDPO1p5FV73x8fXqEJ1plgsf+A3bTtcqQgQ9k2s7UNq/cP+gta+XuKVs8s1qAuKiklZaVpb8MKhAkXYm7nvaC+nhMDzsd418KUDKSG6p43XiEHewLrvXAyzM7WsiChdN47QS5Sh9hQZ+ugZWCEOB6Jgaap22RYQoodw0OUre6GwcQqrAjf0mmxtD0xaHGmhH5pwDfoRqZ0MbD8Uco0e+CqvGrRFeK2z2vH0bWzyYu8KsIlpuuLSGnB+ynk22PZCJeG8N+KLQPwM0sVdK373MkMfj2ZaDcS01tUWnuijnjkj9sTmF+ZtBpA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(71200400001)(76116006)(2906002)(66946007)(66476007)(86362001)(64756008)(66446008)(66556008)(53546011)(6506007)(186003)(83380400001)(26005)(7696005)(7416002)(4326008)(54906003)(110136005)(316002)(52536014)(33656002)(55016002)(5660300002)(9686003)(478600001)(8936002)(30864003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: hwujMKC3qkvul1pEbCTw7tuIhr7Qnytr0TxKGJNKuaYSyrqySMsfGuk9T/FgqfNLY3SlMHv2FrQ0W8ZSkWsuAn+/a/mbM2haa7HU1CHAGYhK1L/dvIziwfwMH3pPV3AzsnGS+jLBKmSPzE7TvhrqUyOesBvothwuvZzcqw4m1XtXGvATu8R+yI8DCpvhrGeGky0TkR/KSZIVHdzfIFf5s/NSeoP2n8ShRZ/IyEpX57dK3JWRMK0q3R96wNYMOBqEP+m4nZvtk3oAD86zS/iV0iaVultbZwajnlVolSLZGxaaQQ0adhKz3/ut0gHg2NalwTdIWF5gMgPpCduKGG5RspUVXWN1JQSPP+ytlBwmeKnu4i0FEWDGb9TjUk0o7lS6QJSwSTVuhpeVv6QCT4hK9POhYQman0L/HK9sNRhvibdbd1ug43RWWHzkcoKxtsF22LM3DhDnDvI28DY/b2WBu8Q2Hax7vCAOh+sFDZzgLm3a3Rt7+zM6FZkZcjyjBhMIPXFM6NdUmM9/2Yi8C30yIuNFyBX7z+p3zusl+3uDeatBuqbzlDcnUUSLIcQX8jvrEhDIEVtiUeLm8KDgaATpWjDuFprqkhyEgnAtmhON70Ajt7nF3U9VNLSt/Ofly2ekw0O4KZCbk3znzVk4kkAbxQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e1f79d-1680-4a31-9b2f-08d84b2bc2b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 08:24:19.3279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7VY5DhWidxumoEWMxvJHDt1Ia+vs7mS9pKcgkXakCQuBAGrKI0E20qWGzOZWtYuWzb/B1YzEakF0ALlMDrbBsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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

Hi Mark,

> -----Original Message-----
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> Sent: Friday, August 21, 2020 2:27 AM
> To: alsa-devel@alsa-project.org; vkoul@kernel.org
> Cc: vinod.koul@linaro.org; linux-kernel@vger.kernel.org; tiwai@suse.de;
> broonie@kernel.org; gregkh@linuxfoundation.org; jank@cadence.com;
> srinivas.kandagatla@linaro.org; rander.wang@linux.intel.com;
> ranjani.sridharan@linux.intel.com; hui.wang@canonical.com; pierre-
> louis.bossart@linux.intel.com; Kale, Sanyog R <sanyog.r.kale@intel.com>; =
Lin,
> Mengdong <mengdong.lin@intel.com>; Liao, Bard <bard.liao@intel.com>
> Subject: [PATCH v2 3/3] ASoC: codecs: fix port_ready[] dynamic allocation=
 in
> ASoC codecs
>=20
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> As port_ready is now changed to a fixed array in sdw.h, we can't dynamic
> allocate it in codec drivers.
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>
> Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com=
>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  sound/soc/codecs/max98373-sdw.c | 15 +--------------
>  sound/soc/codecs/rt1308-sdw.c   | 14 +-------------
>  sound/soc/codecs/rt5682-sdw.c   | 15 +--------------
>  sound/soc/codecs/rt700-sdw.c    | 15 +--------------
>  sound/soc/codecs/rt711-sdw.c    | 15 +--------------
>  sound/soc/codecs/rt715-sdw.c    | 33 +--------------------------------
>  6 files changed, 6 insertions(+), 101 deletions(-)

Sorry to ping you, but the patch is really easy to be ignored since I
forget to add ASoC prefix  in the cover letter.
Could you Ack it if it looks good to you, please?


>=20
> diff --git a/sound/soc/codecs/max98373-sdw.c
> b/sound/soc/codecs/max98373-sdw.c index 5fe724728e84..a3ec92775ea7
> 100644
> --- a/sound/soc/codecs/max98373-sdw.c
> +++ b/sound/soc/codecs/max98373-sdw.c
> @@ -282,7 +282,7 @@ static const struct dev_pm_ops max98373_pm =3D
> {  static int max98373_read_prop(struct sdw_slave *slave)  {
>  	struct sdw_slave_prop *prop =3D &slave->prop;
> -	int nval, i, num_of_ports;
> +	int nval, i;
>  	u32 bit;
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
> @@ -295,7 +295,6 @@ static int max98373_read_prop(struct sdw_slave
> *slave)
>  	prop->clk_stop_timeout =3D 20;
>=20
>  	nval =3D hweight32(prop->source_ports);
> -	num_of_ports =3D nval;
>  	prop->src_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
>  					  sizeof(*prop->src_dpn_prop),
>  					  GFP_KERNEL);
> @@ -315,7 +314,6 @@ static int max98373_read_prop(struct sdw_slave
> *slave)
>=20
>  	/* do this again for sink now */
>  	nval =3D hweight32(prop->sink_ports);
> -	num_of_ports +=3D nval;
>  	prop->sink_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
>  					   sizeof(*prop->sink_dpn_prop),
>  					   GFP_KERNEL);
> @@ -333,17 +331,6 @@ static int max98373_read_prop(struct sdw_slave
> *slave)
>  		i++;
>  	}
>=20
> -	/* Allocate port_ready based on num_of_ports */
> -	slave->port_ready =3D devm_kcalloc(&slave->dev, num_of_ports,
> -					 sizeof(*slave->port_ready),
> -					 GFP_KERNEL);
> -	if (!slave->port_ready)
> -		return -ENOMEM;
> -
> -	/* Initialize completion */
> -	for (i =3D 0; i < num_of_ports; i++)
> -		init_completion(&slave->port_ready[i]);
> -
>  	/* set the timeout values */
>  	prop->clk_stop_timeout =3D 20;
>=20
> diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.=
c
> index b0ba0d2acbdd..09c69dbab12a 100644
> --- a/sound/soc/codecs/rt1308-sdw.c
> +++ b/sound/soc/codecs/rt1308-sdw.c
> @@ -118,7 +118,7 @@ static int rt1308_clock_config(struct device *dev)
> static int rt1308_read_prop(struct sdw_slave *slave)  {
>  	struct sdw_slave_prop *prop =3D &slave->prop;
> -	int nval, i, num_of_ports =3D 1;
> +	int nval, i;
>  	u32 bit;
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
> @@ -131,7 +131,6 @@ static int rt1308_read_prop(struct sdw_slave *slave)
>=20
>  	/* for sink */
>  	nval =3D hweight32(prop->sink_ports);
> -	num_of_ports +=3D nval;
>  	prop->sink_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
>  						sizeof(*prop-
> >sink_dpn_prop),
>  						GFP_KERNEL);
> @@ -149,17 +148,6 @@ static int rt1308_read_prop(struct sdw_slave *slave)
>  		i++;
>  	}
>=20
> -	/* Allocate port_ready based on num_of_ports */
> -	slave->port_ready =3D devm_kcalloc(&slave->dev, num_of_ports,
> -					sizeof(*slave->port_ready),
> -					GFP_KERNEL);
> -	if (!slave->port_ready)
> -		return -ENOMEM;
> -
> -	/* Initialize completion */
> -	for (i =3D 0; i < num_of_ports; i++)
> -		init_completion(&slave->port_ready[i]);
> -
>  	/* set the timeout values */
>  	prop->clk_stop_timeout =3D 20;
>=20
> diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.=
c
> index 94bf6bee78e6..b7c97aba7f17 100644
> --- a/sound/soc/codecs/rt5682-sdw.c
> +++ b/sound/soc/codecs/rt5682-sdw.c
> @@ -537,7 +537,7 @@ static int rt5682_update_status(struct sdw_slave
> *slave,  static int rt5682_read_prop(struct sdw_slave *slave)  {
>  	struct sdw_slave_prop *prop =3D &slave->prop;
> -	int nval, i, num_of_ports =3D 1;
> +	int nval, i;
>  	u32 bit;
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
> @@ -549,7 +549,6 @@ static int rt5682_read_prop(struct sdw_slave *slave)
>  	prop->sink_ports =3D 0x2;		/* BITMAP: 00000010 */
>=20
>  	nval =3D hweight32(prop->source_ports);
> -	num_of_ports +=3D nval;
>  	prop->src_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
>  					  sizeof(*prop->src_dpn_prop),
>  					  GFP_KERNEL);
> @@ -569,7 +568,6 @@ static int rt5682_read_prop(struct sdw_slave *slave)
>=20
>  	/* do this again for sink now */
>  	nval =3D hweight32(prop->sink_ports);
> -	num_of_ports +=3D nval;
>  	prop->sink_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
>  					   sizeof(*prop->sink_dpn_prop),
>  					   GFP_KERNEL);
> @@ -587,17 +585,6 @@ static int rt5682_read_prop(struct sdw_slave *slave)
>  		i++;
>  	}
>=20
> -	/* Allocate port_ready based on num_of_ports */
> -	slave->port_ready =3D devm_kcalloc(&slave->dev, num_of_ports,
> -					 sizeof(*slave->port_ready),
> -					 GFP_KERNEL);
> -	if (!slave->port_ready)
> -		return -ENOMEM;
> -
> -	/* Initialize completion */
> -	for (i =3D 0; i < num_of_ports; i++)
> -		init_completion(&slave->port_ready[i]);
> -
>  	/* set the timeout values */
>  	prop->clk_stop_timeout =3D 20;
>=20
> diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
> index 4d14048d1197..b19fbcc12c69 100644
> --- a/sound/soc/codecs/rt700-sdw.c
> +++ b/sound/soc/codecs/rt700-sdw.c
> @@ -333,7 +333,7 @@ static int rt700_update_status(struct sdw_slave
> *slave,  static int rt700_read_prop(struct sdw_slave *slave)  {
>  	struct sdw_slave_prop *prop =3D &slave->prop;
> -	int nval, i, num_of_ports =3D 1;
> +	int nval, i;
>  	u32 bit;
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
> @@ -345,7 +345,6 @@ static int rt700_read_prop(struct sdw_slave *slave)
>  	prop->sink_ports =3D 0xA; /* BITMAP:  00001010 */
>=20
>  	nval =3D hweight32(prop->source_ports);
> -	num_of_ports +=3D nval;
>  	prop->src_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
>  						sizeof(*prop->src_dpn_prop),
>  						GFP_KERNEL);
> @@ -365,7 +364,6 @@ static int rt700_read_prop(struct sdw_slave *slave)
>=20
>  	/* do this again for sink now */
>  	nval =3D hweight32(prop->sink_ports);
> -	num_of_ports +=3D nval;
>  	prop->sink_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
>  						sizeof(*prop-
> >sink_dpn_prop),
>  						GFP_KERNEL);
> @@ -383,17 +381,6 @@ static int rt700_read_prop(struct sdw_slave *slave)
>  		i++;
>  	}
>=20
> -	/* Allocate port_ready based on num_of_ports */
> -	slave->port_ready =3D devm_kcalloc(&slave->dev, num_of_ports,
> -					sizeof(*slave->port_ready),
> -					GFP_KERNEL);
> -	if (!slave->port_ready)
> -		return -ENOMEM;
> -
> -	/* Initialize completion */
> -	for (i =3D 0; i < num_of_ports; i++)
> -		init_completion(&slave->port_ready[i]);
> -
>  	/* set the timeout values */
>  	prop->clk_stop_timeout =3D 20;
>=20
> diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
> index 45b928954b58..dc4a2b482462 100644
> --- a/sound/soc/codecs/rt711-sdw.c
> +++ b/sound/soc/codecs/rt711-sdw.c
> @@ -337,7 +337,7 @@ static int rt711_update_status(struct sdw_slave
> *slave,  static int rt711_read_prop(struct sdw_slave *slave)  {
>  	struct sdw_slave_prop *prop =3D &slave->prop;
> -	int nval, i, num_of_ports =3D 1;
> +	int nval, i;
>  	u32 bit;
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
> @@ -349,7 +349,6 @@ static int rt711_read_prop(struct sdw_slave *slave)
>  	prop->sink_ports =3D 0x8; /* BITMAP:  00001000 */
>=20
>  	nval =3D hweight32(prop->source_ports);
> -	num_of_ports +=3D nval;
>  	prop->src_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
>  						sizeof(*prop->src_dpn_prop),
>  						GFP_KERNEL);
> @@ -369,7 +368,6 @@ static int rt711_read_prop(struct sdw_slave *slave)
>=20
>  	/* do this again for sink now */
>  	nval =3D hweight32(prop->sink_ports);
> -	num_of_ports +=3D nval;
>  	prop->sink_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
>  						sizeof(*prop-
> >sink_dpn_prop),
>  						GFP_KERNEL);
> @@ -387,17 +385,6 @@ static int rt711_read_prop(struct sdw_slave *slave)
>  		i++;
>  	}
>=20
> -	/* Allocate port_ready based on num_of_ports */
> -	slave->port_ready =3D devm_kcalloc(&slave->dev, num_of_ports,
> -					sizeof(*slave->port_ready),
> -					GFP_KERNEL);
> -	if (!slave->port_ready)
> -		return -ENOMEM;
> -
> -	/* Initialize completion */
> -	for (i =3D 0; i < num_of_ports; i++)
> -		init_completion(&slave->port_ready[i]);
> -
>  	/* set the timeout values */
>  	prop->clk_stop_timeout =3D 20;
>=20
> diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
> index d11b23d6b240..d8ed07305ffc 100644
> --- a/sound/soc/codecs/rt715-sdw.c
> +++ b/sound/soc/codecs/rt715-sdw.c
> @@ -431,7 +431,7 @@ static int rt715_update_status(struct sdw_slave
> *slave,  static int rt715_read_prop(struct sdw_slave *slave)  {
>  	struct sdw_slave_prop *prop =3D &slave->prop;
> -	int nval, i, num_of_ports =3D 1;
> +	int nval, i;
>  	u32 bit;
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
> @@ -443,7 +443,6 @@ static int rt715_read_prop(struct sdw_slave *slave)
>  	prop->sink_ports =3D 0x0;	/* BITMAP:  00000000 */
>=20
>  	nval =3D hweight32(prop->source_ports);
> -	num_of_ports +=3D nval;
>  	prop->src_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
>  					sizeof(*prop->src_dpn_prop),
>  					GFP_KERNEL);
> @@ -460,36 +459,6 @@ static int rt715_read_prop(struct sdw_slave *slave)
>  		i++;
>  	}
>=20
> -	/* do this again for sink now */
> -	nval =3D hweight32(prop->sink_ports);
> -	num_of_ports +=3D nval;
> -	prop->sink_dpn_prop =3D devm_kcalloc(&slave->dev, nval,
> -					sizeof(*prop->sink_dpn_prop),
> -					GFP_KERNEL);
> -	if (!prop->sink_dpn_prop)
> -		return -ENOMEM;
> -
> -	dpn =3D prop->sink_dpn_prop;
> -	i =3D 0;
> -	addr =3D prop->sink_ports;
> -	for_each_set_bit(bit, &addr, 32) {
> -		dpn[i].num =3D bit;
> -		dpn[i].simple_ch_prep_sm =3D true;
> -		dpn[i].ch_prep_timeout =3D 10;
> -		i++;
> -	}
> -
> -	/* Allocate port_ready based on num_of_ports */
> -	slave->port_ready =3D devm_kcalloc(&slave->dev, num_of_ports,
> -					sizeof(*slave->port_ready),
> -					GFP_KERNEL);
> -	if (!slave->port_ready)
> -		return -ENOMEM;
> -
> -	/* Initialize completion */
> -	for (i =3D 0; i < num_of_ports; i++)
> -		init_completion(&slave->port_ready[i]);
> -
>  	/* set the timeout values */
>  	prop->clk_stop_timeout =3D 20;
>=20
> --
> 2.17.1

