Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6836270B
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 19:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 982B316DA;
	Fri, 16 Apr 2021 19:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 982B316DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618594866;
	bh=9aOtXfflAqYK+G//nkFpsljij2gTI1UQBKlJnzkYE4I=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IVzeket2hevSuHrw4sLVTP0+rYeh5GRQHh0dtKKEuU8EnE4n3beTft/7BlPMoLpwS
	 pSvbbgjRR5ks1DWDyvMk4Uazypoc7o2UA2FweGKSJJLNjrqclG3OQ2r5cdcUwO6zqF
	 3Q5kNnqRMQjl8FBMOaUdFplMJeBrRpy10dAn+Stc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBE97F800B9;
	Fri, 16 Apr 2021 19:39:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15343F8025B; Fri, 16 Apr 2021 19:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3184CF800B9
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 19:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3184CF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="YMu4sbcj"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="J/6qgkWx"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618594769; x=1650130769;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9aOtXfflAqYK+G//nkFpsljij2gTI1UQBKlJnzkYE4I=;
 b=YMu4sbcjzqsGSclGjkqm09A4+bSk8fl/F55ormOwS/kSISfq+VanfVU4
 zFEQMY06jRl7k5hXu5B014iUjMaRqk9QMUouErNoZcJlqcHOIwGLyqNtw
 OR37PpDKAUUK0OiIUDvgKF474QwQCHFfR3NgwWVheB/khZC79UCs/Vw1l
 +M75hBNaPLAiG984ho5aCjuHkirhuMz2jGBXm6qrWO0pJgToLUipdiwWG
 M9YK0Gvj88enxcejkJYbiYWUy186OSrEVHpfazL04YL4C2x5aHgZpZeCD
 wMrGxfLmXS/OmUd1H4JjG/6fa7R69OjCZGWZv6Q9a2o1pDrgw1e2XhZj0 A==;
IronPort-SDR: uLXW//bEKJ7W2A1ayYOx0KUL8nBDow7n9wtaiWlQ6JwhOBGVZdcpVUaKm5wi5Phrdp9JA0K93P
 V2RNuBnQK1xxuTKT+0f8NwSTdB77Tk8hlG/dQaKbcQWvKxDV+5IIGVQtJh93u//B3jbNxbgihD
 NOYnflDeyfZljZonrtnDRRwMQjiWrP6PxknY3Iqgf95LkbnGtM4wM/aYmxLT+nQbDReyaEKWaD
 gcQLNcEQ8cFpF/oSHkktOi8E7dWXQ7VVjqqhtLUV8umdA9qLpaNFi1zMnhAhYCtpGfFCo/P8NY
 sdc=
X-IronPort-AV: E=Sophos;i="5.82,226,1613458800"; d="scan'208";a="116763177"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Apr 2021 10:39:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Apr 2021 10:39:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Fri, 16 Apr 2021 10:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmCLSI5DJwjPOBwppxy4HdLI8D7xWjzFuGwZnKViK1PDXoziL/vRyAlia4ukx135mlhmUGKYtBQB+2+eHQB1DYPzxKsnES4LaybPo96n9ha6pU7zX4G0rjzeCnLxl6NndWQotO/8DUuWGo5JIIf9ITZM9kwUso/6iqhreZV+P1OI4lbnCmPnilHmfaM+dZnTCY/qPBYIWUTG/GY2umh8fweGYhQrjws1wlgp5+G3r64+uzk2MGM8qBIf4Bu7I9gk2gfDd8fK5uYPXwioSRbOfdEuKh4L4nBkJtquRXWAd6Dg8cGK4QaPUPmysxZKZjRtdgz+VZ48JReAl/bSNpOhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCGKBo3syAJTlUe/Dt1wgH30oKKXl+2ofY8dOUXflGY=;
 b=VW2+XAr78cS3S1wFqmOfalcFfszS6AE5/FMX/Kg9CjnF+JpYWjrCJbOx75H/fiJ19fqCaynJ0bRJCkH0VpGcBr9WzrzB0OQW4BLwvNPE1KuydIMAJNbeHj18ssuYVjzQVUAKf+hYaDZGMq2r3msQ8rae9tNJOAZo8QX9e2izWPCDuTMV/FT9Sh2U5DWaDaVxTOoEu+LPB375euWbtlu9RFReWe9hfVQ0Rkx8jsvtGzr3nOvSji/+Q+L2X53ofuYQs6wboTTYrtzcZLWQnpyHWjs+pkOt7MHrrHey3T9zakQT1WcA3CIJu6LZn9UkodxXlj/ru5w7H3E2jsGhiON3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCGKBo3syAJTlUe/Dt1wgH30oKKXl+2ofY8dOUXflGY=;
 b=J/6qgkWxRmP0KSKSU6wly3iiG5frsKXRpKbeMZR5u+CgIWQkKCuU/Mez2sOaufpeYn+9LDHwVImkVBLRoVlMTGQqYXE/2+AF2fqgaNZJrGMEazz+aGzXMV0kP1l6jwjT3QYRmcMUAZkAAJakE+KO1E4UTOJgpCDlmxFqU1d34CE=
