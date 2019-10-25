Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE9E4326
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 07:56:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C551753;
	Fri, 25 Oct 2019 07:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C551753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571982968;
	bh=FZ798JOS/QQU+RqcahSTSj8HwRQr6zxRJRClA2YK4Sk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qMAsE2tuYq1IOv+wDeaot3/GE/6vlU8ug6+RJuSbKSifSLIfou4lgCBgRG1W67kRL
	 jyavpulGKPNdq2rTV9DpKc3E80ozu+m1RqcGCkR3FWqbri7ov8HrxyEc5njkAUyBZT
	 vPveeolXL17vcbQD99cTZrpsNSGEGMFYdEBIhw9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 092EBF80393;
	Fri, 25 Oct 2019 07:54:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58667F8036F; Fri, 25 Oct 2019 07:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40071.outbound.protection.outlook.com [40.107.4.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 949BEF802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 07:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 949BEF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="OKzqqHnp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lu5s8fdMiZl6CBcn4sLITkygZCYvYpBiy1nzL/lz2gPHUD/bljk0qk2tQ8GqAPvfECH57iJHnkSwtMNikhzdn4SG+RdpAlhDfjDr9XquelKIKhdsNMyelnkC9o4Gs9khc53ptXtaoC+A4JPO1H/nbfhTO+l+RtyolN9vAJt9+bYBGSU/vRrkyNgckctM7FKsVqUjKaccxXMaBkYtsYQOtHZFOqM46Jv8Qh9X9kK9M1NRM6uGcgpfHo2PGVar+vcW5+GoF+8MvwqA6fFipJ6pEXvb7XH869GHk0HcS9eMwxzhUKeuCertZZqvA/kFWo/D+jB6YeEFOvbm+yQ6Gm/8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SqHbF3LA8xPTHfjfatUcWZN7IA4yK/a4GIsqIhdWRQ=;
 b=BYVvO0AqqjsHFA4OXLyB7Dcu71BrGdQ38sHFr9440Mn/5skTwe7d+d7O8Mi1THNsj15oBXWX4HLChVYo9sp6dEfrWlS59mUm8L3rcZKa0+xRr1QDMKbe9E+DqA7o9RTI1sh06phgF2wEybq0XljYeqRikfmWIUoE5I8RYaQSStp2ET5duVs1svYYFAHr5fq8AP1RzBhxWj9PcFjuLaPkgoy57ike1+HvDoLwqJQ1rOeowAK7JKimsXoubIi0Jnfqjl8xeZOUKy573ibPdcmtNe94JEdXcSIqtRiAXbMaLpWlvX3llRv2VXHU6+CzCoSLoVre35q4SndidPG//rlf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SqHbF3LA8xPTHfjfatUcWZN7IA4yK/a4GIsqIhdWRQ=;
 b=OKzqqHnpnH1EI0N3FS+cs2vjk6R2ewqB+di2G45qVBpPvt2YjV702LGXWXN5y/aTdzEkGKbOgOl3JWsg2mRQxRTx8kAQQV94rhaLaMcpw93tqULdWkJPlHjfFPr62JjEr9hYSCR9Jd2gkPL8kAASGTIYL4gz3YW4jg2bcqJaqTQ=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6557.eurprd04.prod.outlook.com (10.255.118.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 05:54:16 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c%6]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 05:54:16 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [PATCH] ASoC: fsl_esai: Add spin lock to protect reset and stop
Thread-Index: AdWK+HdhgLIuF2SMRlyd3wTM80COcg==
Date: Fri, 25 Oct 2019 05:54:16 +0000
Message-ID: <VE1PR04MB6479F8937722C1FAC81C6623E3650@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 93d17133-584a-4940-b8a5-08d7590fc51c
x-ms-traffictypediagnostic: VE1PR04MB6557:
x-microsoft-antispam-prvs: <VE1PR04MB65571B034B6C41D5992772E6E3650@VE1PR04MB6557.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(189003)(199004)(7696005)(6916009)(81166006)(66066001)(81156014)(66946007)(7416002)(66556008)(66446008)(64756008)(6436002)(5660300002)(4326008)(52536014)(76116006)(9686003)(66476007)(74316002)(4744005)(8676002)(54906003)(478600001)(316002)(55016002)(8936002)(25786009)(256004)(14444005)(71200400001)(71190400001)(6246003)(6116002)(102836004)(33656002)(3846002)(1411001)(186003)(86362001)(476003)(99286004)(7736002)(26005)(6506007)(486006)(305945005)(2906002)(229853002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6557;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fOUhRT42T8aC84f1t/qS3pDC/tFJFSlyQK2fyzB8jo2g50Tk2zQjEKLWSBmgr8MjbSE2+jaaHXtqJe/5tPg4VEsGdvArmnR0M70CoQw8AAN84iwDVkRvj6yhLZLLAdLnWZkxMq6y+kckQgFXqkUA9A+MTegzt5m8ZtesBbSZ0FRJPARVObLWFZAtU8LczzhHI96IHVwKC86J0wYmXkzdzfys44x4e+rGpFR//67u2Y5VowC2ZoKbovEuxqPYgTZyhu5uL7g/v4rRYfKK06Wmh1foCMq+ChzMCIJ5AkSIOCo3mbCUAPDUqKXuxHeIC6apQ7zaAqUBLLscgBEuHugywIAD0oYR5pO8CN13VijJDR60KghxL0nKZ8Xxu+e2KAgR5doZYg6pMIaz49udFcFdLbhYBbC+oe3QelIlySr5MYvOWWm+LjgZCxO2maeYNdZG
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d17133-584a-4940-b8a5-08d7590fc51c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 05:54:16.0920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdygqKnUaOp26tpZrbhiyvUGfwrQC+tzFj1jRVUDPHnPgtWaZH4SWX4EY5OjBpJHVlGXIuw5pplZfv2b24Y99Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6557
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_esai: Add spin lock to protect
	reset and stop
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
> On Wed, Oct 23, 2019 at 03:29:49PM +0800, Shengjiu Wang wrote:
> > xrun may happen at the end of stream, the
> > trigger->fsl_esai_trigger_stop maybe called in the middle of
> > fsl_esai_hw_reset, this may cause esai in wrong state after stop, and
> > there may be endless xrun interrupt.
> 
> What about fsl_esai_trigger_start? It touches ESAI_xFCR_xFEN bit that is
> being checked in the beginning of fsl_esai_hw_reset.
> 
> Could the scenario below be possible also?
> 
> 1) ESAI TX starts
> 2) Xrun happens to TX
> 3) Starting fsl_esai_hw_reset (enabled[TX] = true; enabled[RX] = false)
> 4) ESAI RX starts
> 5) Finishing fsl_esai_hw_reset (enabled[RX] is still false)
> 
> 
Good catch, this may possible.  Will update in v2.

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
