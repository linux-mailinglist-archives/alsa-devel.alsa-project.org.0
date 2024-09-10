Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9BF977E46
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:13:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17380E66;
	Fri, 13 Sep 2024 13:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17380E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226026;
	bh=z5TURhr96jfM5aDq4QRMCzl5Rq6YOQwta0GETebLZnU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mOjXxc/KDIf/StkROtw/+M5qrho7Qe54m5gDOsjK7lUPR+zjibpDmMZ8wWlUjIodr
	 ea3xGDnbvZKPoKgyOd+Qo3ygvSdd86gAXacbFCG9vciJGGwCVHpAZzXoS6doDes/IP
	 fEhGHv36/Et7PxsSCHjJRaXFNtejnTMP4ZXDwFkg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 171B2F806AC; Fri, 13 Sep 2024 13:11:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30C0EF806A4;
	Fri, 13 Sep 2024 13:11:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8894FF801F5; Tue, 10 Sep 2024 09:23:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16AC5F8010B
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 09:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16AC5F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=M5zuF5XE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQdjzq6enR/NMAtUzMA3GGtuwmid6gNImlE/TrpEtN2H3+XqH+AYjBSkDvZ3UDoNVPRfxJbImES0JqztRB57R7pN93whwuvwgSiaagHkT3sfFSmUMN0U0Icy6rwzn28znBYMa+PnFIPA0/w0Vygntc6fCP0Oz1S6J5lIXmdpuMRB90tXpo8CcpF3YRhn2OqF2/FOvqedKyqzTRPC0ATq1B0r6mbVukYUDg1EwS9Rtl1pzr4MlD5QqKMhUgd7dJxykfxGC3kDTSDKwY3CTMlAUjgwtFLHj/BL6vTv8kWxlg+WMJJRjeS5liEj4h4rsdVRjQM13SKnlmUwqVmTMI/TFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5TURhr96jfM5aDq4QRMCzl5Rq6YOQwta0GETebLZnU=;
 b=vdXl/KEv/U3Bha2Ykh7ziJn/zA5PPPxyPnYjzLl2N2G5kY/7J97ES1v4DvziTJT+0esiifOwAcs6Z3Yzt1NRaNNHWfEDGQqGcrB4I7wDL2x0iY8wvy89pdDAGRREavV6xbr+TDpfSfvJd3pO26lT2dhKE0ZlnZGclzH8Hs1QkTFTSHWCGl+LT2uB0C6YExjE3bF38ObBNANrI427JnfEwy7Nda/YZQf41HA2xTGgglAwh4BrVC77yT1z2SCHrcNE4h8/+TVF1NfCMbofowB0CdwMuFHWioq9DMmuJXwQE3rJZSOliaafiPZXhhrFQFowNWRsR7BVjf1fLy25FWspXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5TURhr96jfM5aDq4QRMCzl5Rq6YOQwta0GETebLZnU=;
 b=M5zuF5XEY7gHriWsDUwUUqSgVpvYPlADRfPxNSNITTVStA6N87UWhJz6w0Q3oxv1wVKo5nkYewLmW8PTS5dnaqsBv8EQQx07Om82r72t+H07M06vJ77qiFHHSIblqF8b7z6NZKkFiz3hDtugj96BnGKYJDTRkTWo9FthcLh0vkWy41fPl5yXjrV+z3zOsSMlMRWeU70sJPj40x44zV0CcELmToEtNnFFp1XfHFJa+rU07QhRrJOTmwgTxU5Bqs61nNePYnnJUXfnjkFPdtIk1MR62OSYFfPbrnXzzyKXcDFwxUNAQbTsMlDhkOwosFBwX/4oItFfki5fg6mzWOt7vw==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 07:23:15 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%3]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 07:23:14 +0000
From: <Andrei.Simion@microchip.com>
To: <krzk@kernel.org>, <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: microchip,sama7g5-i2smcc: Add
 'sound-name-prefix' property
Thread-Topic: [PATCH 2/2] ASoC: dt-bindings: microchip,sama7g5-i2smcc: Add
 'sound-name-prefix' property
