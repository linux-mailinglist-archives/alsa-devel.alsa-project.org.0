Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32765E9C6
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 18:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE5316AE;
	Wed,  3 Jul 2019 18:53:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE5316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562172879;
	bh=xrnf6Sd0nJaIML7wDcs4yojp1kA9nDqZhljabDyBnmI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PkjbbxkIAsr76lrJV0pssmpxI6sR5MdRfFvR/dR1OFy/RTATdU9yrATRiTvmwbZvW
	 bfZ8NkuUhXSQ7BQtQtVDrtj8ZTWRUhjsZOhs2/VNUJCWyshi3G/L5uJEvKf13en8AJ
	 /zoyoeFLFHIEJ26PBYhsv8s5o8O14p8K1/QEtCEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F564F800EA;
	Wed,  3 Jul 2019 18:52:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5550DF800EA; Wed,  3 Jul 2019 18:52:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22A4EF800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 18:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A4EF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="bAACg1Rs"
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
IronPort-SDR: k8uY/EBvQ8z1vx5Z6gXqTlpbmIe1V0qcWs26i8cA1ZxDpLfV7NvzJf/n6/OeV3ID4aj5pbQsEo
 tCGlehiV9yWv0sxARyDUHTd0tGdBynbssEGIGhnzxmvnXRNAbw9SdaV9CW1VPwOIQbjWqewKht
 QEXQyMtbTZ1bn0ymYw0yu1qkA4tvsKbeSaVstRljtNcPoyaU8h7h91F+p7zRHBoDi1vK8ZWVmr
 pYeXNGvVIeOwL35HeT3C9pEDCWd7w88ghGyBLD3Gb8IRfvswbijCVnX9ZMvuDtMHEJCtjx68TW
 1gE=
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; d="scan'208";a="39922410"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Jul 2019 09:52:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 3 Jul 2019 09:52:37 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 3 Jul 2019 09:52:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thCssWWz2Xp4kyD0XDsMGnPUcTjwjL9mYhBxR7akPEQ=;
 b=bAACg1RsD4FNDOUeRwQtVE/WR8aP5BA1z1DPIBAnhYj3ID/SasnJROI0ya07f30oH4IlOE97av5DMnMhpMY+MZU2rHMjPgO6qWmdTOEL79IeCumIeo4FaoXqZvrmMo/W943/EL6WhA+Wc0onTnsLX7eEtKgKoXGjgmg/hDjdEdo=
Received: from BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) by
 BN6PR11MB0019.namprd11.prod.outlook.com (10.161.155.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 16:52:35 +0000
Received: from BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2]) by BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2%3]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 16:52:35 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <tzungbi@google.com>
Thread-Topic: [alsa-devel] [PATCH 1/2] ASoC: codecs: ad193x: Group register
 initialization at probe
Thread-Index: AQHVLOBuNYbcxW+S6E2Xr3qUkzcNHqa4ixeAgACah4A=
Date: Wed, 3 Jul 2019 16:52:35 +0000
Message-ID: <e9e653d1-6360-ffaf-6b47-eb33c0d867df@microchip.com>
References: <20190627120208.4661-1-codrin.ciubotariu@microchip.com>
 <CA+Px+wXBBgeWbjZ5uQmwJgn+d=ZE-N0aehitog7==ak3GDxMsQ@mail.gmail.com>
