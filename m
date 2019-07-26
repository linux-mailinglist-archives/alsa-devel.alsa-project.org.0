Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C27639D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 12:35:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABDE62022;
	Fri, 26 Jul 2019 12:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABDE62022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564137323;
	bh=qi0aTYPs1513eHbmUGvTmj7/k1ArjEHPQ46Axl6YMZ0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WweXUbVzPHTaYDUQYr8Bg+Z9ndW/MeFMi3RmnkBxyOVbNEd14IrFEjWold5Fm7SQV
	 cG2IrKEFvYySKnqSqy8fBAqvoqz6VZf0Qj9mHvxzi3LYQHtzhzRHlZFmjBuKqpStSb
	 hipf5n65nTcKxd+RzbCHK8ml1C0EIus31h8TflUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15C75F803D5;
	Fri, 26 Jul 2019 12:33:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67533F80393; Fri, 26 Jul 2019 12:33:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com
 [216.71.150.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C316F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 12:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C316F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="truvjLMm"
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: eTtkL1603bg5grE+sDOmY7krle0rfGuxBl9hecE5BbyALyCKQ2TChJ+g7f88k5t6/lW3f1p0mt
 hxvpiTJVckDvkR1f/W6qURImCawkRgA+kL1hygGqGsQbAX7iCvPBvZU3Uwfr6+6b6XrzJ5V2HL
 3MauOuq4sWwFcbxxuUn8+XLqWrHY5/n5m4Zy5S2MuvJB8Gxv0VK8Y2QBSxKH1bJcei8yjHUHTc
 mzXdVRqicAgTF3pRldja5ayV4M9Is7GjiPBR0rDKOQzm7HU3KN1i/12u0+XEk8d6QrVPVHbMQu
 l14=
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; d="scan'208";a="41237623"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2019 03:33:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 26 Jul 2019 03:33:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 26 Jul 2019 03:33:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdGKnKxFKKSJsfRijnKi9MWfVKzJub9LbeBJP7L3AXXu9wu+nNsSK0/tnqDUK+gEoOHvzSiNOwi0PLcaFBFPpEIXKwVI1tPZ1injST4LdMYlYLvKI390wZX9ntLFxY/Ha2zwxbbbpRPcJJD1roPPKvcGnUtow1pp23xennHyuW09vibV/OvyiARetZwnye9khm7nN3RF6VNKSHd7BLGoz+SRFMY9XHyPtPY63S4RVUy87wtY+coGLRtchwegF9+H6MB084dzyf3rECpDnEIYDhoBg5p7itN+1UsuRGE/soDdWdMauItM3o8jFuzY1QyMzLajVj4DA2Blj2xn9i5SwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lpr1IqOeIqhJ+WiCH7Xlp5dCi/xSDZy69owvTcz/4Q=;
 b=SC5Oue+Bc8BViprEAXO7J4n4tAVCI9MkKdviVjGTuXfOtAUJTr+ELybgPjx0NtRwhB4qcGoitFNLmmuoF93pKHldlqEPQB+N2v5ix6fFjts5Mj2DgX/Oz8mGnZ3sxTk1QO2QQYzwoWWUIWGCBlCchFEwVVzVYneHc89qvneHScMfBERDqY+qj82jwRMhELaJJVhqM1CrvdG9oe0TAK65duVrG+hj6trN2TDpEvepPSRw+04AqBR/D27q/uB6S/b+K0ZVtalTLdu4qNrbTLCUVrJrrFCy3qv9likzQhS92OyrOro1EH8dHiTcQ55T0wDy3t5uhyPBSaSo8f9CBdMvyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lpr1IqOeIqhJ+WiCH7Xlp5dCi/xSDZy69owvTcz/4Q=;
 b=truvjLMm64ouyVM2oLIE3fNLqOscxj7lK0uDU8Jm21MtmYPgjmm1ydaoZ3zyvWcqPg/pePut4tvF7z6TPsq7oaXSl3fX1oJOJxCQQaZ1f0QgENwV++qNJZBL+3RO7ucsw7hl8No9AJT91v0xa7Zo+QvCH897s5niB8WIdMRFjQs=
Received: from BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) by
 BN6PR11MB4083.namprd11.prod.outlook.com (10.255.129.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 10:33:30 +0000
Received: from BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2]) by BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2%3]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 10:33:29 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <mirq-linux@rere.qmqm.pl>
Thread-Topic: [PATCH 5/5] ASoC: atmel_ssc_dai: Enable shared FSYNC source in
 frame-slave mode
Thread-Index: AQHVQLst19iR+YHt2kqsWucS2TVH/qbbcnMAgAA4eICAAQ60AA==
Date: Fri, 26 Jul 2019 10:33:29 +0000
Message-ID: <6fdbcec1-346f-9ebf-34e7-83b0ceaba404@microchip.com>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <107e0cfd11a31ce1558e941612e183100022930d.1563819483.git.mirq-linux@rere.qmqm.pl>
 <eabb96e7-1567-3ee1-a00e-f241c5f23c1c@microchip.com>
 <20190725182427.GA16245@qmqm.qmqm.pl>
