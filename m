Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB8B6BCDAB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:12:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 447371134;
	Thu, 16 Mar 2023 12:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 447371134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965142;
	bh=ZiKrYZH9Tcd7DXSKGvcrD/3a/B6IOujHfpPzjn6JUms=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=sHX5sv5npkMCmMg04wpno1HxwcgesdLOpIB6pbTWPcYr7DWxMSgPvM308Z+MRVFx9
	 0dzZwigbagSBIUbBUpa51qj1riytrJLac44OpVU75Td3rxsCH132lP46NH6vmwXGAk
	 xOctxixTCb/BwbIl4X/ycoj2ZjnWXtsw7onn6GDU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 748A2F8055B;
	Thu, 16 Mar 2023 12:10:18 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 028/173] ASoC: atmel: mchp-spdifrx: Convert to platform
 remove callback returning void
Date: Thu, 16 Mar 2023 11:10:04 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-29-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-29-u.kleine-koenig@pengutronix.de>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIG23R457FC6ZK5YDY5ZOQNYPMQDIIJ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896501711.26.3471381122088641609@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69F26F8055C; Thu, 16 Mar 2023 12:10:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDDFCF8055A
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDDFCF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=DtoIYJ9p;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=VVZPO7Cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678965012; x=1710501012;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fZEbEN5OJ5EahyTkda2sHKn0QCqb7MxdZ5tSLTmc89g=;
  b=DtoIYJ9penRlb3QOdDlCiK19i8vvlzMhNa+OGyxO3lf2e/Plowo0n6iP
   eoiWuFdZjVv4lXJQYYUs65qJ/SeYAEdC09I7C0JYWDYcl46GW4bINGXgA
   g5tPvajC5C8YtqkLPP1RGzd/jIEmDCdoVa+9NRl88JYdDXIKBjudtAjTL
   IY4Pl7AW31oGxyKNOZv31tx8aVnIx+LwrKSmgW0t34At0ePP3dEZdbnev
   6iNoPU7Cd/hqeOfHYKZGa5cRS7d6qEkfsr2ivgx6gHfsw1GxEymlYbSQP
   mKUEpjmqymjMINayo9Eg891vDaOA5ZOSi/cViQW8Ce3iUl/v5UXZ9RsEa
   g==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="142358279"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:10:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:10:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 04:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTL+VIflAZ+hBWVsm2qVeelQ+guTTkiaYXVuEIfR1S18jofoc90+HTyY/4s5UOKtANwtN9+J/bdIt7wgeQxHrLT7oVseEbFz4nZyXdpTx2EDZ51Mm1MpFOxwD6IvG+Nytrf9StHdx5hY0m2cxL51mPE5EH48tGkmuQusmLMq2ODhnMFkgtctQROXYIsAbZ815+nGaw1kiXjnUIdr29eYDBdMmUj3VYvVsMzPjR5lZ8KVfXJPL2WEHyfKxudgyz1uW1lZzOOMWOKUasoNVNAy/xH19YCoFCuc+fzZbRM86gMDMF/4BjTxAE7KMv59jddO42zw4TOuwRx9F+d9IDjeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZEbEN5OJ5EahyTkda2sHKn0QCqb7MxdZ5tSLTmc89g=;
 b=H5F/M+9slkEpPKbr2oKeI5S4CWMJHwV2AIY2Cc6qLVvBIMQATWuXYK4Z2TToQraOr8xbqM1uqjrYJElW8wwkLuYSa/JT+A80aGDrRup9ep1k6tEOEFGIP1H145I421bCpns89FdKnZzBmLojaL1M3vVZnIqYiRO52NQ8ISg4XtHJkwdFJFfizcgYmjE5/ycLo3faNDtgPSvNrJ4rpaaNp1NCSIfMG+jmK67+g/4ZBN6X7kiGwJvUdfySpTHs5r3gZ5IZetdntEmGDR5vQzJJg9VMbFJzrzW1GNNOeuR5RKAIDLy4kXuBxfZKhLuGL6cs7J6J3F21fGmBRfg5J7m8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZEbEN5OJ5EahyTkda2sHKn0QCqb7MxdZ5tSLTmc89g=;
 b=VVZPO7CcQ40UyPc2h5c6rVRT8PqQ9R7xYtaHHetTE+959UYPyAD0IJWmJChgkwTGa4OQ0/i/XK0Un/IHp634buTDcKWgCEHiF1JXUXdeJmUTZwEeDsPKJ1KzVl+YpO154wtEgF2pQby7KV5UdpwwC1fISGXGpmLrxZHXRDPG324=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:10:05 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:10:04 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 028/173] ASoC: atmel: mchp-spdifrx: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 028/173] ASoC: atmel: mchp-spdifrx: Convert to platform
 remove callback returning void
