Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B013AA71
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:15:40 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47DB1225B;
	Mon, 13 Jan 2020 17:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47DB1225B
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AA9AF80228;
	Mon, 13 Jan 2020 17:21:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B72AF801F8; Mon, 13 Jan 2020 17:21:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54DFFF8014B
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 17:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54DFFF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="jzxuroVh"
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 86VJW+iYXUDESJD7+KQtaN0W6p4HK+StlCVB8VfdsuKt6iQnybrAFBSoi4D1/g4NAApH/Zqy1s
 no+83EAR0gLG/zhwQUyQE9pbQDzpQWv7hLlNfzBClnPBId6wyioFXHXINjAHZZLnv2taQRlE7Q
 9wT9kZn0tfUQiiIDMUhxXQTveodjYJfMB9J8c5+n1JcFDjrAXEYWDGG8Ph3wQ4fkAxxLjEMeg+
 028xKeyFjokYqUcBXqhzPHtL2C+QrNY/78lhtxBuojNwqvtxSesdqfRkigid0EgFl4NL4HiyHO
 MTU=
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; d="scan'208";a="62447853"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jan 2020 09:21:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 13 Jan 2020 09:21:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 13 Jan 2020 09:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAsrdkF5uQcVf5ZF3KiAkCTzyyfM5DE8ofXw21XdUlxKOQk65eeGoZGudbjQ3IXqbbKfRZStf73Ee1KuUri1gKG3T7duKDJZOxMkGxTCsgUAamIDaB1e26rAUpBUsfa/+HghsG5UHKk3QSDtVOhuRnp4YvBMCsIe+j1M6U7vbQPqaRNWHxSQLt3T0RZn2p+Vr6MvrYmzQHyTE82KA5ghgS2i8PBo5Sw6TBBYk3oAPNGvULRt28ytUzPBdDh5vOzDgl/HRBvHn+OfW13n/esd+v0zZIFLySKFhIjYFXupdwQ3cuJ8ff7zA10SAK2FqclBQ1r8F+gN2JVsxzlrYhBwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPqttbWxe9aaYs6weEtaFyHItVqFhTGIrdnfVLVm4YQ=;
 b=WCxX7W77s9e4ereth1KpKk6Kdd/T6MZOUMsxS/nMwL2UNJn3yp+qPeLViUsLP7Fq6Oei6pLeVBCiyI4VBtKzeqx+oRWYmSjdxJzJTTO/PGrCu+DoBBNtLrEc25KxQnkRpNwfqCdZAnBIIK6IR+bn8AwnMDnOwkqHCEOojkdXbHLfvNfSUnXjOmkEj7BIOISqUAVbDilxU51mWsdsNDOGyp0oSOi1DGhkjOPy3+dY4RdRTQ96z5D4KT+068pSOuyVEzjyTaKKQisb55mV1C/PrskHHtlL8chSY7cXHHRWzsC3F0sieL7iRdPKGcN18fsrmn3R2Qa3b/fSUJbjMUf0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPqttbWxe9aaYs6weEtaFyHItVqFhTGIrdnfVLVm4YQ=;
 b=jzxuroVhSxREfKBb0H+HqZGlfwI5aKlrZUc1Mte5jwoYvhaX2bOI6DRPEQlNrHU4Q9i5VniuT1uuWjLEPhKC3/CfCVf0JP/4nATyz0qo5dUoBuQ+zxCA0hDL4vWIUbM2JmNgGuA93bddHyI7J+5uIETyz0SdIld+Hs+uDbMnGI8=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4241.namprd11.prod.outlook.com (52.132.255.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 16:21:39 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd%5]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 16:21:39 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <chenzhou10@huawei.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Thread-Topic: [PATCH next] ASoC: atmel: fix build error with
 CONFIG_SND_ATMEL_SOC_DMA=m
