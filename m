Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F55085A5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 12:18:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F6CB1AA1;
	Wed, 20 Apr 2022 12:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F6CB1AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650449899;
	bh=tp7iAIr8Al+tMwFKWLRDL3kPJqqCZ7mCmrXhNSUNrJc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YMwiSM4UOScbXDWt/9ucNf7UfQVzM0R31f85+g82iPL0a3qrcb/SaU6PLSQTUW672
	 mBn0Rdmf2sgSs2MLOuyx9N0i+A0a/t2YLDUNtrkwBe7ySscE1wDPIkmF3OzLOVNIAf
	 PMd1YqkgWruQZG4o4BX3cm/d3y5tuzwxUCjEcm1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA3BF80128;
	Wed, 20 Apr 2022 12:17:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30C63F80125; Wed, 20 Apr 2022 12:17:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41328F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 12:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41328F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="LsH9Pn71"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="Ftn7FiEe"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650449834; x=1681985834;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tp7iAIr8Al+tMwFKWLRDL3kPJqqCZ7mCmrXhNSUNrJc=;
 b=LsH9Pn71WK3zZjiiZD3yxSjb5rWZduin5mhKGWZkDOvvc/A8zqf1BsW5
 WCCvARtWX/c6UyljCcnO2LIvpkAayC/c+FMFgwEPSFDHeWuWb3PVppnOs
 ty6yaOewYDbZMRfwELbzAnD37v7WCcKjf67UZenjs/5OP2cHrB68IMdKF
 396Ph31QWzW9jizw/Co/7JVgDMNmRWUzrxvumdw/Ntgt+cCJhYdLkA1XD
 RRs45OXwdTLlW5S3seyA6Ax5seOI/b/atoAnDyMC63hWl9TrlERR/+Qyt
 Rss7wdKtk0ltK9oIVYowu4FNVqWOl6QNM9PXfKSG8I7zKVJ4kelEchE6j A==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="160676804"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 03:17:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 03:17:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 20 Apr 2022 03:17:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beDX8nPd+eTXxKGOkrCviXAJ+/hmQDeWv0j1QwoITASi/Nr3nxzsabGU/4e8bBSW6lygYBvh2uSHxRkh5MWi1SD2SMESsXy/GaUk272/5zdQlH+xwkky7Y8IdIQPSqoW5dZur8AOxMKd99eeISSXRbnNMgnv+/eepk3MS8+yjGrwQrEZxBshKCiAmALBCBKm4NacfCcVANGmj7Mw5FT2Zhhesgr/Lde467w4HjRuJ3xKYUx4QkFZv5cxE4tNVR9i56WXOy+3EY90OQfFqo6Oq58IDoSGPuHNFwMORNZ9E8R2ZDttvhDBR2AUnS2ErwWRCpDC7/mOszhhA7x4HDcvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp7iAIr8Al+tMwFKWLRDL3kPJqqCZ7mCmrXhNSUNrJc=;
 b=Zh4bRHDNukin/+3RkhF7JsZVXH2j6XuMTz/zJ594HP5VFQr/aReyQ4FRX32ekotHFJzgJbObMFbUvs9y/q8dDz80BkCRPuy2jOwvZ8kFtR9mpzOVjdyCpoFTHR4S8LPPN1Bizw7o63k1SSg2SNXAjiPPLGTCuRzILAzJ9sKpHvXWeARROz/z59Ji896555gihUXBk5PHkegNRElb7nTcwC/6PKf+pbLAwoJwXTU2AHjEmb6HGMQrcbO3HEmUERMJSkkmz0FN39A1H5WyQgVljBnD8PMtOIrV7RjlLcDx3UCPHwcj7wmryLDAFgFJH9iOolLJkRL1lX4cmbOfi4l8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp7iAIr8Al+tMwFKWLRDL3kPJqqCZ7mCmrXhNSUNrJc=;
 b=Ftn7FiEedrWcomv+Q2Mr9jPTkM4m9cDq//Bsj0QNQq5Gf+jaJU8v04vrMLeOPysXf0+xewaAZFLIHl19Vf2QClWksQHgnZqS+xzZgAJv5n0gRlO+ucjON0quAr/ePC3dE0xddgWPGbMxaZu4lLJSkpfF0Qq8kmhDFtFYGawug3A=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Wed, 20 Apr 2022 10:17:06 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::e18a:23c1:abed:64a0]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::e18a:23c1:abed:64a0%6]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 10:17:06 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <sha@pengutronix.de>
