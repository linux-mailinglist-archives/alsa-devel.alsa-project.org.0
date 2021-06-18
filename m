Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 549C73ACE42
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 17:05:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4BAE172B;
	Fri, 18 Jun 2021 17:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4BAE172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624028746;
	bh=xdJufAfKqFkBNIds7n3UI6ZDMHjbazj5PhQ3gTKjoGo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3w4UXKY3LYINDIDeuCdSIL3NJlT1VC2ExKsqRGpIFukDos9JCAWIsLnOIGYgolk1
	 +ghScefjeVtJLrmpg5yDaB5xpGM/VE4yL2TzAVISbA+tdz8gwXDl+pUFnkzXfNZh4F
	 1dD3qdjvDdjVBEh1+oBO1JqOyb7EdxBR8be6gIJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30711F80084;
	Fri, 18 Jun 2021 17:04:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69637F8032D; Fri, 18 Jun 2021 17:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB68EF80148
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 17:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB68EF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="fQ/KFWBT"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="uCWLGMxB"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624028651; x=1655564651;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xdJufAfKqFkBNIds7n3UI6ZDMHjbazj5PhQ3gTKjoGo=;
 b=fQ/KFWBTkTE/r+Wv1Swfsc3/CeKcU8uM1MEVDDS7F8tkl6/drAYj2mP3
 rGsHArVniK3/WsNdqcpZLfrTLn3a3h7KGubdTW9bVUMJU5YQUuAtsjk4l
 aovOTbg9n+D9+n9EXQ1rdP2nkVReRxWe6nazbypGYVkBBgjnlx2JMoXdl
 tgLJbwdCPBFC3rasaMDzClj7iAbnbaHjaCQhbyNyafJXSRjmWBGw3fVed
 9yw5jZWY3Z9WwryeDU0+DNO9yeXZV3mezUjVxst/OF2WyZRIqlEvrk3H+
 a/bIm/BF/zRcLtEqz6RdiDFEq2BOl8IhnMHWXKXjGWB3YA8DSMJphJyDl g==;
IronPort-SDR: oxQDXfusgGPJAXIw8qKBShoYEwHkly3sxINMcaWQoISDWhYxAIXkv+sFwltqM8TClcaq0nwB/B
 K1I73IE+oZuvfrwKhSBBWACmti/i4dKkAqWm+4fBEWt/AMm68l1U1BnhZOGo+XMqru/SE7/Osn
 Z1iwuiWVeBlIzgOaVdr2Hqm6kB3bQWT9BQ4qTCM88cs2s9tsufGIVt9c5xcJDrb1vnwrCtKl6k
 HIPCGLeNlD5UPtRzXmBoyaPkkjP4+lAM/mbg7hWZZBA2vuxpPP44rB9Uao3fHCBQVyWoUCoNBo
 P7o=
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; d="scan'208";a="125834235"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Jun 2021 08:04:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 08:04:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 18 Jun 2021 08:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLYZo3vZQiXtVX5kl0XCGfwvacdt1DKdXq0hsOyZEhElQqb2ausoFJNkDZ9hEaCSSm6KLnNAtFlCGEyg8mOmeQkmrokq41N2gUPGIfeNqaH/JepXn0nliLaczM3EhqoVJJIC+XKxtwy1R1FKgD/sawfcH3w278LaMfvW13v6CINJa22yIOM5b4ubTwd+kweueJfOuulwomGYRx9xi9BO45xG4ErXNgwEm7ntOz4Lz0WXsMuabHXtySBixVKfdq41K+PAdJn2kjzn1H091y92f/sEvUtqEjq06XISOHMl6mZPoENcFnUOy5aH7uDd+ZKDW+eGHhyxNglwqgQBMCL96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdJufAfKqFkBNIds7n3UI6ZDMHjbazj5PhQ3gTKjoGo=;
 b=mkUV8iMNxecnNCHC169CFbXjMPmvGj1CdWN6kbPfMpXGQJtaFR//2QKoehgejPkl8E1Ay4TxUIMOREn2ecygrZWJD68W3g6BJRhaBGeMEzgVo6PcGhvKYMqhV1Rc6Gpx6ZJi6BFXPCH2RBeyuLTEAIsBTYtku5oN+yG6zvMxElGZANRnmQ6Bx4DSF5kx00pd97LYJN7JHkpPeW1DaqHg9J/mL8nwJAEuWExyIV/X5MyHnafDqff9KuoFRYVTX3VaXI8yTv6WYyw/GjdyzxALxhg7ebNh0khCek3Dc+9Dy/EGLlq7HowZvij7VIWmRJ+7rNvRj8uyoSUAb7fKBFzijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdJufAfKqFkBNIds7n3UI6ZDMHjbazj5PhQ3gTKjoGo=;
 b=uCWLGMxBunjB79hJ80qZpkhEjwzSDfoU2E0lqPykC+4+IKGyi89+7cXpXjDdRDBbDHY6XwalnG1pce/a7bVpOL2ZED1QCYchpgsDhVT/R2oYvyHq7ATL4GspXdLdTEb+vtPnL2Un06gk2uqt2th9cx8E8J787OP+6fL1j9ffJHs=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM6PR11MB4690.namprd11.prod.outlook.com (2603:10b6:5:2ae::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21; Fri, 18 Jun 2021 15:04:01 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::5992:bf0e:cd9:2b50]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::5992:bf0e:cd9:2b50%6]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 15:04:01 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <kuninori.morimoto.gx@renesas.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>