Thread-Index: AQHVyhaj92blbJDFUkGfqKFxX0UlQafoxtsA
Date: Mon, 13 Jan 2020 16:21:39 +0000
Message-ID: <50064e1e-8295-7ddf-6860-c4b798127dd6@microchip.com>
References: <20200113133242.144550-1-chenzhou10@huawei.com>
In-Reply-To: <20200113133242.144550-1-chenzhou10@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b6c9e7c-cc92-47da-9710-08d79844ab84
x-ms-traffictypediagnostic: BY5PR11MB4241:
x-microsoft-antispam-prvs: <BY5PR11MB42419142C8F549C54B344872E7350@BY5PR11MB4241.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(346002)(136003)(376002)(39860400002)(189003)(199004)(966005)(66476007)(478600001)(76116006)(66946007)(91956017)(8676002)(2616005)(2906002)(81156014)(81166006)(26005)(5660300002)(316002)(186003)(66556008)(64756008)(66446008)(53546011)(6506007)(36756003)(110136005)(54906003)(6486002)(31686004)(8936002)(86362001)(31696002)(4326008)(71200400001)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4241;
 H:BY5PR11MB4497.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NFdKqhGkhr3E8QPr7rtiwauwNq+zhs8wOK20rtXFOd4rentpOKDLB0scHfvg+/lVNpghpFnMn01ndpEb2OnSyLwrA/yYnODgxffpvg1G5X8Pyznjpi4Yg0w690IA2yBI6Icxs/Z/XTdDwD0gZ7hMuhEIuqTISqokmY8Oc5/u2w7l1imJa5+tKEpMSUi5zBV3ZZ2ew3Tjl4WpYpHuSz3ngtGFsARmlNvyTRKtLBOlR6SMMg6MtUcEAUDg5XMdWx5k1Jb5lRYftOPgsCRbee2vKTgGI8kMJA3CVIb+PwGIUje1XGenquZOuTk5BcFTXDWYFOdbhy+lvxbhapupiBLuUwgI9BlJdwA9cWvJz5BrOSDKJQtAKPU3dwMu8NcLGb97IOkat211HH1RykhtvJeDAfeXd+trFG3i5Fo+5KTGM2pw3yItHscPQHOUHcCfLKMzxpPQXbKhUKWIH9PqyEnJxjtj7ohmSqQ5hZLOugCCaKk=
x-ms-exchange-transport-forked: True
Content-ID: <218BA23E7577CE4BB334EBE10AC70474@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6c9e7c-cc92-47da-9710-08d79844ab84
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 16:21:39.7846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0BlToqMNztfGDAbgjG5bmUQtk+IYwM0cHTjpG7XUFfjEVdOH6LeKiZC8HDONOEKfKnrzjFtdqQpgOhYXers2IVHQn5PcnaETJTMtbALYhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4241
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: Re: [alsa-devel] [PATCH next] ASoC: atmel: fix build error with
 CONFIG_SND_ATMEL_SOC_DMA=m
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13.01.2020 15:32, Chen Zhou wrote:
> If CONFIG_SND_ATMEL_SOC_DMA=m, build error:
> 
> sound/soc/atmel/atmel_ssc_dai.o: In function `atmel_ssc_set_audio':
> (.text+0x7cd): undefined reference to `atmel_pcm_dma_platform_register'
> 
> Function atmel_pcm_dma_platform_register is defined under
> CONFIG SND_ATMEL_SOC_DMA, so select SND_ATMEL_SOC_DMA in
> CONFIG SND_ATMEL_SOC_SSC, same to CONFIG_SND_ATMEL_SOC_PDC.

Arnd sent a more complete patch for this issue:
https://lkml.org/lkml/2019/10/1/620

It wasn't merged due to some integration issues. Could you please try it 
and let us know if it fixes your issue?

Thanks and best regards,
Codrin

> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>   sound/soc/atmel/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
> index f118c22..d1dc8e6 100644
> --- a/sound/soc/atmel/Kconfig
> +++ b/sound/soc/atmel/Kconfig
> @@ -19,6 +19,8 @@ config SND_ATMEL_SOC_DMA
> 
>   config SND_ATMEL_SOC_SSC
>          tristate
> +       select SND_ATMEL_SOC_DMA
> +       select SND_ATMEL_SOC_PDC
> 
>   config SND_ATMEL_SOC_SSC_PDC
>          tristate "SoC PCM DAI support for AT91 SSC controller using PDC"
> --
> 2.7.4
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
