Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A2C4F1535
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 14:48:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1561916E5;
	Mon,  4 Apr 2022 14:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1561916E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649076520;
	bh=0RLMbaN+ccxR2hd/W5LKZNqQevP2BG/deUIyldIbb0U=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dRZ5H4MvRDQmCRneRPFdUBegGkcRYUaUCoyiEAreD5hTp+E/p80BHq8aEXnU9AHy2
	 LoY92bN+sWlTOYH5y7cC60W+6e3ZGqCOWvTuM328t54JxDPRJ9otCMAau4yNcjGiBo
	 IVbHmviA/joSDtg4mdYIeCFSeYzz6in1FkHovOp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94181F80212;
	Mon,  4 Apr 2022 14:47:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91568F801F7; Mon,  4 Apr 2022 14:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD7EBF80100
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 14:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD7EBF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="0VVJ7HZe"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="LG2w45jf"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649076454; x=1680612454;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0RLMbaN+ccxR2hd/W5LKZNqQevP2BG/deUIyldIbb0U=;
 b=0VVJ7HZes6vN+PdAcmgNMhZKkHsSfgkC2h543YVakHUe57onWG3IO+MX
 ZMrTp+lD5snzwDEtDNPI/3XJ9xa+FYZNZQMZGsefxOg0Sb8i/H3Omiv2v
 tV1tZ+YrgHHngEWA91v65L9V6D9uPyzQDvEYVKGVUaDknygYkpXfr0IIq
 Fzl765eFFsC76C6ScppMk1MQTWtPHoM+CO32tWzx5vAKd01O2ORMLgFOo
 HdRMfofggAOMSG7qAOLTJsMPdPpDrCPqqNRyYNqICzbwBwiCXGWO9EHul
 mCEdGxJI8iBGbr+r0ynxrAXMCDsgBIGNSR0l7Ps5VbmWst1IgFfQXT55U A==;
X-IronPort-AV: E=Sophos;i="5.90,234,1643698800"; d="scan'208";a="151406378"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Apr 2022 05:47:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Apr 2022 05:47:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 4 Apr 2022 05:47:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWxW1M8jpKMFWyfVxAQFU5KeQNWhkC1ct5SuZDz/B5jF+ATGoSy778+EO6sCeQ7Xsqu0N9N97JqDC12CBPo3pzfGEI5/YV3Nq24kDBc00rhNZDfVZlUx6nLhkyUvRlPkONb5LqTkiqxQvt9mPTpix4GJfbygawwIX73PJgkw7ifZUyD8npZec6L7z1pf60M9rYa7RGjahZGMKeGt/3s0jcllkiS7pNjtgLKTaa1n1J9lq649JfmtjZAo8ckcB7vvsSe0dnycpm+VPAlO8FrEixJnjN9/cpsu2/bIw7V65o/GDfKnDm+ffOzKf81AQvjQ+7BEaQx841YP9OpXzRGi3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RLMbaN+ccxR2hd/W5LKZNqQevP2BG/deUIyldIbb0U=;
 b=UqNq2gOewGSKWioMpUMLPtpJnBRJpRagXRShWSmq4sUP2AlSVumEKq5sX/ZgNqrTdDPctRYlqyis3uVFI9Ydh8s9Q5NSwjIWKIMYZLJtybq9yVxD2pf8Qwy6DIRFZH6qTZGe0w5/Pcv67fZBkz+H9I/mz03EzgrFrPJP49LJm2Gc3LbiVqhwZP8MeNxHDRyJCFVDatX3dYaPaa2aB9y4xqkRzdlCjm1bZVpyCTjIZ5D9qv686r3OtBmtN0LN4HGnKvuJNKoYdR8XISIrOA5VD76QcNoZL6G9J2P9DYXtcpA5gkKZPkyVS/uA6YQwDiMqQwCAHdJGCNSNjCgeQ0KIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RLMbaN+ccxR2hd/W5LKZNqQevP2BG/deUIyldIbb0U=;
 b=LG2w45jfjzsVaCluwaBLjqW9x8yeptntpnuPxnqJvoPnSoqXiPE+B1mtqyCZHD5xCei4TsNTlrgsfb9idefKAnrPT8rFYnnK065VGaB5xFu9iGCYzat7sWJ1GKB8cMxupy87prPW9lxvKXqrYm3/IzUsjL9hQEGkc35BfXdoWPg=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Mon, 4 Apr 2022 12:47:27 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f%5]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:47:27 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: Re: [PATCH v1 2/3] ASoC: atmel: Fix error handling in at91samg20ek
 probe()