In-Reply-To: <20190725182427.GA16245@qmqm.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR02CA0074.eurprd02.prod.outlook.com
 (2603:10a6:802:14::45) To BN6PR11MB0051.namprd11.prod.outlook.com
 (2603:10b6:405:65::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d4e47bc-7e7c-48c0-abd6-08d711b4b354
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB4083; 
x-ms-traffictypediagnostic: BN6PR11MB4083:
x-microsoft-antispam-prvs: <BN6PR11MB408379C91FA139CF4406073BE7C00@BN6PR11MB4083.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(366004)(199004)(189003)(25786009)(386003)(2906002)(36756003)(66556008)(102836004)(68736007)(81156014)(71200400001)(6506007)(8676002)(31686004)(81166006)(2501003)(66446008)(64756008)(66476007)(66946007)(3846002)(6116002)(2351001)(6246003)(6916009)(71190400001)(186003)(8936002)(26005)(305945005)(4326008)(99286004)(6512007)(486006)(53936002)(256004)(14454004)(66066001)(53546011)(229853002)(66574012)(54906003)(6486002)(7736002)(86362001)(6436002)(5640700003)(316002)(76176011)(31696002)(478600001)(476003)(52116002)(446003)(11346002)(14444005)(5660300002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB4083;
 H:BN6PR11MB0051.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j4lRSnypuJh7uSMZr4Aj7G3y1GLe6wTAHyQjBrLkgl++lzhMlmA4H19xlV1unr2ElB+uhmn6BFxeBxJw3bf4fJURzVUJrBQJd6V0Rmh5S7W3kWRvjT+AIxPSP4lAeLSNNI4RtuxQGctYah/zpSCoDDizer8IRWUVEUIF6Q5eroik0GHgqrWhI+jwYpdxtjT5lFJ3DcS00uvdQSqi8L77owQJu8kEUgovcGLnOJqKiM5+voff6ECr0mCFjDwobyG1MbZ3OXczcQIn62L733reoE36rD3Ln+RUV6eeyBCdnwKSj+oAcGcZc2IXQvqtE3ORivAH2Ssg/qgzumlZ7uRDceDsOLcbFSSHPbcX5FJkpMImdFuc9zpQ4Z4h/ZiXULOChBdEhpism3l5JTdp0kNtAl9Z5gEUW59Kk2aWg1gLOGY=
Content-ID: <E0358D04E5D2684EB4F205678C927E1F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4e47bc-7e7c-48c0-abd6-08d711b4b354
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 10:33:29.7820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4083
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com, tiwai@suse.com,
 Nicolas.Ferre@microchip.com, lgirdwood@gmail.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 5/5] ASoC: atmel_ssc_dai: Enable shared
 FSYNC source in frame-slave mode
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

On 25.07.2019 21:24, mirq-linux@rere.qmqm.pl wrote:
> External E-Mail
> =

> =

> On Thu, Jul 25, 2019 at 03:02:34PM +0000, Codrin.Ciubotariu@microchip.com=
 wrote:
>> On 22.07.2019 21:27, Micha=B3 Miros=B3aw wrote:
>>> SSC driver allows only synchronous TX and RX. In slave mode for BCLK
>>> it uses only one of TK or RK pin, but for LRCLK it configured separate
>>> inputs from TF and RF pins. Allow configuration with common FS signal.
> [...]
>>> @@ -613,10 +607,30 @@ static int atmel_ssc_hw_params(struct snd_pcm_sub=
stream *substream,
>>>    		return -EINVAL;
>>>    	}
>>>    =

>>> -	if (!atmel_ssc_cfs(ssc_p)) {
>>> +	if (atmel_ssc_cfs(ssc_p)) {
>>> +		/*
>>> +		 * SSC provides LRCLK
>>> +		 *
>>> +		 * Both TF and RF are generated, so use them directly.
>>> +		 */
>>> +		rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
>>> +		tcmr |=3D	  SSC_BF(TCMR_START, fs_edge);
>>> +	} else {
>>>    		fslen =3D fslen_ext =3D 0;
>>>    		rcmr_period =3D tcmr_period =3D 0;
>>>    		fs_osync =3D SSC_FSOS_NONE;
>>> +		if (!ssc->shared_fs_pin) {
>>> +			rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
>>> +			tcmr |=3D	  SSC_BF(TCMR_START, fs_edge);
>>> +		} else if (ssc->clk_from_rk_pin) {
>>> +			/* assume RF is to be used when RK is used as BCLK input */
>>> +			/* Note: won't work correctly on SAMA5D2 due to errata */
>>> +			rcmr |=3D	  SSC_BF(RCMR_START, fs_edge);
>>> +			tcmr |=3D	  SSC_BF(TCMR_START, SSC_START_RECEIVE);
>>
>> Did you find a platform in which this mode works?
> =

> To be exact: according to the errata, TX is delayed improperly. So if you
> use only RX (SSC side receives) direction, you're fine.

I know, but there are other platforms with SSC, which don't have this =

errata, like sam9x35 or sama5d3. Have you tested this mode, RK input, RF =

input, RD starts on edge detect, TF input, TD starts synchronously with =

receiver?

Best regards,
Codrin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
