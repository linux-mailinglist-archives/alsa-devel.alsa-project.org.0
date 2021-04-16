Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97322362509
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:05:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3049516BB;
	Fri, 16 Apr 2021 18:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3049516BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618589135;
	bh=mWAYid73+N93DF0iw3sGd17Peo5ukZaMU106lDqoSKk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QrG5m6yu3+RKG5XSaGudiVjXE8MFvjH467gAmZw7d9JTbjsif7UI+eup3rxcXFnUG
	 w1a/YGOJ54lzQ0yo3bM2r5d2nnA0osbai/YWEwS1M8BuEZuSMX+vy0g0iKBhLqIO22
	 1ose/LEBYiCCMp2aVf7qPohEoegmXhDmE9plYxf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 903A5F80430;
	Fri, 16 Apr 2021 18:03:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4011F80430; Fri, 16 Apr 2021 18:03:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PDS_BAD_THREAD_QP_64,PDS_SHORTFWD_URISHRT_QP,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE73BF80425
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE73BF80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="ci3J5w/F"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="ripV/lKU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618589004; x=1650125004;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mWAYid73+N93DF0iw3sGd17Peo5ukZaMU106lDqoSKk=;
 b=ci3J5w/FeZ/yNMPdpC+hgzW8J+AYdPfP6jTefw2o7Ih8FRATxV0pUOzK
 pkzngJF/U188TPRZgZZ2XwYRmD2OCEx7uVLE5jdGXpFpwUQc6xostBh+5
 thT9IgkCabCMMTuJRtL20ElnPYtI5eie5OVzz8dsnA52vXBdEs2mYWEsu
 6ZypewDarb6lfOSDx+GwVVue6V27WHcb/0LGtRxPHEMrK2p9hJ7gfvZzD
 /YnXdMjjWONattVwGjoEfypcSkZV8vBODLOiKrvU5mERpvpHqNQIzoR2h
 jYA4J7HFDuylDHG03uzr8+/qXbrTh+iPlL/K/wzDrzLNw0o9wWWbi0Hu1 A==;
IronPort-SDR: ELMeQeZEpLdvEvhBsNZc38Gi5flPPxiWq9TleHw5dpnAmw6rdt/XDhdJxbz3VSJtoeoGjy5iNR
 q04L+wpeda+Z1T3+LA7ez+RrfKM+7tfY0huHiPCG6/9brTI5bHdvhGY/1RaoGEeMDA0BIEhAYs
 ymLVMnxREYVZSEu0qCLZYASQqojuK2sQ6i0DGNPo8LQ6pG168c6ZN16K3smtNO/wrLwko7oVWv
 EnzLWDHTFDZilfYRqZVoPOKjaXToT1LxP+e+v6WZ+28n+4cguJpybI5AnRrJJ1xcBrkYTaJ2m+
 4uU=
X-IronPort-AV: E=Sophos;i="5.82,226,1613458800"; d="scan'208";a="123382931"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Apr 2021 09:03:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Apr 2021 09:03:08 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Fri, 16 Apr 2021 09:03:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dt2k0KOgvP3rNCEAvnmaNlOKZSE6TVNbjh9OKfBll6ENlQ1yo86ZCw2k74TSoZ/TG3Bo+7G+ZI9ZcZL5Yw/y6ejPoFwX3VcpcriCZxzuDvbR3jswEDbSrRzNDWWqnVsDwFufxGh2ss6SLQqKMelKpURaR3rwlGFj8XhJeC2NOzUHsK+aqgaaJG6OJa/+I8JHnjr7xRfsp1Q/KeJiHGzfzHMx7quuvwtWLu21YpQ4EdV53iq+LCEd4Lzu/WxVBvLvQIPUkqEtmpX3qFeqXhNALEiKHpJsjNasn2PmxMeFj/VYZIYsToR7AWgPT6yXDDo9eob4/n/X9hG54AA2+jhFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyVmEDsID5xJ+fkSErrcGqvrtXR/u1JpLX+4+f8KGzs=;
 b=IE4zS6YvWoRhfNS96bvBt91q65XR6Mfr/kt9anOexbmsrvcOxJv7wtNPeK0amKElK9uh9RdDuOKSl3VeaDMKyJADyM+9tSh7pdhF5hhzG/wbvYL27euDIq3dPQxoP45mLD4DcQ2cfC9CKHfNOCAaNB4hHY6d+6T6CUtpPRShmEsf1s+N3znq7RflPcICW3HPbUAJvqOVtC7aFd3Ap3AnlcDgeu4HCRzjVb79AVkAao6pvjvCCglAntnfrWomZUVtK4ro+hYQCj00lDrk9mepbrf4Xe90qZ5qVcHAkaNZziIEZJB5+oUklysTmNsZoFodBgU7U2U+3mODeH4XOLqekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyVmEDsID5xJ+fkSErrcGqvrtXR/u1JpLX+4+f8KGzs=;
 b=ripV/lKU1SBsQ3/oNZ9yBQbVydXPZ7jK8uwE/aWuOtNGqzT0NGk6bx4qjwPlh1CFqhutLbqsHAxB3vigTOu3B0ODhexdXbqPHho4RjE+e9aVs51CxIhaNf5+yxFYHEfYRHeA+OUa2YxQfEF5FlSJ5L3TFlXhH7sf4s350Ukkjkg=
