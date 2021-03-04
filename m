Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A0C32D00F
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 10:52:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD6EE1AC4;
	Thu,  4 Mar 2021 10:51:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD6EE1AC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614851540;
	bh=oe9+YHDSONBuwscslnQwC03XF5B2v38Pohg5j/8+8sc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fODUo7X4W8SrF2CoWeUsTwFNqAtHDEioomnDaFSxEARJz9dF6uiP5t2Kt4XMtdEHk
	 1nnRYM9qN5krtFLxqDDIrJKFYTiPnGzALIFjrmkh49Ufq0si7yrwRPtWDBVEjbYkj5
	 Lk767lqv1hHru77khHALfX4ggh/6vuCzQQnPfNN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EF40F8007E;
	Thu,  4 Mar 2021 10:50:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 044ACF8025B; Thu,  4 Mar 2021 10:50:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A03D5F800ED
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 10:50:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A03D5F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=infinera.com header.i=@infinera.com
 header.b="Eg/yvP6g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQTr9LWcXgMFegrZ3FSzK+mx8FKJHjLFaJYmLprarxXXkwFWhOI/XG2B+p4+6kpYxacXbQDXQENKuXAYrJI3U2ClvmC5UabM67tXZDN5U+S0vVoNXvVZXeGKWN/Px8CvtDLis0n4/j5cwzCeGS8P/eT4FA8Lt9CsdZ/4jfKMBmt73ufeqCjDVlzXpVZs+SHDZBUHsyIIyP0c2PuJ+IcYiXV2lWalFZnkpFYur8gny4AxbLH57qRT71nYfj5HrAIxKhUDqamcHe+7v05yU7kC08Pbboso+2ejJ6rMxNCvOMNMmVuAO+aEIPCUPmySnFt2EtO0oeROMt3KJlTB89kFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe9+YHDSONBuwscslnQwC03XF5B2v38Pohg5j/8+8sc=;
 b=TdEqcbAEnL72u2g51G1gmwMD9jnAUFGWWjepRdXKazkk0yduYrUhLbQkxYgsLMw082jWb+YV+GEkU4xG3RXD0h7vcQ63PhszD7dr9JwFS3sWel3Gp/Ju5/DtylDcut2Lyvnm3nD+KhAxvlrXYzBH10vVh/YqeXrsJOEhvxDas9tdJZ34bWa+NzG4PD7CoOePhPrve1kzK7CEPyYLSCi5TpBTRsx8IfEK7htcKpG07kAiu2TMLR3gA960hWwA7YHCRt78ARSroO0smHPKV2uVhFZwNVp2b10Hy9iqVDBKa2qp/TW4F+9xp/dr5eTJHlEL7pi60VPU4iu44kqHm8A2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe9+YHDSONBuwscslnQwC03XF5B2v38Pohg5j/8+8sc=;
 b=Eg/yvP6gY/DfJRyEt40po4bFydTAuaQps4Gmm/Q/dHAU1MU84HRw8RK+Lzm8mTt/bxoTQEsSQ6sSo+TOfFzYgvfMbS4iSGm/cM4siM0BjzRIJx5q3HRgF4kdBYL2d0oPqs4zDg5ku09SW4f8Cjmy9iurrSYD0AbYlGfUtq3xshI=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1480.namprd10.prod.outlook.com
 (2603:10b6:903:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.26; Thu, 4 Mar
 2021 09:50:36 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::fcfe:f4e4:1d73:6d79]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::fcfe:f4e4:1d73:6d79%5]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 09:50:36 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "kai.heng.feng@canonical.com" <kai.heng.feng@canonical.com>,
 "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: usb-audio: Disable USB autosuspend properly in
 setup_disable_autosuspend()
Thread-Topic: [PATCH] ALSA: usb-audio: Disable USB autosuspend properly in
 setup_disable_autosuspend()
