Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A353543248
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 05:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 117CB17D6;
	Thu, 13 Jun 2019 05:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 117CB17D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560394973;
	bh=dguxA7cZi112eudz3eO5jJzHstIhySMxBkxs78TyWko=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lM9aGvGD4mn3NrpbIPFweJe+1a0+qKvASozWKWNC251qcSSVbKeEj7rGbEl1JOpcd
	 RSRZ9lYvWybwPF9dQP6Bvxdw3iHYwVnLnpYhUJqer1PfwccYQR3mTRWmNdb9nw/QNO
	 JmYspWO3BenR93Xo7o+q8O2o4x7HtS3rH+uJem4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A686F896F1;
	Thu, 13 Jun 2019 05:01:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F1E3F80794; Thu, 13 Jun 2019 05:01:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80051.outbound.protection.outlook.com [40.107.8.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F699F80794
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 05:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F699F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="EtRqSs0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yL5M61+dLVUgU5eb/obmOGKRpmvxkGFbVItjRbFhac=;
 b=EtRqSs0z9Ocbth/pOfAdxMa2fapfDQKEEEXFB8fwzkC51+rU7K5ktM/ElG1nCtkei/WN86ufSbGmV8yIfRQwSUihJPHber1qoF70awH/6n0thjnj6fEgyEotRYLg2kFRfaScJ+5zjq286ilGmSmAZHFajzjWIm0wJUCmIHfjV9g=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6688.eurprd04.prod.outlook.com (20.179.235.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Thu, 13 Jun 2019 03:00:58 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1987.010; Thu, 13 Jun 2019
 03:00:58 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>
Thread-Topic: [RFC/RFT PATCH v2] ASoC: fsl_esai: Revert "ETDR and TX0~5
 registers are non volatile"
Thread-Index: AdUhkxXnpB3dbv39SZ66Nf7IqVutFQ==
Date: Thu, 13 Jun 2019 03:00:58 +0000
Message-ID: <VE1PR04MB6479D4B1D5F00B07C5CECC5BE3EF0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cd8986e-c323-4144-5799-08d6efab5c32
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6688; 
x-ms-traffictypediagnostic: VE1PR04MB6688:
x-microsoft-antispam-prvs: <VE1PR04MB6688C9F4D37529BF375514FEE3EF0@VE1PR04MB6688.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(376002)(136003)(366004)(189003)(199004)(14444005)(9686003)(256004)(305945005)(14454004)(99286004)(33656002)(486006)(7736002)(68736007)(478600001)(7696005)(186003)(6506007)(2501003)(26005)(8676002)(73956011)(229853002)(55016002)(6246003)(6116002)(81156014)(76116006)(66476007)(66066001)(52536014)(64756008)(316002)(66556008)(6436002)(8936002)(7416002)(4326008)(71190400001)(81166006)(74316002)(476003)(102836004)(54906003)(71200400001)(2906002)(5660300002)(66446008)(66946007)(25786009)(86362001)(3846002)(53936002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6688;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ooH8LHpVo4O/v4bkbKou+2a2d0xnpBiQceLog/d0JDl+Bjn318L1JLkwMbi6LxEIZWBmTRqYcoSmKwmoyrhfUWv3EsKXcjM9mJfIg9e7eJEBTXrjvdepvuCkmXxuSJyCOXclXH2A6XCIJkvxDs5hLg0DFjIJTBgmzplZKD9NO0lMthttOoVOUljlITxOHb/p4bU/r7wxMfkhIjja4oFxxMFPD/TJFQq5GBQdDKbG2Y6KAbscX0sfqZ752iN2PGMlG8+arDnMSr9lqNTBh5wQQ12Dszb/fFw5B9DsBz28KU0wh5TOJmY4q0zwT6fUpB54uIbO/aJHSQ8H1CY792RnXvXpu9i0jx3R0+sjS3ZSaumgq2Dc3PxFq4U5mcaC8SnETzjEmzIYl2oAsq7mhYVU/TkoFI5PhrrWRKFmnRTTCf0=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd8986e-c323-4144-5799-08d6efab5c32
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 03:00:58.3573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shengjiu.wang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6688
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [RFC/RFT PATCH v2] ASoC: fsl_esai: Revert "ETDR
 and TX0~5 registers are non volatile"
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
> Commit 8973112aa41b ("ASoC: fsl_esai: ETDR and TX0~5 registers are non
> volatile") removed TX data registers from the volatile_reg list and appended
> default values for them. However, being data registers of TX, they should
> not have been removed from the list because they should not be cached --
> see the following reason.
> 
> When doing regcache_sync(), this operation might accidentally write some
> dirty data to these registers, in case that cached data happen to be
> different from the default ones, which might also result in a channel shift or
> swap situation, since the number of write-via-sync operations at ETDR
> would very unlikely match the channel number.
> 
> So this patch reverts the original commit to keep TX data registers in
> volatile_reg list in order to prevent them from being written by
> regcache_sync().
> 
> Note: this revert is not a complete revert as it keeps those macros of
> registers remaining in the default value list while the original commit also
> changed other entries in the list. And this patch isn't very necessary to Cc
> stable tree since there has been always a FIFO reset operation around the
> regcache_sync() call, even prior to this reverted commit.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Hi Mark,
> In case there's no objection against the patch, I'd still like to wait for a
> Tested-by from NXP folks before submitting it. Thanks!

bool regmap_volatile(struct regmap *map, unsigned int reg)
{
        if (!map->format.format_write && !regmap_readable(map, reg))
                return false;


Actually with this patch, the regcache_sync will write the 0 to ETDR, even
It is declared volatile, the reason is that in regmap_volatile(), the first
condition

(!map->format.format_write && !regmap_readable(map, reg))  is true.

So the regmap_volatile will return false.

And in regcache_reg_needs_sync(), because there is no default value
It will return true, then the ETDR need be synced, and be written 0.

Here is the code for regcache_default_sync()

static int regcache_default_sync(struct regmap *map, unsigned int min,
                                 unsigned int max)
{
        unsigned int reg;

        for (reg = min; reg <= max; reg += map->reg_stride) {
                unsigned int val;
                int ret;

                if (regmap_volatile(map, reg) ||
                    !regmap_writeable(map, reg))
                        continue;

                ret = regcache_read(map, reg, &val);
                if (ret)
                        return ret;

                if (!regcache_reg_needs_sync(map, reg, val))
                        continue;

                map->cache_bypass = true;
                ret = _regmap_write(map, reg, val);
                map->cache_bypass = false;

Best regards
Wang shengjiu


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
