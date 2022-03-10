Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 159674D4CA9
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 16:13:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAD5E171C;
	Thu, 10 Mar 2022 16:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAD5E171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646925199;
	bh=pZqU6zc1AZJ2zZbVNOPZdmqCr3PxYQBByEvgToUCVYE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFhWbc+6yqrSSDPJZ8i4TWMNf1UGc/nexiIfGudPY8Kd+hBDI92uSYcHcRlgtBINB
	 EE3C+Gn3Qj1H/c3SHPC0G0RlnJf2Boe6SJ7EjKqatf+scSrUg0V60RBuhuq2vMcUBy
	 dI73CXvJJQnEWmoOlM2zyWLpsVOeLDaIBheEquaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1669DF8013C;
	Thu, 10 Mar 2022 16:12:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18540F80137; Thu, 10 Mar 2022 16:12:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0930F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 16:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0930F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="HKlNo51v"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="Z7k6YaLA"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646925124; x=1678461124;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pZqU6zc1AZJ2zZbVNOPZdmqCr3PxYQBByEvgToUCVYE=;
 b=HKlNo51vvbtiPjWThTnCYdTNH/97OfzxKvtcL8qXKYRlqths9h1Ro7mD
 YVZ6AJagdU86M8x/f70nZPbhA9lM4mQH2jMXT4Tq3dseXMZyGh05IEric
 PYDmiLHWsGl0hHnQ8e58aV4gh58pRQHu1VvIMo85oEs3VmrOXEaTHGBLF
 mDK/dpqDM01VjFGAU0YGHZCxcw/ChA72+/vik/RWZsdWft9ez4acakfY0
 Bxz7XpGgsyhdt38KB4f3z9+1tRSrmIdwH06b76xfJgM/fvjBYrQ21ROPy
 djgUXBPpwP9eRJPe/QMb22tdjhHx01owMR9wqyNP1novOuHT7XCHX/t76 g==;
X-IronPort-AV: E=Sophos;i="5.90,171,1643698800"; d="scan'208";a="151575798"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Mar 2022 08:09:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 10 Mar 2022 08:09:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 10 Mar 2022 08:09:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ71BLZvJ5rwuqgYmeKw8bLxfL0qLxz8SGT6HxJzrXtprhoQYLfmY3XvKn9SR9YWDiC442is/yScJNN+3X+4LAT/0ftHUZn1xRoCsSUsQHP1rzVgblxrKacKR2tEsHyaZ36ZGMKpa+g6kOKEryddpVW6xmZv7NvZM7SMVWdC3lpsn9RspCUtQYFxvolr6i8/dobSKJbp4J3eeClhO8qccoRAWTkGuNokhrwWHYVSnaoH644VH/Y47J1o1yKSIB+UNzyUdxRhEFxXDmDTeFTrpUYjGfmOhAJBSCyghtrDUdM+UFweoOcKda9myt6nJwycG900J8UiQMe8n+pPMs3aIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZqU6zc1AZJ2zZbVNOPZdmqCr3PxYQBByEvgToUCVYE=;
 b=G9BpWtIO4JGdjoTszjLjQzZJHDtBbE6UUeQoet5zJeLKXAP+hLt7jX5Kr344dCmQC6R9u6u0mG+pcbhqfZRPvTEP3nytyurTHrBKdmVhUUNQ+AyLnZSPeHrABAiETeKukZz/4jOJam/5d78/PpOClZ6BGJArpA0qSM/XTaKrIuDmC/DGg9xTnEEQxjY5TeIn3dgc1vimz+SPObHRIJmHt5cKT+FsT0QX823SjUOM1XehiyQTi4jjYe4JgO4rFJesizizZ4MZ7h/bB48EyyaQbl2t1+eInaOdti86sJk+POcR0Zw9TVNENJkWXt9ivnf2pA0UEhcHqCnU+xP/WLfrXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZqU6zc1AZJ2zZbVNOPZdmqCr3PxYQBByEvgToUCVYE=;
 b=Z7k6YaLA0y9Skg2Cpla0PUq5+/9anwIBvTxV0jsh5au+sghlxNomagL2Zs8WsmTtxksfypX3bzqAy1nwsrLk79J+SRbLj7l18yZDrYJyP57Sa1eYNWB/8TN+f5q1Jah3CSySF4hyqLV0NzTR7Kvv3n/EB6Hr+Xq86faJoGqjeBs=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 BN7PR11MB2545.namprd11.prod.outlook.com (2603:10b6:406:b0::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.29; Thu, 10 Mar 2022 15:09:17 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f%4]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 15:09:17 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <dan.carpenter@oracle.com>
