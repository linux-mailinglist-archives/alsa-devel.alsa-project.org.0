Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2A6BCDA7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:11:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53214113E;
	Thu, 16 Mar 2023 12:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53214113E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965098;
	bh=tSbiETGvh/hytUEhoDlpAggVIvhDYKZTEoKWqjgcK9g=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=cJGD1yyn1zmhDT6PvEtfvNV4yzvDtNHEYh9zAQlfOLSWxiFkNM7SYWgASpnZpub+D
	 xrWB1zA9ZsD8oiw9axYJv5Dp2mlFbpDn1e3r5ye24HNuQgcqO8RiUGFWXdpJ1/UASx
	 2uWY+Vftxq5U4AuZGDOhFft1EJKRcVLPam1flKng=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFEF4F80529;
	Thu, 16 Mar 2023 12:10:01 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 026/173] ASoC: atmel: mchp-i2s-mcc: Convert to platform
 remove callback returning void
Date: Thu, 16 Mar 2023 11:09:46 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-27-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-27-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOX7Y7GY6GHGD5NUSH6NSXXO4KZL5LG7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896500130.26.2224957999791369451@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD21CF80423; Thu, 16 Mar 2023 12:09:54 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FFABF8032D
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FFABF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=L2AwCG5p;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=L8gCPWyd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678964992; x=1710500992;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ID7mZwszcRamVB2kMkgWF4mJF8z1DattMT7XdEzJYWs=;
  b=L2AwCG5pJq7pwMYzrHDvqiqnD4NqafAx9BkSEzO2w8ow2H+NK3xj530D
   10kBtmmPrFKS8LApDFhBSvhuzoS10HwdxLS1DwWbJy9eZvCcNVBInm4Pb
   SqlQ6+eM3X+OVKij9M3FpGedczx/rah28rfg4VE/Iy42StwPazLw/JYWv
   gavT20LrKo4RifmVBZ5uXcTgDx0Y0/cmJxAIoGIVAor0QiZ1JD1tRTH26
   FQ1Yi4dCkJVFN3mu5K3YjHTz8ZBqrFIglY1G8hnIaGmRoLpKv6WRn/AVX
   S96RU/bf65Y/AiWK4/OIxjsBuuRH8l79h4MKLSm4R8dEAhY7C3VTTG8TF
   w==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="216589642"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:09:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:09:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 16 Mar 2023 04:09:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZv48py6cFUuhBxKA8pi5rNu0wV5Fl1/0B2c5ceegUr9JQ2MRuWPK8EUIBjcjdN+JgkuaHX8igoj/8WQpsAYwg0OTmTtp8V81wgunf15uw6xZlWQcFb5soQX2nDLY4shIQfsztLj425pjvm2udIi5hXJSHkz1qtD09rHoV8QTKFMXYojP0r/P75h7kUCg6ZnobMkzo3yugoauu9XcVDWkZoAuO9MfAaxHnW9d4wCcoXSVm8g52p1TvTwOq5EOyHIzqUTQV0iuCHqLvvVIt6lhGeRCSHj2ix8spSwaJ7C8093iLtoeRhHlaxGiMmcns2QDMeJisIHg4KXxu6x2fCxGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ID7mZwszcRamVB2kMkgWF4mJF8z1DattMT7XdEzJYWs=;
 b=m6VyjxSykJkTDeiSg7TrNIZhZPr3zqatbTTse3SR+3RKtt0hGOvkHpP3D/cKccEO9ApuCeJENkQEfPEbjY/yefcPCt/Y00zi1jV4iqqECI5OW8dWtIMs6t5pch44zna4v4Wfn+YEz4UUmIQifavcBLwiqe9i2IXFzsP5IyDOXf45PuDe8A79K6044KGsBOwC6pIzfpiIz6YembSQOCRv96vBJYb9EIOcWFE+sO6ePu/HKryMUhp1+7AcksfQhbvui7nxf5ZwVgj3RykUQHM2m/4r/G5/mKiVEFd6UYKpUzMVCYFgyc7b2dg08r4dlsnhocNMOYa/LWvVQvBCFVCHmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID7mZwszcRamVB2kMkgWF4mJF8z1DattMT7XdEzJYWs=;
 b=L8gCPWydIGnd4Pb4jmJKRsXC99AKfOGbktmj11MxA8He1sdGTvCT36PZM/MlMSdrd2RK72kVNTzT2i4gd6LWa8buBWLQ2fZUlLWWtE1jUYEXg6/XwUB2KvdCjXWiQkP1DAr+2EJOZzWUVZo6Fbus3nJr4f+D9mHUHChfT6VFhTA=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:09:46 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:09:46 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 026/173] ASoC: atmel: mchp-i2s-mcc: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 026/173] ASoC: atmel: mchp-i2s-mcc: Convert to platform
 remove callback returning void
