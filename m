Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8E02137C6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 11:34:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDA5816D2;
	Fri,  3 Jul 2020 11:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDA5816D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593768898;
	bh=FYa07MjnfAJt+NkWlpoDT9KGeH2OwaihV7zBjBFdUZo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSzCyrS3O/3WQbWyXvKZCK2diL16hidsc34rx++ZhdMXKQLpEbpeWNQiBLs8XDWjG
	 2HNoXjqLnEO0wzD+D0UAIzhpQSNtG7bGAs6m5U/LwIlw1EacQ8hd7DQH0TtPMt1v7/
	 dwyUxjM0mO0RU/+PEqk1FBdYZ90rdG35M8reB4nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F712F800ED;
	Fri,  3 Jul 2020 11:33:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89932F80217; Fri,  3 Jul 2020 11:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::61a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3648BF800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 11:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3648BF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="LX8rAXw9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQB8lmj5TmOpxVPAcAE8EVLdEDuBqDG7uM5uolZIsCf+6fEhV0f3ZnWOGwlBc0JC7A8H1uq1ZBtM8hEhGlVzvxDHLRPybsl1WN+5KOyRE/Gj7oYuzIdgY3TXQAZvtMslajUB2EK5f40O/gCTmDPnXVddZwIdwi8IiFyGzhf2q+nDxO8bZzuxBwuJMmgp7E3bqTMuINYdEZ9e4CIrKpChudbolBP4Pslxoy0dVCFhg7s1//Lx+7P1ArrdNKXhke+Vslvtx+xZFqhlfsGc7pKKVbkbl4JmeIdQhtjo9E37sdHdRyJAjNsjbDeGoPpclEgt6HgfHOBW0Tp2qT7d7mRGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g2mmyzLQlUP83pMVvKeJyFpaXTOgi8ncEVyGIcGU7U=;
 b=PzEz8y+nLYiRUh0e4PR37QbJm/fBf25jLXzZARa/yZNeIcj4iyxf/GTjc9ZlB+wfPzjDJVnPMrWKP2LSx1yh9fflv5cVXyXYq6A0I1FIzJBO7xBCB2+nyyCNq/tUQj800uMu3Uy4Aq2AvASbhgf0ZD6N1VwXaDZA7pmxoG81PU5jy7xXHuT+co9Xgyre/eMpyzzqJEFa17G4rtv/FwVtjX9ty4bR9fb5hX1KfwM4wx2//IKfnjl+Tf6SeluWk0DjKP4k7iMFcGoPFZ7b8kfFcFB5KBcI9I1P5cmStylboOpySSvuxLSR6sf1RI/tMrJlZKl1A8h3z2BPQV3rH+cccQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g2mmyzLQlUP83pMVvKeJyFpaXTOgi8ncEVyGIcGU7U=;
 b=LX8rAXw9IGUqPghmIwhx5bq74Pey9+ed2vzfFSfkC2aEZfa67hd3THlu/38nlPrQLBTvu9LrIWmwhjUMsWF/dRB2ZPmYI+0JL2ay/TPzHbeYlgWQFpBTFyWbyhmjMs3ZfSXQKbWGlBng1JjCUUW2fGmM6bAR3WPhZn6tD07CK6M=
Received: from DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:65::9)
 by DB8PR10MB3768.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Fri, 3 Jul
 2020 09:33:07 +0000
Received: from DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::314b:f930:76b1:11c5]) by DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::314b:f930:76b1:11c5%10]) with mapi id 15.20.3131.029; Fri, 3 Jul 2020
 09:33:06 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 04/11] ASoC: codecs: da7219: fix 'defined but not used'
 warning
Thread-Topic: [PATCH 04/11] ASoC: codecs: da7219: fix 'defined but not used'
 warning
Thread-Index: AQHWT9TglCRPh6aF50mArntijWazBaj1l1Kw
Date: Fri, 3 Jul 2020 09:33:06 +0000
Message-ID: <DB6PR1001MB1096535996028B7DE0D136DC806A0@DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM>
References: <20200701182422.81496-1-pierre-louis.bossart@linux.intel.com>
 <20200701182422.81496-5-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200701182422.81496-5-pierre-louis.bossart@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 379ba017-6421-494b-ec74-08d81f341774
