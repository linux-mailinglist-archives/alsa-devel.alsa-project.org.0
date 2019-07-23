Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE17271DC0
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:32:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F48A190F;
	Tue, 23 Jul 2019 19:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F48A190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563903144;
	bh=nBtqW+XCGClzSnbWhLuqNTUXXw8DgjquAsTv6e6iGyM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZasD4sGcIq0C9TMvs63yfzyOUQ0ccYKr1+ykj1OgZ6gIXJC3elYvuDI8lRkmGQZOn
	 Ba0LWrG8UjS6L54BH949NFT5Phex4IUwnXRYgQ8CNZiy49rRNV+/HQ87p9gKU5IX9z
	 64H8g2dKYdD1KeH0kvtsezU+/lWBIPWBLIFfwaYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C180AF8044A;
	Tue, 23 Jul 2019 19:27:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECBC4F80447; Tue, 23 Jul 2019 19:27:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE8B4F80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:27:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE8B4F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="zZra2SoI"
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: DJ4PPDC5hApVCbbPcs+C5eqV4zzwLixVsiLvMutzryMQMNtelWCAhjU92cNpfKwNZBefJ5ApI9
 WBhSX5wa04HyrBNyZncARAuKTN2jpaWbAZFtx8qQLWVw+9byYpUjvnW8sbPYlqMvPegEQm45rD
 /6W41XbmXUsEsk2u3bkRYWLndBGNfz3O/ZJuMWrdYHMiuJXyhqQkvOTdZWHXNJRbPQkfpHyr5L
 YXbdi4r3lIoFfmmaUut/lj2VGmLF6pAKI+42JkE2MPKjut4jLpKuK86GWQABiZMbF8j7zwpDvG
 RCc=
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="43852237"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Jul 2019 10:27:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 23 Jul 2019 10:27:27 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 23 Jul 2019 10:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Of7K+rupbtfAk3Jbf+Awoy3YvE8Hm/hqG8fCw75Ahx4wgIkpv5A2l3L/qrQyC3WO93Hl++62Yl6qJmgHA7yIetyMMpVhR70wqTKWJzlqhiNw46mabP6QOPKkn+P0HcF/SvQw8jEBD998kr4r5eW8fn904WPYnU3Aw8xGVop25Ykh0scZKKjfBln3E3BrXMzl0welb28bboeouIPomZ6q3Hi8ie4tsvlq5SnBU3CvFF/xbIib5H7xVEHjC7LTrH7VSuUUB/hnXVRgbTEFmvmMHnUl9gbwK3U9zhyBMKRrYo5MPW5PAQG+Yf3eJiPQfOF9UIPguBEy7byLAho+pTEWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQH07LEp0TOz7zoFYdWgKoZ5emdsVXPgJ3TOCSvPfoY=;
 b=V/3k6l6yeOXWhAn3488QFDSejEz3DrIPuiVy9uB8sobnRfxfYKLtj8++Xx0gHZiWMNhO/EKuJoOVcskRpADBAzKmEx/8QLsAzFAz9yrkcI2ISPh12bTfWoYUhhDmIrgAi4hhrNieYBuvoozpf8EmefHyWdhwEmt84inPrL+vAieqnpxdnzmWHqKG8OM7z/jJcKqtyt6tlvvw0SXzAP/5J1oE7ba1PERCMXHY4EtRrhtDjki4BoP/whZGgZoOjyWDEKsxk5nJ71tx4AaPriffEnqkv895HbIqFhEZPQQ6BYdqfUEFSiYM4+jNJU4j/BqYrMaX6XdnhoWTNMs/qKIfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQH07LEp0TOz7zoFYdWgKoZ5emdsVXPgJ3TOCSvPfoY=;
 b=zZra2SoIQ0/OuFe4waSSusLwq50gRtIvDjZSwksULZgunef58CZ7ZE3IHbnYpl6ZmvEhxq5X8dMPuH0sCQPVOUGBG44Jle05es/G32uH22F+KzC7O74HA5XMzv6hTIMlsgZhzHYkp2ktrKPtmDMwLUiwA57pMXBn/IGQ3lI41IE=
Received: from BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) by
 BN6PR11MB2004.namprd11.prod.outlook.com (10.173.26.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 17:27:26 +0000
Received: from BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2]) by BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2%3]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 17:27:26 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <mirq-linux@rere.qmqm.pl>
Thread-Topic: [PATCH 1/5] ASoC: atmel: enable SSC_PCM_DMA in Kconfig
Thread-Index: AQHVQLssYvZ9YoKrUEmAJfgllXwkpabYNckAgAA0LwCAAAxSAA==
Date: Tue, 23 Jul 2019 17:27:26 +0000
Message-ID: <a5ccf118-86d5-a16e-86ed-fa50edef8d51@microchip.com>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <ee65cc7b889b2a8d1139d1d25977842c956d1cf4.1563819483.git.mirq-linux@rere.qmqm.pl>
 <1f3a4256-58de-27a4-8095-54fc6baa6d89@microchip.com>
 <20190723164312.GA4772@qmqm.qmqm.pl>
