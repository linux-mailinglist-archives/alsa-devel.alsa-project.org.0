Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D1A213795
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 11:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 619E216CC;
	Fri,  3 Jul 2020 11:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 619E216CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593768254;
	bh=V+Qy6ScUO/fi0s6TFcWDSDZ/tFfaxzDRUH+QCmwOfM8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bf9E0OeIbQtRjRTGaeVNVqCZTyRHA5bPANNJLmAHofYFxXu5GkXXQ34VcHwehN52D
	 4W2nOPUUadZ0hWveIqHa/aheraZ8Bz1OLFdRQp4SnDdw31Mnix10/4IBZ5HXD5LGmC
	 t6TUR5WO/NwDCJbUp09whXXxZHMb0U3az9KiIvPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BCBEF80229;
	Fri,  3 Jul 2020 11:22:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D48F9F80217; Fri,  3 Jul 2020 11:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00073.outbound.protection.outlook.com [40.107.0.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2D38F800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 11:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2D38F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="akIUxIZF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxir/xSiufsg6osO3659lrk0ziSUm4T0Gdb/ynKOZP+EibeSx92NHbmzbjPKcaqCWqa2Q7hkof24XlcdDNt/NV0do48Dy9IoQ5v+dzia0AkXA5BV14iYGGme1OGViKJ3Ug320JDgs0/886i48uIRkYIP1CzdXy6RJV7dCFWZfC1d5Qguy+L6EAZKR5xMNjXddbwzRLDZUxASTQ9hGQcqhvZGd7thRb7a6vWkcDP+idsuksbjHCwpjIYgh5uqmmfvUlb7o/CeiaFC+ZZeRoBFFz3+33hjkhw4gQeQ0l7lVD9sWSLcZZUrqeSswcWpwxxyR+RfG+oqw+V9RxkQ3WUFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RjNfZrm5zjI/VW69yZlNkibhiDTE4imcuaXtjxWLtI=;
 b=kOO6QuKR/xTvqE4snBO9E+sUNhZwDTsYbVWLS2BF1V1CpLtaWBrimNtEtJJ1uz9j3Jhx4f/n9cnOwxidDouktO027fwy+4SOaNGlCtmk8E4P6W82qM7YBQ4IEH8yOL2BJ1ruVFxbKn27K8V7DL1+JiayrWKZ8STgrw/HZMKQXTT/ju8rI+K6tv9t5MjReeI1FED0AnLMybUXhImGuBmER/aBTd8LBShaOKTO/GptE1QG8UxtggD/6uw4cptU4hc8v8U1MBHRNHqYvYXp9jPWOcg1uFNu1InFcFABBQaI+Oiu4CK8psN2Zfmy1jzcxQ4IZrLMpXQIJ0qZyWweT4VnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RjNfZrm5zjI/VW69yZlNkibhiDTE4imcuaXtjxWLtI=;
 b=akIUxIZFRCMJPLKU91XeCgZiVnK9hxv5zY8hShn6CeJWaMm+DXC8h+ji+anhVBWl9zElEg8X9obs2ovy7icRJgTgIz8Lhw+CorxTff5Pt/h2VEmgNK3M7DAwnyZlaOAKw5MZ76ZiKmrK5o3qrUHaOiy+BQZfArDNTdZhsNZeKTA=
Received: from DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:65::9)
 by DB8PR10MB3708.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:137::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Fri, 3 Jul
 2020 09:22:22 +0000
Received: from DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::314b:f930:76b1:11c5]) by DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::314b:f930:76b1:11c5%10]) with mapi id 15.20.3131.029; Fri, 3 Jul 2020
 09:22:22 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 03/11] ASoC: codecs: da7210: fix kernel-doc
Thread-Topic: [PATCH 03/11] ASoC: codecs: da7210: fix kernel-doc
Thread-Index: AQHWT9TghVap+DlSo062Q9W9x4Qzkaj1lM3g
Date: Fri, 3 Jul 2020 09:22:22 +0000
Message-ID: <DB6PR1001MB1096A684421804D2C2927E82806A0@DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM>
References: <20200701182422.81496-1-pierre-louis.bossart@linux.intel.com>
 <20200701182422.81496-4-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200701182422.81496-4-pierre-louis.bossart@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: 4185500e-f805-498d-39c7-08d81f3297b5
