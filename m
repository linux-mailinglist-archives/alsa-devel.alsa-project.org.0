Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A53976BF0B0
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 19:28:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9383EBF;
	Fri, 17 Mar 2023 19:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9383EBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679077737;
	bh=7UFAVw05vVAQZMh8v3cZAo88te3XG3Vz6ShjN2sWvS4=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=dOOvajbiZGSoFbKBBzMdxR0gEOzU9uzhoiJCxqunkfJd9Yc4fkPEV2B5yDwK5yNAe
	 D2t+M/w5h/oCrd2joFwvkqOkrWnAeTkRhCtMQadw4JBoe3A6PE2uc6+3b4VAGkwBbd
	 i1r08BPI9tTDuMzJtdDXAVIUZ0YISv04w0KzLYiM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2901F80272;
	Fri, 17 Mar 2023 19:28:02 +0100 (CET)
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Derek Kiernan
	<derek.kiernan@xilinx.com>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 6/7] ASoC: codecs: Add support for the Lantiq PEF2256
 codec
Date: Fri, 17 Mar 2023 18:27:46 +0000
References: <20230316122741.577663-1-herve.codina@bootlin.com>
 <20230316122741.577663-7-herve.codina@bootlin.com>
In-Reply-To: <20230316122741.577663-7-herve.codina@bootlin.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OPJR5OIQ64XN7SHBPTNW2DHMTIQX4VQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167907768131.26.3274099281449860763@mailman-core.alsa-project.org>
From: Christophe Leroy via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE07FF80423; Fri, 17 Mar 2023 19:27:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F356BF80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 19:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F356BF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256
 header.s=selector1 header.b=R/hz7KzK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPC6TjSYxUZzW+4Ea4P77zuLwc0hTQAxJxyFI0DXlVgXpABE6p+O+l8IPHQgE2GbNJjiL/YRdAGo6iMqq8kMXgsK6avRxRmkrVenBjpPuoG7Q+IjKsBwLef2QYri9g78tgI8t8xwPTOR0LHjBJe9HCDd7uIpXiNCQXD1LG9SJMxSJsgALllmvT+wE2D619ugIlTQ78drGKwpOIiEwufkIBjm3j5jxK2Edt16rYPDxvx0NvPfshVUc6r9K7jfIoVoCzp6BKj9U8yKn03vXElt1IK+e7pFg34vlS0vgGjljPJcDlMLc7I76vQAcs3752wA7VdVmME99fA6E9pjClNe5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMViuVaQTmgg72Adv6Or7FehfTm6gpiGz/lF4+Hj8yQ=;
 b=Ufle4ZH0qQCG91VGYBWXdgyacb+ZZAfm+SZdcdZOMMXr/hm5AP6cl+jOoD9uV3NJKiBDe0D/dducgKtehO+XSnet6QSB6BPBZ0SydECGftnhELc6rzeUt6LUCJUeWMG43Ud5NudZLYzLdHjaaOJ1FbZmjsfeui2Aj4vPwk/8T0SrqE+fcsEThVPC/ypbaSKcah/sRfnVaY/NMfNB3kguO7eoemeCSGOghqAqR0z2HLrhIfbu9QximRE/AeH4XtE7SquK7x3xiW8tupRY5BLL0Y4CbkTcNzfqydj8t2qeUdpT2X4k9gKDVi0s7zpn6JrtDkxH1zAdv5j5nVRjHlpfaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMViuVaQTmgg72Adv6Or7FehfTm6gpiGz/lF4+Hj8yQ=;
 b=R/hz7KzKp+OiHzr30+mqOll/Ii04mpYJoTprTM9i28XJT2RmLVZLJ3x1g2LeLFPAd2wefl3EpVtQBTRUqJm4lB1EfxbRXI5EVvCPVc9bw60fOoe8NgYwOwSzetRIHhnpOtle0+LFLPFISMKr1dChN0m2Q44HaxQCS8bnpEfcz+eCwy+ECtZUC7iWmWtq1CRoWJz0NcBw1OMGzbW59Ks+j9GBV6SjVDKU0kOdA/W9dIqlOvqDvDUTuIWUeYprBy64rOvOcnDfrtH+Icgigel8mzKOtfVoGaQKpZPV4TIaBLl03SuxhnDYHA+uXGUX6FyVWKFkfJM6i8iYgpA4UZbSyQ==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PR1P264MB1741.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.35; Fri, 17 Mar 2023 18:27:47 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c102:f008:98e:6be9]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c102:f008:98e:6be9%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 18:27:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Derek Kiernan
	<derek.kiernan@xilinx.com>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 6/7] ASoC: codecs: Add support for the Lantiq PEF2256
 codec
