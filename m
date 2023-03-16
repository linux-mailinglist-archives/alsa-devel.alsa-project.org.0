Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056606BCDAC
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:12:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41865114D;
	Thu, 16 Mar 2023 12:11:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41865114D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965154;
	bh=38h8RszX/Yy3renblwue+3s8xd6q8PN5nkZwXb3fUJ0=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=U3+ZdhKuVua806+dldqFhC6+AnOrr15DoegSfCqcg6Ih/6Epck1qRWAjPCStLdwZX
	 /IXLd9pzXxOGaxUYOxzfJEjJHjWlBuQVrcsKFuPMj5vQPTN1L4hnOBbfmX6JPzxt/4
	 1HrCC8s+qh+JyyLH0gcaJb24SaK0ucT2VGOVH5bM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03875F80568;
	Thu, 16 Mar 2023 12:10:27 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 029/173] ASoC: atmel: mchp-spdiftx: Convert to platform
 remove callback returning void
Date: Thu, 16 Mar 2023 11:10:13 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-30-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-30-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6BLAWRSAIYFWMP4RNHLTYTQHODGES42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896502566.26.9078763656613204117@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A58D1F80568; Thu, 16 Mar 2023 12:10:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F86AF80564
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:10:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F86AF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=YiHXP08O;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=l0H2avQv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678965021; x=1710501021;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6K7WzhXDW4MUf1QrjSNE7gD9eaWM0FM5YT+5Zg0PPCA=;
  b=YiHXP08OfRmnz4b29AWSBG/FeeM+VHJZMY+xr5ZP5nIySFueWf3GausQ
   aog37T/9SJbbpjdCyjNjD8DNNhwpaS4voD/0iosa9NLA0ENiOhCUkgW+E
   J8whKvd13B07YpcMa2jauJiUF5Dk+vLm6RRu/VBKNhrFhdElsv9LdhfaQ
   ggqPtlr3C9FTpxcFHJxaImLQVyjxiYeZx4IXu7zDQNQUfznbqKsmHDa9f
   lGHgF6bFDV+ssUtNoEfWqrXHC6hwSUskvaT57+jh1KWUftaKqiiyRhdJh
   vDLwtjqQu85v0HOtbRGAbVhvoQWcql068EiERD6I6QlJs/kKjzR7+2uxq
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="201944484"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:10:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:10:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 04:10:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwmfU7bUMh3YGSQcRPeGZg98QytwxzUi1jva60tQrdJrQcEM4ktV0Qd4dcBKiqKmV6a1FHkulzekqeKEm1j/SZ1dc3kg+qotPSuWEAI9X9G4Y8Z7aiZaH9ybtjxDmoDqtuo0Tdc0N3DEDeV2FuW7biO8iQenc/ShTdmItXOIrpRqeqt8W2oFpACWgiSkcsWqxNdQIPiLQYwy37GXs6ner84ZASbMtJCXdFFBdznoWh7l+gb7UXJmb+xugc6EyB/JALoIerEXZJvQazB827S+Zn1Y8q9giuHJEsXwqlUTukdtzN6etRGcYGnq+oGDuYfG6OZyUuD/0Pzb2mJTzY4cPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6K7WzhXDW4MUf1QrjSNE7gD9eaWM0FM5YT+5Zg0PPCA=;
 b=MFR1n2RC0/DWndj8dWNAKWuQsiCPRSGvB0axRvUoGHFzlRRNxuhQ4WztqAvn7fOClmZTWK+PtUjHks1WABF/5uFcV1mS8KxUWs2QTJbNMrfK9D0ck7o4L89xVFiiAeVq4iNIc459sZcJZ8LVV6VD/BmcTKgfD9K5x4zsgyJJEZOdHxwKB9N63+/U5Vg6wnDnMYRw1FLBaRa6+ADGK89jUYwaXwHjYANpIg1nBrTpd+SzLqdut/3GSvgz3o1gIcg0ASq5MoV24rx7lBwisK51zGBQCs1eDfSTZYxPPiuKJA8rmvr+7RQCN0GW0y/8lxEbrXGlkdGBkUS3dYdn7D5sTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K7WzhXDW4MUf1QrjSNE7gD9eaWM0FM5YT+5Zg0PPCA=;
 b=l0H2avQvg6RyeOAGDSR23gFxDTiRHDF0B5Hi+VfDlVSb8p/vMcZFgHlg88j3D9rDcd2CXzLNLJ+Yw3xVIrUvOitsWBsuXleKg99t1T2ei28gtOfoObuAGTerEqW/0dXuQJSf2CU2RSn0fk/GRlJT2RHqv5HS6fIpD3ibdr8eomE=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:10:13 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:10:13 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 029/173] ASoC: atmel: mchp-spdiftx: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 029/173] ASoC: atmel: mchp-spdiftx: Convert to platform
 remove callback returning void
