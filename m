Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4978573DC8B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 12:54:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00D14826;
	Mon, 26 Jun 2023 12:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00D14826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687776889;
	bh=pZWoQf3B9JuFM2VJsrOeUC2fq5P87ZgsCe/B6CPzf84=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K1j4f1TZdhiTRmqjGGDoaBzm3wU9zRUr0Wjgz739Z/EPkQpdU4GAuWp15QyTPheVH
	 zRCNkSJRJHWQQbJtunrp/LPGVk8mgMjWzffoxi4Fp4sdWaNnhXcPDpCz6wAakkyoIg
	 Ddq8/KDwtAvM0iXe6AG8GXbWv+8sjSQvvSbbhkW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDB31F8053B; Mon, 26 Jun 2023 12:53:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F0EF800E3;
	Mon, 26 Jun 2023 12:53:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ED4AF80169; Mon, 26 Jun 2023 12:53:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65E68F80246
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 12:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65E68F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=connect.ust.hk header.i=@connect.ust.hk
 header.a=rsa-sha256 header.s=selector2 header.b=3m0srvDj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGBZHnrK2yOuvLRQU8vYqZ1kNs/k5F6C7mEXZdwRwEV2Grk1uov3dwFye6BmmTqifJfJTB4+xGlVbU2P74r07FIRrKmcSrwnD5ljMaHsP45acATP0CfRZdLTrsfrgEIDX12nqlKLNCnh1O98nitsqrpLH4PRnmUcYGxUwUklwGe+KJqCjUc6GOExbvKp3tptmsYIVxATT2UIhYSzu4qMXCHwn5fVzPcW5xoghvuiuDHOV3+7tvMdg6kpaRIkHjDByfvoFipgjKgkIxY54WXdS+a1zw8z0M2qdeXjFOAayA6QfGPzTuakhKnpIOwm9LDw9IJixvdfLOX12/XPiUkKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NooFUl4uFRyCluYKTQvN6ReKaZWpHupKhK34bQ5CgPA=;
 b=IcQ7w6aUl2Rc13HWSKlLDBVMKwC1PGcIYx8pST5/14dRokftRoOrMTDqWlnVgnfOzUmaoA7O+drlMvj9CNCANMw74h/h4n04e66XQ9TJ4DKGhi7HG6lrjMF6rj2LxSOt1vN/ZfDjmWBU/4/1Y2wPffRLLI9tHUWdPAfDI3RMBJ33GPBQ1OKEO2xXpfFM4tzFO6hYgxIjChizCH2QSopC6iQxbhuNFA0N1F9Tm4YAo+cuiXilpG0JEHPpgoVT0uV8WlEKXQ9YJcwof1hv0BawBmqhZS+WDZjT4gevUtB61v7e650Xc3uNRpY18yR2kSCsQk5JarW1CasM/fHA8WgKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connect.ust.hk; dmarc=pass action=none
 header.from=connect.ust.hk; dkim=pass header.d=connect.ust.hk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connect.ust.hk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NooFUl4uFRyCluYKTQvN6ReKaZWpHupKhK34bQ5CgPA=;
 b=3m0srvDjPr7h+xsxeZrhhMkb0s8j2JzZ1LXrZKm/6lxcMtSkIdRS3c/ep1frtqLik4rwNk4c5TYSRt3YbB7YGdkJFB0beDTFdQziU3OxbhLgikPwY6aMNSOnNUP1kqDwO9vM+Mc3m6dEruEj9TgkWtBORU3T89Ych2ZkeGdO/Es=
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:b7::8) by
 TYCP286MB2639.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:243::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.26; Mon, 26 Jun 2023 10:51:51 +0000
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b429:5aa3:12f1:6b8]) by TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b429:5aa3:12f1:6b8%4]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 10:51:51 +0000
From: YE Chengfeng <cyeaa@connect.ust.hk>
To: Takashi Iwai <tiwai@suse.de>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"yunjunlee@chromium.org" <yunjunlee@chromium.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: 
 =?gb2312?B?u9i4tDogW1BBVENIXSBBTFNBOiBkdW1teTogRml4ICZkcGNtLT5sb2NrIGRl?=
 =?gb2312?Q?adlock_issues?=
