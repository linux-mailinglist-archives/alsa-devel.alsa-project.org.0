Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A66204E9
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:43:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D71316E8;
	Thu, 16 May 2019 13:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D71316E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558007007;
	bh=zwfrsd6fVFbC9QK56A9TCUlUqPoeb7ytAibFQ/XXWmI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GhInATmrKizav802CNvFLB57/LJV7YYgulY7btvVCBZ/ixHkfN6pidObfhNHLeP+Y
	 tZSFQ0B6lR77P8x5mlKVluFilHoRC18m8GzAWzOVWDm41iB+T9heNh5KqZ+gpitv1h
	 SVE72FpcUZIijsPE8UedYUEYAi2PlKILpKpuQJMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 608B8F8078F;
	Thu, 16 May 2019 13:41:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6B41F896CB; Thu, 16 May 2019 13:41:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130048.outbound.protection.outlook.com [40.107.13.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17720F896B6
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17720F896B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="NS2pIUb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnwYhVnYj8re0iH13rP+gtQeT+7/YKppgyWrUxadBFI=;
 b=NS2pIUb2ja+4QotS8uRzY6nCHBLodxt6nHMBVQ2qMNRcnlDpBFZ8yBrU8gJFwdTVNWYVC9hWnMlFPU9XMNeGyEo3JYGcZ9UHJ1kHmdh5swIvMJFfkzi+F5jOwoeg/8ST3wKgvErnIXgzw/gyrcO+3eB8FW6OAklZnzftFYL1Qw4=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6623.eurprd04.prod.outlook.com (20.179.235.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 11:41:46 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 11:41:46 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [alsa-devel] [PATCH V4] ASoC: cs42xx8: add reset-gpios in
 binding document
Thread-Index: AdUL3ELukXtmb23cTHK77vJAfmhcNw==
Date: Thu, 16 May 2019 11:41:46 +0000
Message-ID: <VE1PR04MB647937130B57B9C3F818F3DEE30A0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b45d59d6-3bcf-4e3f-133b-08d6d9f379e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6623; 
x-ms-traffictypediagnostic: VE1PR04MB6623:
x-microsoft-antispam-prvs: <VE1PR04MB6623D37932CD57E02FA794BBE30A0@VE1PR04MB6623.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(68736007)(66556008)(316002)(64756008)(74316002)(6916009)(486006)(186003)(3846002)(6116002)(53936002)(66446008)(71200400001)(71190400001)(76116006)(66946007)(26005)(73956011)(54906003)(86362001)(66476007)(478600001)(2906002)(33656002)(5660300002)(25786009)(9686003)(256004)(55016002)(6246003)(99286004)(1411001)(14454004)(229853002)(6436002)(4326008)(7696005)(81166006)(53546011)(6506007)(66066001)(476003)(8936002)(52536014)(102836004)(81156014)(305945005)(8676002)(7736002)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6623;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vQznmZMwgJN60XSsqJ1k0I2e/QwSa4eJzCR7IEE3ZOlFj+Ot5EUg4IFUzdeM1GMeou/nlHpDUoBE0L2LJcRi3KlGjdpy7ilHD94HT626G4wbfex+81uTlEo7O1iWp8O/OnyRNBHm9rfG+8UR6uFrlthbC8NBa8uK8636Wg5ZRKvUlLehGXZnHd7PIViVXwJXSZjTf0P9R491iTwll5u5sRKYcWX/WeTN9liEYMRMh2xCKWit6nU+yz8C0iGe77hiD6y03+SZenTcac92PMdeFamCqVDnzkdZwkPdMTtxkzT8G0QilUMtdTQYa4cFxOxXQc6rdmw12hYKvXEabRLZ/4Nw/i/uvntfWjD3euri+EqnKUye3sTshDpe2kAhSbX9q5Z3X5dloD7phWgj+OaIiAIMU1MprSFgLPOoVZ/PgaE=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45d59d6-3bcf-4e3f-133b-08d6d9f379e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 11:41:46.3546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
Cc: "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH V4] ASoC: cs42xx8: add reset-gpios in
 binding document
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

Hi

> On Thu, May 16, 2019 at 8:36 AM S.j. Wang <shengjiu.wang@nxp.com>
> wrote:
> 
> >  cs42888: codec@48 {
> > @@ -25,4 +30,5 @@ cs42888: codec@48 {
> >         VD-supply = <&reg_audio>;
> >         VLS-supply = <&reg_audio>;
> >         VLC-supply = <&reg_audio>;
> > +       reset-gpios = <&pca9557_b 1 1>;
> 
>  reset-gpios = <&pca9557_b 1 GPIO_ACTIVE_LOW>;  please
Ok, sent v5.

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