Thread-Index: AQHZV/fc2igSlQZ+gkShLab2bS8yjg==
Date: Thu, 16 Mar 2023 11:10:04 +0000
Message-ID: <9f1a2f71-5c16-8551-af24-bc46c4f29fe9@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-29-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-29-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|DM6PR11MB4595:EE_
x-ms-office365-filtering-correlation-id: 6e7e78d0-8d74-4ab9-1f84-08db260efec0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OL6owONp8nEXPcsiUJWv7J2bAyJKl/+XR3ansi7x3MJvx3b5x6Sx5l7+BKAIRy8KzbkIZjkseZ6jWimDMo3U8f1mi2f3HjXL39SI38x6SHETPnrTuZqCRi3oemT6ezgOL+km9Yabp0Hqkajz/1i9yzFaeCEbd5y0qxUgQg9MlIV/HE66FT9T9NvDdotoKy/W/m6tHCf8Gpxq0vrHgutacSZjBv7VVs5azVqyI9rEyOlNrG+Lf4gIfSarWUfVukQfQ6ts4YX5fggzPAGNpsYhtPV5WdK5SJToxHKMadDOgsZh6PaBqsFjIV9AjzbBxgA+aQxrtEmsccvuW1zgq1iynJnVkrSsqxw+kISA5zlRIhtzReBJEMgUwmyy7mN4OADiJtl0T5qOHc6YqqnLvdjmqU0gsaIN43q0DclCfoaDwC/nSey/Ab9TNJXPZD/HpI7maVFQpCMnsg3tHG6qbwpljpN4YukeOay6X5weImkSHy2LynNm4CMs97H2hCUdbAH3G9nN5MBLKwmlWK8EEDYxD6lh8osU3whZ212zl7dqHqLf0KR1Ad19oUlDVa5DIoXx0XUGK/cXh/UhkIOvyn8iCxYIqI+80g+83gn3C9zdkcmbSfQva8pemkBpxU5hj//VphA20pj3kTUaWxoxDLUsUdTxJsOkMo/stq4F1PBHx2kgE+R6l9jjXAzakhOCUZ/1/3AuKkXh9rsZ8HF0rXqMHHjwEsXgA4e9LTzvsdVo+3C4tK6VbOsg6VS9ay9jJiWh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(38070700005)(31696002)(36756003)(122000001)(86362001)(71200400001)(66946007)(66556008)(66446008)(76116006)(66476007)(6486002)(91956017)(966005)(64756008)(110136005)(8676002)(4326008)(2616005)(478600001)(6512007)(83380400001)(26005)(6506007)(54906003)(66574015)(316002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K1lQWjVQdHhXbE11TlI5R0dBYTd1OE8xcWNMNllBcldMK2pzMzhYV1dyeDQ2?=
 =?utf-8?B?bk9zTFp2WFp4SFdnR2xtRFMyOXVycDkwSzFBamdHbjYxa0wwRkVGdm5lVmhv?=
 =?utf-8?B?Y1pLVGF5RHhKZ2NIbU9CSThVclNWT0RQNnRLRnE0eTdBL3VvWitaamZ4MkNF?=
 =?utf-8?B?dG5wbC8wUUhxUzNLQkxKWmhvY1FSQTUzV21wdzVBRk04NkJYb1lwcys4SGFs?=
 =?utf-8?B?R0dQYmh6V3hldnlVNWF0NDRlV08rWklsbEIvUGIvRDMrWlg3L0dQcm9mQ0dL?=
 =?utf-8?B?dGVWYkRtV0d6T29HSEI2OXc3N25LK2xlT2J3UHZ4MWl3NktZbFBNWEZNeDU3?=
 =?utf-8?B?NzVMZW9LTVd1Z2txc0krTzgreExjRWlZNkRkU0NKY1JPUStUaDJQVDg2Qkov?=
 =?utf-8?B?TTd6YjM5VGlaSERpdHlrdXd5Vy8wZkRSYUFPMWFjeTVOZFpyU3RYS2t1VzZR?=
 =?utf-8?B?RE1DUUN4ZWQ4MEFxRy9RUE5BNkp1UkpRVGlZTjNxVWozRWdXeHdMOXFiZXZ6?=
 =?utf-8?B?R1NZbW5YU1pVc2JTVjVidXFGRk1XRlNpcWJueHljMXVLY0E3VHgwdys3bmlx?=
 =?utf-8?B?b2xJRWhPeURTVzJHSW9vZWFST25XVk9xd1RFOG81UVVQQVdMMkJjNlhlbWNq?=
 =?utf-8?B?YU5CekFvZ3E3N1czUXBDUWxVUlB5MUFvdnN4MUdoQUFSQ0NNWmpSeSs1ZVNV?=
 =?utf-8?B?QzZwQld0bXl4dmg5ZTdIdVBjTWNDaWYwSmJjRWc3dkI0aWN6WW5NTXJlWWJS?=
 =?utf-8?B?QnFiYVAxa1Q0cjRvTFh3Z1lpNzl0NHJtS3lnTzdVNmFwQXUwTXM4NklFajRP?=
 =?utf-8?B?WkRLY09aNjhZejE1dzR0NkVFV01wN2JLOFR4VVJ3a3hOQ2NzNVdrRmIxR1NC?=
 =?utf-8?B?RnJ4NVhXb1lFM0ZOdXFOZmFVeGZ5akpVTmVBUlRMVUdMbTg1OXB5ZnlzNWJ6?=
 =?utf-8?B?TXJPZVJIUHN0SFVXSVY5OUJ5dG43cjZkOEgzb0JwMkc2NWF2a0M0MVFRa0dS?=
 =?utf-8?B?TmhtaitzNXBCak1ib0lLNVViTFgxY1VuLzBOa1hUcDljMXVSN1dnT0k1LzRE?=
 =?utf-8?B?cm12d0hDL1JYbHg5WHhVclplL1NPN0VQVHpsUGl4cFlHaERLMGQ5L2JUYjRL?=
 =?utf-8?B?WlhLRm5oN2J1V0diTkM0cUZLbVFab1NQdmNTZDdBYi9TOTdHWCtCY0dZV1Qz?=
 =?utf-8?B?bkRuUmlNQU9Rb01BMnhSTTdQdjJ2UzNRVHlCamtYNS9wdDh6dGREbXVrTDEv?=
 =?utf-8?B?NGdWTDBKazBOeXVrRWhVTko1WVlDNEtCZzFMK25TdWpYOTVpL3FndHVSUnVW?=
 =?utf-8?B?T24rcFdyQjNubThXVDd2VXRVOW9CekZ1S2RZazlKYjVhMWFPUGpoSkttZWZS?=
 =?utf-8?B?V0h1c3VWZHBkdW9KRHJ2c2hxcU1jbXdYM2ZHNXM2L3J6Ni9MZFBmTzVnamVk?=
 =?utf-8?B?WmxwUmdJVzhWUTRGOGRLbEN5TXJEcVNUb3VMRXFKeGVLZCtLKzlNWmlnRzF3?=
 =?utf-8?B?MEVMMTN6Y2I4czk0SEcvUURZNG1FV0czSzVwYlUrZ0tFb1JvOUxlTVpoak1k?=
 =?utf-8?B?cmlTaThPNlAydU9XOU9QR1RRSFA5TGtkclMxM0YyYmY2cFJ3Vmxzd0R2OUE1?=
 =?utf-8?B?NklWT0Z6WWxFNEljdnMxVTEvZ01NWW1EUTQ2anp1WFlZSFFVS1NHVDZaYnZi?=
 =?utf-8?B?Tk5uL1RzaWRMMmtpRklyT0hjcnhDNkVmRFNaVkpJckN3R0FITFFITnpJcURZ?=
 =?utf-8?B?S244RjFnUzJlZDZ0MzlwQ3U5RkFWdFJzbjFGeTVnZDBlNE8yVlpBMjZSOXVD?=
 =?utf-8?B?L09qUVg0eDd1dmJsWFpjeTAzMFAyRjJRRDBvL054N2p4d2JOKzc0bDZNNTU0?=
 =?utf-8?B?emxBV1h2RDRXM0VHT3gwWkhpZG9Lcm9EM0VCVFBLV0prODhsN3Q1ZUhFQzdl?=
 =?utf-8?B?S0FpbDFNejhSWFlMdEMyNnRRUkNFUTNEWDVhaHRDZHZWSGNtT2J3NGV6OFhF?=
 =?utf-8?B?dHNOVDhsMUlMSWFGQUJ0MHBRMVh4QXlieC9rTzVWMmtYQVBXd2ZtV2tEaTlV?=
 =?utf-8?B?dSs0c2NIVG5EMnZNanFwQlFWSTk4VXh2enIwTkh6YnlrNk51NG9HcXo5bzBK?=
 =?utf-8?B?a243OGh3N21OdWdRTEtKQXBEL3AwYStnRUQweU8vbTdCbUppOHVrNFZFK3J1?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E739749D239B6747BE28A66FBE9F4A2C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e7e78d0-8d74-4ab9-1f84-08db260efec0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:10:04.7833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 tAgirqEipuk7Oh/x4EpHoxaHJz+iivtwxfh7uK2COS+IACBz9DNLEY9B2/OVgXcdwIXHAs6fo8H3AvQ7BM7cJ2rXmdeLhs0MlUMeQVTdZjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