Thread-Index: AQHXEK+x7chO7/RMg0++vC8hryQEBqpzlkcA
Date: Thu, 4 Mar 2021 09:50:36 +0000
Message-ID: <1ece75aa13b1ab161473dd153598256e58289dec.camel@infinera.com>
References: <20210304043419.287191-1-kai.heng.feng@canonical.com>
In-Reply-To: <20210304043419.287191-1-kai.heng.feng@canonical.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.39.2 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none; canonical.com; dmarc=none action=none header.from=infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c2f14a4-f35a-462f-47b2-08d8def2f64b
x-ms-traffictypediagnostic: CY4PR10MB1480:
x-microsoft-antispam-prvs: <CY4PR10MB14809C71CA56854B1A47A580F4979@CY4PR10MB1480.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:304;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IFcYHLcMszXZQwRCd/o0X3Vpl4tPuqx7WPk+N7QpTliuwxwUr5bNUcMdbWVStnvf6KiBiTqOOpMjJ8mlmWMvAYqxAD96LROTC1NqmT9FGYjS0TFMOa6HpequPflY3xEsb/N0sscqMC4QZal4SrVrDLF5fn9uh9ulf+jGdZ3zxZVOKU2NMmTC/GqsemXVOc0lP2y2Jnx29cNrKtFU8mgbcfKseRLFlf418EhPfzxdfih7hvtkZavqZDDOhG8ZWrgnQxGtO5KDwHeXNU+0yWBRlIZfubCuHQtl5rl4f6Vi1wGXrkmWibWSr2veaWAKvk5aXxGT1lq/F17gns4optKk7LRB/VOPVheTP+kW2X5Sm8k1KoQNC4WYPLoQx/ZYLGRntvm9e9Tbg/030Vqs2pWxS3wDUs1vhiwJkbSuBleFWBXs/EeoCFuUQkeMaljM0Chh01jRXgg9m1ZiFlEWQVp1cqzqYon4b+zlxZgQOkaljWh/uSZbu9j/VAEkjxKBjCAF1Yx0t1yoESHZSnXd7kye2g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(66446008)(66556008)(91956017)(6486002)(26005)(110136005)(4326008)(83380400001)(66476007)(54906003)(316002)(2616005)(64756008)(8936002)(5660300002)(36756003)(76116006)(71200400001)(6512007)(7416002)(6506007)(2906002)(86362001)(66946007)(8676002)(186003)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z1RnVDN4eXdOQkR6VVN6UHdUTUNYcFdERFlmd2xvS0Y3WlpJSFdBcjNBUXc0?=
 =?utf-8?B?UjV2K0lvK0tRWjJTZHRlaC9PNzI0aWhmL0pJSWxVa1Z1Vi9hOTZHeWJsaEpS?=
 =?utf-8?B?bFFCZzJ6c1M2cG1LMUFleGF3NzBXUzFOeTJYbHZxcDRaTHdSSHdjMU82R3Qx?=
 =?utf-8?B?NVcrbERxOVFoem4xYStEMVRHWnd0YmhkUGRCV0k4QW82Wmg4K3hFVGdsVGtI?=
 =?utf-8?B?WEZMZnR5VFlvUE9hT2Y2OW93OGRZY0dONWRpM2ova1RlaVlLWUVIeFF4M3dm?=
 =?utf-8?B?OFA5WFE1Q3VweFhaaGwzUVpVZW9JTTlVQTdYUDYyZDhTSVFtNW1sUmpFMWhv?=
 =?utf-8?B?MFpxNnE1bEltSWJTZkFVQWlHR0N2N2dDTUNvK3N6V1VrRVA3RUFkdVZSV1o4?=
 =?utf-8?B?TmZJalBhZXpDalVmQ0M1V2pQVWhnSmpoWGxhaXlyRFBka3VCNkZjam5NS1hh?=
 =?utf-8?B?bDl1eW9Od3Q4UkxnQXZDU1VmbWNSZWM5UnpmMEZLQ0NpMWRqV0EwbW5RVFk4?=
 =?utf-8?B?MEowdzlZT1dZTkl0ZjNrWkUwM0lnUXVKVkZNT0pkRWlrZENmU0VLenFyMTZL?=
 =?utf-8?B?STYzMnlLMzZnWTI2VGMzRUMydEtRdW81NTNNS084eTFtYkdFU3JUbFFRVE1Q?=
 =?utf-8?B?bEhJUE5zMXRXSmltY2xYSkRDUWNjSzg4ZXlXdm1QVTQxRm1KTk1EUGtpOEtG?=
 =?utf-8?B?dXdvcHRhY05EY3RVSXlTY2NIdGp6U1JUc0hhSGJOTTQ5bzVyNG9EN09kdGNy?=
 =?utf-8?B?eFdON0ZhSy9qaXBhNmVuV2F2QWVLaURwMTFuSko1YmxvNTdlZ3ZxS1RCdk40?=
 =?utf-8?B?L0N1bzFEaTRJa29aWEpTMUpNajNlY29lTXRIbUFMNTB0cFg5ejlhd25YcVI3?=
 =?utf-8?B?Mm84TXNpR1pDUFJYc3c2QW9vcjVRdlBJRWE3M2dvU3c1WHg5cC9FamdUVjNx?=
 =?utf-8?B?ZENhSGJySDJaR25pbVJFVUovYUVKR1FFTlZXbm5GUG9UanJIOVZEbVpiNlhU?=
 =?utf-8?B?UlVpNWZDaU9CNFZ1WXdGTkVLQ0N6K1ROWXYvbFlzRVRFWU83VXVENmxDSjVs?=
 =?utf-8?B?U3JjLy8xQzdSd2VrRGxiWTl0cEN5c1ZGVDNhNW1Nc1IyYjFlSnF3cVRRMmVZ?=
 =?utf-8?B?NWRtY2pSTFNaZytZMFBoM1l6SWl2RlQ3bE5MTnhaSEJhZlMvUnVHWUFaVXpq?=
 =?utf-8?B?dUxaQjAwNmgwNEpyM2dHU3I0WGFLaGt5QUNLTTRMTEl2ZnBwMUw1Q3haSXdC?=
 =?utf-8?B?N0F3QmEzRjNzUW1lajJ2VzR4a1MwQ1dSN1UyWmdCdWdlc2xIUFJlT0JDTHN2?=
 =?utf-8?B?UWNuV0lrOXdxZWFtOWRjblF0eVNQd2NFYnlVV242OEVjM2JYcC9RYnVsbmcv?=
 =?utf-8?B?bW1qSENpQWppdGJKMVEycU9DNVQ2K0o0NTRzcVhwbWVDbWpqUGtyMWl4QUZG?=
 =?utf-8?B?OUFHVXRCaXJRcU95YWp4UW05UE5nem13VFVRRmVhSXI3WkZkUzZmdUIzelJh?=
 =?utf-8?B?b1hoN3VqQzNnUjUyc0U0TzlZS3l5STJ1RUJRWFBGbjBJeTdnQkRPWVI5Rm0x?=
 =?utf-8?B?ZTRZWjZRZVRCb3BoQ2hEWFNiQml6TlZ4cnl2bFFVcEt6dW0wOHFabGdLbWd5?=
 =?utf-8?B?MndyTHAwdmxUdjNtT1BuTk5LY0Y5THFoMHM1YzFFZFlMa1didXZ2eVQ1M2Zz?=
 =?utf-8?B?N2E0WFR4ZTlGdHNYN0dzZjhlKzVDMERVRzU5LzM5RlpGYXgxSktJOEF0ZW5m?=
 =?utf-8?Q?x5OhxXb9/zkGEZZJGxfvUBL0ykiXWZSsPBxBbrE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <20E75AAD507DF64B99D3D33DAD8D61CF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2f14a4-f35a-462f-47b2-08d8def2f64b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 09:50:36.7786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VqmrRzekosWEg0Fz1x3KQnrn09zhPbwoS7TWpm6MOIp3PwNOfscTOGButzzeVrJ8pHiTVPRaGokStDxuEhMXNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1480
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "livvy@base.nu" <livvy@base.nu>,
 "dylan_robinson@motu.com" <dylan_robinson@motu.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "crwulff@gmail.com" <crwulff@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "gustavoars@kernel.org" <gustavoars@kernel.org>,
 "alexander@tsoy.me" <alexander@tsoy.me>,
 "broonie@kernel.org" <broonie@kernel.org>, "joe@perches.com" <joe@perches.com>,
 "dmitry@d-systems.ee" <dmitry@d-systems.ee>
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