Thread-Topic: [PATCH v1 2/3] ASoC: atmel: Fix error handling in at91samg20ek
 probe()
Thread-Index: AQHYQF8bPgOA7w/ig0qBPOMCYO8Cvqzfw4iA
Date: Mon, 4 Apr 2022 12:47:27 +0000
Message-ID: <cc73b6ab-9b76-6359-5c2c-7199ed5a3166@microchip.com>
References: <20220325154241.1600757-1-broonie@kernel.org>
 <20220325154241.1600757-3-broonie@kernel.org>
In-Reply-To: <20220325154241.1600757-3-broonie@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bb6ed2a-8cc5-4b33-4784-08da16394654
x-ms-traffictypediagnostic: CH0PR11MB5218:EE_
x-microsoft-antispam-prvs: <CH0PR11MB521809BFE77E278AC4744ED4E7E59@CH0PR11MB5218.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cgFk0Asi5fUvqEnCp2yOdm+3xqIb/dxPugSQsJeopy15gAUjAWT+B1Tt3hWfQ4UTfwbSMndELMXl7fwuiJ5/0yR8q5pDriG8RvT2d3hqJP6WKjiK4tVG6djtWTbuFdbBLAoVStM+V3RCz1GFz9KWHBPZzUiJE6arebXF+zLXZ5r/Jf5fyoKOJN4DRztO9dJI2Ar4RZrmcMhebZuVMCd/zk8C0GCc2YPa0MwSQeZ2a3BXtjBzpgq/q5NqZvY+2CdrCzqEzyYdxH4AVGrRtWvfEdZRb4DIReXjO/ptvi77kCdm6lB14Ixek5nXP3CLFDHx/bJCN68Ql3G5QCA14xDVV46XP5oLlAB2NZCyab9AqO4J6SM85A6NREPppSnJsUi/HVz2HteS2OgusxSUNdvGIxQluDyGAqRcA5brVjRSILVwm5LAOwOQOcCpl+McuSkxfFpi4Q2eqFXhiQ6EM9kF8bM8yk72xkhY8utU8YTER75JnHfIWOD5ERUjhRln47OPiMXaiY7975EGdMM5vB69YC26DcKkwYH8rrHmUNLARuAbKrbvzR6B9pOcv3UKbQHE6u4ha+Th1VfM/tA5XiA3EQsmtBZ7rvTda/LabmBruDA8WIYgUh7WyhL5IYOhNTh8Q5O3bLZivZrAZCMfG9ttFuqPJR/C7rbpimm72ldyjw/uvxf1yaUv7A+H/+PuPqMKtHzJ9TZ2uHeOl+67D7/XtQW2WatgtdXfkYo5iuFcyCnDcgXbQSvykGIv9c4UPTAUxBNrewiv/D1s9LhKvQFkQg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(38100700002)(6512007)(122000001)(86362001)(31696002)(38070700005)(66556008)(66476007)(66446008)(64756008)(76116006)(2906002)(6506007)(8676002)(4326008)(71200400001)(110136005)(83380400001)(508600001)(5660300002)(6486002)(8936002)(4744005)(53546011)(36756003)(31686004)(316002)(186003)(2616005)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3d0RXBzaS9XUmpXZDc4MEZ5Q1p4N0x1bU1yaGVzQVl1VFBOdW5VZXFXeXVz?=
 =?utf-8?B?bTNyV0gvVEJPL3ZySzk5dG02aXIvN1N1Qlk0VW1hdThiNTZxUVM4SXMycnU4?=
 =?utf-8?B?VVcwVGpuSGFZdDZTKzFwbmwrYzlQbXRxU2cybUxNYWJIeHR6emdncGVmSVJ2?=
 =?utf-8?B?TVhPMU5jTmZQUklYTWNIbFhsMlZ5bHlGcGQvMUdvN2ZJRXFRczVkNXg4Tm5C?=
 =?utf-8?B?eGkrSmREYmdBWmRBQlNVbVhhMUVEaDYxTW5FU2hXb2FvVGNyYnRCdzA0TnJj?=
 =?utf-8?B?ZmQyYjlFSXh4cE5INlVOZklTOWJFdHF0d3VPd2VwcGtmRzRtZVppM0tFaWFo?=
 =?utf-8?B?SyttUlZLWGJ1S0JmaWxRM05INUZSQm1yWDViY1ZmSTJIdmQ4Q1NDUkZ2N3RH?=
 =?utf-8?B?YTYwQ0ZabWE4dnJlTVZmM2h3Qk5ycjJZTnVFUlBNMW9pNWh2ZmEzR3Fremww?=
 =?utf-8?B?Vm9WbUN6WnJ1Z2MvVHRJMHNaR3didHB1dXgwVnNyWllYcnk3TnFOOXk5WjUw?=
 =?utf-8?B?SzBXUDlmbGxVcy9jRE9jK01KNjc0bklQTmF5SWFMTFhIVXVnTTlncFp5N21u?=
 =?utf-8?B?QjFCZFNQcmlDakQzbTRJYzcrNkQ4bmd3T0tieDFjTkV6MXo4L3dteTN5eGxq?=
 =?utf-8?B?by9tRGpORU5BMVBxUmVYU3Vxa2xRVXJiYmNqZ3U4cm55b1M4SlRqMkFhUktv?=
 =?utf-8?B?dFcyODRpWVAyMzdxRlMvRHdPdGxOUjlLbjEzbGpKUlliWVBPbFJPMTVHVDI3?=
 =?utf-8?B?MUtsM1c5bmlQZEE1bWZkYWExczg2dGtUZXZ2UEhFWHBEVkJxd0FkUkZaWmFR?=
 =?utf-8?B?QVBqZ0FETkN0KzdLOC82Q3NyTU8zaE90MzMwTTdhUTZUTHBIemZJdXAvUFRv?=
 =?utf-8?B?ZXJnRm9jTTFVNUUvS1owSTB3R0piaHdGZ3NBaGdXWm9xSTlXaTYxVDl4OGhH?=
 =?utf-8?B?aFJ5VFhxRnNiWmswSGFtNjIrOE10eGMxMXNjWWphOFowOVZsRG41ZWxFS283?=
 =?utf-8?B?RGY3UklsYzNNSS90R3ppcHliYllYbkcwa1IxeVlvbTk0WWhzVUFaSTZieWFY?=
 =?utf-8?B?Z1FtdmZZTmVNWXhTOFFPZnZSVDJPbzRwaTJ1K252N3VsN2svaU9Qb3lLQW1G?=
 =?utf-8?B?NU1XMlBNMlZaYStNc1JodHk0QmZkMThlY3lPNnRSUk5INnlJcVR0NWV5MGhk?=
 =?utf-8?B?S3luN0l3dW1SZllSMmJOdFRoV2IrMkRYV1hPb1BBZk04ZFN2S3dBZ0pCUWdk?=
 =?utf-8?B?ZkFTUzJRUU55MEVDdHN3WFdpNis5TDV5bXh3MHRwblQxdUdCd1BHMmNxd0ly?=
 =?utf-8?B?aURkUjBWZ2t3cDFnalpUY3RmaEh3TEVmSWhSM3NmemgwVmJWRkl4SkdNY09w?=
 =?utf-8?B?MlNjWitVY25vcUx6Rm1FdXZ4bU16QXpBNi84K28wajF2SWg2aHRZN0prOWE5?=
 =?utf-8?B?b1VFaVhuL0phdlJYTTZTK3NyaVNVYUM3amR6MXhOaVF0Q0NabzJpQ0ZTcmpj?=
 =?utf-8?B?aDRmMkpSYXFNNjhuQktrRzIzcndWeUMyQ2EzQi9VeDJtdEVqMDVOKzd0MlVB?=
 =?utf-8?B?QUgrajdFMlBuWTZNVnZWWFJiMjJKSTFzeXNXQU9ROXNGREx6ZDZWVm9VdlAx?=
 =?utf-8?B?ejZmRzBsaVBDa1VZV0V4UWx6dVVzeUtNSEs2Q0NET0RmZTlZMlBYYlNlUDlo?=
 =?utf-8?B?UitCV0NaWElXVGoyRWNvUEQyNFUyRzd6Q2dtano0YXo0UjVNdVZOTTdtaUUv?=
 =?utf-8?B?K3FtSUtJVGZQa21BWDZ1UjE5SEdWd3RVRlNsNVdIWlRZVnpEb2Zqbm1FMzVG?=
 =?utf-8?B?bTVXcjRUUFhUcndxcDQyQU5kTUZIQ3RTd0g4ek5uU09PSUw3cDVXZ3llYm5K?=
 =?utf-8?B?eGhwSE1Jck9hcFk2Q29rTm5OMU1UQ2N2T3lQa2pWdXNXaFNRb3V5eVh6UDI3?=
 =?utf-8?B?T1hIK213YlgrYzhNUzNoc0I5VUM1MHBCb1VDSVN2OU4zR3QyMnJrTDIwTnNo?=
 =?utf-8?B?V0xGSUg2SVFnazNscG9vaExCVzEzb2tIR2tqZis5WFFzWmNNZm0yNEdsNWEw?=
 =?utf-8?B?R3BxSTZLZEF3R0wrTWZxVytXTVEreGZINjlXMXp2Mk1JTElQQ3ZoeS9hcnJQ?=
 =?utf-8?B?TG1nMEJYMk9odEFmam9Ea0M3dWE1V0tCY0wrTlNFbEhpMWJjNzhXY0VnSmYy?=
 =?utf-8?B?b3I4VUJJMloyaVdFREVKTDZSME9vVG54d2ZkYUV0bDNPbnU1THI3U1k1Zy9T?=
 =?utf-8?B?K2kvWlhTZ0tBdnkrQ3ZRdVJSejY3L0NySUdFTVNGOVVQbW1NYVRzWmZiVU5h?=
 =?utf-8?B?RjFXR0VOVjVNR2piUnFxK1RQOGZsTHUwUjcrNk1VU09hRDhtSGViM0pnV2FK?=
 =?utf-8?Q?gUJsJl/J1TN4S2OsSR5qC2Ol8aThMub/aVwYdnq+2v/vE?=
