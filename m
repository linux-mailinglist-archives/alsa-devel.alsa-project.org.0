Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B922C96964E
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 09:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52E7CB6A;
	Tue,  3 Sep 2024 09:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52E7CB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725350298;
	bh=B+otdV5CyD/JthSQf4Fp0UZHo6c1JGC8sULe79Rp1hA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CvNUnxXdu0XGki2Hev5ObxQRJbu+RJH16s5bVfHszVaYpSppgu4RvXMocosfzU6a6
	 DNmqN+lNuiJ8O7Yq79xPeCUCDz9fI1xSXAeauXH6CITrZxvEQkoyTQ1v4zvx24/Ta9
	 w2b6BMJi2xGbrkUkFu+8gIe7moFMEmrxJihi8E8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26A28F805A0; Tue,  3 Sep 2024 09:57:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE42CF804F3;
	Tue,  3 Sep 2024 09:57:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59DF1F80199; Tue,  3 Sep 2024 09:57:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FE26F800E9
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 09:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FE26F800E9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpJd8Cfk0d/u5OSeCouBnRCPnqVpBcOF7tpPe0/eImXqccp6qCTW1tgjhD607O8tzJt7aq+29anHoFoSLtYvaHpBYK0hHKfLydraFERPdXpZCmV1YegnpUl2Mfgy+LG5mbPiKTXfTOfIHm3NozS7fYayZ11Dq3WvIU9NTg9xHrmqRXepr3X7Yz3M8rO/oOvO4S9xL/qQnmDovvJ8+QervqJDKsZPbHk1+pDKaZz/D4ovG/MK5I9TJdMXiklhIUW4IXSlHw3rxhspjT5fgKjYRBOM5F/GzNdkUFW+P9/P0hKKfppx4wQCHgt1U4NFxX1+pDDIeZQ8Y54kytPsO61vOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+otdV5CyD/JthSQf4Fp0UZHo6c1JGC8sULe79Rp1hA=;
 b=xVNW2FIvGW3fjwPK2AojyQTrOwFMIgNNINPm8utnnMXc9NQ6JShIke4/i5Fc/GwyqTymG47rLyNwLyr+2WSr/DEwbIY6rslByEHr7XklGh/57q5Ugsj9+Hfot4ZCX2cX/PyI2UZdumAxMW2HImZBi3PpaL6d/Xk3/IPuQWZZLgIf3paIi2bhKVSS0X3yNdi6VXB23pCt3k6FwpIksNPVEKDgzb6NnWrTxgO8LcmSVKeG4fcMWW1UyHe8W4D/gexvuJFYVO1YTZRfJ6mBdy9HHdEpoYLMqjCTCxVoYDZYkxrX/4L7S3cva+20Tk4q7GZh+oFC9yCcgAAhfUKqv9sOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE1P216MB2173.KORP216.PROD.OUTLOOK.COM (2603:1096:101:161::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 07:57:30 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:57:30 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Application <application@irondevice.com>
Subject: Re: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Topic: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Index: AQHa/cRjERJUfF8g1keevq2iDIPRt7JFoWwAgAAAW4CAABCKsA==
Date: Tue, 3 Sep 2024 07:57:30 +0000
Message-ID: 
 <SL2P216MB2337A6B3A699EF3C08A3A2D08C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-2-kiseok.jo@irondevice.com>
 <3gu6u7euavq272kaf2znmyn5p3rd3vupvqldvfxnq7nh5ul6jx@apwfcxvgkoyj>
 <6648b7d3-3883-4d48-9b71-b8394a84fda5@kernel.org>
In-Reply-To: <6648b7d3-3883-4d48-9b71-b8394a84fda5@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SE1P216MB2173:EE_
x-ms-office365-filtering-correlation-id: 6f45e302-fbdb-4668-9ef2-08dccbee0fc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZVRvVnVOblJzdTkwUkVSRXFTTWN6WFFTbGhWdlRxK3lpSHNwZE5BaWFRV0Zp?=
 =?utf-8?B?bzdYN3VvNWVyTXU0WENYTFlzQlhNRXgwVThuN29jRUlaaTJxemVzOTRhK0Js?=
 =?utf-8?B?R1NHcFNrRXBOTVVZbSs0TCsxZHNCWC9zSXFTK0RBN1l6STh3RVJqdXFZNld6?=
 =?utf-8?B?elpxSzdXcFdISm5hTmJ0MjlxQUV1T01MOFdMWEh6UmF0aDI0NVhkVGEwVEho?=
 =?utf-8?B?SkZEQVBhVHM1bzhwWDVkQUlTVnViN3ZabHp0ck8rblFhRzV0SzBmUkYzUU9Q?=
 =?utf-8?B?RnVITldDR3krTGZISytDekNtOGJTVXE2cjFRK1FXMkc1MTdzLzJJcldreGJE?=
 =?utf-8?B?b2x6UW9nNEFQL1hnM0QwdHU4YkxFM29tTkV4MlA0eGVxQmRkdGxMZnloT0JU?=
 =?utf-8?B?UGJLZjVTRCtMMUs5WW9lelZlZFh0TnVIL2Q4WUJCMTUveWpleXZDakdoN2Fq?=
 =?utf-8?B?a29obXltRnRWRDIzQ2hxMElrYVhHTmEyK3ord0NRRm9Lb1FaVyt2SHR3SUdv?=
 =?utf-8?B?N3U2T3JFczYyMVdoRWdvZUFzTGZLWGNPN0lvM0gwRlE2WWVHdU51d1NMemxP?=
 =?utf-8?B?VGE5dlh2SHA3SkR0Sk15cTVRZWRuSzF6Q3pjYkpGNjhEL08yL2F0dXh6YVdB?=
 =?utf-8?B?RVp1SjUyYitMUDlmSmdtalV4eXZTeXdJT3dMK281Z0VTcTVKWW9Nd0xVVVdW?=
 =?utf-8?B?ZkUvbGJ3TEtHMUorKzhRZUFCdWdSSnBMbEM0N0Z2TkZCdlB1WFVHOEpmanA5?=
 =?utf-8?B?Qk5hU3haM0VybVl1YXN0eisxSlRGQjFLR1dDdlFtK05vNS9oZk5vb1d0dkNj?=
 =?utf-8?B?TWs1c2JsNDgxSkhRci8yUlZtaC9sZ3htVkNkTUQ3QXFQQ2hMb2J3RWtSWFhL?=
 =?utf-8?B?aUZDT3Bwb3BmQ3RtOEwvYm1US05NY1ZTa0J4Q2ZQdDB3Y1I5SDk2YWpEWEMv?=
 =?utf-8?B?V2F0MGd0Ujc0RmlOSEI1WVpBeUFBTWlsbFRZN1YrVGRrRUhUMjZGcytLNnRw?=
 =?utf-8?B?UWxSR0tPTDRhcTErMkhQbjhWY2FlaDJUM0x3L0ViT0xEL3BzSFB1WEdXR0Ru?=
 =?utf-8?B?Z0g3Z2RoaTA3MnJaL2h5R3lqV2xrZG5xam9KdHlpYmhjbnM3QUVQRTIyQThM?=
 =?utf-8?B?bVJETHcwa1pVY09odEVyazd6Zk51VnZMK2NCZzdoWUVNZ2FCeWVSalN5YkJW?=
 =?utf-8?B?cTFJUEZ3M2p0V3FoVEV4T3N6TU1YbU1KZ2Uwa1JhZlBZSzhoQTZTUDhMaDEw?=
 =?utf-8?B?d1VjQktOdnNUdXpTZ1o5cmtXVDRGNzJpWS9USUZBSnFhb1NBSHRGNGw1bGl1?=
 =?utf-8?B?ZFBHQSt3b2R6aGswNGhHclRzL2lleWdpRGFRZnJZbXRvMTVQU3hjTUxOcWho?=
 =?utf-8?B?VjNVYVdoWTNqU2JrNjVsUnRabUFpSTluQnkvWjBoVXhiM3pLTk5uQzcxdmtk?=
 =?utf-8?B?QnUzczliS0VsbjJEYTJBTHo0azRVUHhFc3VkWDdoVUpzbFpuVTl3TmZXejRo?=
 =?utf-8?B?b0JOd3hva3RsK0dpOGJaMVFDR3daN1pUUmNCSks3NHJEdDVsbUtjQ3BDWXZ4?=
 =?utf-8?B?QnR1bERBUlpWMUc4UWNSbDN6R2szNnJPRVp1V25nS2hJWGYvV0NTQm9EZUJ6?=
 =?utf-8?B?V2tOOFg4VEg3Mmt4V0R6c3RjWTViNzdSbG5VaWF1K3JmZUhzSUJqMVdURFVH?=
 =?utf-8?B?blhOWEYvakdzTkxFTDdNRmNMWFRWdE5aak1pUGRpTG9iekpEdDM2b2cwMEVN?=
 =?utf-8?B?a2JkRy9kZHRQOXd1cFc1NkJ1UFB2VERudC9ocUxYaXlFdS9Cam1qRDVOUmpj?=
 =?utf-8?B?cjhvRzIzNWdLN1Ezck1xS1pCWXcwUDBlcVorUy9ucmlsNHhXdWZRRFFrLy9k?=
 =?utf-8?B?cE5pRGRpdS92Z3h6YXc4ZXFLdFU2OGF1SlExTGVDRzArWWc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V3E0SEEvOFJ0OXlKd1lRRkkxVTNmWEZvTVFRSzNBVlZnNGVweVRPRndVSnZP?=
 =?utf-8?B?QkE2Y0hLMGl1ODByQ09zSFFHVzJpbHZmOXMzKzVWL2VFSld2bWV5SFVyWlpk?=
 =?utf-8?B?RHE0QTNGS3laTkZsTXhKWVNCYWk3V0t6SUpna0dmQzJKZUllaXppb0hyeFRy?=
 =?utf-8?B?V1ZuTFo5MXhENVlxc0txZytuN3Y3ZG10OC9BNUlIYmtvNlZFdFF4M2VXRUJN?=
 =?utf-8?B?ZlZjZzBNa0tBdEdJZmFHZUlQSnBiV3pqY1NaakQ3ZnNCRlZnbnJnRzdRWkpy?=
 =?utf-8?B?SnNOU3FETGU4ekV0MFZpQU9mcisxa3p6cWdmUVZxdyt6cGMySVB0ejVFbWdD?=
 =?utf-8?B?c2VENjhnNjRHeHdWZUxyYzliNEVTNjkyVWlVbVZJOG1pR3BBdUJySk1Db3gr?=
 =?utf-8?B?U2lNWmRLUFcyOHJhNE1jRXg2WENTTi91R0wzeVdNZnZ3YWNXQ1RLaUx1NGFY?=
 =?utf-8?B?ODE4elc1UWQxSzBIaWZidEc2QTBYQ01lT0d1bS9xTUJSdDdDWkF5QTYwRDFO?=
 =?utf-8?B?TVpVZWZCZDkxQTlxM1dVMDVHb2cyYy9nd0ZuSit0ajFmT01SZEdrV2xadE0v?=
 =?utf-8?B?K0hQS3RiYVVFelV5Ni92aDFXVm5zbTBTMjNCcmlOUzNzVmJ5WnR4K1Zuak9k?=
 =?utf-8?B?MGV4MFcvalB3M1lMQmwySXFrU1dFTzlybVhLNVIrQ01qK2kxekEzRy9XSTV2?=
 =?utf-8?B?bWZLY01kYzhRZ2d5ZkhTWTVJTW5FQ3FHbGthcUFnUUJjSFcvNUJpL0JaaVda?=
 =?utf-8?B?bnZDdmhXRjdyR2V5ZlZqUWVCT1RPUVU5b2Rxb2g2RXBMTkNaNnpXeTJXTFNQ?=
 =?utf-8?B?TG92NFVtOHRXSXk1NTdlQzVpTmh0WkdFSXFrajdXRTJySkYrejRLVmtQcmdL?=
 =?utf-8?B?a0wybW9tcW1pNEt1c2h3Z25rSUREWC82OFBMTUE5Y3FqWjRwS21UOFlxejJl?=
 =?utf-8?B?blZVT29nS0xYOEE4bHBaQlJCS1JldWRWOGFaaUx1cmpKeDlTK0pJQ1pHVkFr?=
 =?utf-8?B?R2wxd0UvOVgrcW1TT0dnZEhkRHdWOUI5dmdTWTdra2RJZjUwbWN1S3hoSFpt?=
 =?utf-8?B?dUI0enZyb0wxR2ZhNkJSWE9RQkV4bDVRd1ZQbTNQSHVoRHNNSlQzdWtBdFF4?=
 =?utf-8?B?eHFJK1FDQ3VpWmZTSE00NmJLejVOMEVSbUFaK0szM3lpbnNmZEVwcUFRT0FG?=
 =?utf-8?B?RTNubU5LNlJKd1RCamlCOThsNFRLbzJMV0hmbzBUU3NnNmRZd1J2dEE2VDNS?=
 =?utf-8?B?WWlrM3BxdzZNK2htMXh6V2RsRm5mZWQ0MzlHQXdZUUtpUWxVL0RxcHV4MkFm?=
 =?utf-8?B?dytoTnhqOVpNQUV2SmN1U3hNUmFUeTk1cWR0dVV1UHZ4U21DR0xucG1DVG5I?=
 =?utf-8?B?ZjNiamUxVExVbSt1QzVYRlJzRktjSWkyOXZqTmV1K3V2d3lsZkE2Qm5FTm42?=
 =?utf-8?B?dnhEZzB6aTgvQUh4SW5peHE2K3ZVUnpVa2pJa09pa3BwRzJ0anhQQmxuSE53?=
 =?utf-8?B?WEMzVkxkYmZYZlQ3L3FscFllejRrWmNxUlREZkJ0ZlByZ2dtbGZZSDZxZlhL?=
 =?utf-8?B?cFF1dE1rUEdZaVJiZ0NYcGpCQUg1UklPSXp2dnpTZVk2OFMxN3ZBc0M3azZq?=
 =?utf-8?B?eGk4SkRqREJEbmIxdkJFMTZkeFVTRSthSi9vOVBEU2lMY1Ewenlxdk8zRG5E?=
 =?utf-8?B?ZGh0NGFUZW01d1RneHRxdFJDbVhkQ1pUbmh2d1ExUFVaK2J5dEpiaEZRS0ZC?=
 =?utf-8?B?N1Yzc1E1cXlPdnc3amRFRTFncXRRblF4SFpnbzRqTmNiTGUyS3hYYkl4RHVM?=
 =?utf-8?B?eFE5cFlLN0w1R3ZDcUc1bTE4Qko5Qy9jYm1uNTlnNmJBeURXL1JFTEt0Zm0v?=
 =?utf-8?B?a3E2WmNCbkNoY2krYWozRzdWK0QzUUxDa3lkN3hVVEhMYUduNU9PZnJPcC96?=
 =?utf-8?B?TVFIS05SU1c0bDYwVG11clVETTd3WU4yYmVmdUl4ckZWcXI0UjYzd1kzL2pH?=
 =?utf-8?B?RDh1anlHTUV6TVhXaktlcnA3em4vWnV6ODNTVFJQa2diVDZvR20xY251NWMr?=
 =?utf-8?B?dlBxdTVMdXBkUmtYYUNZRy9sYkFPbmhBdG1vanRXV01INkI3SGRPMmVQNXE1?=
 =?utf-8?Q?5BGO6PBIOHN+crNyQTLC/er1P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f45e302-fbdb-4668-9ef2-08dccbee0fc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 07:57:30.6500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 lcdsaQ6L259lq+511Bt5MNAan1AyuGlRdryEH/tqs58FFK2OnG7bAyJsplGGrnVqQxjHP4kdyYbC7eBJJM0wh+dUUhlN7012mw0+NyLpv6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2173
Message-ID-Hash: NU2XOTCG6VSOHMRPZT73XVWGZHXSS3WR
X-Message-ID-Hash: NU2XOTCG6VSOHMRPZT73XVWGZHXSS3WR
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2D4OUIFZZAN652SP7OP73AZGUXDOLJWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiBPbiAwMy8wOS8yMDI0IDA4OjU3LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+IE9u
IFR1ZSwgU2VwIDAzLCAyMDI0IGF0IDAyOjQ0OjMzUE0gKzA5MDAsIEtpc2VvayBKbyB3cm90ZToN
Cj4gPj4gU2lnbmVkLW9mZi1ieTogS2lzZW9rIEpvIDxraXNlb2suam9AaXJvbmRldmljZS5jb20+
DQo+ID4+IC0tLQ0KPiA+PiAgc291bmQvc29jL2NvZGVjcy9LY29uZmlnICAgfCAgICA4ICsNCj4g
DQo+IC4uLg0KPiANCj4gPg0KPiA+PiArCWlmIChyZXQpIHsNCj4gPj4gKwkJZGV2X2VycigmY2xp
ZW50LT5kZXYsICIlczogZmFpbGVkIHRvIHJlZ2lzdGVyIGNvbXBvbmVudFxuIiwNCj4gPj4gKwkJ
CV9fZnVuY19fKTsNCj4gPj4gKw0KPiA+PiArCQlyZXR1cm4gcmV0Ow0KPiA+PiArCX0NCj4gPj4g
Kw0KPiA+PiArCXNtYTEzMDctPmF0dHJfZ3JwID0gJnNtYTEzMDdfYXR0cl9ncm91cDsNCj4gPj4g
KwlyZXQgPSBzeXNmc19jcmVhdGVfZ3JvdXAoc21hMTMwNy0+a29iaiwgc21hMTMwNy0+YXR0cl9n
cnApOw0KPiA+DQo+ID4gV2hlcmUgaXMgc3lzZnMgQUJJIGRvY3VtZW50ZWQ/DQo+ID4NCj4gDQo+
IEFoLCBub3cgSSBzZWUgeW91ciBzeXNmcyBBQkkgZG9jdW1lbnRhdGlvbiwgYnV0IHlvdSBvcmRl
cmVkIHBhdGNoZXMNCj4gaW5jb3JyZWN0bHkuIERvY3VtZW50YXRpb24gY29tZXMgYmVmb3JlIGl0
cyB1c2FnZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg0KT2theSENCkkg
aGF2ZSBjdXJyZW50bHkgc3VibWl0dGVkIDMgcGF0Y2hlcyBpbiB0aGUgZm9sbG93aW5nIG9yZGVy
OiANCmZpcnN0LCBJIHJlZ2lzdGVyZWQgdGhlIGRldmljZSBkcml2ZXIsIHRoZW4gdGhlIGR0LWJp
bmRpbmcsIGFuZCBmaW5hbGx5IHRoZSBzeXNmcyBBQkkgZG9jdW1lbnRhdGlvbi4NCg0KSSdsbCBz
dWJtaXQgdGhlIEFCSSBkb2N1bWVudGF0aW9uIGZpcnN0LiBTaG91bGQgdGhlIGR0LWJpbmRpbmcg
YWxzbyBiZSBzdWJtaXR0ZWQgYmVmb3JlIHRoZSBkcml2ZXI/DQoNClRoYW5rIHlvdSBmb3IgeW91
ciBmZWVkYmFjayENCg==