T24gVGh1LCAyMDIxLTAzLTA0IGF0IDEyOjM0ICswODAwLCBLYWktSGVuZyBGZW5nIHdyb3RlOg0K
PiBSZWFyIGF1ZGlvIG9uIExlbm92byBUaGlua1N0YXRpb24gUDYyMCBzdG9wcyB3b3JraW5nIGFm
dGVyIGNvbW1pdA0KPiAxOTY1YzQzNjRiZGQgKCJBTFNBOiB1c2ItYXVkaW86IERpc2FibGUgYXV0
b3N1c3BlbmQgZm9yIExlbm92bw0KPiBUaGlua1N0YXRpb24gUDYyMCIpOg0KPiBbICAgIDYuMDEz
NTI2XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIHNuZC11c2ItYXVk
aW8NCj4gWyAgICA2LjAyMzA2NF0gdXNiIDMtNjogY2Fubm90IGdldCBjdGwgdmFsdWU6IHJlcSA9
IDB4ODEsIHdWYWx1ZSA9IDB4MTAwLCB3SW5kZXggPSAweDAsIHR5cGUgPSAxDQo+IFsgICAgNi4w
MjMwODNdIHVzYiAzLTY6IGNhbm5vdCBnZXQgY3RsIHZhbHVlOiByZXEgPSAweDgxLCB3VmFsdWUg
PSAweDIwMiwgd0luZGV4ID0gMHgwLCB0eXBlID0gNA0KPiBbICAgIDYuMDIzMDkwXSB1c2IgMy02
OiBjYW5ub3QgZ2V0IGN0bCB2YWx1ZTogcmVxID0gMHg4MSwgd1ZhbHVlID0gMHgxMDAsIHdJbmRl
eCA9IDB4MCwgdHlwZSA9IDENCj4gWyAgICA2LjAyMzA5OF0gdXNiIDMtNjogY2Fubm90IGdldCBj
dGwgdmFsdWU6IHJlcSA9IDB4ODEsIHdWYWx1ZSA9IDB4MjAyLCB3SW5kZXggPSAweDAsIHR5cGUg
PSA0DQo+IFsgICAgNi4wMjMxMDNdIHVzYiAzLTY6IGNhbm5vdCBnZXQgY3RsIHZhbHVlOiByZXEg
PSAweDgxLCB3VmFsdWUgPSAweDEwMCwgd0luZGV4ID0gMHgwLCB0eXBlID0gMQ0KPiBbICAgIDYu
MDIzMTEwXSB1c2IgMy02OiBjYW5ub3QgZ2V0IGN0bCB2YWx1ZTogcmVxID0gMHg4MSwgd1ZhbHVl
ID0gMHgyMDIsIHdJbmRleCA9IDB4MCwgdHlwZSA9IDQNCj4gWyAgICA2LjA0NTg0Nl0gdXNiIDMt
NjogY2Fubm90IGdldCBjdGwgdmFsdWU6IHJlcSA9IDB4ODEsIHdWYWx1ZSA9IDB4MTAwLCB3SW5k
ZXggPSAweDAsIHR5cGUgPSAxDQo+IFsgICAgNi4wNDU4NjZdIHVzYiAzLTY6IGNhbm5vdCBnZXQg
Y3RsIHZhbHVlOiByZXEgPSAweDgxLCB3VmFsdWUgPSAweDIwMiwgd0luZGV4ID0gMHgwLCB0eXBl
ID0gNA0KPiBbICAgIDYuMDQ1ODc3XSB1c2IgMy02OiBjYW5ub3QgZ2V0IGN0bCB2YWx1ZTogcmVx
ID0gMHg4MSwgd1ZhbHVlID0gMHgxMDAsIHdJbmRleCA9IDB4MCwgdHlwZSA9IDENCj4gWyAgICA2
LjA0NTg4Nl0gdXNiIDMtNjogY2Fubm90IGdldCBjdGwgdmFsdWU6IHJlcSA9IDB4ODEsIHdWYWx1
ZSA9IDB4MjAyLCB3SW5kZXggPSAweDAsIHR5cGUgPSA0DQo+IFsgICAgNi4wNDU4OTRdIHVzYiAz
LTY6IGNhbm5vdCBnZXQgY3RsIHZhbHVlOiByZXEgPSAweDgxLCB3VmFsdWUgPSAweDEwMCwgd0lu
ZGV4ID0gMHgwLCB0eXBlID0gMQ0KPiBbICAgIDYuMDQ1OTA4XSB1c2IgMy02OiBjYW5ub3QgZ2V0
IGN0bCB2YWx1ZTogcmVxID0gMHg4MSwgd1ZhbHVlID0gMHgyMDIsIHdJbmRleCA9IDB4MCwgdHlw
ZSA9IDQNCj4gDQo+IEkgb3Zlcmxvb2tlZCB0aGUgaXNzdWUgYmVjYXVzZSB3aGVuIEkgd2FzIHdv
cmtpbmcgb24gdGhlIHNhaWQgY29tbWl0LA0KPiBvbmx5IHRoZSBmcm9udCBhdWRpbyBpcyB0ZXN0
ZWQuIEFwb2xvZ3kgZm9yIHRoYXQuDQo+IA0KPiBDaGFuZ2luZyBzdXBwb3J0c19hdXRvc3VzcGVu
ZCBpbiBkcml2ZXIgaXMgdG9vIGxhdGUgZm9yIGRpc2FibGluZw0KPiBhdXRvc3VzcGVuZCwgYmVj
YXVzZSBpdCB3YXMgYWxyZWFkeSB1c2VkIGJ5IFVTQiBwcm9iZSByb3V0aW5lLCBzbyBpdCBjYW4N
Cj4gYnJlYWsgdGhlIGJhbGFuY2Ugb24gdGhlIGZvbGxvd2luZyBjb2RlIHRoYXQgZGVwZW5kcyBv
bg0KPiBzdXBwb3J0c19hdXRvc3VzcGVuZC4NCj4gDQo+IEZpeCBpdCBieSB1c2luZyB1c2JfZGlz
YWJsZV9hdXRvc3VzcGVuZCgpIGhlbHBlciwgYW5kIGJhbGFuY2UgdGhlDQo+IHN1c3BlbmQgY291
bnQgaW4gZGlzY29ubmVjdCBjYWxsYmFjay4NCj4gDQo+IEZpeGVzOiAxOTY1YzQzNjRiZGQgKCJB
TFNBOiB1c2ItYXVkaW86IERpc2FibGUgYXV0b3N1c3BlbmQgZm9yIExlbm92byBUaGlua1N0YXRp
b24gUDYyMCIpDQo+IFNpZ25lZC1vZmYtYnk6IEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdA
Y2Fub25pY2FsLmNvbT4NCg0KSSBnb3QgYW4gcmVwb3J0IGZyb20gYSBjby13b3JrZXIgd2hvIGhh
cyBubyBVU0Igc291bmQgZnJvbSBhIExlbm92byBUaGlua1BhZCBpbiBhIFVsdHJhIERvY2suDQpV
U0IgSFMgaXMgY29ubmVjdGVkIHRvIERvY2sgVVNCIGphY2suDQpDb3VsZCB0aGlzIGJlIHRoZSBz
YW1lIHByb2JsZW0/DQoNCiBKb2NrZQ0K