Message-ID-Hash: XIG23R457FC6ZK5YDY5ZOQNYPMQDIIJ2
X-Message-ID-Hash: XIG23R457FC6ZK5YDY5ZOQNYPMQDIIJ2
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIG23R457FC6ZK5YDY5ZOQNYPMQDIIJ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMTUuMDMuMjAyMyAxNzowNSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBm
b3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMNCj4gbWFueSBk
cml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhh
bmRsaW5nIGJ5DQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1ZSBy
ZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkDQo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRz
IGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQ0KPiBxdWVzdCB0
byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVw
IG9mIHRoaXMNCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucw0KPiB2b2lkLg0KPiANCj4gVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQ0K
PiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlw
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2F0bWVsL21jaHAtc3BkaWZyeC5jIHwgNiAr
Ky0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL21jaHAtc3BkaWZyeC5jIGIvc291
bmQvc29jL2F0bWVsL21jaHAtc3BkaWZyeC5jDQo+IGluZGV4IGViMGMwZWY0NTQxZS4uZmY2YWJh
MTQzYWVlIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvbWNocC1zcGRpZnJ4LmMNCj4g
KysrIGIvc291bmQvc29jL2F0bWVsL21jaHAtc3BkaWZyeC5jDQo+IEBAIC0xMTgzLDIwICsxMTgz
LDE4IEBAIHN0YXRpYyBpbnQgbWNocF9zcGRpZnJ4X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICAgICAgICAgcmV0dXJuIGVycjsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50
IG1jaHBfc3BkaWZyeF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3N0
YXRpYyB2b2lkIG1jaHBfc3BkaWZyeF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgbWNocF9zcGRpZnJ4X2RldiAqZGV2ID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEocGRldik7DQo+IA0KPiAgICAgICAgIHBtX3J1bnRpbWVfZGlzYWJsZShk
ZXYtPmRldik7DQo+ICAgICAgICAgaWYgKCFwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQoZGV2
LT5kZXYpKQ0KPiAgICAgICAgICAgICAgICAgbWNocF9zcGRpZnJ4X3J1bnRpbWVfc3VzcGVuZChk
ZXYtPmRldik7DQo+IC0NCj4gLSAgICAgICByZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBtY2hwX3NwZGlmcnhfZHJpdmVyID0gew0KPiAgICAgICAg
IC5wcm9iZSAgPSBtY2hwX3NwZGlmcnhfcHJvYmUsDQo+IC0gICAgICAgLnJlbW92ZSA9IG1jaHBf
c3BkaWZyeF9yZW1vdmUsDQo+ICsgICAgICAgLnJlbW92ZV9uZXcgPSBtY2hwX3NwZGlmcnhfcmVt
b3ZlLA0KPiAgICAgICAgIC5kcml2ZXIgPSB7DQo+ICAgICAgICAgICAgICAgICAubmFtZSAgID0g
Im1jaHBfc3BkaWZyeCIsDQo+ICAgICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9t
YXRjaF9wdHIobWNocF9zcGRpZnJ4X2R0X2lkcyksDQo+IC0tDQo+IDIuMzkuMg0KPiANCj4gDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGxpbnV4
LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwNCg0K
