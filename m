Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC83D4BE70
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 18:41:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501CF1688;
	Wed, 19 Jun 2019 18:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501CF1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560962511;
	bh=ZXihBTO7feLbYdHrqqVPgqnNOtfYb80+BC7RBfz1gDU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPKkxMOOv6AvI6hgimMqUt4a1J2u/kUH7zJnMJWTpuLcEFp0t7FF1zhcH+DewSScU
	 NTid87GKEgHpw3M4TjDa8Bb+cWKfiZwbLLqBHll9DJPqehLn1puEMP3amFQvPP+IFA
	 6l3+MEx+sb4pK/T3x66n4O7/xweei9Y0Pu/otChM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEA13F896B8;
	Wed, 19 Jun 2019 18:40:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA53EF896B8; Wed, 19 Jun 2019 18:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CF4EF80CC4
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 18:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CF4EF80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="OTkdkr8d"
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
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="38060273"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jun 2019 09:39:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Jun 2019 09:39:55 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 19 Jun 2019 09:39:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPyzlJBIbnKd3Ong6U/aVZhUoA/DXmPe5zpnI+h8I9s=;
 b=OTkdkr8dVN1PdvVEiBvo9TuOJwdtewd5v1DJ1yBJbqmNGsJhS/TH/ZntANlrOZleOBh0vtbZuvPgDefBqDWWtHxESr8GUIcSUuuvNmIYFwNg8jLEfJoZuulc6PzSxPOmJ+YucMz7PfZn9jAFYQOW9tyeq6B6pbJR0N8jvUo3+ss=
Received: from BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) by
 BN6PR11MB1666.namprd11.prod.outlook.com (10.172.18.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Wed, 19 Jun 2019 16:39:53 +0000
Received: from BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::b979:a7e7:97e:7098]) by BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::b979:a7e7:97e:7098%2]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 16:39:53 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <dan.carpenter@oracle.com>
Thread-Topic: [bug report] ASoC: codecs: ad193x: Fix frame polarity for DSP_A
 format
