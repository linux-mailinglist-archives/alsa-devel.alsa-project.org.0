Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A5C4347E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 11:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2075F17E0;
	Thu, 13 Jun 2019 11:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2075F17E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560417029;
	bh=plShrpeYd5MixcAzYlrI+Pdi3O1tDDfcnX5981VO4GU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bA4/QFQ543QbVmqD21Njrppo+gWnx/xsF4T+jpVxJTbWm62ueXqfY9kdOrtyMVwWL
	 efdgHSghXjXTOUPtqnE4aRcRAhXmD6mf5bRNlnIxrlI0wms71m30tcWX4wXrBetCap
	 DKDHlPhnB8t/MKIC4fQDoURn0K8sLc9vhqAIL9Pg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69278F89711;
	Thu, 13 Jun 2019 11:08:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70CC6F89703; Thu, 13 Jun 2019 11:05:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50118.outbound.protection.outlook.com [40.107.5.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAD70F80794
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 11:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD70F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="nq0kSMqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vemiUvP6gECFgPEBfsenCN7aavZmFeTwt01FNNpaRo=;
 b=nq0kSMqRdGUOmYOqs53uREpcz3CKQ1ncmKUPtB0puiPfSbLuth9pEUgp9rYwfCWV0L+O99UMPAUaxz1ZfQV/VuwnSREyNYyqjuSuos6Ue7EWvUaMVJODbWJ3pD6fe/tBwQGU9/vqUf/yFhuM5vWVAupelgAHJ8U5O5MN40oaVbc=
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com (20.179.26.150) by
 VI1PR05MB5599.eurprd05.prod.outlook.com (20.177.203.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 09:05:09 +0000
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c]) by VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c%6]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 09:05:09 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "festevam@gmail.com" <festevam@gmail.com>, Oleksandr Suvorov
 <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v1 1/6] ASoC: sgtl5000: Fix definition of VAG Ramp Control
Thread-Index: AQHVD9h2Jvq9SRrSGEWyDMAz3sEU8KaZboEA
Date: Thu, 13 Jun 2019 09:05:09 +0000
Message-ID: <79fa1a0855bfcc1abad348aa047e7a69fffb8225.camel@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
 <20190521103619.4707-2-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190521103619.4707-2-oleksandr.suvorov@toradex.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdf313a1-3feb-415b-1c04-08d6efde3c45
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR05MB5599; 
x-ms-traffictypediagnostic: VI1PR05MB5599:
x-microsoft-antispam-prvs: <VI1PR05MB559960DEB780C535A821C257FBEF0@VI1PR05MB5599.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(39850400004)(366004)(346002)(136003)(189003)(199004)(305945005)(186003)(118296001)(6636002)(11346002)(229853002)(26005)(6486002)(316002)(71190400001)(7736002)(71200400001)(54906003)(86362001)(478600001)(110136005)(14454004)(3846002)(6246003)(81156014)(99286004)(36756003)(76176011)(8676002)(6506007)(53936002)(476003)(6512007)(256004)(5660300002)(25786009)(81166006)(14444005)(6436002)(8936002)(66446008)(66066001)(4326008)(2501003)(66556008)(66476007)(64756008)(68736007)(66946007)(76116006)(44832011)(2616005)(2906002)(6116002)(486006)(446003)(102836004)(73956011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB5599;
 H:VI1PR05MB6477.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 57WpHKHDl1EOrtYbZTcQAjJ/2PcSH6zdaYw3RLy34RCJg41K9foeAK0geGQ6xzTp3uBFMXRGzCZIk7VA3zaX3Yn6ym758rhwIeIHIPI6GuCjDZ5hleMoGxyAO+orT5i/AFEhjvn3GqdCkK7sBZIsuxC4Tf1cnKiJwCC3duwjc+HTxgZGjF3cmCjyVRkiNg25o2kLQsRAieqf99VJmjA55C5qW1XHHnl0YjyxRcGCL39Imy5IKkH+RdSg8fe4Y8+MRnNLJAhy3V/QZNY4K16RzWDzszh5OWFFKKzX37Etkl2shdMs4y3FQeB7ArHfWZKag8YL1EPNTySY2ei+2IfNyRe51aFXKa7RjMOCH8cDXzgab26lXlwNRJy2e97QuRkg2LnVQrla+a1OZU5VMFzqszULM9wQwvjXgqyU8ybPxaQ=
Content-ID: <076A28A3E55D844EA3B5769359C1B9E2@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf313a1-3feb-415b-1c04-08d6efde3c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 09:05:09.1514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: marcel.ziswiler@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5599
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v1 1/6] ASoC: sgtl5000: Fix definition of
	VAG Ramp Control
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

On Tue, 2019-05-21 at 13:36 +0300, Oleksandr Suvorov wrote:
> SGTL5000_SMALL_POP is a bit mask, not a value. Usage of
> correct definition makes device probing code more clear.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

> ---
> 
>  sound/soc/codecs/sgtl5000.c | 2 +-
>  sound/soc/codecs/sgtl5000.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git sound/soc/codecs/sgtl5000.c sound/soc/codecs/sgtl5000.c

I'm not sure how exactly you generated this patch set but usually git
format-patch inserts an additional folder level called a/b which is
what git am accepts by default e.g.

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c

> index a6a4748c97f9..5e49523ee0b6 100644
> --- sound/soc/codecs/sgtl5000.c
> +++ sound/soc/codecs/sgtl5000.c

Of course, the same a/b stuff applies here:

--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c

> @@ -1296,7 +1296,7 @@ static int sgtl5000_probe(struct
> snd_soc_component *component)
>  
>  	/* enable small pop, introduce 400ms delay in turning off */
>  	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_REF_CTRL,
> -				SGTL5000_SMALL_POP, 1);
> +				SGTL5000_SMALL_POP,
> SGTL5000_SMALL_POP);
>  
>  	/* disable short cut detector */
>  	snd_soc_component_write(component, SGTL5000_CHIP_SHORT_CTRL,
> 0);
> diff --git sound/soc/codecs/sgtl5000.h sound/soc/codecs/sgtl5000.h
> index 18cae08bbd3a..a4bf4bca95bf 100644
> --- sound/soc/codecs/sgtl5000.h
> +++ sound/soc/codecs/sgtl5000.h
> @@ -273,7 +273,7 @@
>  #define SGTL5000_BIAS_CTRL_MASK			0x000e
>  #define SGTL5000_BIAS_CTRL_SHIFT		1
>  #define SGTL5000_BIAS_CTRL_WIDTH		3
> -#define SGTL5000_SMALL_POP			1
> +#define SGTL5000_SMALL_POP			0x0001
>  
>  /*
>   * SGTL5000_CHIP_MIC_CTRL
> -- 
> 2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
