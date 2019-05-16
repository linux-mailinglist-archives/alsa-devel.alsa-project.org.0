Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C67C1FF99
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 08:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6F7A16AB;
	Thu, 16 May 2019 08:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6F7A16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557988604;
	bh=q4CQKNCLPRzGP4ZrRJUuim8tidVlCH7iRXjh8w/psoY=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HoLfJ43fpBQFblbtm41DE5tWRAZEPP+dIKZzuZdB3JvuApXvBri2LcyoaoYAquukG
	 T5S4xY2igLFY4mBYW3uDPKu3OG1wtH0026MuMM/iMwtEFXxD7r5yLt5JMiqRCp0zno
	 Mfz5SK7v0J/4IftnKlbS9KmGVXE/OIUTCzQnaTM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F028AF80C18;
	Thu, 16 May 2019 08:34:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8579DF896B6; Thu, 16 May 2019 08:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140078.outbound.protection.outlook.com [40.107.14.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3652CF80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 08:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3652CF80C18
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="iqZsLhi4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqneXCghPGkkCY1ABo1mJhiTFkRxmhbjAa7EYdvsoa0=;
 b=iqZsLhi48BqkULnw1qfWN7W98Hm+ysYhzmEo0sPrRpkd4zmZWoZdZ5do7lv/Zv3sReFvug5rqVaERhsFcquinYt8kJitkNP3GTove6wXEPepM4RwfzWEPymd9LPyvMuoSAm3GAdDNJkK0dJLTi0H+uMvC0IpUe5jApYkhW3CwhM=
Received: from VI1PR0402MB3357.eurprd04.prod.outlook.com (52.134.1.18) by
 VI1PR0402MB3327.eurprd04.prod.outlook.com (52.134.8.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Thu, 16 May 2019 06:34:47 +0000
Received: from VI1PR0402MB3357.eurprd04.prod.outlook.com
 ([fe80::888f:9ea:6f65:508f]) by VI1PR0402MB3357.eurprd04.prod.outlook.com
 ([fe80::888f:9ea:6f65:508f%6]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 06:34:47 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "flatmax@flatmax.org" <flatmax@flatmax.org>, "S.j. Wang"
 <shengjiu.wang@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] ASoc : cs42xx8 : merge cs42xx8-i2c.c into cs42xx8.c
Thread-Index: AQHVC68PBeNq3trQCUiH57osz6clg6ZtS4kA
Date: Thu, 16 May 2019 06:34:47 +0000
Message-ID: <15b3a74a46f3c17f9240e5d90805e4056f80c55f.camel@nxp.com>
References: <e182bf72-c369-7344-e4d1-0524b09ca489@flatmax.org>
In-Reply-To: <e182bf72-c369-7344-e4d1-0524b09ca489@flatmax.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1d4d5d5-ad0a-42fd-2132-08d6d9c89743
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3327; 
x-ms-traffictypediagnostic: VI1PR0402MB3327:
x-microsoft-antispam-prvs: <VI1PR0402MB3327D4960D5B25D589116FC8F90A0@VI1PR0402MB3327.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(366004)(136003)(346002)(396003)(199004)(189003)(256004)(66946007)(6506007)(2201001)(4744005)(102836004)(3846002)(66556008)(476003)(64756008)(2616005)(44832011)(53936002)(66446008)(446003)(66476007)(8676002)(186003)(6246003)(76176011)(11346002)(6512007)(486006)(99286004)(76116006)(25786009)(6486002)(2906002)(86362001)(110136005)(229853002)(26005)(5660300002)(73956011)(6436002)(2501003)(36756003)(6116002)(68736007)(305945005)(14454004)(118296001)(478600001)(66066001)(71200400001)(8936002)(81156014)(71190400001)(81166006)(7736002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3327;
 H:VI1PR0402MB3357.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0XB5uQ4heXRx/RK86Uv35rEj/g8Xat88Zcwc3+7kf25s0pK35UD2boxyXDnt5+Pqrzvp37y22NNWcoGb5z3k4I88urZ/OaHnVpK362wW5aDQBpwv9czC83Rk26lBeUu5jUDbVhM/mok9ACWcR/oCYhKLO8lXiZQqffCGagLuLBDesf7ajlimfxYxNqhrQN/RFCvnYKYBk30O/F/w3ZntI6UNhsx7tK/5pCeC9dyZeUDhoRMwQzIxJOula2qWol0jNjcXV23E9yviqEgEugpvDs4K8HDsB97JVnevbBHAE+dmRn34ZXiE/zvkD7VJbzRuEW4ktb1EHXa8txlwqECgO0WFunc2rKHANtGZL1B0Alh0X16ysUtJHshBgRuPp40/l6Q/5w/YG1wef6YpeRgmFyrGVCihCy7lDzw8XrS+RH0=
Content-ID: <54999218004CDD4FA30925CF5C05F8F0@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d4d5d5-ad0a-42fd-2132-08d6d9c89743
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 06:34:47.3399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3327
Subject: Re: [alsa-devel] ASoc : cs42xx8 : merge cs42xx8-i2c.c into cs42xx8.c
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

Hi Matt,

On Thu, 2019-05-16 at 16:15 +1000, Matt Flax wrote:
> Do you think it would be a good idea to merge cs42xx8-i2c.c into
> cs42xx8.c ?

I think it is fine to keep this separate. The i2c code is clean
and easy to understand.

> 
> Is there a reason to keep these two related driver functions separate
> ?
> 

cs42xxx codec has also an SPI interface. If anyone wants to implement
support for that it would be easier with the current split.

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
