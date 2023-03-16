Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 760636BCDA0
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:10:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66A461124;
	Thu, 16 Mar 2023 12:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66A461124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965046;
	bh=7kuDfc6w4Ukfr+vBoj8ZGW0a+xLj+5+SkP/p2tN2Xp4=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=j+KlHanX7MVJv0hNN79s+5zNHTRfgKQAn7ZR+v8/0mPPwB9GU/iyILTZBHKXl0dKA
	 RuSclxMcXoFmToBySNv7fndc4YZ16E6J9g9MBk6mPGpPqdyIpaFOcQnNucPFM6iXlm
	 tm/T2rMyeVYAwxYyrfj/Qp1vD0l3+P/uweVn/7xo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AADB1F800C9;
	Thu, 16 Mar 2023 12:09:55 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 024/173] ASoC: atmel: atmel-i2s: Convert to platform
 remove callback returning void
Date: Thu, 16 Mar 2023 11:09:24 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-25-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-25-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITU2PT6EQPXW3SH43UU7FJ7TIJYRB5OR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896499508.26.1694994703753056530@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41904F80425; Thu, 16 Mar 2023 12:09:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F1FAF8016C
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F1FAF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=FJtMtfZP;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=sPLL2b7h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678964981; x=1710500981;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ajSzSPLIcyr5kZzsvyCzgyXCqIL0lPsvnEO/DGsY7CQ=;
  b=FJtMtfZP6jWgOP4PRwPNS5JvT+3G3y5t+1PzlAJvm3iHIEeBs61vdu5q
   QLBZBKDgWNVyL/zn6LOpCBvfnXGFuow1y3qMtfcu75SFy3AqZ9hTiIU+8
   wmnK0jPa4PMjn6XZcR6MeRV0A/M4J/sHaN58Rw0gwKvlxc5z/An7+icqq
   +T5yEe22+S0by5J6UsWUCtAP3Ra8Yf/m+AOG2Fdqxf6sCy/0wEh2wvc5o
   WJKrqb+zIJvxyTACsZ4SyyMVmVj7UEQIBV7vq7/p/aZUKaRr9Oz2xn0at
   Dr0GH+00xop+UMMjnWzGrj3HW+/QhmlDGGgsLVQWEHkGLr/Les4dZoAqv
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="205027019"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:09:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:09:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 16 Mar 2023 04:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQPz/G8r//1egE79CU5Y2h+qhgx+lMujOKTnw2PRIWhQgvCHu5DW2jI2/diHhDsw84IBJvj8vTySg0w9hphrb247zKCr+c91f719ujUzhzUr3A34WpLLncQLQxFTnNYf80kC+9iL9nWJxFoA32wJCeVJucEOv5wf4rQxqbAWPiDUninMDd7cQvZ39DkavmaGVr2YHzzgyETBgSZAU8KzfNf89SDYKrHIjEfI3UYBYOdA4tT2L3h2lKOf96bix1qIRJls/wZe7m3aTIKUOoQqS8hLFRWJjrUJuH1M1fyAt28bMLezuw8kBD8SpqBEMw3xkrK+yQcDIRkqSR9QB56oiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajSzSPLIcyr5kZzsvyCzgyXCqIL0lPsvnEO/DGsY7CQ=;
 b=brmSEn6E7wdROMmvjFuc9mOsCV/EamhkX+IiL5hJl69up4jQt6tt8SBEj4XIZ3kkWqCNc5yh6qQZ6K9B1e3F+JSFS8KcZlkOh3TX/jJimQwu5z/f1hl4MRx+5yWozqhpo/WGHho44Rl2b9Q1QKmeOjb1qCG13tQAZZ1ZDMyWIatSOulDOv70sRU/CGFg18Lhho1W/ofBGd47SLoLJ00Zz1HRcegLgP7YNV0RQv+5Uf53tFq2Q7gqBj5LKZ/yQWUlSzdWevyvLb8z2w6N/0PRa1SpyaaCj8Fk6xOgBUf7r5ZW9A27TczzkluRq8671SjIbqOKY89hT78TY5dosOVkiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajSzSPLIcyr5kZzsvyCzgyXCqIL0lPsvnEO/DGsY7CQ=;
 b=sPLL2b7hZs2F0vWSMiiwpuz4XXHOu3UbsmOJdH0++UdjLcfFz2O4BHO8TTMB/BaBoPdxOKwxCCQ5gPSRHgl5xqWF/+1j5l06PjZ+2URnPR2kB99uwNwasE5IVHcz231Ne5jkfCLD9CGhwaTs8ce2fXancLkXtig703Awzka6dNk=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:09:24 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:09:24 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 024/173] ASoC: atmel: atmel-i2s: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 024/173] ASoC: atmel: atmel-i2s: Convert to platform
 remove callback returning void
