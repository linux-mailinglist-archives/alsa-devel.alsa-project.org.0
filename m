Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7315440D42B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 09:59:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1209F17A9;
	Thu, 16 Sep 2021 09:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1209F17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631779147;
	bh=uaL07LNWDDhFQSmclfurX2f4JxfRz1UlGaH7oWG2te0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IZRIGlfAv01M7yYwRONd0EMAjtmbhC3Z7aIPwwmI7mE0bSHIVBjP84ucqTmjwXuaj
	 tLbBEpf2h56yAwdgQ7/jKZUrE/UyOXkgdEZJIt9SAkDkMvnlg85QrJBbZUTudZ9r1i
	 d8p4JW4jIzJUr70RoUUHHRCxA1hRuoDUVW4O5ppQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6581FF80271;
	Thu, 16 Sep 2021 09:57:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27BF0F8025E; Thu, 16 Sep 2021 09:57:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FBB6F80113
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 09:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FBB6F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="rBgkZG2a"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="tzo1SFM8"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1631779063; x=1663315063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uaL07LNWDDhFQSmclfurX2f4JxfRz1UlGaH7oWG2te0=;
 b=rBgkZG2aGgjSqlAoCYPE0pO7ssu/JdhtP4/rm+Nj5LQoOtLw4eZrPfsb
 WUkop1yvHLvHQRg31OxcpSjQKfLRkTt3AgBzlSpmaeesfZqdI18ONTq2q
 DKIKOr5Y8Tkp03n1ULsyfs0ZDFx5yaOEGNpj8gwEwCxD18MKTX6pLlYj/
 LoEOEjui2H4jm2YpfFaFJ7xUjXRRUZu/42Oin9nmBrVQzaLxKTti6KXwX
 tR8RJoiEej7YqLxPDMTNdEjXhEqxMEsaZgQX9BShH0Nr0QHR19nL04Jh1
 BrtY5PBtIa7PyFMZtPf0OhJpckkgCKnVeUwUagTBFF7OrVBbz9Nqx47bH g==;
IronPort-SDR: 8q3h/oYmhBKuk8hdO2yMV8KnQd7ymsvOG1eTsXxlPUEoFAko8/Rr5byGk64aDXMutA3SpOUcKu
 NYDMHrLQSnqvyU4By5dEI0LdBuKjmubmjsUpE+/p4bjSanO1Wv/CPA138zdioYEeAapxQqyrv9
 RV8fruFTQEEPNWRBYl9rMu3AlaNSnHyG/N3F/4AJp3dTcmgppCCfbHtod2S43MteZU/iOQiQDq
 PP2sfulw6gEq3JyUytNaKHMM/WF20FQUS4ZSsMtPeLSL9rDg8TkD7i2WFPBT9LoST/8++4x/3t
 5bVcn7qxki1MWIHbrys0/BKs
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="136174680"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Sep 2021 00:57:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Sep 2021 00:57:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Thu, 16 Sep 2021 00:57:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arZ2nfZynb1wEmcy1h/uS9fnrCOvxKTWQ2gmyZPJeM4Sd3Hz/hnyaz5ywLwedLyzIPBiXsHjgSmPkj+tHYG5F7mdbA/ypSIX7SR2TT4LBwIO70ShRp+rEXLxhleQmdrQbSF/sxiPsIxr55j+PvliobdX8PA8OqCI9k3yQqi6JZxPP9KO37fVYX3MVCfBX7ZYc5XeMZx3+YOXzZM6ESUcnHGJdYIy+JlEnTXVyaBouLYcl9gOjYLUbnvFucUGcQIzgKpjH1wKtvT7XOTn53c+b9KE1qQ7gtDrY1g7ayujW1V7Mh4JDnwSi0AxGWBka2j0IXqOXltFM5txE2MnDZvvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=uaL07LNWDDhFQSmclfurX2f4JxfRz1UlGaH7oWG2te0=;
 b=YjKaI31h/KTARZQ5YK+FoKNZaUaFMJ6OEF0NmFklPVNZYm8x8opN+fpBMBpRPj8QBDQhh7clv0eNOEN8+KW+FxaNbwdM+i0hEg5mnODOSD9c3XKZCkntEdX97tZk9Be/YrZpcoI23dW1rVEXP2DAFpUlo6+ecWvGxs9vN5GtEY0LmsOq1ZKg/eoH929N/47iSpgKhEmnySywotZfLPHKODqQxHLhbi11FN9gkmt7o5VubiG9MTLvNGi0qjnTBRP0kgnjVdgTPEB2B+ujqgt9iw5ya+UdpApLlJ46UeGZXdmCfte6WVma2Wc/JR6GnQgPzvqxMt4BarPYNGu8BL9f1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaL07LNWDDhFQSmclfurX2f4JxfRz1UlGaH7oWG2te0=;
 b=tzo1SFM8RZadjMqakbhgPksMU+7/2/8qG7UHcSv7BWQP7aTFDsw04+4orGy5N/qo/wy56w24B81mQ/LqkjrrAfpUyfuueKabCwq8WVSlGDfK+HMwTG2CUfxiBLcg6XkleZVDhT9mPs01M+zOg3T3bcX0M3WKNqIohsDwPBIAybY=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM6PR11MB3019.namprd11.prod.outlook.com (2603:10b6:5:67::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.18; Thu, 16 Sep 2021 07:57:33 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::1871:9649:9f19:d6f5]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::1871:9649:9f19:d6f5%3]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 07:57:33 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <peda@axentia.se>
