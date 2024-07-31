Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5E894287B
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 09:58:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D596105F;
	Wed, 31 Jul 2024 09:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D596105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722412684;
	bh=52i1TKv1QJtPiYJQmNvPxeAMRktcNsRIG/9EFEJMakk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tGuqXuevQTP5365OWHPF5xbhloghOpSTmK4THOtTFVXSyeDvym5pnOTavzlB2luy/
	 dS1KxMI1kyEAOUUowgxERZSrGrkD7+GTuViKJD75ZZBFIQNpDv+PH8vjiU47mdTcSR
	 zkpRczgTyVLFvPXOa7fWXMMkrTFTJSg7WNX20V2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EE5AF805AC; Wed, 31 Jul 2024 09:57:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 313FDF805AF;
	Wed, 31 Jul 2024 09:57:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E90EF802DB; Wed, 31 Jul 2024 09:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE41EF800C9
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 09:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE41EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=fiHrz8vs
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46V7mKJg099024;
	Wed, 31 Jul 2024 02:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722412100;
	bh=dkyhEo+hF9bpM6Pzb3TXJTbUMs9qSpnTKKWlLC++GLc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=fiHrz8vs1FduOMg6hvM9OY8sW/tpUiMyJm0O7bTqozzdcl24gzWJwlHinGR3gcnog
	 UabWnmJmV471hswY9k3YMRek+lSoILx9aHWAk+ZCy+n0Z7nj2GuImrJZJ9ygEWc32R
	 5irPvaT+9l1jBDAqCAR8QJ3Ut5N4mTTVDjKg6ygQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46V7mKb5019391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Jul 2024 02:48:20 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 31
 Jul 2024 02:48:20 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Wed, 31 Jul 2024 02:48:19 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Terry Sanders <linux@vertone.co.uk>, "Kasargod, Sandeep" <sandeepk@ti.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Xu, Baojun"
	<baojun.xu@ti.com>, "Lu, Kevin" <kevin-lu@ti.com>
Subject: RE: [EXTERNAL] Bug in tlv320adc3101 driver
Thread-Topic: [EXTERNAL] Bug in tlv320adc3101 driver
Thread-Index: AQHa4x2L4fMXw36bHUWHnRSlLJpRuLIQdVAw
Date: Wed, 31 Jul 2024 07:48:19 +0000
Message-ID: <4ac767ce1c6e4ea9b803d6007acb2988@ti.com>
References: <5652371.ZASKD2KPVS@jupiter>
In-Reply-To: <5652371.ZASKD2KPVS@jupiter>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-Mentions: sandeepk@ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.49]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Message-ID-Hash: Y2UXJNSBU5CXGSJICY2T7X7LH743UHNE
X-Message-ID-Hash: Y2UXJNSBU5CXGSJICY2T7X7LH743UHNE
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2UXJNSBU5CXGSJICY2T7X7LH743UHNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Let me loop @Kasargod, Sandeep<mailto:sandeepk@ti.com>
Hi Sandeep
Kindly support a request for Linux.

BR
Shenghao Ding
From: Terry Sanders <linux@vertone.co.uk>
Sent: Wednesday, July 31, 2024 3:45 PM
To: Ding, Shenghao <shenghao-ding@ti.com>; Lu, Kevin <kevin-lu@ti.com>; Xu, Baojun <baojun.xu@ti.com>
Cc: alsa-devel@alsa-project.org
Subject: [EXTERNAL] Bug in tlv320adc3101 driver

Hi, There is a bug in the code for the tlv320adc3101 driver when setting up the D value for PLL. The D value is set via I2C using page 0 registers 7 (MSB) and 8 (LSB). The data sheet has the following information for the registers: "Page 0 /
ZjQcmQRYFpfptBannerStart
This message was sent from outside of Texas Instruments.

Do not click links or open attachments unless you recognize the source of this email and know the content is safe. If you wish to report this message to IT Security, please forward the message as an attachment to phishing@list.ti.com<mailto:phishing@list.ti.com>



ZjQcmQRYFpfptBannerEnd

Hi,



There is a bug in the code for the tlv320adc3101 driver when setting up the D value for PLL.



The D value is set via I2C using page 0 registers 7 (MSB) and 8 (LSB).  The data sheet has the following information for the registers:



     "Page 0 / Register 7 will be updated when Page 0 / Register 8 is written immediately after Page 0 / Register 7 is written"



and:



   "Page 0 / Register 8 must be written immediately after writing to Page 0 / Register 7"



The function that implements this is adc3xxx_setup_pll() in file    soc/codecs/tlv320adc3xxx.c line 1172 - 1189. The function is shown below:



static void adc3xxx_setup_pll(struct snd_soc_component *component,

                                                  int div_entry)

{

              int i = div_entry;



              /* P & R values */

              snd_soc_component_write(component, ADC3XXX_PLL_PROG_PR,

                                                           (adc3xxx_divs[i].pll_p << ADC3XXX_PLLP_SHIFT) |

                                                           (adc3xxx_divs[i].pll_r << ADC3XXX_PLLR_SHIFT));

              /* J value */

              snd_soc_component_write(component, ADC3XXX_PLL_PROG_J,

                                                           adc3xxx_divs[i].pll_j & ADC3XXX_PLLJ_MASK);

              /* D value */

              snd_soc_component_write(component, ADC3XXX_PLL_PROG_D_LSB,

                                                           adc3xxx_divs[i].pll_d & ADC3XXX_PLLD_LSB_MASK);

              snd_soc_component_write(component, ADC3XXX_PLL_PROG_D_MSB,

                                                           (adc3xxx_divs[i].pll_d >> 8) & ADC3XXX_PLLD_MSB_MASK);

}



In the function the LSB (register 8) is written first followed by the MSB (register 7). This is the wrong way around and should be swapped so that the MSB is written first.



Regards



Terry Sanders










