Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2927F1F76FD
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 12:58:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623AC1681;
	Fri, 12 Jun 2020 12:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623AC1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591959531;
	bh=H2iAwK4V6qP42jcN6dzmHfWFDMr72X2tcnWcxu1lfNQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IzoxKBdLCj/PoxZZ2QlnJqjvg9aKu0exOK3SiN9lgZOqt8LuM1d5khPC7e7mcIXfX
	 nUXNj5dEexw5Ozof8KBWSVykjTxD0ywFnaM2shqpCgTfrbRO5GMQJU90UsPpVw+1Gw
	 KQ+EITSoiXl+ovKD3ttWsPi03ofYFC+OTjMYUnm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFAACF8024A;
	Fri, 12 Jun 2020 12:57:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B9AF800C7; Fri, 12 Jun 2020 12:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 440C6F800C7;
 Fri, 12 Jun 2020 12:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 440C6F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="o9C6tWsZ"
IronPort-SDR: jA3kN1e4+N5k8eiomhXgE1dJrCQ+3KdROri9Rkfj4Q1mwkGNMvD0et7RxYcqE7DFHS68RQXc2l
 V00DNJmyhMFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 03:57:42 -0700
IronPort-SDR: twrA/jP9DJwU9Q+jLfETBVrMaKae2thN4nIbTK5K7uiZoIgCqg7ADvqKtC4kcRTDJmUth9t+UA
 5IF3WuUio8hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; d="scan'208";a="296912429"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jun 2020 03:57:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 12 Jun 2020 03:57:41 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 12 Jun 2020 03:57:41 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 12 Jun 2020 03:57:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 12 Jun 2020 03:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1dK8ArKVTSMX/cDS7hIRDK56Bi//JsRQqdgnp2YhL3ojklwkpiphGRWRhKZ70b09VJH3lM2wRQNG3/agqUvz6o0akr6g3iPkNDgntFI0Gfxnqh704dyYAcz+40H/TN6B4Wdl5EXnoYKmL7WlZzqeZLT4I4qtbvJhmxcft3bGiz2rYucOEtxGhMjeCtAFJcrZdx98hPzblxOI83iqudofn0wmGlVq5ZN0OhXVSSdQicQCdoJajykDwYkob6Yu4FBvzkBAh+n9DmQ6zS2VssuXbHnSO01oh1u+QizEw92qDOL5LkLsui+Lpq6C+3BnzGTMmN1/nPg1TBI5NnqxG9PmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2iAwK4V6qP42jcN6dzmHfWFDMr72X2tcnWcxu1lfNQ=;
 b=E/GyLLZUzJK1352T0OVRMUhmkYUqRHXGzVKO7UJSGymwvdrUQCCKjwg3KRG/7XXVBK+eB9/MJHeQ1mKAjfDGpprv2T2Lev5iwI5jzEO9qG0NnxN7w2NOL95amrHfujbUiYGNPNkWTIb2i4dzeMAmGlFOZcPBpybeTizP94N83baHzteL5MPGN8qW+CznZkxFQeNcUKYNvzO2dr4AmTaq3R4aOeihVwx6ODOdPQKBMxl+prQZluhhbHVnqqH5uWNypDKe0NgbouTGTu3GDpSYvOITpq2wK3x8Ao7rexdkrNTC+9s+CtWwoSgYN2vHdTKhnNs5DEvFL526eL2PA8jKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2iAwK4V6qP42jcN6dzmHfWFDMr72X2tcnWcxu1lfNQ=;
 b=o9C6tWsZ29+ob8+fzm4WZd2ohDGnhaDRQ9Tc1CTtCh1NlpEVUefPqA/G7vJtwrzGqpvXQXsdOcxREmdeoUyJS5MUkTWcRrLjSYKfJunt4xDxbaGeJZX/ov5EBwq90MAnssna77Sfd+haUG19VosUUZjQDFfSSYqx2X33lf+64do=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM6PR11MB3931.namprd11.prod.outlook.com (2603:10b6:5:6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.24; Fri, 12 Jun 2020 10:57:39 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::b4fa:727e:34a9:b1a4]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::b4fa:727e:34a9:b1a4%5]) with mapi id 15.20.3066.023; Fri, 12 Jun 2020
 10:57:39 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: RE: [PATCH v2] ASoC: SOF: Intel: hda: unsolicited RIRB response
