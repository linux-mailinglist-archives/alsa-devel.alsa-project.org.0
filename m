Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB331165A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 11:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20458179B;
	Thu,  2 May 2019 11:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20458179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556788552;
	bh=88/8lv+RZjYbHw1DGBddtkINJMij+hdCFGKLQYpmyYI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UptvK5en6GUqcDWnnipe105TZwCkoo5R5i+f+EeDR/ftn51A7ZcS3iHm4yXW+QGT+
	 kNPhylsr0OW9BdmJIQqewupkInjLIt7/p5GFF0CLWDqVurk400G4XnA4DCGGqBx2k+
	 +cjCM23FnIKY10OFarxD2VO5lFdJagG4hEs25POA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9CF3F8075A;
	Thu,  2 May 2019 11:14:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C4F7F896C7; Thu,  2 May 2019 11:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150079.outbound.protection.outlook.com [40.107.15.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2B75F8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 11:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B75F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="o9vUcqTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=No6VOHotBjroEzf8XP7A3n+Gq2eh8H0kmMwc0LpTHSU=;
 b=o9vUcqTYFC8/VTf+u8BVivoxpZFwvpHbUEy+IB3khnDKi/tvR1j6T3ppncRXNQ4frTSeDK8KtazXudIvBoxnawdmM0O9SYVAByhEcTHIhf7wsWdWj5T5IxqaowPvvYyIoHfrAudWJrY88l2oUi9ehSYdGPZ4+4aH2KaHC1C0h8U=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6671.eurprd04.prod.outlook.com (20.179.235.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 2 May 2019 09:13:58 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311%7]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 09:13:58 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [EXT] Re: [PATCH V4] ASoC: fsl_esai: Add pm runtime function
Thread-Index: AQHU/WmQi9S3A4SFvU+3BSdrbwsfSKZXJceAgABrFmA=
Date: Thu, 2 May 2019 09:13:58 +0000
Message-ID: <VE1PR04MB6479F3EED50613DF8F041713E3340@VE1PR04MB6479.eurprd04.prod.outlook.com>
References: <c4cf809a66b8c98de11e43f7e9fa2823cf3c5ba6.1556417687.git.shengjiu.wang@nxp.com>
 <20190502023945.GA19532@sirena.org.uk>
In-Reply-To: <20190502023945.GA19532@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [180.155.251.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 935e1227-1c19-4f41-cb84-08d6cede8263
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6671; 
x-ms-traffictypediagnostic: VE1PR04MB6671:
x-microsoft-antispam-prvs: <VE1PR04MB667147118A8A339FA0792780E3340@VE1PR04MB6671.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(366004)(189003)(199004)(71190400001)(9686003)(86362001)(6436002)(6246003)(71200400001)(25786009)(64756008)(55016002)(256004)(7736002)(186003)(8936002)(5660300002)(14444005)(33656002)(74316002)(4326008)(73956011)(66946007)(99286004)(81166006)(53936002)(81156014)(76116006)(4744005)(8676002)(52536014)(476003)(11346002)(478600001)(486006)(66476007)(2906002)(6506007)(305945005)(102836004)(14454004)(7696005)(76176011)(66556008)(6116002)(229853002)(6916009)(66066001)(316002)(54906003)(3846002)(66446008)(446003)(68736007)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6671;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rxlTSIfnfEs9KYzzMCRtzGGaFuCCeLe4VKmpgoCnmhV0YjNIQ8//x3lMORRldz+IXhV05ixQnCWO0pJbulF2MrCgXI94NuALTTskwZGnXcN2GS34HqQnXABfuK9D8Nj/8pvpVadCU9vfQinyU8CgWBBZQZJ1vjfIw/uNjKcEue1s4f5rJZMmArxa0DlXFHs2FT3cYHq5CnoPFvBVE7biKbHgbrp8yEIHu0Hd2fqI/Bm7o7Xl+sufhVBrBv50++oRPeNO5bqKaRMAZdEiweV+kNczCIwCO+bNkf65RiTnfs5v6qeQFuLlKe69FzI4sk1KwS4ruOtFWbxUpO9JrDRWb10kn2SR3qyGmY5PIV8IeJCStweUu8PVbkAsEJ4usjzrPp6nFVch+QwhV9WmEgn/mA0BMIWtGgh6k9i5My2jf3g=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935e1227-1c19-4f41-cb84-08d6cede8263
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 09:13:58.3942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH V4] ASoC: fsl_esai: Add pm
	runtime function
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

Hi Mark

> On Sun, Apr 28, 2019 at 02:24:54AM +0000, S.j. Wang wrote:
> > Add pm runtime support and move clock handling there.
> > Close the clocks at suspend to reduce the power consumption.
> >
> > fsl_esai_suspend is replaced by pm_runtime_force_suspend.
> > fsl_esai_resume is replaced by pm_runtime_force_resume.
> 
> This doesn't apply against for-5.2 again.  Sorry about this, I think this one is
> due to some messups with my scripts which caused some patches to be
> dropped for a while (and it's likely to be what happened the last time as
> well).  Can you check and resend again please?  Like I say sorry about this, I
> think it's my mistake.

I am checking, but I don't know why this patch failed in your side. I 
Tried to apply this patch on for-5.1, for 5.2,  for-linus  and for-next, all are
Successful.  The git is git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git.

I can't reproduce your problem. Is there any my operation wrong?

Best regards
Wang shengjiu

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
