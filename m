Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC4F72945C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 11:09:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FD5C6C1;
	Fri,  9 Jun 2023 11:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FD5C6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686301796;
	bh=iYuhm0v0o+lqZKAlhmqUPNu4B6YUhxRnDbyycvLMwzc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PeydBea7Mhgq0NzHEvHQMEbI13zJmFm4RvoFFbIyMc2M38e4ysQZI75iKdqCgueFV
	 rABSqlCZH+geVskM4Ja7EXFvy1HtTttRVy9T+Ey2eXJAaIYO0d9m6S7pTdw6rWc/3a
	 s2iBRGtdidTYEGfRySknlBuf4eqPRaPXaOo0XnmI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5F83F804DA; Fri,  9 Jun 2023 11:08:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 459E1F80199;
	Fri,  9 Jun 2023 11:08:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7022F80199; Fri,  9 Jun 2023 11:08:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6705FF800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 11:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6705FF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=RGh228E/;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=sXlMrhxA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686301716; x=1717837716;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=iYuhm0v0o+lqZKAlhmqUPNu4B6YUhxRnDbyycvLMwzc=;
  b=RGh228E/5CjYZq0S5G6m42rvnAqBZfsCI3RGqVCnZ0lBIXc+pG6vmFtg
   L2XRX+A/mc1zqYKDCikYmTFmjYgxlanZnrgwG5qv0s66XDySgauRSJsNd
   TemtMAz2J2oZTfb7k0TCt4G6zaerbvKrC0Ypx39H6Kk28+Vo3xZTAbtP6
   RgHH+DqmAUX9/tY4/aZNs+Tw7UyJUdjkFbsNgVsmZTQ/Q8HwDMORpE6FJ
   L1qQ1XNvvVoXJaayxAsG7yCmc8EBAQny8QZRpc67o9G9RlLGfsCVI5B4u
   bgrI96d8IT5Ye9bnjFLqOb82P1IrRpFb4I851s213mShwwk7CTIMRobVf
   g==;
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400";
   d="scan'208";a="156240951"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Jun 2023 02:08:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 9 Jun 2023 02:08:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 9 Jun 2023 02:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3w3rTrjNTXvLRXP4UjTN1eB1uO3mUJHTUAd7Ec6pG3iVArYn1N7NVAKFX44C6xp1A9spZjbElfPD6RIUiivGJUsgFx87mEX8AhQ6Yeuxi7xTOkQShpWRIUXgfdhv3NnBm7V5XazqpxiHTi/3PAu8NiRA5QAWvmDxK/TN3hrohUQ3R49bDm4SqTg0YrAtZSFJQJ096tNx1BGviiYMsVTPrmAAwbzcNMAvQzWPCa5ZOTvOjC9l5v8VOEDoCPEFAK/RU7mO7WPb2xgSWjjQI1R7Vi43FCDCM/DrammvJVqCZHiexmRxbhNqXewRH+8ASatNlpe1wVAZUImqOK3fFDTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYuhm0v0o+lqZKAlhmqUPNu4B6YUhxRnDbyycvLMwzc=;
 b=ZJcFuVrw8b2+IAZkp7EUX0ndfZxk76AtlvDLS8QjVfBZiW4du1x1vS5/cWCerZ3COhc92n2+dACQ4uEu7ocKx+9P/S28bIc7x0WCDjDOvz3TnN4CWJqlMyuhiEVzmcZmkDxv49gP0hIHkpfB+TF+jLNyeMJgYPXxVGHATOKOWKg4jormG4a7rJDRXZ/AEIYx4dTHwYZEpcv50SrFKLTYDXrK5YjvrJpLbOJgcJFm/anMgXhjvbImzIhqAb7pDIU0ylQBl6xmjH5vdWxZX9ud5n/kP7BMP0MUwFyyiVLEvnhIo9Bt6ptpuHx6sG3j50MwVlnlLhVbZrHsygk+trlvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYuhm0v0o+lqZKAlhmqUPNu4B6YUhxRnDbyycvLMwzc=;
 b=sXlMrhxAIdJ4UiPihjDnWEgMk1fbYqQ1ZGLWzWJEwBphZBpG7yeI9Ywp3j0Lq4U49XsU3uyDo8w8YQ3ze91+4GWjTfPZ1w8UwSDTquxZAb7F4kRzKmI3GB8hacBtFg07qAhSM1csjy6Hrd4GV7Za86b3LMtOwWIw7CtP+m+l+Fo=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Fri, 9 Jun
 2023 09:08:14 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6433.024; Fri, 9 Jun 2023
 09:08:14 +0000
From: <Claudiu.Beznea@microchip.com>
To: <walker.chen@starfivetech.com>, <broonie@kernel.org>,
	<dan.carpenter@linaro.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: starfive: Fix an error check in
 jh7110_tdm_clk_reset_get()
