Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC6DAE252
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 04:24:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CB711664;
	Tue, 10 Sep 2019 04:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CB711664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568082240;
	bh=AJgkoT+zyZnZ6a5mFsR3TnXUn2wwMEfFW2xPGDPlElY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O+WuX1WQnP3JfS2jw83pwS4ZMKfPL2XwVpats+RG9drkLQOnB0dQGFHlnS9JQsYTP
	 XvmTnbn/sd1aAVcdez1Op2U+AfDV91NFdHl4DnC6qmpU/cPCuKdjeXGdJPGT+rknjd
	 mPmF+aztj/bbWJBxSDm/rf/3wbVAihd2HIeqj7Uw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 607FAF800A9;
	Tue, 10 Sep 2019 04:22:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EFFFF80368; Tue, 10 Sep 2019 04:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130077.outbound.protection.outlook.com [40.107.13.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50C1CF800A9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 04:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50C1CF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="dOPrJrhE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hac85i4Ybze1qWltxjXPi/UP7J3gvUJc5kvSt5tWowEMUi5Yyniwm+bqF7pKHU99iD5ePul57+0YW8n/GIXra1K67Gr1vBK0HLWp3ksmg2LpMOHvCXGg8jlrfoOPt+W2w5C9826NihtmlL+LTBnTwejJITaZVpN0h1Sks8GAuFHXL0ffo030UCqljAiy76GoyRnHckkrjvgMPXWZrEVyEdOvBOOtqb441jTGTJiDoQwAgNTDBgImafBDC9W143DqGFiKoUcqw4dgpUh/TK/xLg5jnq6g9gtSTZzUhY/7Yo9kVtgYy/2FmM8+RM2pSLUGPpSJwAokzGu9RhM+yjfKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=No3ctTFpXzweRSedArjwO/8+SYHAoCvKdfZu3TKJWx8=;
 b=VNVNNeYPCXBW6yahBmsT2HBbm5zqwDQBuQdZNQzoHABQMAXoTA3n9ectaurTGi91OdPT/aea6l+1LWI91eCzzp9M4OO3ssJysHPx0LdxiQb4o/HsvlsbslsXMPEXNQka2UPDmKcgEcLiJfcUEN9APKvQVTpVLaKYirj6nZ8ZoyfCC4gv70szWt/9Wi0NGGcybiCXHdFIRUsJxPML+0KR5vxL0EXrX0zRjM/2x3ZmC1H9+pK5XXGf64WIJhl08cR1xIMVpsmGwdBH48epoMRna3ftXjvkL3GvMiOtaPXCecQRFtBONsob13Cw2Ug/QCDcZKFUfujC0dz1FGQXBSPI5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=No3ctTFpXzweRSedArjwO/8+SYHAoCvKdfZu3TKJWx8=;
 b=dOPrJrhEM5zMXtKC5R+XK2U8DoBe39Iw2Vl6OQv3CLCQP58tRTfsXih/5sd0G1cwXHp3UveYxgdqs6jJzEEcyzEujVReTMjv+mNXzPJuygkaJDUp3rFSFYH3Ayjld1KzSYUJLL9EfzSao7zEqrp8jjJPg5RxjxPuKQGoQll4ogg=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Tue, 10 Sep 2019 02:22:06 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 02:22:06 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [EXT] Re: [PATCH 1/3] ASoC: fsl_asrc: Use in(out)put_format
 instead of in(out)put_word_width
Thread-Index: AQHVZ0mAeLH1tmnz60SUVq7w0GAb7KckKplg
Date: Tue, 10 Sep 2019 02:22:06 +0000
Message-ID: <VE1PR04MB6479D271F4271ECF404473E7E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <65e96ca15afd4a282b122f3ea8b13642cf4614c7.1568025083.git.shengjiu.wang@nxp.com>
 <20190909200156.GB10344@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190909200156.GB10344@Asurada-Nvidia.nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9990b7f9-2712-4b84-72a7-08d73595acf7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6479; 
x-ms-traffictypediagnostic: VE1PR04MB6479:
x-microsoft-antispam-prvs: <VE1PR04MB6479DE5863AF1C44681D582CE3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(53936002)(81166006)(14454004)(7736002)(55016002)(26005)(305945005)(52536014)(76176011)(2906002)(33656002)(6916009)(316002)(7416002)(9686003)(6436002)(54906003)(6506007)(102836004)(66476007)(66556008)(256004)(25786009)(1411001)(64756008)(8676002)(66446008)(229853002)(86362001)(3846002)(66066001)(476003)(71200400001)(446003)(4326008)(8936002)(71190400001)(5660300002)(76116006)(478600001)(66946007)(81156014)(99286004)(186003)(486006)(11346002)(6246003)(7696005)(74316002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6479;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: khDdeqQSy4Adt0azYaGDX/+ZEyZNC/8e4RSyezJqKWpUKqhCPwBTwbBG+6jJ9QfvcO5G9H14nsxuTqQ5qs0JWU1X99kVMu2k4VNnGDHC79dVc+EIba4ssRJ3ErgRK1bX6nAciANbeSe5FJIZb+8vWBvluqBbaZgOHciuXk6aFLDCu1hAlms3UrRLzdLv1V0rYkK+IZyAzhBmjvR4hC2RJiNyol8n98sbSF3st4F/hsgG0uAvIbLoFnL5w8LPGKnNvvwUjJMgj1Dsa1eKEzd9SfrtxjRMqMCfswS0XSyQZbOjwHhhA4b/eR88Xg0PONUM4tpPCe4mpDNUkwbR0CwOOguV3bMx1JkkdCBZ1wPUNdapVjha1xZg4PGEqthBKzHCGpuZUU4FPobBuu3z4mkZ6vAowgwybRun57H5cNPVN2A=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9990b7f9-2712-4b84-72a7-08d73595acf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 02:22:06.4121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8JJLXM9+bDxisu84w9pfEKEWxO28mnYvOIng2F9yuDc9r7dPaWbNGniCfgbNE6UEJsaDmq9NCdwwXflaRyTBQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH 1/3] ASoC: fsl_asrc: Use
 in(out)put_format instead of in(out)put_word_width
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
> On Mon, Sep 09, 2019 at 06:33:19PM -0400, Shengjiu Wang wrote:
> > snd_pcm_format_t is more formal than enum asrc_word_width, which
> has
> > two property, width and physical width, which is more accurate than
> > enum asrc_word_width. So it is better to use in(out)put_format instead
> > of in(out)put_word_width.
> 
> Hmm...I don't really see the benefit of using snd_pcm_format_t here...I
> mean, I know it's a generic one, and would understand if we use it as a
> param for a common API. But this patch merely packs the "width" by
> intentionally using this snd_pcm_format_t and then adds another
> translation to unpack it.. I feel it's a bit overcomplicated. Or am I missing
> something?
> 
> And I feel it's not necessary to use ALSA common format in our own "struct
> asrc_config" since it is more IP/register specific.
> 
> Thanks
> Nicolin
> 

As you know, we have another M2M function internally, when user want to
Set the format through M2M API, it is better to use snd_pcm_format_t instead the
Width, for snd_pcm_format_t include two property, data with and physical width
In driver some place need data width, some place need physical width.
For example how to distinguish S24_LE and S24_3LE in driver,  DMA setting needs
The physical width,  but ASRC need data width. 

Another purpose is that we have another new designed ASRC, which support more
Formats, I would like it can share same API with this ASRC, using snd_pcm_format_t
That we can use the common API, like snd_pcm_format_linear,
snd_pcm_format_big_endian to get the property of the format, which is needed by
driver.


Best regards
Wang shengjiu


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
