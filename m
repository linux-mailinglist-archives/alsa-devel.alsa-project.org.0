Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1FE2CDA27
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 16:33:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 095A81821;
	Thu,  3 Dec 2020 16:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 095A81821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607009599;
	bh=AbdWEilyJmG1Y1hs1b83CJIPua41TsqnkQnwG6/4jI8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=crKkgQhZIEJE7+SAk3sIFuFi+sn04uTmh+koudjgXK/WrHHp5r8a90Iphi9eP7h3E
	 FOywNsjpLQX+K6tJyL6bj5aRCc4XmkoUw9QjfQiEGqkvwncvsEgX9jdfx/7T8GSg2L
	 pUYGSa9CnCBm5mPwkVz2WKWUHj7+23MCoz+UU/18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A062F80254;
	Thu,  3 Dec 2020 16:31:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28D88F8016D; Thu,  3 Dec 2020 16:31:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48B24F800E8
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 16:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48B24F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="jrKBEz2b"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="cEpMO3wj"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607009499; x=1638545499;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AbdWEilyJmG1Y1hs1b83CJIPua41TsqnkQnwG6/4jI8=;
 b=jrKBEz2brWkc5K9rkgvUe4oFH4rbA3OcUfaW0I3Dqwl//miLCH9FnOdq
 Jwpib4dGG3pkug45OoNw8kj2icsG0gpfZRBbhXZPko+jmjxNGjshGmf1e
 U3iA6jv0QaRKYXTM6VAfF6leFtnfFKkrGaANjtx0RM0tIBU8PYqXO9cUF
 JncS8TdIMzBwUKE6LJb+NoeDq8C/U7mSfMs0Axi64y+IzVPd/8PNKN4Kd
 Sgr7mP2RHGUoIMu5L6/WH6vykOt/M20dwml4XydnWHWU2eC0CpZ/ZhSKg
 zkGiFL+zD/4s9p/xp9hB6hu4zzIulky40iN3zY1x9hFpebrJZ5DhHhS2B w==;
IronPort-SDR: wyz0dnKbpGWQaiepskH6tmWg5aK4ozpHCDZ0ukB4/ICl7THn3pyh9mjGVWr4poODImczYhNPel
 +VA0XUzSVsJIiONAN3pYmDVgDmOgI0KPTb1uU6jiYmEp5jk2m6yK9QaR+lrPm+G+wIzlYNC2UN
 FIWzioRmKYgn4PULRfR/ySR0jxKkzrZOv9RGt1idvVOoKONsbzQ7faIxMSUMFZyz0jXdXC26rL
 eu6z/JJe/P1Z+CypYmwhMdgwV09wypTsRRz4lgH1MtObSHFHFHukkqhFcu5Z+QUh07PoE0gVY9
 rrY=
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="106026025"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2020 08:31:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Dec 2020 08:31:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 3 Dec 2020 08:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhLwBNrFGzdv7bpa7GnbtRFslWYMUB7xjOhUetPILgk761gsUS0oFFEmnPdRD0CpSD9bnccCs02PUk530TRg+Ah2JmO5YNVh/o7YiEKvT5GnW152v/tyOPEQt+nClspxzdvaM4QXfFFtz1N2GZUgHunfqUnQv09rWfpu82OnJVplJGwb84e1hoRT8pmBn0aBZw+GNNfG77GWzxk87tlnB0cJMf3WdUugmulDBEDVGjZnQ9JVaEkKRJT5j3qrJOvhV3lngT0p0mB6/VP6et+O+k2T3Nqdwm8dRfXLYtQcCHovwMog7MHi0Jv3cjeLdprjN+czDWZWQbqZQtubJgGhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbdWEilyJmG1Y1hs1b83CJIPua41TsqnkQnwG6/4jI8=;
 b=QLkfRzTM7tLbBNOpF+hhH+yzPCTfYAlPeCXsXHLOBrocSw+EjFIr9FYXESzDYRFZzNlXNEi5EgG0P9iV1gtO5gpk2bnUQfSlQKaXoJMc+TuE76zoiR9HXmIxQB2otIDScEQaZPwE611v0YNMtjUNP1gjfO5pJ/IMdwrZfqO7MnLeA+B2ZMWUe0ARih/7ZlWpdF4rrS92y2OOxPMq1mX90ko1PV7EQayRi26XNAZQY6Cc4VLEU6qIPGljvIq2FomF78QuLXFgMKYW2cfTi3q3orFFdalBIsuIJTK1adAP1CrQ2kYz/WQOd6DW+mcR+XaHf6+N/Gp1J4VEDSLGgCQULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbdWEilyJmG1Y1hs1b83CJIPua41TsqnkQnwG6/4jI8=;
 b=cEpMO3wjny4d6S9pvB1HpagUcPvRlinlOWOPs1bwRqs2yEug63CVvp18wG2oSxX7eO+Eu7t5c9auRJZo6SZpjhxlD+elyyXkRVcsmT1rvPcBQr2ioaQG5Q4tMzgYNaYfhh0WdJk1Psb457PWmNbQ9HfeYD405voqYD/vq9qh+tE=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR1101MB2293.namprd11.prod.outlook.com
 (2603:10b6:910:22::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 15:31:33 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::a52e:2a1b:e5d9:4fdb]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::a52e:2a1b:e5d9:4fdb%5]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 15:31:33 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <dan.carpenter@oracle.com>