Thread-Index: AQHbApN9h/JoYwUM0EqNV90IXfE58bJPIgaAgAF7toCAAAG4AA==
Date: Tue, 10 Sep 2024 07:23:14 +0000
Message-ID: <ac548004-ebbf-4889-8473-d7cd459d69fb@microchip.com>
References: <20240909083530.14695-1-andrei.simion@microchip.com>
 <20240909083530.14695-3-andrei.simion@microchip.com>
 <2bb15a72-82ef-4bc4-b01e-e4768687bab6@kernel.org>
 <c2178d70-2acd-4e74-976d-6ac6350a7b2d@kernel.org>
In-Reply-To: <c2178d70-2acd-4e74-976d-6ac6350a7b2d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|DM4PR11MB6334:EE_
x-ms-office365-filtering-correlation-id: 1ed4289d-ff9a-409e-0dc3-08dcd1696f52
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YWdrNm84ejFtcm5GWFRabUZGa0RpN3FkOFdOQ2VaK2oyK25ZSVJQN1pVMHl6?=
 =?utf-8?B?RzVTYW8yMlQ5SzRta2hxbVp4WkRpNGRzcVppclhSWi9NamZzOHdadUlxRG8y?=
 =?utf-8?B?RTVqY094clRlMy9neTZBUCtNeWVXeEZQVHhjd0lyanB6dDZFL0ZseE95QlVD?=
 =?utf-8?B?eGFWVVFqK0pYcUtzdU1PdDFTZ1BDRS9rcFYwTFZsQldXamU4bDR5WHRqVzZK?=
 =?utf-8?B?VDVDand6UlRqRkEwSzExN0NMZTMyNitab2QxcTRtSUVmeXIwMVVscHYvcnND?=
 =?utf-8?B?bm45QjAzSWZmVnU1NnkvbGh3SzhPM3pQeXBmVVcwYjBHdDRqQksvS3VNbDB4?=
 =?utf-8?B?USs3ZmZBZUhicFRJVnQ4bGNJRG15bmFOeGpZMnVseG1zcHhXSGE4WTMvZThW?=
 =?utf-8?B?WVVtMEJkS2RDVkIyL21xbEtmQkRyYWpxREZUS3hjV3p4a0JOYi9CNzJ5dGky?=
 =?utf-8?B?QkpVSWtTbEZDcm5Oc1V0bUgzRlBTRnlXb0h3TXhiSkUycW4wYUhHTHhPaStp?=
 =?utf-8?B?alp0UUxFQ25neFVuaXhlT2krTWFkT1JKWGlrdzdXdDNKaG1DeVVmN1lFeVU4?=
 =?utf-8?B?ZktqeG1paC9qZG5zbFR0WnRDaEhDeGRDNDZVTFdlay9rTEtTbDN2a1lWaEJI?=
 =?utf-8?B?a2NzLzF1S0lsMGdNMTNiSHlkU2pGUU1nUXorQS9OZmZhbm40NndpZGdhWE0z?=
 =?utf-8?B?OUYxdzZUbStsWitNS0FEWDJISlFJUmE0UE4xZHU5WEM5dXVicTM1TkFsT2Vv?=
 =?utf-8?B?Y0V6bnFiQ2d5OFNidDVzUXc3S1BiQjg0TWRSd1plRHQyOGtBb0p6MDFoYXJE?=
 =?utf-8?B?Q2FoUW1KVjU4RkVvT3pmQjZLOTZTSCt1NmQvYmQyTWdZSzU3VEpqVWtkM1Fi?=
 =?utf-8?B?SWcwNW53YllycHdOcHREYmZCcnRXd1I5dStUQ00yV1FTbkFRK0NqczdNTy9w?=
 =?utf-8?B?aERkRzlDTjdUVUNTSDNmYkhGVE1ub2h6TC83S25oUGRaSTJab0ZoZVF6a2hV?=
 =?utf-8?B?d3VNWHVMUzlpdWV3MHk5WEZWWEFkMnlHZWJ3RXR3Q2drU2FLRnQ3OHNlc1FF?=
 =?utf-8?B?eG9iK3FrSTljVkdIWXpBSEI3dzdtckovNWpFck0xYlF3ZHVKd2xldXdDY0c5?=
 =?utf-8?B?YTV3NzgwSlBsTzF2K0FmeThDTkt1WEtPMHBQSTlMdlJvNCs2eTdBNjU2NjU5?=
 =?utf-8?B?NTBkcFQ2ODFWb3FUOVJMclhwb3ZXT2gvY2VXSmVOUTdXSFpTZUIvN1VnWXBG?=
 =?utf-8?B?NzJwUHB6b1hSNHloYmtQd2EyL0tSZ3RBQW0zVGhYVEsxRUZzOHpnUGtXYkw4?=
 =?utf-8?B?cGxPcnhWOEdwbHNCWWpuR0FoeFNsYmswUVVwUnFuMUcwSktjQTVZZTY3NThz?=
 =?utf-8?B?YTNwSUlvbGtjQ0h3ZW4veXJQc3NpeGQ4ZFdsMkNoa0ZjYWJXUkUzUWRzMUZB?=
 =?utf-8?B?eUhWS0ZwNkdmeFZGUHAwV0s1bVVYb1g4MFh1L0Q0VkRneWZqWjljTjV2MTlj?=
 =?utf-8?B?bUFqWUZYNUJsWjdDWkxCMEVPaUFpVm1sdGhuTWNOWWRXSGRzODJBRlVNa1cv?=
 =?utf-8?B?UHJBRGwwdExLRUxveHNEK1RVUEMzeVZ1d2JWSVZxcnpYWU9oYWhyZWY5ZzZv?=
 =?utf-8?B?OVhCRGpMN1p3YkVBQ3pNVFZ6bGhEQUFsMzNSQjdWK2RIS3ZFLzFrRUZVcWlu?=
 =?utf-8?B?bGZ2Tk4yV0RBSHh0NmdGNmUrdlFNbkgxb293aGRxOHZiT1RuMmwxSG4yV3hi?=
 =?utf-8?B?RXArcDBPTGptd1M0aVJCcTF5WUhHZEJLNEpwVjAxKzBkY2cvQmo5ZjdZdmlo?=
 =?utf-8?B?VHhTOUo2bFl2WE4xd2lRcTFmSWtlL20rMm5CS3RkaGtleTZxZnJnU1ZkUWNn?=
 =?utf-8?B?TEpvOHdnMGpLdURCbDJDdXJXY3hoVko1SmxSbFhiVmxWWE1BS3dTSUdHM2M1?=
 =?utf-8?Q?h5FL/dTNbs8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SWxyb0FYNElPa2x6MEdZa0V5SUdadXgyMDFQS2FaNGxIa0hja2NqNXVyRHl1?=
 =?utf-8?B?cjJJSmR4ZmRQSGMzVkdNYVZpU0pzYUxPWlUzaUhOby9EMzFRbWsvY3dxU0da?=
 =?utf-8?B?YW1Dcjl4V2psbzl5TkdjZnFnNmJ3UHNHVWQ0cnJBbXU4YXBPMTJuRVBZdmdu?=
 =?utf-8?B?NDRtZ21DbFJhOUo0NU96WmhzUHR2OEhQUkdNSUZZdHlvN2Z1Snd3dmpFa21B?=
 =?utf-8?B?UFdYanY1Z2Fsb2dlY1pLaEdIeUJPbWlNNGdpYnIrSVNyTlZNbTBJamVuZU5Z?=
 =?utf-8?B?LzFUd0YwWFh0ekYvbEp0RE1lMGlCQ1ovaDROa0N0ekN3bVZnZ1p5d1B5VTJI?=
 =?utf-8?B?cndRcVhZcEhmZDIrcmhmemx5SWxac3crRGp1WDJNaDNvK0g2Y29GbVorN1ky?=
 =?utf-8?B?ckU5d3Z6ZHM2cGNaRWxkN3B0UGtEZHFCWWU1c1BwTnplcGZQWng3bFFxMlF6?=
 =?utf-8?B?OUoyVzdvaVQ3Z2pBUHlGc1FNRlE1R0RYVHlnNVNadGFNQU5YUS9WVjAvWVI3?=
 =?utf-8?B?eVpZckcyNWpGRU44ZWJ2MFVDRFczWnhQa0c4VG9UY3BTZjd2Z1NkT0V4WDlW?=
 =?utf-8?B?SU45ZmY2MGUrUFNtWWJsOTN6WUJKR29IdDcrcHgxc3ZaaFRMbEQxdERKR1Y0?=
 =?utf-8?B?aHY4V0Q0SHVlQW5Nc0VPMjVVQ3A3bVhIb3VxTDhnRHAwR3lrWUNVdllVamlN?=
 =?utf-8?B?SUZ4WUEzaXYzdllIenVUUlZreCtBdXhwT0l2MlEvMUtic25Wb1hyb3IxS2VY?=
 =?utf-8?B?SGJRNXY2RkRqdmQ1NTlTd1BHT2l3Y1BaZU42UlltVTNaTDkzaWk2V0JYNW02?=
 =?utf-8?B?cWpBVFVSS1VpTUQyTTdQaVh0UDNobWFzbnc4bTJGdkxjZGdFUkZEU09iQmNh?=
 =?utf-8?B?MXVTQU9YNXVvL1dlTXR0K2srOXZvaDVTWjJiblN6NXVVOGZ3NjNqOHBmeUps?=
 =?utf-8?B?QnY5Ris5WVEwbDN6K29vYU5zWVJ6cHhER0RpWWRFRTE4K2hCRGdUcXpuc2ZP?=
 =?utf-8?B?V2MzbFZhcWlvOVVUc0lQUDhIM3I3VWU4aFRqaTZ1OEp1QlUrWkI2UDVGUlFt?=
 =?utf-8?B?Y3Y5RTZTZWR2aFBsSjZCd2ZuVEVXMnBnZ0ptamUycmc3REhTTkpUWExxWTBn?=
 =?utf-8?B?SUxtcWgxUVh2RkFYWkdUT3dMZnNldXhhbHVLRVVMWGJvWS9BNTJ4TXJaVEEw?=
 =?utf-8?B?UzlvRlBwVXR5UjU4NHBXNzB5L0MwNFdjbHF6OUg4M21kcndrQS9VWE9mdEpI?=
 =?utf-8?B?TlJsRmw2dThrSjlTVEk1eDBpRGtzMDN6TTEwZTc0RzBmZmZTOTNzc2VNdHd6?=
 =?utf-8?B?REF1TERVZVVMZytXaWpLcitaRkZDL0oxOHFhUUhZU2M5R244VE4rOURXTExY?=
 =?utf-8?B?a25iVlRpY2czOGM3bGs2Z2doS3FLdkZhQkNNRmpLMDMrci9teUVWTlFjZjZ5?=
 =?utf-8?B?TFd6SmtZYkd2R09PZFFNbHEzalFWM3BpMjcvSHQzZXc4TWltS3JCcllWR044?=
 =?utf-8?B?YXd4d1A2Q3BCZUtrTGRlV3NyL2VKRHpRcnROUitjUlVvTkR0eHZJWkVoSk9j?=
 =?utf-8?B?c29iWjVsbGhwRk9jb05FUEtiQmVZZm4vNVJqdHJDQmJwb0tqeEc4NnVmQWxC?=
 =?utf-8?B?TjlkRCtPU2IzWlVOMEtLaXNBL1JzSXFDMTRSNW14d3ZCc29lOUxoL2xIWDVO?=
 =?utf-8?B?OGlubGkzTWpmWU5ZcmhvZDBwa0lEQTExQWxyOG9tdnV6TkhUMlQwSi9MSjFx?=
 =?utf-8?B?WlMvcHlpWkplUWxQRU9qdEZZVndNSmZPUS93b3VpdnRoMEJnTXUzeDlQbXNz?=
 =?utf-8?B?K1B6Y3ZRK2d4RzFEZDhsRWhlTmxuZ2NXVFZPQitNR2s2Qkk3bTJObUNINTds?=
 =?utf-8?B?UTJkN2lKeUFncmhBb2pBdDlWRHhJQWpwbm55S1d0NExNUzYyM1p0WEFRV3NB?=
 =?utf-8?B?cFhYWmVleFlkN1JtZU4ydmVhZjgyNUkyVFh1b1ZsZUxtQjhjM1lpb3N5M0dO?=
 =?utf-8?B?aU1OazluMjlqdTA2VCtCaC9raC9Qb3M4em1sRkVHdU51UDdEMXZGUWc4MVFW?=
 =?utf-8?B?V05YNmN0Ui9OeGJhRGdOVUdlN0V2VXN5cUsyaktRS0hyYmpFOFA5Zy9rMnpB?=
 =?utf-8?B?cVk4RndxMURSQ0gvQngwOEpTVStWc2tXVFhDRnp6SU9JVTlmODV4YXRFK1pT?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FFC0E5F270CB045A401A9129A8E56FA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ed4289d-ff9a-409e-0dc3-08dcd1696f52
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 07:23:14.9094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 C9m1fTi55TNuLVldYl3o9t05fEuC9yQCS6kcPN7BWKUUKD09n3LP3zQR7VxPllY+KaRXuKP+E4nZS1wHrrsDoXWe+d9irSbyjG7OF5zn29k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
X-MailFrom: Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3GCWOXTL7OJ6MDFJCQQANJH4HZRWFSLF
X-Message-ID-Hash: 3GCWOXTL7OJ6MDFJCQQANJH4HZRWFSLF
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:11:40 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GCWOXTL7OJ6MDFJCQQANJH4HZRWFSLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMTAuMDkuMjAyNCAxMDoxNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwOS8wOS8yMDI0IDEwOjM4LCBL
cnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4gT24gMDkvMDkvMjAyNCAxMDozNSwgQW5kcmVp
IFNpbWlvbiB3cm90ZToNCj4+PiBGcm9tOiBDb2RyaW4gQ2l1Ym90YXJpdSA8Y29kcmluLmNpdWJv
dGFyaXVAbWljcm9jaGlwLmNvbT4NCj4+Pg0KPj4+IEFkZCAnc291bmQtbmFtZS1wcmVmaXgnIHBy
b3BlcnR5IHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBpbnRlcmZhY2VzIGluDQo+Pj4gRFBDTSB1
c2UtY2FzZXMuIFByb3BlcnR5IGlzIG9wdGlvbmFsLg0KPj4+DQo+Pj4gW2FuZHJlaS5zaW1pb25A
bWljcm9jaGlwLmNvbTogQWRqdXN0IHRoZSBjb21taXQgdGl0bGUgYW5kIG1lc3NhZ2UuDQo+Pj4g
UmV3b3JkIHRoZSBkZXNjcmlwdGlvbiBmb3IgJ3NvdW5kLW5hbWUtcHJlZml4Jy5dDQo+Pj4NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBDb2RyaW4gQ2l1Ym90YXJpdSA8Y29kcmluLmNpdWJvdGFyaXVAbWlj
cm9jaGlwLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWkgU2ltaW9uIDxhbmRyZWkuc2lt
aW9uQG1pY3JvY2hpcC5jb20+DQo+Pj4gLS0tDQo+Pj4gIC4uLi9iaW5kaW5ncy9zb3VuZC9taWNy
b2NoaXAsc2FtYTdnNS1pMnNtY2MueWFtbCAgICAgICAgICAgfCA3ICsrKysrKysNCj4+PiAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gT25lIG1vcmUgcG9pbnQgZm9yIGZ1
dHVyZSAoSSBtaXNzZWQgdGhpcyBiZWZvcmUpIC0gYmUgc3VyZSB5b3UgQ0MNCj4gbmVjZXNzYXJ5
IGxpc3RzLiBVc2UgZ2V0X21haW50YWluZXJzIG9yIGI0IGZvciB0aGlzLiBTa2lwcGluZyBEVCBs
aXN0DQo+IG1lYW5zIHNraXBwaW5nIGF1dG9tYXRpb24sIHNvIHRoaXMgd291bGQgYmUgYSBOQUsg
YW55d2F5Lg0KPiANCg0KeWVzLCBJIHdpbGwgYmUgbXVjaCBtb3JlIGNhcmVmdWwuIHRoYW5rIHlv
dS4NCg0KQmVzdCByZWdhcmRzLA0KQW5kcmVpIFNpbWlvbg0KDQo+IEJlc3QgcmVnYXJkcywNCj4g
S3J6eXN6dG9mDQo+IA0KDQo=
