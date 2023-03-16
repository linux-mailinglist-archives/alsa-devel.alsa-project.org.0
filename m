Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF26BCDA6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:11:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C42112A;
	Thu, 16 Mar 2023 12:10:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C42112A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965096;
	bh=0MLp8I9WRigwI/uqIPnRIeEiF8KhoWAImaWbAg+wf9w=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=Iiw3c0jo/f2SQNYitTxxfy2RfHwMCfwaf+37Q0AeDFDcm0SmKt/kPlAK2d5NqSI4j
	 reustRR82pN6rtRq2peFjZZ9zghRdN8GVFNLmg8LqoZijvS7SvGsMZ7mVZy6z8WyNl
	 DwIr+FysCUyns70pyG7NW9NBDqR9FPqyMHDnMSLo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B276F80482;
	Thu, 16 Mar 2023 12:09:59 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 025/173] ASoC: atmel: atmel_wm8904: Convert to platform
 remove callback returning void
Date: Thu, 16 Mar 2023 11:09:36 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-26-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-26-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFXCXTA72BQGOBHOR2BVM4APMNNDQCWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896499759.26.4658273742929636568@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1F5EF80425; Thu, 16 Mar 2023 12:09:52 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A9BAF800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A9BAF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Al7HOR9H;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=q1/erCYN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678964986; x=1710500986;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JPLHSsuPCvJbFdVD/MtC4TzJ59Bk5nl0+2Rj7lHT1vU=;
  b=Al7HOR9HlN/c+d56NtQ1mN3wB0NT/nWIjJtSlFU+8QODFm4/24l6xfFC
   DpIPGeSqlMrmDH+JV7C3I397qzvPX8ayb4UwCZCNDVZ+wtFauJc8C1fCD
   /3i0AZY6JKa6Lx2cqXjvG9+oVmDkttyzMO4tdVoFXC2V4EfNK9fR0O2z3
   2RgL8wjv6WpZL0MCRTeprUd8H9TM9nuBX/fwdAwqqcPBGNc845wQRZEcL
   l4zcAUqnBywgsMScglNt5vNhjwHJLJPPrT37pUXbfuuY/1HwN4PCVSo68
   p6Cc6mx2muUx4/O8Ck+UTXlT2Z7uomF9j685/mgGhMGg4ngr4swKWZ/tM
   A==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="142358204"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:09:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:09:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 16 Mar 2023 04:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eb/6Yg4aKm5/jIBUIibIeuNqhFIY8jOYwSezUsZgrXlkAQDhxy2axn3626J7DwAKqFYu1qvwepq6WECDnVvuNBaquEaPgcizd1tIxLuRJBldvNvIHNZU6dttOAH4SROu5rWqkJcHVDqbxefyg4axKa07dPisA5PZc38jTpF7LBTUYevitnfo1Gth4bHzXVuuUkON1CCk5ol3YhNAIrgKgWtwdTMF5rjK7FJA3iUWubmyTxpAEiPTOrLtpY3aZjFnbw6N9jCBqViOLDwJwP39lRWu3MA5uzQbwTqumHibg20zmNNJxHnzXJaAJvbNQ3bpfe8wwzw44HC8DrVXkOoS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPLHSsuPCvJbFdVD/MtC4TzJ59Bk5nl0+2Rj7lHT1vU=;
 b=GpW72LQ5iAbl1iam+JtZbjXlRpp2v0CHZImP6bVfA7QYnAizbF4yka2Y8FRBwW6uFOt8Oy9cSM8a0TRa4OP7/S5s3YxwUs+Gzm57r29x7Wg47YX9j2lcLJ9zQB1pfirqoap35C+w38iYYpNOcprPXysjGJ9wl/ITuyAIJgvMDexTi9GtDMPgHsTzmdhkoZJM2W/TRDAtvA3u6q24RKlpNt4fiOMXu6trtDDIWGvLyO84KynupsGTRrFF5OBTqey6rWiJMlArSTNY8Y72X6RbGyHSJXshjEbBjZwVwtdcK933TLstRGcDt183whU5gVoC9De1+R6mgZqutVmp1KJgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPLHSsuPCvJbFdVD/MtC4TzJ59Bk5nl0+2Rj7lHT1vU=;
 b=q1/erCYNEX5vMxpZOc9z+yHxRnJ2M82C72X6jYsPUr8mhPpmksuV85Toz/pjDf7Qep9NiDM0I7PUbIJd2X85EpgtEUA1aD3Z7IswbJ+jZrwiVlVULpgcqXZ+u3AiwPC7fYsVkWhrtaCpaclwGylCbE9U4LX1sI9M9/wjnIXh97M=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:09:36 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:09:36 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 025/173] ASoC: atmel: atmel_wm8904: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 025/173] ASoC: atmel: atmel_wm8904: Convert to platform
 remove callback returning void
