Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0695F73F3C4
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 06:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2AD47F4;
	Tue, 27 Jun 2023 06:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2AD47F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687841624;
	bh=FCSOqz9c3ZGPm4wgEHPn2ELR4cVUdybz688rpglMWfk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MLpOFLSzw9RZKeZ7QCqqU4vBs0C//G28+Cd2EHmp8C1vXu1C6Ix5hoDcEsbp8zQZW
	 MBROu0hMeBs0AH8fBBxdvT3lwk0XmOVekYh2qjZlUGQGHCkZ5AEeb4aQufnr7Q9AKZ
	 ypmN67pAQWCGumyoOA8j4ZLmVWBeaJoeg9w2Bs3c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42F51F80246; Tue, 27 Jun 2023 06:52:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF206F80212;
	Tue, 27 Jun 2023 06:52:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0507F80246; Tue, 27 Jun 2023 06:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33B96F800E3
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 06:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33B96F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=sy/+8Sgl;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=LHqa4LLa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687841567; x=1719377567;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FCSOqz9c3ZGPm4wgEHPn2ELR4cVUdybz688rpglMWfk=;
  b=sy/+8SglQduKQJx8H+MLUnhFH883IlS9AMr9qGOUHrKaUvojk+MGHWt7
   k8tIYbGdt0Tq7YB4soiZKPlcwlti+5wZiso+9AxbZSdMbD4D0OoUT2p9f
   aiMupUhhgQHgCctvsEODYnGNyhRs3NAowQgMGwC4AVu3GPQyu0Lh9/Mrm
   OL1tKq2ORx0wt3NoRphh9n4txx+SFwne+hcifyuOfV+G1hk2s+0wo9WmA
   4OZ9NSgP9YQPEq68cw5vWvdS+zJt94YZaWK4Jq+bIfgyxQmRIkXuthPwJ
   LzCiulNQgvHLpmdQzcfRiQMIvHu/4HCdolTDRzBfoPf3nQwVbCFgmQ6+L
   A==;
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200";
   d="scan'208";a="232359084"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jun 2023 21:52:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 21:52:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 26 Jun 2023 21:52:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WH87MAa13A3ALIhqyYPresBQXEAFMf9mPwnLzfCfJcXf9mXTuBGLigMhE1Nf9LmkPb0vkwAKjp1YqgguSRDSg71UyDcl3GmeoV0j8r/TZC9yAtzU5FIbgJziExVJJ9yoUa4QMa9Wh9dLIiJpu/dK7GT6nsxXrxnoxyC7DoXnlPtqZvgrsV7Lsz2ToueaGHOTiHi0r8tStkGxLJBnNv06EttIJeyYJkHgk1nByq+fd0kHH8+5XSldtYtAZmHUCyBAJXkhSVLuM943NaDHuNXQ3q0n14ZRcAFUc2ZVnG01RvjcvqkHLTXjmfn9uqHbbPITyGGTS31C8wqhdnyXHdnx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCSOqz9c3ZGPm4wgEHPn2ELR4cVUdybz688rpglMWfk=;
 b=SPpKC+gstKPrz4bZxBTYnc3y9tehutKDs0O21yIqPKT0Z6MYIDLVQQGzfPeAgq6D0TGSKLa5KXmxeuSY+rPIuJ/aMC/MgApvAFvMO4zg4QEMTx8IvJQ1fPL4m+/H0++qjUQzU1BbQ3QhnZXQxDmONUv62fmpf69pYRnpRUGUjD+CRI/VmR6XhYwmhLrTTTnErqF911JZv1rgiDtT2IUQAsDYjcRGGDYBZieqr4sd1AF9QGNzt+E0e0zffSYaZAuG8pje8QeWEZmFF7hIQfec7yYJhVZYRLY5Zc7ydEyxWreINJyiYehYT2OobldZRIq4jRUCWbQrzbZL5FRxrGKc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCSOqz9c3ZGPm4wgEHPn2ELR4cVUdybz688rpglMWfk=;
 b=LHqa4LLanpMu4X7AHzhKuCrgxptPybgjmQBk7L8XF+rJG4IpFFa2PWw9Sfr7U6/jB+g9Jg2rha5FbTKV7aZ2ybxCDkcRi3klb7Xtt66aZS49ADnGphPi5YEeOx2fTerEzwOnR+zoDXHYWPo2Meu9JEuiLtB8sdpx70rKNBgIR3Q=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Tue, 27 Jun
 2023 04:52:27 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6500.031; Tue, 27 Jun 2023
 04:52:24 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Syed.SabaKareem@amd.com>, <broonie@kernel.org>,
	<alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yangyingliang@huawei.com>,
	<venkataprasad.potturu@amd.com>, <ye.xingchen@zte.com.cn>,
	<Vsujithkumar.Reddy@amd.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 05/10] ASoC: amd: acp: add pm ops support for acp pci
 driver