Subject: Re: [PATCH v3 4/8] ASoC: atmel: switch to use
 snd_soc_daifmt_parse_format/clock_provider()
Thread-Topic: [PATCH v3 4/8] ASoC: atmel: switch to use
 snd_soc_daifmt_parse_format/clock_provider()
Thread-Index: AQHXYLhBQ06iTLN7O0Knb5bWC7HVzKsZ5OUA
Date: Fri, 18 Jun 2021 15:04:01 +0000
Message-ID: <3db2c0bd-a8b9-78f5-9d74-70ded4b419ae@microchip.com>
References: <87bl89w9fw.wl-kuninori.morimoto.gx@renesas.com>
 <875yyhw9e8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875yyhw9e8.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.119.88.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d8b87c1-46a2-4fa5-eabb-08d9326a4e9c
x-ms-traffictypediagnostic: DM6PR11MB4690:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB46900D14FE8EA978CCB5CECBE70D9@DM6PR11MB4690.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kOgHqazwoVPLiLJgxVb/dYDRk4Gt2wKtlw6SdL2QuXg5nqjgW10TwmVQOBYb8QTGtmYLo6aBdbg75UQi7qxMoahWbWCauB0B8kgRtHMlHRZFOtq9ByPl37bKdeVn0tlaABcPvMdM6o7LIi5k0nbZi8Tme6k0eo6tOPDZSKMIb6f4i6D7wYR58w4FEU5VyuPMt+IyLC3DMpFTzJz9ahynfRfPDazaNXCj3c5NqzSQP4igufCIZysdiB0AX5st+mkdwzGYZcrgPalorcVWlnKuV2tgBltiIuub/IKzB0CPPXyAJBHck/iacig2m/3MeeJdsF/jAGId6PuLpLBg3Qv3hHovGDh6saGbXo26d+/3RMJdQNJBuuMzvZbI/F8wgP4zrBiR0xXO8SFNr72K+kxYwKrdyS8hSNNwQyI3EsSxhfFEuj7D/mMqOcNyA3mVqtvJanTWIyg6mnQrg8i+oDkmcLtNquhjHiE/xNACtbF6XQ/VZUKRlCGXlSIB4qmSG3FRTGHKadcWI9RN14rPbdmTOg3Vx4jbGM/29Jbg7+DZzbZWmWAae7+Z0P3Xo097JmwH9JmV5YvJqCvHv/Dapmq7cdkUUElVD5bldaREWNhjOp9DhfD9AfXbt9X38/AMulDN7slTVk8QFIXGUVbuAHxp1vm0HLUorsEvpepCfbfemFNHw/mxa9FzkwngD4sOi+pP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39850400004)(396003)(136003)(376002)(31696002)(66946007)(7416002)(36756003)(478600001)(66476007)(64756008)(76116006)(26005)(91956017)(66556008)(66446008)(316002)(186003)(5660300002)(4326008)(86362001)(8676002)(6506007)(71200400001)(38100700002)(31686004)(53546011)(2616005)(83380400001)(6512007)(2906002)(8936002)(558084003)(122000001)(54906003)(6486002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2R0cnZ5UWJBTURyMElNdCt1Rk1abUhJR3NtTlhaNUxhU3ljM3ozMXFmcllT?=
 =?utf-8?B?THpoVDI5QXVSeHQ2SmhYV2FZNlZCaVBhOXQySkJNS1BhbkQ0clkzaHpXVncr?=
 =?utf-8?B?M0FVSmRtQU91b2xnc090eHo1emRoSGxZSFlHbFpaM011aTcxN2FuTERYb0RH?=
 =?utf-8?B?REhrZ3ZSNnhNajhIRXlrYVFJLy84UUJFaERkdVJ1VmhWN1YxS2huSGdpenpC?=
 =?utf-8?B?Z2Nnb09wei9sOHUralhnLyszWXBtUlFhLzZUalpFTUhHNGRFaGtRemFhQWtl?=
 =?utf-8?B?ZjV5cHpOaDFHWTVqYnlTcUY1ckQ4Yis2T1hzNEo0dFVtcmV5NTM4aEE0RkRR?=
 =?utf-8?B?TXhnWHYyZnlGOGxrUklyNlNJbktVRkdLNnc5WTdSUk5RM3RwQkN6Ym9MeHpv?=
 =?utf-8?B?SkI4RmlJRFJJbjhWZEk5eVBXZHNLbWliSVNYTmhRSm40aWk1RUxZenZsaU9m?=
 =?utf-8?B?T0Vjb3VOOVBlKzVucEZidnVDVWlnVER3WHJtOUJuVzQ3VUJsVTV3SmhzZVBk?=
 =?utf-8?B?WlMvaHhTWEhZYWw0WGJVY1U1SVZjbnM0K2lEakZLR1czZGJFVEZZcGY3RDhP?=
 =?utf-8?B?K2J0SWZOUGpmMFpQalVldmJHWGM0c2NCbCtId0J2MitNRTN3czZKa3R3dEQ2?=
 =?utf-8?B?WVVKeEtrYm5FWEVtNWxpZXpXa29TS0syYTBVUUh3alE2YUlEbjgwM3FGWm9U?=
 =?utf-8?B?bGw5SnhPY2taYVdCdGp2VFRKNXVudDNCQWtzNkowUjVBalRQMUwzUW9CdG9L?=
 =?utf-8?B?YTIwUHhkQnlUdGthOTlHV2F0ZXBpdXYrTlRnaUxzNE41Yy94Q1RVMUpRQURW?=
 =?utf-8?B?dUJ3UHAzU2FjK3lJUjZWVXR5UW1idHVHQ3VaNkhMenBiWlhYWVk0akVKVHc2?=
 =?utf-8?B?OHMrQlJqM1pBaDhSMFlDeUFoRFNhRmVBSmZTanZGYmR2SXhaNWt3OTJTZDJS?=
 =?utf-8?B?Y29IUC9ZMnlrcjIycEpMMGlMeW5XQWVlMSt3bTBxYlZjeGxYcUZGdmVqckFS?=
 =?utf-8?B?U2l0RFBQRFhsbVRPaTdPZkR0OUhwVHBhWGk2TVNBTmRUYk1aSG5Gdkl1czM2?=
 =?utf-8?B?bFhJaEhlQlhWN2M3R213cEoyZ0tGQ3MweDVZdjVyRDdlUDY1WUZHWmFaK2c2?=
 =?utf-8?B?QlFFdnA1YzZ6aUpnd013UklwdjNaa3NkUkl1MVZoRCsvVnVHaEVOWjFOU0FQ?=
 =?utf-8?B?T25wMDRyM3JLN29QWmFKVC8rb2V0OFE1bjZ2K0EwY3YwRGR2QlYvTGdTR0RS?=
 =?utf-8?B?QlltbUN0Qjl2bEtnYXZ6aGZJN2oxVzJ2dXVNQ2d3UGhJcm1LSk53ZVJSWFQy?=
 =?utf-8?B?NmVrNlFOTHErTEV3WnhDdGtIZ25BS25NSnFWbkM4SGJwa0ZpQ1QrYkg3ZGJU?=
 =?utf-8?B?WFNiYWUxQm5DZW9lb2FpRUF5K09XQkdoaTVNL1d3ZTV2c0tuYjFPUUZFV3pp?=
 =?utf-8?B?emZnTERGNndGK2VyTU40b0kvSFQ5eENHV2JxUXZBTmNTNkVSZ2Nob2x6dlg1?=
 =?utf-8?B?cHgrbzlEeUdkMm8wVGgwanRxbTlKQTNIY3YraXY2RG1JUHpLK044dlluMWJk?=
 =?utf-8?B?UDNpay9CZ3l4U0hjMEVqNjRGdjBvKzE0TS9nNnNJM1pIWnB4clFXQXJMc2lN?=
 =?utf-8?B?cWdXMHlLK25nUVo1Qk1abklKV1RaVFREbDk0cGdCN2ZScFZnM25VTXJTSk1x?=
 =?utf-8?B?VWUrL3dhcHNGTHFJNCtPMGpsZ2Q5d2FuMzdjK2FBbTFQOHhXZm9PSmM1U0oz?=
 =?utf-8?Q?xAk8sU9ebggV1y2/0o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A848BCB1C4C0294B92204012C8DE14FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8b87c1-46a2-4fa5-eabb-08d9326a4e9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 15:04:01.5757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4w4FLAFIDJ2rcIGlmMzGbeVO31aTHk5QlO/scVwt8UkOSLayUKm/6Zoy/gRXjScXNqoTsxZybMI0/It1tiYhVMpdCYAntgsl6SJG/urV4pI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4690
Cc: alexandre.belloni@bootlin.com, timur@kernel.org, Xiubo.Lee@gmail.com,
 martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com, spujar@nvidia.com,
 narmstrong@baylibre.com, Nicolas.Ferre@microchip.com, nicoleotsuka@gmail.com,
 Ludovic.Desroches@microchip.com, khilman@baylibre.com,
 alsa-devel@alsa-project.org, festevam@gmail.com, jbrunet@baylibre.com
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

T24gMTQuMDYuMjAyMSAwMzo1NywgS3VuaW5vcmkgTW9yaW1vdG8gd3JvdGU6DQo+IEZyb206IEt1
bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4NCj4gDQo+
IFRoaXMgcGF0Y2ggc3dpdGNoIHRvIHVzZSBzbmRfc29jX2RhaWZtdF9wYXJzZV9mb3JtYXQvY2xv
Y2tfcHJvdmlkZXIoKSBmcm9tDQo+IHNuZF9zb2Nfb2ZfcGFyc2VfZGFpZm10KCkuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBLdW5pbm9yaSBNb3JpbW90byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVu
ZXNhcy5jb20+DQoNClJldmlld2VkLWJ5OiBDb2RyaW4gQ2l1Ym90YXJpdSA8Y29kcmluLmNpdWJv
dGFyaXVAbWljcm9jaGlwLmNvbT4NCg==
