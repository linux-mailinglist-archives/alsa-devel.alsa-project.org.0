Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B40D0389240
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 17:10:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465C41687;
	Wed, 19 May 2021 17:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465C41687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621437001;
	bh=GleqcDbWvIH2QFBsPwQxPapfesJW7paQjpjB2xX/yqE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7LFWULbLmEQjhC7IxMVYfo+ZXTSvmVgAwSTw67d0zllkjM2EPvzz4QL7KvnTRSvP
	 dNMQeI242/t+1RyXISbkRuWFba+QYip1shMgdtd6coavqWME6z765WN1Ip2CUqFDqC
	 vNqpXQZ+m5I0dd9lsjqTLw5R4eSXly7tANYWHVok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2AFFF8014C;
	Wed, 19 May 2021 17:08:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA7D3F8016E; Wed, 19 May 2021 17:08:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74D8EF80148
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 17:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74D8EF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="cjB0Az6a"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="hx3Dw+Xt"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1621436904; x=1652972904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GleqcDbWvIH2QFBsPwQxPapfesJW7paQjpjB2xX/yqE=;
 b=cjB0Az6ag33vPLs7dg2LiAfGtrpveFAiQiLgM90U4em/fHFLgLZmgnu/
 P8JUsTGC2pW98OAIaMmre8ePiObxKxdjW5AARaRqvC8TpG7Jz58wuhTiG
 a7JWJn58w31FFZc/n4fCd9EXiftkyrNohTPN7p/2mB9gytRTQqLsDH3PM
 RB+jMPht9svW62jTYIwSSK4yAierGBAEBZ0pF4rtiSNfHLFyfU3JZLjvA
 an0oMDtX3NynIvthg5MouzUg410mBvn+ZkH4iiroHaMUcUuzlUcp54DlA
 juSK6Pg8HlOXRVrKlaHkyxWlJSBwzoonJQKFpm4/8z74f2zbuk1j9EHgh Q==;
IronPort-SDR: X9UAtMtOOfYiX3qB2LQzUVCxTXmmGCupTmOoR6sp/JeB/z3WXAOs62OcUNmUFYscqgSWyuGGwD
 wR8lr3BihZEKVLNIxN7y8fHqCVJG8qwAy+ouWf5GP1zKVvVLGUkBagObYIr6oLzKjr1TP5qH+V
 nT+E35S9HLAQ/7Uu9a2QC23uWL89b35vI5FM8Y6jKZ0/yKy2Rwxgp2j/+UnGe0C+QX+3oDdfED
 3nQ0D38NqqsPgEDw5lcQyOUtQGPtLTEhX+g7U09QLXjQcjCTYOaXdiJlD+cPeGpsP91NENgh0B
 oco=
X-IronPort-AV: E=Sophos;i="5.82,313,1613458800"; d="scan'208";a="118484563"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 May 2021 08:08:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 08:08:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Wed, 19 May 2021 08:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKo/W3untj9iQW9cyEjKYtqzs5yu3CLcu15YlyQ4/3I4PSfAnzTxjdQBHDh/gQR0RXW0QiJThlxoTmYWqGKKz8Ju5g+8ViyNSS3cXBbyGS33Dpxy6JwW4Dai5eBhNngtN4k9utWIU/83qIbnbHf4iDHO+Ko/qCQgH8yr3N+GyC+AwAHRepYMGmVJkwPMs7Dh6I8woLyP7YQkDlERYWo0xQjx0t97Uc4E9ExlVc6edKFD/dkEr3DUKEa7vThk2tXhEHo53XIr3GkXP8e8/IoLfSeFn9ef3sbZB87GvJBMMYEzTEdHL3d9hYqykM43x3aC6yERn1lEF8RvoyKu+b03Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GleqcDbWvIH2QFBsPwQxPapfesJW7paQjpjB2xX/yqE=;
 b=gZf5MbqNEocLwwINX/NCW9CStNDvOabp7jWsdWjupZ3n68hPgO2K6BYmAv7FiZ66pFykBDVRuYql0VgVVUvRNGtVW5D1UT38HyaCdnRnLAizMtumXiF7Z78RFoGLOymMPATvWYzHlLHU2zIv8C5MtFCUxvX4hFInvkcIDw2JwUWLrFPoCLH0/NkpFTpGGpg1mGyn5h6bZwF709uSBErOmVPPSuQXnjIKJGbn27//cCaFgptk6cGpv1lSXHC4HHu7CvFaeJ7FwCbKanHgcG9orTE7hqmHM+ugEf2t2SkYrGyvDxxcdjQJBm9GmzSkqoSn9YMGZTtDwp7XEblF5u1lpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GleqcDbWvIH2QFBsPwQxPapfesJW7paQjpjB2xX/yqE=;
 b=hx3Dw+Xt9pSQfTsqcDPQ5jtTzER0bmM7wleGwEGF0pcTIVSLhrcDVsQ15FgXbOLsW+ml+iF2c+tpG4RVddDFDmXUBcDsc4APZcZ/M9my6NY11AreyXjCrTDhwpO2AXH1SL6VeaJvld8B8chFNVm98VPQSMo5ZQSjr0jICVrl0II=
