Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F67A18FF
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F107B7F8;
	Fri, 15 Sep 2023 10:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F107B7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694767016;
	bh=MxjDxGG5gJeiajD+vJjT7gXeoCP9nlOM4yIFs5+J3PY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FHBe0SYg6EggYrkAshGsNKayVlmqTDtu9ZXjXogTly2SKYDTaB/szISffc8Kuk6Tv
	 whPbr7ZnuRQVl8Tm9L1X+wAobo/O8IQ0N5dDxds2+7YehDC6u3sT7CEIWkYsEhkazT
	 NV95LgqNRJ1mbWGN84eREQbKj6U0eJFjlIj7tFfQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C06EF80552; Fri, 15 Sep 2023 10:35:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B84F80246;
	Fri, 15 Sep 2023 10:35:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59711F80425; Fri, 15 Sep 2023 01:46:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA529F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 01:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA529F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=calian.com header.i=@calian.com header.a=rsa-sha256
 header.s=selector2 header.b=n6tNIfGc;
	dkim=pass (2048-bit key,
 unprotected) header.d=calian.com header.i=@calian.com header.a=rsa-sha256
 header.s=selector1 header.b=l4rEMvIa
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
	by mx0c-0054df01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38EKZ4Fv024603;
	Thu, 14 Sep 2023 19:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=selector2; bh=MxjDxGG5gJeiajD+vJjT7gXeoCP9nlOM4yIFs5+J3PY=; b=
	n6tNIfGcNMivrvYNBDc3rH0hjVJuCLw0bFaYM4aDytI0KrqNvqHrD42Bp8RByNeu
	ZAruPIY/SOdTqCcsx12vk79N7/IiDCHDm0A+FyHMVRv/aVqk1SAUm3MDdZUqbLLl
	2BExa0PbiMGLdv3z+fDXYtCua+SDG/19OkJ1Dzx2G1cQn9yV6ucBi6mofoGVKHTR
	sM29s61ipS8U1KBUPZxZDpu7i04DVRFj2UfOHMBKlmg3vr9hP8cIPtgEGdikbd75
	Z4dbZAkfe17TWBEC5Ft6YHPKQl7uu3rLirMmnOESSxa3ER1/3q0UShqHlgjGb68n
	CJwDGRdL41s7SryVY2KwJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=selector1; bh=MxjDxGG5gJeiajD+vJjT7gXeoCP9nlOM4yIFs5+J3PY=; b=
	l4rEMvIaFzf6fyaaaYD47HG6QCtjPlWEw3V3Pe4Gc2CUZn4b4uKZf5LF1q/rojdv
	F82vqhDZ1GbwxZrke5coe9blsKFFDWMKzwS40tD1bEGW32viYqK1SYlTPAwUfnY9
	xZ9XpALpYpdrS8apeq0iW2ASKQGXvb760FCcwT/ch1bWSsl0UTW9QNXULTnJOH06
	Kq3mWKIY95QxdMZrvNeTNl15jUTnz7hIrrzEm4uh1drO96YBnEdWc3qLo1DWjrR9
	k/iPoCTI09TOc/JXGVcPckJsCofrs/iFu3WWI0QLN8ftubQJUrKqVkuM9fg1TCxt
	hP7N03as4KNf+BZrd3AeEQ==
