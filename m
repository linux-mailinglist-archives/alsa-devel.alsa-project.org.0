Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E92D65FE6D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:56:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E56A142E8;
	Fri,  6 Jan 2023 10:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E56A142E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672999013;
	bh=jjAyHLqrhAilWm9hE9v5J7Ftq2/ieM1OzpigQCYEOzc=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=paiIcqqu2bR62dNuQCYTTHHCvFunUeq2k4I1CS2rH821TWHJfTQWw63E7LPsYv8SL
	 h996Cl2lmWbDct9zLBHXU8A1YUALfa4r56GlwJt3q2VgbxZ6OBpnuhMMDtwojG4epK
	 1OsNWk7IdVgBA+IJl6qxkbYhBKEUAn7Ld6xYp86M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 418C1F80238;
	Fri,  6 Jan 2023 10:55:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF71FF800C0; Fri,  6 Jan 2023 10:55:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2088.outbound.protection.outlook.com [40.107.128.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B3E2F800C0
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:55:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B3E2F800C0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZeY9FhPPcxgYpLWkfA1Japxfwn79vf0ek7NWvt6p0ay78MvZYCZVNBg0hylQJcgJra0uWYryxgOlvHYtgGLBPCWpzhUPbos0DSpJlI81YP5LTLKyp28IANnBx0CKxA1Jo1YB/feCR0+QF0iWtM9mdPpJCDfeqGRi1W0Le844A0lKRO9RQwKosrhn1SjXb9SUNNfh3M8CUBTxud+el8qMgrZzASJS+wKgLilLAeAl+vUXdA+wD0iadNmtjOaulRPA2DNHSIpoSM5+Du+Q8BLz4PzWd8leYrPUyFHR7hFrGdE9PpEMhHHtni/b7gQ/ATvR1XVE6zQDgUVI4dhxtEdkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzp0UfAn6bQ6BxpaNeiPa+jPX7+7dmu3EmDN7hPSEw4=;
 b=iEkw8/hbzGxiQGYaT+eghq0ElK9eSsPGnfTxRlXygyB6qUpdFigsUXgqN2Q1faHH9xVYLJgGWlmA6HxXO2h1oyZY6mNHD8rQV/BkDPuxOIWR2B5Cmq/cDfVmQ8g/1hXM2PnzM9M5Ct3BBlneygzRdJ63sitKqyWUlRriftpmOvKQ9pwKF/x57EEff++Vi33n41gTAmw4Cccdxwd98gldz9kYHzSkX3B9HNG9RmRCOpPKX7H+BPXlwhovhONWD/xDfvVR8Gle5gmrGurnbadDz53ow5EA7daCahxZtVMvs6Q+3KUUbRvus2qAsDxoEcKoXgVYnUshHSiY/nftVMwVTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB0586.KORP216.PROD.OUTLOOK.COM (2603:1096:100:1b::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:55:43 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:55:43 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Dan Carpenter <error27@gmail.com>
Subject: RE: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Thread-Topic: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Thread-Index: AQHZIa9/JWAeJIF1MUqWJln1Q6zi8a6RHuqAgAAAWKA=
Date: Fri, 6 Jan 2023 09:55:43 +0000
Message-ID: <SLXP216MB0077B3BA3C18AD8F5A10F9708CFB9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-15-kiseok.jo@irondevice.com> <Y7fplQ18qyhKDC44@kadam>
In-Reply-To: <Y7fplQ18qyhKDC44@kadam>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|SL2P216MB0586:EE_
x-ms-office365-filtering-correlation-id: 0d60d7a2-9f66-49cf-516c-08daefcc2d2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8qD2s18p2nxwJBQyXUOnEXIjBPzqJ2Q/XObFz6/Z7jRNKdcBLjQI6IGL5uoDr91k0nQPoOESeMhdv6RB9XWuDLrXtqaYqPBJ8/Yp0ywpuxUeQbevO0XXoGc8D9XiAWRaXBkKXulS/VHitBQsr9J2FOTfDMJplqF0t0rmGmwAZClLjl8QcgVJP9wPIFM3j4vah5ZpPoOpByAm1GFrVK1KB+h/oDr1D0mN0vxqtLcMgitTx0MEbeCbv8aN/PNKVCmXTra2zixHviqBBtqk76Q2dFgjY/Cn1Gw3YuQsYnQRk8D1zImv612f2wKUTwZ8bDI8Fj+UNUhgDJgO7ky9I0H5h4SMYTh5fF0sAUyHBFheDJEHMscMPy2sVzbA7HnUSOPQgSpdUNr6+m9AGTZtJUHXmrhTGdyvAIULQsvzHnzG8vUdzENm5zeqykIRkBnZKr29s4adBi6eusUFsmZJ9ZZmOkNoqYJbBewbxv5i2JPT8cBTGzXi/U17ZKBW/w4TDWorQ3ady2Ni3E9Kq6iwXi1hzthacjWFroIZ9bM+BRtiDB2cANDw8uY3IdgE8+IDUzO1Pt8qV3HEnywHfCrez9D5FPy+fevT3JoWfQXAsznsZs1Dx13gnYGOZnaHLOcE8qE8ejYl3Yivat8dJDhM6eBytJ3wMs/zGTvLga+ITFnqs4PKABPtaVl/0XHkq4DYXAnz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39840400004)(376002)(366004)(346002)(396003)(136003)(451199015)(64756008)(66946007)(6506007)(4326008)(66476007)(76116006)(66446008)(38070700005)(41300700001)(66556008)(8676002)(316002)(86362001)(6916009)(54906003)(26005)(2906002)(186003)(83380400001)(7696005)(478600001)(9686003)(52536014)(38100700002)(33656002)(8936002)(5660300002)(122000001)(71200400001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LtChV1/kQ6DvJhFJ6m++ENZIJUctKBpuMWuwiUswUVcjSqAUnQUek8fEh39W?=
 =?us-ascii?Q?Islnzcr7i5Fm/dDceHmc5DSYuRGSFUrYGhONG+wxJ22accn35XvDrczcHIPB?=
 =?us-ascii?Q?lk0NIyiJKH23Rn6mjDkNCo34z74imTqDZGDEAkAiDNLJsBmenGY9Me9UHECB?=
 =?us-ascii?Q?xO7xwNCnYyhDrhxp8FQq+mxmPznHDLPgLfIGf50Ye18LLN4xuMmLKSihIZeu?=
 =?us-ascii?Q?tR8b3IVLmbxskPhmFj3ijhUYrLOXq+Y0EcVva3s2DK41EChkCw06TMCxVnEK?=
 =?us-ascii?Q?ZVrUdkjyYZHS8v1xH49VKUscUgNHs5+Ao855iJiCzSrbbXX8+TnH04u6D+aL?=
 =?us-ascii?Q?0NRrjD2VIdTfNvPFIcqQGKCKsFChAH4dDJ/c+bGbRl2awY7d5unUtNWeNkyR?=
 =?us-ascii?Q?z3M3qS4muAlgk38SfkZykIKWxTFLyNmHqYrHfUQX0O94nG2KWWs72VIuXyG8?=
 =?us-ascii?Q?GVNRjyCxdQ031tBHgy3bn9Yl0ljeD2oupuR21VIvDYP931YHIsdPIMB8Y+6L?=
 =?us-ascii?Q?QhRzIcemAw6EV3Vmp362SUUAmBB/wNT9XIS2xJcwF1IPJZT1n2/zUolL/2RS?=
 =?us-ascii?Q?VUNqR9sErgJV2zrncv/8LUGIzyv64fX12PQtxkF/XdVw4e6tQy0mbb8Hfv7a?=
 =?us-ascii?Q?OfDk5j0taNICt03Ds+GUmdWbjC+1qkSLl6kiV/nBLDQ6ZtTBsMe7TZWZ9Fqg?=
 =?us-ascii?Q?IZzGEIs28IuGFwN2NfRoR+q7GeD3vZdBbAc/GLt+0tm9CCduxu9Fsf4/jXUC?=
 =?us-ascii?Q?9WKh6T7QDU8A0xsMkAerboEnNy0fd6ypagjhafpGqb7+KdnCOMu6sJj0BSXk?=
 =?us-ascii?Q?5nlVNPAUJNUygDjfgP5GW1DSKN0G95HoU84sKY2BduKjJ0uzXKQUz959qk1t?=
 =?us-ascii?Q?9biEPFy7BcLaMzcWEvJb16qw6Ij+cXrl8lFa5+v9vKx8NEDlB7bbs3AVeiim?=
 =?us-ascii?Q?5Z2ykgTIdZ+LvVL83G5fOvEsgqm8TTcp2z/InPOFm16CD2ZHe15dpVCHC/mb?=
 =?us-ascii?Q?Do9wMw6Ub0GuRXKIc1MZBe3KBW7pJI83fp1B0cxy9015wMG4Ycx8ugoxQ6D2?=
 =?us-ascii?Q?qaVNfPDljbB9uNInZGCwZCAaiUx11XTr21pynvBcS1ICmNAaAhCSjfe29YmU?=
 =?us-ascii?Q?R+LP0Q9cgx7iouP69LFMYa5vb8w9UKNyvHKzQXD38i/x6eAMe8Z6uNQxWDzR?=
 =?us-ascii?Q?EvgHL52sKQp6Yb4lTu9ceOvAp0X1Z4e5J7hujqNE2JfDi6l5U3Y+KFroq1Zk?=
 =?us-ascii?Q?8PxlTPdohrnElv4f2kI9p61lmYFedtPAGdcW4Nz1EYkRYSGDAm6ZS8qQJwEh?=
 =?us-ascii?Q?TtoVWZTGjvZAXrUp8ZMlqUQTvYPeGvlDBzcbleQ2KEsUJl7w2uY9B08SdXoH?=
 =?us-ascii?Q?2LkvKUEGflhrhHgHLGwmD9rxp0gTfiYTh9KS1O8Z94+uHJA4ltIpHrZ2kdhU?=
 =?us-ascii?Q?YlDbeKDgVRABDLd/e2wQtkBsqztQok9UYYwVrBW13U+nOcEl5xpuXnYTSyLa?=
 =?us-ascii?Q?JWS9Z2+Hv2VD3NSEjgO0FU0kpp7BskKRWgxA3/V3nA0vSiJ75Z4rl868gAVZ?=
 =?us-ascii?Q?BmNF8LFwxOacfO7Mcr74PQrMyC4tdCmc8fiziyY/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d60d7a2-9f66-49cf-516c-08daefcc2d2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 09:55:43.6370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sZ7HZGd/FXBGdorMl1a6K1ciHEY2ZhkNCbft1XhKkvq6U4mi1Hh6v6YtF4LaM4sdTJQ77vlZZdxkj4PEgCdBaKrUUk2Sa5RQjL1Kc60dGkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB0586
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Application <application@irondevice.com>,
 kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Dan,

I'm sorry. There was an opinion that the pach sent last time was inconvenie=
nt to look at because the entire patch aws modified at once.

I just misunderstood the patch system, so I re-edited it and sent it again.
I'll continue to use this patch later.
Thanks for your kindness. I'll get your description below.


-----Original Message-----
> Subject: Re: [PATCH 14/14] Fixed the retry_cnt bug about being zero

> There are a number of issues with this patch...  :(

> The bug reports were from kbuild so you'll probably need to just resend t=
he patch series from before as a v2 or something.  It can't be [PATCH 14/14=
].  Where are the others in the series?

> If you do fix these issues as a separate patch:
> 1) It needs a subsystem prefix like "[PATCH] ASoC: sma1303: " or somethin=
g.
> 2) It fixes 3 different issues so it should be 3 different patches.
> 3) It needs a commit description.
> 4) It needs a Fixes tag.