In-Reply-To: <CA+Px+wXBBgeWbjZ5uQmwJgn+d=ZE-N0aehitog7==ak3GDxMsQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0207.eurprd08.prod.outlook.com
 (2603:10a6:802:15::16) To BN6PR11MB0051.namprd11.prod.outlook.com
 (2603:10b6:405:65::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24dff10b-620f-4c6c-406d-08d6ffd6d8d0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB0019; 
x-ms-traffictypediagnostic: BN6PR11MB0019:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB001987718B73258F179F1055E7FB0@BN6PR11MB0019.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(346002)(376002)(366004)(199004)(189003)(6116002)(6486002)(3846002)(14454004)(8676002)(66066001)(99286004)(966005)(81156014)(81166006)(52116002)(5660300002)(31686004)(54906003)(316002)(25786009)(229853002)(36756003)(68736007)(256004)(6916009)(6306002)(64756008)(66446008)(8936002)(86362001)(6246003)(71190400001)(71200400001)(31696002)(72206003)(305945005)(446003)(26005)(4326008)(66556008)(2616005)(11346002)(66476007)(2906002)(53936002)(7736002)(186003)(476003)(73956011)(486006)(66946007)(6506007)(76176011)(102836004)(6512007)(478600001)(6436002)(53546011)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB0019;
 H:BN6PR11MB0051.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: te0oQsh9Nupa+8SUs2DphLkyh24M2cAwIRDTkdQE7m5ixW6GuoLK2HGR4pFr2vXNpOnY+gEW2stxDy2wc3oUd2t7JhsdxlKdpAWM7cSUt62kISFHe/Mz2iBxaxB9zk6XnafqfgTcOgN4DY0ZK5N1T6TELJva3Gj6nlP3C5CagJCn7utVUUtH2KoGE6kvLdnMdv7Er5m7ZbgOJ4wNaCy+ZG8TEBz/IRe92ZudFP/unC/pmG4DplXuOu2AEr4yuq60qSiuymX2YrRy2tQ+j06ITu7c4lmCfM/y5HV9yl9Cu2/fIAW+hnB+rm8cwVRMrt6/wpsJ98ocWBirKNyBY5yk0FG46Khp0SjyDDsx20CcyeAcH9yZOZWA4q5nhqtSBeaiLK8Vy62Dk7WH/itIV3QWb9MFb65P0hvMAGZNgDCJsCM=
Content-ID: <106EAF0CF0E83B4CACE6BBC13ECDE279@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 24dff10b-620f-4c6c-406d-08d6ffd6d8d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 16:52:35.1690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0019
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: codecs: ad193x: Group register
 initialization at probe
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

On 03.07.2019 10:39, Tzung-Bi Shih wrote:
> On Thu, Jun 27, 2019 at 8:05 PM Codrin Ciubotariu
> <codrin.ciubotariu@microchip.com> wrote:
>> +struct ad193x_reg_default {
>> +       unsigned int reg;
>> +       unsigned int val;
>> +};
> You probably don't need to define this.  There is a struct
> reg_sequence in regmap.h.
> 
>> +
>> +/* codec register values to set after reset */
>> +static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
>> +{
>> +       const struct ad193x_reg_default reg_init[] = {
>> +               {  0, 0x99 },   /* PLL_CLK_CTRL0: pll input: mclki/xi 12.288Mhz */
>> +               {  1, 0x04 },   /* PLL_CLK_CTRL1: no on-chip Vref */
>> +               {  2, 0x40 },   /* DAC_CTRL0: TDM mode */
>> +               {  4, 0x1A },   /* DAC_CTRL2: 48kHz de-emphasis, unmute dac */
>> +               {  5, 0x00 },   /* DAC_CHNL_MUTE: unmute DAC channels */
>> +       };
>> +       const struct ad193x_reg_default reg_adc_init[] = {
>> +               { 14, 0x03 },   /* ADC_CTRL0: high-pass filter enable */
>> +               { 15, 0x43 },   /* ADC_CTRL1: sata delay=1, adc aux mode */
>> +       };
>> +       int i;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(reg_init); i++)
>> +               regmap_write(ad193x->regmap, reg_init[i].reg, reg_init[i].val);
>> +
>> +       if (ad193x_has_adc(ad193x)) {
>> +               for (i = 0; i < ARRAY_SIZE(reg_adc_init); i++) {
>> +                       regmap_write(ad193x->regmap, reg_adc_init[i].reg,
>> +                                    reg_adc_init[i].val);
>> +               }
>> +       }
> And you could use regmap_multi_reg_write( ) to substitute the two for-loops.
> 
> See https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/151090.html
> as an example.  It also has some reg initializations in component
> probe( ).
> 

Your solution is certainly more elegant. I will make a patch and switch 
to regmap_multi_reg_write().

Thank you for your review.

Best regards,
Codrin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