Subject: Re: [PATCH v2] ASoC: atmel: Convert to new style DAI format
 definitions
Thread-Topic: [PATCH v2] ASoC: atmel: Convert to new style DAI format
 definitions
Thread-Index: AQHXql1Jm6cEk4q6NkWci/Mx1u5JsaumTEiA
Date: Thu, 16 Sep 2021 07:57:33 +0000
Message-ID: <4e31450e-55b2-3ad8-8481-e4868952d2ed@microchip.com>
References: <20210915181048.40070-1-broonie@kernel.org>
In-Reply-To: <20210915181048.40070-1-broonie@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a32aeba-b7c2-426c-baab-08d978e7a420
x-ms-traffictypediagnostic: DM6PR11MB3019:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB30192C32C35A9F46EC828246E7DC9@DM6PR11MB3019.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fkupy6w+isfAeg3hYijGiyClpouaT/5ayw7vy+humAkCM50601F333pLMSQUIwHN8QE+bjIvHXf46lAHckLWcpuB7McF/gWPV86RbbgGUx2V45As1igcu6fiCNKRqAiEMEglpF3EvHGqzwu3Ian8kRwe/tFZuKmxxzzerj0TTJNjwJ9HfQbeg1nESmv8MxG0QtaogTKiNvS6+jwIi1Er0wBr2t0XvBeOY8ZX9nAywa2wqvHp/aEYrP4zZQnIBPGMZZ8uHv576g2heCQKuO5tHmcrJzDZA6cPalFfxovXXrpSVxAjjiSG5VylNYvr5lZ5zntSio2WQAlottCLeb5MmTb2rUIs7PrC4Vvao/MNzNB3Znz8/jJ958nG553cWOPxq4TAJBSfjYhEbSKJ6DJwElqPDfij4mGDbaitibshxjK2fVZLQIEx2hcDZXE17VrPkwtXNfCLUACOg/kNB1Mgq8x1tM/SEkizwlCl+dPocdrdac+/FRSTi/t8XB1lF8qQlE20b3j347BkvQZFcXEESVq2XEQZfPbOZdRJIjjKPo36zrebuK0f+RlWezjjiznL5MzM+6LARAM8kahe11lUvSM5d8GUdKWkwM2VxKP9QptoSP0w5vcUnTsSgZSx1YHtMS8Mlmiw94jzC2AWF/0BotNF9GtvKGc8Vy48xljWoxjtIdH2PMKXJjVD3BgW1Ed8ad6De70CbqZGCAzMdLbT6TYY9GUGM7j7/feZPQ9PS9p8q1D7RsNTFfUKSmr7C5lIRpkRrjVbQa9uqZPnqC/pfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(346002)(366004)(39860400002)(5660300002)(66556008)(31686004)(38070700005)(83380400001)(86362001)(31696002)(64756008)(2616005)(6512007)(66476007)(71200400001)(110136005)(54906003)(4744005)(6506007)(122000001)(316002)(38100700002)(53546011)(186003)(8936002)(36756003)(2906002)(4326008)(8676002)(66946007)(91956017)(76116006)(6486002)(478600001)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW5RM3hWMnZ5ZGtoY2IzbEg5dTZCNDNNRzA4d0dsbWVzRnNaODNlTnhtOWxn?=
 =?utf-8?B?c05MN3ZMaEI2VE1OUXFXd1F1WktRUVlvMTFMMU5xWEthUGpRM1RqWWlCMTB2?=
 =?utf-8?B?U2gydEJWY0YrTEYyWHNOZUpuK2VMRUR6UnZVYXJmbHE1S1VzRUQ4Y3B5RWxl?=
 =?utf-8?B?Z3h5OEp3M0FKVFpVbDk1aXUxVkZhS3lQT3BuenNBNGpTcTc0T3hOS2ZjRGVJ?=
 =?utf-8?B?VXRkN2k3TkMwWk1QYXprSHVkOXNCM3N5ZTVQOGhKdE1ITDZ3YnU2R1ROLzY0?=
 =?utf-8?B?S0RtZmZPZ1V0d0htZk10MFdncVZ2aENHS2dXK1RBL3NPSzNkWHZjT1F6Vi93?=
 =?utf-8?B?UDByUjZOREZUU3QrbHZKeXZIRzVaTDNPRTc4eG9lOXgvUXJTbnFYTm5VUVNI?=
 =?utf-8?B?NGpXRGU1WWlQNGV4cDJBTWhIZW13REpnYWlFc0FSTjVIUVVsLzJVbVJlTkhW?=
 =?utf-8?B?eElxN2NjOG5MZnRCVXlxeXZUTktEN2FoaDBiYUVlN1BicVhObEpqa1Zwc2Z0?=
 =?utf-8?B?OFNoS2RrZ1dIYzFMZnh4bkRsT0VqK0pQcGhWL3hvcWFMcUFtT3FBMmd3dnhp?=
 =?utf-8?B?TkhibkE1aHRkOXY1a3luU3RRNDdSYTQ2dm93a21WZVZRTFZ3a2dwUHQ1Yzh2?=
 =?utf-8?B?STlhMGwwRFBIZXdXUnMyVnpVV253NVg1VWlneko0YnJGZkptSHBjWUlpTCtx?=
 =?utf-8?B?UUF1UVF2ampBTDlVVVd5OEhabzREc1hiSVJtWExYMEJQY3lvbmFoRUc2eVFM?=
 =?utf-8?B?TlQ5NWtOcTNjY0tYQUx5RUx1cnllOFY3SmZRS1pycE1GSjdhVkE4Z0x2Nmlt?=
 =?utf-8?B?d0p1OTNZdFQ4a1pHczhyUHFqVVRGWFI1NHFJL2lmWTlYZlJBS3ZrMlNBYlls?=
 =?utf-8?B?cHdVMEt1NUQ4bTgraE00T1pWWVNCUWNIM2pUNjJwSEx4NWFVaVY0ZnNTZzRl?=
 =?utf-8?B?UFJRWGpodCswYTZ3eGZJR0g1bVMxL0JORFQwa21jWTFPeWFEUHVSUWgxU0p5?=
 =?utf-8?B?cFJxVTdzZWJ4SzFiQ1Z1TnB2QzBJQlJGU1g3bzNWRFlxNVJMWjV2cWJuUnZw?=
 =?utf-8?B?eUZDeTR6UG5mUXdRUXprSnFvc2Ezb0hVb0JrUnFrQWZvRnhhbEhzbnFWRmVR?=
 =?utf-8?B?T3pJTW9UWlVrTnhJVVdnZ3JaYUs5bnNhd0xJZnZDOHRodm0rUHVoTnViS0pj?=
 =?utf-8?B?TStlS3NVYjBOWUpZUWU2TlkxOEM3OEpvd0pyU0g4aVVzVFgzL3RiWXhxRkFm?=
 =?utf-8?B?ODc0aE1KK0o1ZlVMdE1wbDFScHNrSHQ3bDlxMjYvRGxMdFlMeHBBUTRKTmxD?=
 =?utf-8?B?cGNMYm1TN3l3aVR0bEtSbHd5MHJIRUVQVVFjWGQ5blRXR2hVeEY3cG5EQkpC?=
 =?utf-8?B?eVpUUkZqZXBRL0cwNEluRHBxWkVZeWF2b1VvcWpFZndvZGhjN1Z0T3ZWR0Uz?=
 =?utf-8?B?UzM5TFd5a284ZFF4MjVXdzdBUG54ZVVEVjJKVHRTNkVyaWttVzdva05Rb2xR?=
 =?utf-8?B?bEpVSHdKQ0FQMUZLMnlWSG5UM2svZ2UxbCtuaVF2SFdUUmducWlJVGlWYVR2?=
 =?utf-8?B?a2pvNDBWbkF3dWFoSWc5K1ZZa1dVY29sQS9XU2wxZlVWU0thVFBlYXlrMEFk?=
 =?utf-8?B?SGZaTURLZjBxL1U2K1dLTXBuNWFSS0xHeHBYcTlxdTFOVVpjVmF2SldRWHcr?=
 =?utf-8?B?VUxLWVdVcTB3OHpwZlJOcStsMXZNT2RFSWFiczdudGoxU1VkU29BNDIrRldL?=
 =?utf-8?B?anFkS0NHR1lPYjV3bVN6MzAwaHo4YlRFTGlXais1MnFGWFg4RGNONUpOZTVn?=
 =?utf-8?B?cmpmc1FaTm0zeWI0anA4RnZ1b2pQWDBmQVY0b1NRdTYrdkpSaWFETk1BQkhs?=
 =?utf-8?Q?77z+I7jkuyDUG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0048856FAD64A479DFFFB0DF8E4C8A5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a32aeba-b7c2-426c-baab-08d978e7a420
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 07:57:33.4140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +iHT4mbE6qm3qrTsWYO1774I2AmfSN4T7IhFRWh3hQPTAsWZ2wWbk5zppoZHaQvtBi9rD9pk2o2Nbvi/X8xV5vltJDe9F2XTvMdiUZpRTGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3019
Cc: alsa-devel@alsa-project.org, Ludovic.Desroches@microchip.com,
 alexandre.belloni@bootlin.com, Nicolas.Ferre@microchip.com
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

