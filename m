Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E44515677DF
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 21:33:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E30C16BF;
	Tue,  5 Jul 2022 21:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E30C16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657049594;
	bh=7/gGw9w6DZ9qgDInt943ujTKH42tl2cdu5jRvmtUO9A=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acbwkonnD86/oHi6jrXTtaYQl2Z/lPBIaQ07qDpEIJkTlYNivqPciBPaSKgUXT2PJ
	 JN9fdXnColI/iCdXpz5Pqaxqq2XnEnYu+LbEZzzRGForqB6y+LGuI8+p0EuH2CgOm0
	 W//Yzzgt6HxqCLEe2gxXmb7A4aUAztYXkrgshRsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C62BFF800CB;
	Tue,  5 Jul 2022 21:32:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 840E9F8015B; Tue,  5 Jul 2022 21:32:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDD8BF80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 21:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDD8BF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="XbjVQNp8"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="fsWcV7Qp"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657049527; x=1688585527;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7/gGw9w6DZ9qgDInt943ujTKH42tl2cdu5jRvmtUO9A=;
 b=XbjVQNp81USnKUigxNl9Cf7qhcCDDAOMlLaqd6lyd2mjDGvUxpYN8IAH
 AxlQP2dt1ylemNU6kPxXATqqqVBa3QUE2T3rUeK01MFGvEX0Je2bSZTyc
 iPmBknXc30d6kNDcJek6g0ubjUVABsZlU8zdnL1SmXU/zxJsG6NQin9uq
 v4g55GOBzRHVYta3g9UhJpNfcmoHSD9Gy6CutgSu8nO5nPG1JxrykvU2a
 foqJxVF66i+S2YYz+8BqwaueT+QTN5IsOn5gHEnnWHZtDXa8n6K8GdLv2
 6vz8LJVuMvobEEy53J065kOQnR5oqT75dR/QOzWQOgiKobiLfxuMS+zzz Q==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="170869105"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jul 2022 12:32:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 12:32:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 12:32:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsYzt/3wXnvasFp0NRZLSPgNCfbsNUuC0S9Ea8tCZ5HKR3cOEuLuvLzGprra7bwxHU1dn3OV4rnv/fM9AbDMkNR/NVD41hdO8LWG07iWFOi04XbLyHFs9YBmJ5iPC5d8i2FBd6ifFpH1yw8+jbzUjh1CiJaoO4vp52gZ0QuiYOFw4HTWkLC5FUtGOYZ8ozl1hfwdh8+GUdiwypRXWrGKPc8xzUWm8/+n2eEPGokePLo2b8fO4ksvxDtd1IUM9fkErJngcJnfmGqIPb9uM/M8s4hjHpXPARlj3KyLCuaS2LrHV0SK/ktaFvbZXYlLPKCQM/71/AS2Cb5sL8KEH4cJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/gGw9w6DZ9qgDInt943ujTKH42tl2cdu5jRvmtUO9A=;
 b=RuLYPNN9sEzzVTB45r1JZB/Jsz1VvuTw5Fk4dl3khpyP9oFI8pCP0SsBYB6P5u56B6zC5m2vzeURXDpLgBBG+d8d1A7aUEns7ywUKy/OmfMype7R7B/Aism/WqHn8QPC0X8G8TU263msYw/tMQNEALjlTQmfT1IjcWkUFpQPVqSLBkESHKPTCRLvOoUYMTUGa8pNY34T4/owlPq+aJt2qua73oTWxs7vi5s6ecc7Xs1t3IBk0P3N0NeSk0n3Wqy0X5ouBmgFF7SbHk7UrDs5BKZ/mRnxgfL2DIaEGw30RrTAeJEAERpXX0dEgZJv6NV+E7I0O9Nve632MB87MgB93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/gGw9w6DZ9qgDInt943ujTKH42tl2cdu5jRvmtUO9A=;
 b=fsWcV7QpInY7ZiZY3O3s3qIiQfyQVGGuQB/ltm563pCYG/sfvvCqc/94kSRhyEM/d1Ywubzm7Cnp8NCnIF8HrcoyeIMaewjCHAMfig86rlP7xM+eE4sPguYjiqelQZD/CqJJi8IqwpUowffzZ354GLnBE8TXAytNTVxZpiJ5F5w=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2074.namprd11.prod.outlook.com (2603:10b6:4:50::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 19:31:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 19:31:55 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
Subject: Re: [PATCH v4 05/14] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v4 05/14] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYjYAvHczrGH5faUaoq3axDB0JHK1wLk+AgAABY4CAAAESgA==
Date: Tue, 5 Jul 2022 19:31:55 +0000
Message-ID: <821fd47f-6703-4f05-8fa5-3b1e04555af7@microchip.com>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-6-conor@kernel.org>
 <20220705192307.GA2471961-robh@kernel.org>
 <d2369d3c-adfb-3158-2fa6-81c336502db9@microchip.com>
