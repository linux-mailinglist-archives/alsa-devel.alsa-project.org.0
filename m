Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1409651F66F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 10:16:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E16189C;
	Mon,  9 May 2022 10:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E16189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652084165;
	bh=1rrk/hgXGXSON3GlBMmXnKcJg3o8WQenEvGrZUfNHAk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XngRRqAp3VC9IiQcK1nF4MF7gQcDCRzXVr80ZWBfg0uEu7geRk2hOU4N5ho5FKFx5
	 X5gOZZ+Ru4g2MAHqgXi7H5GDdarTmWFjeiyHnZvwZVC7pv93QX4Aov4mIU30RoAVL0
	 FfOSKXuB3LHVtA/JcLYEqmNNmnVTJA/PzVCdTVNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBE72F80269;
	Mon,  9 May 2022 10:15:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8350F8025D; Mon,  9 May 2022 10:15:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EBD0F800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 10:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EBD0F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="he2EUTLX"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="ZOWkKOr4"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652084097; x=1683620097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1rrk/hgXGXSON3GlBMmXnKcJg3o8WQenEvGrZUfNHAk=;
 b=he2EUTLXlDuuLAlhyeMTcdk2VHeikUmFEh3hxoR7peQ9ikzS1w2xWrua
 kJOBKN8wxU1+lfCI4jDvszXZJ3SZJVtPHlR6O5ZpmPPre5606yaus/UIg
 Vm4YpIIR+G4QfxNzKJGwovCdqDz9AWI8ym7giATxHXge8OcxsaGwgnDgr
 QZN/1gqIghYHV+bMGkf9UHmJSZKqE0T67Vxuqr72MGAvlBwaxPDetS9J/
 vn7rQ9FEDq2jY7nSbIM1RejVaNAYAoHGTXf4YZWUenTo+WOFJLQfvnBvN
 Fs79lI5Amgsdql+CvGMnXYPRIFcYXXYYrsVA8qKP9I61X1gnhfVPX3n4i Q==;
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="163207348"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 May 2022 01:14:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 9 May 2022 01:14:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 9 May 2022 01:14:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0LRaDNm5/oDjtuWJ0jqv8rCwQJjKlrtkuG+Yo59vQSrMPAv7uHJuAgAmqbpQe5UQpy5+cgIMY09ezdxuzSY41hfsJFq1ADNlCQPUqfiJLkmkRDmyGpZcjZ/0zBu2ZFUrjJSg9bTGCSOJXmvFi0fG2OBLDiyz2THDsJLNeAHU40auHm7UdakGSnSjZU3JNBet4CUsXyXrWFcbt984NpcXFfWQoj8c9EWLUSv0tpQzRUR6vgEZPvlaYfDSfUU1PBJEs1dV+dqdm90/ya5wjbX3/sAWo/haHX9I7hTgfQ4iraLkBSsRgdmwPexYoU+UrBAlJ6va/50HC1YGewcHlF+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rrk/hgXGXSON3GlBMmXnKcJg3o8WQenEvGrZUfNHAk=;
 b=hLy/ntDDsyabyI4qesxdcungU7zUruAJr5AaL+VtC2kGfnNl8nmSlfHMcT7Uy48RVbynxEHH9ig/q4HcatENq51d3K3B9JqIQQ1kR1YfIpanbJQT7h6TWEOLSKv84L977N6b2AbDGDVnwRt/Jw95d9V2IeiK5Br+23vDSJEfKglhPPTHr+l/lARQU7I8mNT+1ao1ti6uMEfDSv40+Xbo7BlQNMvphYvUr3dUrNmmZT4CMwEoNBOpfBjOSYAh3jnRHvXfpBfkcgdHIKFNv4EMASLb5pdqaCL3QcGHEJaoZ1kXFqD6hHU/6xK/jq2LUmc6Wgik2eqHvwCEUFAi8Mrq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rrk/hgXGXSON3GlBMmXnKcJg3o8WQenEvGrZUfNHAk=;
 b=ZOWkKOr46cpGL/om81i9XKFBTIL1/uP4Em1z9KqHewjKQGv9PHsWRBIIVvRa/LQs7ZrFUTVrvJq9wMmBLfiuHwoSiTZCnToOIDVUOZV9u+hH7kiN+CBRRxsaEUkMSY7zpZw20DUswSx/hdk5HeSlo1eL2XwupU2ZOp7iDmQNiWk=
