Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9F72F4E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 14:56:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94AD8193E;
	Wed, 24 Jul 2019 14:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94AD8193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563972984;
	bh=c3B5FOwa+8HrNGaatMcIFkLMXJvcoYCjOQx38UQRUgA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MP1sY5jfHvD0BKVa2wWCgyAUHIlbAEVFbUsuMlEArr/dhdEFBB2ICIgbNPzui0K6S
	 9mYK6XviYsQkNmzGRJ+kXUhhxF2B2LxYeq++r9kKvTYIDf7c5fd860vP735xGmAKzD
	 2LECaO5i8RBS9EHJQnHRid7R+QX8IVfyn8HgdOy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA975F80368;
	Wed, 24 Jul 2019 14:54:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B780FF803D1; Wed, 24 Jul 2019 14:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E4D1F800E3
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 14:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E4D1F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="CnJO9ijJ"
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
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
IronPort-SDR: wF90Kis5k9Q0u3TAZaYVsYfTNSQFWe/PvW4PPbRNVUpTT6VwBeHWWRAxHSCT8bJV1qxrdv233v
 huAXe1TIkFsgVewbsvHKgYSy4jDzl7aN8UQYoHW4GTakQvPEAOJmSSpgIX9PDJ7ggZRNw+TWS5
 5c6Kx2b5Dsj2s0uxzz4OpCyMQNwm2qg4o/3GpyC7DSC1lz4OirmWQbxZTCN5LH88nH1mhhQylr
 Faxb9mroAIqYx1qgbOthwqqtM+8+7SYRiXJ2yc9dfP4XKkkDWaOTUuAHh9C79PANwW/T2xeF8N
 QXY=
X-IronPort-AV: E=Sophos;i="5.64,302,1559545200"; d="scan'208";a="42559294"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Jul 2019 05:54:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 24 Jul 2019 05:54:30 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 24 Jul 2019 05:54:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YphDgGsLaOkjKAKlxeKkCgU5T+x9e8kY7dtBe+ypNnSrsYdzjr6YGkBjP2S8gBYnAMNxlFVr095y7rcBWUC7J+xgSBJprvh2LPbRdJUmkW7NE+RSKR5vYL5bi4fjbGaoePkz+xk3XA1auszOU1GGKSil7VswLBftZjYmE0z9F2ttEZRU5PmKRo+8AbnlYYZ5mbFxQ2a3PraQBEsBLghCICFnaERWBQwxcmZlD2QPMutV6iTExZdj+yyu2JKUK5jmKyTedIBONqS7h8BQmE7ewbOvuA+DfSYku7xwXA8bPK/T5igoNSvQTiIKTPSKJ68wL8PRju/k9vBjtRZ8e6IFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcswGhBX90GX3fFF/aEcrXbg6DyS+/6mps/S6XZ5wPM=;
 b=M6p65KOkwCuFnQWpxCBm/VSgeYIvBSwcUXlwn4DFM3ALUmY1wngKHXi2/jeVg8vptAuYq7916QxlPpANhVeRp0CfGsfnxOkchgXzd428hAPKzsd0yiCxzeoWkArZiPEtk6VLnUxZ8woNuNmGAyLf0yidZerZ/tz1vqdhMTBAcrnFrdOSBTKDlWPk0uvH5elL9UCaOYWxjDliKfxp9KTjFDxB9F4gApsZxvjiN2u4tXKIT+/Rup9kqUFR38QRZWTbWkdWeo5riW9R5h4R8ScTVmdSyG56uwe5M7Vk+GC+OY7mF16eGbJIT9qDwOsHqc607fdHT7tfMGRWWCjjVEmsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcswGhBX90GX3fFF/aEcrXbg6DyS+/6mps/S6XZ5wPM=;
 b=CnJO9ijJT06FGDyXKyrA7YbL8aYNEI/E0xqb4Wt94pn6egUXihRDwak5uiJx1O0dGRvgxgbJPaXuCr2xRQXhKi8SIt1aqguTBOQn4hStKvCpzYzZ/CQgqxMMcOA18J5ah8dzi1wtxFQ3dSEsakRHam84JjHjH3oy8ARHfqwy98M=
