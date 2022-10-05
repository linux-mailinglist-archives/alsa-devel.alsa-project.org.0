Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 012195F5667
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Oct 2022 16:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9117F16A3;
	Wed,  5 Oct 2022 16:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9117F16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664980130;
	bh=WIY1Q6tGMuGnj10oJB5GN4cUXCvvDObiYOC1BMV4+aI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H4dfDEdOBtqsj70yIrtkyr+77f+WWvGu+gHDm95hGKPzDMe9KWor/Vlx0V25NrJHO
	 jB8q1TEuj7xckx2oRj3EJa/ABd8HM7NvjrCsWzukDJYPYb75NS5FmfP+v5Vw2+emEx
	 penOBKaeXzfxnu+Nf2KxWBrw2UkS1ak8a6mYME+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 100E7F80212;
	Wed,  5 Oct 2022 16:27:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8F94F80212; Wed,  5 Oct 2022 16:27:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130097.outbound.protection.outlook.com [40.107.13.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA448F800F8
 for <alsa-devel@alsa-project.org>; Wed,  5 Oct 2022 16:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA448F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk
 header.b="F2qSN7no"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHop7QKVVxANogfdWy2VM29PoIzRGxljTnrJe/EwUDepqNVM/LeZjuQ77WbifbI/mWtWP42bVJc07LdNt5vIjmMbVRazxLFIGuS0dAa6BEdNMU0PGjc+YvTiIbwCsbj6rvhXfQqkH9YFow0ttwHIJc7vh/miHi/9eh9tlI6Cqo8FeDMwUoAAyKcx3Ny+sWvOqIKAQbH5gNML12X4z6eElFVdtat7izdSww1REE4ewNs/jhTCiWEpe5+XKLOmbUZvDce1HlZfAWvszU41kQRCMJjnS1Anp/MX2mYtLbM6J7xo2Uj1ZKzeYxOu7IkXx1nfSz/Q9DEHxkQt9Kke/ZBINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIY1Q6tGMuGnj10oJB5GN4cUXCvvDObiYOC1BMV4+aI=;
 b=iRI5t7D3ITNYBxA/Kje/EfuvCMpkn+svj/jETYuCelJnTH+24RPLDBfClCBDT7+GmhAJZZrH3T0y0kdDoeZ4SHcmzvEalE2owHyikNXzaykczJDhfIGmVSgNqdgGbFd3qZtdwJDNokF+Nka4oyBt6/fJ8+GedPYuuasRb5rGeKHc79VN7U439PqdXsEebsY2tJuwgd1BsgM2VA3wBgNzTqEHT+Po51MB9DIi2u+hL/Fqf0BvJYFBylSzhLkmaTTbnhvy1oiVhSrHV9T3xSe4hC944RouP4kdkJ0fHl1ozGelautf++By52Fz3H+m5ma74jqXk0HnMicSUOrF7BVGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIY1Q6tGMuGnj10oJB5GN4cUXCvvDObiYOC1BMV4+aI=;
 b=F2qSN7noOX/KYtY2Z8ktwUYw8qnelpA/Ztp9mhVRc+DqWqRLXFJDY+wM8zakA57FHF0aIRpCvry26AEC25uWtU1EFzwDV3oVCMToPahd+ct8cUTzcWQ7UEUT9Iy5AOwcyWajnURx6iJlbIPrgZVqAzhYNhfiy6fMmSBoCIgCvLg=
Received: from DB9PR03MB7794.eurprd03.prod.outlook.com (2603:10a6:10:2bf::13)
 by DBBPR03MB6700.eurprd03.prod.outlook.com (2603:10a6:10:20c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 14:27:40 +0000
Received: from DB9PR03MB7794.eurprd03.prod.outlook.com
 ([fe80::550a:e73d:6a17:4250]) by DB9PR03MB7794.eurprd03.prod.outlook.com
 ([fe80::550a:e73d:6a17:4250%9]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 14:27:40 +0000
From: Claudio Cabral <CLCA@bang-olufsen.dk>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: audio-graph-card2: parse pin-switches property
Thread-Topic: [PATCH 2/2] ASoC: audio-graph-card2: parse pin-switches property
Thread-Index: AQHY2MafNRifnxxxSEWDiLtZbji0tA==
Date: Wed, 5 Oct 2022 14:27:40 +0000
Message-ID: <20221005142734.2724537-2-clca@bang-olufsen.dk>
References: <20221005142734.2724537-1-clca@bang-olufsen.dk>
In-Reply-To: <20221005142734.2724537-1-clca@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR03MB7794:EE_|DBBPR03MB6700:EE_
x-ms-office365-filtering-correlation-id: f87dc7f6-2221-4d19-fbcf-08daa6ddc238
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QIjmkti8+PHTH+hB0RKsiq3tgH8x7NDXyQPeo8N5Pd43Yi4a6/KzSjdbmWb2A0ou0SLG5u0kQwg3BwJZxhLBh4c1FwADd1pnsK9Sh7UQDaZwy0mi+G+D679Z8Zy6cYuPPHXSJw0IoYHNIdDX1jykXldVat8th6sMlZ8/iEQQtynZTBuYXSACGBDujbr05tf2Ge8KCG9eNPN1L5nF6JvWZvcdHrNw7IP/VL9Zef66MCpTAyL+r6fA+kcGA1isjD0I3nXGX2Iqb5JM3psCOmLqvdsqcoxUQHfmlf03LKpA1XGCEmbNUSbuNwLPkVMvvT9Fi0Sk3RGDwRXyioxLXljO4C97fjSoAgGOslXYqV/imFFdLYAaTM9YG25l3QNfjUTlprC8CcBm9xt90d0du54QlxEdH80u181yrELrrDRImaNfG/GMRfPaIqbn6/j9QDvPwi3ABwsdQTusumiL/IJUKac2BM9oyZxb3zUeruLKJFPmi0XY0Qdhi1GHayd1Qw159PWkZPb+H0YnlgbHw38KgLnmvN9S1xr3FvdMImm3ykK/i0C4e62RI2yw3M4yLUGDearK8V1QRK5FTda6dXOKEVD+RlwFUKl0wEFEPZv/PEMIYdn/OKW71BBcpAJFV+HUqix2A20k+IRdB6Lmo7esKXbVEdJWn5QNLuo5aZ/7kIwnQWIV46FkQ3PmZWmKDTIAPU/SbvMpV6gNsuvPnXCq6TiuGNK02U62v3P9reRrVcHBMDE2C56AlnIoKkW+Sx9NeyJ2bloEUAzYpW6tAQIhoQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB7794.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199015)(186003)(2906002)(38070700005)(36756003)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(5660300002)(4326008)(7416002)(8936002)(86362001)(8976002)(41300700001)(6506007)(38100700002)(110136005)(122000001)(316002)(1076003)(478600001)(4744005)(26005)(6512007)(2616005)(8676002)(91956017)(71200400001)(6486002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXpRdC9SN2w5aHhlcDJKMDJ6ZnI0aEV2V0Z0YzQrMFJFMGtGQzZNSXEwTW1a?=
 =?utf-8?B?K21VNmgweWJoWnljam1jRHhIN3JRMTAya0Y5U3VHMXdEUG91ZzJ5RE01MTRY?=
 =?utf-8?B?OSs4T1RTdk85TE52d014UGUyR0RrbnYzNGgwSUtRMTQvQWcxRXhnclhWbnhh?=
 =?utf-8?B?NVBLQU4rY295MlFuOGFtN1k0RFhKZGhZTkJwdGJlM1dCSGZMYXY1T3VoWG1G?=
 =?utf-8?B?VzAxSmhWQjBOTnhod2hXbGFtRHMwWjNhS2NZcHp3QnZnZmpjeDdkaU56MG55?=
 =?utf-8?B?UXJNMzlPYVZFcTFIU0pFa3pDSGE3cjZGRGppb0NIamhRMytlS29DdkUva3l4?=
 =?utf-8?B?MzVuYnlJV2FORzYydWUzWGtGNER3b21MSnZWUlc3a2tTTHAvVEwxVGQ1WThW?=
 =?utf-8?B?Z0FJSUdLUlN1NFVlYzdzcWpZTHJLSDRRSmdlcjl0WDRLNHFJLzVvTHJiQzdi?=
 =?utf-8?B?MEpTUlpUdTl0NVRpWDdYNFRBZHQ3K0lITlFOaEZNK20wSmQ5ZTRPZTE0cUY2?=
 =?utf-8?B?SnFLcEJTTHlKRzNmdVM2OFYxcnVCZzVzQWpGWVNXdGs1aCtzZG5jNitzZ1BR?=
 =?utf-8?B?U0xNZWljMlpOVkNTRlRVbWpidmltbHJEMmxGQit2VU1SVzhsajVFNmpHYXlw?=
 =?utf-8?B?enphWnU0WjgrVFRIemxmTUIxNGhBaU9adGtoNVViSE9mWE1tWWRDaXZseWRP?=
 =?utf-8?B?bVFBaXphZlZEdGFtVWdwWld3d2hPYndOV0p3b0V1TUlHRHdFUC9GUEdqWVVX?=
 =?utf-8?B?dEtIQ0IreTE5WXV2cy9jcWFiM3l2M005ZHVua1J1YWVBQm5LVFFmZ2JtazNj?=
 =?utf-8?B?K1l4UDB0QUJQd01HQTJPOUpHemZOQWxzb2VZc1RDaUEzbVFrcUxTdDhvOGd2?=
 =?utf-8?B?VjdqS3pwM29od3lJeFFLU1Q5Z1VENVpReVdMbHhUZFRIaTNIdkN4VEdzRm94?=
 =?utf-8?B?UHJWclFVbkZXNGF1cFhxVDg5U0pDN0VCTVBSTVhsRWd4dU1GYnpJMDdNRFYv?=
 =?utf-8?B?RTFhbmZnTGxNQVM4RjVKZnltUE90UldLTjNRRVd0eFdTRTE1bzJwMzAxNDJv?=
 =?utf-8?B?K24zNmZWSVZId0J6M2hXUjRBTHRMY1EyVmxRaXRMRjVyNXNFbUppdEs5aVFT?=
 =?utf-8?B?Tzl5UXhQNjNDbStSZkRRazF2NVJRMm1NRm5pWnQ5WGdCcEpsTzJndzI1bjhP?=
 =?utf-8?B?ZE9GUW1mRnNraDJvc2JZVWVITmp5OThHV3NQc3lhTmVtRkRDRjV3MkZ3a3pL?=
 =?utf-8?B?OTFOU0VMRUswcGZCQVpLRjZ3bkVRcG9XR1F3V1VZbC9TQURlaVpSaTExSE10?=
 =?utf-8?B?eFo5KzVhTFVXMFFNUGR2NnU0RE16YU9yRHZpcXRJZjViNmdpcnN6SDFHSytm?=
 =?utf-8?B?MTFlWEtjN25qUElUMW5vMmN3MmVlTVV0dmFCdHVScHJvaFd0cEUycE5NOXo2?=
 =?utf-8?B?SnUxQmJQN21CNjBIVk1jOUdVWWlDOEpHMkR5ZldzWmQ5dTdxUERPTXJ1ZGVH?=
 =?utf-8?B?aldzZGptTWdvRkZKaEJidFB0dzhUOEkrbkpRRWw5VFVsa3RIQzdqdjlaOCt4?=
 =?utf-8?B?bFdJa1FrNmtiYi81YThlRXJLYXVrREJxcDI0VFFxQ0Nhekl1MGdPTEJZYVc2?=
 =?utf-8?B?RTluanBteXQzVnJ3aW9NcWNCMTJLS2Z6bEovZFEwSUhDbTRrVVZFT2Zwa2ds?=
 =?utf-8?B?YS9kZ0lqNWdCYkdwVmp4OXNJS1M2b3VTVFRsVVRmQS9WWFRob3B4clNJRWpN?=
 =?utf-8?B?NVlSc3ZtR2tBUUZsbHUvMkdJYi9TS0Y1ckhNdUl1WUJWaVpJVm5MbHN6NjZ3?=
 =?utf-8?B?Qjl1ZjZQcldzYVJtR0hRdzQ4MGJrRm14RmlzTm1xbjZjMHV5Z1NLSjYxUUF4?=
 =?utf-8?B?TEFYcm43RTNmNXVldkd1MCt0SWxFcTh5RTZ4cUV6N2ZZOTJKQS9ReW1Lc1Rv?=
 =?utf-8?B?d3hJbENPZmlaaG8yUmx5c0FXekQ0NG95TTBLN1hHK0owdW5LMEZHWTZSNyti?=
 =?utf-8?B?UlptMTZTY2ZwNVh1QXozUGVQd0g3dlB3Y2tidnMwRDZma2MrSlJ5YVpUcUNH?=
 =?utf-8?B?OWpMeGNINm9aMlludEF3bEpzeDJsWnRMdUR3cmtrejdVcXBRdmNJQmN6TnY2?=
 =?utf-8?B?amRrTktIcGxibmI2MlllRjVheUZuVk5iL2dGVEh4YU1tMGEvdzA4c1M3MHk1?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF4360EEF87AD24DBD30B2FF75E85BD4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7794.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87dc7f6-2221-4d19-fbcf-08daa6ddc238
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 14:27:40.2374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aI6mbSOMr8IUBXLQb3lfAPJY51lcy0plC5Ik1tUtr9gu5rW4QB3Z05/dWJuoqHux2VjQIcLDv1/7xl2Yb5lwHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6700
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Claudio Cabral <CLCA@bang-olufsen.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
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

QWRkIGFzb2Nfc2ltcGxlX3BhcnNlX3Bpbl9zd2l0Y2hlcyB0byBhdWRpb19ncmFwaDJfcGFyc2Vf
b2YuDQpUaGlzIHJlcGxpY2F0ZXMgdGhlIGZ1bmN0aW9uYWxpdHkgb2Ygc2ltcGxlLWF1ZGlvLWNh
cmQsIHdoaWNoIGFsbG93cw0KdGhlIGNyZWF0aW9uIG9mIEFMU0EgY29udHJvbHMgdG8gYmUgYXNz
b2NpYXRlZCB3aXRoIERBUE0gbm9kZXMgdGhyb3VnaCB0aGUNCmRldmljZSB0cmVlDQoNClJldmll
d2VkLWJ5OiBBbHZpbiDFoGlwcmFnYSA8YWxzaUBiYW5nLW9sdWZzZW4uZGs+DQpTaWduZWQtb2Zm
LWJ5OiBBbHZpbiDFoGlwcmFnYSA8YWxzaUBiYW5nLW9sdWZzZW4uZGs+DQpTaWduZWQtb2ZmLWJ5
OiBDbGF1ZGlvIENhYnJhbCA8Y2xjYUBiYW5nLW9sdWZzZW4uZGs+DQotLS0NCiBzb3VuZC9zb2Mv
Z2VuZXJpYy9hdWRpby1ncmFwaC1jYXJkMi5jIHwgNCArKysrDQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2dlbmVyaWMvYXVkaW8tZ3Jh
cGgtY2FyZDIuYyBiL3NvdW5kL3NvYy9nZW5lcmljL2F1ZGlvLWdyYXBoLWNhcmQyLmMNCmluZGV4
IDhhYzZkZjY0NWVlNi4uYWEwODZhM2ViZjljIDEwMDY0NA0KLS0tIGEvc291bmQvc29jL2dlbmVy
aWMvYXVkaW8tZ3JhcGgtY2FyZDIuYw0KKysrIGIvc291bmQvc29jL2dlbmVyaWMvYXVkaW8tZ3Jh
cGgtY2FyZDIuYw0KQEAgLTEyNDUsNiArMTI0NSwxMCBAQCBpbnQgYXVkaW9fZ3JhcGgyX3BhcnNl
X29mKHN0cnVjdCBhc29jX3NpbXBsZV9wcml2ICpwcml2LCBzdHJ1Y3QgZGV2aWNlICpkZXYsDQog
CWlmIChyZXQgPCAwKQ0KIAkJZ290byBlcnI7DQogDQorCXJldCA9IGFzb2Nfc2ltcGxlX3BhcnNl
X3Bpbl9zd2l0Y2hlcyhjYXJkLCBOVUxMKTsNCisJaWYgKHJldCA8IDApDQorCQlyZXR1cm4gcmV0
Ow0KKw0KIAltZW1zZXQobGksIDAsIHNpemVvZigqbGkpKTsNCiAJcmV0ID0gZ3JhcGhfZm9yX2Vh
Y2hfbGluayhwcml2LCBob29rcywgbGksIGdyYXBoX2xpbmspOw0KIAlpZiAocmV0IDwgMCkNCi0t
IA0KMi4zNy4zDQo=