In-Reply-To: <d2369d3c-adfb-3158-2fa6-81c336502db9@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8148cf57-eb27-4908-e825-08da5ebd0541
x-ms-traffictypediagnostic: DM5PR1101MB2074:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hyVBJaL0KeDzM5WfHAtDsyx8OWaYeuKo07Ph45k0SYu3dF9wo30LJX/x6WpocogqDaAzue/DIAG4JFBMwAd0XJt1uavWR09U7DYBWpMbUGYlRnGHEi3jC2hTu+MiWmCKOKOkCdfEAK2EMVApaTK4dnbP0JP8ZhBb7GVEldAWs9w43ytaN+OfI4QCsKw0bvc6gTqqIQaxKsE/FacOE+vUfh63Nww1OdF88L4NWQ//37WHHzJeL4IGPEfrBpN+ai2/LfVyCiYbaSwJ4P2qyIrrUyPjAluItpABm9Bb4CI5UhttvIp/YesM2o4icAwTkAFvSIW1noEVMmnTBtKx0nKKhtiTM270Xl7nBVTJ2oGFc3bIxu6nSqub3lSCeSKq6z3tZVgmLd4IjnQNmdgBxD/ppRK7vluMpVEubxKHUxqU9gqsKT2T3zfQTT9WqtcBkg6As5sb2A7rp1s5Dx9YU08NIoEU+GXRa/oQZx9lTtzHjZqGqbpBzgr0CdSj9m8yb4GmwIvE+4MXTvzEabAk1MVfKemUipk5ebgs4WjNgwzOStQIT+TQFZ0VwH3+KWyGxWgllbbr0ObWY53H88agCYdPm8m6gQdHHnbaEGVL0cqqdl6KE1FhOnceDUwSsNMzFdTG4PDbNMCCy4/XQHzcRJLOsygD7a8pyv23PJ2pK8PVjOucszOKxq1a8JB+7BpliivITOkpvdPwt8Mqy02gtysyJr4sodU28ySThSd+dr7UpCXYD+mBMa0yjCCnLaNhCNfukfznvZT+ku4kDNmDNgNPz6BMtyKdgrOtWmWmvKk1hrKkrtXxKFavo9WiQat6+yabAIDoxgl9KR2TwML6vgacvJk88mo0qPUfi4g3yM5pshC4lFWtUy7XfTM1wSBsM7Uhezb0nSsbkULqEELnHhpccq60OzYZVRm8ZaSu2ly8nG9iiWDtP6Okprr6GqqnAJZY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(39860400002)(366004)(376002)(346002)(66476007)(6512007)(186003)(31696002)(83380400001)(38100700002)(66946007)(64756008)(26005)(2616005)(66556008)(76116006)(36756003)(54906003)(316002)(4326008)(6916009)(31686004)(38070700005)(91956017)(8676002)(8936002)(966005)(6486002)(41300700001)(6506007)(2906002)(66446008)(5660300002)(7416002)(478600001)(53546011)(86362001)(71200400001)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnFhaE02ZC9Ia2YvYkhMdU9KYnlKVzRheHVPY3YwdmV3VHNhK053RlB5M094?=
 =?utf-8?B?OVB4YlRuc0gzdHFLKy9uU2VUcU4waFhkVlAwQWJadTVUWk13WXpTVEl3c3NP?=
 =?utf-8?B?SVlZNkd6eXloSnhENEJnNjliZ0dRZ1F3WmVKWTFZa2RDZTRNbEd6dk1ka3J0?=
 =?utf-8?B?TU4yblluVVZOU3lDZjBoOGdISDVTUFNyS29ITHh4SitDU0NUR29CZkg4QWUw?=
 =?utf-8?B?TERZRjlza0FoWnJGQTFjSGhrTWF5eEVvVUNQamtNZ1dPQzRJUnIvcnZCS25h?=
 =?utf-8?B?bWM1cTNwMVNCdnFDNXcwdkg4eWZ1SXJ5L3VQTlFJYTcrMW1kUGxwc2xNRGxM?=
 =?utf-8?B?S0xJY1Zxcmp5cjBqRDhtRXVMQk8yVW1aVjdpcTd6dS9JMllXaDBGOVZWenAv?=
 =?utf-8?B?Q2FPQzI0WXNIcUV1Yzh1Ky9HS0lPR09rbFEveG5oMmJ4NkVJRTRnZlMxaGFs?=
 =?utf-8?B?cDRZYWFld2NBeHBHUzBySS9ZbVlFWjhaN2RMRnVXYW1iNjExNDd4TXdGTHM2?=
 =?utf-8?B?OEN3VGU1OUdhZGtnYkVHUzBia0daRFN5NWpvOEFqajNnWHRCcE1rUTJ3ODln?=
 =?utf-8?B?TTgreVN4bDlsWTNibE14U0h0bUphZHdCK21TdGNlSGo4WnJTWGE0ZWtVNkc2?=
 =?utf-8?B?ejNnZnNDNWNsMWhuQTJpM1UrYTJ0bWJFc0RpWU1LRm55QzkyT201OFczZmJx?=
 =?utf-8?B?NzRyVG1TR0pRTWhpazRlUmZRYmJnZzd5WU1XL3k0NmlicjhEODlFTHlyZXFO?=
 =?utf-8?B?YUozMUpXQlllbmhQUVRpbE9uNXFjRlVzTEJyeHVNK0tjSncrbCtLMEE0UHln?=
 =?utf-8?B?anVaMG85bEZidk04ZFRrYmJadTQ0U3pYdDBQVHVlQnJnWmJCR3NHVGQ2N3hT?=
 =?utf-8?B?c2pFREROU3NmYlFvVUZPOGcyMDZmcVlSUUJ2bzBONnBKVk5RTHVEK2hXY0t3?=
 =?utf-8?B?NUxFWXo1Rkx2eUtKS3pwcVFXbFZNNjFkWWwwM2F2SHRZazFIdlcwelZ0emhl?=
 =?utf-8?B?TXc0aWlPUkYwRUIxQWx6dWl3b3ByNVZDbXVzOGoxZk93YUg0YjNYSjdVb2dY?=
 =?utf-8?B?dkgxQk9JNHBuMXNXSVpGMFhSb1BHR1FuSHJSdWJFUS9uclY2WWtMcnZZOHZJ?=
 =?utf-8?B?dFkzZG4vNk9uQks2bGdpSlY5WkIrUW91YVFxcmJtNDl5cDhoMW1iaStyUTdI?=
 =?utf-8?B?bUR0aWRnSEE2YmpWZlVLS0llNFluWUpFQzk5bDNyWjdiKzVKREM5SU9CcHk0?=
 =?utf-8?B?QW5oN3pvYnlDZEZlcFNJMUU0cG5qVi83UStuWW9SM1ZHZldPYytnaGxyRThn?=
 =?utf-8?B?eU1qVEVFeWFlUjUrNU9vVHhhNDVDYjNGdkh1RzlzUXV3c2pyU01TWkdXTFl0?=
 =?utf-8?B?S0lEZk5Gdk9CR3BMMEI5eUlmN040R1NZZ0Yyd0dqRC9YYVVGbGhYWWJtZlg4?=
 =?utf-8?B?bVJLdnh3NTFkdncrSWdmR3daMDZqS3F2OFdoYlF5ZENockxHRlI1cXhEK0Yr?=
 =?utf-8?B?amNyL04rRzdTOUVBSEdpb0xHNVFrNHFyUW9XRWJyZEJKOTVBY2Q5SGxDS2xh?=
 =?utf-8?B?TkcwRjZNS3ZDZEhCOXlBUTVybXJuQXBUbFhvbHNIQWZyd2NNdGhsV2FuL25P?=
 =?utf-8?B?cHhhMHpzbnBJbGtQZTBCTzFPOE1PNXI0bjVWR3JVbVY3aTExaVFueVpiUkNL?=
 =?utf-8?B?TDJ2YkpVWmdsSytPODY1WWh5ajNrek5RblJpRnpYZFNjaG9rWmU5aHBVUXhv?=
 =?utf-8?B?eHhPZjZUTTV5UXE2SHJ1aWk1Q3p0SDNEY256MGZ6dFpKbDNZb1FIajBVdkIr?=
 =?utf-8?B?QlZZSDRvdWRoL2F1RVFDNW5CcTgrQ2laU0xVQlN4dTNmSUlJenpXWlhwQzRi?=
 =?utf-8?B?aW1QZU1ENVVDdFZ6RHV4c3BjSGJIV1FvejdWK2g2Z2E1VFZ3d2doL3ZySGR6?=
 =?utf-8?B?T01GSVFBbElVOXV3M0NIV1VwcEsxK3ByV2FqQWdSUnJDbEwrUHJKTWFYUXJx?=
 =?utf-8?B?QWR6Si9GZHIvOHQ2NFRhK0Jsa3N6eGdjOUR0aW1tb3dMdHdOWU9iOU1yV0dy?=
 =?utf-8?B?S3Zkcy9xdStKbnJsY09MNzIrb2xoQkRCQXdOcDRVRjZxOG1manFBRGlYMGIx?=
 =?utf-8?Q?t2pklkDjilG4MQg2A4Ut4r4z2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69479B5B1810E0468DE93D14FE2E7E38@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8148cf57-eb27-4908-e825-08da5ebd0541
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 19:31:55.6225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rBtdMyKTGNL3J58cfFEXviOGdyNmwjFxtIzCIzQ3LvUQaxJoFT1/nWowV17NIfOUYd9s47Pd3JA4+G1jJhfseC2kfoYYXBqGOvdNAH1d2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2074
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, sam@ravnborg.org,
 damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 palmer@rivosinc.com, paul.walmsley@sifive.com, dillon.minfei@gmail.com,
 lgirdwood@gmail.com, fancer.lancer@gmail.com, vkoul@kernel.org,
 palmer@dabbelt.com, daniel@ffwll.ch, dmaengine@vger.kernel.org,
 masahiroy@kernel.org
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