T24gMTUuMDkuMjAyMSAyMToxMCwgTWFyayBCcm93biB3cm90ZToNCj4gQ29udmVydCB0aGUgQXRt
ZWwgZHJpdmVycyB0byB1c2UgdGhlIG5ldyBzdHlsZSBkZWZpbmVzIGZvciBjbG9ja2luZyBpbiBE
QUkNCj4gZm9ybWF0cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVA
a2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1
Ym90YXJpdUBtaWNyb2NoaXAuY29tPg0KVGhhbmtzIQ0KDQo+ICAgICAgICAgIHN3aXRjaCAoZGV2
LT5mbXQgJiBTTkRfU09DX0RBSUZNVF9NQVNURVJfTUFTSykgew0KPiAtICAgICAgIGNhc2UgU05E
X1NPQ19EQUlGTVRfQ0JTX0NGUzoNCj4gKyAgICAgICBjYXNlIFNORF9TT0NfREFJRk1UX0NCQ19D
RkM6DQo+ICAgICAgICAgICAgICAgICAgLyogY29kZWMgaXMgc2xhdmUsIHNvIGNwdSBpcyBtYXN0
ZXIgKi8NCi4uLg0KPiANCj4gLSAgICAgICBjYXNlIFNORF9TT0NfREFJRk1UX0NCTV9DRk06DQo+
ICsgICAgICAgY2FzZSBTTkRfU09DX0RBSUZNVF9DQlBfQ0ZQOg0KPiAgICAgICAgICAgICAgICAg
IC8qIGNvZGVjIGlzIG1hc3Rlciwgc28gY3B1IGlzIHNsYXZlICovDQoNCnByb2JhYmx5IHRoZXNl
IGNvbW1lbnRzIHNob3VsZCBhbHNvIGJlIGNoYW5nZWQuDQo=