In-Reply-To: <20190723164312.GA4772@qmqm.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0015.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::25) To BN6PR11MB0051.namprd11.prod.outlook.com
 (2603:10b6:405:65::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6175f26-1c4e-4bd2-f859-08d70f9307e5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB2004; 
x-ms-traffictypediagnostic: BN6PR11MB2004:
x-microsoft-antispam-prvs: <BN6PR11MB2004825B303588BA2DCE8E52E7C70@BN6PR11MB2004.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(39860400002)(366004)(136003)(51444003)(189003)(199004)(2351001)(66066001)(31686004)(14454004)(76176011)(6512007)(5640700003)(99286004)(81156014)(81166006)(6436002)(53936002)(8676002)(53546011)(52116002)(386003)(478600001)(2616005)(54906003)(186003)(26005)(6916009)(8936002)(316002)(486006)(6116002)(476003)(6246003)(11346002)(36756003)(3846002)(68736007)(25786009)(14444005)(7736002)(6486002)(305945005)(446003)(256004)(2906002)(66946007)(66556008)(4326008)(66476007)(66446008)(64756008)(2501003)(66574012)(71190400001)(5660300002)(71200400001)(86362001)(102836004)(31696002)(229853002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB2004;
 H:BN6PR11MB0051.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5AmeWOmgKgCx94pUJp2gcnhb7vf7sDSaOe3FGyYkRbTf1kVvU4SlxGB1dwPu337nUOVCp2FnYNBrtJlcTGTWM3J0DeLYp3lL5EXlCKvyzu1qD2UwMY8/HRl56WaMx02bhuXlJQLwT6/KOMAZU5toCs9OB8iM3zxq4iYy803zcNMGQl41aYhdTymaJSXnsyXqfxOGujb16hNSHlYmROYOcA3BESCApL7BSXBE8w7EXhufr/S47xTmrBwcOVrjw9TtpXMzHuwJq2+Z/5CJOYfJHqoI6mRTWZbVuUbmmK59Vql3gj7ViBQruezSMVGIR4BJozmvq0Z/zADZIMzcKHTUOzSlgOXywQXpPfeStnZ9HeS0iGtTedDqsLDHafUrncKMa/yjMN771/U0jTUWNZi5sqP/Kr+VFGKNPVP9Hhe4YtY=
Content-ID: <55324B5682468F4A96B0E7EC8EA8DA66@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f6175f26-1c4e-4bd2-f859-08d70f9307e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 17:27:26.6473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2004
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, Nicolas.Ferre@microchip.com, tiwai@suse.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/5] ASoC: atmel: enable SSC_PCM_DMA in
	Kconfig
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 23.07.2019 19:43, mirq-linux@rere.qmqm.pl wrote:
> External E-Mail
> =

> =

> On Tue, Jul 23, 2019 at 01:36:37PM +0000, Codrin.Ciubotariu@microchip.com=
 wrote:
>> On 22.07.2019 21:27, Micha=B3 Miros=B3aw wrote:
>>> Allow SSC to be used on platforms described using audio-graph-card
>>> in Device Tree.
>>>
>>> Signed-off-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>
>>> ---
>>>    sound/soc/atmel/Kconfig | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
>>> index 06c1d5ce642c..9ef9d25bb517 100644
>>> --- a/sound/soc/atmel/Kconfig
>>> +++ b/sound/soc/atmel/Kconfig
>>> @@ -25,7 +25,7 @@ config SND_ATMEL_SOC_DMA
>>>    	default y if SND_ATMEL_SOC_SSC_DMA=3Dy || (SND_ATMEL_SOC_SSC_DMA=3D=
m && SND_ATMEL_SOC_SSC=3Dy)
>>>    =

>>>    config SND_ATMEL_SOC_SSC_DMA
>>> -	tristate
>>> +	tristate "SoC PCM DAI support for AT91 SSC controller using DMA"
>>
>> Could you please make something similar for SND_ATMEL_SOC_SSC_PDC? Also,
>> I think that it should select ATMEL_SSC, to be able to use
>> simple/graph-card with SSC.
> =

> Hmm. The Kconfig dependencies seems overly complicated, do you mind if I
> get rid of most of the entries in the process?
> =

> Best Regards,
> Micha=B3=A0Miros=B3aw
> =


'select' creates recursive dependencies with our machine
drivers, but 'depends on' should work. The complication comes from the =

fact that PDC and DMA support for SSC can be both enabled at the same =

time, so I think we need all of them...

I am reviewing the rest of your patches, so bear with me please.

Best regards,
Codrin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