Received: from BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 15:08:10 +0000
Received: from BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0]) by BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0%4]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 15:08:10 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <tiwai@suse.de>
Subject: Re: [RFC PATCH 0/6] soc-pcm: Add separate snd_pcm_runtime for BEs
Thread-Topic: [RFC PATCH 0/6] soc-pcm: Add separate snd_pcm_runtime for BEs
Thread-Index: AQHXTJysN5KAQo2I4E6xdizgPl/axKrq2YQAgAAO0YA=
Date: Wed, 19 May 2021 15:08:10 +0000
Message-ID: <056e560e-d06d-23bc-b041-60890fa51e63@microchip.com>
References: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
 <s5him3eizdf.wl-tiwai@suse.de>
In-Reply-To: <s5him3eizdf.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.119.88.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93cca893-f3ea-4a20-cc28-08d91ad7eab6
x-ms-traffictypediagnostic: BYAPR11MB3814:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3814867CB6BDE36307214355E72B9@BYAPR11MB3814.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hlBkGwslbutc4paceJ8Sf/onNSa6R4Bp5vb+tI6EhSYNd9IN817P8yfFcCEbuo5rapTRhGXgfpjhDQ3WTBYK9zauLQPU2XGxBadZlGXOXJQKIk2h1501bMmja/cm1mIzlCG7aJQiYb+FmzSCVeduMHWoHHu/1bVdUv4x1QtiiU8/gPPABSFAGSPjeKUEm9k/m3qOqdf4gKulWJNSgzFXF4Uw06tMSQO4EUYpROx+dMMA7/TkdoWkR+tTR/E5DSQuj7rt5rT1RJnjp3l66GcgIVaQ8uXbxpeXn5ru5dSYDepigMhbRwhW/DW6PHTzjJJ9iFYLVKv8Xq1AyysHz2SU4hbVypfbkGR8ipoTF+MRodXlV4/s0Y+ctsswYHrW2JuQEPZs0QhtxQBo80+XPEYdkPoel9zcpmVxY9q1/CMrpjTFXRUPtbaPBDHbEnvkarE/9H6VtiXy9+ob4VoI63PELQuhzxrpV8BnzrHTnEVExnwQKewflmNV+55natrasnMjUXV2Xfj24M4e8uCu22Y6S1uGq0rQAZYl3WOs7bbv9PrZfmfjP/2sapXgiNtR/I21T36SA6L0P2T3h9WmB+wlkg0ljDwZXx6Sd0IPPF9gB2kZLWAbKhw1Z9C5KB2JAbAnCMoLELvxZeAMunN9WIFXkDDkkBS1ZS0N1/c3JMmuACdmnakYrSkny6Gb0r/QELtp8sVaC15E7oB0bQzNcAfztRMZ1mgNbm82yDrotHIxWC/fTk6D+N1WD5428lF1UtSrHfLS/yB18KxprE2I/7J5yA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(376002)(396003)(366004)(39860400002)(36756003)(53546011)(478600001)(83380400001)(107886003)(6506007)(8676002)(31686004)(31696002)(71200400001)(5660300002)(966005)(186003)(4326008)(8936002)(7416002)(54906003)(2616005)(2906002)(66446008)(6486002)(316002)(122000001)(38100700002)(6512007)(26005)(86362001)(91956017)(66946007)(76116006)(66476007)(64756008)(6916009)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SWNSemtkK2RtYTZLNXBnTFlvWXhseFEyc1FSa1VIOFRvSTN0VnZQL0lzWHVK?=
 =?utf-8?B?dTl4U2l4WEszMTVHVkUzUWxZaHBMZjc1OFl5bnBZeWwra2VJeVdELzBEVUVH?=
 =?utf-8?B?cFViZDZtbUJMWmxmWDRvUldiR1hqcjlvS2ZjUzB6SU44dTlCeUJXRkMySklm?=
 =?utf-8?B?YTNTSHBUNWQrbXhod1AyS090dWk0em1YaXVsY3FLakxnT0I0R01yQ1dESFBU?=
 =?utf-8?B?YUN3U1dTcGpTNXNvYjFhMVVKSnhGWE54emlGamlJbCttMHU3RXo4K21CeFhQ?=
 =?utf-8?B?N3ZuNW5IZkxjM1Fkb1o2N21TdG5ESi9SeFNXY3ZhWXVtL2poaUpobHM3cHJh?=
 =?utf-8?B?OGExMlVLdEkxd0dTTmhlOGdmSzh0UnBLQWNlQnl1Vk41Nk9wSzhiTDNNcnJ2?=
 =?utf-8?B?MmtUK3M4ZFVPNnR0SEIvdFYzaHBzMlhUUU9pWUZOdmlVcmtQbEdTcW0vRmRM?=
 =?utf-8?B?c09OL2grWXQ2eEE0WDgvVEk5ZGt6VldMa2R5ZkxZbHRVd1FCNHBXMHRxNzNY?=
 =?utf-8?B?Mlc5Ky9GUnVPQUlhR01lYVNIMmQxNVdmeGw0UmI3QU9iQTNsZzMrQWZOM0Y4?=
 =?utf-8?B?Sm1rb1dUNnNKYnhkUEhlb3hrY0NkZUVwbTlWNDI2MUdxWHNsZ0xxanlNdTJy?=
 =?utf-8?B?WnJkS0JHaGI0Tkc0Wk5mZnRwVXkzV2dxdVZDdWFXdnlCWmlHN3IzUGFNejhP?=
 =?utf-8?B?ZVJtb2Zib25CTWVrbnQ4enhkKzBPdUFHcFI3N09lZzRhQ3BOQndjMGZIV1JG?=
 =?utf-8?B?Nmx0d1ZiQVBSczRXdWJYVnVqQmpZTFlQNlhRQ0hXMWo0Z3VQWTdnSy82NmZW?=
 =?utf-8?B?RFQ4MlFMdmR0cjVKaGcrdjJSakhoeUJSUllPL3RlQWU2bloyNmtuMzk4dkhX?=
 =?utf-8?B?blExT3hZT0thYVZjT3BKSXVra3R6b3Qza3I2b3VaSEZLdENwKzlFbnpPZ2JF?=
 =?utf-8?B?M0thY1JzeC9SVncrS28vVW5tZEU1OW41aVNJRFJSR2JvQjRqYmpLdzBES3FF?=
 =?utf-8?B?ZWtNNmFKVWpoNlZnZGY5c3AxOGdnaGIyeS9TYkF0eDJHSnRZNnNYWS9HR0Jp?=
 =?utf-8?B?eS90RDErbnczd2U2SzhkVzdqcVhTYkVtVEFrYmdWNTZtbyt6M2V5OW9LSHdV?=
 =?utf-8?B?bkhqaFlQNC9aUzFjUmk0TmhRNDg0d05ZZTlKNHZiM21ZVWdjTTgvbzk2cEhm?=
 =?utf-8?B?cUdkemtXRFpMT2poZlM4MzM2Sk1ZWGtqUUVwemxHaHExejZhTEZaSWh3U3Ix?=
 =?utf-8?B?SVRCT2ZXaWVGNWY0K3lQTk5jODR0YjVQUUpGSzJSVTBDNHlQcEpOWndVTW0w?=
 =?utf-8?B?RGd2UHlicVE2YWQwMzUyYTBYcXZUaktmbFhla2NtWmxENjFUeXIxMWY5emNM?=
 =?utf-8?B?UnN2SlY3MG1BTHVYRTduM3RSRnVWTHBBNTE2SG1nbU5XcTExN0kxd1h3V3lk?=
 =?utf-8?B?OWNMTjhwZk1TK1Z4OWY3SGV6VVlMbzB3SE5hTkI4N0tKSzA1MVcyRmo1anpm?=
 =?utf-8?B?aHJxQ0ViNTVvbFFpbHhZWHZmOFBibGZZYlY1SC8vdGlrcW9IR1dtMVN1VGVt?=
 =?utf-8?B?WHBlWkVoRDA3b05EcElvZ053Z01JdENzQit6MWNMQnBUZGVRTHBDdlozQkJT?=
 =?utf-8?B?Zk9vOFdLSldzeGo0R0gwR0RtcjJtVmRMbDM4aFVFMWZROTFnOUZabEM5TG42?=
 =?utf-8?B?cFRobGpnYkpkWDN6V0hqMDdYKzZITEFrTHZSeHp5VlplSmJEc3ZtOUQvNjVV?=
 =?utf-8?Q?7nax6cyXHoWULij9TQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C87CC52C847D714988C17FB274BB9796@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cca893-f3ea-4a20-cc28-08d91ad7eab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 15:08:10.6585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bvSf7lU9NzJtggh+In/tevgYoLT2H3U2+9mqixDuazGtnlr4+qIWV88Db5SbDm2iQpmD63gj9E3aguFMQ4JnS3NG/F7pmsy8MbYlaLk6XKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, broonie@kernel.org,
 joe@perches.com, Cristian.Birsan@microchip.com
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

