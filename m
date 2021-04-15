Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8068F361091
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 18:57:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C01F1673;
	Thu, 15 Apr 2021 18:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C01F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618505867;
	bh=A32Js0gCqFW4PiI+H8yKxshyz5VRTryHUnJx18JT5FY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mDfm8ierJRpp/BXstPq49D6CkrIMwsFu5I8FSBkupHfSrWHc4oOVwBQcmEKyei3o/
	 m2/HTX6KbGnYL3/Fy/ZXLk0kU1kcNmTXI/Au3uKoSvX7WJnwZRdLKlfNBhYkbyo/7Z
	 MqZyWtyR4NaeS1OFA6fq4N8rJDl751v7bIIaNtZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C994F8022D;
	Thu, 15 Apr 2021 18:56:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29666F8022B; Thu, 15 Apr 2021 18:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C58AF800FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 18:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C58AF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="IQs7FrAx"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="Cu5jpUo8"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618505771; x=1650041771;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=A32Js0gCqFW4PiI+H8yKxshyz5VRTryHUnJx18JT5FY=;
 b=IQs7FrAxjDdtAmJVlcbQrV77vdIEgzoeoUacmd7rHweYR1b6yeVRXPwv
 uLRXk/WmoensF2+Uh0G309Z4MhwHdcojTFWUp1R/aDnmWbi32dv/pNIq7
 q4RS0LzpdWH6Oh4suJ8Pg4PLhykq6on175TJAZZdWtuyQH7j1+Wow/M9O
 2O53W/fvqzyaq5Ho2hkeUhgeMBVogEqvwOnv6UHBAfbJ7xz4poQnWi21p
 aXoFJjhrB/rG1/hipL2kqmugccvBF/1j6VSdbE4+vvoGz0mdHbJuqMKie
 Xa3sDqVKFnfYl2fodwnbl6u/eA5MMYc0PHhUSfNazpuownnSl6vPFR8Rt A==;
IronPort-SDR: IVmIYstuXXE0aZqOIxA98PCpMxri+lk/x966R14nr2Qkm+3QT0BAllh4eDsTiIE/oye49hFIC+
 CM8RA7LeT4SvPO8KDHLEXTJr4gBZ58uCoASzRVfBP/ll6QPx8Uq9E9PSuIJTc3JVDynqBp5szb
 5mgjqO+HqZTx0hmzzNAr8xVumJ1MjKoYXK++7XlZ6kuR+9YkqkKGSmU6ELHAry3tzql7DzLN2H
 YH2rebHTNx6a5OIGyVSt8kLYAAaA3Q8vydqJzWFQ0G8wswOodFOnxIe/nlDtsDBlBqZuI70yZK
 b6s=
X-IronPort-AV: E=Sophos;i="5.82,225,1613458800"; d="scan'208";a="117171962"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2021 09:56:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Apr 2021 09:56:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Thu, 15 Apr 2021 09:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6i2eTo3lEFAndkIKWLA/zeCxw83psAg3JjA5rJRQZoVXm+Vch4MWmfzcNvET5R5ds89E5/Bir7sB2JfPWt3H0+ldtJQeMq7AH+hhbATc+RZ5ipzzcafRkhUTPvNBd0Gs1/ztT4WgPV5UnICy5fq+DwMZMtcg6S7z6EYQ+MzgGsauIjARUXSdgPSWnit1Ig83In1F06lvtpb/Bq/576oFQtGMRrJlfvGONWXLkv8qSRqpsSVLLxjG2hqMvr3Po1UmPyz5BzgUn2O0iiUTYTtFZrEPPssYilqf9WImCAUwDELQuSO/Pd5BZ2hhww3qlQMvVTFfCegk8Ff7bFR6c3O5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHtdMbhqVcdoMX0myPWaYPK8sDD8BKth7KK7ixJ6WyY=;
 b=ZNRFT0WliztEDWpbyCcFcQ54sXsme+zf3e+MboRU8wa/EZsUhbxjUJ2fcMLd1GZZJgNaCsuPxjXwgHSrwWRA1JopHoipivS/lb4lzdQTUkOFFuFjTvtDIjfZ4mQ37wU0GF9WO2H4QkJL+1dRijqDDkpoZUeleJst53h2e1TmuCgDtuoFstO+XEamOPtuDBZwIokyzO8yM3l48YmtiuxDS1xWXfCJyzwCBoZPPAvt9hZ2joHYBlx2MlLq2z8vFDKhpBm0WI9qg01jK7M53Ky0VCvW2lbIXoUwNtqm5aSuJqluhPm2k8s+WEPegwJyGaUWGGdD7/rcwkOUHzUOv64NtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHtdMbhqVcdoMX0myPWaYPK8sDD8BKth7KK7ixJ6WyY=;
 b=Cu5jpUo8xtVukvy+fuQqHmu7gBaCdIj4FFGJYM0Yj430Hl1UBUACHsCe1c+AgfdNG/tL0AtBKBjfv/K8ViuTN4YWN/hV+lfXCGHR2JFlrHOB0vfvek2Q2HRFPO638LaBGYz99jjmx0DDQiodTPjYDWoh2YCaQbUedMCKCzcqcl8=