>> @@ -772,12 +772,13 @@ static int sma1303_add_component_controls(struct s=
nd_soc_component *component)
>>  	sma1303_controls =3D devm_kzalloc(sma1303->dev,
>>  			sizeof(sma1303_snd_controls), GFP_KERNEL);
>>  	name =3D devm_kzalloc(sma1303->dev,
>> -			ARRAY_SIZE(sma1303_snd_controls), GFP_KERNEL);
>> +			ARRAY_SIZE(sma1303_snd_controls)*sizeof(char *),
>> +			GFP_KERNEL);

>I am surprised checkpatch doesn't complain that spaces are required around=
 the * operator.  Please just use sizeof(sma1303_snd_controls).
Otherwise you have to use devm_kcalloc() to avoid checkers warning about in=
teger overflows.

I lost space between * operator. Thanks. (why didn't checkpatch check it? :=
(  )

But I don't understand why I use 'sizeof(sma1303_snd_controls)'.
I only need to know the number of 'sma1303_snd_controls'.
In 'sma1303_snd_controls', it has only 3.

So ARRAY_SIZE(sma1303_snd_controls) is 3, but sizeof(sma1303_snd_controls) =
has the value of 144.
I think it's not necessary. What's the best?

>> =20
>>  	for (index =3D 0; index < ARRAY_SIZE(sma1303_snd_controls); index++) {
>>  		sma1303_controls[index] =3D sma1303_snd_controls[index];
>>  		name[index] =3D devm_kzalloc(sma1303->dev,
>> -				MAX_CONTROL_NAME, GFP_KERNEL);
>> +				MAX_CONTROL_NAME*sizeof(char), GFP_KERNEL);

>sizeof(char) is not required.  It's always zero.

>>  		size =3D strlen(sma1303_snd_controls[index].name)
>>  			+ strlen(sma1303->dev->driver->name);
>>  		if (!name[index] || size > MAX_CONTROL_NAME) {

regards,
dan carpenter