Received: from MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 08:14:46 +0000
Received: from MW4PR11MB5936.namprd11.prod.outlook.com
 ([fe80::3c24:30c4:ee81:9f1c]) by MW4PR11MB5936.namprd11.prod.outlook.com
 ([fe80::3c24:30c4:ee81:9f1c%3]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 08:14:46 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: sam9g20_wm8731: Use dev_err_probe() for
 snd_soc_register_card()
Thread-Topic: [PATCH] ASoC: sam9g20_wm8731: Use dev_err_probe() for
 snd_soc_register_card()
Thread-Index: AQHYYUnEgH8PzLC/fk+84q/6drxSS60WNxuA
Date: Mon, 9 May 2022 08:14:46 +0000
Message-ID: <a13e7278-5c13-b59f-f508-a15acec4bb0c@microchip.com>
References: <20220506130349.451452-1-broonie@kernel.org>
In-Reply-To: <20220506130349.451452-1-broonie@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8e183d4-997f-4a4c-d275-08da3193faa5
x-ms-traffictypediagnostic: CO1PR11MB4978:EE_
x-microsoft-antispam-prvs: <CO1PR11MB4978603531AB57215B190315E7C69@CO1PR11MB4978.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f6NZviOOrmYqWZLKG9xXYwQyzNcdu/BQyO1Q4HyWDBNAIL0xFu5PgAg4DwO6ZEGzuxh/UrBr8KLWG8RZmxa91RNVlRfodI+bZ3hJViWb/ZWc24r8QF+to6Gywl1+MdmRuF+reV1oZ86s1l79eFpdlH9sJboCttOs06ArGTj4Yn2leEEeB2lgccFRCoriZXGeYACck8AqnC9T/ZQXqoFwqwy6o6mEtJBXzNlKNHrAuyo2piimGqjXKe9y+AVXobrmwimfX0/hReSGGVkizJEuywrQRGyfeCisTotZ3+Ux04xy8MP71qBvHhoL9GSQAwfrMTNExDNT+RrI6juI8uO0EG4eVfY5PZai7cPAao6VSWvuiWdu2b02iO9RQ6nCy8kOTqpSV70xtDFI5qc463lKhFS5L2gDo8P7tSellTHvS+YVUqWBAIuAUju2S5eeGaWTCvRNy989sWDdabW6VCKP1cc5K9zitQzjgQvlc0tR8E6D7FSASFvdNnDfVg9IUebRyICb2eY6KCdxxS0BjD+ny42gA/Rk5GMbuG0A8b5ygRTEM5o7zNM5dUPG1WWoo7NMkULh6gtdAjgfb1vC1/Zbot+YCg1zJnuvRpnW3/NgJJPP/b3w6kE8iymJFvlEZ0o7LQTb8PMhps8CULwg/tZdX2TBUJWi5Ds4fIcEG8JYi4i5M9m8GhxJSiLOtet3rn2lPWbHfVGVn7jr2vzDB02rceLqqwhx9DOR4vooKAUwNORXXD7y2zsofzL4QuwpH4Ddph27RhiC6dOC+NwqubIc/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5936.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(6512007)(66446008)(2906002)(76116006)(8676002)(4326008)(64756008)(36756003)(91956017)(71200400001)(86362001)(5660300002)(66556008)(66476007)(53546011)(2616005)(31686004)(31696002)(66946007)(4744005)(6486002)(508600001)(38070700005)(38100700002)(110136005)(122000001)(186003)(316002)(83380400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajR6ZEdqNk0zZms2S3RVbjhJSFA4bHk3YXlIYkdZS1NHbzduOFA1U3ZyUXZs?=
 =?utf-8?B?cHpXdGs0UHJyL1RBdmh2dmJ4TThHdWVWam5OYTMxTFltZzI4dzQvVlZjYWl0?=
 =?utf-8?B?ZVUvcjFrdFdIbkErTDB5MTE5UUR5dHdxQ25RSjVNUW4wWHBYTzBjcUdEUWFz?=
 =?utf-8?B?ZTFMZUlpQmdwYlJxRDVqRk5aWkN3Wm84RGE1Y3V3OVQwbTFBUXZtZTc3UnZi?=
 =?utf-8?B?U1RUVVFRZW9oZktCbjRNTlRVREtTWjRPR0xkVWpGVGhkanpsdEd1V1kwc0di?=
 =?utf-8?B?RmxJNGVmemVOR1I1SWxjZVYwRFJjbVpDVklpV3AwMXVOVUZwUHQyWHZ5T2lT?=
 =?utf-8?B?TG9wOW1WM0lyeEl2N2Ixcys0NTRPQU9kUjZ6MFc1UGFTVzE0My9BcTBPUW1h?=
 =?utf-8?B?YmtFS1dVS0tCMzZyWTJ2NDZMcTUwZzh0OFUxRVphZEY0K3FXVGJ3VUVnemlP?=
 =?utf-8?B?U0twcEJQVGdNR08rY1BGTW1BSG9qMU9PV3ZoVGJyWFNsdE5USDUxR0d5OEtx?=
 =?utf-8?B?ZnZYcEt5aEVycjlHTVlyRFkzc2F6TWhWRzJDL1oyam9kK3BrelRUYURmRU16?=
 =?utf-8?B?aUdPMlJxVEdjWGJ4a0tneHd5NEJzeHNHczZUcmxhZVl4dXZrRU1SNjg5cWFk?=
 =?utf-8?B?eVNaMU81UU03ZllvcUVDOUlLVENZWndqdVF6S296TDFxRXUydEtONmQxNE4r?=
 =?utf-8?B?QU9XY3FmZnU1alluRWdSMDczWEl1U0F3SGd1TUFtU2ZqWXZENkVHUHZrVmEz?=
 =?utf-8?B?QmV6L0FDeFRqbElmQkFBenJBeWpKdjZHVWtUMXJGKzZDaUs2OCtlUG5KejJC?=
 =?utf-8?B?QWNoM0M3MUgyN1FxK3pubXZSRGhOMmxyRXo5Q0MxSFVZMDZWTy94Q1ZpeG05?=
 =?utf-8?B?cGRQVUZya2tKelF5N3ZzTnFDTGhHcDhrOU15MzIxaFl3OTkzaXdDenlwTWpm?=
 =?utf-8?B?emNjMlhQemNTMDI1Z0lYYzBtcmNMTnA5elg2c1A3WEI4dFRxNlQ2SjJrakdp?=
 =?utf-8?B?ZjJ6ZUdiZGJQSUR6NTFDWUNaSm9YUHpCRzZRQW1Rb1hNSVlGcGRzVXZyNDhC?=
 =?utf-8?B?MEtZejI4NUxLTmUyNTN5cVBzM0hiTTFMNnBrS3BpbHk2bHpxRjNBVEQ4UmVw?=
 =?utf-8?B?aCtjTkYrcDI4QXdkaTMwbXF1NTJpVnQva0xyOXh2VDFJY2NtNEhlVzIxWnRi?=
 =?utf-8?B?Zkl3d1NYc3FqVzZWbHdBallYUDRMSTlndVBCejZXMUp2Z0ZyVzAzQWtRRkxL?=
 =?utf-8?B?M2hmMlR5Vkt5SWVlZzA4dlV5cVVTaFR0Q0NZUmVQRUs5YUlIU052alZaei9a?=
 =?utf-8?B?Qlp1NGRwaG95VHlPdDEzV1dtMStyaFhOcWpWQ3pFTEdMOWozNFVxbTFyVlpP?=
 =?utf-8?B?NEViQWNhWGhQSGFtVEJoSUpzUU5yekdSb0NEYVpQdkR6YXMyWGJzWitPSmhm?=
 =?utf-8?B?SFhSanNMZ2RRNWxMbkY1SHhOcEQrT0VOQUtGZ0Rha29PNkJFUm1VMnlacDVO?=
 =?utf-8?B?RkZ6N1lrMVhsUU1OZXBrUkFGS3dpc3hMdTJoSy8yamlCYy8vYXdhQkJuak1u?=
 =?utf-8?B?NkFUcEhrd1BRSEVvTlB5WWE0ZllkT2xpbE9mV2l1SW1CYy92ZTNTdURlNXU1?=
 =?utf-8?B?cDRIL1oxN3VmcDg2WW1TRmR1ZERIdDI3eXFDVmxMRytIRlZtQjNiZGRpZnpP?=
 =?utf-8?B?WGw4MVRwZVdSTE5Da0pEUW9RU2hYeFpuTysxeHdxWkNZZldGejNlb0d6azBj?=
 =?utf-8?B?NWloaDBYQkx6alpueGdZbzcxNHNBTDd6NzY0cTV3UzBRSW9DOHJGRGp6ZkRD?=
 =?utf-8?B?NXcrNzI1NnZlTytjVVJxdTZVY0VzQkZlWjFTTkpQS2F6ZUxDcFhyRmNNdlQy?=
 =?utf-8?B?TmtyeFR6cGRIRDZsVnczTkJ0czlUWXBVNm5OQWl3THA3c1d5VEtaVXNHZ1ll?=
 =?utf-8?B?RytUVjVrODQvcHNIb1J0S3UvbnByVnpuMVlybU1UOEhoQVpnNWhIaE16YzFu?=
 =?utf-8?B?Y3NobkxXbzNOWS95bzlRbjFXejBSM1FYTWRvZ2ZtRkdUV0QvYTF5eHB4WEdr?=
 =?utf-8?B?NmFXdElNUDJHM0tCUUhyYndtS0hhcTNyNmp1aUlNc25jRFE1Tm9lMzh1bWZi?=
 =?utf-8?B?SFgxbUdYdmJzMEI5SVl2NUE4THhJYVlFQ01Qc2xId2lWeVllQ0xkZU0rcWdR?=
 =?utf-8?B?WkdPT0Zjam01ME91WFdtMTV2Y0ZqdlBXY2hzOURNR2ZGeUJrRW1PbDVVSmFY?=
 =?utf-8?B?b0l6eVh1KzBLSEhWR1dHVW5GVjdTWkkycy91R1ZuUTFhOE4zcWlxZS83bmwx?=
 =?utf-8?B?eDFHZEZLVW1xZ1dmM1MwU3B2OUs0b25LQWcrb09lM2ZBanpjaSt0NXJnVDlm?=
 =?utf-8?Q?Dr2CazAHqZvLcls2wX1cfb3VgTvEH7ifxhBqj0PnSTG+a?=
x-ms-exchange-antispam-messagedata-1: B1XoLvOHjQRjC8pgQtjrwP04nJc+a+jkTfA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC33AA6FA973A04393C78F412E2F0860@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5936.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e183d4-997f-4a4c-d275-08da3193faa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 08:14:46.0846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8qjmW2nydT4PaSTtoT/n0iyujkbBGf0DDNjUhwmiERF4u2R7cb9vOceIkKTi5GBjK1ZMPGmWuzMFw8XRBPrjVlMLDexcwFn89a0vyABVcaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
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

T24gMDYuMDUuMjAyMiAxNjowMywgTWFyayBCcm93biB3cm90ZToNCj4gTG9nIHRoZSBlcnJvciBj
b2RlIHdoZW4gc25kX3NvY19yZWdzdGVyX2NhcmQoKSBmYWlscywgYnV0IGZvbGQgaW4gdGhlDQo+
IHNpbGVuY2luZyBvZiBkZWZlcnJlZCBwcm9iZSBlcnJvcnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5OiBDb2RyaW4g
Q2l1Ym90YXJpdSA8Y29kcmluLmNpdWJvdGFyaXVAbWljcm9jaGlwLmNvbT4NCg0KVGhhbmsgeW91
IQ0KDQo+IC0tLQ0KPiAgIHNvdW5kL3NvYy9hdG1lbC9zYW05ZzIwX3dtODczMS5jIHwgMyArKy0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo=