Received: from BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 by SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Thu, 15 Apr
 2021 16:56:00 +0000
Received: from BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0]) by BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0%4]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 16:56:00 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Thread-Topic: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Thread-Index: AQHXH9nLKm9Vc1LsR0iPwMHUtMwvV6qRfMkAgAAiRQCAIp5ogIABqJCAgAAKsYA=
Date: Thu, 15 Apr 2021 16:56:00 +0000
Message-ID: <1aff49d4-5691-67cb-3fe7-979d476f1edb@microchip.com>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <a0c862ec-44ba-52e0-551c-0347166ac4e9@perex.cz>
 <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
 <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
 <20210415161743.GH5514@sirena.org.uk>
In-Reply-To: <20210415161743.GH5514@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [2a02:2f0f:910b:600:4f16:bca4:3fa6:2519]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27dee205-85b1-4a40-232e-08d9002f58f4
x-ms-traffictypediagnostic: SJ0PR11MB5005:
x-microsoft-antispam-prvs: <SJ0PR11MB500546D14AE93BEF914AFDFBE74D9@SJ0PR11MB5005.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 05e6ELmyNS737EgQ5Hfhiukc+nDtoavyCwH2Oz3TnuA10uCpG4h2yHNogZz2g3fhwCxRnj0cja8g3Vmk4irERuK8vRVjURpRe6Sf+sj2aNw6hSFaH5AtEYREoJmRj6gjd70vOJwr7Af42Q9H5//JU0Ujv9EfiQuN7I8Iqj7uDStOYn7q6IMBOz94fNP07zOPYzTO74uk++N6k+181cR6/EDSdj2BBBErcXm8CIyo1N3rMwLT7k4feZizNo1+numH0cWrgGP509sighBy8Cg/SYCcZtcDlLLEHLKQWXpepX6kZE1Jd11yk7OM287n+rDmkXyGMWkUFmVOVcTTlBJvqPBxbX1X6LqT1ESUcudei4m4vOoLJ5XF/7gSF4Xl9IUXZ0soOfqWvRmW4JUU2BGM8imwQelmT1/EARy3gI2L7LYPcG/BXnz03meK23QB20h2In9WndUsvpoj0bnB1j3FoCnQcJh0Z7xB/K5ef222JC0t4MiS+U66woFKGNMY5BWAHDguj8CJ6apB4GhyWIZ5hBNbhRRfAB/fM0CBT9j4upv2UoliFhYzZ+uHAxC36xdMUnoVZMNhGjwnzX7j4Dj/7EiPv/IGo7MjCJVJuvtdz84aECGdwKZgZG0zo09zi6KnpUuIZJqGifPC1FuhWp91Uc6i9mwIJea9HiWCqDbM3qP2QoIwqFeequJm33IZLxVb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(346002)(136003)(366004)(396003)(91956017)(122000001)(6512007)(38100700002)(53546011)(66946007)(4326008)(2616005)(31686004)(66476007)(36756003)(66446008)(5660300002)(316002)(64756008)(66556008)(76116006)(54906003)(6916009)(71200400001)(6506007)(8936002)(8676002)(31696002)(6486002)(86362001)(186003)(2906002)(478600001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?zRQEp1o+mKl2qEIW0noqFUkhAbxF3sds29egbdfN7WW3f3ZjbnhGrzjN?=
 =?Windows-1252?Q?xZxLBTM5ydKU7eWKQHFhGg6tgoaXO1v2uCFIKMBy4e6p3+C5qGKwm6+E?=
 =?Windows-1252?Q?DVCU74NLypWMD49u/e3zsGiKT3g50VI0dtTI+UMnlm7qRyao3AWRwjhk?=
 =?Windows-1252?Q?G7xwP9gu5j66YaAXFgTlRzItNDN3NbjzdY2NWH7JDE6A2ts3roSF4Mhc?=
 =?Windows-1252?Q?qRoEeoDjRr3urXrHK8UucR9jYUgdKS4g0St+uY84DHAPOX0pYrODZd89?=
 =?Windows-1252?Q?KL2cwpBNjVM0qcVuYwKAlMEXyAB431sc0O9dSouvMwM1klniZ1spBF4g?=
 =?Windows-1252?Q?ip07bvYJz7UcZIyAOH1H9wUqYvxEmvMWXVuX48pWMDdXBXYN2nkt96sK?=
 =?Windows-1252?Q?jpXses3fU99jZkKX1p6y9cXuHCJo1cT9tWEA+Vhyq0Ix567LtApfIFSv?=
 =?Windows-1252?Q?rC3VRDWxXXILgWbUowvr80X3fGTJypmZn/FSj785/rzOzKh/2v09IoTd?=
 =?Windows-1252?Q?Eo8Vdonp+3fmJ3byhPmy7SDyDsp0UgrNNquw+/0jhCrZJSuGmDZXk7fe?=
 =?Windows-1252?Q?vaVBoMsjHbgPTiA8QkU/DhJ82MWj8JDTMNKMbBbvuwZuatgsIffD1yhy?=
 =?Windows-1252?Q?0wJ8uAdugwyiYd8AC2C2onZaJyyOLjK0i298zwkzyaQoBOStOgaBsI76?=
 =?Windows-1252?Q?8mT5ioN6NttiBEZ4OO9a6TgX3BCc99bdF3D8m0gcbJdlo1DMpsRkp/0I?=
 =?Windows-1252?Q?69J5PS2Smu5HWQNyMH/qRSA1x30IUhxOgsN2jzmu/x41LNEcYA7KajZT?=
 =?Windows-1252?Q?iFZqtyQ4ZNG1M+xT4kVttliYsQUMOt1XBYtWTsyWUxAq86em6S/W+DR9?=
 =?Windows-1252?Q?mmqoMKpCKIIZNBwo9xJO6DnSJHJUiIUoyl7lGMoM64ZSx6l2Veok51ca?=
 =?Windows-1252?Q?f8ANiAy2Q+JrNHAElQMI/w2rclB5GYKf/KKcOGM9zBHDhTJyQqVRz9Lj?=
 =?Windows-1252?Q?cBu+ctX4ppWK6FS8Ot/sqhQhWT1ffYJnYw+pMrNeuejtw4jTQjluvkuF?=
 =?Windows-1252?Q?nSc2EFjblzzFXm2NLZav5VooltfQNx1442pePVeSDuPg8dfB46G4cYJg?=
 =?Windows-1252?Q?fMKQ2PW+c5iUW88Zi9zE6TmqE4CVm4uheq4FbC9o6n2/HxdUd52O8iLw?=
 =?Windows-1252?Q?HDeHCHmJ3r3CEtwMBdFH/mj6r0zb2t6srmRd9FdV9ux13wn6uX4XtTAE?=
 =?Windows-1252?Q?xdbaNTEazsKAHWBR+JCIMdqvn5JU6bLfch1FFHHJfj7BTzDDtXHubipr?=
 =?Windows-1252?Q?opAyOqY3wgMfOgNsKbW2PNna2BStX11Mw6+Lfe6YD0RRDhvPQ9DPAz+8?=
 =?Windows-1252?Q?7lXftMd0HKL3u5hZfkN+V03LSrMrKkSoCS/XCxI9Ke6ff6xvVeRRd999?=
 =?Windows-1252?Q?Dx6BcQrTtCyYT28wWnmPqCj027U3PvzHu2Gh27N9YwxJqErURm1CD9J+?=
 =?Windows-1252?Q?mg3Ksvel?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <6C7D61BFBEC8AE43A4DAB978F7660E03@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27dee205-85b1-4a40-232e-08d9002f58f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 16:56:00.4334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EcZMzDMCrXJmkk7RPU7mmVQf0lweeFVCFXLgtCVAFOOf14qRR/XBKItXD0IWNE5235ICD+mJgDgYHSctD7xIBTwfJDV/zaGmHgcV00Gcq6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
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

On 15.04.2021 19:17, Mark Brown wrote:
> On Wed, Apr 14, 2021 at 02:58:10PM +0000, Codrin.Ciubotariu@microchip.com=
 wrote:
>=20
>> How about using a different API for ASoC only, since that's the place of
>> DPCM. Only drivers that do not involve DSPs would have to to be changed
>> to call the new snd_pcm_hw_rule_add() variant.
>> Another solution would be to have a different snd_soc_pcm_runtime for BE
>> interfaces (with a new hw_constraints member of course). What do you thi=
nk?
>=20
> I'm really not convinced we want to continue to pile stuff on top of
> DPCM, it is just fundamentally not up to modelling what modern systems
> are able to do - it's already making things more fragile than they
> should be and more special cases seems like it's going to end up making
> that worse.  That said I've not seen the code but...
>=20

Are there any plans for refactoring DPCM? any ideas ongoing? I also have=20
some changes for PCM dmaengine, in the same 'style', similar to what I=20
sent some time ago...
I can adjust to different ideas, if there are any, but, for a start, can=20
anyone confirm that the problem I am trying to fix is real?

Best regards,
Codrin