Subject: Re: [bug report] ASoC: atmel: mchp-pdmc: add PDMC driver
Thread-Topic: [bug report] ASoC: atmel: mchp-pdmc: add PDMC driver
Thread-Index: AQHYNI4VMlvd9DN6hkO/EnbkzK/6wqy4uIKA
Date: Thu, 10 Mar 2022 15:09:17 +0000
Message-ID: <c054cebe-5a4a-0858-1859-cfc91b6f4287@microchip.com>
References: <20220310144915.GA7354@kili>
In-Reply-To: <20220310144915.GA7354@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91ba5012-6418-4ad3-b4dd-08da02a7f295
x-ms-traffictypediagnostic: BN7PR11MB2545:EE_
x-microsoft-antispam-prvs: <BN7PR11MB254560195D8E0FB18E504C5FE70B9@BN7PR11MB2545.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZAqLGzzMJwtKSfG1PPT7uuS14PJRBxRUnpxBk02UNdQ6WfELCDSprkkk+oIKmdffkCE10OwdeRlI8X7NMHK9ZzsJGTttarhbSYBExSzooHifbD/tExwMCjQFlLYdMBTuuJOmT+zsDKDxRFil/BmNLNPct1nkcR4rsowG4nckTzcHCVKijWjYef01hn8nMkduwAvfNxnfrfCje0FdkyLVBIhdkrg3726w9Fd8YyDLrShi+TGEi+o7W2hSS4dwLM1u3DxRE4H9Z1hhwl84p0yHc+4nNb4kCvBJ2GOVzkN/mG3og1NohkzeSpcEQhMMEDy4f1n7zMEzjd74CHrpYbycznpX26aCuvgoFXGfvr+Cj0pJ08msM13WOsBd8PIjsNF8S5S23yS/+K7a1yaJtEFgJbAYbT3dV35TCovEZxxZg6pAGk6k/lb1hyGNcbYX3JKZFGp3jt1pEzRHzQkFcDgR15DiZHxA8I6fmxm7dD8/w/sUYmuFRiv4Z10NFrFCaaGCGkUOifTi2MD/OeuT4R4JA7Q5WHCVu+uRvdOXLQoNGPoWns1GePkp4vDGGoYtaPIe8MLLWlUwgvmmeWhsdMIXDiIdfxi71Z+ihTQS74l/v3t0jX1Z28PhRYAVKTrvAv/8ueBVYk+MrHzcOD/DaZQzDq60QCVnentd41w8rj179yPxs0QeBV7O2NatVerojXMwJHsQD5Juueyv00/AmbWrJJGqWqN+FFMl1wCm1XLRt6Q27382Dtqm/h/4+kB90L6J6kSUVSF9ivZZtluY97kHUuwFEDp9ibVVR7UmUjNO1UnSaQw1hC3HBSsLdrh5IB5EW0BR4+hl2hheUQmq9olHmMM7j2hnBPEEleTsHCAKjmw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(6512007)(5660300002)(83380400001)(66556008)(6506007)(4744005)(53546011)(2616005)(26005)(186003)(91956017)(2906002)(86362001)(38100700002)(8936002)(31696002)(38070700005)(316002)(508600001)(31686004)(6486002)(966005)(71200400001)(6916009)(4326008)(66946007)(8676002)(66476007)(76116006)(66446008)(122000001)(64756008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkxvYnNmQmcvOU1zekYweDMzd2UvczlYeFJTSElKemhMaER4WlNqb0JFelh4?=
 =?utf-8?B?VnpibUFIbWNVZERJT1FFMUU0dE5TM3llOW9lWWN6aGpJQ3A1Y3A0Nm91Z1ps?=
 =?utf-8?B?SHpWRE92bjVDLzJPRWhTWVN1SXQwcEx3K0RIQkhUeEZ3WktsZUZNdWNzSDBK?=
 =?utf-8?B?czhKUWRTNHhZSDNhdGVOVkpSU3E0blB6RzFaZ1RYSnFvTm5ROUREWHl4LzFK?=
 =?utf-8?B?bXZ4dEZGZWRNSzBjUlpWM2JhcFM2ZW52Q0ozTkxCZHVqZXlDTmhXYTVjeTly?=
 =?utf-8?B?MGtQSzdlMmdsdjluNGMyR1hTMXB6U2hjOHRqWCtQYVBNYk1mYWV2czdBWGpZ?=
 =?utf-8?B?Q3JpVkVuek1wQUNocTVMVldEMVhsNmU5Mm01TVJHb2JweVFtU0ViV2tSTEVD?=
 =?utf-8?B?Z1lJSFNJN2pPWkZYbnlnMUtJTkVQWHJFMk84MEdOQjJSMGtPSzQ4UG8xTjhP?=
 =?utf-8?B?Z0IxZU8rbE1IMXl1dis3Q2xYdi9NTTc5RjhKMWhDQ3hWU3UzVG02SUtQMUQy?=
 =?utf-8?B?TFhHRE8yUDVFUGs4eGlSelpsZEwvK3VJOG1HL1d1N1pCeXZSWVptN2tlVXJH?=
 =?utf-8?B?US9MR2lXcE14OVV4VDNMRnlhL3lIUEw4Y0MxVXpPR0NUaVk3eTJLRW9YVlND?=
 =?utf-8?B?ajJlZ1JDQlVLVE9zKzE0cVIrWGxWWVY1TTFxbVFna0Z6dXRKQXpiVGhWSXBo?=
 =?utf-8?B?QUpkL1plVnZCcDJsT09KTXRid1NNdDd1bXUwS2JHRXI0dTZKSnZ2aW5telp6?=
 =?utf-8?B?ZCt2K1RVdUxmdHhOTStzNC9ZTU56WDJUK2pOZCswNDBkNU5KTWJZMG4rY2Jv?=
 =?utf-8?B?RG4wNVBzb2dhbk5ZeHlNK2Z6UVlSaDJ5Z0g5QmIwWVRtS3dObXhxbkNMVjZI?=
 =?utf-8?B?ZUhHYkxkcVlOaUIzdEMwdlkzNEhRRGZlSlVxYXlZbndpdTJaRGVYbGJELzFK?=
 =?utf-8?B?cEZQcndsQ2RZQ3g5c3BOU2hzK0I1Vm53QmpKcytxMjFBVjVrVTlHZFMyWjNK?=
 =?utf-8?B?emtsMkV6MlQzTURaQ1lyVkFGM1RYb3A4d1g3NE5UVCtmTitFbDFGbytUOEtQ?=
 =?utf-8?B?TDdPZkZLYUJmcExjNDdINUV0MnJVRXFVc1dSakZaamJoMEdnOGFpamYrWWFh?=
 =?utf-8?B?TWp0VmZWMTVvNHpiUzRMV2lVekhlYjNnSHVBS3EzUUZTNGdIamlBeTh3MlBR?=
 =?utf-8?B?dmZrUVd0NW13WjlXWGZTc3Vnc3ZBOWtyalg3LytFdWtUWm40WTVaUXg2U213?=
 =?utf-8?B?Ky9UaUI2VzNNVVNHNWl4WUhZaWgyQzYzOVBUamtTenQ5bmsrRUMxbG9BeUdD?=
 =?utf-8?B?Q0lBTUwzaHFndUgvUWRlM2srTTNDcFdBd0VXUy9HSStqekZXeXRubVNMWVY3?=
 =?utf-8?B?R2M5MDFVOS9LdXRZNTdBZXdGSmVOS0FvSjFiQjArNFY2cStKbHFSOHZDZGtF?=
 =?utf-8?B?dTJjbGh3TjBCVnhkbVNHK2Q3WmYvSmdaYktRYjErSkNDamNycVBZemNtUXhH?=
 =?utf-8?B?Z0NRaEYzZWprZ2NkRG5TRVB1bWs3U2NzOHgrK3hGZ2RvREU4a0RuWW9tOS9y?=
 =?utf-8?B?WFMxWmZOOVZ3dy82VEQ0dGhzVmhTcGFxN0hqdTJvU1Jsdi9aZkhRZlhKVTFw?=
 =?utf-8?B?Yy9abkEwUkd1eWZmUXhzYkhBYWk0UlRJc0plTDZPQnNtR1JDNDhYcWwwUkdz?=
 =?utf-8?B?c2FBREF4TitrdkxERnpqWDMyMnp4eDJYVnJLU1dITFIwZStwa1lQR0JtdDNN?=
 =?utf-8?B?amdneExJbno1M2ZUVERCRmgvWlIyc1VNZDZXUHU2dFp2QTRHUGxuZjF5Nktp?=
 =?utf-8?B?d3NVOHg3MVQxOHIxdUt4YlVlZzBHR1E2SDJ3SlFoZUI3eWorT0twQS9vYnFQ?=
 =?utf-8?B?aU1PWEwwMU1Bd0tWTnJTSG9lTjBRNTlxditOTUNEczRKakxZM2NDdzZpWnhP?=
 =?utf-8?B?anByMlBCTUtibHFUK1ovajZaLzJpbkNoL2c3aXNUL3JBTWtEWFVoOGtGamRQ?=
 =?utf-8?B?YS9qb3VpV1BLSlduRHgzT2JKckcrUnE0ZDN0VUlCM0FvdXhvVEYzeE84OVA1?=
 =?utf-8?B?ck92ejB5bUFqV2RoOGhUL2w4aXN2TmNwbXA1cmxDbDlxNUVwdnQxY3VBK0Z1?=
 =?utf-8?B?cTlWZG5maHhkVVVxT0NlMGVjN3o1d3dSbk1rMGVoWVZGUTNqUWR6THRtd0Fn?=
 =?utf-8?B?RXUzRlVNMnhQTXVublZJVkVobU1aRjk3VldRZE1ERzY4YWkyaDBGV0hKWXdW?=
 =?utf-8?B?N1FLL00vUlJUNW9tUWlFL0tKbzFBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <897A49316497434CB6CF226ADEEEDD4E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ba5012-6418-4ad3-b4dd-08da02a7f295
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 15:09:17.8256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GLQEQeqOangaZvFVlQTMS4Eq8fBdeBD78BubVJMLUmCSk2UVMdLGI97da1ZlzXZRFmMiTpX/jryqQrwudpl5F8yYC/22VFkeXQViucnPfU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2545
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

T24gMTAuMDMuMjAyMiAxNjo0OSwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gSGVsbG8gQ29kcmlu
IENpdWJvdGFyaXUsDQoNCkhpIERhbiwNCg0KPiANCj4gVGhlIHBhdGNoIDUwMjkxNjUyYWY1Mjog
IkFTb0M6IGF0bWVsOiBtY2hwLXBkbWM6IGFkZCBQRE1DIGRyaXZlciINCj4gZnJvbSBNYXIgNywg
MjAyMiwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0Y2ggc3RhdGljIGNoZWNrZXINCj4gd2Fy
bmluZzoNCj4gDQo+ICAgICAgICAgIHNvdW5kL3NvYy9hdG1lbC9tY2hwLXBkbWMuYzoxODYgbWNo
cF9wZG1jX2FmX3B1dCgpDQo+ICAgICAgICAgIHdhcm46IHRoaXMgYXJyYXkgaXMgcHJvYmFibHkg
bm9uLU5VTEwuICd1dmFsdWUtPnZhbHVlLmludGVnZXIudmFsdWUnDQo+IA0KPiBzb3VuZC9zb2Mv
YXRtZWwvbWNocC1wZG1jLmMNCj4gICAgICAxODEgc3RhdGljIGludCBtY2hwX3BkbWNfYWZfcHV0
KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLA0KPiAgICAgIDE4MiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdXZhbHVlKQ0KPiAgICAg
IDE4MyB7DQo+ICAgICAgMTg0ICAgICAgICAgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21w
b25lbnQgPSBzbmRfa2NvbnRyb2xfY2hpcChrY29udHJvbCk7DQo+ICAgICAgMTg1ICAgICAgICAg
c3RydWN0IG1jaHBfcGRtYyAqZGQgPSBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21w
b25lbnQpOw0KPiAtLT4gMTg2ICAgICAgICAgYm9vbCBhZiA9IHV2YWx1ZS0+dmFsdWUuaW50ZWdl
ci52YWx1ZSA/IHRydWUgOiBmYWxzZTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiB2YWx1ZSBpcyBhbiBhcnJheSwgbm90IGEgcG9p
bnRlci4gIEl0J3MgYWx3YXlzIGdvaW5nIHRvIGJlIG5vbi1OVUxMLg0KDQpJbmRlZWQuIFRoZXJl
IGlzIGFscmVhZHkgYSBwYXRjaCB0aGF0IGFkZHJlc3NlcyB0aGlzIFsxXS4gVGhhbmsgeW91IGZv
ciANCnlvdXIgcmVwb3J0IQ0KDQpCZXN0IHJlZ2FyZHMsDQpDb2RyaW4NCg0KWzFdIGh0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDIyLzMvOS82Mw0K