Received: from BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) by
 BN6PR11MB3892.namprd11.prod.outlook.com (10.255.130.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 12:54:27 +0000
Received: from BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2]) by BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2%3]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 12:54:27 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <mirq-linux@rere.qmqm.pl>
Thread-Topic: [PATCH 2/5] ASoC: atmel_ssc_dai: rework DAI format configuration
Thread-Index: AQHVQLsjjVplVunOTk6U6sUWRJQTJ6bZlYUAgAALPICAABuZgA==
Date: Wed, 24 Jul 2019 12:54:27 +0000
Message-ID: <e8ed52a8-bfca-9466-2981-07fd2a0a42b8@microchip.com>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <ff244c1b626fc9c63b4a1fa4e09eeaa579e683d9.1563819483.git.mirq-linux@rere.qmqm.pl>
 <df304453-575f-5925-8d09-f6094c55f8be@microchip.com>
 <20190724111533.GA23736@qmqm.qmqm.pl>
In-Reply-To: <20190724111533.GA23736@qmqm.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To BN6PR11MB0051.namprd11.prod.outlook.com
 (2603:10b6:405:65::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d01e6125-9cee-472d-124f-08d710360fa5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR11MB3892; 
x-ms-traffictypediagnostic: BN6PR11MB3892:
x-microsoft-antispam-prvs: <BN6PR11MB38923E4619DC6E2DC287A02FE7C60@BN6PR11MB3892.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(346002)(39860400002)(136003)(199004)(189003)(2501003)(6436002)(2351001)(31696002)(5640700003)(478600001)(6486002)(25786009)(186003)(6512007)(31686004)(66066001)(6916009)(66574012)(6246003)(14454004)(53936002)(86362001)(76176011)(66556008)(66446008)(66946007)(229853002)(66476007)(316002)(81156014)(4326008)(305945005)(7736002)(5660300002)(64756008)(8676002)(36756003)(71200400001)(71190400001)(68736007)(53546011)(256004)(14444005)(6506007)(3846002)(386003)(81166006)(8936002)(52116002)(102836004)(486006)(26005)(11346002)(446003)(6116002)(54906003)(99286004)(476003)(2906002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB3892;
 H:BN6PR11MB0051.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qh8oMyRDJ92LJyvF49HoAuWJED3MHI3vlVUDht1DABRr0LLkxZRdNqiafXEg+yOKVpMvizRxT3XeUkQNA3t4ZXvhZmA0dle0W62i3nGOA50TsqT51cKpId1Cck0OOZ5buYjDtLT3xuIEU8vlofp//vZ2PwkyNHp8V8bcbhH8z0Stz63JxYe1nu4DNBwmgJueBz0n/1BTSPA/U7YfqcGzAfafKJPxdCwMMhb1ydyp9wYKdyP54BU635G5A45kBogSvtepTiSPNVRBSXKsg0FkTiEddUCAaRssKdhVqONNRd/YkA7xFfViGLk8f+DFTdPAwQDgS86d5HxvchLBMFMeuiK+kcOT0/BySKh1nfzHU+sQ53Sr+gF9Tke+kAD93aZfBAWUIOzbNPurEN5+SZWfU2kSgOxvQuDX895q+WpSH0M=
Content-ID: <35BC782323E47B4381440E9FD4B9C91A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d01e6125-9cee-472d-124f-08d710360fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 12:54:27.6927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3892
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com, tiwai@suse.com,
 lgirdwood@gmail.com, Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 2/5] ASoC: atmel_ssc_dai: rework DAI format
	configuration
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

On 24.07.2019 14:15, mirq-linux@rere.qmqm.pl wrote:
> External E-Mail
> =

> =

> On Wed, Jul 24, 2019 at 10:35:29AM +0000, Codrin.Ciubotariu@microchip.com=
 wrote:
>> On 22.07.2019 21:27, Micha=B3 Miros=B3aw wrote:
>>> Rework DAI format calculation in preparation for adding more formats
>>> later.
>>>
>>> Note: this changes FSEDGE to POSITIVE for I2S CBM_CFS mode as the TXSYN
>>> interrupt is not used anyway.
>>>
>>> Signed-off-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>
>>> ---
>>>    sound/soc/atmel/atmel_ssc_dai.c | 283 +++++++++---------------------=
--
>>>    1 file changed, 79 insertions(+), 204 deletions(-)
>>>
>>> diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ss=
c_dai.c
>>> index 6f89483ac88c..b2992496e52f 100644
>>> --- a/sound/soc/atmel/atmel_ssc_dai.c
>>> +++ b/sound/soc/atmel/atmel_ssc_dai.c
> [...]
>>> +	if (atmel_ssc_cbs(ssc_p)) {
>>> +		/*
>>> +		 * SSC provides BCLK
>>> +		 *
>>> +		 * The SSC transmit and receive clocks are generated from the
>>> +		 * MCK divider, and the BCLK signal is output
>>> +		 * on the SSC TK line.
>>> +		 */
>>> +		rcmr |=3D	  SSC_BF(RCMR_CKS, SSC_CKS_DIV)
>>> +			| SSC_BF(RCMR_CKO, SSC_CKO_NONE);
>>> +
>>> +		tcmr |=3D	  SSC_BF(TCMR_CKS, SSC_CKS_DIV)
>>> +			| SSC_BF(TCMR_CKO, SSC_CKO_CONTINUOUS);
>>> +	} else {
>>> +		rcmr |=3D	  SSC_BF(RCMR_CKS, ssc->clk_from_rk_pin ?
>>> +					SSC_CKS_PIN : SSC_CKS_CLOCK)
>>> +			| SSC_BF(RCMR_CKO, SSC_CKO_NONE);
>>> +
>>> +		tcmr |=3D	  SSC_BF(TCMR_CKS, ssc->clk_from_rk_pin ?
>>> +					SSC_CKS_CLOCK : SSC_CKS_PIN)
>>> +			| SSC_BF(TCMR_CKO, SSC_CKO_NONE);
>>> +	}
>>> +
>>> +	rcmr |=3D	  SSC_BF(RCMR_PERIOD, rcmr_period)
>>> +		| SSC_BF(RCMR_CKI, SSC_CKI_RISING);
>>
>> You can also add here SSC_BF(RCMR_CKO, SSC_CKO_NONE) and remove it from
>> the if-else above;
> =

> I left it to keep symmetry between TX and RX code. I can pull it here if
> you prefer that way.

Right, you can leave it then.

> =

>>> +
>>> +	tcmr |=3D   SSC_BF(TCMR_PERIOD, tcmr_period)
>>> +		| SSC_BF(TCMR_CKI, SSC_CKI_FALLING);
>>> +
>>> +	rfmr =3D    SSC_BF(RFMR_FSLEN_EXT, fslen_ext)
>>> +		| SSC_BF(RFMR_FSEDGE, SSC_FSEDGE_POSITIVE)
>>> +		| SSC_BF(RFMR_FSOS, fs_osync)
>>> +		| SSC_BF(RFMR_FSLEN, fslen)
>>> +		| SSC_BF(RFMR_DATNB, (channels - 1))
>>> +		| SSC_BIT(RFMR_MSBF)
>>> +		| SSC_BF(RFMR_LOOP, 0)
>>> +		| SSC_BF(RFMR_DATLEN, (bits - 1));
>>> +
>>> +	tfmr =3D    SSC_BF(TFMR_FSLEN_EXT, fslen_ext)
>>> +		| SSC_BF(TFMR_FSEDGE, SSC_FSEDGE_POSITIVE)
>>> +		| SSC_BF(TFMR_FSDEN, 0)
>>> +		| SSC_BF(TFMR_FSOS, fs_osync)
>>> +		| SSC_BF(TFMR_FSLEN, fslen)
>>> +		| SSC_BF(TFMR_DATNB, (channels - 1))
>>> +		| SSC_BIT(TFMR_MSBF)
>>> +		| SSC_BF(TFMR_DATDEF, 0)
>>> +		| SSC_BF(TFMR_DATLEN, (bits - 1));
>>> +
>>> +	if (fslen_ext && !ssc->pdata->has_fslen_ext) {
>>> +		dev_err(dai->dev, "sample size %d is too large for SSC device\n",
>>> +			bits);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>>    	pr_debug("atmel_ssc_hw_params: "
>>>    			"RCMR=3D%08x RFMR=3D%08x TCMR=3D%08x TFMR=3D%08x\n",
>>>    			rcmr, rfmr, tcmr, tfmr);
>>>
>>
>> You are adding support for SND_SOC_DAIFMT_DSP_A |
>> SND_SOC_DAIFMT_CBM_CFS. If this is intended, please make a separate
>> patch. If not, then:
>>
>> printk(KERN_WARNING "atmel_ssc_dai: unsupported DAI format 0x%x\n",
>> 			ssc_p->daifmt);
>> return -EINVAL;
> =

> Hmm. I guess this is actually a good side effect. I can't see a way to
> contain this change that doesn't involve adding code that's immediately
> removed in next patch. So would you agree to just mentioning this in
> commit message?

I prefer a separate patch, for clarity mostly, but I don't have a strong =

opinion on this. Later, it might prove trickier to investigate a bug =

this case and review this patch. Also, we should test and see that this =

format works indeed...

Best regards,
Codrin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
