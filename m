Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D71A6AE255
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 04:26:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 530AE166E;
	Tue, 10 Sep 2019 04:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 530AE166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568082395;
	bh=i7cFIBuPOtEG/iVwcAMOaj273K2eIR9DUUN++Ll0Rww=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWWijji2XH7ZB/Sfj2ytdUtJVFT3R3N6CGOQZY+vxBmuXgzNTWbiCOxbqJvtX1jju
	 84qYM32kBZvdy2xG0yyRnG+YSp0tXccGHsw8jPVqlEmisqAPMzL33r6g0KAWdSgE7b
	 QW/mPzREAfZwUvDrgj1q7ECr9CSJsKWRUP7pzTd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64643F80321;
	Tue, 10 Sep 2019 04:24:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5927EF80368; Tue, 10 Sep 2019 04:24:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,SPF_HELO_PASS autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDCFAF800A9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 04:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDCFAF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="Ar5Woo5m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGrgJXH11geTd5cl5wHh8r2ekpOt7Py4IS7NOdeWtRnAO+Z0UdCfBu2nDOTnxKvUB2Xme2Jb+G1mFXwOi2gAUrLXEPqKwMJw+sJUuS6uQ40976JSt+iIkTOPZP1Wfch06boiyVwLyGh0UuAnJLYM6hi8Y6JnxwQSiEUQpWie+IEJRBLFJA8NyaJHdDBwc24urrWwM8ObKxY/SrLrgSSQzaVZSKppgN2veUfm7Um/7bNGEotNEnOz2qeFfJs2TxGiGLwn3E7oH/ZPhabWpT3p73bI3jzoC2Pguu1O9ktq4/HKoVacpWsHv1P8RmeG4kt+5iEHgEGeS4O9GvSgGNKFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdiaonOFDubgYIr8S+S+o9VxHyYersRibCwvHrh5reY=;
 b=WQ0pbpkvSLDROtEPIu3lCjKY3221uQnpddOkoHvf1piG3+gT1rWD63jycGh8Io8MkZhW1uIJ0ob2mBhdru92oNNNuQ0D+KJlAEGr/xK0WtNtaOUKicsZ0o+28n41b5gGi33XR+wOZdoN5YxAujgYDrvFAIIs4RXfASNVPCm/NVVKeI/upEaSnqRqLoPv4K5O7eWlOLQpdFYMtQ6wpzSbTs9hrSFPBO/EsjyExDx14ZCJlCZolhMCFYO+XHlr+ugIpvg8J5mw6RRLZnlCxbXr9DnMSS9FYFW6AhVBzFQGGNqLu4crMw3DSKHWsS3imtPPqmvXvel/07tmspfEwe13uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdiaonOFDubgYIr8S+S+o9VxHyYersRibCwvHrh5reY=;
 b=Ar5Woo5muJI8egLgj7IQmIU2YpC5dRfRT7nms2UlUuELf8hB7mnrYu0hBH49BbEQBwN26o6t8yuMz5yIL6xsEZR+h7Kokp7dFvqMM64qSxBu4swjqyBSdnfCv6aJkHy/4mHz0wb7r1Sozg4YO/7qBkxtaHMo69AnKeoZbE6TxgM=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Tue, 10 Sep 2019 02:24:43 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 02:24:43 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [EXT] Re: [PATCH 3/3] ASoC: fsl_asrc: Fix error with S24_3LE
 format bitstream in i.MX8