Thread-Topic: [PATCH v2] ASoC: SOF: Intel: hda: unsolicited RIRB response
Thread-Index: AQHWQKR6H3CqYb3gJ0KldoHkwPAnUKjUzw6Q
Date: Fri, 12 Jun 2020 10:57:39 +0000
Message-ID: <DM6PR11MB43160B41DE1EBCD38A4D7A3097810@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <alpine.DEB.2.22.394.2006121325470.3186@eliteleevi.tm.intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2006121325470.3186@eliteleevi.tm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c689e646-bbc2-4dbd-b651-08d80ebf6c80
x-ms-traffictypediagnostic: DM6PR11MB3931:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB393114C06BCF6AFB9F29EC7D97810@DM6PR11MB3931.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TASbg1uQWxd3HZ4pRHGj/v3LJrJnI1hLkykDnUzuFHT8IWpOO/5Wi5sPDXBn4856BAO6Iq3k4w6Dd5NY3YkATVAL3WxNkvoUObH42RbgPIMJx8Z1RmecRiLmuhAm7i9WBZOjB5oHKkVpoNe1SXm9IzeC27K1J1mdKb5zBNlxHIjpuepoqeTVg45vRu7cIGx4aWsC1GxmGXOJ/ClDKAgv0+18PHSSgCS8xTv0NpSt8flLCd3VBRFR3CFCsrxoB014eFTXNwASZ/lq5dz2m2SRfvhppus0b+KrEhaLlfg24A88SQ3b/w6u/Vlr1U2L6wBV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(376002)(39860400002)(136003)(396003)(33656002)(55016002)(86362001)(6506007)(6916009)(4326008)(52536014)(8676002)(7696005)(76116006)(26005)(7416002)(71200400001)(186003)(9686003)(5660300002)(66556008)(64756008)(66446008)(66476007)(66946007)(8936002)(478600001)(2906002)(558084003)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JHMVQwMnhDQ6SmQ7iuUodTDmuNxWbgyHCZjDc7lc7zGqemzEneSljIarFLgwCtIAgLUBE5UB+8mgJxMCkw4KbvlyaY86c+w2KI2RFKJ3S59aiHH3wC4L2m/+L54Oqg3rB9LATXztQc/6zAPhdTFIyu+QensPXalA+LadRgpaZcp6N2dBMFnPtVb+TiUFns/SZaPW3r0SruO3Zs3avgGnNLUqIFVY37pTUCTTm004rYyCsEOXlnIVzngWoDQ/WhAZfkcpCUHaSCYkheBghNpFxrpyZqdvlHT36OjMQy6t0u0YDtRoFAyq48ey2DzLHrOzu1g3hLGji6VTdyVtjpgbELcyV/9bsWgMSHyz3o70F3Echag/RYOqvlgdFoT7BRWg5S5r5x9+2E20M4uZ1R6uP4Skc34Bwj0lZIEqcL0hj6hYgwNOSwCXA4n/r5hP/TtdBV7zAWBO1HaKWIBit/Mx4KL1ncpqRucaG8TmnTV+9OJSCZqD6232yet9YrtiOncc
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c689e646-bbc2-4dbd-b651-08d80ebf6c80
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 10:57:39.3063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qb5xmiQRdcjomOQ/rtyep1Fgs6qj24Vofqa2pPqjhNCbQBbQt/PWf5LyGyzCszGo1nITtVfMQrebRDng86frcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3931
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
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

>=20
> better to align the logic, so I'm ok to take this patch to SOF.
> Can you fix the summary though:
>=20
> - ASoC: SOF: Intel: hda: unsolicited RIRB response
> + ASoC: SOF: Intel: hda: Clear RIRB status before reading WP
>=20
> Br, Kai

A v3 patch is uploaded. Thanks for review.


Regards,
Brent