Subject: Re: [PATCH v3 1/6] ASoC: dmaengine: do not use a NULL
 prepare_slave_config() callback
Thread-Topic: [PATCH v3 1/6] ASoC: dmaengine: do not use a NULL
 prepare_slave_config() callback
Thread-Index: AQHYMh4Pkh3Y5IW9SU6WaYlYzxi+6Kz4yjoAgAALzQCAAAJ7gIAAAtQA
Date: Wed, 20 Apr 2022 10:17:06 +0000
Message-ID: <648022a0-57b3-0df4-dc03-96c77f042c35@microchip.com>
References: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
 <20220307122202.2251639-2-codrin.ciubotariu@microchip.com>
 <20220420091552.GD2387@pengutronix.de>
 <968f9bfb-bddf-a8f0-6d8f-18b92d865aa2@microchip.com>
 <20220420100658.GU4012@pengutronix.de>
In-Reply-To: <20220420100658.GU4012@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6fdf4ae-e2f9-434c-61b9-08da22b6ec10
x-ms-traffictypediagnostic: SJ0PR11MB4973:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB497341857E2F32DE998BD6FAE7F59@SJ0PR11MB4973.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V664/aXLA9A+boDWfFUqYefrwp2GCYIKUVGfCtUJRxcmehxtkiKG3GX84tmYfAb/pr7K72NM7fuVkO18aoWAa0uAA6n/yYgk72BcN/YttTN/sAWr/e0bSkpYlnSn5rOc8m9f3RZNYtoVe/bxEOnIrtaywlzocUNq90VnCv+sWkg58o6IcIIbflq2cEr7taRGMJkD/QHBFt/QeMpLmY/b8G0rKb5K1cb17yZDvPxxoLE0Chby/7X6iDOPQL373tcGMhn+bvEdYHFSQ1/VPTbUO8XqvD6551YwM6r7Xh92TgIGzxPWcHLDySfDO8/7EmbX3B7YLINljaa+hm96qNlogKNXHQkD2LgCbUFKcHg04/HtsF9bNi87bSXhsTVjWlz6WmTqfMZf9CmsOUrY6J9kZMBMCrw2DFBzKojBfiydNzy70PaGvw5kg63Anu/OGl9tgecuj86AiYuc0tifsdwZyqiyMPaAlcCUpetNcHbUN1BtF0Etf243AigE3d7ajjJg0EueKzEv8evVA3/byiIhUmb0n6CG5eKWQCa/mUEnTThCliyzK4lh0PQkWcwK8RGtxtX+Rmno/Mnn8jtCeEQQ6607AvYtvrUOEMr7+0tdbSQBU6rSqnnWt+5j4YX12YhrWpj/vWJsk8GN8nd5FWI3dbj7cxINGHdUGqDYbXh84U01rUD2ZeLg+rd/mrcIodMGbHPWqcXImyC5HRLtxc80FKcRhi628BFyXysA+vrsK4QjhMMPsQimhKvAZsj4ecVI3o0GlelTX48oZYILwuK/Omz1nzaEvFGZpKGJ54KaiSp+GVm0rrwwENwA+Y/cEFUG1xq+zL/4/tN3RhB373P3Q3s0Vlty9mDk3OOhg2Evqg0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(53546011)(83380400001)(186003)(91956017)(8676002)(66946007)(5660300002)(122000001)(38100700002)(2616005)(36756003)(6512007)(54906003)(7416002)(107886003)(71200400001)(8936002)(66476007)(38070700005)(66446008)(6506007)(76116006)(508600001)(316002)(4326008)(86362001)(31696002)(64756008)(6916009)(966005)(6486002)(2906002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SitFa0Fza215OW0yNVBXU1NPSzU3MEtVUXV5QjZibmdZZWQvRG5TZDd1SG0r?=
 =?utf-8?B?YnFSYjJnYkhWbDEya2cydC9VMnNGTzYxMldIcHB0dThtRGdQMnhIai9nZSsz?=
 =?utf-8?B?dzBocUpsSzhpM3htQ2NxN3QvNTNtYXIxaVVHUVdLRWV0aDhTR0Y2YWQ5bXlm?=
 =?utf-8?B?WFBkMTFId254ZVdHc29XWUFUWVRtcWpEQ0Q5MUZtTDJsam14VjlwSGtROHRB?=
 =?utf-8?B?b0VEdVJVSng0MUltMWNyMXdSRG94bGZMZFoxdkVWYWVJVG5OaktSSlN5ZzBo?=
 =?utf-8?B?M05WRFJ4aFFLQ204OFlyWFNkMGoxTGh1Y242eENRdWlQb1F3TVRqS0FISCtZ?=
 =?utf-8?B?MWVPWnpFNUtvRW9BcWQ1ZnBXd1pQLzZYRG94cnNOdTBHUWhtNjlCditVa1I3?=
 =?utf-8?B?cnhsWFFGbjJiSVhuMjVwSVhpUWtJVXNXbGRoWEd4a29QeVExODR2WFNXdHNB?=
 =?utf-8?B?TWl4SEZaelBJZnI1V05kMVd6S1R0WGVSRDdWazdFd1I1Y0ZFdmYrQ0VhYnBZ?=
 =?utf-8?B?VStybk9qRi9MZVFkRk5YVkx5NnZlN3Q4ckRMeG1JMGNmWk5NUk11clQzSFJo?=
 =?utf-8?B?cHFLVzd2dk9kTHI2K2xBb0RBQkY3VnczTjZ2cUNiUThDcWYyNDFkN0xCZmla?=
 =?utf-8?B?Nk5UTlhZdnIrQ3FtdnZhaGhIa2JrZEVGSkdPOXEvSjhrdk9jYVVteFREa0tD?=
 =?utf-8?B?MGhlYTExUHM5UWFFMHFoZlBOdUV2a2JKajJRanZCem15cmFvL0NGSHZJUnh5?=
 =?utf-8?B?VUFObndOOE5Lb2Z0YTZZZ3E0bGlqbklGWitsQWFjczNFWnhwYWJ4Z2Vzd2tx?=
 =?utf-8?B?Wm40dG9QWEFlRVJlOU9DbVd4OG1WUmFPMzQwWUp3d28vRDFPOE9iWU9lOWZ2?=
 =?utf-8?B?OGdlNW8wZnNsdHhsQWs5VVoybzJkNXJ0cDhVUlZIVWR4Z2h3YnNxNXhzYmRN?=
 =?utf-8?B?Z1Ntd0ppdWk1Wm9tR3UydVNBUUFHYmFoMjBxL2tTcmJBbVFpQXNhZ2g1cGJr?=
 =?utf-8?B?S1hpTE56MW94U0lVVXpiK2FvYmI3eVdRbVh5dW05dW43WFBpL1g2VHAwaSt6?=
 =?utf-8?B?cDNDOStFaEZVUVd5NkNSQ1RzSnhrSTN6OUJqVzdyQlFmMHZ2cStnUUQzdkRB?=
 =?utf-8?B?TnBYOUZQem1lNWRtR3ljbmM3eWphUDkxNWJnalFoK3FsVEh1TEpvK1pyOVdl?=
 =?utf-8?B?czVRN1Y1ZHB2bmM0Z3ZkU3pZRjB3UzdYOTQ5QVI5azVSTXB6U0phN3JZdjIr?=
 =?utf-8?B?NE5mcGI2dzRKaE94TjA5Q0xFQTgxSDRyYmR3ODB5K2hFbmlQMEJMUUptTFpn?=
 =?utf-8?B?NXRLUFdFenVieC9Iek9WN25URWF0QWJlN3RGeTlPU29pUGFmRUdUVVVjUzNQ?=
 =?utf-8?B?K2thY1dIM1FIUUFYd3NKeVBQNGRIUTlpbWlTbnNoeG8vTmJ3N1hJczFjbkZ3?=
 =?utf-8?B?MUg3ai9oVVc3UFk0Vk9KSDZBa204OGZNMXFRZU9MRVZKUlQyYXpBSnEwQTg1?=
 =?utf-8?B?SzYwczJUQmZ5enp1MGIxUUVsN2ZEVjVzRWQvamVUdmxxdlZ6Y01ZV2JXYWEr?=
 =?utf-8?B?Mjc1dzZiQ2dvQ01vcWE1cUpnWjRNUGpsUnVrUHQ4c3I2ZkR0WmJMY0tQSkZs?=
 =?utf-8?B?eEhxaEZSWFlqT1N5UTc0bEdERnk5U1pKaTVzOWdSUDZCMHhGbFhIc3JoWk4y?=
 =?utf-8?B?WThjalVhWkhRWEtVeURwTytTUW1NQ1dzOFF1R0V0MzZ2Y0h3dU9rdno4WXlu?=
 =?utf-8?B?SmkvaHowS29FVGRtQ0VkQ08xanI2TGplSGh5dTBZVmc0cjlOdG1VeGhjcGto?=
 =?utf-8?B?YnpnWTZXMlgrNytBSXQ5ekJSbllaUGVsbk1jOVMxVUE1Tks5SVJhWWJDVnZl?=
 =?utf-8?B?RFJCTlpwbjlWd3VMMmtmNUlHUkFKdC9za2d4SXZYNHlMWjRRVVpyOThMWjc1?=
 =?utf-8?B?TSt5a1dMbVgwdWt3QnFxc0V5c2pxUWJ6Yko1OXR1SVhMd3lySWx0bFcwNnBh?=
 =?utf-8?B?WEdPYkl3U3p2ZCsveFJqbmFEUG9ESkErVEp5eGt0N0IxeStJazNXTlBjTi9M?=
 =?utf-8?B?S21VTjhWajlBSHBaenNwY24xUmdyemRhcWJPTlc1Wk9nb3hQbDdrNlRGN3BG?=
 =?utf-8?B?T3k3eUlVbEQ2L1JwL1VHRVkxNmRCNnYxOTl6TzFGUlB2aGpXRmtJK09UTDlu?=
 =?utf-8?B?a1pMZUVuOHFrbGk2N3pLZWUySTdaMkhrdWc3LytaR3F1bStaYXVVemc2bnZp?=
 =?utf-8?B?Zm5PN3ZGaGdMZWs4SjVEYzVucXk5WG5BSkNMWWFvbXdmWHR3YlBCclZnTWlX?=
 =?utf-8?B?QU5OYmx3dlpFaCs3dVk3OW1JbmE4WTB6a0VPbjlmamgxR2VQek1SWmZPVFJ2?=
 =?utf-8?Q?nyIp8D9cNiDs1pZl1thm6Beo0tK236d1MnCbtLfrJiLuK?=
x-ms-exchange-antispam-messagedata-1: vqjlto9yo/8kuGLVVEuEoYW8bLJ+zSmVo+E=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2324747C3C0CE747B7AC30E9064761A4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fdf4ae-e2f9-434c-61b9-08da22b6ec10
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 10:17:06.5454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ciTUN5YSSlqoK79ZzUFM1pVx5oENeISMzU2d/NkoZBFZRejroj+yBOLskM21tlgnRdwpTqzHZCqn8o4Z4vpqGhVhM1jDy6oPOGyWdN9WnkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 tiwai@suse.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 Nicolas.Ferre@microchip.com
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

T24gMjAuMDQuMjAyMiAxMzowNiwgU2FzY2hhIEhhdWVyIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFdlZCwgQXByIDIwLCAyMDIyIGF0IDA5OjU4
OjA2QU0gKzAwMDAsIENvZHJpbi5DaXVib3Rhcml1QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBP
biAyMC4wNC4yMDIyIDEyOjE1LCBTYXNjaGEgSGF1ZXIgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBIaSwNCj4+DQo+PiBIaSBTYXNjaGEsDQo+
Pg0KPj4+DQo+Pj4gT24gTW9uLCBNYXIgMDcsIDIwMjIgYXQgMDI6MjE6NTdQTSArMDIwMCwgQ29k
cmluIENpdWJvdGFyaXUgd3JvdGU6DQo+Pj4+IEV2ZW4gaWYgc3RydWN0IHNuZF9kbWFlbmdpbmVf
cGNtX2NvbmZpZyBpcyB1c2VkLCBwcmVwYXJlX3NsYXZlX2NvbmZpZygpDQo+Pj4+IGNhbGxiYWNr
IG1pZ2h0IG5vdCBiZSBzZXQuIENoZWNrIGlmIHRoaXMgY2FsbGJhY2sgaXMgc2V0IGJlZm9yZSB1
c2luZyBpdC4NCj4+Pj4NCj4+Pj4gRml4ZXM6IGZhNjU0ZTA4NTMwMCAoIkFTb0M6IGRtYWVuZ2lu
ZS1wY206IFByb3ZpZGUgZGVmYXVsdCBjb25maWciKQ0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDb2Ry
aW4gQ2l1Ym90YXJpdSA8Y29kcmluLmNpdWJvdGFyaXVAbWljcm9jaGlwLmNvbT4NCj4+Pj4gLS0t
DQo+Pj4+DQo+Pj4+IENoYW5nZXMgaW4gdjIsdjM6DQo+Pj4+ICAgIC0gbm9uZQ0KPj4+Pg0KPj4+
PiAgICBzb3VuZC9zb2Mvc29jLWdlbmVyaWMtZG1hZW5naW5lLXBjbS5jIHwgNiArKystLS0NCj4+
Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+
Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2MtZ2VuZXJpYy1kbWFlbmdpbmUtcGNt
LmMgYi9zb3VuZC9zb2Mvc29jLWdlbmVyaWMtZG1hZW5naW5lLXBjbS5jDQo+Pj4+IGluZGV4IDI4
NTQ0MWQ2YWVlZC4uMmFiMmRkYzEyOTRkIDEwMDY0NA0KPj4+PiAtLS0gYS9zb3VuZC9zb2Mvc29j
LWdlbmVyaWMtZG1hZW5naW5lLXBjbS5jDQo+Pj4+ICsrKyBiL3NvdW5kL3NvYy9zb2MtZ2VuZXJp
Yy1kbWFlbmdpbmUtcGNtLmMNCj4+Pj4gQEAgLTg2LDEwICs4NiwxMCBAQCBzdGF0aWMgaW50IGRt
YWVuZ2luZV9wY21faHdfcGFyYW1zKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50
LA0KPj4+Pg0KPj4+PiAgICAgICAgIG1lbXNldCgmc2xhdmVfY29uZmlnLCAwLCBzaXplb2Yoc2xh
dmVfY29uZmlnKSk7DQo+Pj4+DQo+Pj4+IC0gICAgIGlmICghcGNtLT5jb25maWcpDQo+Pj4+IC0g
ICAgICAgICAgICAgcHJlcGFyZV9zbGF2ZV9jb25maWcgPSBzbmRfZG1hZW5naW5lX3BjbV9wcmVw
YXJlX3NsYXZlX2NvbmZpZzsNCj4+Pj4gLSAgICAgZWxzZQ0KPj4+PiArICAgICBpZiAocGNtLT5j
b25maWcgJiYgcGNtLT5jb25maWctPnByZXBhcmVfc2xhdmVfY29uZmlnKQ0KPj4+PiAgICAgICAg
ICAgICAgICAgcHJlcGFyZV9zbGF2ZV9jb25maWcgPSBwY20tPmNvbmZpZy0+cHJlcGFyZV9zbGF2
ZV9jb25maWc7DQo+Pj4+ICsgICAgIGVsc2UNCj4+Pj4gKyAgICAgICAgICAgICBwcmVwYXJlX3Ns
YXZlX2NvbmZpZyA9IHNuZF9kbWFlbmdpbmVfcGNtX3ByZXBhcmVfc2xhdmVfY29uZmlnOw0KPj4+
Pg0KPj4+PiAgICAgICAgIGlmIChwcmVwYXJlX3NsYXZlX2NvbmZpZykgew0KPj4+PiAgICAgICAg
ICAgICAgICAgaW50IHJldCA9IHByZXBhcmVfc2xhdmVfY29uZmlnKHN1YnN0cmVhbSwgcGFyYW1z
LCAmc2xhdmVfY29uZmlnKTsNCj4+Pg0KPj4+IEkgd29uZGVyIGlmIHRoaXMgcGF0Y2ggaXMgY29y
cmVjdC4gVGhlcmUgYXJlIGRyaXZlcnMgbGlrZQ0KPj4+IHNvdW5kL3NvYy9teHMvbXhzLXBjbS5j
IHdoaWNoIGNhbGwgc25kX2RtYWVuZ2luZV9wY21fcmVnaXN0ZXIoKSB3aXRoIGENCj4+PiBjb25m
aWcgd2hpY2ggaGFzIHRoZSBwcmVwYXJlX3NsYXZlX2NvbmZpZyBjYWxsYmFjayB1bnNldC4gRm9y
IHRoZXNlDQo+Pj4gZHJpdmVycyBkbWFlbmdpbmVfcGNtX2h3X3BhcmFtcygpIHByZXZpb3VzbHkg
d2FzIGEgbm8tb3AuIE5vdyB3aXRoIHRoaXMNCj4+PiBwYXRjaCBzbmRfZG1hZW5naW5lX3BjbV9w
cmVwYXJlX3NsYXZlX2NvbmZpZygpIGFuZA0KPj4+IGRtYWVuZ2luZV9zbGF2ZV9jb25maWcoKSBh
cmUgY2FsbGVkLiBBdCBsZWFzdCBmb3IgdGhlIG14cy1wY20gZHJpdmVyDQo+Pj4gY2FsbGluZyBk
bWFlbmdpbmVfc2xhdmVfY29uZmlnKCkgd2lsbCByZXR1cm4gLUVOT1NZUy4NCj4+Pg0KPj4+IEF0
IGxlYXN0IHRoZSAiQ2hlY2sgaWYgdGhpcyBjYWxsYmFjayBpcyBzZXQgYmVmb3JlIHVzaW5nIGl0
IiBwYXJ0IGlzDQo+Pj4gd3JvbmcsIHRoZSBjYWxsYmFjayBpcyBjaGVja2VkIGJlZm9yZSB1c2lu
ZyBpdCB3aXRoDQo+Pj4NCj4+PiAgICAgICAgICAgaWYgKHByZXBhcmVfc2xhdmVfY29uZmlnKSB7
DQo+Pj4gICAgICAgICAgICAgICAgICAgLi4uDQo+Pj4gICAgICAgICAgIH0NCj4+Pg0KPj4+IEkg
ZG9uJ3QgaGF2ZSBhbnkgbXhzIGhhcmR3YXJlIGF0IGhhbmQgdG8gdGVzdCB0aGlzLiBJIGp1c3Qg
c3R1bWJsZWQgdXBvbg0KPj4+IHRoZSBjaGFuZ2Ugb2YgYmVoYXZpb3VyIHdoZW4gcmViYXNpbmcN
Cj4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvYWxzYS1kZXZlbC9wYXRj
aC8yMDIyMDMwMTEyMjExMS4xMDczMTc0LTEtcy5oYXVlckBwZW5ndXRyb25peC5kZS8NCj4+PiBv
biBjdXJyZW50IG1hc3Rlci4NCj4+DQo+PiBZb3UgYXJlIHJpZ2h0LiBJIGNoYW5nZWQgdGhlIGJl
aGF2aW9yIGZyb206DQo+PiBpZiAocG1jLT5jb25maWcgJiYgIXBjbS0+Y29uZmlnLT5wcmVwYXJl
X3NsYXZlX2NvbmZpZykNCj4+ICAgICAgICA8ZG8gbm90aGluZz4NCj4+IHRvOg0KPj4gaWYgKHBt
Yy0+Y29uZmlnICYmICFwY20tPmNvbmZpZy0+cHJlcGFyZV9zbGF2ZV9jb25maWcpDQo+PiAgICAg
ICAgc25kX2RtYWVuZ2luZV9wY21fcHJlcGFyZV9zbGF2ZV9jb25maWcoKQ0KPj4NCj4+IEl0IHdh
cyBub3QgaW50ZW5kZWQgYW5kIEkgYWdyZWUgdGhhdCB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgbm90
IGFjY3VyYXRlLg0KPj4gSSBndWVzcyBzb21lIGRyaXZlcnMgbWlnaHQgbm90IG5lZWQgZG1hZW5n
aW5lX3NsYXZlX2NvbmZpZygpLi4uDQo+PiBIb3dldmVyLCBpbiBteSBjYXNlLCBmb3IgdGhlIG1j
aHAtcGRtYyBkcml2ZXIsIEkgZG8gaGF2ZSBwY20tPmNvbmZpZw0KPj4gd2l0aCBwY20tPmNvbmZp
Zy0+cHJlcGFyZV9zbGF2ZV9jb25maWcgTlVMTCwgYnV0IEkgc3RpbGwgbmVlZA0KPj4gc25kX2Rt
YWVuZ2luZV9wY21fcHJlcGFyZV9zbGF2ZV9jb25maWcoKSB0byBiZSBjYWxsZWQuIFNob3VsZCB3
ZSBhZGQgYQ0KPj4gc2VwYXJhdGUgZmxhZyB0byBjYWxsIHNuZF9kbWFlbmdpbmVfcGNtX3ByZXBh
cmVfc2xhdmVfY29uZmlnKCkgaWYNCj4+IHBjbS0+Y29uZmlnLT5wcmVwYXJlX3NsYXZlX2NvbmZp
ZyBpcyBOVUxMPw0KPiANCj4gT3RoZXIgZHJpdmVycyBzZXQgcGNtLT5jb25maWctPnByZXBhcmVf
c2xhdmVfY29uZmlnIHRvDQo+IHNuZF9kbWFlbmdpbmVfcGNtX3ByZXBhcmVfc2xhdmVfY29uZmln
KCkgZXhwbGljaXRseToNCj4gDQo+IHNvdW5kL3NvYy9mc2wvaW14LXBjbS1kbWEuYzozMzogLnBy
ZXBhcmVfc2xhdmVfY29uZmlnID0gc25kX2RtYWVuZ2luZV9wY21fcHJlcGFyZV9zbGF2ZV9jb25m
aWcsDQo+IA0KPiBJIHRoaW5rIHRoYXQncyB0aGUgd2F5IHRvIGdvLg0KDQpUaGF0J3MgbW9yZSBl
bGVnYW50LCByaWdodC4gSSB3aWxsIHJldmVydCB0aGlzIHBhdGNoIGFuZCB1c2UgeW91ciANCnN1
Z2dlc3Rpb24gZm9yIHRoZSBtY2hwLXBkbWMgZHJpdmVyLg0KDQpUaGFua3MgYW5kIGJlc3QgcmVn
YXJkcywNCkNvZHJpbg0K