Thread-Index: AQHVZ3pvowRNFUg35EqaOi9AfKWf6ackLjzQ
Date: Tue, 10 Sep 2019 02:24:43 +0000
Message-ID: <VE1PR04MB647982DF7060E527385CE50CE3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <2b6e028ca27b8569da4ab7868d7b90ff8c3225d0.1568025083.git.shengjiu.wang@nxp.com>
 <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cb21239-7f47-40ad-f24c-08d735960a90
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6479; 
x-ms-traffictypediagnostic: VE1PR04MB6479:
x-microsoft-antispam-prvs: <VE1PR04MB64799ADBCAF5DFE92A11E5D7E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(53936002)(81166006)(14454004)(7736002)(55016002)(26005)(305945005)(52536014)(76176011)(2906002)(33656002)(6916009)(316002)(7416002)(9686003)(6436002)(54906003)(6506007)(102836004)(66476007)(66556008)(14444005)(256004)(25786009)(1411001)(64756008)(8676002)(66446008)(229853002)(86362001)(3846002)(66066001)(476003)(71200400001)(446003)(4326008)(8936002)(71190400001)(5660300002)(76116006)(478600001)(66946007)(81156014)(99286004)(186003)(486006)(11346002)(6246003)(7696005)(74316002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6479;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BgrHQK+sWsfjsXE5Auklv9urfSGQdgaGrMxXpPiRhyl6hQTGxjSQD2SyrWH4+uMrCflR43kSz8MWu/OZWu309epJ2DqAPOUU9nVCeI+7wUVWBnPm8x2BHevpGVqLOEge0XeyumT+3CSN204fb/pIcHvJKImaDD3l0SYHzF+owRloDNEpimxD/iBruiu5eyj/Jaejj0lwVqN2/1Ab9KAQy3kcGfLzc0/PayMDsLbWroZOSII/2Z9HWc3kcvQP/rLKNc8EIMxTazSxUCTIEVD0Jgb9yjyesLGLQU7aeVJm19AOTuumLxb90gYxnzGlf277EHnZNZErPfyw890j3k9OA/XQwdYWRHZ+ijBvYiHE/PjWcnOlLDVJ5HQB8HuiX9Fdfotegiqyp22qQGwC2U5CAOnITUq3vPLZsjjA+D0k3gI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb21239-7f47-40ad-f24c-08d735960a90
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 02:24:43.4552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNDOFIlEyftPpeGQwGGFVDk3mFnLDoDHddpjfkXCakqBvtzHZfT+Kjm4odur2pA0ipPXri547e5wwItOLEQkXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH 3/3] ASoC: fsl_asrc: Fix error
 with S24_3LE format bitstream in i.MX8
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
> On Mon, Sep 09, 2019 at 06:33:21PM -0400, Shengjiu Wang wrote:
> > There is error "aplay: pcm_write:2023: write error: Input/output error"
> > on i.MX8QM/i.MX8QXP platform for S24_3LE format.
> >
> > In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
> > sample, but we didn't add any constraint, that cause issues.
> >
> > So we need to query the caps of dma, then update the hw parameters
> > according to the caps.
> 
> > @@ -285,8 +293,81 @@ static int fsl_asrc_dma_startup(struct
> > snd_pcm_substream *substream)
> >
> >       runtime->private_data = pair;
> >
> > -     snd_pcm_hw_constraint_integer(substream->runtime,
> > -                                   SNDRV_PCM_HW_PARAM_PERIODS);
> > +     ret = snd_pcm_hw_constraint_integer(substream->runtime,
> > +                                         SNDRV_PCM_HW_PARAM_PERIODS);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to set pcm hw params periods\n");
> > +             return ret;
> > +     }
> > +
> > +     dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
> > +
> > +     /* Request a temp pair, which is release in the end */
> > +     fsl_asrc_request_pair(1, pair);
> 
> Not sure if it'd be practical, but a pair request could fail. Will probably need
> to check return value.
> 
> And a quick feeling is that below code is mostly identical to what is in the
> soc-generic-dmaengine-pcm.c file. So I'm wondering if we could abstract a
> helper function somewhere in the ASoC core: Mark?
> 
> Thanks
> Nicolin
> 
Yes, it refers to the code in soc-generic-dmaengine-pcm.c, if there is a common
API, this is helpful.

Best regards
Wang shengjiu

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
