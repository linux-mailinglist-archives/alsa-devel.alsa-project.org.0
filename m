Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEEEC8A58
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 15:58:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57635167C;
	Wed,  2 Oct 2019 15:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57635167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570024705;
	bh=8Cslzj6YVJ5InYUOzOnzL0LTe3Ej01Teb0ti9oswQZo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ayg4MK1twkbIP3bIZhr1HHU2zRoh7Nx+EANzQuYmYylfAOzhgwl9aaTxyrYcXT39M
	 n2X5MOJGAucTtiMoqHHFuMPp8/Leecb7J/l5bJdPXMu/DI04Z4KU3QMnGJcaltYw20
	 J2bsC2kzj7tqKBIFlcvTErX4ej2bC09Rw0W3ySeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3477F80377;
	Wed,  2 Oct 2019 15:56:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F691F80391; Wed,  2 Oct 2019 15:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77B91F800DE
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 15:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77B91F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=artgroupspa.onmicrosoft.com
 header.i=@artgroupspa.onmicrosoft.com header.b="iP8Gw5Np"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2ejRJzVEwYBi0bK9O1rfoq3fq3fI/S47rEwyNrnSuNJdy2D8+zpigI7+atYrEo1AHofRa8FNlxYFpwtTAsHCBtp5ZtBdoA6reZRpsDUEF/CgeTtpI07u4YrBi65WkeovmTXSzOaVOesuH7lZ9G+8aiw2YKGw0U/7MHrGWbgU7VXH3oDhcEvLdrJakcO1M2TxzswjVObvcHtrB3VOr+RBuubS8fty2zUze9RSEGncWJ/bFj7PHaI5A1PJu8dIXDys+QapFwDX3+GnRT+hykgPvTamHcdMtcwI7gyyAx2MExwM4cZhKTxs/4I7Ktv/4691iztL+pQY6VkfJgsfiXStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6bxRIFGaRk5hAKQSeP3O9v7QnEdwrZYrZg8Wj9gOac=;
 b=UE/qFlbXYp2WDt+xB3M+9HTttxKSjalf6FLPJmYrJhDVnrL7/Vrcn+xgWxazzkqeOAl04VZfip5BNFkoiERUn1wXlPkTVBMxYxWBxtyXcBIsvx5y8D2TNuTr0MYrdI5wEC8RCIrdI9rBMSgfE9q/vMwHsy0KPEtKKGYx5O4MpAl9ZdVfEAsmaZhrHvtfLV6RzNmpx6qsHiLOBPkyfjt82wq0MIDcgbMdbnkuq//nHQB2FhfK+ZKWVP+ynFQLWtkAKxHU1vLITsQEPzswS2kCnD39rxH3IEey9MCYYp87ESh/julNerMlq5HuJD1kbrtrYE59avfmVmgTMVFud86KyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=artgroup-spa.com; dmarc=pass action=none
 header.from=artgroup-spa.com; dkim=pass header.d=artgroup-spa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=artgroupspa.onmicrosoft.com; s=selector2-artgroupspa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6bxRIFGaRk5hAKQSeP3O9v7QnEdwrZYrZg8Wj9gOac=;
 b=iP8Gw5Np9mmhxe76ikajhZ+xbn3aVX7HnQZvLuH/SOTRLGAPDram2f6h/jicsA0hAv8xIdvPdzKcdYItSiZyQ2/KsGGuveLjLrvKGsnuZJrZXEWzedXlm37yu0LKziTXWSkoi4BDlVK2NZtqaHnd/MRXgPWBjQvDXKEnwrKJihw=