Thread-Topic: [PATCH] ALSA: dummy: Fix &dpcm->lock deadlock issues
Thread-Index: AQHZp3fywsqsa+nIJUORNCRxL38reK+b0p+AgAEUS5I=
Date: Mon, 26 Jun 2023 10:51:51 +0000
Message-ID: 
 <TYCP286MB1188D860B56B9FF1FCAA79148A26A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYCP286MB1188FEE149369A32D90DCE288A21A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
 <87edlzwgti.wl-tiwai@suse.de>
In-Reply-To: <87edlzwgti.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=connect.ust.hk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCP286MB1188:EE_|TYCP286MB2639:EE_
x-ms-office365-filtering-correlation-id: b8ce6bb6-b0aa-48db-5176-08db7633594e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lINKYs197gyUypgMN7OoVl2U+UgxR0Yn5pusupS6TctP8F7vGqSDvmG+oEVFyOVSn8S/Fdwff3b3yiEltfW3VlBdDd7dpjU7Us4ZX4obNRMM5fj+oXXhohEjNCuxzlYMBjE2zyINAqSv4p84kMxcoUL7uTgHd+Ma/KVk21Nb3TXJUiSXimpxOWeDBKqS6RtPeTAKG3HYJ/i6HdbkHeXy8NsdDQEQbhKZ1z9dHLO17/w+GhWbTuho20Jrq1w9GkaM1i3o+KUFo2uKIpR8Wd9TnIoNZiYa96Na2qjwwZMw1NIHX16pkEUCISFQgImBvBBxb47tXCCY8vOOifhKfT4LWish90nR5XuOuTD/99ircmf9zdklqCyyzjUx8gISdpZJ6t65r0gU2Vn7Mi4QUulPtVCCtt9rzBHX7TyUeUpkD6qjCYZI22NWlPnGiuzRlf1PiZlF5vvaortKy2ro2SnNHbhh3rFb2e2F7XFptVaMkmXKdGfQ54fRA+On6N4fdU9MpNgNL3uCf76mss0H+0nMAmgEEkayFXC1WTbOvAHVoJWVXOfwSMB3ill2zrp6iFv45SnMA5AN8Fs9md/i8WpzPcTmQB0JFEUsDLJAHAzGqzk+4NtqOQUXfNsxNiz28bB849JyTiVDeIyZef41d2rQQy4ptWTHVpdQR1ENSCla4kE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(8936002)(64756008)(66446008)(55016003)(66476007)(66556008)(4326008)(91956017)(76116006)(66946007)(41300700001)(6916009)(316002)(786003)(6506007)(186003)(9686003)(26005)(478600001)(54906003)(71200400001)(7696005)(2906002)(52536014)(5660300002)(38070700005)(122000001)(38100700002)(19627405001)(33656002)(86362001)(224303003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?Y1d0KzhHNTVuajhnMEZGcVlReitiSTJxMUE1QlYwd1VueDZyTVhibTd6N0Zm?=
 =?gb2312?B?aXNoNXZHRnRWK2c0NnYvSllBS0RhTmV5ZEt0THU0NDhRSlNmMlFucUJ2RnlG?=
 =?gb2312?B?eDh4MEg2YmsxenhBSkRkNitSNDJDMkNZdnQvNWUvdklYVmRRckNBZVY2NmNJ?=
 =?gb2312?B?UEozVlNUY0wvbE5jR3VuVG10MHZBNUgyWkx0N3VHdW83WngySkVIZnJ2bjRy?=
 =?gb2312?B?cWNOS1ZsMHd3WThZUUtzVkwwNFJUbHYzSzRUVUZlY2M2TTlUaVUvaUxXVlYw?=
 =?gb2312?B?Z3dCY05Vc1R0MGRUdThORmdDMDBwNGl3REVTZ29sWlkzUXkvZU4xdE9aSmd1?=
 =?gb2312?B?UTBkS0NFQ3liK3FRemdIYVBvRGxnU1U1MFc3bCtMb0diOHJrSUtsSGVPbE9m?=
 =?gb2312?B?TytLRGpKWUlab3NoUUZheHQ3NXFZMVBNc0cyWkJNcVlkZDJucnVuRWlNQ090?=
 =?gb2312?B?QldValRHaU0xclAzYkxoTzFvV1ozdnBXcGV0cW83VzdoL0tkZ3kwSlc1dFdG?=
 =?gb2312?B?WmxYYWlDemlNSnFKRGRtL0Q4MXIzRTBRVGJiRm4zbTRkQjBPR2JVQUk1Smk3?=
 =?gb2312?B?eEJyWW1HOXZiU1U4Yk1aQUV3cXNWN2pUQnBRTWRJdFlZeGJlazNXV2ZEVXM0?=
 =?gb2312?B?OTNEaTdjWWszbW5NYTVaTFFZS1luazNIZEZoSE1JSWZVVWNtRVBNNExhLzVX?=
 =?gb2312?B?bU5EcFpBeHRPMWd3eHdTeWE0QjdyOXMwUEVCVmVMVXBSVkpBMjhzenptaVNu?=
 =?gb2312?B?ejlBUjhaU3ZPblFGVXQ1ckZMMTNObVYydHBDWG94YzRPWVFZZFF1SElGWEF1?=
 =?gb2312?B?WmdiaFR3SHROUUQwM05FRjNQRFJuKzNkdEk0L2xQamNjdTYzYzlRZUVZUkE0?=
 =?gb2312?B?UyswMkl4ZUpGWXQ2Z0ZzTTFFWDhyWE5BaGRseUtWT2srRnMrcDJ3NmVZakVO?=
 =?gb2312?B?OUFSeUtVSS9hTndqZndTeVZQZHRRaUpKdVh5QTE3OFYzelltS24rMHZsSk9V?=
 =?gb2312?B?TEViYzc4eEt5UFBxQXVMeHZRR0gvamJFN0VMeUtKd2JBZXFhVkxFWXU2YlRG?=
 =?gb2312?B?c2xXR01Tbm1xRWVuc1IzbXdXUHdYTlA1L285Q29LeTdoT2Nvb0FZMkx2UzNJ?=
 =?gb2312?B?VG1DS0puQ3ZET2tMTVRmL0MyNWxtQ0ZlNjFreHlJWi9jeEpsMUxRbDJTL2NW?=
 =?gb2312?B?dTAzaGM1dWFJR2lKa251TE0wWUx3Vk1EKy9KRU1tYXhwQVlneEhXc3dmUkxn?=
 =?gb2312?B?UFJtYnk0Qm1mQkFJaGZEbUJXcWhibktWWU41ZjdqUFNndWJVUmNCWm9DaE1G?=
 =?gb2312?B?cUhqcE5veFFqN05CWk5BSVJDMHNMRFcwZmJBdVA5VGNIVXZZYWlHdFdmcm1O?=
 =?gb2312?B?Wkh2M1B2c1VZWE5vTUNnNy8yOGpkdHBab3FYSEEzTGZuY0VGRHhwTzJTMnFl?=
 =?gb2312?B?enNzMDVDeFYrcUhoUlJrTWpsc0JlWEdGKzVvQkxtUVdOM0tWbkorbTdnTklh?=
 =?gb2312?B?bVdpQXRuS1lLYWZmRldkUGVacFIyQ0NYRVQvQmU1MFMxWUJteWVxeDBTZnpH?=
 =?gb2312?B?dXZML2sxSWFHOXcrZElVSG9rOWpiUVRVZG51U1VIdXpHNU9EemVQT1RRYWla?=
 =?gb2312?B?MW4ydUZTb0FrNDAyRHRrSm1QNWpLZHV4OXJEOVJ4NXcrdnFLOHBmSHpab3lr?=
 =?gb2312?B?MjUzYjR2RWRob1NxTEd4emZqZ3o4RGNQanVVcjNBK2J6dkxTem50R1dhMmdm?=
 =?gb2312?B?TVRzLytqeG9icWExV0JSYnJBbWg1NExnR2gzVEdIM05BcENQVUFJNkw5NnRo?=
 =?gb2312?B?K1RySkwrRGRRTG1VcE51TWl4NnhvS0lRRDFkNzV1RnowY2g2N2JKNjIxc2Jq?=
 =?gb2312?B?N1lnSWFOL3krZGxNZzgvc2cxaEVRWExuUVQ2YUZtdncwc1F6V0k5bUJQZGhR?=
 =?gb2312?B?S2JILy9yM2czbUZTOTZIQVpzR3VGd1dxUkdGeWF0WCszb0QzNUZhZHRnTzRo?=
 =?gb2312?B?UHJYSUNtQ3JzS2laNFZlN0gxbDRWNko0eVY4NUo4TE0zWnJHN0w0MHpuK0I5?=
 =?gb2312?B?eUN5RzZhdEk1akIwUjVBdURpUURiNW5qOVY3OVlaMWpPRmFwYUF0ZWtUMGl1?=
 =?gb2312?Q?J4gYHaNzAWKgJPEzAfKozn4Qj?=
MIME-Version: 1.0
X-OriginatorOrg: connect.ust.hk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b8ce6bb6-b0aa-48db-5176-08db7633594e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 10:51:51.6468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6c1d4152-39d0-44ca-88d9-b8d6ddca0708
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 yJGtG/hSJ0StrytHFgbk+44+3I4HZu6GiHIMXoSyvNDcKb8wQVKy5codN8M4Obgv/HHDvLrspWCQPK9jjzZUfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2639
Message-ID-Hash: FEQ5M43U6BRTQPSVEZ2VUGMDKMH2RMFG
X-Message-ID-Hash: FEQ5M43U6BRTQPSVEZ2VUGMDKMH2RMFG
X-MailFrom: cyeaa@connect.ust.hk
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gb2312"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTPZFHW3O3Z4MJUHCWBCN3OCOVNPRTK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhlc2UgYnVncyBhcmUgZGV0ZWN0ZWQgYnkgYW4gZXhwZXJpbWVudGFsIHN0YXRpYyBhbmFseXpl
cg0KdGhhdCBJIGFtIGltcGxlbWVudGluZywgYW5kIEkgZGlkbid0IHJlYWxpemUgdGhhdCBjYWxs
YmFja3MgYXJlDQphbHJlYWR5IGlycS1kaXNhYmxlZCB3aGlsZSBkb2luZyBtYW51YWxseSBjb25m
aXJtYXRpb24uDQoNClNvIHNvcnJ5IGZvciBib3RoZXJpbmcgeW91IGZvciB0aGVzZSBmYWxzZSBw
b3NpdGl2ZSByZXBvcnRzLiBQZXJoYXBzDQpuZXh0IHRpbWUgSSBzaG91bGQgbWVudGlvbiB0aGUg
YnVncyBhcmUgZGV0ZWN0ZWQgc3RhdGljYWxseSBhbmQNCmJlIGNhcmVmdWwgb2YgdGhlc2UgY2Fz
ZXMuDQoNClRoYW5rcyBzbyBtdWNoLA0KQ2hlbmdmZW5nDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0Kt6K8/sjLOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQq3osvNyrG8
5DogMjAyM8TqNtTCMjbI1SAyOjEzDQrK1bz+yMs6IFlFIENoZW5nZmVuZyA8Y3llYWFAY29ubmVj
dC51c3QuaGs+DQqzrcvNOiBwZXJleEBwZXJleC5jeiA8cGVyZXhAcGVyZXguY3o+OyB0aXdhaUBz
dXNlLmNvbSA8dGl3YWlAc3VzZS5jb20+OyB5dW5qdW5sZWVAY2hyb21pdW0ub3JnIDx5dW5qdW5s
ZWVAY2hyb21pdW0ub3JnPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnIDxhbHNhLWRldmVs
QGFsc2EtcHJvamVjdC5vcmc+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIDxsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnPg0K1vfM4jogUmU6IFtQQVRDSF0gQUxTQTogZHVtbXk6IEZp
eCAmZHBjbS0+bG9jayBkZWFkbG9jayBpc3N1ZXMNCg0KT24gU3VuLCAyNSBKdW4gMjAyMyAxNzoz
NTo0OCArMDIwMCwNCllFIENoZW5nZmVuZyB3cm90ZToNCj4NCj4gVGhlIHRpbWVyIGR1bW15X3N5
c3RpbWVyX2NhbGxiYWNrIGlzIGV4ZWN1dGVkIHVuZGVyIHNvZnRpcnENCj4gY29udGV4dCwgdGh1
cyBvdGhlciBwcm9jZXNzIGNvbnRleHQgY29kZSByZXF1aXJpbmcgdGhlIHNhbWUgbG9jaw0KPiBz
aG91bGQgZGlzYWJsZSBpbnRlcnJ1cHQuIE90aGVyd2lzZSB0aGVyZSB3b3VsZCBiZSBwb3RlbnRp
YWwNCj4gZGVhZGxvY2sgaXNzdWVzIHdoZW4gdGhlIGNvZGUgZXhlY3V0aW5nIHVuZGVyIHByb2Nl
c3MgY29udGV4dA0KPiAoaS5lLiwgZHVtbXlfc3lzdGltZXJfcG9pbnRlciwgZHVtbXlfc3lzdGlt
ZXJfc3RhcnQsDQo+IGR1bW15X3N5c3RpbWVyX3N0b3ApIGlzIHByZWVtcHRlZCBieSB0aGUgdGlt
ZXIgd2hpbGUgaG9sZGluZw0KPiB0aGUgbG9jay4NCj4NCj4gRGVhZGxvY2sgc2NlbmFyaW86DQo+
IGR1bW15X3N5c3RpbWVyX3BvaW50ZXINCj4gICAgIC0+IHNwaW5fbG9jaygmZHBjbS0+bG9jayk7
DQo+ICAgICAgICAgPHRpbWVyIGludGVycnVwdD4NCj4gICAgICAgICAtPiBkdW1teV9zeXN0aW1l
cl9jYWxsYmFjaw0KPiAgICAgICAgIC0+IHNwaW5fbG9ja19pcnFzYXZlKCZkcGNtLT5sb2NrLCBm
bGFncyk7DQo+DQo+IEZpeCB0aGUgcG90ZW50aWFsIGRlYWRsb2NrIGJ5IHVzaW5nIHNwaW5fbG9j
a19pcnFzYXZlLg0KDQpEaWQgeW91IHJlYWxseSB0cmlnZ2VyIHRoaXMgZGVhZGxvY2ssIG9yIGlz
IGp1c3QgeW91ciBoeXBvdGhlc2lzPw0KSSdtIGFza2luZyBpdCBiZWNhdXNlIGJhc2ljYWxseSB0
aGUgZGVhZGxvY2sgYWJvdmUgc2hvdWxkbid0IGhhcHBlbjsNCnRob3NlIGFyZSBjYWxsZWQgb25s
eSB2aWEgUENNIHRyaWdnZXIgYW5kIHBvaW50ZXIgY2FsbGJhY2tzLCBhbmQgdGhleQ0KYXJlIGFs
d2F5cyBjYWxsZWQgaW5zaWRlIHRoZSBQQ00gc3RyZWFtIGxvY2ssIGFuZCBhbHJlYWR5DQppcnEt
ZGlzYWJsZWQuDQoNCg0KdGhhbmtzLA0KDQpUYWthc2hpDQo=
