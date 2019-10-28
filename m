Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C7E6D88
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 08:49:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F4031EE5;
	Mon, 28 Oct 2019 08:48:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F4031EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572248983;
	bh=+GPwxWG1cRsbxnpk+79jZi5AU/r4WrVQcUdrrXl0rEs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p14wJNS9eyXAp2qcvkUgZTkUzIW6mCgIDU1rUNThiDb4khoHMxrYAmaxEmUvcmEAD
	 C0EXCfwpx654Zybc6yWSgXaiCVN49ghbPxaoacLIZE5N61qnP8i1x4/ikxOUz8nsjN
	 TL387hufS2hSyDFDRBcPZLasJt7yEI/xNMspPH/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 669F0F80361;
	Mon, 28 Oct 2019 08:47:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A89AF80361; Mon, 28 Oct 2019 08:47:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,SPF_HELO_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::627])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E152F8011D
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 08:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E152F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="UiyCZN+G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5s6FYE6vH5liyocQfY+b8dKkKH7lG/7jjCNRcgvDUSYQNLveMrk/0KBQWQRGmC/bFVkmsnchcp3VU00Wzl4Lsi9KYRt4ERLmLoaF/tgtmbHdHXjh1W52D6ME/9UD/W0jCeORQ8TECEa9MTKnEeryf9Br0SA2rQ5BXuvTzoj0vfN7JwXJkuXXgxLaGffC4IehCRoEjudp5WqmOrBstgEcFV7qHxetpuUBnKPx9Lz8rZklo/XIEA/POMiKoWZD7H0RI/mDbEBCUrIAgT0IiD87HH82P7EIKTPx3AEQKI5ZBVDUo1pnCFIC1qQX86SqrrUCiEt6CM2UdxzT5Zy20eO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh+MnHDOR6FKVUKWefs3YTRv+AL+3LYegFZgSqg3dmI=;
 b=FKIlYdBcDVbnlqPCDLaBFS6seYCDGkZGGWHbWI7sVENtDMD1gJ1iksA0Jb2+MLPr/91Om5j0eG7UVWsedn+SKkO+eVPkZZ5ODRWNliIPaPKQPc/uyAxpgVcIOlQ2JI6sCr7iB5fFJsoqaVg9wdSy06zAiDalolU14Ev6JnkPuZwNt73O2rTuQLSXPZDhvh00Fyi/R8h4/pqBbIymrDNuem3NIYBf5TpC+h2w7QwD3iyfzm1S4H6iEclOABqdZ4DXNYeQwW8dbPPKl2N2hBw+ty4+71T1dNgynnvwRhvHt1OMzd1w44D7lek8HIknnyovjLWlcowc4GjHOPYIwjBiSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh+MnHDOR6FKVUKWefs3YTRv+AL+3LYegFZgSqg3dmI=;
 b=UiyCZN+G11opAVJJ/W3Ss2rvoGBUomgXr2qplSmZuFrhoAWMKRpTdxQr7QgPEmSQXpcMneOOKfnmB++Lf9YgtllescFzi6J2fUG8dYCcPxvh1x8m3RAQMdxXSGnu9BVbwrwdL3/QMEjG+sD5QYf6eay3VKljuAmgM4vp3D7Xivs=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6430.eurprd04.prod.outlook.com (20.179.232.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Mon, 28 Oct 2019 07:47:51 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c%6]) with mapi id 15.20.2387.025; Mon, 28 Oct 2019
 07:47:51 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [PATCH V2] ASoC: fsl_esai: Add spin lock to protect reset, stop
 and start