Received: from AM0P192MB0353.EURP192.PROD.OUTLOOK.COM (52.134.87.13) by
 AM0P192MB0260.EURP192.PROD.OUTLOOK.COM (52.134.83.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 13:56:34 +0000
Received: from AM0P192MB0353.EURP192.PROD.OUTLOOK.COM
 ([fe80::988:f053:65ad:ee6e]) by AM0P192MB0353.EURP192.PROD.OUTLOOK.COM
 ([fe80::988:f053:65ad:ee6e%7]) with mapi id 15.20.2305.017; Wed, 2 Oct 2019
 13:56:34 +0000
From: Andrea Narciso - ART S.p.A. <andrea.narciso@artgroup-spa.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: Period size setting is ignored when dmix is used
Thread-Index: AdV5Ka+sIn7kKP1SSz2ubpFE9H2Kcg==
Date: Wed, 2 Oct 2019 13:56:34 +0000
Message-ID: <AM0P192MB03532F4DBA062D95D86107A2BA9C0@AM0P192MB0353.EURP192.PROD.OUTLOOK.COM>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andrea.narciso@artgroup-spa.com; 
x-originating-ip: [85.47.31.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2a99f99-eead-4631-592f-08d747405633
x-ms-traffictypediagnostic: AM0P192MB0260:
x-microsoft-antispam-prvs: <AM0P192MB0260C776ACA0F132CB30B6ECBA9C0@AM0P192MB0260.EURP192.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39840400004)(199004)(189003)(7736002)(66066001)(256004)(2351001)(7696005)(74316002)(8936002)(14444005)(6506007)(478600001)(2906002)(305945005)(6436002)(5640700003)(99286004)(25786009)(9686003)(476003)(33656002)(486006)(6116002)(5660300002)(3846002)(102836004)(66446008)(66476007)(64756008)(66556008)(66946007)(76116006)(86362001)(14454004)(52536014)(55016002)(71200400001)(71190400001)(6916009)(316002)(2501003)(8676002)(81156014)(81166006)(186003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0P192MB0260;
 H:AM0P192MB0353.EURP192.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: artgroup-spa.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mD/O6vNQHzIcog9MUXgz26vG67ZVbrQwPUaZWZwnXivjNfdydv1LruyWE4332upBkdNRH+NObwNV9eVSNP+zzloxOE8POLk4GThUNqn9IEzUUaoqxc5LNZCViU4mrueVqPfTs3pzbomnWOudzLNEgUsB8kYE6v410TaafPSzreM7eC+F9J+D0xDOWe8eD4ZzEdGxUHdeoNNe9zJ/C9QI6TqTs60+OEPK104UYZVtuZT7HugsnWcbh4J2OqjRfYcw8vxRn4/BxOCOrFur/zUZOF3CA/9/M6TBHwK2Vo6p2AnCkhRU413HD5ZGJz4yb8II9clPfA9ALdOCElDTpnL08EYgQCTsOKJORMBIvNWNTC21RC1XxEBK9uRZa2ChE3U8Az+P7sJoKapvViXtyP3rpnshRfdLq9RtII67oQxwpSY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: artgroup-spa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a99f99-eead-4631-592f-08d747405633
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 13:56:34.4899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53c55efc-dafd-4709-9ce8-f76299277497
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dULf+Caiqk2bWluMoTnaUO1SPXb/E0gQvHDTUDW2xiH4UHh7V501XsxJP0/S2MC+DpEOc/nGysdA+6GgafxtXuyyq0xNvHdlEIZv8z3Iw4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P192MB0260
Subject: [alsa-devel] Period size setting is ignored when dmix is used
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

I would like to set different period size (or time) values for different ALSA applications, in order to optimize latency and processor load based on specific application needs.
For example, a telephony application will use a shorter period size/time than a media player application, so that low latency does not affect the quality of the call. 
I found out that if dmix plugin is used in the ALSA path, period size/time settings are completely ignored and forced to default values (supposedly read from the ALSA driver of the HW card).

For example, not using dmix, period size value is correctly accepted (but of course I cannot play audio from multiple applications at the same time): 
aplay -vv --period-size=4096 -D plug:hw <WAV file name>
Plug PCM: Hardware PCM card 0 'HDA Intel' device 0 subdevice 0
...
  period_size  : 4096
...

Adding dmix instead, I can play audio from multiple applications at the same time, but period size is ignored and I cannot therefore set different latencies for different applications:
aplay -vv --period-size=4096 -D plug:dmix <WAV file name>
Plug PCM: Hardware PCM card 0 'HDA Intel' device 0 subdevice 0
...
  period_size  : 1024
...

Am I missing something? Is there a way to implement mixing + different latency settings in ALSA applications, without using an audio server? 

Thanks
Andrea
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