Thread-Index: AQHZV/fRGPX9ZFhoh0ym+norjGctlg==
Date: Thu, 16 Mar 2023 11:09:46 +0000
Message-ID: <4c2192ff-a598-9ac0-2819-26475c6563bc@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-27-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-27-u.kleine-koenig@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: fcf83207-1d24-4d08-4855-08db260ef393
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UTsDQcCdVxcBgWwGDzduOjtQrdARuY+CeGclNAXJqPBYzoRlhfyeLNUZQbesWS7HIL5WLutzF74qfB7m2+R6LHMzbpgRsCcFJfm2mbN+FqFyM9o5mE+VCHayFW7m9KrXfMonMVv3dKSF07XS7JNVYXBb1f1JErUKuuHHq85gdREf3uJCAR8KyDjFIhcjDLcvQNK90+PG0Tz2d4LrTLFVHWjQPMigdjZ5qsOo+iO3p+4W6Qal0ILxio7hzsjfkVI1/RXLRFjhooXjaNDROtm4k0HEH8E//q56M1CcJANDRggZGamSaXYmTe+4WoYMgTUqPvULkw5VkvLWjlf6LdFPCgFuW7RkO0Q0m4DwpbpWosre+mgFjwFQCPBU2pra7n4qYOtBjphH1zNxM8Y2ROOrUo7jryc+TGU7uGk5ROrHRbFHP69oWbjpyil8M5rsF6Xky1Gj6FhQwJF7P9Y29GxM9ZiKGEmAoxhKEOnEGs7h2iy5KGlyatka6ZjfWhQ14YlmWJN140JlFEi4BoCxby7fEPQrci/c7HC7z+SpQcVK99r8vzVgpZV+0K/FW63+6p1ZswdQ5W21v2a2AU2RdgPFr91unUVsS5OrwH9K3ukMRc/fDP08u1unDpWqvAe1emFYgYqgUELC2UUtm3O1AHf+Qa6kMSRujkQJ91nI+SoaAxNV3B8IpckX6+62qJsWeTf58ykIv0f5DQs4R9CaPnxuRns5VwlaVDUlANpkQ0v8gNJ3HWrm4vbm2hnmmsIyoFPN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(38070700005)(31696002)(36756003)(122000001)(86362001)(71200400001)(66946007)(66556008)(66446008)(76116006)(66476007)(6486002)(91956017)(966005)(64756008)(110136005)(8676002)(4326008)(2616005)(478600001)(6512007)(83380400001)(26005)(6506007)(54906003)(316002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SWtqTmJjano1U2FQdnk4OWZhakJUTGVsNUZ0ZlNlSWZhNG1QSDJJMjVLMVdy?=
 =?utf-8?B?UXg0dC9tRVFVR0FxTzF4eTA4S2QyTUVsNG9HZE5GckZuQ3FwZVZDSC9XblpU?=
 =?utf-8?B?dmVCeFhabUp5dTgycm4xSXg3SUFGNSt2elgrUzlSbGE4bGNMMkd3ekNUekhr?=
 =?utf-8?B?VU9QSWw5M29jbll5NFl6VmJpTTJxbk5LeTlCdXQvamx3dlRqNkNtOGp2OFlC?=
 =?utf-8?B?UEhGNENQenZ3T0FVb2RwVWdNUnRWcTcwR2FLNzFnT3EvbkwwdGV0eEhjQTAw?=
 =?utf-8?B?UUJJcXI3RlFwcTRwWFVQZ0xUSk9NaGNWK0VKbFdLN00xNXV3RVZEL3JxVWxz?=
 =?utf-8?B?RDIxbGN5M0tQdWtEZDU1d09aRkdrNjRRMm5nQU5QZEZRRTdPN2oyUjVVK0tN?=
 =?utf-8?B?V2had29PSm1jTzJTVmdHNkhuRndaWW1RbTM1RUhvZ3pJbENSUjdONDlDTGJr?=
 =?utf-8?B?Y1FJalNaLzNMVlpLM0FLT1NCWll0bC9HNkRvNThLWjhBU25MSVhLc1gvQ2Ja?=
 =?utf-8?B?TW1xUlM1YlM3M3B3KzRVWWRjaEFqWllsZGxpNmY4K1ZIQU5PZjc4QmlVLzky?=
 =?utf-8?B?eVlSNU55VVZVMWZBTzVWdlpIT054TnVnR2dxS1l0QnR1R3F5d3BYRW9pOGpT?=
 =?utf-8?B?eGxaN3IyaTBzdFBUbHBEN2FYdHhKVmwweU5wUUVqMERLckc0TElnOVA2a1pq?=
 =?utf-8?B?bHZXaVcrd1Jwc0g2YUQ5UmE2Uk5PMU9qOUg4ZFJXN1NuYVFtTDVDUVI5QVNY?=
 =?utf-8?B?NkNySGg3REJJSnV6RWFUQTgwbUxVeFJoSmZhU3JOSFJCK1BYUUs2OUwzNjcz?=
 =?utf-8?B?RjdCN1NlYm5xck1kMVdvZjdKdENUYVc2bkV1LzZQVUFHY2EvcXN1OEFtYk1P?=
 =?utf-8?B?L1B0b0NFUzFmcC9NVEoyTzdDSjBJUU16aWRVaENpeGd6MXlmOHF4Wit0aERv?=
 =?utf-8?B?OGt6cnZLcFlkZzNReFpmRXBCRDlGajl5V0ZLcUlPZlQ3NHVROWszVXhNRnYy?=
 =?utf-8?B?NzFpL1NLZlRtR2l4bkhwOGx2cUlQamJsMmpnL3R4c1lDM05tLzdOdkF6VXZt?=
 =?utf-8?B?YmppaDFTWjdydzBpTjRyN05HYlk1M2JydmdPOUlwVEYwUGkzRnA1VTg5a2Ur?=
 =?utf-8?B?MGJCRktwMGx6S1hsVE50czNjbFFGOWNZcmQ1cW0wQ2Jydkh3VGF1TWl0d2ly?=
 =?utf-8?B?VERud2pNWHJmM0RNMnY0RE4waW1BNmV2NEF6QWhubDdXTW1tNjRQZE1qYWFB?=
 =?utf-8?B?Y0RRekJCbElDeC9vS1plelhGZjBKVFZCMzF5Zmo4b1VkaWpVVTF0K2tJYS8x?=
 =?utf-8?B?c3JnSFhFMWJYVlZLdWM5QktFUE00bDZTc25kTGFwVk9NVXp5VVNqK3ltUnFs?=
 =?utf-8?B?dCtRWDFaZjd2UVc1K1VTc2wrTWxFdHp3N3psTXJ2VEx3SCtlbXI3aDUxaXVH?=
 =?utf-8?B?bFp0WlB6VFRlR2lTL1JIZEdaSzdhS3EycU9KRXF2MndBSnhGbmRyQTlRLzZs?=
 =?utf-8?B?YTRJR1FuTHhPMWxzN0g0ZDMySHRSRk15TTEzSjdnMUZKcW9zV1dMNGNDSStS?=
 =?utf-8?B?OXZxYU94UGtXOUpnS01lYWp0ZjVVcTdaODdVZVMvNEo0UVFpWWQzZFBrMlVo?=
 =?utf-8?B?TkNCajJIY25kSnFHcU5ZdjZOdkQ0QmpIMTh3eXNJTXZDSWVNdFFObGtaMDh2?=
 =?utf-8?B?bjZWM3hLUzZHNWovbTczNDdIRTJQZHdrMEhiWE85cDd5cXNsWmxqMGYvUC9D?=
 =?utf-8?B?dkRlL0tyTE1tVmdVUS9Uakk2a0pmV01OMGdqQTNtQXZVQlpiTlJkazByTVZk?=
 =?utf-8?B?R255dklYWi9hQmY0Q3V1Qm4xL21DY2p3YnZ6OGhhNGlJd0l4MDNrMGFBcTFw?=
 =?utf-8?B?UWxCTDV2YUFwMTFWeGdDbmFjQTdPN3dkckYrWWlEd2lYdEZUZWRYQlZUQWIz?=
 =?utf-8?B?Qm5OOUxpNlBmeGxTSllpaEdnT2F2QWU4Qkg3cDRZR040d2hPZngvT284amYy?=
 =?utf-8?B?a3JnbHBvL0VRTGxYWTZWc0hQbmEvMGxLc2NQV1hQdUkzcXl1eTlPY3RWUms4?=
 =?utf-8?B?NlRpb0tCWXNyZGdWdU1tYklWNG9DZmRscWJzYVdnYmN4eVhEMEdtVnBCaTht?=
 =?utf-8?B?Um5Sa0k4clMyNlhZMEJQZXQrRXVmZ21STjlqamtNVy82aXUvQ3h3WStBUjBh?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57367F29B3CB604088F43DB76BA763D5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fcf83207-1d24-4d08-4855-08db260ef393
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:09:46.0814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 uP273wocMTpx/LvKk9qc3gmMvNd9iHy3d4KU2j01ZqPoqyL1B/Xr3IF8BnFr6YOwMCKtLLOH4EuobOcTySXCLZ32VRrorsaiPTHkOPHAXXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
Message-ID-Hash: TOX7Y7GY6GHGD5NUSH6NSXXO4KZL5LG7
X-Message-ID-Hash: TOX7Y7GY6GHGD5NUSH6NSXXO4KZL5LG7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOX7Y7GY6GHGD5NUSH6NSXXO4KZL5LG7/>
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
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2F0bWVsL21jaHAtaTJzLW1jYy5jIHwgNiAr
Ky0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL21jaHAtaTJzLW1jYy5jIGIvc291
bmQvc29jL2F0bWVsL21jaHAtaTJzLW1jYy5jDQo+IGluZGV4IDZkZmI5NmM1NzZmZi4uN2M4M2Q0
OGNhMWEwIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvbWNocC1pMnMtbWNjLmMNCj4g
KysrIGIvc291bmQvc29jL2F0bWVsL21jaHAtaTJzLW1jYy5jDQo+IEBAIC0xMDg4LDEzICsxMDg4
LDExIEBAIHN0YXRpYyBpbnQgbWNocF9pMnNfbWNjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGludCBt
Y2hwX2kyc19tY2NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0
aWMgdm9pZCBtY2hwX2kyc19tY2NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICB7DQo+ICAgICAgICAgc3RydWN0IG1jaHBfaTJzX21jY19kZXYgKmRldiA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOw0KPiANCj4gICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUo
ZGV2LT5wY2xrKTsNCj4gLQ0KPiAtICAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiANCj4gIHN0YXRp
YyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1jaHBfaTJzX21jY19kcml2ZXIgPSB7DQo+IEBAIC0x
MTAzLDcgKzExMDEsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtY2hwX2kyc19t
Y2NfZHJpdmVyID0gew0KPiAgICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0
Y2hfcHRyKG1jaHBfaTJzX21jY19kdF9pZHMpLA0KPiAgICAgICAgIH0sDQo+ICAgICAgICAgLnBy
b2JlICAgICAgICAgID0gbWNocF9pMnNfbWNjX3Byb2JlLA0KPiAtICAgICAgIC5yZW1vdmUgICAg
ICAgICA9IG1jaHBfaTJzX21jY19yZW1vdmUsDQo+ICsgICAgICAgLnJlbW92ZV9uZXcgICAgID0g
bWNocF9pMnNfbWNjX3JlbW92ZSwNCj4gIH07DQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG1j
aHBfaTJzX21jY19kcml2ZXIpOw0KPiANCj4gLS0NCj4gMi4zOS4yDQo+IA0KPiANCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
DQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbA0KDQo=