Thread-Index: AQHZV/fh599mABynk06nAsRzZtdKHw==
Date: Thu, 16 Mar 2023 11:10:13 +0000
Message-ID: <d4a72904-b04f-7ca5-69b4-d009c782478a@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-30-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-30-u.kleine-koenig@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: 4edb33c2-4604-4853-6dce-08db260f03b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 J0iaBiT0oc5RmIRaqQtsmjWA2Cg/DnsrWir00pqY8yHHt+wcwsS6m2yAR+GxF46/0vGMCKV0ufS7FmNS9nGX2kfYrCtZW+YBqJ6nxKbmc2x5XgFdX2UM813wBunkwLvLTd5iYheZj9O1iuCM4eMlbyW667IoifIo9rn2tnA94tSkk4TmoXQvnAIf0mbE/KxXk116+pwtfRS19w5n05LwRlfWGACexiS8cfW80XlaMDhrZS6PpR6Fet9fSdsAuRV5psuMCSpWO7748MfVTn0txx1nLpfEhhgtktTynGClH03/Q7r2v/Rsm7IIXZda3lH5jFHdV5CfqunczdhuWurb4+q0rRrvsIHxYL2o+VTpaLRfuuy3sK6x1cotsKXUZBmNDgqK7iD9TXrz92A4TMwdR5CMb0vDagFgkalA6FBVol2fPD8Xme/n3HxDMjWZfYDlXHepWaohxJlTvIVqRAJBrAipfgKuOXAnL3MRKR9pD/f9zTjIL7oDrEvAcgou59bI79PgAgqnt568EXhDyY7zXZ+xEEZQWBNukVDkRlXKPpkmWXnxuxkfusflE/gcdHBd6f9IfgFb6odBZSqD8/7Mb5bmpdWdkQPUnXVN4E2g4QvqIWsl3Ipz/y4oplcAJf/8BYkI5C59e4wADKMoToxJ60NyoqAWJl1fkAthQt8Jscv66Qu1wK7aJMj22UwEWsqafQcmikZBO0EYE+p9siYte74xp9qzSjwhDpkEgqNHBKrTWeZDp0SI4A3v8bs8SF74iR/bZ2uaxGtZ7CX0CRSMIg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(38070700005)(31696002)(36756003)(122000001)(86362001)(71200400001)(66946007)(66556008)(66446008)(76116006)(66476007)(6486002)(91956017)(64756008)(110136005)(8676002)(4326008)(2616005)(478600001)(6512007)(83380400001)(26005)(6506007)(54906003)(66574015)(316002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NEZCWitnMVpETDBsbFdBRTJRMWIyaVlFK1pJam9jVDRKMXRvVVNqdGJiYU83?=
 =?utf-8?B?Wnd5YjdyMmVkYWVSOVJKa1NFdWRWMFgyWTZoWWtydVpsVUJuRzVBYy9ZWUE5?=
 =?utf-8?B?cTlzUTYzM0RjTzZ2TU9KUnZPYVM2Z1Bad1Y0eElVanRxbzkxOXF4THptOHFK?=
 =?utf-8?B?eWZ0ZGFwdzZrekRUSzFwMnBTM0FmVTl4UTh2aDFUK3FkZUhyVE0vdnZtalJr?=
 =?utf-8?B?QkVJckZBQi96VzEwRWtDK2Y1ZC8zdUpWbUkvbG52MmdGVHVaMWIyMG1WUjNL?=
 =?utf-8?B?UkF6SlBvQUovTjlZbDdocWJJeStoOWxDQ2hXbGh1UUxsbW5uNldCL0M5UGNY?=
 =?utf-8?B?Nk1hRzlYeEtOeHE4UE1mZHFpOUVhYUc4WHlBSUlGSnAvU3hIWS80bzNSM3pm?=
 =?utf-8?B?eDRuS2RuT2t3NWx4MlJ2MCtMd2QzVUlBRGxWOXZySVRzRnFWSzlqNWJkWFAr?=
 =?utf-8?B?WmpldXpmY2RtUnJna2x2SnZhaTMxTHNwNDhjZU9xbmRaWkF0VHh2amRPakZ4?=
 =?utf-8?B?aGI2dGpWUnZwc0d4Ym4xQWFPVmtuMUJHR09zbFEvYkMzbmlqMVhHcUwxNi9p?=
 =?utf-8?B?QURoc3diTVF4ajltR0NYZG93QXRVR0I2cVJYWVFMSEhPekR6bUJvU1ZoYmVS?=
 =?utf-8?B?MUNiNUM5TDhKZmFkKzdBc3p4cDl2cHhsMlQ3UkpFMDlmdHU2RkNsMmY0RVRJ?=
 =?utf-8?B?Rnl2VXp5dlluMk1jZ1lQeW1oaXpEV3gxa3FHQ1BsWjRrWHNQNEVhcEFNWHVM?=
 =?utf-8?B?YXZBZnZ3WWgyRTRhSkRsOUoxNjZJUEkvRDVXZkwzanFqMVlGKzk4NHFXWDU1?=
 =?utf-8?B?WG9ZZFJyY2p3dkFFODRZTldCREZQQmI0TkE3VTZwNFk2UE9jN25hYVM1eVFC?=
 =?utf-8?B?bXcxdUNHZWdRMHA0czRsQklHeXFwZGdXMWhCM2phWFBWekNUSHNDYThNV0hn?=
 =?utf-8?B?UG42clJ6OHJXYlBIT0xJTEYyK2lCQ1Jick1OWmdFa1lxOVdNeXgrNG1VMDZn?=
 =?utf-8?B?d0VrbnAzdGVCN3ZrVmIzT2V6T1JLcXJYemJCZ2pHZitWc2w3UndBa2JiVGd2?=
 =?utf-8?B?elNwN20wejlKRzZpT2IzNXBMdUdUTm5ZTjRseFFhRFJkUVNaZFQ5YWhOaUxS?=
 =?utf-8?B?UW0vZU8xK0hBckg5TlFXTlpzVVpibGViY2I2aTNuWkZxRExzTnYvekNGbU9u?=
 =?utf-8?B?c2k0V0QyenRrQ2tFbnZ0Z2UrajhuakZQTW5YVHJmUDVXdDBrRi9WNXdIVENY?=
 =?utf-8?B?TzE4clE3RmltaW5PZ3Rnc0d5MEwxcTJZZlI1WWN3L0hnblZob1ltZWQ1b3Vr?=
 =?utf-8?B?cXVOazZ2aWhLdktRdXppbUJsOWdVUWtxYzUxTGdobUZXNFMwbzk3TUd6ZlFN?=
 =?utf-8?B?Zk1Cb1VXeDZ2N2RNMFRxZWk2VGkxZGJHNjJCQkJXVzZFVTJ6SnVEN3dKcTJ5?=
 =?utf-8?B?T2V5Q0lYYUtITE10V256Zjkza2lwS3dHSFN5MTJ6WjhieUxKYjgyaE1DajQw?=
 =?utf-8?B?cklQMXpBZEFIb3BXWXNpWWljMHRKc0VYZXg5dkE4YzVoK204a0lRVzVSZSsr?=
 =?utf-8?B?WmVoUWQrZGNIL0JGUkprL0ZzZDc2ZjR0MmhjN1BmcWRjTkhWOHBEV3JYMjBC?=
 =?utf-8?B?VXphaXBnSjR6LzFDaldYaGtEVVZraHl2eHd5b1hyNnJpTzlZN2VFUFpId0lu?=
 =?utf-8?B?bG1tRm1wSXVOVHZxQmNzSkhNU1JjVEh6TmZrWUhkM1hMbjZPdGtmVTdJY1BP?=
 =?utf-8?B?b1FXQmJkQmxITUVLWjZIVU5TYlZpWHR3UEtZdzBONmtsWFVaSE9NUTM2c1hr?=
 =?utf-8?B?ZzFMVm9qbkY5SnBWSk55TU1lVFBEVVBUVUdvZEJ1L3hmeDZpdGJLZXFGekxO?=
 =?utf-8?B?K0xmTzdKVHpGa1RtbTM5KzhrZG53RDVnd1NkYnR3eGh4cHRNWG1pWG5pMUg3?=
 =?utf-8?B?SExMdm01cUxuSkJuZjQ1Z0QvTlFIVFo3K21OTUo4NHpOVHVUc0NZZmRWL1JJ?=
 =?utf-8?B?RndJOS91cDd1eFp1eGNzNS9IeExnK2NpdEVUNTNZajJIMFpMdXVrdW1Tdkkv?=
 =?utf-8?B?ZkVJU2FtTEhCQkhKQUVUa0FFUnJVRGtOTVZacHhmWFZhbGZLeFE4QWVmbG1P?=
 =?utf-8?B?NmdCTElMMzB1eHYzVkcyRWJ0STd0Z2dEd0FKanlLbzNvZ0lZcWhIVU9ndHdJ?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15CC84A433AEDF4E84E9E91316F9E202@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4edb33c2-4604-4853-6dce-08db260f03b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:10:13.1422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 fSiECiQh4oO7zPhJpRKp1/lB2IIpD2Kbb+Op2xXNkRM0Y01ihnCPDwJcafEVqRvIzz5Sd/9xPT/oPkiEml4/wf1up7+CY2FNDiVMVUBHwuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
Message-ID-Hash: A6BLAWRSAIYFWMP4RNHLTYTQHODGES42
X-Message-ID-Hash: A6BLAWRSAIYFWMP4RNHLTYTQHODGES42
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6BLAWRSAIYFWMP4RNHLTYTQHODGES42/>
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
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2F0bWVsL21jaHAtc3BkaWZ0eC5jIHwgNiAr
Ky0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL21jaHAtc3BkaWZ0eC5jIGIvc291
bmQvc29jL2F0bWVsL21jaHAtc3BkaWZ0eC5jDQo+IGluZGV4IDIwZDEzNWM3MThiMC4uODUwY2Q5
N2JjMjI5IDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvbWNocC1zcGRpZnR4LmMNCj4g
KysrIGIvc291bmQvc29jL2F0bWVsL21jaHAtc3BkaWZ0eC5jDQo+IEBAIC04OTEsNyArODkxLDcg
QEAgc3RhdGljIGludCBtY2hwX3NwZGlmdHhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gICAgICAgICByZXR1cm4gZXJyOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgbWNo
cF9zcGRpZnR4X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3RhdGlj
IHZvaWQgbWNocF9zcGRpZnR4X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgew0KPiAgICAgICAgIHN0cnVjdCBtY2hwX3NwZGlmdHhfZGV2ICpkZXYgPSBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YShwZGV2KTsNCj4gDQo+IEBAIC04OTksMTMgKzg5OSwxMSBAQCBzdGF0aWMgaW50
IG1jaHBfc3BkaWZ0eF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAg
ICAgICAgICAgICAgIG1jaHBfc3BkaWZ0eF9ydW50aW1lX3N1c3BlbmQoZGV2LT5kZXYpOw0KPiAN
Cj4gICAgICAgICBwbV9ydW50aW1lX2Rpc2FibGUoZGV2LT5kZXYpOw0KPiAtDQo+IC0gICAgICAg
cmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWNo
cF9zcGRpZnR4X2RyaXZlciA9IHsNCj4gICAgICAgICAucHJvYmUgID0gbWNocF9zcGRpZnR4X3By
b2JlLA0KPiAtICAgICAgIC5yZW1vdmUgPSBtY2hwX3NwZGlmdHhfcmVtb3ZlLA0KPiArICAgICAg
IC5yZW1vdmVfbmV3ID0gbWNocF9zcGRpZnR4X3JlbW92ZSwNCj4gICAgICAgICAuZHJpdmVyID0g
ew0KPiAgICAgICAgICAgICAgICAgLm5hbWUgICA9ICJtY2hwX3NwZGlmdHgiLA0KPiAgICAgICAg
ICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKG1jaHBfc3BkaWZ0eF9kdF9p
ZHMpLA0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCg==