Received: from BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 by BYAPR11MB3672.namprd11.prod.outlook.com (2603:10b6:a03:fa::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 16:03:06 +0000
Received: from BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0]) by BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0%4]) with mapi id 15.20.4020.023; Fri, 16 Apr 2021
 16:03:05 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Thread-Topic: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Thread-Index: AQHXH9nLKm9Vc1LsR0iPwMHUtMwvV6qRfMkAgAAiRQCAIp5ogIABqJCAgAAKsYCAAAhcAIABezGA
Date: Fri, 16 Apr 2021 16:03:05 +0000
Message-ID: <ad5d556b-601f-c6f6-347e-86a235237c02@microchip.com>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <a0c862ec-44ba-52e0-551c-0347166ac4e9@perex.cz>
 <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
 <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
 <20210415161743.GH5514@sirena.org.uk>
 <1aff49d4-5691-67cb-3fe7-979d476f1edb@microchip.com>
 <20210415172554.GI5514@sirena.org.uk>
In-Reply-To: <20210415172554.GI5514@sirena.org.uk>
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
x-ms-office365-filtering-correlation-id: c9c99203-a2de-40a0-10bd-08d900f11f24
x-ms-traffictypediagnostic: BYAPR11MB3672:
x-microsoft-antispam-prvs: <BYAPR11MB36724B49F7FE0726324DECC1E74C9@BYAPR11MB3672.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lh4HPxt4mBPIZTRu3xbnVjVkECVIzVsQg9ZABbq69TQNDu79b/LE8/GvclDEBRLAQvW8YNeXnxIsTZF9jwSjI0lHwaGPAVdzOBmwkK+31ruqYlZDsJtgQHDofpxv2XOuOQWG65vp+9nua6zfEBoPDNvzkp1xFjDbnnStTgweV1DkIFVyBoj4NA5iStqT5NyyySFl9vPwRg7XbYIbhhyo/uNhelcd3/QZxS8PyD/Q3Z+nc9zGfycRM6X7Dpgqcv/0cdHKXuvfFRJAWvHlDyRwwmwb+nN7YALmnpW4mkzdIzS/hI4TE23gv/BsOBX1ftbbmnfOveDg4WWPCKSjcjVxMExBiyNSgBUXrUn4c32GKe2HD1/yDGeMI4zvFlakfMgTiTT8v8upNlV8c7Ko2+76s6BrLt5R1/YfxPjiB6PqWeC5lOZOc4/UooZ8Bj8WUPpP9UyDuTx+izY/gWV2I5T3GzvE61lksDhbr2O27ly4+KXKk8kIAKkOj6gk56x9YCEy/moJkXh9T7pczrgF0DPr8kzGsZqVvCtnW6oU6cwQITrt6OaFpHwMiOg5/MPStqzmNr27QYEnOU99cfnq+IQnjeCbOxHcULIqNFo2UkWWcuAcBxrHNCvEue6bzJCO0gBnD26BS6EKJ4/ucfz1JbDwDWsrpJxOIcNlEnOCGHh0oe+EPj2TQqMIq6JisKTZy2FBhXrWls0xGmwdMtgRJwoxF+8maOH89cXoAA4ZgfIk0Te3w0Igx7yqznVDHKU0e5tw7I9/QMNpNrabpKmTqzaP4w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(39860400002)(346002)(136003)(8936002)(4326008)(966005)(31686004)(71200400001)(31696002)(8676002)(54906003)(5660300002)(86362001)(316002)(6512007)(6916009)(2906002)(122000001)(6486002)(91956017)(38100700002)(76116006)(36756003)(64756008)(66556008)(66476007)(478600001)(66446008)(2616005)(66946007)(53546011)(83380400001)(6506007)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?kJEOvRa5ykEFTEW9AQFouPp/XG/lVbgrqZ8oG1C9/HPxmDBLPUXn7kNK?=
 =?Windows-1252?Q?vRh1+3Rdt+1wjwx5f+jy6huIr0ReJGzQWIhC+4KRGswfH/gyGoo+gdpu?=
 =?Windows-1252?Q?tL+/vfW9UYeBYFKPr955BfXK4gVcfXYsPq67bgtH1iRpkCnbexMzBGfx?=
 =?Windows-1252?Q?dz2okaOmuXJrfytWBTrhMPzUmYtIFGvcJQtHnUTSQ/nuaElzI/v6du75?=
 =?Windows-1252?Q?jtj4X0lD0bBjqta8cRe2gENY/upultLO3Czi/dshQ3G+ZReGTdhaWmuK?=
 =?Windows-1252?Q?pGAy+eiEOVH/ZmZrUXmEXEbRHuXfKsgcnpFdxvYnsltGcG7zuuBENP15?=
 =?Windows-1252?Q?AyN3bNXhmejkn46CciuYXbQlH/O/thV6mPe1p/p4OTxI/xrz04wA2yjy?=
 =?Windows-1252?Q?RJvGGrHNSd/UAVk6Xq16liSKeiBMixZMHVHg9yU6EXB0lRqyLeE5JFRg?=
 =?Windows-1252?Q?KZOMMGv2g8mtu118S3SjdOT+DkreXU+EcvolAmf1LGOuzrbU/Ahjg4f6?=
 =?Windows-1252?Q?/9UKDfLYkSxgrj48MFjcoJqtd4HWgP2eMOCeOrEhZP5ROSQLLPaGBkku?=
 =?Windows-1252?Q?zF1T75mJ1F0oHcxfc4cz4FwzOvJFhpdU3Gz0a7Fj8abo+jALk/q9K5HE?=
 =?Windows-1252?Q?mI2qBGkWnDZKO9/6S2Su11D1f8fvaUyJ5bhH4r2g7O84M1zAM+yWFBjP?=
 =?Windows-1252?Q?z+VF1oMn1MYcK7FnsnbhBnx7z0S5JBkR8a1563DgOWqg2wV0w1b9YO9/?=
 =?Windows-1252?Q?SBHPcLj9L9NudQQBmyLgyclknGQ2tYuD63L+yOgkw+f+/Tc1ZII9uh7O?=
 =?Windows-1252?Q?6GG52gPzDRCi33n7FqpQf4jtMk0gCDZ0l9xzPXm06fgSFVJKstb7vQ8o?=
 =?Windows-1252?Q?g4CYMTJhWNpE6Ei9MJLLwoBn8oBldWKQGtpkJ/KyrzMNK3Bxy/P5hh/8?=
 =?Windows-1252?Q?hOir8dfaFXW+2Tjf7U/C31WSNCH3CBqeJtA57ZGFVikVqjgKZ75tLPKD?=
 =?Windows-1252?Q?3BaACsgx6mA84l37rK6/3uB9+1jgLTPRYUZ8ez5h/nnkiLnX6J6gyp2u?=
 =?Windows-1252?Q?1p40E7A7+71gbGeIKaC5DrxB5IuJC7/BuQNbVWDbZF2ziGOx3oXL/fwh?=
 =?Windows-1252?Q?arfuIbxah+4/Xj6yv9lUfBDl7cKJVD3Jgiujfc1+ChOsAQ//JSdniQn5?=
 =?Windows-1252?Q?DppF96bzt8PVtRvAKVfNIC3lXjmEE94UGFDWLtXKHOBhaifU6B+Nfjk2?=
 =?Windows-1252?Q?9jIyhwZKVSJx2/sPxWZ+YOqHXVn48S1jfvWRx7zmYYqfIjgYiFBNDuwb?=
 =?Windows-1252?Q?liSw2xuFHT/vFMcQF+K496rUSiMP/Fxu6TuQCgPPp8G7JT57sym7bPy0?=
 =?Windows-1252?Q?FBuY8UrB6fBNnpMb4bSfQxBPpuzd1wOa+wArpFQEEgbCalXK11lBhGcN?=
 =?Windows-1252?Q?cFbpyVYzk/U8lVy0Y+BHXxE6khA9oaEd3tPOBuABkjHKcQ3cu6boWizC?=
 =?Windows-1252?Q?FwW887eH?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <58C86B62B110DE4B8453E4CEC38C9F4D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c99203-a2de-40a0-10bd-08d900f11f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2021 16:03:05.8541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FAmk7Zh9oDpI1zayThnM0LRGkBb9n/qOqCiR983j7dzpP0ZmIVhwvBIQtenncGb76TeXyBTtjsYuOlrrMm0q6Xsqcka97i+P0uxOoyByU1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3672
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