T24gMTkuMDUuMjAyMSAxNzoxNSwgVGFrYXNoaSBJd2FpIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFdlZCwgMTkgTWF5IDIwMjEgMTI6NDg6MzYg
KzAyMDAsDQo+IENvZHJpbiBDaXVib3Rhcml1IHdyb3RlOg0KPj4NCj4+IFRoaXMgcGF0Y2hzZXQg
YWRkcyBhIGRpZmZlcmVudCBzbmRfcGNtX3J1bnRpbWUgaW4gdGhlIEJFJ3Mgc3Vic3RyZWFtLA0K
Pj4gcmVwbGFjaW5nIHRoZSBGRSdzIHNuZF9wY21fcnVudGltZS4gV2l0aCBhIGRpZmZlcmVudCBz
dHJ1Y3R1cmUsIHRoZSBCRQ0KPj4gSFcgY2FwYWJpbGl0aWVzIGFuZCBjb25zdHJhaW50cyB3aWxs
IG5vIGxvbmdlciBtZXJnZSB3aXRoIHRoZSBGRSBvbmVzLg0KPj4gVGhpcyBhbGxvd3MgZm9yIGVy
cm9yIGRldGVjdGlvbiBpZiB0aGUgYmVfaHdfcGFyYW1zX2ZpeHVwKCkgYXBwbGllcyBIVw0KPj4g
cGFyYW1ldGVycyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBCRSBEQUlzLiBBbHNvLCBpdCBjYWxjdWxh
dGVzIHZhbHVlcw0KPj4gbmVlZGVkIGZvciBtZW0tdG8tZGV2L2Rldi10by1tZW0gRE1BIHRyYW5z
ZmVycywgc3VjaCBhcyBidWZmZXIgc2l6ZSBhbmQNCj4+IHBlcmlvZCBzaXplLCBpZiBuZWVkZWQu
DQo+Pg0KPj4gVGhlIGZpcnN0IDQgcGF0Y2hlcyBhcmUgcHJlcGFyYXRvcnkgcGF0Y2hlcywgdGhh
dCBqdXN0IGdyb3VwIGFuZCBleHBvcnQNCj4+IGZ1bmN0aW9ucyB1c2VkIHRvIGFsbG9jYXRlIGFu
ZCBpbml0aWFsaXplIHRoZSBzbmRfcGNtX3J1bnRpbWUuIEFsc28sIHRoZQ0KPj4gZnVuY3Rpb25z
IHRoYXQgc2V0IGFuZCBhcHBseSB0aGUgSFcgY29uc3RyYWludHMgYXJlIGV4cG9ydGVkLg0KPj4g
VGhlIDV0aCBwYXRjaCBkb2VzIChhbG1vc3QpIGV2ZXJ5dGhpbmcgbmVlZCB0byBjcmVhdGUgdGhl
IG5ldyBzbmRfcGNtX3J1bnRpbWUNCj4+IGZvciBCRXMsIHdoaWNoIGluY2x1ZGVzIGFsbG9jYXRp
b24sIGluaXRpYWxpemluZyB0aGUgSFcgY2FwYWJpbGl0aWVzLA0KPj4gSFcgY29uc3RyYWludHMg
YW5kIEhXIHBhcmFtZXRlcnMuIFRoZSBCRSBIVyBwYXJhbWV0ZXJzIGFyZSBubyBsb25nZXINCj4+
IGNvcGllZCBmcm9tIHRoZSBGRS4gVGhleSBhcmUgcmVjYWxjdWxhdGVkLCBiYXNlZCBvbiBIVyBj
YXBhYmlsaXRpZXMsDQo+PiBjb25zdHJhaW50cyBhbmQgdGhlIGJlX2h3X3BhcmFtc19maXh1cCgp
IGNhbGxiYWNrLg0KPj4gVGhlIDZ0aCBhbmQgbGFzdCBwYXRjaCBiYXNpY2FsbHkgYWRkcyBzdXBw
b3J0IGZvciB0aGUgUENNIGdlbmVyaWMNCj4+IGRtYWVuZ2luZSB0byBiZSB1c2VkIGFzIGEgcGxh
dGZvcm0gZHJpdmVyIGZvciBCRSBEQUkgbGlua3MuIEl0IGFsbG9jYXRlcw0KPj4gYSBidWZmZXIs
IG5lZWRlZCBieSB0aGUgRE1BIHRyYW5zZmVycyB0aGF0IGRvIG5vdCBzdXBwb3J0IGRldi10by1k
ZXYNCj4+IHRyYW5zZmVycyBiZXR3ZWVuIEZFIGFuZCBCRSBEQUlzLg0KPj4NCj4+IFRoaXMgaXMg
YSBzdXBlcnNldCBvZg0KPj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvcGlwZXJt
YWlsL2Fsc2EtZGV2ZWwvMjAyMS1NYXJjaC8xODI2MzAuaHRtbA0KPj4gd2hpY2ggb25seSBoYW5k
bGVzIHRoZSBCRSBIVyBjb25zdHJhaW50cy4gVGhpcyBwYXRjaHNldCBhaW1zIHRvIGJlIG1vcmUN
Cj4+IGNvbXBsZXRlLCBkZWZpbmluZyBhIGEgc25kX3BjbV9ydW50aW1lIGJldHdlZW4gZWFjaCBG
RSBhbmQgQkUgYW5kIGNhbg0KPj4gYmUgdXNlZCBiZXR3ZWVuIGFueSBEQUkgbGluayBjb25uZWN0
aW9uLiBJIGFtIHN1cmUgSSBhbSBub3QgaGFuZGxpbmcgYWxsDQo+PiB0aGUgbmVlZGVkIG1lbWJl
cnMgb2Ygc25kX3BjbV9ydW50aW1lIChzdWNoIGFzIGhhbmRsaW5nDQo+PiBzdHJ1Y3Qgc25kX3Bj
bV9tbWFwX3N0YXR1cyAqc3RhdHVzKSwgYnV0IEkgd291bGQgbGlrZSB0byBoYXZlIHlvdXINCj4+
IGZlZWRiYWNrIHJlZ2FyZGluZyB0aGlzIGlkZWEuDQo+IA0KPiBJJ20gYWxzbyBjb25jZXJuZWQg
YWJvdXQgdGhlIGhhbmRsaW5nIG9mIG90aGVyIGZpZWxkcyBpbiBydW50aW1lDQo+IG9iamVjdCwg
bWF5YmUgYWxsb2NhdGluZyBhIGNvbXBsZXRlIHJ1bnRpbWUgb2JqZWN0IGZvciBlYWNoIEJFIGlz
IGFuDQo+IG92ZXJraWxsIGFuZCBmcmFnaWxlLiAgQ291bGQgaXQgYmUgcmF0aGVyIG9ubHkgaHdf
Y29uc3RyYWludHMgdG8gYmUNCj4gdW5pcXVlIGZvciBlYWNoIEJFLCBpbnN0ZWFkPw0KDQpJIHRy
aWVkIHdpdGggb25seSB0aGUgaHcgY29uc3RyYWludHMgaW4gdGhlIHByZXZpb3VzIHBhdGNoc2V0
IGFuZCBpdCdzIA0KZGlmZmljdWx0IHRvIGhhbmRsZSB0aGUgc25kX3BjbV9od19ydWxlX2FkZCgp
IGNhbGxzLCB3aXRob3V0IGNoYW5naW5nIA0KdGhlIGZ1bmN0aW9uJ3MgZGVjbGFyYXRpb24uIFRo
aXMgc29sdXRpb24gcmVxdWlyZXMgbm8gY2hhbmdlcyB0byANCmNvbnN0cmFpbnRzIEFQSSwgbm9y
IHRvIHRoZWlyICdjbGllbnRzJy4gSSBhZ3JlZSB0aGF0IGhhbmRsaW5nIGFsbCB0aGUgDQpydW50
aW1lIGZpZWxkcyBtaWdodCBiZSBvdmVyLWNvbXBsaWNhdGVkLiBGcm9tIHdoYXQgSSBzZWUsIHRo
ZSBzY2FyeSANCm9uZXMgYXJlIHVzZWQgdG8gZGVzY3JpYmUgdGhlIGJ1ZmZlciBhbmQgdGhlIHN0
YXR1cyBvZiB0aGUgdHJhbnNmZXJzLiBJIA0KZG8gbm90IHRoaW5rIHRoZXJlIGFyZSBCRXMgdGhh
dCB1c2UgdGhlc2UgdmFsdWVzIGF0IHRoaXMgbW9tZW50ICh0aGUgRkUgDQpvbmVzKS4gSSB0aGlu
ayB0aGF0IHRoZSBIVyBwYXJhbXMsIHByaXZhdGUgc2VjdGlvbiwgaGFyZHdhcmUgZGVzY3JpcHRp
b24gDQphbmQgbWF5YmUgRE1BIG1lbWJlcnMgKGF0IGxlYXN0IGluIG15IGNhc2UpIGFyZSBtb3N0
bHkgbmVlZGVkIGJ5IEJFcy4NCg0KPiBBbHNvLCB0aGUgbGFzdCBwYXRjaCBhbGxvd3Mgb25seSBJ
UkFNIHR5cGUsIHdoaWNoIHNvdW5kcyBhbHJlYWR5DQo+IGRvdWJ0ZnVsLiAgVGhlIGRtYWVuZ2lu
ZSBjb2RlIHNob3VsZCBiZSBnZW5lcmljLg0KDQpkbWFlbmdpbmUsIHdoZW4gdXNlZCB3aXRoIG5v
cm1hbCBQQ00sIHByZWFsbG9jYXRlcyBvbmx5IElSQU0gYnVmZmVycyANClsxXS4gVGhpcyBCRSBi
dWZmZXIgd291bGQgb25seSBiZSBuZWVkZWQgaWYgRE1BIGRldi10by1tZW0gb3IgbWVtLXRvLWRl
diANCnRyYW5zZmVycyBhcmUgbmVlZGVkLCBiZXR3ZWVuIEZFIGFuZCBCRS4gSSBhZ3JlZSB0aGF0
IGl0IGNvdWxkIGJlIA0KaGFuZGxlZCBkaWZmZXJlbnRseSwgSSBhZGRlZCBpdCBoZXJlIG1vc3Rs
eSB0byBleHByZXNzIG15IGdvYWwsIHdoaWNoIGlzIA0KdG8gdXNlIHRoZSBnZW5lcmljIGRtYWVu
Z2luZSBmb3IgQkVzLiBNeSBETUEgaGFzIG5vIGRldi10by1kZXYgRE1BIA0KY2FwYWJpbGl0eSwg
c28gSSBuZWVkIGEgYnVmZmVyIHRvIG1vdmUgdGhlIGRhdGEgYmV0d2VlbiBGRSBhbmQgQkUuDQoN
Cj4gDQo+IExhc3QgYnV0IG5vdCBsZWFzdCwgb25lIG1pbm9yIG5pdHBpY2s6IHBsZWFzZSB1c2Ug
RVhQT1JUX1NZTUJPTF9HUEwoKQ0KPiBmb3IgdGhlIG5ld2x5IGludHJvZHVjZWQgc3ltYm9scy4N
Cg0KU3VyZSwgdGhpcyBpcyBhbiBvdmVyc2lnaHQgb24gbXkgc2lkZS4gSSB3aWxsIG1ha2UgYWxs
IG9mIHRoZW0gDQpFWFBPUlRfU1lNQk9MX0dQTC4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3Ig
eW91ciByZXZpZXchDQoNCkJlc3QgcmVnYXJkcywNCkNvZHJpbg0KDQoNClsxXSANCmh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEzLXJjMi9zb3VyY2Uvc291bmQvc29jL3NvYy1n
ZW5lcmljLWRtYWVuZ2luZS1wY20uYyNMMjY2DQoNCg==
