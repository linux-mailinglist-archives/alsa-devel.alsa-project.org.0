Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24C248BCB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 18:41:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03FE51792;
	Tue, 18 Aug 2020 18:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03FE51792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597768877;
	bh=WVjh8+dwBRM7Aq4IAHlAnVdo5FRGnOFA3ewMl2haZck=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SiI/B8n4D8EIzgEji8Cc4EFu51BSYNIjKQIRvay5tH/U8PhCH8FizCQufVbVcMdrQ
	 d23/5uMWisx7h55vShdgxnVnrjnvA9IVsNDBVUHw0LBKlouxFT+0FbD8iRoMKYiHqc
	 Adz+ZStj1iGmZD7l/hf5ZotkgpyKYZuBpGW8ZmYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A4D7F80273;
	Tue, 18 Aug 2020 18:39:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AF56F8023F; Tue, 18 Aug 2020 18:39:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2098EF80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2098EF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="a5+c1N1V"
IronPort-SDR: tSajwVlvidP2x09o9LRYZwLAIXeVF1z9+oEGjahk4F13JkvlK2yUmOt5bDg5kYQWEGbdbMIbCJ
 V9NVC54GgcMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="152360871"
X-IronPort-AV: E=Sophos;i="5.76,328,1592895600"; d="scan'208";a="152360871"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 09:38:58 -0700
IronPort-SDR: qiJ3gSU67KhGoLRBaWM7jmzEz146Etnwt02zOc3TnKwTuMxsz8kJW9/MWN/fdHiyLnxWEiku50
 B9Ja1Zm3UCHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,328,1592895600"; d="scan'208";a="310496148"
Received: from fmsmsx603-2.cps.intel.com (HELO fmsmsx603.amr.corp.intel.com)
 ([10.18.84.213])
 by orsmga002.jf.intel.com with ESMTP; 18 Aug 2020 09:38:57 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 18 Aug 2020 09:38:57 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 18 Aug 2020 09:38:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 18 Aug 2020 09:38:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUkx1I14PQzS5uJlZkFGYOWaP/+z2XS5uB+pJdJz5s5TXkBclg0jMSJ4vEf3lx76Swocecq7dzyn1pqjCXTkFos8c+jznSI1CXBP4+uZKFovQQqH1xVP5wNXF8pFpnTA8NSVkPdAR+J/m5ZWaeUpLb6wC7CgYvoOFk39b8ncIkJ5LajugkFV1LZXYobyxusRTt6qJv7zMFqP34Pqtz8yV5qWe8R8fB7yhByqlwY8sH+rBtB5op6hoKnWE5oZEYEuZSTQf6KM8kF3dAB9uNYcGhCvpULRNcfCLjPn93HlZ81OvOo70sTjqaoc2ruKQx3JKd8S6RDGf2BLaQ36hbGc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rR2YvZ38/DkEurcIc7gkfnH2c/YL+9FEeNxd5Kfkla8=;
 b=enEAdVXBD2FGwwxP6XLjcbpSrYI0+Pp7qGrT4eOzu5CSMtXWO2W7pIAACtLQeHqMTE59CslOkEI9l460o3CRr0oBc7KgRhpaEU0vYQrgojw8dhucLGXqhaprwTthnDMS6WatTShDAcv+Vz0wCCsr2HjQPbTHw5pCNMcNQ864oYyuBGf5m4io0vObKXj1zY/DlsEy5XytvuagCogRfVE29qyCeVybovNZSszQQT6YfVVKX4gzYs+pAaF9Jw0Rv+HUzdWbHkabs6gI0m/snc8JXCInW/ZrUH03RpjE2FfrKz7rVZ8CxhB7Xi5TZUwXHTItjw8dN40u7qWKcNgG4YsW3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rR2YvZ38/DkEurcIc7gkfnH2c/YL+9FEeNxd5Kfkla8=;
 b=a5+c1N1Vkc5YimwcGDJne56DQ75Yq8ZmNFM+84vCdKTOcWhyuwfyZtZ0yO8MPvOxhJ0hdxF/qx66I0xTiOYle/du/CIbs9jP+wJChMPJB/Po0SGBgymAurJOW8Lt/8vprpVq2LpxEx5DlbsOg9fmmTPBXwOky/sP6Tbheiu8TMw=
Received: from MW3PR11MB4665.namprd11.prod.outlook.com (2603:10b6:303:5d::12)
 by MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 16:38:53 +0000
