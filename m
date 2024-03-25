Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B773388940A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 08:45:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ED7D192E;
	Mon, 25 Mar 2024 08:45:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ED7D192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711352715;
	bh=Iw1yd3ht9jsM7f15gIPep67UJGTy4Erb3kUPu5gERlA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kDwmjW62YwerYbyi/QDww7TZ3oUgddomjJUj3BpmjGJY4WN5vVErM8CSx7tY3z+yB
	 07LCK/MrBD6327w75x4fjIbBYtzDGkd/0CIpgexo31ZBKk7zfrl8pQA8fmORJH9JqE
	 yLW/Ho1kPpStDx9k539QpjvdKfQFWIxtwLSPf6SE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3B89F805AB; Mon, 25 Mar 2024 08:44:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77522F8059F;
	Mon, 25 Mar 2024 08:44:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69E50F802DB; Mon, 25 Mar 2024 08:43:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,HTTPS_HTTP_MISMATCH,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDD42F8055C
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 08:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD42F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=k0UqWC5G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9rc29fOBDXcqJJRNCF6DV93Fy7koSuYklAzzSJI2UtfOnw2N7TEKJx9jPB0k63mxqSVtywNi8c1qAO29AMJYO2lzkaprlki4L3ZKnbwdqMSXpkTzhNJLBRGkZn8xtYzRRUzT30fWGbnpPGwk85KEpQcfNfFt6k5CZtIToXLrNhAWve2+uXP4p1vVe9J3OZb5adJOEnxZVbpddWXGz7DeIJK6kL7L3BK/VzO1pIayAeG+0MRpeNyzMN8qclWxB+5JwQCfbaQWzHU220g8SJp54jkSL5I2K/htuowVKmgzfJ5pldd49b17j8h7Q8s5SpmWoFJDFOw6GJaw0lErOZ67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=373ahmyBWEbtLbo1ASJg2wnwo7ecVdQuxIX8+Afw+Tk=;
 b=oeMp5hYWX0I+ZGqNvQ6XgJJP3Ag0IKsqlmRv22Nl7oWodqSBg1DOKcQTDrEwJjTYgqJS+lMtFDbqR/uHGVGTYHNjLAHJwlBx+KqTf2PQ+SkQdNzq67yux4FnTodBnQf2fqvVsSBK+l5uCmiY6OzvD73krCdTovWA09eQ2ssRPS6k7aHI+QZzcrCaSNedcOoOj+A1zlAm5k7mKR3LzI2E0n0RXfy57Gpfa+o6AeRYl2RtHn0vG3vESsjamZp1feEvKULra3gNaEKO1+fTiCSkkQi2gZ5LF9Xmyn8glVcG+YfK0Ok4f3K9whH4yQl/jATn0PVrBHeDIOumKdFQ52Qddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=373ahmyBWEbtLbo1ASJg2wnwo7ecVdQuxIX8+Afw+Tk=;
 b=k0UqWC5Gepld+0x8MDEHeofwnnris3cxUVidX6KCcdKsThXoFD6qd44sYCtoahKOa4fbJ6md2RyR4WBj17nt/RIWdM8yB1sG6N9MJnU8evQjaN/p9D7Z/MAaq+ruWizLY0J12DjVvD/BIsggC/jC7YSg2JkunYUmorCctF4D9Mo=
