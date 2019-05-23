Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EA727B56
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 13:05:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B2421671;
	Thu, 23 May 2019 13:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B2421671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558609557;
	bh=AOGct2m9wxQN4HGX1ckS4hF9WrCBppS6MwM2HAjQXpY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g3MlSHXsfAWcyW9Lk9q8ZQo2gSbGN/wLiRa6Cm80P1mPOqK2/3gyfibE+nc0vbgM0
	 uyf3DOgmPhoQVBXsWc9lWp0M1Sr/qMDu6Ok+WOwIdW+3pqHkJq7Cg0P/qkbgM4I+Iw
	 SnXwM86ElWrfP99h/Hu4sBSdFNM2Xbblg5AAK+0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B93F89674;
	Thu, 23 May 2019 13:04:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8193F89674; Thu, 23 May 2019 13:04:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30044.outbound.protection.outlook.com [40.107.3.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29A31F80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 13:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29A31F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="ipB3oOSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWFXIUND1yhi6KvykPjcq7iJOBttnw+ZltAshOO+LFk=;
 b=ipB3oOSmZOXUwY+wouOPYgARl8OvunfdGvSLFxlkorpvISiwOqmhZj5yRB6nl8XVpR0AhPKAiAfPoxq5S8mbodJ7LW+e93T7xQsxs/IOAQUAgzPmlEtFtuKGPdWHUuX5Mjq6lN7CNJJxmASwoQYBizvfDhrreEIVwdFzs1c7c2M=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6383.eurprd04.prod.outlook.com (20.179.232.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Thu, 23 May 2019 11:04:03 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1922.016; Thu, 23 May 2019
 11:04:03 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: fsl_esai: fix the channel swap issue after xrun
Thread-Index: AdURVzqGXKVFB9wWT1W2rJfIdiMqrw==
Date: Thu, 23 May 2019 11:04:03 +0000
Message-ID: <VE1PR04MB6479FF8E1B55E9BE67E7B0ECE3010@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 975836e6-1c92-43ec-e790-08d6df6e5e21
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6383; 
x-ms-traffictypediagnostic: VE1PR04MB6383:
x-microsoft-antispam-prvs: <VE1PR04MB6383C7DF382309171A4AE1F8E3010@VE1PR04MB6383.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(7736002)(14454004)(73956011)(66476007)(66556008)(476003)(9686003)(305945005)(33656002)(478600001)(229853002)(26005)(74316002)(55016002)(66946007)(52536014)(5660300002)(64756008)(8936002)(256004)(186003)(81156014)(81166006)(8676002)(71200400001)(71190400001)(66446008)(76116006)(68736007)(6436002)(486006)(86362001)(2906002)(53936002)(3846002)(6116002)(6246003)(4326008)(316002)(2501003)(25786009)(6506007)(99286004)(7696005)(54906003)(66066001)(102836004)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6383;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z3UtjRWDhxyGSOeUEUjfz5HObGKR4du1nIVJx8IQ6wnvA1KMZCJG+CLT2mYV4Z3vTCRJNzxf9Yl6sX3zaSJPdrOIS+YtmIGcO98766jauftVLFYeR2AOWsQ2c5B5qID4e0OlgwUixoa5E05iR1r0dkirp338KmJBn+q3al9rDGEAmEOTh+RzJzzXyo0bqXjY31JyDRnLOrA2rQtJi1CCz7jUH8+rTKqLEMBt5rrjnbWjg11k2CogxyZZM44/nYkbkoVT4IveJJjxzbXxoSpiTlwb+EmN3jLUtOURXUx0wXPHSVmrp0AU5knKw/rklX4+j+4zQtll+N9yXsQ6EWE1UTNImxkV4focrVBALhmMiGF8fCaUPD2wuIvbAePKNy+eCYHENaYMCMOA22ufNeTeibfotxY/AyLaGdPZgKn4sFk=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975836e6-1c92-43ec-e790-08d6df6e5e21
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 11:04:03.7101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shengjiu.wang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_esai: fix the channel swap issue
	after xrun
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

> On Thu, May 23, 2019 at 09:53:42AM +0000, S.j. Wang wrote:
> > > > +     /*
> > > > +      * Add fifo reset here, because the regcache_sync will
> > > > +      * write one more data to ETDR.
> > > > +      * Which will cause channel shift.
> > >
> > > Sounds like a bug to me...should fix it first by marking the data
> > > registers as volatile.
> > >
> > The ETDR is a writable register, it is not volatile. Even we change it
> > to Volatile, I don't think we can't avoid this issue. for the
> > regcache_sync Just to write this register, it is correct behavior.
> 
> Is that so? Quoting the comments of regcache_sync():
> "* regcache_sync - Sync the register cache with the hardware.
>  *
>  * @map: map to configure.
>  *
>  * Any registers that should not be synced should be marked as
>  * volatile."
> 
> If regcache_sync() does sync volatile registers too as you said, I don't mind
> having this FIFO reset WAR for now, though I think this mismatch between
> the comments and the actual behavior then should get people's attention.
> 
> Thank you

ETDR is not volatile,  if we mark it is volatile, is it correct?

Bets regards
Wang shengjiu

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