x-ms-traffictypediagnostic: DB8PR10MB3768:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR10MB3768C708CEF52F084651389FA76A0@DB8PR10MB3768.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:200;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wcyr+VA/mh7RjNH1rv+VoPU5FAOsLzV6gmXSZK5mW1DhByxvYAuruWbqvWALloIBWZdyI8LJLqmIC2vfl97L84yP8THDPjoSZaCas+EMaJF0k/I9Eg5wHS5a5eBx9MvYQ8xVYFS9vpu9aC2Hc6zzif8LXaFILSNfCgReIbimzcI5a8Y3QAondCg/F35ZBpFqHDwVleD+7riKrFnen7PFWwY8oZ7ZzApbd7e8zbxmubpPJEqT1AwKY8CF4B6flXe08noFjzDQVljdM8SRw9JRT+bc4ZTwRfkyhOwsmOmrMU51qohTuBA2sGlurCwZPM+c1PH24YdNI/OEnRIuVHPtOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(86362001)(83380400001)(316002)(4326008)(55016002)(478600001)(9686003)(110136005)(33656002)(71200400001)(54906003)(26005)(8936002)(66476007)(7696005)(66946007)(66446008)(64756008)(66556008)(186003)(5660300002)(76116006)(2906002)(8676002)(52536014)(6506007)(53546011)(55236004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: VMmVviWtJ3R6R4fKWadIRAv/6x+1GzyhD6+6MatwpLhGPut3XpvWr8se80dUfYJiyMxfYAOER9AvVKBDZPFXfXGQk/n9qPtwysXIsNJyjy28zF9CulIYbli5woaN02/X2aY2uWVmm91ejChxc8E6qlQwe4T1mN0UBRPoTzieLIgKNBxlkyGZtcW8tBlr38IbZrmHxFNXKEkiCpjSG3eU0USosbb/qHI4hib5s/ro8BNpLcskKcRxon+qMLMi5BW+4V8ypJhTuDpTvnLEquyESlZ1PvJbOlzT9PUXiufLUnzbw/TPMDn1ZBqPQo3RxmreOitpwv5YMxyWzi08gFzs8idrmvY1fBs1gOd+x4/yUUo1kTCn/I6n6RI6yPHEwbVyZLtphGhF+COlYTcQKPlmxeVKd5OTwXlGxPO5DnUHZOjJDwvHTQNvfmFUOolZTG+T4HjjLy1hA4EY1ZZ8snz79jh/wdHqzOxXLNcsS7kG61A=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 379ba017-6421-494b-ec74-08d81f341774
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 09:33:06.3385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qoYziLgV34Y2c7edlV0PbsveeSRUVB5bER2lMVYxyI0X1lunKX+MTnguBLfk05WP2W6f3qskd1xM1rNJSihWt6gHx4ujZlFoJIHbq+kWqv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3768
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "tiwai@suse.de" <tiwai@suse.de>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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

On 01 July 2020 19:24, Pierre-Louis Bossart wrote:

> fix W=3D1 warning
>=20
> sound/soc/codecs/da7219.c:1711:36: warning: 'da7219_acpi_match'
> defined but not used [-Wunused-const-variable=3D]
>  1711 | static const struct acpi_device_id da7219_acpi_match[] =3D {
>       |                                    ^~~~~~~~~~~~~~~~~
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>
> ---
>  sound/soc/codecs/da7219.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index f2520a6c7875..153ea30b5a8f 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -1708,11 +1708,13 @@ static const struct of_device_id da7219_of_match[=
] =3D
> {
>  };
>  MODULE_DEVICE_TABLE(of, da7219_of_match);
>=20
> +#ifdef CONFIG_ACPI
>  static const struct acpi_device_id da7219_acpi_match[] =3D {
>  	{ .id =3D "DLGS7219", },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, da7219_acpi_match);
> +#endif

I think this will break non-ACPI builds as this symbol is used in the
declaration of 'da7219_i2c_driver', without conditional compilation surroun=
ding
it. Unless of course I'm missing something. Could we instead use
'__maybe_unused' to avoid this warning?

>=20
>  static enum da7219_micbias_voltage
>  	da7219_fw_micbias_lvl(struct device *dev, u32 val)
> --
> 2.25.1