Thread-Topic: [PATCH v2 05/10] ASoC: amd: acp: add pm ops support for acp pci
 driver
Thread-Index: AQHZqLMqGLazz5CIJ0KLnv6jP9GzZg==
Date: Tue, 27 Jun 2023 04:52:24 +0000
Message-ID: <d7f6c2e7-8c22-c33f-b354-30da6519c4d1@microchip.com>
References: <20230626135515.1252063-1-Syed.SabaKareem@amd.com>
 <20230626135515.1252063-6-Syed.SabaKareem@amd.com>
In-Reply-To: <20230626135515.1252063-6-Syed.SabaKareem@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|DM4PR11MB6478:EE_
x-ms-office365-filtering-correlation-id: 8db19187-8010-47cc-18f3-08db76ca4c98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KZE69lphYZ4SOF2Tjh3HHxF9lNPwLo4nt+avXF52wlyECSViq8Cte+9tYy9h9DbH4KbitLtjcU5O9vfoxUQAq5T6jJn2s12cNtpTRrb5ETB8uUudwKGWVGoHD/lRqG9KIyfjrE1xAHJ8CFif/tSNo/MkfQAC/aiZ8J1rBA7CQzTKkFOjMxwoi1Y01yj6LCMA2+N7YQO0BHWofJTPwxLfyyrk5enHUxACgk86L9EP9q8WqOh2fIsuUS/pCjCdmnqA5vf+Pxtaoxi/mzGd7JDkDhpJNZoql+oOQ6MkL2PjKy5AiW3OwO4WGvv8dllgovfuhaluo6alzCGJHypB9/ckP4QbhHM00DcPvxa97p9YbN6HgqweAWI0IIyu2e+7sEOEnC/al+1L1UmY41ZSOKMFWIBaUJndj5UeWo8GH9OEKErbyI5sWLvcKnuhO1xiJ8Z9i6DkI1pCCj+Gm4q3q1n7cyv+MpbZyzt0G8o1sIDIO+rddV73mTsmRzDtuFr4PaCDiLgS97DL3gRd4XpCUvm6R1Jj+Ll85dV1pUalB9MKAhxj97QDOeRqaL8pU8HHms4AWYn6/MNjXEuvuDbAbw7peEHU9Ao6FKTvGj/Vm4MDNrX7rZ1unbWN+HaUPKysr9qKfTlmhiwLB/Z3FyoasNADxhpzM1d7FXC6UJ/WqQTULiU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(2616005)(2906002)(53546011)(6512007)(6506007)(4326008)(26005)(66476007)(66556008)(91956017)(36756003)(66946007)(316002)(64756008)(66446008)(76116006)(186003)(6486002)(122000001)(71200400001)(110136005)(54906003)(86362001)(31696002)(38070700005)(478600001)(83380400001)(41300700001)(38100700002)(7416002)(8936002)(5660300002)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?czFJZVlpWi9ieVFNNlRtNkZQelRXSFk3aXlnRDhvQXZNWUxSUHdETUtKRDVr?=
 =?utf-8?B?b0hyM3VqYTd3b2Y2SUpEQWJYNnFDNTdTMCtWVEZrdGVwRHJ1azhwYzNaMnJ6?=
 =?utf-8?B?UFp5cDhheGZUSU44MDdNQ0NDSk1hbGI1SERiTDJ2YUhUeEFLaHV2allBUHlU?=
 =?utf-8?B?N1dKN1psN0tub1ZmdzFMNHpjOFBEZ2VFcno4TDR0S2hSM21mTUtYSFdOYnZM?=
 =?utf-8?B?NXlPcVYxbUhIMTNrSUxnM1ZmUzZpZ0Z4ZjRxSWN6SERNYlJhS2V3RkNBY1F0?=
 =?utf-8?B?a3FEOC9uSjlRQk8xTGQzaGpldFBJNkI2UXJ2a2FnbTUzZ0t6b2pWSDluNEF1?=
 =?utf-8?B?WGhXVW5mU2IwQ2JkY3RqR3NtNUJSTHh3Zzl4SVZEeDJUVGpSa0NBazBIbCtz?=
 =?utf-8?B?NWdLeWlqckdVZWFueUxaRjBsck9HL3JraFdXTWpOampYbUI0bmkzclJwYkRv?=
 =?utf-8?B?NWxBMzRQM0pjSDI4YWFwdkxpTWZiQW9OR1hTb0cvcktoQUJwZXRJd1FMZE10?=
 =?utf-8?B?Smo2OFZjamRBYlJpcXlMM3JyN1V3QXVETjhPeHo4MEZVYjErbEFtUVNxa3VK?=
 =?utf-8?B?SVBwUlJIUVlEeXphZ1ptV0RsdVp6V09Xd3EwUmxpMTZ1Y2hFa2ZjTngvL0x3?=
 =?utf-8?B?WjhVUHVETjUwS2hDWXVGK25LazJkWkRpcjhjZldWbElWSzIrazF3M0xaMy9P?=
 =?utf-8?B?RXl0WHdKSGwwK0FmLysvRWNyZDZxSFJWU0xobjhveEtoYktZZWNKUXZRaFQ5?=
 =?utf-8?B?NklqVExsUll0TFdxSGxGcjlZSXVtS21ROHo4OEduRHVsYnV6TGlXUXd4MzE1?=
 =?utf-8?B?cENiQUtLcFZseHRRYUR2dWJHRENpb1BFdG9JMys2cUFVMUt3dlRhbEJuV2Z6?=
 =?utf-8?B?ZnhRdnZRd2VlNE5EamJBL2NjMkFSeUo3SmxWVkM5M0dEWCtLQzVuTTEyMkNV?=
 =?utf-8?B?SHMwSzU0ZTNnanlpN0ZTbU0zM2RQdExtTjVkQ0tTYkgvK0dCM0VRS3hKcnVw?=
 =?utf-8?B?RkZWaXZTQmhSUk1kTzVvNEhEWWFlaXhkcnRwWmJhNTJUS2ZnaGp4VEQzWWNu?=
 =?utf-8?B?ZmNLeEF6SjNZajh1MXFXTkk2bUdjV3dmK3g2bGh0U0prWEd2V0w0RGZrc2Zl?=
 =?utf-8?B?VHVWSjNSd2RUaXA0RU5xYkgwYjBBanJydDdqRS9sYm1PdWRzelBmWE1tNDJk?=
 =?utf-8?B?eFB4MXp5UUY1RUVlS05uZDdOS1FPNHVERTVvV00vQTdKNTY4Y1V0TnR5Ky9l?=
 =?utf-8?B?WXp5T3BQQU9rM2d4VS80NlYvTGUvYWo0cHBOWGxwNnJZT0hnZ1dkK3ppZGJy?=
 =?utf-8?B?L1lQb0RwanNZeXRROHJoZHVvOFUxS2lWNTA3UHZHTkZRaEFYbGxaWmNiVW9q?=
 =?utf-8?B?RzNncVRiam8vWGlrVFpXcmpVUEhCM0JiaWw5Uk1YSnF0YjRBOGJIY240OStU?=
 =?utf-8?B?L3gxbzlZT3kzckw5akpGR05SZnlPRUtOcFlwNzlRTVc1bnh2aFMzLzFYQkwv?=
 =?utf-8?B?Ym1NckRoZVhDa0tCMWpJN0lrRTd3SUN4czB0Y2pzTGlIeUY1UCtZSlNyYzVv?=
 =?utf-8?B?WkY1RG52Y2hwR2RTYlJRNWJPaHZhOUZZdzhwWE0reU14aDZtQmZDcnk4SjlK?=
 =?utf-8?B?MEVIM3B6UkpDeHVGQmlVWExCRDRnL0ttTUJrU3lGYTYxc1Z0WGlpMEtZSDBU?=
 =?utf-8?B?cFBXcXY4d0dISVVSSmlpbGcvVVJFRVdGdlRwRmlQK1ZxU0JkbTYwTEY3UWV0?=
 =?utf-8?B?YzVRNVNWdnZtWkxpY2JLb1lRdTdQNXlNNmliWndKTGVyMHRQa0I5ZGorRHJj?=
 =?utf-8?B?REUxaWF3VUphNndkbk5kMys0NjJndVFxYVdIZUVBNjNFZy9tbWY4OFQ1NkFi?=
 =?utf-8?B?djVIOVpuSXQ0eTNhMHNFTU1iT2tGNEVIMzNHdkh2L0RkTlVXbmNMOXI1UFhz?=
 =?utf-8?B?MHBoLzdHWitDNW44QnM2WVgzbmNSWWxVWHV1V1U3ZFZXS1MxNkx4UmJwRjZ6?=
 =?utf-8?B?U2Y0U2ZyZlozMCsvejE3RUk5ak8wOUdDNHNNN0hiVkI2SmpKaGwyWkxpbFNZ?=
 =?utf-8?B?aUNtMGxSMlFDMzg3SW10cmY1U3ZQb1J6ZUFxa3NJSFVnL3B2d0kzU1QxRWYx?=
 =?utf-8?B?Mk1PM1B5Wm5EbWUxYnNGZmZjQkxJUEtiaE9jMkJLcDZSU0Y4OE5ZaHFkU2E3?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <120FD091EC727D4387AF2D7A69F3DDA1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8db19187-8010-47cc-18f3-08db76ca4c98
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 04:52:24.3050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 8WYy/j6G4iyXM9qj7nYsKFxN8bnOu/lsq61ffAJzYp1j8rIAQRKQYGPh7rGND3b/AwFcLW5ynvS8udnNkMA4Yw3XYyGxHalpnM9mSt0A36Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
Message-ID-Hash: 4AJOLXJPYW2CBNFGIWRHJ6HUBCJVW2DB
X-Message-ID-Hash: 4AJOLXJPYW2CBNFGIWRHJ6HUBCJVW2DB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4AJOLXJPYW2CBNFGIWRHJ6HUBCJVW2DB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMjYuMDYuMjAyMyAxNjo1NSwgU3llZCBTYWJhIEthcmVlbSB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBZGQgcG0gb3BzIHN1cHBvcnQgZm9yIGNv
bW1vbiBhY3AgcGNpIGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN5ZWQgU2FiYSBLYXJl
ZW0gPFN5ZWQuU2FiYUthcmVlbUBhbWQuY29tPg0KPiAtLS0NCj4gIHNvdW5kL3NvYy9hbWQvYWNw
L2FjcC1wY2kuYyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291
bmQvc29jL2FtZC9hY3AvYWNwLXBjaS5jIGIvc291bmQvc29jL2FtZC9hY3AvYWNwLXBjaS5jDQo+
IGluZGV4IDRmZWRhZDFiNzQwZS4uYTMyYzE0YTEwOWI3IDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9z
b2MvYW1kL2FjcC9hY3AtcGNpLmMNCj4gKysrIGIvc291bmQvc29jL2FtZC9hY3AvYWNwLXBjaS5j
DQo+IEBAIC0xNiw2ICsxNiw3IEBADQo+ICAjaW5jbHVkZSA8bGludXgvcGNpLmg+DQo+ICAjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiANCj4gICNpbmNsdWRlICJh
bWQuaCINCj4gICNpbmNsdWRlICIuLi9tYWNoLWNvbmZpZy5oIg0KPiBAQCAtMTQxLDYgKzE0Miwx
MSBAQCBzdGF0aWMgaW50IGFjcF9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBjaSwgY29uc3Qg
c3RydWN0IHBjaV9kZXZpY2VfaWQgKnBjaV9pZA0KPiAgICAgICAgICAgICAgICAgZ290byB1bnJl
Z2lzdGVyX2RtaWNfZGV2Ow0KPiAgICAgICAgIH0NCj4gICAgICAgICBjaGlwLT5jaGlwX3BkZXYg
PSBwZGV2Ow0KPiArICAgICAgIGRldl9zZXRfZHJ2ZGF0YSgmcGNpLT5kZXYsIGNoaXApOw0KPiAr
ICAgICAgIHBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KCZwY2ktPmRldiwgMjAwMCk7
DQo+ICsgICAgICAgcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoJnBjaS0+ZGV2KTsNCj4gKyAg
ICAgICBwbV9ydW50aW1lX3B1dF9ub2lkbGUoJnBjaS0+ZGV2KTsNCj4gKyAgICAgICBwbV9ydW50
aW1lX2FsbG93KCZwY2ktPmRldik7DQo+ICAgICAgICAgcmV0dXJuIHJldDsNCj4gDQo+ICB1bnJl
Z2lzdGVyX2RtaWNfZGV2Og0KPiBAQCAtMTUzLDEyICsxNTksNDkgQEAgc3RhdGljIGludCBhY3Bf
cGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwY2ksIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lk
ICpwY2lfaWQNCj4gICAgICAgICByZXR1cm4gcmV0Ow0KPiAgfTsNCj4gDQo+ICtzdGF0aWMgaW50
IF9fbWF5YmVfdW51c2VkIHNuZF9hY3Bfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQoNCllv
dSBjYW4gZ2V0IHJpZCBvZiBfX21heWJlX3VudXNlZCBoZXJlIGlmIChzZWUgYmVsb3cpDQoNCj4g
K3sNCj4gKyAgICAgICBzdHJ1Y3QgYWNwX2NoaXBfaW5mbyAqY2hpcDsNCj4gKyAgICAgICBpbnQg
cmV0Ow0KPiArDQo+ICsgICAgICAgY2hpcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiArICAg
ICAgIHJldCA9IGFjcF9kZWluaXQoY2hpcC0+YmFzZSk7DQo+ICsgICAgICAgaWYgKHJldCkNCj4g
KyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiQUNQIGRlLWluaXQgZmFpbGVkXG4iKTsNCj4g
KyAgICAgICByZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51
c2VkIHNuZF9hY3BfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCg0KKHNhbWUgaGVyZSkNCg0K
PiArew0KPiArICAgICAgIHN0cnVjdCBhY3BfY2hpcF9pbmZvICpjaGlwOw0KPiArICAgICAgIHN0
cnVjdCBhY3BfZGV2X2RhdGEgKmFkYXRhOw0KPiArICAgICAgIHN0cnVjdCBkZXZpY2UgY2hpbGQ7
DQo+ICsgICAgICAgaW50IHJldDsNCj4gKw0KPiArICAgICAgIGNoaXAgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsNCj4gKyAgICAgICByZXQgPSBhY3BfaW5pdChjaGlwKTsNCj4gKyAgICAgICBpZiAo
cmV0KQ0KPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJBQ1AgaW5pdCBmYWlsZWRcbiIp
Ow0KPiArICAgICAgIGNoaWxkID0gY2hpcC0+Y2hpcF9wZGV2LT5kZXY7DQo+ICsgICAgICAgYWRh
dGEgPSBkZXZfZ2V0X2RydmRhdGEoJmNoaWxkKTsNCj4gKyAgICAgICBpZiAoYWRhdGEpDQo+ICsg
ICAgICAgICAgICAgICBhY3BfZW5hYmxlX2ludGVycnVwdHMoYWRhdGEpOw0KPiArICAgICAgIHJl
dHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBh
Y3BfcG1fb3BzID0gew0KPiArICAgICAgIFNFVF9SVU5USU1FX1BNX09QUyhzbmRfYWNwX3N1c3Bl
bmQsIHNuZF9hY3BfcmVzdW1lLCBOVUxMKQ0KDQp5b3UgdXNlIFJVTlRJTUVfUE1fT1BTKCkNCg0K
PiArICAgICAgIFNFVF9TWVNURU1fU0xFRVBfUE1fT1BTKHNuZF9hY3Bfc3VzcGVuZCwgc25kX2Fj
cF9yZXN1bWUpDQoNCmFuZCBTWVNURU1fU0xFRVBfUE1fT1BTKCkNCg0KPiArfTsNCj4gKw0KPiAg
c3RhdGljIHZvaWQgYWNwX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBjaSkNCj4gIHsNCj4g
ICAgICAgICBzdHJ1Y3QgYWNwX2NoaXBfaW5mbyAqY2hpcDsNCj4gICAgICAgICBpbnQgcmV0Ow0K
PiANCj4gICAgICAgICBjaGlwID0gcGNpX2dldF9kcnZkYXRhKHBjaSk7DQo+ICsgICAgICAgcG1f
cnVudGltZV9mb3JiaWQoJnBjaS0+ZGV2KTsNCj4gKyAgICAgICBwbV9ydW50aW1lX2dldF9ub3Jl
c3VtZSgmcGNpLT5kZXYpOw0KPiAgICAgICAgIGlmIChkbWljX2RldikNCj4gICAgICAgICAgICAg
ICAgIHBsYXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKGRtaWNfZGV2KTsNCj4gICAgICAgICBpZiAo
cGRldikNCj4gQEAgLTE4MSw2ICsyMjQsOSBAQCBzdGF0aWMgc3RydWN0IHBjaV9kcml2ZXIgc25k
X2FtZF9hY3BfcGNpX2RyaXZlciA9IHsNCj4gICAgICAgICAuaWRfdGFibGUgPSBhY3BfcGNpX2lk
cywNCj4gICAgICAgICAucHJvYmUgPSBhY3BfcGNpX3Byb2JlLA0KPiAgICAgICAgIC5yZW1vdmUg
PSBhY3BfcGNpX3JlbW92ZSwNCj4gKyAgICAgICAuZHJpdmVyID0gew0KPiArICAgICAgICAgICAg
ICAgLnBtID0gJmFjcF9wbV9vcHMsDQoNCllvdSBjYW4gdXNlIHBtX3B0cigpL3BtX3NsZWVwX3B0
cigpDQoNCj4gKyAgICAgICB9LA0KPiAgfTsNCj4gIG1vZHVsZV9wY2lfZHJpdmVyKHNuZF9hbWRf
YWNwX3BjaV9kcml2ZXIpOw0KPiANCj4gLS0NCj4gMi4yNS4xDQo+IA0KDQo=
