Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0765A287B00
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 19:30:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960CB1681;
	Thu,  8 Oct 2020 19:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960CB1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602178250;
	bh=G0JIEFWRiwQki64cYd1Pefz6WZTSN/LgHQX6ewRatNc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LNJVwwWjBvAQXk71OHmkHRHjFbIb2FE3t7OrvM5iMjNuaxdYCIL/DezkOPVLcsSx2
	 OyhC3ZupunpyTMy8nSmwemjEbFWzz7LcrnP2gkpr0YcWBt7bzlB8YAzmRTY3APJ8FM
	 qn5MYbNajuM255CKy6uVXVD4k5AxuJVaxXUy2qeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23647F80164;
	Thu,  8 Oct 2020 19:29:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E928F80164; Thu,  8 Oct 2020 19:29:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCA7FF80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 19:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA7FF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="DzOeJQrH"
IronPort-SDR: YjS5tuE8HrdMRDIeMKU2OiXPEYBHQX0LdeWItpZcLGcjF075PDZGnG2N2gK6BSlxL2zvpzja82
 s8/eblNgZJ/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="250069696"
X-IronPort-AV: E=Sophos;i="5.77,351,1596524400"; d="scan'208";a="250069696"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2020 10:28:55 -0700
IronPort-SDR: H6g5317K+gw2/MCUjsZK+M+soLorxOXAlQ+xTYOIvgUNns8UmpYTxx9Qel8eTEQnwic7h3wScU
 eJ8t726OobhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,351,1596524400"; d="scan'208";a="519420223"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 08 Oct 2020 10:28:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 8 Oct 2020 10:28:54 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 8 Oct 2020 10:28:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 8 Oct 2020 10:28:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 8 Oct 2020 10:28:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtaGRMhNUKKtZXL+D9sUIwFiWWlFWhULgvqI2QxTQDf2A1n+/sI1Uq62ZhyVLguVNaigr/HI3KWVzq9E3HvIFojKDtZS8T6h35OY4E0YJ1r84xX+hMR8o+f86xm1JslwgUAt+apRUTHfLMr2BIs8xjMoIz5eBzVPOyOMSHaXabNlYEHevtmeykQopUyDxAwRlu5kiXbFZZ+GR6tOOebPDGh1iL7BnKL6yqrA3J5oXytyfZeJ/mAzEM111aOJEVL13mchbEJg3eyHMSIIPTZ37ws1UutlCxwDGLYk55LSILLdVuVYqjkslremL8yQCAYNj99vhs7cnOTCCF8WLpRFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gy7kzGh8DeiirIEozwsnGebRq9YcUZK0CM7ESt/uTJs=;
 b=Q5CzjpN82BKcYB8peSX9dtAy/3C9npG7lXq39VdvefGD2whTxTa/ro6vmjo0/u/C08uJPNzcw/fi3OGZyb9BZ3uQlYCDpGU8ri3ew9iKCbZEc1LxwUWcGojNxsHH7hHIhZyf3CGMPbFDUYIu0ErUiiuxPaLIzWL/fnNLDJcukq9IzLOIWzRAHf3wsm6F4ebsJc4rJ1d7wP4N2564VdGTwb60YKet30+N6WYtzOUR12BPvxFm0WofwJAF0TQ+XbOZFm42STIdWB1GCX8wAo265/cWKoAZrJFom+HTEAEysj9bj0K0atfPbh6AmBpGJauVVSZqclHPbWD8NoWZVIFkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gy7kzGh8DeiirIEozwsnGebRq9YcUZK0CM7ESt/uTJs=;
 b=DzOeJQrH7wEjhIdfmhxpPL5qLyjKiFdWsVNU4Dd08AyGvrrpMCHJOqQE+k7MESxzcixYZsSbEFg2Ykb7oP9rThv66ED+UiTofc1zA+g6O7+1HsRUZLBq6SkST3booDessJa5os3PYgiABSmCy9AdhrmMDhgjXuzT+g6jw1v0H3g=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM5PR11MB1497.namprd11.prod.outlook.com (2603:10b6:4:c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.22; Thu, 8 Oct 2020 17:28:48 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.046; Thu, 8 Oct 2020
 17:28:48 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Subject: RE: [PATCH v2 1/6] Add ancillary bus support
Thread-Topic: [PATCH v2 1/6] Add ancillary bus support
Thread-Index: AQHWm06cVdQZOfJAqUq6P9wAQIqk66mN9/CAgAACA+A=
Date: Thu, 8 Oct 2020 17:28:48 +0000
Message-ID: <DM6PR11MB2841D204DC2617D7DBF1A8DEDD0B0@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201008172011.GO13580@unreal>
In-Reply-To: <20201008172011.GO13580@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d709ccc6-fd36-495d-623a-08d86baf9e1c
x-ms-traffictypediagnostic: DM5PR11MB1497:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB149787CCE3B840526F871184DD0B0@DM5PR11MB1497.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hjQqijTgoAdBJWumO0o0zU63iSuSDzRIKHEjzXBAyDQNr1a8866qg1GsVgkZZpzws4L/o5s3nv/bahNLj5u5BP/ZPYn7jksEZXPClUfkdg1kCA6kUsAORGOGhwXWha56sqb3AOMRSlLLI/vr53H9uDJqIrXdAxAEqqy/RkfLCxzJAMBy5OTe/cOYITOOBwzFfI8fOEHcDeQiEZyjHCKnHQz3PRslmpETyIRC7Usa/wFPi9bmqr5o3WmabGTw5ExhH70EStDHDpCGlFzoPxfAWb+R6s1FaG5s63OeXpuV7FPBkqho27VrE2NN2mk+NEP9GAXAYD9VbnsLTD3jFnarRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(8676002)(71200400001)(7416002)(52536014)(8936002)(5660300002)(6916009)(4326008)(478600001)(76116006)(66946007)(66556008)(55016002)(66476007)(64756008)(66446008)(33656002)(186003)(9686003)(26005)(7696005)(86362001)(83380400001)(54906003)(6506007)(53546011)(2906002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: UO7fSHjQruHnjiq2gvFzHqtD4bW7ZvJGtGsdd6CNviv65ssznjc+ekegrVR0MidHWfDWB3ShS+55uaO3gqfTp4GMqMNxk8vpipsZllm5NNq/pP2svfsekEpiGvJSKOdOYPYOUoEc55zIyh6iGVWcYxrFtcPGc1F3dl98KDvnf5876MqvD5GeklvMkyPBZo8u6St1yq7Yw6QTPQ0Six6wi6UAN9ACVtSiCke3aqk4KZLLn7wlACLDkuSg4JIGxb0Bbt+RAgi4ZqMxJhFP/b3sTjAiAPtkii4ee//wMEdcfW5mxAg+ZkbPpK0tQZNk6QukvGlSiQdby8SeOlNHtSadCPPtN1P3IHVE9mNsm03W2L8OpfcEryWKnNQZJMDovIZSDK1H3E9Mv8ULT5SZ5owFhae8y3OSLqlTbd5x1P42wPEr+zIaoEJ7ZqClmrLwao8BczQs3wuXp+1u1P52R4hYKbnjdBzl3nf/NyuSeurO3NxApJZAfg+C7xaxG9yV4RU5kwGq7N2Kor5s/zeXPuuC8OlwvZNl01Ev0e9cHmJuHnRuO31g7mkQ424pY8GxsyyIs7qRgRDFrE4A57qEyn7IACZMHOHQSAdZtVp31MAqs97Ujdcske9HA2A2s/HQOjLmoHkKqLkZx4bjz5C+VSAgGg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d709ccc6-fd36-495d-623a-08d86baf9e1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 17:28:48.7595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pjnTrqitGwzdOwkL+5/pyD/zT3qvNAeV2ILTdqYoWnqJkT6iQvYwiNR6cFZ3iEi4Nds2j8aWHbxCPsOzDU2udIBnHfJ5a67mxedoPvUtg8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1497
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "parav@mellanox.com" <parav@mellanox.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Saleem, Shiraz" <shiraz.saleem@intel.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Patil,
 Kiran" <kiran.patil@intel.com>
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
> From: Leon Romanovsky <leon@kernel.org>
> Sent: Thursday, October 8, 2020 10:20 AM
> To: Ertman, David M <david.m.ertman@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; broonie@kernel.org; linux=
-
> rdma@vger.kernel.org; jgg@nvidia.com; dledford@redhat.com;
> netdev@vger.kernel.org; davem@davemloft.net; kuba@kernel.org;
> gregkh@linuxfoundation.org; ranjani.sridharan@linux.intel.com; pierre-
> louis.bossart@linux.intel.com; fred.oh@linux.intel.com;
> parav@mellanox.com; Saleem, Shiraz <shiraz.saleem@intel.com>; Williams,
> Dan J <dan.j.williams@intel.com>; Patil, Kiran <kiran.patil@intel.com>
> Subject: Re: [PATCH v2 1/6] Add ancillary bus support
>=20
> On Mon, Oct 05, 2020 at 11:24:41AM -0700, Dave Ertman wrote:
> > Add support for the Ancillary Bus, ancillary_device and ancillary_drive=
r.
> > It enables drivers to create an ancillary_device and bind an
> > ancillary_driver to it.
> >
> > The bus supports probe/remove shutdown and suspend/resume callbacks.
> > Each ancillary_device has a unique string based id; driver binds to
> > an ancillary_device based on this id through the bus.
> >
> > Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> > Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> > Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> > Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>
> > Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> > Reviewed-by: Parav Pandit <parav@mellanox.com>
> > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> > ---
>=20
> <...>
>=20
> > +
> > +static const struct ancillary_device_id *ancillary_match_id(const stru=
ct
> ancillary_device_id *id,
> > +							    const struct
> ancillary_device *ancildev)
> > +{
> > +	while (id->name[0]) {
> > +		const char *p =3D strrchr(dev_name(&ancildev->dev), '.');
> > +		int match_size;
> > +
> > +		if (!p) {
> > +			id++;
> > +			continue;
> > +		}
> > +		match_size =3D p - dev_name(&ancildev->dev);
> > +
> > +		/* use dev_name(&ancildev->dev) prefix before last '.' char
> to match to */
> > +		if (!strncmp(dev_name(&ancildev->dev), id->name,
> match_size))
>=20
> This check is wrong, it causes to wrong matching if strlen(id->name) >
> match_size
> In my case, the trigger was:
> [    5.175848] ancillary:ancillary_match_id: dev mlx5_core.ib.0, id
> mlx5_core.ib_rep

Nice catch , I will look into this.

-DaveE

>=20
> From cf8f10af72f9e0d57c7ec077d59238cc12b0650f Mon Sep 17 00:00:00 2001
> From: Leon Romanovsky <leonro@nvidia.com>
> Date: Thu, 8 Oct 2020 19:40:03 +0300
> Subject: [PATCH] fixup! Fixes to ancillary bus
>=20
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/bus/ancillary.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/bus/ancillary.c b/drivers/bus/ancillary.c
> index 54858f744ef5..615ce40ef8e4 100644
> --- a/drivers/bus/ancillary.c
> +++ b/drivers/bus/ancillary.c
> @@ -31,8 +31,10 @@ static const struct ancillary_device_id
> *ancillary_match_id(const struct ancilla
>  		match_size =3D p - dev_name(&ancildev->dev);
>=20
>  		/* use dev_name(&ancildev->dev) prefix before last '.' char
> to match to */
> -		if (!strncmp(dev_name(&ancildev->dev), id->name,
> match_size))
> +		if (match_size =3D=3D strlen(id->name) &&
> !strncmp(dev_name(&ancildev->dev), id->name, match_size)) {
>  			return id;
> +		}
> +
>  		id++;
>  	}
>  	return NULL;
> --
> 2.26.2
>=20
>=20
>=20
> > +			return id;
> > +		id++;
> > +	}
> > +	return NULL;
> > +}
