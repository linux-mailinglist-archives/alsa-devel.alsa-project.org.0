Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B32046B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C655C16CB;
	Thu, 16 May 2019 13:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C655C16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558005537;
	bh=ycVwI/YizK1AvPMIDMlyUP72EOQvqKad1j0hvAw81BE=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUe/ag7lFMVY6BvAaHDzz2KuGhxYx18BXI0qwCiULx/tCqPQywMoUZc8tI4nVzSRj
	 FQx+S81Vxh/Ib+sgswDkf2iHq8L/to+jhVB+O8SQgCh9l9BlqYGPXdd4lv4Du8lxNq
	 /Dsp1M8DNdKYTfXUxOrLioCjEY0Sb+HmMiKE+62c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76CEBF896F4;
	Thu, 16 May 2019 13:15:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EF0EF896B9; Thu, 16 May 2019 13:15:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140084.outbound.protection.outlook.com [40.107.14.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32263F806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32263F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="dSMvpK1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAQ+2wbC2WXliktbcZ+zorgzCU20S/1nC6BNgM4ZkSU=;
 b=dSMvpK1e7NAIyhbAlvp17lN95WTM6r6XEkSjZ4IGsnHe+r/Uzq9FBhVwTyYroM45Jt1Z53FuE34y6TnJ8vS8o/siCIvpXvQdmqp+ubcj+SayeJu7alzLDCNnh8fMKGwLU0778riuxEFdpkrvm4FPjVr9rvo7XUzmj7c9R9NnW9g=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6766.eurprd04.prod.outlook.com (20.179.235.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 11:15:31 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 11:15:31 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [EXT] Re: [PATCH V2] ASoC: cs42xx8: Add reset gpio handling
Thread-Index: AdUL17zEZXZ5WMhBSxKtqwI7wVoUIAAAIToAAAAGa4A=
Date: Thu, 16 May 2019 11:15:30 +0000
Message-ID: <VE1PR04MB6479888D6DA4CA554E990359E30A0@VE1PR04MB6479.eurprd04.prod.outlook.com>
References: <VE1PR04MB64790C7A0C1C068503038FDEE30A0@VE1PR04MB6479.eurprd04.prod.outlook.com>
 <20190516111232.GE5598@sirena.org.uk>
In-Reply-To: <20190516111232.GE5598@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8311f5c1-83d8-482a-1fc5-08d6d9efcee6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6766; 
x-ms-traffictypediagnostic: VE1PR04MB6766:
x-microsoft-antispam-prvs: <VE1PR04MB676651F8FE716DE92446E2ACE30A0@VE1PR04MB6766.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(366004)(39860400002)(376002)(199004)(189003)(102836004)(9686003)(53936002)(3846002)(6116002)(478600001)(446003)(68736007)(186003)(2906002)(229853002)(54906003)(26005)(14454004)(81166006)(81156014)(8676002)(8936002)(25786009)(71200400001)(316002)(4326008)(52536014)(305945005)(7736002)(6506007)(66066001)(6246003)(55016002)(71190400001)(6436002)(74316002)(7696005)(6916009)(14444005)(33656002)(73956011)(76116006)(476003)(66446008)(64756008)(4744005)(66476007)(66556008)(486006)(11346002)(66946007)(256004)(86362001)(5660300002)(99286004)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6766;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: asYex46IVTvTa6nKiuhpgwjTTqo7j75VoYDcJbGfpra3tZUUd2zxZdMOXPnaIuC7q6qVPd5vzef2NROu4UPgccmrCeJjLSsMGI+aJ9nKnANEVT8JSWTkdm0DXOjszMMqymREDA9wRtgLug6bEFeS7+dJKr2n956Q7mfvx0BwflC6bW7sjWKh4GBQRBEK/KjmGDro/GY02QbFFWypE8kSKJ9vdoZOX07YtXehaB7ws2JKwJtM3JHX71+5uS58nMot3Kh235lz1UOPKr0YhxWeVMIP8TgAIrLVajolFWRR1vRDUNtgZtBVE5eFBYYOmImV8NG9vwqRQSGUGxZaZhMO245DDbT1xzKGK4zt4RAGaTi0J/H0cvzmyFE+mg5SimJqsHpoe+2eBRxJrXtjqtw6siVWKROBPM/UccSGQNk2/dA=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8311f5c1-83d8-482a-1fc5-08d6d9efcee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 11:15:31.0033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6766
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH V2] ASoC: cs42xx8: Add reset gpio
	handling
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
> On Thu, May 16, 2019 at 11:09:27AM +0000, S.j. Wang wrote:
> 
> > > You also need a binding document update for this.
> > ok, will send v3
> 
> Separate patch please, I already applied this and binding docs should be
> separate patches anyway.
Ok, I already send v3.  please forget the v3,  I will resend v3 for binding doc only.

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