Thread-Index: AQHZV/fLLOSkG02bekGzzU0GUw4Dpw==
Date: Thu, 16 Mar 2023 11:09:36 +0000
Message-ID: <6629ee13-8e61-665e-3b24-71d8b841cb34@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-26-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-26-u.kleine-koenig@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: d5a63c25-c86d-478d-0963-08db260eeda7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Dh56M9AwGdyKfNwb4OsglctcugjRshlrfD7GQrcjTdn4DXyzX0q44+O4rCbZOXoReMePVMcJWv0wQCBzdWx+E4xPmk24SwTe3hgPizUlRYJyxCV9K4n4zMigkSZCfAPvwPtepZvdR6H/ar/sWwv+ixoMkva0T9bfe1vB+7bDOio6MyIxwzmDvAR3Ppw0KlkODZjctPKzEZFalofQu55vWTOotFeCL6grWLmwjNIz5k9pQwVAoAgyfa5UNrpjR4MTSh3rFx+IHSr/4jZipd863eXIY4bNQ/C4THBf+V7k5jWIqdYhv1c+i85Io2H8A8vokJSk8zwpfwauv/FkjmY7edHQQgBpN0OEQfiTYOuc77KoZJchTSGsklJr17C/ZwCQfunLtwVlNi2+z0aWCKi1dLuypGVZaw0z53zPtNH9JheNrifQOEgJ02ukndezcNO53ooqJbKj5INZtxpQf9ekIGOpiM/BrkvBzGcqeDsuizJkFo5/6yK8eAGmLaFL00uvbYjyrOFQgDQoSXR44ogggeCz3vrBFU4qcFzPeUIvD4xOX7bLBr7H4yTMTf07+3AXTPV22QNty7Y+x9xn4/fEf7QJOeZcKvMqW5bu080ZREjDdbCoNSM9y0PCqEBFrWK9838Rrq5+z78bn5FB2jKUX0/ZbAldMzBaI8/Ewz88xTZOtBS4ieQlsFsW0fofttra272z55cpUdso8eHNi7KTP+bu/Nxk7uR4t+UFDO6oJOrdCClxgOgTS5lp6lwgXLJYnl77co/0xHjagjMyjAOFHQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(38070700005)(31696002)(36756003)(122000001)(86362001)(71200400001)(66946007)(66556008)(66446008)(76116006)(66476007)(6486002)(91956017)(64756008)(110136005)(8676002)(4326008)(2616005)(478600001)(6512007)(83380400001)(26005)(6506007)(54906003)(316002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QS9JVFR4bVZzS3lvTUI3Q0h0V1RRZWkvQUlRTnhlTXBCM0U2ZEw3YnFNYWNu?=
 =?utf-8?B?U3N3RFR5NzVGMjBRbVoyNEgva3lUY0xrZEVJckNZaTU2NkVPY2hCWE5adFJY?=
 =?utf-8?B?MXNwdnBMRTVQajhUcGxnUWN3RFBIYm1WYW4rdUtJMlN1a0NXT0dOdXllUHF4?=
 =?utf-8?B?cWVYRGlNaGpiZGFQdnhmNXV5cVFhU0Q3ZXF0S2xaWElkNUt0OThjZXFBbFFk?=
 =?utf-8?B?UjZ3OHdaMDJCcGJsaHA2VjhBMlNDdldHU0g1THMwQ3BNUGhWZ2RQZHk5T2NO?=
 =?utf-8?B?R0ZvVG9heXo5ZlFjcXNpell1MVVjZjV1MFNBdVo1SjkzdVdPUDByeFVnTFVG?=
 =?utf-8?B?YWU3ZHJOWnMyQ2xLZFREUzl0TDJXZXJ0ZmRTTFhMR0tseWh1dW9xUFE1N3ZS?=
 =?utf-8?B?dW5tdk5EWTF6Q0d2WWpPUVdQaHgxSEFBMGJ6eElsdHF6Z1lvK3cweHc4SlhC?=
 =?utf-8?B?Qm1tREx4MUVaTjNaVWVNZEJlQ1UwcDJTcDRKdHhYMm9EMGpWYUQ3LzBJTFdn?=
 =?utf-8?B?R3VucjNpUXVZL0ZhbkFjYnJlUnI3SVVjM2VMclZsZVhyN2xMR3cwRFEraFEy?=
 =?utf-8?B?eGg1V0ZRdVk2aUo4Z1YyL016UnU5TGZDRUNBQ0cwV2FIckgvYWVSSkhwVlJO?=
 =?utf-8?B?WmpJOGF4TEoyMHRLdUFrNjdqVlJyeGxzTDVJSkg2RzVQWFJuYnAzN3VPejZ4?=
 =?utf-8?B?eHAwbXJIUVpIMlVsWjNRallLRFlGc2hxWmpHdFZhcHJPc29qcUNMMjJ1dWFB?=
 =?utf-8?B?ZWoxeVhYR1IrR1gyVEhxb3E1WUgrVzYrdngrYmM5TVVBQjVCeGlsWVQxZ3k5?=
 =?utf-8?B?VnNwYjE1bFRrMEY0dlZ2ME1BSnloVmM1c2RRY1VoVEs2RnlEZmJZY0FHSGlm?=
 =?utf-8?B?cWdkQkdjRzBWbGxSU1hsMWtqZUN6WkRhT1RVamRNVlFJRDNiQnJvZzQ4TVBY?=
 =?utf-8?B?U1diOEh1TjgwNFJVU1d4cUZtZWpNd3l0aU52SkNueXkrQVBZYm5HTSt6MExa?=
 =?utf-8?B?TTYvZ05selp0UzF2TStQZFpJMjlNOVBwQld1RWFSRlpTcjIrTUpJWFJka25I?=
 =?utf-8?B?U1VSUmQ2bll3NW5SM2RzdkVHa0llWlNiSnlVaExGU003elFjUDFQZXV6WVo1?=
 =?utf-8?B?S1lteDBCUis4SEg1NTNwT01vVGtIc1ZTMTdUMWhkUTlMSkF0ZW1RbzhnSGMz?=
 =?utf-8?B?OEhONXRjdVVUZmFyY1R5bjErWEkxOVZZMVAxR0RZcklyZG4wdk9yVm5yTGZK?=
 =?utf-8?B?bW1ENUhKTStNRmNGYTNNR2pBUGp3ZUVtTkNnalVOdlhUeEhIREF6WTNPQS9B?=
 =?utf-8?B?MkpSTERnZ1FBbk1ON3Fkc1dNcVNlNU9tNTUzb0lOSEt3RnQ5RHZNQ0g4OXpO?=
 =?utf-8?B?Sk5mby9qSU5BUkNEcjRLVWtNeHg5SXo5T1J1UVp5eHpuejdFTWQwNS9rbnF1?=
 =?utf-8?B?dkR0YWFySTVSeC9DZEtKb0JFK0pEYll4cW5BRVFMa1dFSzRQWGhlQkhnbTVK?=
 =?utf-8?B?RWxTa0R5UjdNa2NZb1liYnhtZFA1OXB4YzVkaHVWd3RvYW1Ua3lTSTZGWEZ1?=
 =?utf-8?B?U1N2T1BmWDBrazZSWVNpSlJrNmhsWnVoQWI1VW9mckU5RmxoRE1BYVJuRkpM?=
 =?utf-8?B?ZzdVaTh5QndVMjhPVGZEcEQxY0NRYWFOdzJWL2tiWWl0aTFBcmllcFJ5dDhX?=
 =?utf-8?B?b01GSmRPcy82RC9jTlVqR3lIbGYyc3R0SGQzU3JyYTM3ckQ3ZWJzZnlZRXM1?=
 =?utf-8?B?REd4WU5xNmZYa1JRRmR2QUVjRHBKZXBqRnBqM1ZTRmY3UHV4WVlTUnlKamtw?=
 =?utf-8?B?c3pZWUU3Yms2UThwZUJlNm5ROXF1OGR2VjJmc3JQZGNleExodkFNV2s5U2ZF?=
 =?utf-8?B?WUljWEhpVTFteE9yUys2UWVDVVlQNVdZdll6VXBFN01KbFluaHNWRDRMKzda?=
 =?utf-8?B?WHBRQjJrQUJCTklaSVl6Y2h2d3lqdzVmQ3pEVktXWWFvZlFkYjZXcC9KZ2xV?=
 =?utf-8?B?VExlQU1OVjk4bXYvSHlUUlhsYlRhdHAwOVlNc2xnQXpUQTJMUFcxUk5CNGxY?=
 =?utf-8?B?clE4enZXUWhDU0o1T3Z0QXNSTXNyaFY0YlRDNTFpWFFpNXJhTjlZMmxGd2sr?=
 =?utf-8?B?bGJjWXFJV01wamdVR011Mi9ZaUY0KzdzeHpWU3d5NFRWWlJ5bFN2Z1Y5SCtt?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BB86B9B33B62D459C4B62BFC8BAB22B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d5a63c25-c86d-478d-0963-08db260eeda7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:09:36.1445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 QjPdJw1T5QDxL9UUFm73ho+TSxUmrGbnO26XdmMjSR2f4e+YcGKZqX9YvSyK62jM09jzKwsSeDqZsZ+nqwPye2JqPQlKXjE/kwe5hXqSBOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
Message-ID-Hash: HFXCXTA72BQGOBHOR2BVM4APMNNDQCWP
X-Message-ID-Hash: HFXCXTA72BQGOBHOR2BVM4APMNNDQCWP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFXCXTA72BQGOBHOR2BVM4APMNNDQCWP/>
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
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2F0bWVsL2F0bWVsX3dtODkwNC5jIHwgNiAr
Ky0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL2F0bWVsX3dtODkwNC5jIGIvc291
bmQvc29jL2F0bWVsL2F0bWVsX3dtODkwNC5jDQo+IGluZGV4IDljOTc0YzRlMTg3ZC4uMDBlOTgx
MzZiZWMyIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvYXRtZWxfd204OTA0LmMNCj4g
KysrIGIvc291bmQvc29jL2F0bWVsL2F0bWVsX3dtODkwNC5jDQo+IEBAIC0xNjEsNyArMTYxLDcg
QEAgc3RhdGljIGludCBhdG1lbF9hc29jX3dtODkwNF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiAgICAgICAgIHJldHVybiByZXQ7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGlu
dCBhdG1lbF9hc29jX3dtODkwNF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gK3N0YXRpYyB2b2lkIGF0bWVsX2Fzb2Nfd204OTA0X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQg
PSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gICAgICAgICBzdHJ1Y3Qgc25kX3NvY19k
YWlfbGluayAqZGFpbGluayA9ICZhdG1lbF9hc29jX3dtODkwNF9kYWlsaW5rOw0KPiBAQCAtMTcx
LDggKzE3MSw2IEBAIHN0YXRpYyBpbnQgYXRtZWxfYXNvY193bTg5MDRfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IA0KPiAgICAgICAgIHNuZF9zb2NfdW5yZWdpc3Rlcl9j
YXJkKGNhcmQpOw0KPiAgICAgICAgIGF0bWVsX3NzY19wdXRfYXVkaW8oaWQpOw0KPiAtDQo+IC0g
ICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAgI2lmZGVmIENPTkZJR19PRg0KPiBAQCAtMTkw
LDcgKzE4OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGF0bWVsX2Fzb2Nfd204
OTA0X2RyaXZlciA9IHsNCj4gICAgICAgICAgICAgICAgIC5wbSAgICAgICAgICAgICA9ICZzbmRf
c29jX3BtX29wcywNCj4gICAgICAgICB9LA0KPiAgICAgICAgIC5wcm9iZSA9IGF0bWVsX2Fzb2Nf
d204OTA0X3Byb2JlLA0KPiAtICAgICAgIC5yZW1vdmUgPSBhdG1lbF9hc29jX3dtODkwNF9yZW1v
dmUsDQo+ICsgICAgICAgLnJlbW92ZV9uZXcgPSBhdG1lbF9hc29jX3dtODkwNF9yZW1vdmUsDQo+
ICB9Ow0KPiANCj4gIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoYXRtZWxfYXNvY193bTg5MDRfZHJp
dmVyKTsNCj4gLS0NCj4gMi4zOS4yDQo+IA0KDQo=