x-ms-exchange-antispam-messagedata-1: LY0jD3s4J4W9CstswadyjbR1p6b/LI7xIsU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26FD2024F28DC24D9500F2EA4221FC1F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb6ed2a-8cc5-4b33-4784-08da16394654
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 12:47:27.4428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWHNLjlUBblepRzX8q22LhXbCAwAGcYOO4S5CSPIrhN0OHK2v2oOHfxcAR0rDuXbL8QLYho8JyxobbuOHBJ5rx1vhCF0Epadn71nfw5vehA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
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

T24gMjUuMDMuMjAyMiAxNzo0MiwgTWFyayBCcm93biB3cm90ZToNCj4gVGhlIGVycm9yIGhhbmRs
aW5nIGluIHRoZSBBVDkxU0FNOUcyMC1FSyBtYWNoaW5lIGRyaXZlciBwcm9iZSBkaWQgbm90DQo+
IGNvbnNpc3RlbnRseSBmcmVlIHRoZSBTU0MgaW4gZXJyb3IgcGF0aHMsIHNvbWV0aW1lcyBpbW1l
ZGlhdGVseSByZXR1cm5pbmcNCj4gYW4gZXJyb3IgcmF0aGVyIHRoYW4gZG9pbmcgY2xlYW51cC4g
Rml4IHRoaXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5l
bC5vcmc+DQoNClNob3VsZCB3ZSBoYXZlIGEgJ0ZpeGVzJyB0YWcgaGVyZT8NCk90aGVyIHRoYW4g
dGhhdDoNCg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJp
dUBtaWNyb2NoaXAuY29tPg0KDQpUaGFua3MhDQoNCg==