x-ms-traffictypediagnostic: DB8PR10MB3708:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR10MB3708DA541F6FC8EF81236B64A76A0@DB8PR10MB3708.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v+7RMbUeJ27r6Tw74e34Tgsb5e8KIZWSAVzLxUsU1M/x+IDSnGHASnWLxy5H9bi0b3yrEwxw8ljsnJDUPs3X2IBAvgvDRIafDlfi2AeqrvhHb0Z/9nk8kLD70D4/WxxKGHPt4qOPTVEpRdyJ1u7IneLAOCamngTvEr7YcmY4YaDi1ct9qdKNATT+0l5JhtuR3X1ZXKvoKwlnMgA6hx2gv3Mt5EZTjNyYXIXbFC77hfdkblS0PaZpB67sX50slsT9CzRYBuzJFcBHCTZysTSekx56t9cBCko20F07daSMxy4z5usuMFjRcB8AMpLkJ70woxSfuO5MCD7yLgpRQ6bmAg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(76116006)(9686003)(55016002)(66946007)(66476007)(64756008)(66556008)(66446008)(7696005)(5660300002)(86362001)(4326008)(71200400001)(8936002)(52536014)(8676002)(186003)(26005)(83380400001)(55236004)(33656002)(2906002)(53546011)(478600001)(316002)(110136005)(6506007)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: vfxorgX75V/P/yynzfKpMCcZ+iUCxIMNs2aqhJbH2TRkicZT2FkzLcU1EfcHWgW6vV84EUzTt/O7KlOg4/u5ox1gvVRLphNUyK63WZ6tHOQuBZkJ57avIhb5FldF3gFMHzvwXWokBvGvpvuAV1HVbtjviKOdpEHNpw6vn5Y40sziuTfKw13AwxjCRQj1p/G688QvmfEVZ3LW/CThd5yCgnImRijNHBfkeadlhtHaJgvLLn1DzcqGwO4pqfzeJ43/G4auv4n8QX9Xjvmwo/TjROXActqhpCOtZK93RLmmAw3IVa/pJ3xZM2UNMMhOlDZ2zlLshKlocgp2QLlxSrG5fEc0EAQENI0SY/GXQK0qpRml1K8OexGxGw+DnmVcxzZAQm1G33al9TSBeaj7isNDajLWHji842o4SlzYKX9cjM5UWWZCRPC+CdWwXWd75aTEM6UEqEYR7t3xHnjfPwvIj8RCy1aigz9CU70k+VbZHR8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4185500e-f805-498d-39c7-08d81f3297b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 09:22:22.5887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xS46iFpq2h7NOI4/kP6UqYendlG99v4bkokl81wWRNthlOk4B8uh2WQNR/ZWH//SwC7o3Y/uFx1/IENme7VC5yvtJSME96zDrIfg2Wpn+Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3708
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

> Fix W=3D1 warning, the kernel-doc syntax was probably from Doxygen?
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>

So is the issue that the Kernel warning mechanism doesn't like Doxygen synt=
ax?
If so then:

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  sound/soc/codecs/da7210.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
> index 0c99dcf242e4..2bb727dd3a20 100644
> --- a/sound/soc/codecs/da7210.c
> +++ b/sound/soc/codecs/da7210.c
> @@ -971,14 +971,16 @@ static int da7210_set_dai_sysclk(struct snd_soc_dai
> *codec_dai,
>=20
>  /**
>   * da7210_set_dai_pll	:Configure the codec PLL
> - * @param codec_dai	: pointer to codec DAI
> - * @param pll_id	: da7210 has only one pll, so pll_id is always zero
> - * @param fref		: MCLK frequency, should be < 20MHz
> - * @param fout		: FsDM value, Refer page 44 & 45 of datasheet
> - * @return int		: Zero for success, negative error code for error
> + * @codec_dai: pointer to codec DAI
> + * @pll_id: da7210 has only one pll, so pll_id is always zero
> + * @source: clock source
> + * @fref: MCLK frequency, should be < 20MHz
> + * @fout: FsDM value, Refer page 44 & 45 of datasheet
>   *
>   * Note: Supported PLL input frequencies are 12MHz, 13MHz, 13.5MHz, 14.4=
MHz,
>   *       19.2MHz, 19.6MHz and 19.8MHz
> + *
> + * Return: Zero for success, negative error code for error
>   */
>  static int da7210_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
>  			      int source, unsigned int fref, unsigned int fout)
> --
> 2.25.1