Thread-Index: AQHZV/fD5WyPRBkwLEaKbp6DFFPe0A==
Date: Thu, 16 Mar 2023 11:09:24 +0000
Message-ID: <0e431237-1d32-9d64-fa14-ce905a8f850d@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-25-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-25-u.kleine-koenig@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: c18b0ff0-f72b-476c-d9b5-08db260ee6c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u+NUZxTCCoiot7x4ybncyPzrlEdaFY2w8qbVKe/Xd5ZAzvNNvayFphOw6kSDhEs7J70JYwCMvFno19iiLQ2W92U52Tmd/tNOTen+6kUjA6R78W0BBBlO7inY7ZqMIG55speRZAhTZroSaLphPDGyabrPVwFx7hywaql76d9uhD5hkB3ynnjixfI9LWmIibubX3x0FkaeiNJM46Z0PNw/eifFtnFknU4aVbvU9vUMk/aFuFbGgDT2/SpsCu+VVJrnnHGGnaCwAhctNWR/eEcH3uAq/WXjNc/BFnTU5HdtXNz8L1hg/gCFN/GNg/Vs0nrsnO0IiraWK6SxzyP7McUvqUltf7eqqT89Qf6j8lawiGHTT6sWHn9AxtPumApRC7I/ZAUnQeqJU0KP8k6eFv3XdJRZ5LhZ2+7m4zBa/QfW21yd00/0u/Jh40w83FeaXztvyLVjIUhnngNNiARAIsZ0+eLqcltGKylDw8uqbpwsb8CP+vgA+Dw0eutu5c3VerD4vBrq+IMHq8JVjszRoioOY9JHALfCwO4Ut6oLVQMRp1fSPDcszJIT8denQx5xy+0J0oEpU+ipuH3+FbEahqElDDBDgr0zELlXFDLh+w1kqd0Gyo+V19y9X5TyL72YUTQUrlfFON+a6chBETyQHRSbjt/hGPqpgnkBhAOXAi4RV5UbsrIE+gu16VQ664f75QDqKiXgKnLYRkZL+ATUrMxQ9OW0H8gg4D5l9wKc4oZDUDLRdIqsIKK0GJafMUCuJ9D6d4PJOjmCzgL80dDCo4kfZA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(38070700005)(31696002)(36756003)(122000001)(86362001)(71200400001)(66946007)(66556008)(66446008)(76116006)(66476007)(6486002)(91956017)(64756008)(110136005)(8676002)(4326008)(2616005)(478600001)(6512007)(83380400001)(26005)(6506007)(54906003)(316002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Wm1kc3ZWRVhybitnNklWOHFMTWVyc2tHTzF1aldJTk5nN1F2YjYxSmJwMTZM?=
 =?utf-8?B?czZaaUQxN01WUmJCOUNRWER5OVkzYW9pRW1pdC81MjFjbVl5RG5Uamtrdktw?=
 =?utf-8?B?OHAva202NWVKdlNjbklkaExWc2tCZGNGTEZwNElIaC9KNVlKWlNTa3ozY3hC?=
 =?utf-8?B?Tkl5aWhSN3d5YzIzSW1Ga2xVdjZWc2o1UUIzQWpRbCsyTWlNMVYyMGh0cGtD?=
 =?utf-8?B?UzF6WTVhYnU5bjUxQkF6MHMzdHFyVzRiTTVMeGZEOGRTdGExeVJ5Mm84aXJW?=
 =?utf-8?B?MjFFY1BtZklXeXpobTNJandURXhSTzQ2S0RvaUJ2RE9Fd3VqbEs3Z2N3Q1E0?=
 =?utf-8?B?cDMraGlNRWpQdjNKM2NMbFYvQkpqTXZ4Mi8vNEhqcjVMUlRCRjdIMVFmb3JQ?=
 =?utf-8?B?bHRiZFZQOTlwcVV5bkc2bUJXdXM3MFZsLzFncFZUVk1mQXcyMU56T1JldG1D?=
 =?utf-8?B?VVlQRlUwVE9aK0UrV0pnOTJrbkVxK3hCNjB6UVdpa3RVWHV2WmlDYjVqYzRF?=
 =?utf-8?B?bDVxSTRuUEt5dCtSMGowUTllK3dqR1Q4MTd6d2pMK3d4bzdMSVVFL3pTWGhU?=
 =?utf-8?B?YjA3eEk3SEZNM2gwbkVKWGUzbyt4dmxSeXZnTnFmenpsaHJMUEtoS0hPRm1T?=
 =?utf-8?B?M0R0djAxeVpTR0ZDVzY3QmJFT1pWWjFhQXlqK3pZQ1ZvZCtKdGx4NktiZ0k0?=
 =?utf-8?B?U1RObGo3YVV0VkM0N2ozWnNUSGJkUzYzUXBTRDlLcjBWU0d5QnZzRFIxd0ow?=
 =?utf-8?B?cEFwNHdselk1QnpjS1U2dVpBUVRqU0R4bnhReEp6R2M1WitFZG5meWwrYUtH?=
 =?utf-8?B?OTNxMVBvTzdTQmtLa1JySG84d09Na1FUQ1NBQUp1UUZPWDQvb0RBWVlCOThn?=
 =?utf-8?B?TkpXd0RMS0xnYnBOS2h6citOK1p3ZVlETjhndWpQRERHZytZN1cwWG8xZUtZ?=
 =?utf-8?B?M3B1dmhOUnlETEwwVjJNV1Z6cXlVRHdUK1dETWxXcUQvUTVCMGM3ZjlIM2Rp?=
 =?utf-8?B?eGtSbTRZRkNIL2lpTjloZ1JLTkZlcytCL1pwN3I2N3hvTllRdk53Z2VPeVFS?=
 =?utf-8?B?L2d3dG9ta2ZJOW5BSkRQeFZiaVN4RGZ6OVh3YllQSlV1THJBRTBNNERzN3Zo?=
 =?utf-8?B?N2JodHk2bkhWc0tFMGNDTnlNWkI2dCtXVHhMQzlRbTdnR0U0ZTI0MkdFS0lp?=
 =?utf-8?B?MEJJeWxocCt1cGVoMUNRNWFLa1NCejFwZ0lGdVAxaFNYVzRaZE1ScVlvVjZO?=
 =?utf-8?B?REZSRFNyb1FtVEhBeFRqVXNrVzFPdXpPVG1UZS9kWjQ3cXgyRndDMjVPb2hl?=
 =?utf-8?B?SmN5ZHFPdGFST0NaN1g3QlB5ZTg5U3dyaFZUNUxiRlFoN1ZuUVZQcDRzU1dF?=
 =?utf-8?B?U0w0QkZ5RFU0UjZZMmM4bW9KUURiUmxNNm5hRlRlTzRVeXYrK29Xc1p4K2ZY?=
 =?utf-8?B?OXN5RW9pQW5jZnVJY1I2bmljbUpncndaRHJFZnE0Qk1tdlZHbWpqZ3lZOEVt?=
 =?utf-8?B?a2JqbW5QZEl4YzVJRDFSYURxcGdOY0dPdXArTFdvOHVxVXJVeHg3bm4xRjlJ?=
 =?utf-8?B?KzhwTEkwT1VsYWFML2VjZmQ4dW1CRVIwaXZHUmI0elIvZDFZaGV4ZjNiT0ZU?=
 =?utf-8?B?QUNlQ0xxUmsvOXlMNk4raUxJUnJtN2ZnNnA2MW5Yd3RXa1JrSGVMdEZJQkZl?=
 =?utf-8?B?MHI3dFk4Uk1DVFZYUVpJS1U5bGRnWTE2S2cyTHUwcnNTYzVOQ3QzekxtRW5H?=
 =?utf-8?B?U0dxcnhRZHJlNDdVYWQrTFNGdDUxWTRzTHNaeThraFlpazE5NHgyU042d3Vw?=
 =?utf-8?B?OGNHWitqSlhwWEFxYXFVQUdTTUN6bjJydDF0cDVMc0YzK2ZDc0F1UmZhMjlB?=
 =?utf-8?B?bnhhMGU4NjJoWlBxc21wcWtKai95S1ozQVQyZXc0KzhVZ2puZnAvTU9WWkpt?=
 =?utf-8?B?RmFmeEprc3dta1h6dHlRRTRnYktRQkZTNHZiZTFMajdWSE9iZktiWXpFNEE2?=
 =?utf-8?B?SXZ6c1VIZnlCbmJKMVNCNSsvRTUrSEJDU2g1L2JQWlEvUVFHazhENnp4S2VP?=
 =?utf-8?B?dUNlNUNET005MVVLL1BuZmtOaHd4b25OekpKQlBZdU41L1NUcmxwVk1zOGY2?=
 =?utf-8?B?ZDBvOXFxNDlna2JWbEV3RnhkZm8zdUpqdUtGNlp0NWI3VWo0T042OG5oTjlC?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32E2903E438E7247A30E2DDD51C01579@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c18b0ff0-f72b-476c-d9b5-08db260ee6c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:09:24.5359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 cqJjRwdf4KgWJ/u57J11TBuHzhdeL4dh2pmeC1D2oDaQ0v2Oes1dRry9bN+v+1+CDnBJPE7jgTTFllLiEg3dyLr/60mBsTvy/vsI3HMyQVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
Message-ID-Hash: ITU2PT6EQPXW3SH43UU7FJ7TIJYRB5OR
X-Message-ID-Hash: ITU2PT6EQPXW3SH43UU7FJ7TIJYRB5OR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITU2PT6EQPXW3SH43UU7FJ7TIJYRB5OR/>
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
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2F0bWVsL2F0bWVsLWkycy5jIHwgNiArKy0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL2F0bWVsLWkycy5jIGIvc291bmQvc29j
L2F0bWVsL2F0bWVsLWkycy5jDQo+IGluZGV4IDQyNWQ2NmVkYmY4Ni4uNDk5MzBiYWY1ZTRkIDEw
MDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvYXRtZWwtaTJzLmMNCj4gKysrIGIvc291bmQv
c29jL2F0bWVsL2F0bWVsLWkycy5jDQo+IEBAIC03MTcsMTMgKzcxNywxMSBAQCBzdGF0aWMgaW50
IGF0bWVsX2kyc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgICAgICAg
IHJldHVybiAwOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgYXRtZWxfaTJzX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3RhdGljIHZvaWQgYXRtZWxfaTJzX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBh
dG1lbF9pMnNfZGV2ICpkZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gDQo+ICAg
ICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRldi0+cGNsayk7DQo+IC0NCj4gLSAgICAgICBy
ZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhdG1l
bF9pMnNfZHJpdmVyID0gew0KPiBAQCAtNzMyLDcgKzczMCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyIGF0bWVsX2kyc19kcml2ZXIgPSB7DQo+ICAgICAgICAgICAgICAgICAub2Zf
bWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoYXRtZWxfaTJzX2R0X2lkcyksDQo+ICAgICAgICAg
fSwNCj4gICAgICAgICAucHJvYmUgICAgICAgICAgPSBhdG1lbF9pMnNfcHJvYmUsDQo+IC0gICAg
ICAgLnJlbW92ZSAgICAgICAgID0gYXRtZWxfaTJzX3JlbW92ZSwNCj4gKyAgICAgICAucmVtb3Zl
X25ldyAgICAgPSBhdG1lbF9pMnNfcmVtb3ZlLA0KPiAgfTsNCj4gIG1vZHVsZV9wbGF0Zm9ybV9k
cml2ZXIoYXRtZWxfaTJzX2RyaXZlcik7DQo+IA0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCg==
