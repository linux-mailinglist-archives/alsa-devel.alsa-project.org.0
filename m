Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E82345D3
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 14:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8069016AB;
	Fri, 31 Jul 2020 14:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8069016AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596198657;
	bh=2o7ccAqjf9e2hR8NN9Y5xH5/g5XTgNzvCSEITTq9Eog=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbIqJAuk0Y8m/suogVyWdHo0QGRqr1E/qBjDsR3tAGFd8F5w5i8P3HUs/7Xo51GdD
	 XJ3yjrh4WcsjoZPj7RMExFETQu6TdaqwEW6zrfOa2WDZ78ogMC8LnAcrmzr2q88lbv
	 BEFxGygoI4IM5IkWkZ5rbtvgbeGpZTAcPTGzAnnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4919F801A3;
	Fri, 31 Jul 2020 14:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D3F0F80171; Fri, 31 Jul 2020 14:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE33CF8015C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 14:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE33CF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Yuu+TKKT"
IronPort-SDR: jGH0HM35hEJXpTmJc2MzL0/+eQFTkWA6gxFtEqsruRwjftG41Gp25skFldOLtIcdRh8pAIDJD+
 GyJNcO6F+Hdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="169877605"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="169877605"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 05:28:58 -0700
IronPort-SDR: j9GBagD5ZhUBg6kPFWqy08KLtR7Ch/ZWSsxU2t3me4CoJbpTXTsOtYAzqW5W43D5Nhd4AlhWpW
 f57s2ZjT3r2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="321387833"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga008.jf.intel.com with ESMTP; 31 Jul 2020 05:28:57 -0700
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 31 Jul 2020 05:28:57 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 31 Jul 2020 05:28:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 31 Jul 2020 05:28:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2bMMiDXPYsiKKV0iGiBaNJYi13Piq6YCQxv0pcafpwcTGzDmTYKnDKZ8XVB7IAFn/kURfbuSaiUshyuzgGUtnHQ7OxfuAGVDN9t/5LWSMnqnSo+pcbmcX2YB+S2U38+OWJHl16AfEpht8REDLpmkL7zIFqz0xwAnIyjM6uiFdnFe4Xn+EXqM++Xc1iwM5vyJdsjM3cUkoBx1rDmE7WoTHncELnj6N6I4a6IDxsqku/uqcYD2c6Y+n4aPAHhWO37/vj1DrzhaKzUNNBvgDh7rHfG+Egteyte0ujSQncO4MTt4w4eI6anfI67bxAKVMR2cdw/f3A01z3+Iknw7Crr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0pjH/SJ0xfooYs+lJx0kg46sN9GlD2gLHq4CXpbso4=;
 b=EzXeNfmA37BcWY/9t+nWeGnnXikPA8wbsO2nmi+NlQTW5s6zA3eZFNzG5zVY7PIrNcqJ9Z22fah+jARlAXNZjB0489nFvJxzhbQOU9wBOs4e9wa20+iMuYgwAPqLP+VBTSpQPrqLx5wpRadSqqxweAJJm49kE7TbSJA0atmR3JAvcQ6Tfx29d/EOtFZOtYjKi5DUkaCI7J2PTt/MXgLk8MmUK/Jc5uSSmG8DCtj6xWPGcYXPRnextVtNQYGQpDHjrpAaA+F3qLqMnXMYsSgcBCosgQOXNYJSibx6scGU4aKlg0+qdWeZ5GBHmNvyZLa0S3mx0m3jXflF7odAG1A/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0pjH/SJ0xfooYs+lJx0kg46sN9GlD2gLHq4CXpbso4=;
 b=Yuu+TKKTSoxzZfCTljQhAqXkHGA6og0sBwgoPn7k+p9b9ar8jGXvMnM08tBTXjJede/MbA24l2mwvdqzYhNHerjxNPKWt81ia1+K/t2L4QMqk/7DqGjAGFeNY7fKKX4WrmhcRb7VNxoMUAkMXAoz57a1GJ0Bu3Mhy2o0tGdyjMQ=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB3785.namprd11.prod.outlook.com (2603:10b6:5:13f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 12:28:53 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3239.019; Fri, 31 Jul 2020
 12:28:53 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Takashi Iwai <tiwai@suse.de>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Topic: [PATCH 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Index: AQHWZZiWhH0ib4T+aUeOy2BFXbTqlKkemFEAgAErLkCAAH1RAIAAGJyAgAFHf7A=
Date: Fri, 31 Jul 2020 12:28:53 +0000
Message-ID: <DM6PR11MB364247C4C6F5B310F3E1E652974E0@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596020585-11517-3-git-send-email-brent.lu@intel.com>
 <4fe97f63-e552-3b2f-803c-53894b196bfd@linux.intel.com>
 <DM6PR11MB36421D9A808D401416B72D2D97710@DM6PR11MB3642.namprd11.prod.outlook.com>
 <f1386a05-8866-9251-c751-21c9109aa35f@linux.intel.com>
 <s5hy2n1aqn0.wl-tiwai@suse.de>
In-Reply-To: <s5hy2n1aqn0.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.210.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8acd0fd9-ca6b-4be5-2274-08d8354d4972
x-ms-traffictypediagnostic: DM6PR11MB3785:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB37855D66CF86418D0905E788974E0@DM6PR11MB3785.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eTeQdnGYSEgixG0qF2emqehrZ2GKjVFmdX5jwxTilD5Rcw3Ic4ajramDDVN5Bi0HA6D3cHpkvG/YCOZXFSjqYh0+V8UV2aau/9ZLpR4trsjy6zH9p/5e44xXUXzS3SFlUu3NY+B+lDn8cQ9uzCx1lonU8ooKotFw9h4E63JKFa2U3r1m6x+GsP986xbQJMflfOH+YGsx1hWLGLNlC3mkz6DccdNqk/z8dK0T+AwuSek4DllnyRsLKf/TOcLCf8uEFI7XhZn8nJXK7DlpHv8TjlrzsltMmiHC3Wc64EQxgAUtNxzNv7+taS5iEmrjImDZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(26005)(33656002)(76116006)(186003)(2906002)(54906003)(66946007)(8676002)(55016002)(558084003)(9686003)(8936002)(5660300002)(86362001)(4326008)(478600001)(52536014)(316002)(66556008)(71200400001)(66476007)(66446008)(7696005)(6506007)(7416002)(64756008)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 104KWf4as863x57Jj4ol0LqNulyEKiXoPNf+0r0i1WGTOgbrnGizmJavGsWSOjyteZ3ZL6PFQhHfGPMsnlgfQ5F4Sb0CXcKdXeSwqn1KOMT2Yi2ehp8teqCamcOAfddMbLUFKh01AARhgHJ8BtrUIo4iEuaAnrcWhOSqDM8rvhSPAgPMgB7m6Up60Y9wDr6TiXl+7ts458Jym/PmxPtBZpd+4YA49sdJnrXugBoSyRezLqQHCTj85YtQTyaLI5iDCd46SCuqJCn6CeUN/do167uVGgznAe5PBYaXr9Pyk3epgmtQ1dNh3+EsnjQuBTEULqcP/ATq2O50lkO7wBk748Iks1UL2KFCGDgdgwqENvMdmHMGZoY2QfTsCgOVZDv4CH9Ffsjg8npNXAqxdrBA2L68UvLE0X2QPLag+scY9wjb+fhuPSzUwADKEoNAyOyPD1sQfXxbU1SyvHKQ3MGToJZlkFNdFq6Tv2sS56hi5cOtK8x1MpxqYwK4QIvz3dgmJKZgbBOg1llFxHL/9sXNCu5LE4Gmxg9JZWWB+6yHwOB9n8ij2ABKDlF/ZwIOITG9s5D8G8ivNrM1EvgrsPFx4Bgde0XflHpexWFHKvq3/keM39LocJHY9bcJLSIOC2A2WRYj8MSNReAt3nSueARiyA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acd0fd9-ca6b-4be5-2274-08d8354d4972
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 12:28:53.3216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSJv6TuYtVE15VCpdceesGNZ4aVDGbB/pteWxre+43B3j5QQkvqvL2eThsE+HH0D6aHaC9+rRwgeBp90Nxvhfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3785
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Damian van Soelen <dj.vsoelen@gmail.com>
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
> If the 1ms alignment is the condition, it can be better with a different
> hw_params constraint.  We can use
> snd_pcm_hw_constraint_step() for such a purpose.
Will fix. Thanks.

Regards,
Brent
>=20
>=20
> thanks,
>=20
> Takashi