Received: from SI6PR03MB8987.apcprd03.prod.outlook.com (2603:1096:4:235::7) by
 SI2PR03MB6485.apcprd03.prod.outlook.com (2603:1096:4:1a4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.31; Mon, 25 Mar 2024 07:42:46 +0000
Received: from SI6PR03MB8987.apcprd03.prod.outlook.com
 ([fe80::13be:c406:46ab:8d0e]) by SI6PR03MB8987.apcprd03.prod.outlook.com
 ([fe80::13be:c406:46ab:8d0e%5]) with mapi id 15.20.7409.010; Mon, 25 Mar 2024
 07:42:46 +0000
Message-ID: <699671e6-780c-460d-9cd2-c5b98eaa9ec3@nuvoton.com>
Date: Mon, 25 Mar 2024 15:42:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: Added schema for
 "nuvoton,nau8325"
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
 supercraig0719@gmail.com, dardar923@gmail.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240322025405.3340064-1-wtli@nuvoton.com>
 <20240322025405.3340064-2-wtli@nuvoton.com>
 <20240322182534.GA1220647-robh@kernel.org>
Content-Language: en-US
From: WTLI <wtli@nuvoton.com>
In-Reply-To: <20240322182534.GA1220647-robh@kernel.org>
X-ClientProxiedBy: SI2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:195::22) To SI6PR03MB8987.apcprd03.prod.outlook.com
 (2603:1096:4:235::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI6PR03MB8987:EE_|SI2PR03MB6485:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FlcDfgSJRXZHFiijRVenpe8xmxg0Oa+FuY8004yoH8mqjGyMS1qtz1R4lnU7gV0GzhQ+YvbexRoD1C2Cft/OqJLez4zIPVJHMufcK0yWC67ndwJlEtH38FqUq8QQZM7gwizEW4zjHAI6qKbjA0zQ9xPCfolFhugucDvp1TWcf+bH2YRqAWsdQbUpmaUMHeJ4uodFzddP54iuzx6i49YSQ4MojEzG86hN4ZzB4/LC31N2i/hE/N2E4xUtLYWdnS5gtS8bdn7+2y2WSsJeMdzRK7MdYHry+cf7tcfux+tLlWdsnNY6NR8VGSl9c/KLP6uQGzjsHdY4uaXPC5IADEz7nJjHo98TWtpRFJ8bhjM/nVduVtiLjgVniF021kEbySosxSvWwXs+oxXJIZ0EXl4OOG5H1SxpB9umcQvh0lpQrLNuOgPu/qnNT72bE1kkKGYsw6XVGAyw0LFReUP1MWW+qECfFg7+O83Yt/Yj4EFtLJE0nD5FCbUaHADIvaSv3F6cMaWF1qeOW8FRnv/OCTv+KB0OQ2dmBQE0bp333Wkd8+Rbu0mDgHGwsPO/Asw/tASUg8ljh2aCmt+wuKKDBGT23Lq0Z2E6V/HsOzZ39Wy3qGk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI6PR03MB8987.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVhKZ012ZHppWkFZZTNGYVlCcTZSc2w0RU51QkhQR0dRdjdheUtlekkyaGFu?=
 =?utf-8?B?Y0hqUXF0dHVtOEpLTlFWbjlnSWVBS0JVamkyeFlEOEhaZytVcEowcmxLYW5u?=
 =?utf-8?B?NkY2Tml2S1BzOXF5NlhPTzl4aHk2eFRQY1hKOFEzWXpZNHVlUFdWdGJOMEt5?=
 =?utf-8?B?NmJjd3JnS1gyNFlQZ0lYZ25KRG83ckltRzRZek1oUGRsSTdXSDNKZnNzSDF3?=
 =?utf-8?B?QitnVXl3dTJOcTRzQVMzMjZpSUVoQ2ZJTS9GMmZHc1hkdTZrS2NHSzIrRHhM?=
 =?utf-8?B?QVpvdC85dGdid1ZnMTBraElvTmhSemU2KzBPTFl0cG1wUGIzT0thT05IZWVq?=
 =?utf-8?B?VlhPbjdGazFhQWN5T1UvaGQyUTNPZEpvL2VqeVBoemN3Q2hSSVlieTdYNm5y?=
 =?utf-8?B?V0pnTmZYakgxdUZFZWd0NzNvT25YTE0xL0Z5Y0pmN1J4YnVSRkdYdnk2OUJi?=
 =?utf-8?B?eFhlYmVmd2gwUDZiaER2WVZnRjREZTRsOVBlSURTRDBpZGcrN1pRSi9tbllz?=
 =?utf-8?B?UWxtdGRDdG5kOXk5TTVQUmlTRkhreEk3RFBCZkdFVE5ZNmRzaEhJTFdtaXVZ?=
 =?utf-8?B?WU1ER2h4Yk1qQlBVMFc1b20xM05KVlhTWWZwMWpzMUVUR3ZoYlFHeGdDVU9i?=
 =?utf-8?B?YW9pWjRYempIU0FRRUVFc05sZUo4Ry9Zc0tod215UTNaNGFsZHc5SWFpTFJm?=
 =?utf-8?B?U2tQVit6cGVmekp5RGhZOGVFd3dvM0VNd3VMYjYrb2JDd1B0UlVzaC91Ti9H?=
 =?utf-8?B?aE84Rm5ENzBkR3BaQmU1YlFuMC9WUVI1U3pSdlpFNzk3bFB3eEloVDdiTnRW?=
 =?utf-8?B?SXFQWm5YR2ZRU3BKazAxSDhRMG01YkNYZzc5UGF2UFBDd2NxR251WVMrVTI0?=
 =?utf-8?B?bUtBc2JaWGg0RkFGWE9qTzN4cUpvaExreER0S3I2Tm1SSmY2b2tLL1ZocWFn?=
 =?utf-8?B?MmY5eXNxbXcvMVhGVytkWmVYTDQ2NVVXcmZDWXB3bmMrN2p6OVNnaGpUeXlW?=
 =?utf-8?B?OG90M3Z2SW1PS2k2eGcvc1VQWXFtbi9hK2hRdHo0WXc4YjZIOHExS2dBa2hZ?=
 =?utf-8?B?SkxQSDVUWjljMHRNQzY3VU93cVFFajVZcnErNURTOVExL0hCQkVtcWVySTVC?=
 =?utf-8?B?SWdzQ2NaVHFob2piOWFPNVFXZ1FQRlRtV0RPWkJVWDlzODNKNmdMdmVpb3pV?=
 =?utf-8?B?eFZjNFBKc1AzSzNCZDU5My9kR1R1MmM4WUo1QmpCQ2M5ZlZZeGFYM29maThG?=
 =?utf-8?B?OGZLOW1xRGxORzZDYmtHN0FyQTh5MTNyT1dWcTgvTXA3WHNTd1FuN1o3U3h2?=
 =?utf-8?B?M1gvL1VuckE2TStQTng0YWVRcW9yTHlzUWpycEN1Y0daT2llRERobzJTdDZP?=
 =?utf-8?B?STdhM2YxU1l2ZG95bit2cmdVVGNYUFZxRGJOZFVHV25EY29QMERaT2diN2NS?=
 =?utf-8?B?RmsrQW1OeHcwY3pLbGk2WVpTaExyNVZxUFoxWUF4ODhpM1VBYzBmWEVlYWVm?=
 =?utf-8?B?bEZRYmRyOVdDTGdOWGhUR0VqUVJSYlJ2VFg3OS9ZVzdLWVNOZlZFWWZlcDEz?=
 =?utf-8?B?Y1N4YjFBTzM0cjBsM1hRUzU2KzdMT2VTM0dKK1dXeFBLaEk5bXdKRWJvaEo3?=
 =?utf-8?B?WVNhUTEyZE5zMDdQeUlyNEk4MWtpTHIwNmdIc2gvWlFIMlRZZGM4ZCtIYjZG?=
 =?utf-8?B?L1p1ZlNnQTBaSTdTMGcxcUowQVYzNmptdS84QkxIYkdkVWtSZGcrYzRXeGQz?=
 =?utf-8?B?Znp6cWc0ZW9TeUNmRUYwNUdYZ1JaUDU0WDZXNUZuQnR5LzhUYytzenQ1NEds?=
 =?utf-8?B?WW5QNDl5dkMySXRVZ1hjTTRLWi9tRS9HNGpweWZXY205aG5zVXBxazhjc3Bh?=
 =?utf-8?B?UldhK3BGSC9ob3BUTnp5ZW9ObjJodGZMSTFMNFpTenV6L0JESlZxaVBCbVp6?=
 =?utf-8?B?YUpGNHlJRVVyd0ZxZE9tdTNVOU9XMC8rbXNIeGJ0bkx6c25JMGxnRTRzMjhM?=
 =?utf-8?B?US9uMHVUcWl0NDVtai9CRE9ORGJyR1QxT3FldldaRDloc2FSdTF1dEhZNkhI?=
 =?utf-8?B?Y0M5S0tPbG9PMjlKNUNTNGNqR2s3eDhTZEZuZ1JoOU5ZM1dBNjlPR29sbnBm?=
 =?utf-8?Q?h7ORi5i++ydrnPOf7HqAKrhPY?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c763f1b-8087-4487-37c9-08dc4c9f29a4
X-MS-Exchange-CrossTenant-AuthSource: SI6PR03MB8987.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 07:42:46.2897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6FLbgaYe0Q6J/dHwfL2TMTCvtdBfXQ1gpWXMtJNM6HPNzUhkjhk95LvqgYUeho2Sgb89fT5I7ADs9P6PWW+89w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6485
Message-ID-Hash: 6FC2LPZE2NW4H44IFR54WDB4EVPYPBKP
X-Message-ID-Hash: 6FC2LPZE2NW4H44IFR54WDB4EVPYPBKP
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6FC2LPZE2NW4H44IFR54WDB4EVPYPBKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpSb2IgSGVycmluZyDmlrwgMy8yMy8yMDI0IDI6MjUgQU0g5a+r6YGTOg0KDQpDQVVUSU9OIC0g
RXh0ZXJuYWwgRW1haWw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3UgYWNrbm93bGVkZ2UgdGhlIHNlbmRlciBhbmQgY29udGVudC4NCg0KDQpPbiBGcmks
IE1hciAyMiwgMjAyNCBhdCAxMDo1NDowNEFNICswODAwLCBTZXZlbiBMZWUgd3JvdGU6DQoNCg0K
QWRkIGEgRFQgc2NoZW1hIGZvciBkZXNjcmliaW5nIG5hdTgzMjUgYXVkaW8gYW1wbGlmaWVycy4g
VGhlIGtleSBmZWF0dXJlcw0KYXJlIGFzIGZvbGxvd3M6DQogIC0gTG93IFNQS19WREQgUXVpZXNj
ZW50IEN1cnJlbnQNCiAgLSBHYWluIFNldHRpbmcgd2l0aCAyLXdpcmUgaW50ZXJmYWNlDQogIC0g
UG93ZXJmdWwgU3RlcmVvIENsYXNzLUQgQW1wbGlmaWVyDQogIC0gTG93IE91dHB1dCBOb2lzZQ0K
ICAtIExvdyBDdXJyZW50IFNodXRkb3duIE1vZGUNCiAgLSBDbGljay1hbmQgUG9wIFN1cHByZXNz
aW9uDQoNCk1vcmUgcmVzb3VyY2VzIDoNCmh0dHBzOi8vd3d3Lm51dm90b24uY29tL3Byb2R1Y3Rz
L3NtYXJ0LWhvbWUtYXVkaW8vYXVkaW8tYW1wbGlmaWVycy9jbGFzcy1kLXNlcmllcy9uYXU4MzI1
eWcvDQoNClNpZ25lZC1vZmYtYnk6IFNldmVuIExlZSA8d3RsaUBudXZvdG9uLmNvbT48bWFpbHRv
Ond0bGlAbnV2b3Rvbi5jb20+DQotLS0NCiAuLi4vYmluZGluZ3Mvc291bmQvbnV2b3RvbixuYXU4
MzI1LnlhbWwgICAgICAgfCA5MCArKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQs
IDkwIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvdW5kL251dm90b24sbmF1ODMyNS55YW1sDQoNCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbnV2b3RvbixuYXU4MzI1
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbnV2b3Rvbixu
YXU4MzI1LnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLjZk
ZWQ5NGMwZTY0NA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvdW5kL251dm90b24sbmF1ODMyNS55YW1sDQpAQCAtMCwwICsxLDkwIEBADQor
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
DQorJVlBTUwgMS4yDQorLS0tDQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9z
b3VuZC9udXZvdG9uLG5hdTgzMjUueWFtbCMNCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCisNCit0aXRsZTogTkFVODMyNSBhdWRpbyBBbXBs
aWZpZXINCisNCittYWludGFpbmVyczoNCisgIC0gU2V2ZW4gTGVlIDxXVExJQG51dm90b24uY29t
PjxtYWlsdG86V1RMSUBudXZvdG9uLmNvbT4NCisNCithbGxPZjoNCisgIC0gJHJlZjogZGFpLWNv
bW1vbi55YW1sIw0KKw0KK3Byb3BlcnRpZXM6DQorICBjb21wYXRpYmxlOg0KKyAgICBjb25zdDog
bnV2b3RvbixuYXU4MzI1DQorDQorICByZWc6DQorICAgIG1heEl0ZW1zOiAxDQorDQorICBudXZv
dG9uLHZyZWYtaW1wZWRhbmNlOg0KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy91aW50MzINCisgICAgZGVzY3JpcHRpb246DQorICAgICAgVGhlIHZyZWYgaW1wZWRh
bmNlIHRvIGJlIHVzZWQgaW4ga29obXMuIE1pZGRsZSBvZiB2b2x0YWdlIGVuYWJsZXMNCisgICAg
ICBUaWUtT2ZmIHNlbGVjdGlvbiBvcHRpb25zLiBEdWUgdG8gdGhlIGhpZ2ggaW1wZWRhbmNlIG9m
IHRoZSBWUkVGDQorICAgICAgcGluLCBpdCBpcyBpbXBvcnRhbnQgdG8gdXNlIGEgbG93LWxlYWth
Z2UgY2FwYWNpdG9yLiBQb3NzaWJsZQ0KKyAgICAgIHZhbHVlcyBhcmUgMCwgMSwgMiwgYW5kIDMg
YXMgcGVyIHRoZSBiZWxvdywNCisNCisgICAgICAwID0gRGlzYWJsZSB0aWUgb2ZmIHJlc2lzdGFu
Y2UNCisgICAgICAxID0gMjUga29obXMNCisgICAgICAyID0gMTI1IGtvaG1zDQorICAgICAgMyA9
IDIuNSBrb2htcw0KKyAgICBlbnVtOiBbIDAsIDEsIDIsIDMgXQ0KDQoNCg0KT25jZSBhZ2Fpbiwg
dXNlIHN0YW5kYXJkIHVuaXQgc3VmZml4IG9uIHRoZSBwcm9wZXJ0eSBuYW1lOg0KDQpudXZvdG9u
LHZyZWYtaW1wZWRhbmNlLW9obXM6DQogIGVudW06IFswLCAyNTAwLCAyNTAwMCwgMTI1MDAwXQ0K
DQpSb2INCg0KSSdtIHNvIFNvcnJ5LCBJIG1hZGUgYSBtaXN0YWtlLiBTbywgSSB3aWxsIG1vZGlm
eSBpdCBhcyBmb2xsb3dzLA0KbnV2b3Rvbix2cmVmLWltcGVkYW5jZS1vaG1zOg0KICAgIGRlc2Ny
aXB0aW9uOg0KICAgICAgVGhlIHZyZWYgaW1wZWRhbmNlIHRvIGJlIHVzZWQgaW4gb2htcy4gTWlk
ZGxlIG9mIHZvbHRhZ2UgZW5hYmxlcw0KICAgICAgVGllLU9mZiBzZWxlY3Rpb24gb3B0aW9ucy4g
RHVlIHRvIHRoZSBoaWdoIGltcGVkYW5jZSBvZiB0aGUgVlJFRg0KICAgICAgcGluLCBpdCBpcyBp
bXBvcnRhbnQgdG8gdXNlIGEgbG93LWxlYWthZ2UgY2FwYWNpdG9yLg0KDQogICAgZW51bTogWyAw
LCAyNTAwMCwgMTI1MDAwLCAyNTAwIF0NCg0KDQoNCg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KVGhlIHByaXZpbGVnZWQgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBpbiB0aGlzIGVtYWlsIGlzIGludGVuZGVkIGZvciB1c2Ugb25seSBieSB0aGUgYWRkcmVz
c2VlcyBhcyBpbmRpY2F0ZWQgYnkgdGhlIG9yaWdpbmFsIHNlbmRlciBvZiB0aGlzIGVtYWlsLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgYWRkcmVzc2VlIGluZGljYXRlZCBpbiB0aGlzIGVtYWlsIG9yIGFy
ZSBub3QgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJ5IG9mIHRoZSBlbWFpbCB0byBzdWNoIGEgcGVy
c29uLCBwbGVhc2Uga2luZGx5IHJlcGx5IHRvIHRoZSBzZW5kZXIgaW5kaWNhdGluZyB0aGlzIGZh
Y3QgYW5kIGRlbGV0ZSBhbGwgY29waWVzIG9mIGl0IGZyb20geW91ciBjb21wdXRlciBhbmQgbmV0
d29yayBzZXJ2ZXIgaW1tZWRpYXRlbHkuIFlvdXIgY29vcGVyYXRpb24gaXMgaGlnaGx5IGFwcHJl
Y2lhdGVkLiBJdCBpcyBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXplZCB1c2Ugb2YgY29uZmlk
ZW50aWFsIGluZm9ybWF0aW9uIG9mIE51dm90b24gaXMgc3RyaWN0bHkgcHJvaGliaXRlZDsgYW5k
IGFueSBpbmZvcm1hdGlvbiBpbiB0aGlzIGVtYWlsIGlycmVsZXZhbnQgdG8gdGhlIG9mZmljaWFs
IGJ1c2luZXNzIG9mIE51dm90b24gc2hhbGwgYmUgZGVlbWVkIGFzIG5laXRoZXIgZ2l2ZW4gbm9y
IGVuZG9yc2VkIGJ5IE51dm90b24uDQo=