Thread-Topic: [PATCH v2 1/2] ASoC: starfive: Fix an error check in
 jh7110_tdm_clk_reset_get()
Thread-Index: AQHZmrHsuAlXuy8ntEWArIjoUhzN9A==
Date: Fri, 9 Jun 2023 09:08:14 +0000
Message-ID: <6b4811d5-3c64-9f9c-c7d9-d75b1eff98af@microchip.com>
References: <20230608135750.11041-1-walker.chen@starfivetech.com>
 <20230608135750.11041-2-walker.chen@starfivetech.com>
In-Reply-To: <20230608135750.11041-2-walker.chen@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|SA2PR11MB5017:EE_
x-ms-office365-filtering-correlation-id: ac0e7f2e-fca4-47ba-f496-08db68c90eb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XplTBgEBTGO3s7jEZwWwGyrCagpnma480Za1lYDPIxm/JBF1p/kmhg5QW869YBuljYMpfwP4M/lA7BwokmmMap8P+kerYeIJcU65/11I/8xgeLngZTqFCZe0n7dTpjrUtDokEzGw+rRhzdxtgWx3JN9ei7WVg1swWZicpLPDMPiP8iD16Mej3gjRiSwYiItvMvX3FMEqWeiDsJcVN87vwlGthkg29SpJ6xjZG7QafDBABbkBI3mn1qvXSCMGTBScT08km52aECHywlp36QRhrpXzXGmEDTxxOgBBbxYUWQWzD1MnCPNhYo0zGmnh3h1c5KT3EKCzMWcOedcyw4331VKEkves3T+ejyxm/OjDKW7N1JBror6WPq7MEOzVC81aE1BWrfSjid29bThLWLX9vxHNHMFvFilPfpXhp9Mrw7sp3KvySWYPmdNLDOdQSXIahNIDKj0BOA/nM7XlzoasVRr7v8SNhQVgBioSv5b6ddZVxOvuDjzixYxTqPEDAQgUqAS1cqxM/V79vqkq+hmFkmZI2ld+6KMm8FWHhhaDyndx5jtMb2R6VE4aiWVncbdWdPcsBHDl8VmvgufjN4TCGvgmn24dfk5K3SXWiNI5ERxMzJ5MshqBWw6aTxmHuR8Mdz0AbCLwY1dA+CpckmdlWEnyk4UHu1alsRhU4LnrYrg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(186003)(478600001)(110136005)(54906003)(966005)(36756003)(6486002)(26005)(6512007)(6506007)(53546011)(71200400001)(41300700001)(83380400001)(316002)(38100700002)(38070700005)(2906002)(5660300002)(8676002)(8936002)(31686004)(86362001)(66946007)(76116006)(91956017)(122000001)(64756008)(66446008)(66476007)(66556008)(31696002)(2616005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bE8xWXg0ajhyVlZlempGQ2lLamFkWU5yK01HV2FuQWJ2MWJhWkRab2pzK1BG?=
 =?utf-8?B?dVRhay8zMExZUXd6OHpIQXBxT1JtV1lYWUlteWhsZUhBejA5Tmw3ZGxjMGZG?=
 =?utf-8?B?WXhRRnFOZjBDUGs5UUdLeVVHdXdsV1AzcmtWeG4zT0FPaUkzeDgvcWpSeWx2?=
 =?utf-8?B?ODBIOTFNQi8rWDBRaDQyUUNWdTBiazVGS3VLREgzbVpUclhWRUJySndVOWd5?=
 =?utf-8?B?MDJyUUg2Wm9wKzFrME9GN2xUNjVXSFRrUFdwNzJjVnJ2UzJ5KzdxeDZMcDFk?=
 =?utf-8?B?d1VoejROcFBaV0U0OVRLNStiRkdrSEJpU3BWdmQrallWWm9sRGVZaGEvN0t1?=
 =?utf-8?B?SzcyZGo3RnVqMjRnT3dSV2NpN1JIY3kvZWVEbkRlTFNVaFl2c0Z1NHM0M0d5?=
 =?utf-8?B?cE04eGNPd2dybDk2bHgvTVpZcmlOMWd2SkJuSTRsTFpUL05EQ2VoVXBTQWJw?=
 =?utf-8?B?Sm9FT3JycGFheWlzRXpxM2o2OGFjZ3daVEhRY0NPbEZnbTQveU1TTWwwMlA2?=
 =?utf-8?B?L2d2b1VxYmdweVVLc3czZGx2cXhRWGU4UTVsZFlmR0tsSlI1YzJXb0hhUUNX?=
 =?utf-8?B?T1hDMnNHVWM4c1dQYk80MnF1REVxdUNxclRUcUFXV1prR2d5RjhvMEl5SzNj?=
 =?utf-8?B?L1ZoS2lvZVJQVVFiUzlZdi91bkJlMlhhOWhEUk8xV09vS28wT20rS01JRjJF?=
 =?utf-8?B?OWxHVFAxUDdMYVpubVY1MWJ6U2t3Nk83Slp3ZGJ2K0h0WUxReFlLSTgwT3ZR?=
 =?utf-8?B?VExSL1N6bS8yWDI2RURnWlY2aFVCTGdWbUpnd3RsSC8vRmIyK3gvbEcvUlI5?=
 =?utf-8?B?WUdRTGpMUDk2OUNTUnNkZVhsL2JIV0lYQXJYWmhKT2tqOCtYMVBNRVowUWQv?=
 =?utf-8?B?ckFQdVFwdXE5YzZBU05HYUZ2ZzJjN0hnVkswZ29qNkU0UnVHQnJhYmxMcjZR?=
 =?utf-8?B?cENucE5EY291SjhKYlVWMlFGekVRbWdOMWpQdmxpSEJnd3hmMVRyd1lzWHEy?=
 =?utf-8?B?Z0JFKzk0YzZNSVlwYlNZYlp1SjhncmF2MnpDVjZlWHBncTVIeTdpeDRxVUMw?=
 =?utf-8?B?ZFQ3dExMM3VGc3RuQVRyRGJVUHVZWkhid24zNDRDeGRmNTNCSGxoSk1RQm4z?=
 =?utf-8?B?U2Z0UXJ4ay9KWXR1MUZkR0RPVVcrb043WlhWNVVEcjAyMngwdUNPZ0VIS2lZ?=
 =?utf-8?B?RUtVSEJFMnlqbEpLdjJvczQvOWh3dkFLSENaR1JtV1Q3Nng4RHJiUitIMVhh?=
 =?utf-8?B?RW80ZS9ic21SdjErb3FFdWlCcVBDRlVQNS9OUGRLN3FKZlM0Y2pXK0x2Ry9I?=
 =?utf-8?B?cUZrUTVwbERka0tUaHBrbW9OUnFWZ0IxcitkNWFuKzBEY0R3emVidEtWOHZ5?=
 =?utf-8?B?T1lQTk1iS2xuRWt3alNCbWJhQXRhcVY1RzBaZ0ZEOGhtOTc5Ymt0cS84SkRz?=
 =?utf-8?B?TzJXaXo5MEZYTmpmbzNDNXNYTGZLdnhaVlNiSGJzNTE4S3ZHOTNFLzBEbUdC?=
 =?utf-8?B?Zm5jQlFLQWpXZEVQczFsS2MvRTMrTzlSaFpLVDBRRUkxQ2g5Mk9aUFV5WjE5?=
 =?utf-8?B?d0Z0K0R2RlhZMlBaTm8xVXc0ZHFEWkp1NmMwWnZTWkxEN0Zqa3A0YjM5eU0v?=
 =?utf-8?B?RXNvVzA1Mm0zTjRtcC9HWkc5eWczaFNrMGhWL2pxRlhhbjNYQmc4U1RWS3lq?=
 =?utf-8?B?azduOG1BNTZHM3FveXYyOWhXYUNzSCsyTXVDd3FCWU5wZ1dKcnBZQjUyK0lJ?=
 =?utf-8?B?ZXlrZEU1VFE4UmIyV1R1SWkrK2Z5Y1E1SlVTRnV3OHN3VlNzalhpamFUekpV?=
 =?utf-8?B?bThaYWJUWWljWGZteWJRbmhqK2xsc3hraUlVWmt3R1NIY01TTjVVZnlJbTBQ?=
 =?utf-8?B?QlVnRFZNdWhPY0E0bTRQRi91MTRuRlJscGN5NnY2WnZvbEZVcjIrd2M5akJT?=
 =?utf-8?B?Y0s5OTRvd0R0N1pGZ0xrdXQ0NCtISHBGakJLcGFIN2pUWjhBK3Uwelo0eU50?=
 =?utf-8?B?MGhmV2t2Z1huSVdZeThqRlpZUFV4aHI2K3Vuck5Tdko4Vkxya1Ayc1F4cGJ5?=
 =?utf-8?B?SUhoQ3VrU3RNL0xvYzNQM1ZhWE4xcXJZT0wzNVF2bGxhQXczaUxQaENOeHRL?=
 =?utf-8?B?QkZsN1BXUGtUWWRkZENzSGdXdHVNNmlUWVFmL0JaZ3BpWGNpNGd2UXdRQ3ZV?=
 =?utf-8?B?Z0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <730E5FA6464DA449BE94CD5EDCB6D843@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac0e7f2e-fca4-47ba-f496-08db68c90eb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 09:08:14.7504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 oRMhzznLrfNX/CntM/QJ/C4jpBOLZf2l392yYt9SvecefMBwuHYvr0R6oP8MhFN/TLqXMD5GiUJqJg+i9F0pC4pBBR1uHmQLoVOcLJ9yPMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
Message-ID-Hash: RZBYBXW6GPA3BWWMU2G3VH4BQJGLZTHG
X-Message-ID-Hash: RZBYBXW6GPA3BWWMU2G3VH4BQJGLZTHG
X-MailFrom: Claudiu.Beznea@microchip.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZBYBXW6GPA3BWWMU2G3VH4BQJGLZTHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMDguMDYuMjAyMyAxNjo1NywgV2Fsa2VyIENoZW4gd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gRml4IHRoZSBjaGVjayBmb3IgZGV2bV9yZXNldF9j
b250cm9sX2FycmF5X2dldF9leGNsdXNpdmUoKSByZXR1cm4gdmFsdWUuDQo+IFRoZSBkZXZtX3Jl
c2V0X2NvbnRyb2xfYXJyYXlfZ2V0X2V4Y2x1c2l2ZSgpIGZ1bmN0aW9uIG1heSByZXR1cm4gTlVM
TCBpZg0KPiBpdCdzIGFuIG9wdGlvbmFsIHJlcXVlc3QuIElmIG9wdGlvbmFsIGlzIGludGVuZGVk
IHRoZW4gTlVMTCBzaG91bGQgbm90DQo+IGJlIHRyZWF0ZWQgYXMgYW4gZXJyb3IgY2FzZSwgYnV0
IGFzIGEgc3BlY2lhbCBraW5kIG9mIHN1Y2Nlc3MgY2FzZS4gU28NCj4gaGVyZSB0aGUgSVNfRVJS
KCkgaXMgdXNlZCB0byBjaGVjayBiZXR0ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBXYWxrZXIg
Q2hlbiA8d2Fsa2VyLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4gLS0tDQo+IEZpeCB0aGUgZm9s
bG93aW5nIGlzc3VlOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWkg3dDZOYytOVGNH
cHElMkYzQG1vcm90by8NCj4gLS0tDQo+ICBzb3VuZC9zb2Mvc3RhcmZpdmUvamg3MTEwX3RkbS5j
IHwgNyArKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zdGFyZml2ZS9qaDcxMTBfdGRt
LmMgYi9zb3VuZC9zb2Mvc3RhcmZpdmUvamg3MTEwX3RkbS5jDQo+IGluZGV4IDk3M2I5MTBkMmQz
ZS4uYTlhM2Q1MmJkZDJhIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2Mvc3RhcmZpdmUvamg3MTEw
X3RkbS5jDQo+ICsrKyBiL3NvdW5kL3NvYy9zdGFyZml2ZS9qaDcxMTBfdGRtLmMNCj4gQEAgLTU4
MCwxMCArNTgwLDkgQEAgc3RhdGljIGludCBqaDcxMTBfdGRtX2Nsa19yZXNldF9nZXQoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gICAgICAgICB9DQo+IA0KPiAgICAgICAgIHRkbS0+
cmVzZXRzID0gZGV2bV9yZXNldF9jb250cm9sX2FycmF5X2dldF9leGNsdXNpdmUoJnBkZXYtPmRl
dik7DQo+IC0gICAgICAgaWYgKElTX0VSUl9PUl9OVUxMKHRkbS0+cmVzZXRzKSkgew0KPiAtICAg
ICAgICAgICAgICAgcmV0ID0gUFRSX0VSUih0ZG0tPnJlc2V0cyk7DQo+IC0gICAgICAgICAgICAg
ICBkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gZ2V0IHRkbSByZXNldHMiKTsNCj4gLSAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ICsgICAgICAgaWYgKElTX0VSUih0ZG0tPnJlc2V0
cykpIHsNCj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBn
ZXQgdGRtIHJlc2V0c1xuIik7DQoNClRoZXJlIGlzIGFuIGV4dHJhICJcbiIgYWRkZWQgdG8gdGhp
cyB0byB0aGlzIHBhdGNoIHdoaWNoIGlzIG5vdCBtZW50aW9uZWQNCmFueXdoZXJlLiBKdXN0IG1h
a2Ugc3VyZSB0byBkbyBvbmUgdGhpbmcgcGVyIHBhdGNoLiBPdGhlciB0aGFuIHRoaXM6DQoNClJl
dmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4N
Cg0KDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUih0ZG0tPnJlc2V0cyk7DQo+ICAg
ICAgICAgfQ0KPiANCj4gICAgICAgICByZXR1cm4gMDsNCj4gLS0NCj4gMi4xNy4xDQo+IA0KDQo=