Thread-Topic: [PATCH v2 6/7] ASoC: codecs: Add support for the Lantiq PEF2256
 codec
Thread-Index: AQHZWALDk9MOxDU0qEqbYg7qs98fMq7/TFKA
Date: Fri, 17 Mar 2023 18:27:46 +0000
Message-ID: <1a92533f-258c-20b0-541e-2d03ea367873@csgroup.eu>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
 <20230316122741.577663-7-herve.codina@bootlin.com>
In-Reply-To: <20230316122741.577663-7-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PR1P264MB1741:EE_
x-ms-office365-filtering-correlation-id: 59df1faa-b75e-448a-bd9b-08db27154ea9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DUqIrsOjXboGi3ncVD/t6e3rzWzeqymwAMIXIfhj2lGpK4UbjUSsRX8h3Dxhgrj2vVb+fSjEp/MXXPdFA5XfmIVBv7fmFYuo7E5sAkb7IKx0TxERuxKCgNU7HGIePXgwOmHmv/0RTUlVsFZZrKjowbfm4hU4levo7Juoo1jaWkQrvlqOA8Um7GFc7kqZmKzsHdIUKWoxhl+CmdZKR7rIMQrUEzbkjasjCh/QBGE7rPsL/sS+okB0ue/3d54yV6ZmZPogcatXnOcNiZIBO1tnUW2OAr208p5MbFVOaWnoJ3JZmD+QWkMlQ7FoQ2eo88xcoLYsHrzRW4M/+jb7SJe8jBBlAuvjlnILpr1KFMW8U29j7fysHQNgf/rgUbbpBJ29FdqAEIj5h0SPkHbtP3GpHm3nQg1/zdhD827Yc8OAVAGB+09Yv1h2uH9lOZ+6hIY7ZjtVpNUKhldmwZ6gW1OYNmTPsv7uBiKTYJO/Rpl2m75wt0G8GahgxMiDJDNduQW73dk9ghYG4aknKDMWrn3rYMlZ18lTKvRgK5WEFoFqGWS27dhVTqwLpu2a9TA7fjSRJ8DS42EYX9VWFZWnvFmvv3SHLVPREqZMDfbyNObSAWRngu6KMZYK2xuKSe8Pf7EPTfDEftntqUBo/4VvCKrpm3FbRPVOJNQvVgC5iN0pH3ulRL8874/RaLr96rnyeLIF3o7WNp3C1SdVg+ocB5mnr2Isqbq9lTw81shbcsD8REenVuJalJzs5t1+CbMkc6P5ktTAYiOmhF3NNNLIE3qNaA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39850400004)(376002)(136003)(366004)(346002)(451199018)(31686004)(8936002)(2906002)(4744005)(5660300002)(7416002)(44832011)(38100700002)(36756003)(122000001)(921005)(38070700005)(31696002)(86362001)(2616005)(186003)(26005)(6506007)(6512007)(54906003)(8676002)(316002)(41300700001)(4326008)(478600001)(6486002)(110136005)(91956017)(71200400001)(83380400001)(66556008)(66946007)(66446008)(66476007)(76116006)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VVQ4bU5zaWpyU1UzQVlGUEZES0FnSE9VOWdpV2VwdHFNZ0plWDNVdW5TQUpC?=
 =?utf-8?B?Zi9aNk9kSFBDTnZEVTRYZWp5ZzFXQkptWExuL1NVMWxzbjlJZUZUMnFHWG55?=
 =?utf-8?B?VFo1T3doQi9HQS9HVDdEYjJzVFVkdUtVcXdvWU1RdHFEWjZHLzNWSyt1eFR6?=
 =?utf-8?B?aDRXMzdaMFg2RTM0S2JmQ2JKVzd1aDdQckR2SlpjemJJc0hhSTNwZ3lnR2Zi?=
 =?utf-8?B?TXlXa1haVS9pVFJrNGZrdnMwd01pN3VGenA1Rm94dnRGdkFlKzBqcTlMZDVy?=
 =?utf-8?B?bFgrUmp0KzFuK3NXdXdDYXpiR0tGNndWY0Q0V2h4dWQ2VkJqaXNzVk56YjVI?=
 =?utf-8?B?cURrZXJlbmhiM2lOSDVtWmRiMVlwZFpYOFVqeTJYczhZRGd0V2Vtc0FsUHEr?=
 =?utf-8?B?a29SNmk0QzlDMjFBeHhaR1p5aHR0NGlpdjgwajd4NFZrNVBnL2xnVXhLZEhG?=
 =?utf-8?B?N3E0d1NxZjNvL0JJQXNkRzA2aC90Kyt1dEhSMkhjMllEWlNhcTdyUHA2dGFM?=
 =?utf-8?B?L2NCL3ViT1V6T2dnYVA0Qkh3NktMbmVGd3lvVXpyUVdZdUpiYmw0NWZKS0pD?=
 =?utf-8?B?cG9wN2IrRHFLQjVjWEFXYUplblBLNG56U2Jva25jdE01WWcxUnE4Vll2dnhF?=
 =?utf-8?B?Y0V3THN1RGg1eVVYVnJwOFQ4YWRGdHliSFJyY05XNFBqSnRwbXR4elZXSFh3?=
 =?utf-8?B?aEx2Q0tZYVpjVGxEbEdEQ2FwZ2c4emFPemdZbHNJSmNkb3lQVjd0WFJPbWxs?=
 =?utf-8?B?RVlTakFFaFZvRkhnTU1Fc1E4VElqUEcxNU03M3Fyd2Y2OVE2UGlHbDVmSmE0?=
 =?utf-8?B?NmwwUUljdEFaZHFVbEpmNjdPcXdzWnpUSFRNNm9zYjI5RjZtTUZvUC9KeHlq?=
 =?utf-8?B?aGo2b0hMY0FwNmpJVy9FVXBzb3NGV1R1eURJa3NuOVVncXpwM3oweEU2aVhW?=
 =?utf-8?B?NThFdmp0eUtkTDlGTXBqYVRvK2FqTmxWUzJJdUJMRkErbU9taVU5RUUzaG5j?=
 =?utf-8?B?Nm5RbUV4clZtU0s3Wm5FUisxczhyTGdwRitJOGdZOEI5STcrb3UwY1JDV0Nk?=
 =?utf-8?B?cXpjaUNubUFNNXQxVnViWjhFclZuTC93QWI0WGFPNW5oNEV6NUp1RTR2Um15?=
 =?utf-8?B?NnA1cTQ1YjYzV0hhcGdjK2dQQWNBZHRzcjh5cXdGZ1d4OTdJSUZVVWxnbyt3?=
 =?utf-8?B?QXgvYTVSZHhkRW45Y2EwbXJ2anVNaWJMK3oyTUlsSTNkT0x0ekFSNmhEaTJG?=
 =?utf-8?B?QmxRc0xKdkxpL0dwRU9rdGZUZVlZTXVJNlozQzB0MFloQUtZNUgxWWM5cDJQ?=
 =?utf-8?B?ZC9mbkZSbU5oa3V6aDI3YjBIaWh1d3VxaGQ2b09vNVpOcHRBT2ZjbnZkVVdw?=
 =?utf-8?B?Y3VqNHg5aUFoOXJ6aU9iZjM4dnVrRURlcUlaTnpEYXFFSkVMRGlOM2JYbnFt?=
 =?utf-8?B?L0p6Y2Q5Q0FMTW1SbWh1N0FRc0E3UTJoSitoZk5aR1N2WWJnRTJDUGJyRFFR?=
 =?utf-8?B?bzdxUUlvbm1oMkhoM0xPSWwwSTR1UGhKR2IvcWdSbUY5aVltSWNnaStCSDA2?=
 =?utf-8?B?K2JNR0VEMWxyR0d5dUxKME5MZzA5L1kyd2ZFdWNqT083RFUxRFNJSSt1N1ox?=
 =?utf-8?B?UzFMbWRQRU5WUklFdE1UUmxubDNHRXBqOVRQaVpXYnZVSVF4Ui9jSWZ6eVBv?=
 =?utf-8?B?QVd2MjV1U3hOZVB5bjlqOXFmYjZKWWlHeDd0djUvSkkxNE5JWlFEZ09kcWxi?=
 =?utf-8?B?Z0ZHN2h3T0dyNUYyc3k4Y28ycGdjSFFMMk5tcU0rOVRxS2NtMW1xMld3ZnlO?=
 =?utf-8?B?d0t2Q0hWS2JuUVcwSE04Z3Y1RDQxZ2VQcUU4SUQwcndod3lacnBrZjdNM1N3?=
 =?utf-8?B?dzdMVTRDOW9pWERmL3pMQzdOYlNveGFFbGRWRXdpQVlMV3dwY2hoMUZWam1r?=
 =?utf-8?B?SUFjQ01JL3dHTG5ES3paMWpIbHBjeENoNHpxcVcyMjdwWmhsT082ZlZ1VkZ0?=
 =?utf-8?B?Z3ZxL25zRXNoK2NSNFVJVXNYNnAzcEtDRUg2WnJlK0x3dUhiSGZHRXVIVmhU?=
 =?utf-8?B?S01wUGoweXp3Q0UzN0daOER4QkNIbGlYdmZHdkc1Z1FNSVA5QnVSOHVKS0Vw?=
 =?utf-8?B?SzkzOHZUdEJzbVExMXh2aG9pajBGQWswWnlxYzFLWHRINmdQOHBCd2RlSm5C?=
 =?utf-8?B?N2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7377D35C56F537458B6FE66DEA6241E4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 59df1faa-b75e-448a-bd9b-08db27154ea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 18:27:46.9963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 64EoShDb++LZDj3pYkqEn8MI01zIum2F/S2MKMkIi/Ov1z7qGmDBA4rFHBd1i+nyPAsTiz0qkki1vEu+MBVim3nWAgMLBTKuNvqwVk9FEuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1741