Subject: Re: [bug report] ASoC: mchp-spdifrx: add driver for SPDIF RX
Thread-Topic: [bug report] ASoC: mchp-spdifrx: add driver for SPDIF RX
Thread-Index: AQHWyYUs21oIkJTEfE66wwoHn08uLqnlf7YA
Date: Thu, 3 Dec 2020 15:31:33 +0000
Message-ID: <f58f5379-c645-6a0c-5345-88b72e4492a5@microchip.com>
References: <X8j9HPrdXRy5IDvd@mwanda>
In-Reply-To: <X8j9HPrdXRy5IDvd@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [188.27.102.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9177de7e-ca51-4fde-8313-08d897a08395
x-ms-traffictypediagnostic: CY4PR1101MB2293:
x-microsoft-antispam-prvs: <CY4PR1101MB2293B08EDD508B9197F094C9E7F20@CY4PR1101MB2293.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8tj1WRL01IeJBMfufxCdHze2yLY2qGn5b9BySxnodK4dP2TZPIo0tQgxxbVagoIRC/IK1XMx0Q2idG0Zmbnsbe7qxAkQrixEfEiWyVaD++/9STYa4/NSKrRQcteuWsxUOah4IG+ChPjbkB5vkOdk3hpAVmJb1M+hwj4bSqZxRHxKrAAYCVPkLPR23h1jMtF56T0C0GGjCygCiUXhAHtrA9rcPq9N0FKtI47PyZJ5BWNd7WKqsNd7xLLktn0uUqRNXxQwr3KcRUREtj+Cgu8MhSU4p1GGneKDuOWrR61z3vu4W5IIGujMC49c7nZwFtykSFSuFJR8xPAc9up4JTpWWcGyOXnXTmCCyR9XhN+54iywfdsTPaC+5WRHxHyRctOfhbZjY5DwMr5Z35Yi7k/1hTTLf8Ys5edkRQYU6o4lbFW63Vw5CccD6DGuUOJerItz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(376002)(39860400002)(366004)(66946007)(66476007)(86362001)(316002)(8936002)(6512007)(6916009)(4326008)(36756003)(2906002)(2616005)(5660300002)(91956017)(66446008)(66556008)(83380400001)(31686004)(8676002)(26005)(186003)(64756008)(76116006)(31696002)(6486002)(6506007)(53546011)(71200400001)(478600001)(83323001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MTlYcnU4NVBFYWQzQjU2VHBQMlVNRTNuTm5LQVYxbmc0WnZwSXFzSW9ZNURw?=
 =?utf-8?B?b3hIV3NjOXZCcWppNGl3NWtWeWNKdG14NGpseHB6bDZlNy9TSEVzbnArSDBn?=
 =?utf-8?B?ZGw0UlFwcy8wZjBodFhZd01LY3dTdnd3OHRmQlpKT2E4Y2xvNTEwcTFka05X?=
 =?utf-8?B?WG5ZTk9Sd0dhNm5Jd005cWNGQ3o0TjdDVm9kZklGSitKRHlhNGtqOUhDQU96?=
 =?utf-8?B?T0lOYTJJWXBlMWRjVnpGRWw1b0dOdDRIZWdXS2pXVTlBR0FvQzExU0dydklu?=
 =?utf-8?B?S0lsaHBXUHQzMHJOOEdWaFJ3ZWVsa0luL0lSRmJaWlh6Ni9udWpsZXRWZ0dV?=
 =?utf-8?B?MmZydWRLNi9SSXJQMzJUVlBJU0xBUU1WWG93VXJCRmUrdHRMUWV3UVZqREI3?=
 =?utf-8?B?c25rK1hoZHhUdFIyUTIxZUErcEgzN2xta1A4YzYwS2lJK0RKYy94LzdVSEsr?=
 =?utf-8?B?N3UrclNZNXhxcEZOTHI0T3NxZUFmeUllcEZoZVg0dnN2VUpINGRDUmluMkU2?=
 =?utf-8?B?c3VBY3VIU2VuVGFRQkxtR0dEK3YwWlNZeG9IK1hCTlg2ZEpOLzlGL0NGTURX?=
 =?utf-8?B?bHZSN2RldzJDazk5TFV2YzA3ckdWdmNYT0xvb0N6dG15cDROa3hJdURERXAv?=
 =?utf-8?B?L3BnVVhiOVc1T2IrbTZMSDR3TUhzWXVpTWFsMmNnY2NqWjdkbjBaaGdiclJK?=
 =?utf-8?B?MFNIQUIzc2JlSUJFcjljdS9XVisxRzFabkJoN0I0bWdxeHZXWmpzM083WENa?=
 =?utf-8?B?dk0rMjhzZ1pHNDZqK3k4UkFWcFNHZ2JPcUI1UzdmVU5mNTBWeWc2RTBaR3FK?=
 =?utf-8?B?bEoyWkFXeHIxWElWZ3dVSCtoV3RXS2p3dU5PNWV2bUt5dFVSK3k1S3dkdnda?=
 =?utf-8?B?eDIvdkRvWjJRTkQ4aGN0NlppcjFIYTc0eGN1VzV0K1ZPaEVBTG1aUWpEWktD?=
 =?utf-8?B?R1ljMkw3TGRsc0ExK3lEaWQ5QkJpeHdFNFZDNjlwZnVqR3lKR2taUDFscy84?=
 =?utf-8?B?OVFhaWdCNmJaeG9hcDVGMnVOTVBmUzhHZFJJN1A2cjdWT0gvQm1NSGNNK2dp?=
 =?utf-8?B?VUZvc3J0K3VSM0sxMUlWUk1YWGZvSVBmbENHL244UEZYNVNMQTVVTjlVY2Jy?=
 =?utf-8?B?OFhBWmxZV0FmUWhpL3pQTk9EVnRMRzBzMjhlVWxybnVJdHZFQWlMMjRGVXdq?=
 =?utf-8?B?Wmd6K0V5NlYrZXZTci9xU3I1REU2NEtlWjFoa1FKYUhEQUhrYVZjT0hGVWw5?=
 =?utf-8?B?ZE1FaEVLbkg4SGxYRU1UbXdWeDJyK0M0cjMyeUt4T0xDN0g5MzVVd3l1cWtw?=
 =?utf-8?Q?tMbE2gHL/BnHg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <44224523CC56DE45A6D28A2488435D65@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9177de7e-ca51-4fde-8313-08d897a08395
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 15:31:33.0380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oAPgpXwahS5GMLNbrkJh2vz9t4tEVjW7XYmtReZfNIMUvWly00v+Beg0BfItx+jwmSEi8IolLr0QnMvZMBXuCDFhmgfzYGiZJfNESnOICHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2293
Cc: alsa-devel@alsa-project.org
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

T24gMDMuMTIuMjAyMCAxNjo1OCwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gSGVsbG8gQ29kcmlu
IENpdWJvdGFyaXUsDQo+IA0KPiBUaGUgcGF0Y2ggZWYyNjVjNTVjMWFjOiAiQVNvQzogbWNocC1z
cGRpZnJ4OiBhZGQgZHJpdmVyIGZvciBTUERJRiBSWCINCj4gZnJvbSBPY3QgMiwgMjAyMCwgbGVh
ZHMgdG8gdGhlIGZvbGxvd2luZyBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOg0KPiANCj4gICAgICAg
ICAgc291bmQvc29jL2F0bWVsL21jaHAtc3BkaWZyeC5jOjQ2OCBtY2hwX3NwZGlmcnhfaHdfcGFy
YW1zKCkNCj4gICAgICAgICAgd2FybjogJ2Rldi0+Z2Nsaycgbm90IHJlbGVhc2VkIG9uIGxpbmVz
OiA0NjguDQo+IA0KPiBzb3VuZC9zb2MvYXRtZWwvbWNocC1zcGRpZnJ4LmMNCj4gICAgIDQ0MiAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFyYW1zX2Zvcm1hdChwYXJhbXMpKTsNCj4gICAgIDQ0
MyAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAgICAgNDQ0ICAgICAgICAgIH0N
Cj4gICAgIDQ0NQ0KPiAgICAgNDQ2ICAgICAgICAgIGlmIChkZXYtPmdjbGtfZW5hYmxlZCkgew0K
PiAgICAgNDQ3ICAgICAgICAgICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRldi0+Z2Ns
ayk7DQo+ICAgICA0NDggICAgICAgICAgICAgICAgICBkZXYtPmdjbGtfZW5hYmxlZCA9IDA7DQo+
ICAgICA0NDkgICAgICAgICAgfQ0KPiAgICAgNDUwICAgICAgICAgIHJldCA9IGNsa19zZXRfbWlu
X3JhdGUoZGV2LT5nY2xrLCBwYXJhbXNfcmF0ZShwYXJhbXMpICoNCj4gICAgIDQ1MSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1BESUZSWF9HQ0xLX1JBVElPX01J
TiArIDEpOw0KPiAgICAgNDUyICAgICAgICAgIGlmIChyZXQpIHsNCj4gICAgIDQ1MyAgICAgICAg
ICAgICAgICAgIGRldl9lcnIoZGV2LT5kZXYsDQo+ICAgICA0NTQgICAgICAgICAgICAgICAgICAg
ICAgICAgICJ1bmFibGUgdG8gc2V0IGdjbGsgbWluIHJhdGU6IHJhdGUgJXUgKiByYXRpbyAldSAr
IDFcbiIsDQo+ICAgICA0NTUgICAgICAgICAgICAgICAgICAgICAgICAgIHBhcmFtc19yYXRlKHBh
cmFtcyksIFNQRElGUlhfR0NMS19SQVRJT19NSU4pOw0KPiAgICAgNDU2ICAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsNCj4gICAgIDQ1NyAgICAgICAgICB9DQo+ICAgICA0NTggICAgICAgICAg
cmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGRldi0+Z2Nsayk7DQo+ICAgICAgICAgICAgICAgICAg
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4NCj4gDQo+ICAgICA0NTkgICAgICAg
ICAgaWYgKHJldCkgew0KPiAgICAgNDYwICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYtPmRl
diwgInVuYWJsZSB0byBlbmFibGUgZ2NsazogJWRcbiIsIHJldCk7DQo+ICAgICA0NjEgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiAgICAgNDYyICAgICAgICAgIH0NCj4gICAgIDQ2MyAg
ICAgICAgICBkZXYtPmdjbGtfZW5hYmxlZCA9IDE7DQo+ICAgICA0NjQNCj4gICAgIDQ2NSAgICAg
ICAgICBkZXZfZGJnKGRldi0+ZGV2LCAiR0NMSyByYW5nZSBtaW4gc2V0IHRvICVkXG4iLA0KPiAg
ICAgNDY2ICAgICAgICAgICAgICAgICAgcGFyYW1zX3JhdGUocGFyYW1zKSAqIFNQRElGUlhfR0NM
S19SQVRJT19NSU4gKyAxKTsNCj4gICAgIDQ2Nw0KPiAgICAgNDY4ICAgICAgICAgIHJldHVybiBy
ZWdtYXBfd3JpdGUoZGV2LT5yZWdtYXAsIFNQRElGUlhfTVIsIG1yKTsNCj4gICAgICAgICAgICAg
ICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eDQo+
IFNtYXRjaCBpcyBjb21wbGFpbmluZyB0aGF0IGlmIHRoZSByZWdtYXBfd3JpdGUoKSBmYWlscyB0
aGVuIHdlIHNob3VsZA0KPiBkaXNhYmxlIGFuZCB1bnByZXBhcmUgdGhlICJkZXYtPmdjbGsiLg0K
PiANCj4gICAgIDQ2OSAgfQ0KPiANCg0KVGhhbmtzIGZvciByZXBvcnRpbmcgdGhpcyBEYW4uIGh3
X2ZyZWUoKSBjYWxsYmFjayBpcyBzdGlsbCBjYWxsZWQgaWYgDQpod19wYXJhbXMoKSBmYWlscywg
d2hpY2ggd2lsbCB1bnByZXBhcmUgZ2NsaywgYnV0IEkgZ3Vlc3MgaXQgZG9lc24ndCANCmh1cnQg
dG8gYWRkIHdoYXQgeW91IHN1Z2dlc3RlZC4NCg0KQmVzdCByZWdhcmRzLA0KQ29kcmluDQo=
