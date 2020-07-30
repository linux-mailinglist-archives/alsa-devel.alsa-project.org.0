Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA48233619
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 17:55:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F08BC17B8;
	Thu, 30 Jul 2020 17:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F08BC17B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596124553;
	bh=uHFFwyUpR4YMs8BUl+nb5rbJ8uhPO3m3qbswQMCqwqs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RwmY2Rd/JC2hjXP++zlxkjAlSuhIGBM1h71Aq06npgeGsfx4NWcJviDkOCXKIk16o
	 RhGNQt7K7dXPvgsI0bVSOLRCe0b1SG0UPWNKec58ccsXQy54ncADdVJ1UvdGGcgKdb
	 tmfUsx4mUsoKTRmNeTd2wc1AvHj9iaoT1oQnz5PI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BBCFF80227;
	Thu, 30 Jul 2020 17:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6893F8021E; Thu, 30 Jul 2020 17:54:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFF72F80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 17:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFF72F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="zs8XCfp2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7ZilwE/vueU8UbmquTgbTTGGupgAnzxJBTGtukrLXtfyQPncA6R3siUHIN5QDauagdQ1p4uKsPeCdYaGPJSp6o0+UNzAIvcnMowOD53W4KPRtaVO+xLVG2MYSRKSvbwx/BnZF9rb3PGxjAHAHeXGj17ovfZY6G3lZmSdc1O3sINDnu5i2sd+NKBlAGqAsjp2bkhHxVeYD5fUc8KJ6FE2vQ8KUZMkfDzRjX0tAMrwlYND4hgXcCuaJ7fD//dtufsPbRjZQOXsJLSLnRH+Oh/TsxbuxwUGJVzfroeGI6OXvj7TT8gfDdnOS7+BpFaLoRlMl9n4VlbwoJ34uQA3RcDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ky9juz0t+7C66hKbVCcfhZ1CHiKo1u6JdHWdtsLBrcY=;
 b=LkAXMuih+fJ5oTJCZN6oBsrvSQd4ZCPTWHIY2GE2xNl21pAi95eW7T8GzUr4h/PSKjpxlNf6GGvzXhyHZBWx7YR4xFDJeJbrsdu17h94z8th7vekBccymdjd1yRow1Me7r1yOKW37Xyx9XWGNLDwkGAV2XFrNYsLkBbvVaRnlIkG/3MFhVnYx+8nEU+9Qk70TQerJb78CboAcBCIJmXLHr9DN+cRv8OpYlG1vHOyBUBP3tznEnwWFK1Xr6YqzCbXfCYxXE4VhCVQZJmMWreliE8/AzxdGsKWQ/Lhiw51OneW4u6bYTEJ338LYQjfgthT2XMHwbFHBm71T+AQw/w85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ky9juz0t+7C66hKbVCcfhZ1CHiKo1u6JdHWdtsLBrcY=;
 b=zs8XCfp2CSxeCPiDCxB6EnzD4l93mN3uHKMz7h8rVuUO8vcm48dEIDEmZuHCrZEpGXB/sdsAJeavxogiE9sYaVYokjkFyW5N+IbDSM8UL4+1Omcf68eOr2IdH4mSYS2pkPql/2l4/BeqxI3xNWuSb6ttAha6nWL+G3uv9a3EmRo=
Received: from AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:135::13)
 by AM7PR10MB3238.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Thu, 30 Jul
 2020 15:53:56 +0000
Received: from AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7114:8e7f:c0d1:3aad]) by AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7114:8e7f:c0d1:3aad%5]) with mapi id 15.20.3239.019; Thu, 30 Jul 2020
 15:53:56 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Yong Zhi <yong.zhi@intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Thread-Topic: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Thread-Index: AQHWZnpiUvyyyDmjcEOw5pxm+8Nvm6kgQlAw
