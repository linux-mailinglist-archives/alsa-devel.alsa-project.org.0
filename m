Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDC0290B03
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 19:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8A21814;
	Fri, 16 Oct 2020 19:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8A21814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602871071;
	bh=5iNOIJLLeRm5cKaI2VzKYuGZIQTFxttEoKSV+Xhs9Og=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bWfNgZkGlm9ROsa4Qa1hSd/FZrS2WFSxH1ybC1rSlczCo0k6sNQQAmOx19UdFiS7e
	 E8Be91X8Z5KTwkSb522j+lUmNfUF58kjGTDVNvg35gmxukAvHTl+a5oB7VSxgAsP5Q
	 I2KXD6g7DsgY3hB8mgg4RC7CudhUnV8FvwY9mGZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5624F8021D;
	Fri, 16 Oct 2020 19:56:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D279EF80217; Fri, 16 Oct 2020 19:56:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A771F8012A
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 19:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A771F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="s2Dmt99S"
IronPort-SDR: agQA3CgwGntkk6kn+koY75EhbUm9YRMMQQ/kr0KWJEOEYPmzb/pJWekPKWn0ldWaY00nhfEPOh
 QE6Vl0/RaGEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9776"; a="163183737"
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="163183737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 10:55:52 -0700
IronPort-SDR: 3a9lyJ9uIPYQKShSl/zjyzQ69Ruxj9LllBqY2cV8nV2IduiMk17pDU9/i6yhr1Rp9YA3OHEnL8
 HA6kmNyDSByg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="358168517"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 16 Oct 2020 10:55:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 16 Oct 2020 10:55:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 16 Oct 2020 10:55:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 16 Oct 2020 10:55:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 16 Oct 2020 10:55:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQ7MfJHSpQt8QFoBitwzBJIvJ3sqsGm50m0IvdblM0DgrjdRm6cyUiY5gIHqkq1Ij56iQs4LZiNF2pV7D4CNnAtQ0ht7EqJcqb9n+/Ew9Yhn/MWTOIC/uu9Xdeda7kAKzf3bmWKWJLt08VD9zefQYesdFc3PSl2NJfZVAgY0vdDYnAL9IIdEC5lENfMJ3JXFLv2bwTTWMTUEQSgYSr9XjTNasIngBM9kNuBcplkHZ2IRKQRcZMkb93Wi2Pz5E8mOdlr+jxlP1Td5oTWbJ8jcXQuOI1Vc4ECt8j9uI1wBs40b8bAwiTxrVfEanJJo1XuXBIu3B6lrJ+mYWTO32AkWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iNOIJLLeRm5cKaI2VzKYuGZIQTFxttEoKSV+Xhs9Og=;
 b=NwgwrZYZSa1u2bpmXh6mqFo8q4B9k4afmwuT1NfSHUZdApTPf/e4KiPQPeMcR/BzfTYJY0VLCYCh9TxlL9+clV+b/Zd+y8Wjc3TRT8sKkfDcpP00wpNmd8PYkP3hqy2klqmF3M3+W77j37OHKbjMN62Kaj29XDOhW7x74rWlfYiA3CvPBf61HKsuAG9hdI9LiBGcyO4WiZu2j+F8BBmmLd9h/xk+4EDbrMWVGritoxoA6EHC470eoptRexJBrDmPYfZEKMz7SxugRJL6GLXN5Qjm8V3RgqPUYkJHesHWoqK3hLHxtCUr6yJYp9u6lIK9+hLKM2xALR7uDErxP+jhag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iNOIJLLeRm5cKaI2VzKYuGZIQTFxttEoKSV+Xhs9Og=;
 b=s2Dmt99SvlZ4M0R58DhoHKS8zYjy38S1EWEzb/bkFEr4ZS5M5qM+4iVCZrnUpc6krNugX4cy/dpE+46CVL7+QZbcJFu6E1xkM1KbKvVjctE7akIMDhrNa33KFKhFs+vg5fSp7KVPQ0nXuBnHrW8fIMZlugevU5y17290fa/88fA=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB3036.namprd11.prod.outlook.com (2603:10b6:5:6f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 17:55:47 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::e05d:6beb:bff:1a52]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::e05d:6beb:bff:1a52%4]) with mapi id 15.20.3477.020; Fri, 16 Oct 2020
 17:55:47 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, "matsufan@gmail.com" <matsufan@gmail.com>, "Jimmy
 Cheng-Yi Chiang" <cychiang@google.com>
Subject: RE: [PATCH] ASoC: Intel: boards: Add CML_RT1015 m/c driver
Thread-Topic: [PATCH] ASoC: Intel: boards: Add CML_RT1015 m/c driver
Thread-Index: AQHWo9aR07NAP3QgVUKme53I7rPX4qmaaKCAgAAYvIA=
Date: Fri, 16 Oct 2020 17:55:46 +0000
Message-ID: <DM6PR11MB3642A64CDC413FCD8C00DCDB97030@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1602864145-32249-1-git-send-email-keith.tzeng@quantatw.com>
 <20201016160418.GF5274@sirena.org.uk>
 <d286cbda-9dd7-fc8d-22fe-b0d8f6ef41ff@linux.intel.com>