Thread-Index: AdWNY/owwLufHxxAQSqOpSi0OV5oBg==
Date: Mon, 28 Oct 2019 07:47:51 +0000
Message-ID: <VE1PR04MB64794BEB41E8A3DB9C7AFB10E3660@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f447758a-d31a-49a2-47bc-08d75b7b22b4
x-ms-traffictypediagnostic: VE1PR04MB6430:
x-microsoft-antispam-prvs: <VE1PR04MB6430C62ABBBE33A1A767EAD3E3660@VE1PR04MB6430.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(189003)(199004)(2906002)(305945005)(25786009)(7736002)(74316002)(7416002)(66066001)(229853002)(52536014)(6436002)(4326008)(76116006)(64756008)(66556008)(5660300002)(66476007)(66446008)(66946007)(8936002)(55016002)(6916009)(9686003)(54906003)(316002)(6246003)(99286004)(81166006)(81156014)(8676002)(1411001)(71190400001)(71200400001)(33656002)(14444005)(256004)(102836004)(7696005)(486006)(6506007)(186003)(26005)(478600001)(86362001)(14454004)(6116002)(3846002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6430;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d96KwWFhzAkrV7UqcWZisV0YSdWxS1LCA38z4vHivyAm7dZazowLYJ3mI4QQ+vDRbojkr0zCDq4GV7EWsG119Cnr/BxmnX5Gb26HHUwsZx1C/3To0ajQjmiSenkNvGDiMU5ihwe66PyyKtuUN3sDdtGydR5/VB+ZuhVA4SXWJp/PpH4YBb0+MQWcUdUSCAmH5sGklj1CLx8mbYAsRPqNnDFBqVCucGt3KDD8S9gpcLruM3QPriC21tYLeCuq5X9YqUNR6mcLxnLTCLmiXyw7uizQqP7n++FMoXaMQ1xnm8dSMNT7+0nBMx8HhjCxvBQwNTUS73UpuTna1Hp8eVuImSYgx8EWkAZn/02Xx/mVI0FtoC8gCjzLlpse60z3bXj40CSAoOEcg3dKcIrMTcYNZa/nHGyTrmjv9sdgva1mE0fQXbu47No1cnL1Lb1MH1BT
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f447758a-d31a-49a2-47bc-08d75b7b22b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 07:47:51.6530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F3lf0gtxnJQQ/k7s415xoPKpweRgrhcqH/dNZW6jDajznrKoLOJgx2ll04mHJMmKmvtFOhZ+a1VDFL4SH+iQ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6430
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH V2] ASoC: fsl_esai: Add spin lock to
 protect reset, stop and start
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
> On Fri, Oct 25, 2019 at 03:13:53PM +0800, Shengjiu Wang wrote:
> > xrun may happen at the end of stream, the
> > trigger->fsl_esai_trigger_stop maybe called in the middle of
> > fsl_esai_hw_reset, this may cause esai in wrong state after stop, and
> > there may be endless xrun interrupt.
> >
> > This issue may also happen with trigger->fsl_esai_trigger_start.
> >
> > So Add spin lock to lock those functions.
> >
> > Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after
> > xrun")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Some small comments inline. Once they are addressed, please add:
> 
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
> 
> Thanks
> 
> > ---
> > Change in v2
> > -add lock for fsl_esai_trigger_start.
> >
> >  sound/soc/fsl/fsl_esai.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c index
> > 37b14c48b537..9b28e2af26e4 100644
> > --- a/sound/soc/fsl/fsl_esai.c
> > +++ b/sound/soc/fsl/fsl_esai.c
> > @@ -33,6 +33,7 @@
> >   * @fsysclk: system clock source to derive HCK, SCK and FS
> >   * @spbaclk: SPBA clock (optional, depending on SoC design)
> >   * @task: tasklet to handle the reset operation
> > + * @lock: spin lock to handle reset and stop behavior
> 
> Should be "between hw_reset() and trigger()" now.
> 
> >   * @fifo_depth: depth of tx/rx FIFO
> >   * @slot_width: width of each DAI slot
> >   * @slots: number of slots
> > @@ -56,6 +57,7 @@ struct fsl_esai {
> >       struct clk *fsysclk;
> >       struct clk *spbaclk;
> >       struct tasklet_struct task;
> > +     spinlock_t lock; /* Protect reset and stop */
> 
> We can drop the comments here since you add it to the top.

Here is required by the checkpatch.pl, so still is needed.

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