Date: Thu, 30 Jul 2020 15:53:56 +0000
Message-ID: <AM7PR10MB3640075298BCB15AFB22A9D480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
References: <1596117868-3317-1-git-send-email-yong.zhi@intel.com>
In-Reply-To: <1596117868-3317-1-git-send-email-yong.zhi@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b55935d8-acb0-41c9-380a-08d834a0c454
x-ms-traffictypediagnostic: AM7PR10MB3238:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR10MB3238EE8C7A4CB4644E9D376FA7710@AM7PR10MB3238.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8vXytkCLpHo2KU1cC2AGuDlGqczzIKByGj3t3MGel38UC1VjURA268zw5RciG3n3dG1cDI7kW/hT2MWDEdkAAaOlg+ro/rEf50ecgumH7k6wbygM8Mpcoyc370zDP1LcpYbOhqHg/w8de4TUJV2Xg3m2J+9VKbtuqovs+8q+8tbbRlXk/8Q5jBB+MmrbgLj7Mr8dqXgCJhUBHxEO1/OacSeLKNvzeq+Hu8ZWjgdNwvqQou9ULhdkYBUIspSIVfrWYH6M8k2JxX5sttJfsHbTXXzz8RT2m3Y23D2VjOAsF86u9XDJK9Qp9DguwWd+i/moeSd52PZQ9wNPAkbOJcLPAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(2906002)(52536014)(7696005)(33656002)(64756008)(66556008)(83380400001)(66446008)(186003)(26005)(4326008)(66476007)(5660300002)(55236004)(6506007)(76116006)(66946007)(478600001)(53546011)(110136005)(8936002)(316002)(54906003)(86362001)(8676002)(9686003)(71200400001)(55016002)(107886003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 7907Sgga7CMkigCJieGAGZxYl3VWft0EzFEF5hKrxi//Wlj5YM5J2h8k7n8bGHFpGuMjtV2HYjNtWCseCAlikKv/ItaYHBmS7PsNL+LMpHI8grhC/8x99PYvJx2y5/o9OZpyLsQprSSJhHqxFpVjlM2U4hfK4+vIiCTR6cyuJUkf+7U2PgBrUANIPjjqggW2LzgvoJezF2F3dA0nJjpdhnCUDCGisWTLxQEmSMuP1J42QWLX0GukDHEleF7PwuBEM6u7pJNpX+z8PYSIgZv2cD7r9QPFel1peAYsOl491jKjHITJ8Kv8DsdLvjAjh1Q5efwXj4VQdWV9FfN6CPtxlJz87uBiU2LPpMf4FGl0amubCSK1uhMpvYhi+c6MhUrFoEmDBvpW4/jlVsGa64e/6jbjOuBFKqvZovHXOcEpGvMoBptb6cUTfj3ee+WRUK1L1igoGlfXTqErSax1ldNfs7Q2f3gK1/zsEtuxDj2Pw3gIzBe/0WSGM94ajhihWZKUwnCu9UbFOgOteBaG9b9hu+FxjrRvyqIo0uBv9b7wRSeWeseMpiEL+Y64BvjpNfRlAfWZuuIg7UgRyirKHyyX7ZOQqowObLnZ5h9zgcKxbXtfTrCvfJVBkaQmdSl6lzTrO5nra19Y3/UxUK34gsoMFQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b55935d8-acb0-41c9-380a-08d834a0c454
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 15:53:56.5274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9+Dk9dQ6uePF6F2NEfg1JI8Rc4u4Us+bueXoz8Tko7xQENjJ9DgjUCHjIHh0Y528yhOm+IwpJv2PZuHdJWvZiEf9KpjOR6wfYhDa3gwlOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3238
Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>
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

On 30 July 2020 15:04, Yong Zhi wrote:

> clkdev_drop(cl) does not null the removed cl, if da7219_register_dai_clks=
()
> entered again after card removal, devm_clk_register() will return -EEXIST=
,
> the goto err to clkdev_drop() will trigger board reboot.
>=20
> Test commands:
>    modprobe -r snd_sof_pci
>    modprobe snd_sof_pci
>=20
> The oops looks like:
>=20
> da7219 i2c-DLGS7219:00: Using default DAI clk names: da7219-dai-wclk, da7=
219-
> dai-bclk
> da7219 i2c-DLGS7219:00: Failed to register da7219-dai-wclk: -17
> general protection fault: 0000 [#1] PREEMPT SMP NOPTI
> RIP: 0010:clkdev_drop+0x20/0x52
> Call Trace:
>  da7219_probe+0x52e/0x6dc [snd_soc_da7219]
>  soc_probe_component+0x206/0x3a1
>  snd_soc_bind_card+0x4ee/0x9a6
>  devm_snd_soc_register_card+0x48/0x7b
>  audio_probe+0x1f0/0x221 [snd_soc_sof_da7219_max98373]
>  platform_drv_probe+0x89/0xa2
>  really_probe+0x129/0x30d
>  driver_probe_device+0x59/0xec
>  ? driver_sysfs_remove+0x55/0x55
>  bus_for_each_drv+0xa1/0xdc
>  __device_attach+0xc2/0x146
>  bus_probe_device+0x32/0x97
>  device_add+0x311/0x3b4
>  platform_device_add+0x184/0x1eb
>=20
> Fix by marking (nullifying) the da7219->dai_clks_lookup[i]
> after clkdev_drop().
>=20
> Signed-off-by: Yong Zhi <yong.zhi@intel.com>
> ---
>  sound/soc/codecs/da7219.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index 153ea30b5a8f..54da7cfbb5f4 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -2369,8 +2369,10 @@ static void da7219_remove(struct
> snd_soc_component *component)
>=20
>  #ifdef CONFIG_COMMON_CLK
>  	for (i =3D DA7219_DAI_NUM_CLKS - 1; i >=3D 0; --i) {
> -		if (da7219->dai_clks_lookup[i])
> +		if (da7219->dai_clks_lookup[i]) {
>  			clkdev_drop(da7219->dai_clks_lookup[i]);
> +			da7219->dai_clks_lookup[i] =3D NULL;
> +		}

It seems to me that devm_* functions should have freed up everything when t=
he
codec module was removed. I can only assume the codec isn't being removed i=
n
your test hence devm is never freeing the clock resource and is why you're
getting -EEXIST. Is this the case and is your use-case expected behaviour? =
It's
not something that has been reported previously so am keen to understand ex=
actly
what's happening here.

>  	}
>  #endif
>=20
> --
> 2.7.4

