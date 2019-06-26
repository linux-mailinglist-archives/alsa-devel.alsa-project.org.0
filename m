Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D656874
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 14:18:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 479E41686;
	Wed, 26 Jun 2019 14:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 479E41686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561551511;
	bh=SOA4GmkyessaxRZ3kwbx3xlERFUUKIWmMMOZ9KE1PC0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKarkNL6wGINFbwpww3+QCrbYEwVcyAnLG5r/zNXPWfM1POEVweA6cD+xfg9cdsjv
	 cftV8K22SKYp30S+biSP9cxKhbbKzfukeH5AieXF38AKSfkwMzJW3yFbBZ6u5e/zyw
	 I6zEnl510PfMjkPD+bIuQQmaxZ2kkMtPKD3DfakU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0106F896B9;
	Wed, 26 Jun 2019 14:16:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC842F896B9; Wed, 26 Jun 2019 14:16:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43CB0F806F0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 14:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43CB0F806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="3/c4QrXA"
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,419,1557212400"; d="scan'208";a="39089860"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jun 2019 05:16:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 26 Jun 2019 05:17:48 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 26 Jun 2019 05:17:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKJdxR4RNBZ/w1GwTev91D/A1GAl3Zh0jIGu607L+fY=;
 b=3/c4QrXAnWkg1I2o8nIyxFR9PbZPnCQjfo5d8wGTiQ54p6Dx+UxDzggZybktDhCcH4n1bEXBEP1B221TBKsxfHj6h/xe/6Q/3XyiIyT0eKacxu/CmYHUmmlZP3msRjUsfdnYjHeDgYJ1nvmJvuKYXnUm8lKNdk7QlGj+tX8APQg=
Received: from BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) by
 BN6PR11MB1602.namprd11.prod.outlook.com (10.172.22.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 12:16:36 +0000
Received: from BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::b979:a7e7:97e:7098]) by BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::b979:a7e7:97e:7098%2]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 12:16:36 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>
Thread-Topic: [PATCH 2/2] ASoC: codecs: ad193x: Reset DAC Control 1 register
 at probe
Thread-Index: AQHVLA0AdrFhnpOmb06sug+VlL6ySaatyxCAgAAOyoA=
Date: Wed, 26 Jun 2019 12:16:35 +0000
Message-ID: <60a36381-f2f3-18de-3f7c-4e51fc75445e@microchip.com>
References: <20190626104947.26547-1-codrin.ciubotariu@microchip.com>
 <20190626104947.26547-2-codrin.ciubotariu@microchip.com>
 <20190626112331.GB5316@sirena.org.uk>
In-Reply-To: <20190626112331.GB5316@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:800:90::21) To BN6PR11MB0051.namprd11.prod.outlook.com
 (2603:10b6:405:65::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45910852-91f0-421c-e1a3-08d6fa30220a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1602; 
x-ms-traffictypediagnostic: BN6PR11MB1602:
x-microsoft-antispam-prvs: <BN6PR11MB160219AF8C1F36FE31E062C5E7E20@BN6PR11MB1602.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(366004)(376002)(39860400002)(199004)(189003)(14454004)(6486002)(8936002)(26005)(99286004)(76176011)(36756003)(72206003)(53936002)(4744005)(316002)(102836004)(186003)(256004)(6436002)(3846002)(8676002)(2906002)(6116002)(478600001)(52116002)(68736007)(81166006)(81156014)(305945005)(486006)(6916009)(4326008)(86362001)(54906003)(7736002)(31696002)(66066001)(31686004)(229853002)(6246003)(25786009)(71190400001)(66556008)(71200400001)(6512007)(6506007)(386003)(53546011)(66946007)(73956011)(66476007)(11346002)(476003)(446003)(2616005)(66446008)(5660300002)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1602;
 H:BN6PR11MB0051.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gls5iOkaOOg4oHV6RDmtB+lmhrHxIJD3XZ7okAssKazrqPnrlFLdsen5FL5YnKfzsAlAf6biPRgoU4M6+TTUBOuTYXes9y6jEV1jxQ3cct2beSXPE2R8F9g7CUFCJThMxUuYMWdIMz6pgLb51HDUaTSjYuZE7h7ELUlyp9EWs5DrnJQuvvnqknbZGeV4FLPjkxmaNhNhQ/ByMTkQiBN72AgDVlp0Tx74+S9vm4M4mfwrTbAvdUTK1QcMM7aRWRyWx76FTpdxSP/2gLyXKAy+RrVB37eecWEtuhOWLFXOoi2PrQDyzR6BElo8vzSRNqlZKOSAAjJfILf2c2NKxxwylyeATqPpewmpTQ7UJdEIg5AK4OoLjUdvJD3hFEH+66KsrLRZAlD0iGhC3MoukCRoJc2SnH7onrQ1heeuEqJ9NwE=
Content-ID: <56F9F74196D8B244A690BADBF5F0899C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 45910852-91f0-421c-e1a3-08d6fa30220a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 12:16:36.0074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1602
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: codecs: ad193x: Reset DAC
 Control 1 register at probe
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

On 26.06.2019 14:23, Mark Brown wrote:
> On Wed, Jun 26, 2019 at 01:49:47PM +0300, Codrin Ciubotariu wrote:
>> Since the ad193x codecs have no software reset, we have to reinitialize the
>> registers after a hardware reset. For example, if we change the
>> device-tree between these resets, changing the audio format of the DAI link
>> from DSP_A with 8 TDM channels to I2S 2 channels, DAC Control 1 register
>> will remain configured for 8 channels. This patch resets this register at
>> probe to its default value.
> 
> Would it not be more robust/complete to have a set of register defaults
> and write the whole lot out rather than individually going through and
> adding writes for specific registers as needed?
> 

It would indeed. I will make two patches, one that implements what you 
suggested, for the registers that we touch only, and another one that 
will add AD193X_DAC_CTRL1 to these defaults. You can drop this patch.

Thanks and best regards,
Codrin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