Received: from BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 by BYAPR11MB3607.namprd11.prod.outlook.com (2603:10b6:a03:b2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Fri, 16 Apr
 2021 17:39:22 +0000
Received: from BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0]) by BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0%4]) with mapi id 15.20.4020.023; Fri, 16 Apr 2021
 17:39:22 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Thread-Topic: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Thread-Index: AQHXH9nLKm9Vc1LsR0iPwMHUtMwvV6qRfMkAgAAiRQCAIp5ogIABqJCAgAAKsYCAAAhcAIABezGAgAAH8oCAABL0gA==
Date: Fri, 16 Apr 2021 17:39:21 +0000
Message-ID: <cba422f3-6400-2cad-9a04-369ce88eef20@microchip.com>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <a0c862ec-44ba-52e0-551c-0347166ac4e9@perex.cz>
 <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
 <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
 <20210415161743.GH5514@sirena.org.uk>
 <1aff49d4-5691-67cb-3fe7-979d476f1edb@microchip.com>
 <20210415172554.GI5514@sirena.org.uk>
 <ad5d556b-601f-c6f6-347e-86a235237c02@microchip.com>
 <20210416163131.GI5560@sirena.org.uk>
In-Reply-To: <20210416163131.GI5560@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [2a02:2f0f:910b:600:e383:1ba5:efbb:5d44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b438f0d8-865a-4290-1a2f-08d900fe91f4
x-ms-traffictypediagnostic: BYAPR11MB3607:
x-microsoft-antispam-prvs: <BYAPR11MB3607F7756B7FC3A0F151D452E74C9@BYAPR11MB3607.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bqeSdx0NlQyGv1fV4RH15BUL/OxrvBSUHspcn2q/LqFQhBVEnef8mV5pKq4ajvyVfEjyKJ2Mare215Q8nRb6xw2wR/sZVLC7LZVVeSnKr94WAtRZoa1Ig6crbNO6AJ8wnmZmyHLnH46mGMy0caYuFgm7yDGwZq2Wve9Rpmh42En3ZbBWdHqZ/+H+5tpf9ocrcQjCqbCiGiHB0eE49ywE4OtX2wV7hFmQT78ojl0D9nVj3sbCo+8YsQUAftMjqh8QKYFWAtUQ5OCeCa3Z0cLxyT40OcUGpa8mRdtzjwhbvFIrawSUa6Ki2468mmtO49vrISyDJ+vG+QsAX8rUh5abP/IzcNSsMFVvN9yIG01Ac8c7BzwCo/S35XwW+aPwRJ/dpa7WyMoeFodPlfDztI+O8LRddXbBpr49zmXol2Sau7sAbHXv+UBX1GBdyJhvC+QdmL7EfhJ2JPHcWoYjUURT6By2Et5NSXzqUxgR/DJnYArtaLeJhbeIXLzJsyikgflqL/lHpOI3aAJ3uy28rch7p1hLhps9yBdtlFo+OTzy07BM6mE3UfhZYF4GQI8miIJz6ghEucrix9sq3AeuOZdfQil4COoPTEM4h5xt3ujZCyT2NTATei7K3mLYtNri4nCgyetHvE1wJDWPf9F3vZdm3m4NlL+pBUcbq7hp3Vcn+qtnhFDcMv1B4UTPcGpNL7k7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(376002)(136003)(39860400002)(31696002)(91956017)(186003)(66946007)(5660300002)(31686004)(2616005)(4326008)(66476007)(54906003)(66556008)(86362001)(64756008)(66446008)(71200400001)(8936002)(76116006)(8676002)(316002)(478600001)(6506007)(53546011)(6916009)(36756003)(6486002)(38100700002)(6512007)(2906002)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?8JwbhEtB4Z0IN7ffTmmBUbM+aIuxtmXpkPrIkbbrXb0bya7+628LyN2m?=
 =?Windows-1252?Q?U5TYW5HtwIlZw7vBmMUvEvegO5Dz4v52fiwaYAYxkp9o/P2lBrMocSTV?=
 =?Windows-1252?Q?JUDZgttLIpVTqEjjfedf3HRocHY0I6+0mpLA8hGbWI/py6blQfbSxsMj?=
 =?Windows-1252?Q?AZtPdARBBsZbrDt0VZhXXcnXVhTUbpPGV/QTQnAEwbyIgicX5QqSaxpg?=
 =?Windows-1252?Q?jDuMnHyFmOrHkg9Tevkq6/b6pK1Vlqsjamqz2A04OytRSzpuF5ovBbwt?=
 =?Windows-1252?Q?eXWHLyFv/MPoNwmqh4gYLJo6Vizb8k5PJo7xeTK0a0df7oWRP5tPRKvc?=
 =?Windows-1252?Q?vG9C0NMDhkSPJ+9Ll5P5rlGRZ9x86JgJte/UPsUjiBnDcrNY2r0oyEE9?=
 =?Windows-1252?Q?2XU79eWdQRwAfCy1rWQPecrWT21hA2i3viKsy+sfMhQsLossBb7jxwLI?=
 =?Windows-1252?Q?4d4UDvXIrvm/X+DBLNTZgdV9Q+BEvjksthem9ADlVwyPioVPb78tVsF2?=
 =?Windows-1252?Q?wWPsawlVUMqpxe5hP3TYmfjg3Dc3LP25PQoFK3tSSMUvGB+H0Gd4sbx4?=
 =?Windows-1252?Q?SqSQJiMpjMn8MZ1oEPt559cke1MbG0Olw1bZvZ6utkDlXfgck3ZPAafJ?=
 =?Windows-1252?Q?EO9qU+7zVlOqKRgiKhL8J7IRLcxjerwwbVumGrghe7O92m0UgTSSvTrs?=
 =?Windows-1252?Q?4WEQulSZg680LgDCBIFUkkHsezidCvXGDOa+balUl5j/19WERwjetLox?=
 =?Windows-1252?Q?wbdBjcycRMZ+vwjyXe+gQtPwJCWh8pq5/j6bc+Y7VbUJ/dvdxelRZxDi?=
 =?Windows-1252?Q?cH61vyn9oY/Gnq7YF2SleTDEK5Rv4omEq+aCgeX2HL4qd70YIs/IRcId?=
 =?Windows-1252?Q?vhQhGsJ2jYeohwYQJLWB0L9N+oIV7pjMeZJiAjcWyJPgUUAiWFpIJ6R0?=
 =?Windows-1252?Q?GO2BK8CJiCD5ykfvLQH94iCLkCShcR968gO3RDWM0bCT9Cttex3jPyzL?=
 =?Windows-1252?Q?NICTTsP1O77PcYC3KPsRA9Vj6uVwqIDs72zSdp2gzXGOxd/re9hu8V5k?=
 =?Windows-1252?Q?IBr+HItnUiy6WY3rBO30huugFMZ5nb2cDWAvxnv/20WVwCSwJntD7+Zb?=
 =?Windows-1252?Q?Wdy0AqUeCI7BPamaKOOl73nq99O16GGPy5uYK8Pco47EqVQjRLCwIqUK?=
 =?Windows-1252?Q?212HOEJZ5l2DnJNYkZmwtkkF7fxbMsLMttu6osdoUh1fPxOSaBnKmJZD?=
 =?Windows-1252?Q?cBqY3V8XEcz8RMZZ7hGndYHMJZizIHMub9X0cGUcz7X7eqLN964qpfLY?=
 =?Windows-1252?Q?yityMtm4Q/oZ2jJ7eYXlGKCOy+vXywi+SkWUQIR7p8DtY7XUjkGRAhw7?=
 =?Windows-1252?Q?fFD4eLs1NgFDCG2ntCXZue6ajJqMeiADMigkQBWWmsAjIUUV0CBcmrgZ?=
 =?Windows-1252?Q?kzIJQJuDfmwQ9R7+v6/lzEmgP+ekh69lJXi7FIhhgVpoulf7GsDjZcYQ?=
 =?Windows-1252?Q?MUkzueSY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <3E195096F60E444489B1252D6DABFCF2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b438f0d8-865a-4290-1a2f-08d900fe91f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2021 17:39:21.8853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q1Us7wAeeHkehOz24i2N9ctbehi1GMSaGEqCPU+XqiHOf3Tn8Aop83BAJLkkURrHSFdtTBxLhS0jTOwRBLuYtc/HQvbKMR5zl9i2cz1Wmug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3607
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, gustavoars@kernel.org,
 mirq-linux@rere.qmqm.pl
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

On 16.04.2021 19:31, Mark Brown wrote:
> On Fri, Apr 16, 2021 at 04:03:05PM +0000, Codrin.Ciubotariu@microchip.com=
 wrote:
>=20
>> Thank you for the links! So basically the machine driver disappears and
>> all the components will be visible in user-space.
>=20
> Not entirely - you still need something to say how they're wired
> together but it'll be a *lot* simpler for anything that currently used
> DPCM.

Right, device-tree/acpi wiring is not enough...

>=20
>> If there is a list with the 'steps' or tasks to achieve this? I can try
>> to pitch in.
>=20
> Not really written down that I can think of.  I think the next steps
> that I can think of right now are unfortunately bigger and harder ones,
> mainly working out a way to represent digital configuration as a graph
> that can be attached to/run in parallel with DAPM other people might
> have some better ideas though.  Sorry, I appreciate that this isn't
> super helpful :/
>=20

I think I have good picture, a more robust card->dai_link, not with just=20
FEs and BEs ... I will try to monitor the alsa list more, see what other=20
people are working on. Thank you for your time!

Best regards,
Codrin