Received: from can01-yt3-obe.outbound.protection.outlook.com
 (mail-yt3can01lp2172.outbound.protection.outlook.com [104.47.75.172])
	by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3t2ybea4ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 19:46:35 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9M/8bq0HoXhbWeXa+gIkzrcn0DQDOYRpXYExneljMNPhzqcAYZs9PF6WBh+pcjrFT4D55fCjV6mZ05lNZjW8xjLEIF5uD9UOVp7Tl5I/MVCgIu/uFMar3hkR9HAP5oVCtN4O/a2rxbcQCOjVseX/BS4yFtZuTkNpmYytCAzWMpwyVLxlfbeopgDmWRFEI3Ln3qMqp1RURFJKG1h5U0Iwjaxb5ftDURHRPYJgQGJHxpKKX6VatqxzAyhNh678Z3I9IrPkzy01Y+114ivy33AAeJ8tuDu4l3VZm+iVyeC/Mvg0HwPI/4GT59ILZxriQtsKjxXOvobeoyoVUOMnWy76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxjDxGG5gJeiajD+vJjT7gXeoCP9nlOM4yIFs5+J3PY=;
 b=lfaB5gFDxKJNo/wNVXGLH9kbFxcj7tqmjOxX5xmDT6r5ADWMv3/8E+YOR4jGFKLh9zp0Uo91dXtjLd1Pf8rZeVHH1Twg89DcDdIcD7xcSNgw2ucaocIe1WPAEdS3PR6cJ2vC2sdEHF6T0BgOgtRGRTS/z03wr9l+nKatGyiB+Z+c4FFkdT051e5L0rSemB3GfCybTCC4qH0AZkM7jAx+Kvk3KfodqGkPnEqB+o0AMU8Ccy3/RKLk4HEx9lm1+p6LKcm5AuzG3eYcQ55KWEqVV3y8aFSM6uG7GO79QAsXJ4uoNA3RS8/EFaokmf7fEBHIfkw4wyCxAvsnNsNU1od8yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YT3PR01MB6391.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Thu, 14 Sep
 2023 23:46:33 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::cde8:7c8d:8d0a:8aec]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::cde8:7c8d:8d0a:8aec%3]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 23:46:33 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>
CC: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: simple-card-utils: fixup simple_util_startup()
 error handling
Thread-Topic: [PATCH] ASoC: simple-card-utils: fixup simple_util_startup()
 error handling
