Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 167506BCDAA
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:12:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB5FB114F;
	Thu, 16 Mar 2023 12:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB5FB114F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965119;
	bh=PqVrxA19QE2i3NlP4qwpIB1M7t6McU4mmjnh5VcPcvs=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=PS19eIt65gS9+t5I3OSNQOGp/N6HzWjkus2mQBr+l/lsogqYVcuvs+evsDutBaE/L
	 0+PGxRwJK3B0nKIoXDvVkbT6JnuW8uvVm+bFYWBy2MPcfxyoAiSE1t17RcRE6GE31u
	 oXV6maXcwPyIe2DNlT3K7VUA7ZArp5pieHUWOff0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F564F80544;
	Thu, 16 Mar 2023 12:10:08 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 027/173] ASoC: atmel: mchp-pdmc: Convert to platform
 remove callback returning void
Date: Thu, 16 Mar 2023 11:09:54 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-28-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-28-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JODSBD3D22YHZ3MTUEZFLAFIVSLJUSZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896500777.26.16731739349732907322@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D97BDF80548; Thu, 16 Mar 2023 12:10:04 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 11E93F804B1
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E93F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=YrB+m3/z;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=YxN6LKot
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678965001; x=1710501001;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rZ8xmClCU913P+LrwCXPGx8uW2iT7ssjudUFqMbHyj0=;
  b=YrB+m3/zJX9/m6TWdopTGhY1bkvF8WqYXv1INDjd2A9rkuDfSJW5UvSO
   4bVzSzMXqk6U/QgLOW6CsUr++eDIdK4ElG1cmq75Gg9u4vUKSYt25jHu0
   iUcwm3HGJEcbShqpHv6Ly5HNJg2dT3PWFMT43SuN4p6wPiu1OpNO/Qvr0
   Gxyjzrc998tfdmMONXypCvjecFwkne9Q0R259duAx2RP/J7aAJmVq+CFO
   v2dwuFEAqpsb1k/e386DvI7xHx1wRhahVnd9FuVRW5TiRsHb97L3Ws294
   nnHWYnL/zHrG/6ma20rIYWSvwWnac78tBmSGuNkcBdLhb4acyXpRana4h
   A==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="142358236"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:09:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:09:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 04:09:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWRh5pQFa+ZeBwn5QYkwq4D52zuB5Ud8Ty1TfoFSCbwnthMLZnmAkXL4kEg49trEcEX3SWEWBZ7XkXeSRcMmkFwEEni2Oxtdi9EiPEt6gOjXok+GNKS1ewJygknwtq5PJGeDlWu7J4k1gfhoRk7cU5GvAqCdfaKwkyy98NjPP2w1u9W6I48ti5/PvVCTIW9zQZr8giZamwVi2hhrlCaTbzQ3Q0+9r8omSTk05/Vx3sZrWKUawlE9EsXV0IhKNyVVdgkvTlikE+h+LpssfmxxqSjdLXqWmXK75hGzptrH+BEJSnlFg+WvOmpWIAVW9xGw5l/82uYqSGykDExTDJ9hZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZ8xmClCU913P+LrwCXPGx8uW2iT7ssjudUFqMbHyj0=;
 b=DBSat+tBiU/BfRUvJmY6V/S3U5aP73eL2zhizVNJU/ebWG/2vObA1FYOzHffm8wYk8IwGvrf9ag/FcrVWm3+xsTvyL0OLUtWuhHnRoNPzokN7r2AmR8dOP8af+2x3fhlWrTZ5EkZ1Wpj4TNWxp1ojNAHgzwKDAPnz/Zzys+M6GZyqTK90BSnExnamQQUsmdUTSokOEYz/Vs8wY/2JBp/z+1Q6988aYUclKBZTt/7bMwCqTyCC2Wydg2yULnjV/fQaO/PHYCnt4SFJzKAAW9IXrmnRVqyvhypRlbFDSlwh0mFQviEZAbJWSnvrUCzsK7Evl01UGAKUOtAEBYLtO/cHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZ8xmClCU913P+LrwCXPGx8uW2iT7ssjudUFqMbHyj0=;
 b=YxN6LKotMiJmY7kG4VBxwZ2uyBFwfgC2kLZ4+q9DbTTRaWltZOPAEi/Iz8FcM8kx0MEP/Ke/O35Q6cynTgBPzR+/yv9In3fI5wJVSQPXGaUykFl6Gwf+rlPNS5azvxwx1YS399w80uvGgfAhQd/D9bNMLTHB68N0D8MFj69Am3A=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:09:54 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:09:54 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 027/173] ASoC: atmel: mchp-pdmc: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 027/173] ASoC: atmel: mchp-pdmc: Convert to platform
 remove callback returning void
