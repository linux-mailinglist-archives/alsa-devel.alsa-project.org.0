Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC012E101
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 17:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F5D21654;
	Wed, 29 May 2019 17:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F5D21654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559143583;
	bh=VbntcXH1MtH9t/EanNCYV3X/Xz5LcsFyiQiThEAS8po=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LY4C7aW5noKzpfIFUQdpvjhEIh8ZInk0AbosoO69McYGvSmOugex+zz80cmNVzZub
	 sxFj8P6EmteCujXSwk6sVW8K+wflTgBx1eQG9fadQUIbjBo8Xh5A74tt9eAeU3cstW
	 WYQPRRFAaRsaYi0gYn/Xs7TxyhxvyNCAWOEd9cNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E27E6F896E0;
	Wed, 29 May 2019 17:24:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 144FEF896E4; Wed, 29 May 2019 17:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com
 [216.71.150.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E097F806E5
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 17:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E097F806E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="jKKEULHF"
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
X-IronPort-AV: E=Sophos;i="5.60,527,1549954800"; d="scan'208";a="33456938"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 May 2019 08:24:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 29 May 2019 08:24:28 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 29 May 2019 08:24:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Xrsg7mp2f9VAYnRBeQGEtJ0m7kmSOJ6Xmv+AgeOTlA=;
 b=jKKEULHFWi1TyyNAULUXQfu+2AtMYIBfloUBw6IQvkmmA94kpUpmrrbqkQS4MSoBAeLf6DVOPgTPD4hBQTJYhcIozPwMJA2djYWZOrfWS1nyrA6gXixvalofl/m6pfK9kRHqIW9W75T5yRTtuDaAqLGrh+fPmcfLYVNMVRXCF1Q=
Received: from CY4PR11MB1256.namprd11.prod.outlook.com (10.169.252.10) by
 CY4PR11MB1496.namprd11.prod.outlook.com (10.172.65.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Wed, 29 May 2019 15:24:26 +0000
Received: from CY4PR11MB1256.namprd11.prod.outlook.com
 ([fe80::e595:70a9:abee:aeb8]) by CY4PR11MB1256.namprd11.prod.outlook.com
 ([fe80::e595:70a9:abee:aeb8%4]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 15:24:26 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <kuninori.morimoto.gx@renesas.com>, <broonie@kernel.org>
Thread-Topic: [alsa-devel] [PATCH 065/145] ASoC: atmel: mikroe-proto: use
 modern dai_link style
Thread-Index: AQHVFjKZ7XJZ4hTQpUSj9mJLAJBV8Q==
Date: Wed, 29 May 2019 15:24:26 +0000
Message-ID: <d7af4dec-a808-fc97-0f36-5c6b3aa4b2c4@microchip.com>
References: <87sgt7p3zo.wl-kuninori.morimoto.gx@renesas.com>
 <877eajmaij.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877eajmaij.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::24) To CY4PR11MB1256.namprd11.prod.outlook.com
 (2603:10b6:903:25::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14116625-44e1-4993-0058-08d6e449bbef
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR11MB1496; 
x-ms-traffictypediagnostic: CY4PR11MB1496:
x-microsoft-antispam-prvs: <CY4PR11MB14965319CA211E0E048367ACE71F0@CY4PR11MB1496.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(136003)(376002)(39860400002)(189003)(199004)(316002)(110136005)(73956011)(446003)(6486002)(76176011)(102836004)(6506007)(66446008)(14444005)(81166006)(64756008)(66556008)(2616005)(86362001)(99286004)(66066001)(52116002)(8676002)(476003)(11346002)(6436002)(31696002)(66946007)(66476007)(81156014)(486006)(6116002)(3846002)(7736002)(71190400001)(71200400001)(8936002)(14454004)(26005)(186003)(2906002)(305945005)(31686004)(4744005)(68736007)(386003)(53546011)(5660300002)(72206003)(25786009)(53936002)(478600001)(4326008)(229853002)(36756003)(6512007)(6246003)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR11MB1496;
 H:CY4PR11MB1256.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zD9LB+NXneTS1YWkrCGBNF0/Qm8HqXBQTIG+lypKFOYWbvNfF2p3qiiNdRf8E24i7dsht2FnpfdSx4ECOqqeZEqhTN3NM6Ji+XyhCWA03nlWdcwrA3Hp3Tp/1c+dK1ELu0wSfcsbwB8A+VLNJos6RuxkToWnOoZEQAvsfnT7seNbIqFBXEvHvozWXLvv4UlDb7Kfe9JOZ2nZHQtgJmWw7BZKO+Ou54JeUbVxYTCpnUT3JqYDvlqNGhAnAaZH4yligVbRNw7ko+60O6ZJn1CJo+QsNy54RPUvgB97Bz+GoT1ZnZny2FwWjp/CdxGM64vZB0193PSLp6L7VyJINcjIWhc5QaJyfhHGNxCMdtODdyyeGGankodTnLP/47lFp2GEkj9iZg4VsOHLOVjjQBbSBq5DySq0HB7RkZm4KKai0S4=
Content-ID: <6DAB9C92DA18E9438D4F537681A49F77@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 14116625-44e1-4993-0058-08d6e449bbef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 15:24:26.0685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1496
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 065/145] ASoC: atmel: mikroe-proto: use
 modern dai_link style
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

On 22.05.2019 06:44, Kuninori Morimoto wrote:
> External E-Mail
> 
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> ASoC is now supporting modern style dai_link
> (= snd_soc_dai_link_component) for CPU/Codec/Platform.
> This patch switches to use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Tested-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Thanks,
Codrin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