Thread-Index: AQHVJqwom/mzW8pA0UKnhXS4oTVVIKajLdcA
Date: Wed, 19 Jun 2019 16:39:53 +0000
Message-ID: <71a9a03f-f5a2-f682-4742-c8d37a301961@microchip.com>
References: <20190619143414.GA26033@mwanda>
In-Reply-To: <20190619143414.GA26033@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0058.eurprd09.prod.outlook.com
 (2603:10a6:802:28::26) To BN6PR11MB0051.namprd11.prod.outlook.com
 (2603:10b6:405:65::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc18f6a3-c1cc-4ce5-985c-08d6f4d4c145
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1666; 
x-ms-traffictypediagnostic: BN6PR11MB1666:
x-microsoft-antispam-prvs: <BN6PR11MB1666B1DF423DEBFD73F1D2B5E7E50@BN6PR11MB1666.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(136003)(396003)(366004)(189003)(199004)(102836004)(6506007)(71190400001)(53546011)(6916009)(71200400001)(86362001)(14444005)(256004)(26005)(2906002)(186003)(53936002)(5660300002)(25786009)(386003)(6436002)(52116002)(6512007)(76176011)(6246003)(31696002)(229853002)(99286004)(4326008)(6486002)(316002)(72206003)(478600001)(3846002)(14454004)(6116002)(486006)(66066001)(66446008)(64756008)(66556008)(66476007)(31686004)(73956011)(66946007)(305945005)(8936002)(11346002)(7736002)(446003)(81156014)(81166006)(2616005)(68736007)(36756003)(476003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1666;
 H:BN6PR11MB0051.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: B+m1KhWrg9lr0Y13Jti7ElpQ9+MkzHWsX53BfZE2123mYon49IfmLMiBqdtYCCNhJX3G621BK8LwTdUlLUo9s9dO4F6m9+7Go7bXOXESQuZD+pVnv9yp5GJGcx33OzWWMpmmTT+acweE1wIfk5DZLzvEqJI7wwmaokqC6AuOHmZmCibLOfYGZ5kJyOXXN5l1MuNBzNlfdC4QjNlUke+Lzzawlzm8lYAeFpbAfVcg7wsVDyQEys1QB/ANTfUZBHlI0C4+0swqH+aRMhoa1qZ53qa8AxC5RnCR4eW54FuQ3FGzxcdtV+gHkgISAJoLCqG9LgSSdQd4VJp32kxYVfvETEtABwg8LouEiP4f+iOJtq8AUEqv46kCJU5WIWCt6OKDADoX00G5OdwL36FwAy5lU7dM157WVtwCG0rPX4RtInI=
Content-ID: <3C4F83D60CAB3F43AD18AD900CB3EFA8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bc18f6a3-c1cc-4ce5-985c-08d6f4d4c145
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 16:39:53.6749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1666
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [bug report] ASoC: codecs: ad193x: Fix frame
 polarity for DSP_A format
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

On 19.06.2019 17:34, Dan Carpenter wrote:
> External E-Mail
> 
> 
> Hi Codrin,
> 
> Linus recently corrected me on one of my patches and I said I would
> look through the kernel and fix similar bugs as well.  The problem I
> realized is that I'm really stupid and I have forgot how to do math...
> 
> The patch 90f6e6803139: "ASoC: codecs: ad193x: Fix frame polarity for
> DSP_A format" from Feb 18, 2019, leads to the following static
> checker warning:
> 
> 	sound/soc/codecs/ad193x.c:244 ad193x_set_dai_fmt()
> 	warn: passing casted pointer '&dac_fmt' to 'change_bit()' 32 vs 64.
> 
> sound/soc/codecs/ad193x.c
>     194  static int ad193x_set_dai_fmt(struct snd_soc_dai *codec_dai,
>     195                  unsigned int fmt)
>     196  {
>     197          struct ad193x_priv *ad193x = snd_soc_component_get_drvdata(codec_dai->component);
>     198          unsigned int adc_serfmt = 0;
>     199          unsigned int dac_serfmt = 0;
>     200          unsigned int adc_fmt = 0;
>     201          unsigned int dac_fmt = 0;
>                  ^^^^^^^^^^^^^^^^^^^^^^^^
> This is a u32.
> 
>     202
>     203          /* At present, the driver only support AUX ADC mode(SND_SOC_DAIFMT_I2S
>     204           * with TDM), ADC&DAC TDM mode(SND_SOC_DAIFMT_DSP_A) and DAC I2S mode
>     205           * (SND_SOC_DAIFMT_I2S)
>     206           */
>     207          switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>     208          case SND_SOC_DAIFMT_I2S:
>     209                  adc_serfmt |= AD193X_ADC_SERFMT_TDM;
>     210                  dac_serfmt |= AD193X_DAC_SERFMT_STEREO;
>     211                  break;
>     212          case SND_SOC_DAIFMT_DSP_A:
>     213                  adc_serfmt |= AD193X_ADC_SERFMT_AUX;
>     214                  dac_serfmt |= AD193X_DAC_SERFMT_TDM;
>     215                  break;
>     216          default:
>     217                  if (ad193x_has_adc(ad193x))
>     218                          return -EINVAL;
>     219          }
>     220
>     221          switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>     222          case SND_SOC_DAIFMT_NB_NF: /* normal bit clock + frame */
>     223                  break;
>     224          case SND_SOC_DAIFMT_NB_IF: /* normal bclk + invert frm */
>     225                  adc_fmt |= AD193X_ADC_LEFT_HIGH;
>     226                  dac_fmt |= AD193X_DAC_LEFT_HIGH;
>     227                  break;
>     228          case SND_SOC_DAIFMT_IB_NF: /* invert bclk + normal frm */
>     229                  adc_fmt |= AD193X_ADC_BCLK_INV;
>     230                  dac_fmt |= AD193X_DAC_BCLK_INV;
>     231                  break;
>     232          case SND_SOC_DAIFMT_IB_IF: /* invert bclk + frm */
>     233                  adc_fmt |= AD193X_ADC_LEFT_HIGH;
>     234                  adc_fmt |= AD193X_ADC_BCLK_INV;
>     235                  dac_fmt |= AD193X_DAC_LEFT_HIGH;
>     236                  dac_fmt |= AD193X_DAC_BCLK_INV;
>     237                  break;
>     238          default:
>     239                  return -EINVAL;
>     240          }
>     241
>     242          /* For DSP_*, LRCLK's polarity must be inverted */
>     243          if (fmt & SND_SOC_DAIFMT_DSP_A) {
>     244                  change_bit(ffs(AD193X_DAC_LEFT_HIGH) - 1,
>     245                             (unsigned long *)&dac_fmt);
>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This change_bit() will work on little endian systems but on 64 bit big
> endian systems it will corrupt memory.  I *think* the correct code looks
> like this, but again, I'm feeling dumb so I might be wrong:
> 
> 			dac_fmt ^= 1 << (ffs(AD193X_DAC_LEFT_HIGH) - 1);

or just:
dac_fmt ^= AD193X_DAC_LEFT_HIGH;

Thank you for reporting this. I will send a patch to fix it.

Best regards,
Codrin


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