Thread-Index: AQHZV/fWq8EOcmeQv0KtQ2riSMxViQ==
Date: Thu, 16 Mar 2023 11:09:54 +0000
Message-ID: <35646906-9ca4-fa5d-36f4-6e7b9bfefd5e@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-28-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-28-u.kleine-koenig@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: 72f3c4a6-6f71-4be9-5778-08db260ef8ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 F2eAWUWEffkRb1Q/AyyeMN3ytKkpJKz2OaYBlrt6wTsU/DeX8vtw7LIGLtZzqPc6eK0iFFRFzzozwlTV59gXYySO2iPmwaJu2SMg1D918DUP9twBsIguZPHOFnwX4gdGw1aiHwh39khu0PeorFZlSoZsrOFB9GqZAv00Y2euwWUqE+qyrLXYXiDRtuvg8aVRtlf29lcu6BZ6QjANvf/yaf1JqGKhw2m4p25NDqMXpVQbfSIdF8v8b7+9jb/fFDSgv+hrTcBalxyfslHwGxNYjAnuzzOKfckVJpa7HVqRji6pwlUyLEorVqGrdp1OtJi6k0Ewz8/WLszJWa7oRbJr2WgTFhmDFqj7PkyH6lR/Z0rnIazIKXelPelXedvwE1nszYvZ9iLCQuJg4kK28rmZTQMNMsky6JMPb93In8BthFo0xAQ+bjwUUy8SsnSsMtT30PIMO3PmUl6p3rH4QqoSYM2OP5j6EzvDDVLn4xiFT1HM82FLxumPIkHP0ts9950wrf+7k6NY5rlaeile/6R3zgMhfa1+nqRn9nDvEQrzljlq22/JJ0SQzdKwh0RK9tT+Kfu/XxtnAuCIbW7LQj7meWgAR7PFxiOaXD/DDX5t5xol5gT429Mr1HS8+MTw6v4rK3Tb1RPDeVEkmIr9IRfIM5tfBMHI3VGHEn21z3lQaiND7UMzsNTpKKQix0/VEgI6usctdf2qAcAARMuURQCZPeCPC6jslxxo9HlAQKM3iJJFzhVnvLJbGCRZm7eb/bb2S06spg5xqwn3G19JB7HMZg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(38070700005)(31696002)(36756003)(122000001)(86362001)(71200400001)(66946007)(66556008)(66446008)(76116006)(66476007)(6486002)(91956017)(64756008)(110136005)(8676002)(4326008)(2616005)(478600001)(6512007)(83380400001)(26005)(6506007)(54906003)(66574015)(316002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SURPSEp2ckhBVmpqYjdBRko1bmRxeDZmMFZtZXlncWlOdW8wRHRCYlExS3ds?=
 =?utf-8?B?S0kwbUc1MjdVU3hSTkFPS0NtZ0RkQ05mbzQzVUJnVVBHa3ovZHgySHIzYlhZ?=
 =?utf-8?B?MGh3S21yT0VpTjU0THhCUmZNQzZ2Wk9qR0Ryck10WVJ1dS9kY1ZBTzRGY1p6?=
 =?utf-8?B?c0VHUTB2QUo2T3NkcTNGS016T3Nhc0tjdkNZY2hhS2wzSzV2OVlXMUxZcXJV?=
 =?utf-8?B?SFIyQ04wa3hFV0N5M0pQazBLdnZsY1g2ekpKNHQwSCtsS0wxU1dBbXpqT3FH?=
 =?utf-8?B?N0ZtN3hqbjhiL0x6eDkrMGxSdGtzNFZrMzNUMUd6RkpKT2NjQ05PRjkrODRX?=
 =?utf-8?B?eDhXUkQwV0NXSGxtT3d5U3RZVm9lZHkyN2NWdXZZeU1KcVRObiszK0ZvZ0R2?=
 =?utf-8?B?NnZQVWY4QmxFa0VLdURpekd4OTZqRnZQOFBzU0lhT2xYRDlJSjJrZnBWL1BH?=
 =?utf-8?B?V2tkQUlkWW8vVXlpV044dmhnc1lvQ2hMRE85S2hoWVRPM0RXdkZ6RTY1MjBR?=
 =?utf-8?B?NzUvYUUwMGpMSVkvUXl6bFZYUlU2WnlzRERLRVlaSW1xQzQybWRIaGxnTGpo?=
 =?utf-8?B?UWlsREJZeUpybU9tSmJvZllHWWJOR1pNL29HcTdzOVYvQklYVnRMaHFFOXBB?=
 =?utf-8?B?dmNWK1hXZWREOGljUGdJbkVZQXhBMGxSZ3Z5akRzVXJmOHJHS2pRWDBoRjV0?=
 =?utf-8?B?YjM4VWVpYjlSSDZab0tscDZYaFpNSWdiYXlGVTExUVhOK3BMWHhaUzNkODZo?=
 =?utf-8?B?a0V6YjlRVGFvc2xhaUNUa3k3MThMdGtmNGNkZ2kxL3lXdzYwbUl2TmdsMkNk?=
 =?utf-8?B?ZmF5bnNIbW5Bb3ZiYk0xTG1EK3Y5YmhjeGhPL2pINVJ4SEtwNGpML1JiYnJz?=
 =?utf-8?B?dk5UcHZiWGw5NXNZRnY1cmFpaklqZ1BFcUI4djZ6NlBxZ0dsUUdqTUJCa1Nr?=
 =?utf-8?B?b3E5anJ2UXFFa3FtZW1DampNenpwbU8zd3lLS29SZm82UldmSXNHYUM3Mndh?=
 =?utf-8?B?SnJiSlZWZEU1d1BqbkwyMS9na3JaRUZoTHFINHFUemY5UlhlL3hJRnFaa3Zk?=
 =?utf-8?B?L3psSDRNTXJnTmNLUFJwWUpZMDliNDhtN0ZhbHpVNEV4QWt5UE1Db1Jzc1Za?=
 =?utf-8?B?SnVwUTRMdG9mTDlwQjdwZkEyVFBNSDl1YUlvMEVDT2NIbnR6UkxuZ3Z0dGw5?=
 =?utf-8?B?TEt2cTh1RUdGWFBDUkg2bnk0dUphcXVSMzRudnV5RWl1OFc0V0JyYzlkSk9u?=
 =?utf-8?B?aTZKNG5Ccll5WEMvQlZhWk1VQTJWR2U0OVBqZXBqUmlDQ0pNcG5tOFdQMWsr?=
 =?utf-8?B?MzNBcHFaZk5TakVHRi9jMXpOWWYvZ0JidGhlaFo5eHVTcG5xWWx5WXJMc2hT?=
 =?utf-8?B?V0QrY0FJR3Y3K0M5MDdCa1lyVFZQSmZzVDRtcnMxcTNSK3FReUhHRDBkYU1r?=
 =?utf-8?B?ZEgzVWI2RzVWMVRveDhPYm5PajF5QTdYRkd6enhuRnBuanFtK3MyRGZsUEVQ?=
 =?utf-8?B?bHY2RmRwZ2EyMDNUeDVzdWg5dGdsUkR1Skx2dy9zS2pIYjFSYStsQlhKa3VV?=
 =?utf-8?B?Tk9uYitGSkRNZ2JXYlBUOGxTVElmS1EyM2owODhvZk5uajdwWnJUMFhMOUkx?=
 =?utf-8?B?Sk4zbWlaVjUrTVRYeis3dG5nT3l3eDEzUXdBRENaUy9QWWMxZzYzeThtT2Rv?=
 =?utf-8?B?MzZ6d3h1UWZMRVFiRitpWHJWTjc2UzRXTmdoZ01KVlUzWE9mUk5IWXMrUm5K?=
 =?utf-8?B?ZHMvUzFQWVRkZS9KcWladVRpd2FNdWZ4cThxNm9ZR2hsZm5HcXNGMVpaeXlN?=
 =?utf-8?B?czZ0cEpmY2VzdFZEazlXMmJEd3p6OTBBVGsrcnBQMWVTT0dFNWw1K1cwQ0Ev?=
 =?utf-8?B?N2pvSmlOdG5oQWlLK1FWSUpnQTNvcXFyRnNQcVBIOHYyU2xyeWZVemh3ZElE?=
 =?utf-8?B?c0xpQVNUdUh0ajFHMTlzSU1TbWhMQVhOcmRZdTJMOG9rdjVtSmZIRDBHbVNh?=
 =?utf-8?B?aU9vV1VGelBXUXc0ZHBkWFJZTGQ4VTdrYkVhMklvV1RhQ3laSnZHazl5L0Ns?=
 =?utf-8?B?b09peE1mVjg4c3Y1S3dkZ0UwTEpKczArVVF3VS9FbnVxaUhvVEMveUpURDlt?=
 =?utf-8?B?YXdrRTJBb3VEc0xWa0VXdlJkZko3bHcwZE9LZWdYcHE5R0ZIS09OclZydStR?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6DA59210A16564B81E1EF34169312ED@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 72f3c4a6-6f71-4be9-5778-08db260ef8ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:09:54.8308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 y5mImenGfLu1yeUB5v8G0KGqm5raldP+byqsIjY/l+ERkBPxvkZbNnIfg/HzvOajauZWcbIK4i6iWUVfYipjhactqNmbuuO3ng+UvQ3NXrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
Message-ID-Hash: JODSBD3D22YHZ3MTUEZFLAFIVSLJUSZI
X-Message-ID-Hash: JODSBD3D22YHZ3MTUEZFLAFIVSLJUSZI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JODSBD3D22YHZ3MTUEZFLAFIVSLJUSZI/>
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
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2F0bWVsL21jaHAtcGRtYy5jIHwgNiArKy0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL21jaHAtcGRtYy5jIGIvc291bmQvc29j
L2F0bWVsL21jaHAtcGRtYy5jDQo+IGluZGV4IDFhZWQzYmFhOTM2OS4uN2ZkMmMzZTEwMGU4IDEw
MDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvbWNocC1wZG1jLmMNCj4gKysrIGIvc291bmQv
c29jL2F0bWVsL21jaHAtcGRtYy5jDQo+IEBAIC0xMTM0LDcgKzExMzQsNyBAQCBzdGF0aWMgaW50
IG1jaHBfcGRtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgICAgICAg
IHJldHVybiByZXQ7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGludCBtY2hwX3BkbWNfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9pZCBtY2hwX3BkbWNfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAgICAgICAgc3RydWN0
IG1jaHBfcGRtYyAqZGQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gDQo+IEBAIC0x
MTQyLDggKzExNDIsNiBAQCBzdGF0aWMgaW50IG1jaHBfcGRtY19yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICAgICAgICAgIG1jaHBfcGRtY19ydW50aW1lX3N1
c3BlbmQoZGQtPmRldik7DQo+IA0KPiAgICAgICAgIHBtX3J1bnRpbWVfZGlzYWJsZShkZC0+ZGV2
KTsNCj4gLQ0KPiAtICAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1jaHBfcGRtY19vZl9tYXRjaFtdID0gew0KPiBAQCAtMTE2OCw3
ICsxMTY2LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWNocF9wZG1jX2RyaXZl
ciA9IHsNCj4gICAgICAgICAgICAgICAgIC5wbSAgICAgICAgICAgICA9IHBtX3B0cigmbWNocF9w
ZG1jX3BtX29wcyksDQo+ICAgICAgICAgfSwNCj4gICAgICAgICAucHJvYmUgID0gbWNocF9wZG1j
X3Byb2JlLA0KPiAtICAgICAgIC5yZW1vdmUgPSBtY2hwX3BkbWNfcmVtb3ZlLA0KPiArICAgICAg
IC5yZW1vdmVfbmV3ID0gbWNocF9wZG1jX3JlbW92ZSwNCj4gIH07DQo+ICBtb2R1bGVfcGxhdGZv
cm1fZHJpdmVyKG1jaHBfcGRtY19kcml2ZXIpOw0KPiANCj4gLS0NCj4gMi4zOS4yDQo+IA0KDQo=