Received: from MW3PR11MB4665.namprd11.prod.outlook.com
 ([fe80::18a3:e19c:fd98:f75a]) by MW3PR11MB4665.namprd11.prod.outlook.com
 ([fe80::18a3:e19c:fd98:f75a%9]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 16:38:53 +0000
From: "Zhi, Yong" <yong.zhi@intel.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
Subject: RE: [PATCH 0/3] ASoC: da7219: Reorganise device/codec level
 probe/remove
Thread-Topic: [PATCH 0/3] ASoC: da7219: Reorganise device/codec level
 probe/remove
Thread-Index: AQHWcACDJNkriZkGX0yTzROdPr+vcqk+GLYQ
Date: Tue, 18 Aug 2020 16:38:53 +0000
Message-ID: <MW3PR11MB4665D9AD35EF41A7F24F5208855C0@MW3PR11MB4665.namprd11.prod.outlook.com>
References: <cover.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
In-Reply-To: <cover.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: diasemi.com; dkim=none (message not signed)
 header.d=none;diasemi.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [72.180.71.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1beb868b-a805-4563-d46b-08d843953160
x-ms-traffictypediagnostic: MWHPR11MB2047:
x-microsoft-antispam-prvs: <MWHPR11MB2047BE83056F8F4CB1A483AA855C0@MWHPR11MB2047.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Win53JuoCpVF+b868qS7QTwplM8Qpgs5nmMKkPOHltbhEb6BxrTcEW2wpFKU8nkc6/jLA4TxxvlTlRGQJAtQoW1NuzbyjeLhuD89DELczraD2CfRQLrGv7Okr31bSgfSEZv6JzOHW+xAf7/VGQ/xxfkiFBYtqSwltcqNmiuEx1pH+3TgL8r2CjstCMOu/ZTLlV0jLHzfXEdq3YTDMolGauVwodxnSMmF2Krs3Sc6/PYNATpPtRBcXV6iz3zMthPrN8YwvhtEueKAIw/Rj3+twMzldz4pfZNsfeAAvTqKZWWsdNbAK1Ld0Zj0YsmA5hPs1IWQERxLf3ZUrh/ICvpJfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4665.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(86362001)(7696005)(9686003)(53546011)(64756008)(186003)(76116006)(71200400001)(33656002)(55016002)(6506007)(66946007)(83380400001)(66476007)(26005)(66446008)(66556008)(2906002)(478600001)(54906003)(316002)(110136005)(4326008)(8936002)(8676002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: uyuqo8OK7IC5r2hNvHD3JD76WIJz0Z0/+GbI803NciF+xuXQGUYizkcl/ceKqITN+TvLKfg4WRdsFIq1B9Pj4OXugFTDYCoURfD79sA6j4cThM9RbeqglfDFeLn85ZaH4CtTF5M3QlWAsx+bdhn94u9TcojnbfD7zc5MZvysawBlsMfgTJoQ8zoSI2rI+d5CwuRqDrfufVDhWJyXkFWNT/IL3ZS/cb5Wz5wFsMty412r4Z2xApJmHuxiMtapygWHnrvGnfR2JWUu6PFPQOP+8P2u6/Q/BAXXHPdPodciW2A/Fz9AdEjTqruIHLeeIzY/TN9tkCt/51917eFXH3Fv3GRpwcmy2kX6BjHrZbSrS6fCXA39wYK5sXSkev38Mp0G9mD578h8nt2Pc0/mEa0nNizYims/m9YvCUDJbPADtVU9cy1D96Pe2EkPJ5ElIIaMyjLt1gPCD5G1aBbD7w378x+QtOwFs0T4sQb0r20jr6k331Aaly5k4JEs6UWltJuAv2UotgFeg7XJp6Nb75n4+fFEikzr9t+ua17GWSjt3hts+tSEfmercIHqpsHkEl1ZDyD2tItu89OCtIdVUH2iLbh2rKaCKbL3Fs+1DHUPMZILfeWZ2Y7xi8FzfUKbm/p+Lq9qmMtJ2kOko1X1cTxScQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4665.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beb868b-a805-4563-d46b-08d843953160
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 16:38:53.0283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HStD/gtMftTeYztzLH82VVyPwzKev47JQehk9BD9vGMOtxUUztFlLJh8QkW2pgYm/scUNfS9jmYlgFdQjE8gIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2047
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Support
 Opensource <support.opensource@diasemi.com>,
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

Hi, Adam,

> -----Original Message-----
> From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Sent: Tuesday, August 11, 2020 11:57 AM
> To: Mark Brown <broonie@kernel.org>; Takashi Iwai <tiwai@suse.com>; Liam
> Girdwood <lgirdwood@gmail.com>; Jaroslav Kysela <perex@perex.cz>
> Cc: Zhi, Yong <yong.zhi@intel.com>; Pierre-Louis Bossart <pierre-
> louis.bossart@linux.intel.com>; alsa-devel@alsa-project.org; linux-
> kernel@vger.kernel.org; Support Opensource
> <support.opensource@diasemi.com>
> Subject: [PATCH 0/3] ASoC: da7219: Reorganise device/codec level
> probe/remove
>=20
> This patch set reorganises and fixes device and codec level probe/remove
> handling within the driver, to allow clean probe and remove at the codec =
level.
>=20
> This set relates to an issue raised by Yong Zhi where a codec level re-pr=
obe
> would fail due to clks still being registered from the previous instantia=
tion.
> In addition some improvements around regulator handling and soft reset ha=
ve
> also been included.
>=20

Just to let you know that I tested this series on the JSL platform, the ori=
ginal issue was resolved, also sanity checked basic use case like plug/unpl=
ug and
suspend/resume, no regression found.

thanks,
yong
> Adam Thomson (3):
>   ASoC: da7219: Move required devm_* allocations to device level code
>   ASoC: da7219: Move soft reset handling to codec level probe
>   ASoC: da7219: Fix clock handling around codec level probe
>=20
>  sound/soc/codecs/da7219-aad.c |  85 +++++---
>  sound/soc/codecs/da7219-aad.h |   3 +
>  sound/soc/codecs/da7219.c     | 493 +++++++++++++++++++++++-------------=
----
> --
>  sound/soc/codecs/da7219.h     |   1 +
>  4 files changed, 328 insertions(+), 254 deletions(-)
>=20
> --
> 1.9.1