On 15.04.2021 20:25, Mark Brown wrote:
> On Thu, Apr 15, 2021 at 04:56:00PM +0000, Codrin.Ciubotariu@microchip.com=
 wrote:
>=20
>> Are there any plans for refactoring DPCM? any ideas ongoing? I also have
>> some changes for PCM dmaengine, in the same 'style', similar to what I
>> sent some time ago...
>> I can adjust to different ideas, if there are any, but, for a start, can
>> anyone confirm that the problem I am trying to fix is real?
>=20
> Lars-Peter's presentation from ELC in 2016 (!) is probably the clearest
> summary of the ideas:
>=20
>     https://elinux.org/images/e/e7/Audio_on_Linux.pdf
>     https://youtu.be/6oQF2TzCYtQ
>=20
> Essentially the idea is to represent everything, including the DSPs, as
> ASoC components and be able to represent the digital links between
> components in the DAPM graph in the same way we currently represent
> analogue links.  This means we need a way to propagate digital
> configuration along the DAPM graph (or a parallel, cross linked digital
> one).  Sadly I'm not really aware of anyone actively working on the
> actual conversion at the minute, Morimoto-san has done a lot of great
> preparatory work to make everything a component which makes the whole
> thing more tractable.
>=20

Thank you for the links! So basically the machine driver disappears and=20
all the components will be visible in user-space.
If there is a list with the 'steps' or tasks to achieve this? I can try=20
to pitch in.

Best regards,
Codrin