In-Reply-To: <d286cbda-9dd7-fc8d-22fe-b0d8f6ef41ff@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [114.36.88.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfe95b09-c4c5-4654-03db-08d871fcb5e3
x-ms-traffictypediagnostic: DM6PR11MB3036:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3036185FF0C4BAE0D46C59E497030@DM6PR11MB3036.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j031NQFJZG6OtLIp6umFpMWhlZw9r8jZYmepbhAAkvxqScuz6wL8ow5GlMyzSwy2dM6h3TBmG1E/jn+4U2dwpl90jtenjq1DXOLuJvOnUOfl4rdNmQ9z49GmCDz621HfduZ8M5hgouXW/OYHe3wN6MG/IU5CW3/Izg/d+AuVXVfTOvOGHwfhyU8nYlhjFr8PsRIvySZVfZojz0UCOAU8EsyWIX8aExartxntwRAcsLtgJaAo3BUz/AwQ/Rl9McYjXTzNTxso3K3kZrcxn/K0nfY+eskST8QGCXWrKuiymX0kc4KPBgbltM5ZW4+5FfOw4XuMmBSvsHHjkVoun3ZZrTnP7kCzzVvgGfmkGMfKgIfsGNv8hgOCz74ILb3fnXn6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(186003)(26005)(5660300002)(4744005)(7696005)(8936002)(478600001)(316002)(71200400001)(54906003)(8676002)(55016002)(33656002)(2906002)(9686003)(4326008)(6506007)(110136005)(66446008)(83380400001)(66476007)(66556008)(52536014)(64756008)(76116006)(66946007)(86362001)(11716003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: H5U1bj5SMwUEkzy29hgkSKmr0kYbpy4ehLqYRh6yBd7FNvfuYmyfD4cj1PPblEx3ewQn3D9QrMQqNn/+2V1mheHzKFlSWz1jQQyXH47IFHz0Ut2J+k2jl1SLZHKyIj3e+lriUvePaq9ho8csYL/2aJj0PNpQgTUAOQvXoBJDlI4Rx5kobylZ2Y+/YRlq/4BsZkYC4WcFV3HJBJvuclTgti8ghFfjjk3W5wgmB9Fxsr59N/keic82Pf5WsqPckOrOPt6BEaCjCpu1UIXLcT96d+sQOsjtcjrqnWc6YxWwzd9sRVo5I9SHsOR4d2Mt64JPiQh8kQ9ZmPLptjBrufNwGe6BRVVisXTSsLnFHC/FsS8md+9HjWxxeKT6eH+Cx9r+Ob0SmNaRAz/nWbFeFjM7sytVy25TN+nbHymUuHGkBdqdc1SxFmtDwTIuqbQrS8/eVkKFPRkEbP3ylKvNWSILNNxf11M4tMOWe1qxZzXobl+ifEDN6m7SfdZHVipKSFmnIoljo3Flr/yTS+uD0ZthV8wSAuemf1bZDQtCb8BI6hQZQ2CtF1FTiE9ZlrS8HCwRkVpFu+dWvcTKs60EocCVE9q77IrSiwP/cXdOUqKcjyZrE7Ocb6jKlIDF8tY/Am3WcqFZPfpgFBpAIFWxW1kgLA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe95b09-c4c5-4654-03db-08d871fcb5e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 17:55:46.8587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VThIJNyA8SzsG8mdbUNW/t9b4r7Fckvv//AtreLEr8ZObjDjwnJfakCA5HoT91ou4kvwMjDYbhgc9aDB860Csw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3036
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Keith Tzeng <keith.tzeng@quanta.corp-partner.google.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, Keith Tzeng <keith.tzeng@quantatw.com>
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
> Was this patch shared on the mailing list? I don't see it in my inbox and=
 in the
> archives?
>=20
> At any rate, I am not hot on adding yet another machine driver just to ch=
ange
> an amplifier version. It's really horrible to maintain all of these permu=
tations
> by code duplication.
>=20
> Adding a variant in a existing machine driver is a much better idea, and =
pretty
> much all new machine drivers follow this model. You could either rename t=
he
> existing driver as cml_rt101x_rt5682 or use sof_rt5682.
>=20
> Thanks
> -Pierre

+ Jimmy from google

Hi Jimmy,
Any opinion about CML machine drivers for Chromebooks?

We may keep the separated driver in CHROMIUM or modify existing Helios driv=
er
to adopt the architecture in sof_rt5682 to work with multiple amps.


Regards,
Brent