DQoNCk9uIDA1LzA3LzIwMjIgMjA6MjgsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3Rl
Og0KPiANCj4gDQo+IE9uIDA1LzA3LzIwMjIgMjA6MjMsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPj4g
T24gRnJpLCBKdWwgMDEsIDIwMjIgYXQgMDg6MjI6NTFQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOg0KPj4+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
DQo+Pj4NCj4+PiBUaGUgazIxMCBVLUJvb3QgcG9ydCBoYXMgYmVlbiB1c2luZyB0aGUgY2xvY2tz
IGRlZmluZWQgaW4gdGhlDQo+Pj4gZGV2aWNldHJlZSB0byBicmluZyB1cCB0aGUgYm9hcmQncyBT
UkFNLCBidXQgdGhpcyB2aW9sYXRlcyB0aGUNCj4+PiBkdC1zY2hlbWEuIEFzIHN1Y2gsIG1vdmUg
dGhlIGNsb2NrcyB0byBhIGRlZGljYXRlZCBub2RlIHdpdGgNCj4+PiB0aGUgc2FtZSBjb21wYXRp
YmxlIHN0cmluZyAmIGRvY3VtZW50IGl0Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+PiAtLS0NCj4+PiAgLi4uL21l
bW9yeS1jb250cm9sbGVycy9jYW5hYW4sazIxMC1zcmFtLnlhbWwgIHwgNTIgKysrKysrKysrKysr
KysrKysrKw0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQ0KPj4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1j
b250cm9sbGVycy9jYW5hYW4sazIxMC1zcmFtLnlhbWwNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2NhbmFh
bixrMjEwLXNyYW0ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1v
cnktY29udHJvbGxlcnMvY2FuYWFuLGsyMTAtc3JhbS55YW1sDQo+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjgyYmUzMjc1NzcxMw0KPj4+IC0tLSAvZGV2
L251bGwNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5
LWNvbnRyb2xsZXJzL2NhbmFhbixrMjEwLXNyYW0ueWFtbA0KPj4+IEBAIC0wLDAgKzEsNTIgQEAN
Cj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpDQo+Pj4gKyVZQU1MIDEuMg0KPj4+ICstLS0NCj4+PiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMvY2FuYWFuLGsyMTAtc3JhbS55YW1s
Iw0KPj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUu
eWFtbCMNCj4+PiArDQo+Pj4gK3RpdGxlOiBDYW5hYW4gSzIxMCBTUkFNIG1lbW9yeSBjb250cm9s
bGVyDQo+Pj4gKw0KPj4+ICtkZXNjcmlwdGlvbjogfA0KPj4NCj4+IERvbid0IG5lZWQgJ3wnLg0K
Pj4NCj4+PiArICBUaGUgQ2FuYWFuIEsyMTAgU1JBTSBtZW1vcnkgY29udHJvbGxlciBpcyBpbml0
aWFsaXNlZCBhbmQgcHJvZ3JhbW1lZCBieQ0KPj4+ICsgIGZpcm13YXJlLCBidXQgYW4gT1MgbWln
aHQgd2FudCB0byByZWFkIGl0cyByZWdpc3RlcnMgZm9yIGVycm9yIHJlcG9ydGluZw0KPj4+ICsg
IHB1cnBvc2VzIGFuZCB0byBsZWFybiBhYm91dCB0aGUgRFJBTSB0b3BvbG9neS4NCj4+DQo+PiBI
b3cgdGhlIE9TIGdvaW5nIHRvIGRvIHRoYXQ/IFlvdSBkb24ndCBoYXZlIGFueSB3YXkgZGVmaW5l
ZCB0byBhY2Nlc3MgDQo+PiB0aGUgcmVnaXN0ZXJzLg0KPiANCj4gRXVnaCwgY29weSBwYXN0ZS4g
SSdsbCByZXBocmFzZSBpbiB0aGUgcmVzcGluLiBJdCBzaG91bGQgYmUgImluaXRpYWxpc2VkIGJ5
DQo+IGZpcm13YXJlLiIgVGhlcmUgYXJlIG5vIHJlZ2lzdGVycywgb25seSBjbG9ja3MuDQoNCnMv
ZmlybXdhcmUvYm9vdGxvYWRlcg0KDQo+IA0KPj4NCj4+IEFsc28sIHdoZXJlIGlzIHRoZSBTUkFN
IGFkZHJlc3MgaXRzZWxmIGRlZmluZWQ/DQo+IA0KPiBUaGUgYWN0dWFsIHNyYW0gaXMgaW4gdGhl
IG1lbW9yeSBub2RlLg0KPiANCj4+DQo+Pj4gKw0KPj4+ICttYWludGFpbmVyczoNCj4+PiArICAt
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4NCj4+PiArDQo+Pj4gK3Byb3BlcnRpZXM6
DQo+Pj4gKyAgY29tcGF0aWJsZToNCj4+PiArICAgIGVudW06DQo+Pj4gKyAgICAgIC0gY2FuYWFu
LGsyMTAtc3JhbQ0KPj4+ICsNCj4+PiArICBjbG9ja3M6DQo+Pj4gKyAgICBtaW5JdGVtczogMQ0K
Pj4+ICsgICAgaXRlbXM6DQo+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IHNyYW0wIGNsb2NrDQo+
Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IHNyYW0xIGNsb2NrDQo+Pj4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IGFpc3JhbSBjbG9jaw0KPj4+ICsNCj4+PiArICBjbG9jay1uYW1lczoNCj4+PiArICAg
IG1pbkl0ZW1zOiAxDQo+Pj4gKyAgICBpdGVtczoNCj4+PiArICAgICAgLSBjb25zdDogc3JhbTAN
Cj4+PiArICAgICAgLSBjb25zdDogc3JhbTENCj4+PiArICAgICAgLSBjb25zdDogYWlzcmFtDQo+
Pj4gKw0KPj4+ICtyZXF1aXJlZDoNCj4+PiArICAtIGNvbXBhdGlibGUNCj4+PiArICAtIGNsb2Nr
cw0KPj4+ICsgIC0gY2xvY2stbmFtZXMNCj4+PiArDQo+Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQ0KPj4+ICsNCj4+PiArZXhhbXBsZXM6DQo+Pj4gKyAgLSB8DQo+Pj4gKyAgICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svazIxMC1jbGsuaD4NCj4+PiArICAgIG1lbW9yeS1jb250
cm9sbGVyIHsNCj4+PiArICAgICAgICBjb21wYXRpYmxlID0gImNhbmFhbixrMjEwLXNyYW0iOw0K
Pj4+ICsgICAgICAgIGNsb2NrcyA9IDwmc3lzY2xrIEsyMTBfQ0xLX1NSQU0wPiwNCj4+PiArICAg
ICAgICAgICAgICAgICA8JnN5c2NsayBLMjEwX0NMS19TUkFNMT4sDQo+Pj4gKyAgICAgICAgICAg
ICAgICAgPCZzeXNjbGsgSzIxMF9DTEtfQUk+Ow0KPj4+ICsgICAgICAgIGNsb2NrLW5hbWVzID0g
InNyYW0wIiwgInNyYW0xIiwgImFpc3JhbSI7DQo+Pj4gKyAgICB9Ow0KPj4+IC0tIA0KPj4+IDIu
MzcuMA0KPj4+DQo+Pj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0DQo+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdg0K