Message-ID-Hash: 4OPJR5OIQ64XN7SHBPTNW2DHMTIQX4VQ
X-Message-ID-Hash: 4OPJR5OIQ64XN7SHBPTNW2DHMTIQX4VQ
X-MailFrom: christophe.leroy@csgroup.eu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OPJR5OIQ64XN7SHBPTNW2DHMTIQX4VQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCkxlIDE2LzAzLzIwMjMgw6AgMTM6MjcsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aGUgTGFudGlxIFBFRjIyNTYsIGFsc28ga25vd24gYXMgSW5maW5lb24gUEVGMjI1NiBvciBGQUxD
MjU2LCBpcyBhDQoNCnMvRkFMQzI1Ni9GQUxDNTYNCg0KPiBmcmFtZXIgYW5kIGxpbmUgaW50ZXJm
YWNlIGNvbXBvbmVudCBkZXNpZ25lZCB0byBmdWxmaWxsIGFsbCByZXF1aXJlZA0KPiBpbnRlcmZh
Y2luZyBiZXR3ZWVuIGFuIGFuYWxvZyBFMS9UMS9KMSBsaW5lIGFuZCB0aGUgZGlnaXRhbCBQQ00g
c3lzdGVtDQo+IGhpZ2h3YXkvSC4xMDAgYnVzLg0KPiANCj4gVGhlIGNvZGVjIHN1cHBvcnQgYWxs
b3dzIHRvIHVzZSBzb21lIG9mIHRoZSBQQ00gc3lzdGVtIGhpZ2h3YXkNCj4gdGltZS1zbG90cyBh
cyBhdWRpbyBjaGFubmVscyB0byB0cmFuc3BvcnQgYXVkaW8gZGF0YSBvdmVyIHRoZSBFMS9UMS9K
MQ0KPiBsaW5lcy4gSXQgcHJvdmlkZXMgYWxzbyBsaW5lIGNhcnJpZXIgZGV0ZWN0aW9uIGV2ZW50
cyByZXBvcnRlZCB0aHJvdWdoDQo+IHRoZSBBTFNBIGphY2sgZGV0ZWN0aW9uIGZlYXR1cmUuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNv
bT4NCj4gLS0tDQo+ICAgc291bmQvc29jL2NvZGVjcy9LY29uZmlnICAgICAgICAgfCAgMTQgKysN
Cj4gICBzb3VuZC9zb2MvY29kZWNzL01ha2VmaWxlICAgICAgICB8ICAgMiArDQo+ICAgc291bmQv
c29jL2NvZGVjcy9wZWYyMjU2LWNvZGVjLmMgfCAzOTUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNDExIGluc2VydGlvbnMoKykNCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgc291bmQvc29jL2NvZGVjcy9wZWYyMjU2LWNvZGVjLmMNCj4gDQoNCk5v
IG90aGVyIGNvbW1lbnQuDQoNCkNocmlzdG9waGUNCg==