Thread-Index: AQHZ52D64XbaIQVTK0eJ5wa+1eYf2bAa/J+A
Date: Thu, 14 Sep 2023 23:46:33 +0000
Message-ID: <5f50accc90677b323aa4a6bb36a6b7a71dc73912.camel@calian.com>
References: <87zg1opcwt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zg1opcwt.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YT3PR01MB6391:EE_
x-ms-office365-filtering-correlation-id: 2898da6c-b3f8-4931-f8d1-08dbb57cd3d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bvyGwfM8pjMuFKBBGVD1O63D3O+ohbToz+oywP8PAbatjwwCDSsXda4zvEI5r+WwmoGxRV49wW1919S4J706/y0ktUh838ED5sPjRnFGxbY28ilF4+ICjRbVJVJCd7zfLz887zi0ZYKQZ4JLFu3nIyXLMekZzSZn3I0NDjhVphwUS6R8+E+iFJC5vKHZqjcIIb6MIGMrY3Twz8VM1gBch7CdLu9NLXjzM5R7BPYGfnHWq4LmGuWzqIxdLWbEVpLZ0HZOK2MnscC1CJRaaGwZ40bePP3p26JyUS1+OZk1j9ZL4WHdVvcxPauDHNfDXk6KhA8aWMa6hcjHJiMJdmqBji8L4H5X+8K+HV6JU5IpVGMHaJ2GK9thwwaN24eOv+uTR/LJ0vz2Vr5Zc9UHBpkES5tj8oJv5ufnejSsrYsnJhwCBnP5DU36rEqdE8J7fUHjke3GGVvsbH4XLQ3h+NpIZCxBt8jdabm3lEF8MhcGGxxZNiHby5lQmwZc95qHxGqo+ZpnufRwHdpAuveVpDvDOwIbLSFRtHT4hvg7RBx7lKCf3+d0QbAZQm9D4CFJSEF50zqnGFaN3dCii5S27yqoY0boY/PGTw65He4YC/m1JRo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(136003)(366004)(376002)(186009)(1800799009)(451199024)(2906002)(41300700001)(5660300002)(316002)(54906003)(110136005)(66946007)(64756008)(66446008)(76116006)(66476007)(66556008)(44832011)(8936002)(4326008)(8676002)(36756003)(86362001)(122000001)(2616005)(478600001)(966005)(6486002)(6506007)(83380400001)(71200400001)(6512007)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QitIRTR0T1Z3Qk5Cazl4ZXR3SXJ2Y3VNMG5pN0dIUkJKV1J4MjI2VTA1Vmcr?=
 =?utf-8?B?SVRQclFPeUVrUThzK3gxYW5KYjVnc05QNzRCYXVXYXRGMW9VZCt5Z2dtZmFG?=
 =?utf-8?B?QTMxaFcybzZGMXVMNnRJay9FMWZQbk5JTzU5VkRtZGp5Q0xIMUFkZVpnUU1M?=
 =?utf-8?B?cUpKN3h3WXdzVTRRRFlpQ1ZuNmtsUG8ydlpTc2lsajhsZlhBM2ZRTnVyaEgz?=
 =?utf-8?B?YzNwL2FXUWt0MHFNS3J5bmQ1RnIvZUp2ZjY5ejJIOUJ4MEphU0ZWd1hyT0tl?=
 =?utf-8?B?VCtxdVZZN1FlWEZtMEVSaytsR2FCSTN3WGd0M3M0ZGdMWU10R2RqSzFCblh5?=
 =?utf-8?B?SmRLU2JxQ0doL2d2dzBnMXMzdmoxVE1PM3d0Q3pyZDdQcDR5bmxlV3czeVhB?=
 =?utf-8?B?cVJkSE5PRmFHTy8vSE9OVFMzZkUzdnd6TkMzaUd2UmpDWjljNHI4cWxvb2JU?=
 =?utf-8?B?enlZUWhWT1dKb0NhbFJ0UkZsLzQxampvM2pJckZlR21LRm1zZEcwVGdET09B?=
 =?utf-8?B?M3lHRHM1bWl5UjNyWHdwQUVIMzBTQzlGTmRmUEFZYnRGbnIwWWp2K0hjVVVa?=
 =?utf-8?B?OU1mcnNoUG0zbTBaTGxrLzc5TUpSeldjcnhIZjVKZENya0lKTGQ3dXpMeDlw?=
 =?utf-8?B?K3c0c3JRZVRKRGJPcjV6QkRaaExYMldtVGI5VktaVHNiSm9rM0pUVW1idWhr?=
 =?utf-8?B?U2xpY0VKVUJ1QVhVUDljQUtuN3g3VFFoaDl6QWVvRm9Fek9GS295aDdaVDdI?=
 =?utf-8?B?c3BoUTg3dXQzc09ZYm52QWkzUjY2Mnl2b0ltWVNoelVEZWhKNHdOMlRIUURs?=
 =?utf-8?B?MG9IOUVkQ3RtbEx6dGI4VEo0UGRoK2RKTjA2UWZ1cHdtNDhOeDg3SHJEbjRE?=
 =?utf-8?B?YnRISEtoU1NjQ0ppWWZ3dENxSFFNRi9sZWJ2SjJwUGo2UW83V09vM3hBMzlM?=
 =?utf-8?B?ZHZtVysybEltZnVRMmZ0TC82Y3pFK3d5QzNmZnZ1bWY3UlUvQmJTQnlKdEs0?=
 =?utf-8?B?REdWM2lSSWxDcStYWjZEZFhiTGpMUVlTL1dCNkxvRTNoNlJEdHcvZyttNm9D?=
 =?utf-8?B?TnFsMEdjMU5qUHNIYmR1cUhMVmY4cUJsWFJXaVpWWGFDaFhNaDZIRjBwREJC?=
 =?utf-8?B?QnVMVUJtQk9EQy90UW5LK1dPcGJKME5KcHoyUVYxVENTOXpFMURZTU1OVm5P?=
 =?utf-8?B?N0Q3UWdKRTltRllzaVZnbGpETVVPOXowQU15a0FTMUJadnB4R0hFZGNBT29J?=
 =?utf-8?B?TWRYd2VXdHhjRll4aDd2TTNLZGdOQjgyemhCUHZCRERsZEh5YkdxYUxEZnFj?=
 =?utf-8?B?SzhyR0VRUytwOXdmclFwNEdVbkM0N05NVlJvM3A5cXNvc205ZmFaaTcyM1lx?=
 =?utf-8?B?MllqRjR1aE9XQzgvSGJSbHJJcE1DTTBtdmw0MDRpcjFDa2F1L0ZMWStvdjRt?=
 =?utf-8?B?YWdldldpOHNXa1pCUTlaVEo2bmw2MGVJZExnMG1lWmhTRkViby9ZVWFkVHVN?=
 =?utf-8?B?ZlJ1dmlhQlpVbXVSRzlvSW1rVVBmTDFNRnBxWWtsdlQwTmVpVng5Y05OWG52?=
 =?utf-8?B?OHprYjM2OEZRWVBsMXZEODU5ZUtGRlAwQVN6U2hQRW5CR0NEa1dBZUpSNWl1?=
 =?utf-8?B?Wjd0bnZBREkrUUdpTG9PbXBKTDFVMzJpL01wTW9pMVpNcGdwYzlIeFBUTGd6?=
 =?utf-8?B?YnZyRitXak1hdUwrS054V042RWthUzg3ZmtmQ0JIVUlwQk55Z01nWnk5aXlE?=
 =?utf-8?B?VHBCRllxTmNaeXBkY1VqaFBmZ25aNmM3cExlODhscDNzTTJSWjdLOERYUW5l?=
 =?utf-8?B?QmN4KzBxQ0hLdWM0S2w3eGZ6YTZnVUIrcGFOeGl3UmVLUlAxV1NId1pqYjFx?=
 =?utf-8?B?bHdZV0xsYkRTQVNLWDJqMlJWUG9CQXFLMDhsMW5pTHNZOFdhSGRYRzkyd2tj?=
 =?utf-8?B?NXN0cHh3VEorckUyWWlQdkxCbkl3RVA3V0drVlMwblNzODRYUkZOOXg3TE13?=
 =?utf-8?B?Rkd6d25BVU53NWdFYnZ5ZGdic21sOUZ3UUNGaWxPeTFtVXlzTllCQUI0ellH?=
 =?utf-8?B?VDRSVE1jRnZJSzE2MkVxeXpUVU5mWVNYTWxXRTBlNzl0U1hGcTNiWnRBTzZn?=
 =?utf-8?B?eVpZd05sY1p4ZWhiSDVxSitLNDhqS241OS9DSThBa1RYT1B5dXVsQUN1cTJo?=
 =?utf-8?B?SUdaZkw2T3lyejJWNEZrN0NRaXVqOTVuT21aRmZaQWRYZ2Uwd2FlZU5zaEVm?=
 =?utf-8?B?L3dZeXNLenZtWXhCd0dxMTRoVmZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22B7B790ADB4AC40ADE290972FB90FD5@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1DI+LtI9FJuKP77Sv79aejlmh6F8xDpuBhBqedqeL1LlMBjyvh6vRWUehsAuyO+4z5uO+nSKS4N0JtGVDfE6XMnG4z1VAsczWhs/gsYDTM+cCVDEUGozaC3hP1+KeJig9NnAC3wmqEdTASaVfkixiirdI1PSSjHYp8Emvr+NqfLRldVoEe1thW+ziq+vHOr53wgOuF28buQXZ+IRu7sV4OIjXDhez8213PK4eEV7gmHlZUaJUoINvB2vjjSGjM0GHpQK2Ee/mBMRejm6enILmUb01qKCQn3Pj64B9J5UBuRshEl9lab9oNyYEpMGfCIjdLJYfayhHzBs7jY9W28l1z9f1ihLyj5KW6bBdI4G7M9I1P14+jx8lN5qC933kF4dVaKKbp+nV99UIim6MUooBn9JgCwcn7UO6jlLdJxfDi9guUPOfPnOlea2XqhJBiysLiuYVPvvP/JTCTy4y5GjEy9t5TH4RNzB6/cI0R8Gss/PyytiNcE/UQkFgIJsv4FHOmBWB8QUATDoo2tONxPgYS5io9z53ckVqXcWHAfW+xRT0XmLbalz2G0Mhxg13Adj9e0T/LBg+TJlPaphmL8VcgtnODbuSArzhat8GgEuE+gXNQvHFEwGMVXzwkQ17xE76K508P/F6JHNJFRl6BQZ6e2VcYOAUT3t853o5o1C5J0fZSwUL6ZK084zEvogdcVNlEBlJsnsQwhEu3nzC4lwpgSrxXmTZ/rituQ2nUQjJP8gTLJ7zc3qJExhK91lHxorcZyI01Dx/cbnZK3n2w50fTdBTRtiQyU329rODDT4G6y5qe8MyYir75p/I3uNGX54kaM1LxflpbmWPNhbRtLbWbYftsVNaSMdrbnWWsyyfwLdK5WHQES0AdHoZ7WXntin
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2898da6c-b3f8-4931-f8d1-08dbb57cd3d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 23:46:33.7194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 KNgbH6NpkWM5rd7vRDWjaRd0Rid2CPht94z5BBqzwb0wrxUKn4XrxZmyY+ute9nkrP51mP5z/r/a5H7cyCX9VWUuQRNe8dAgJ7YXRwHaH6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6391
X-Proofpoint-ORIG-GUID: GqKbM9NNIzGLrwTNiGtDyyf99fSzZAoj
X-Proofpoint-GUID: GqKbM9NNIzGLrwTNiGtDyyf99fSzZAoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_12,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Reason: orgsafe
X-MailFrom: robert.hancock@calian.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7PN2MVQIQU77SPRQFVBXNLVGGHV6GGXK
X-Message-ID-Hash: 7PN2MVQIQU77SPRQFVBXNLVGGHV6GGXK
X-Mailman-Approved-At: Fri, 15 Sep 2023 08:35:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PN2MVQIQU77SPRQFVBXNLVGGHV6GGXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCAyMDIzLTA5LTE0IGF0IDIzOjEyICswMDAwLCBLdW5pbm9yaSBNb3JpbW90byB3cm90
ZToKPiBJdCBzaG91bGQgdXNlICJnb3RvIiBpbnN0ZWFkIG9mICJyZXR1cm4iCj4gCj4gRml4ZXM6
IDVjYTJhYjQ1OTgxNyAoIkFTb0M6IHNpbXBsZS1jYXJkLXV0aWxzOiBBZGQgbmV3IHN5c3RlbS1j
bG9jay0KPiBmaXhlZCBmbGFnIikKPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
bGluYXJvLm9yZz4KPiBDbG9zZXM6Cj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDkxNDEyMDUuSVRaZURKeFYtbGtwQGludGVsLmNv
bS9fXzshIUlPR29zMGshaHNzTjBrT0ZPVmh5WE9XRGxwQ1ctb0p0TWJMbWY5TnNocmE1UmF3Y1Yy
R2k4ZXBfR1U0NmduZUZmMkZ0bDhoOGNLS0UxQ3JUSHQxaTNIVnU1bzlORS13QUFOM2JTaFEkCj4g
U2lnbmVkLW9mZi1ieTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJl
bmVzYXMuY29tPgo+IC0tLQo+IEkgaGF2ZSBtZW50aW9uZWQgdGhhdCBkaWZmZXJlbnQgcG9pbnQg
d2hlbiByZXBseSwKPiBidXQgRGFuJ3MgcmVwb3J0IHdhcyBjb3JyZWN0Lgo+IAo+IMKgc291bmQv
c29jL2dlbmVyaWMvc2ltcGxlLWNhcmQtdXRpbHMuYyB8IDIgKy0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9z
b2MvZ2VuZXJpYy9zaW1wbGUtY2FyZC11dGlscy5jCj4gYi9zb3VuZC9zb2MvZ2VuZXJpYy9zaW1w
bGUtY2FyZC11dGlscy5jCj4gaW5kZXggMzZjZTNhNDM0M2Y5Li4zNDhmZTZmOGE1MzcgMTAwNjQ0
Cj4gLS0tIGEvc291bmQvc29jL2dlbmVyaWMvc2ltcGxlLWNhcmQtdXRpbHMuYwo+ICsrKyBiL3Nv
dW5kL3NvYy9nZW5lcmljL3NpbXBsZS1jYXJkLXV0aWxzLmMKPiBAQCAtMzEwLDcgKzMxMCw3IEBA
IGludCBzaW1wbGVfdXRpbF9zdGFydHVwKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbQo+ICpzdWJz
dHJlYW0pCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChmaXhlZF9zeXNjbGsg
JSBwcm9wcy0+bWNsa19mcykgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGV2X2VycihydGQtPmRldiwgImZpeGVkIHN5c2NsayAldSBub3QKPiBkaXZp
c2libGUgYnkgbWNsa19mcyAldVxuIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaXhlZF9zeXNjbGssIHByb3BzLT5tY2xr
X2ZzKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FSU5WQUw7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGdvdG8gY29kZWNfZXJyOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHNuZF9wY21faHdfY29uc3RyYWlu
dF9taW5tYXgoc3Vic3RyZWFtLQo+ID5ydW50aW1lLCBTTkRSVl9QQ01fSFdfUEFSQU1fUkFURSwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpeGVkX3Jh
dGUsIGZpeGVkX3JhdGUpOwo+IC0tCj4gMi4yNS4xCj4gCgpSZXZpZXdlZC1ieTogUm9iZXJ0IEhh
bmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+CgotLSAKUm9iZXJ0IEhhbmNvY2sgPHJv
YmVydC5oYW5jb2NrQGNhbGlhbi5jb20+Cg==
