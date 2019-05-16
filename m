Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 655FF20422
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2C5616B4;
	Thu, 16 May 2019 13:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2C5616B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558005080;
	bh=UNUbgCr1tMSu5g8DnkuvmK6SlXHwwHda33qMfIUw4MQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vnnq0MQ3z9a3TZ3fYk3nMFX7oB4KMMxIbg/a4dy5GFdBuf/B8qYxDhy0IxFrkgklY
	 agvNSUO36+Mv9M9RxBavFQQFh1dLp8noi1OMme1ALWkkNcz8saVEcrGgigEZHA0sXr
	 IxDXVQwMUBPo7rWLXNedHOqXn4rtinx/jTdUxEJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B6CF896B9;
	Thu, 16 May 2019 13:09:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82D1DF896B6; Thu, 16 May 2019 13:09:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C967F806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C967F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="Q1DVpMIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXrwXc4fc+g00utorZ0Nb9cmzraEM3mU5PZ8qRlBZQM=;
 b=Q1DVpMIyfZMZpkUrXD06cB1dVDz2CasyDWLYZW3hUVGEAVD0bPTxZvyTPXFJX3nAAee5t4x9rGtjU/aikUyi3mOfks1U4HSaidMIMX9ErDDrBNGSGiZFzMZPwBfRjZw2IdWvMSZkHmIUYcysSs7oA1pc4T76tfPMR9LCRLutc4U=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6446.eurprd04.prod.outlook.com (20.179.232.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 11:09:27 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 11:09:27 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH V2] ASoC: cs42xx8: Add reset gpio handling
Thread-Index: AdUL17zEZXZ5WMhBSxKtqwI7wVoUIA==
Date: Thu, 16 May 2019 11:09:27 +0000
Message-ID: <VE1PR04MB64790C7A0C1C068503038FDEE30A0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c760b800-32fb-4aff-51fa-08d6d9eef607
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6446; 
x-ms-traffictypediagnostic: VE1PR04MB6446:
x-microsoft-antispam-prvs: <VE1PR04MB6446F35AC8604DB170BF3CC1E30A0@VE1PR04MB6446.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:393;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(366004)(199004)(189003)(76116006)(66556008)(64756008)(66446008)(68736007)(52536014)(66476007)(305945005)(7736002)(81166006)(102836004)(8676002)(81156014)(66066001)(476003)(6116002)(3846002)(66946007)(4326008)(256004)(186003)(25786009)(6506007)(14444005)(26005)(6916009)(486006)(71200400001)(71190400001)(7696005)(14454004)(9686003)(54906003)(73956011)(316002)(99286004)(6436002)(53936002)(4744005)(2906002)(86362001)(478600001)(5660300002)(33656002)(8936002)(55016002)(6246003)(229853002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6446;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hihky8Ner/B6gjPbfjcS4gI/a3NwVjhsMGBvyXtvQXI0hl6in9EvBEVPw0g2+M0rND5ahbfo0oSDRS5e2VOY63v/v5pWIveH021XHY0vP//4je/zje6+2AQdT8cCet/LB/f1Sa2PcS2GlDl9SMvGtDvE42mBW340YxI/InfTbYg7Bif5cpVhrK4mft2nhwhV8rNfoPxTHrz61gMtiC1RqgLdsNFHueKdVbVvLRNqlpPbMZEtM/pxWw9BjWUkDaTn/LMhcLZY7emh4j6gIpA0ag1DdzPsQTae4H2bpaHpiaSzEyY3yJidKVwnZ1aY2EpzFHxbAoljSQjLU1QLyfmQHKTQdJVT4E4s4SlY/2ZDMGP60+6HZcpR7WnYhNowOFG5gLOwQL6Grhtd8ATEI+UBWmeShkKoZMqmj3mkybw2xZ8=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c760b800-32fb-4aff-51fa-08d6d9eef607
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 11:09:27.1523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6446
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH V2] ASoC: cs42xx8: Add reset gpio handling
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

> 
> On Thu, May 16, 2019 at 06:04:58AM +0000, S.j. Wang wrote:
> 
> > +	cs42xx8->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
> > +							GPIOD_OUT_HIGH);
> > +	if (IS_ERR(cs42xx8->gpiod_reset))
> > +		return PTR_ERR(cs42xx8->gpiod_reset);
> 
> You also need a binding document update for this.
ok, will send v3

best regards
wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
