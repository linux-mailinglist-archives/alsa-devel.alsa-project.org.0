Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B708A5A6F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 17:22:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 658A516D4;
	Mon,  2 Sep 2019 17:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 658A516D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567437720;
	bh=RVsKg1rkJTLKybRLwQGPxpEcjit20qMONmkx1yL1Mpk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G/x5Siz1OtmKWAUE1qGUZujAj4aXFkqpkX4uXde3MBvZ//pmRLVbfGkVm04mq1E2F
	 qYgIJG8f1Wg2ZZerJNkyV4BwR0vnRntB9qy2s5r23wornJOj++TSlXtTe2ww86JH5s
	 eFzuQejkOuwfq+0F/Sj+ZF9flydDtIOx+lZyaKbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68086F80447;
	Mon,  2 Sep 2019 17:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF8D7F80369; Fri, 30 Aug 2019 10:31:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_135,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60115.outbound.protection.outlook.com [40.107.6.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45297F80096
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 10:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45297F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=visteon.onmicrosoft.com
 header.i=@visteon.onmicrosoft.com header.b="oH0nbgfM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4cOgDSJ8i8dlF4Rs7grDhI2S+RDCwgbOzRSUkX0BaxUpuLTCdQDfFoU5mmH4EK2V92PqDfrQNCVjyZ0+eLVGRafGGvtMmLXOsVMR6wtb7EYAFQD0SmQKnfw/u46wk89JZNVoE5+j3ha35dtnMFPoaZSFAdA0gZIeAqMUB938QQu3LuslhTbZgYdXDpa7HJyJJvZhoQ57N5/wAaYspoiqwiMN7AwUor0nTaKr/CFJ1Ixm0qEpufBZwuf57QCfoPJY6JOVMaulGgRYo2WLc3zEsCCKqM2Mb4/EOKdGKym4bt48gpdYqt4E6QPOY3ZrjLAunnOdI6f7WrwFOvHgXgp4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjV4z9u6N1eQ67zNUZI5BMYmP8PxVKTc1ClctCRB+SY=;
 b=ADji2G/Z0h4CPmNxTs9mxVASfRft5CGGAgWsNXepsZBcuHZINGjQDT9SINptDKct+gfLIf7TcEDP9TckzHFJ2UXzuQhgZqGoHNyxIL56wt28/87PNA8kaCZbAiE5QCWdropywDzYtv3AU+JgDbmyasOMTj+9LpW3ObiFgz15fFs+Aqp1QmrtNDWEh0Aj39ajdNUfqXwb0i9TbRgR2HaaUXm7U0iRoyI4C8TyQ6KUHZzfjQfwnZtIZ654nsecdtMCpr1t60oFz8YKuhPbD0nlzWUSPZ5QNRjl4A0AoZMKS46gN3O+6jgJWTdzWr64pgsfaUzvJkI7yJFq+ogtPZPSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=visteon.com; dmarc=pass action=none header.from=visteon.com;
 dkim=pass header.d=visteon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=visteon.onmicrosoft.com; s=selector2-visteon-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjV4z9u6N1eQ67zNUZI5BMYmP8PxVKTc1ClctCRB+SY=;
 b=oH0nbgfMacAuXc1QGE3zHiXlpq950qzvMpeMH6hjOuaECj3mLaKfHvkS4CdR7uFUITJdyB/ttZUO8/qG3qW6jljVziFhOzUpeUWhUQ31Ek38SMr9mxLmTR3T8uNl2k/P+q5jc1JSbNM7XrKTGDh7bN2kMdGHD8Sp+an26tIItFk=
Received: from AM6PR06MB4946.eurprd06.prod.outlook.com (20.177.118.208) by
 AM6PR06MB5777.eurprd06.prod.outlook.com (20.177.118.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 08:31:25 +0000
Received: from AM6PR06MB4946.eurprd06.prod.outlook.com
 ([fe80::7c64:685a:dbe7:c309]) by AM6PR06MB4946.eurprd06.prod.outlook.com
 ([fe80::7c64:685a:dbe7:c309%6]) with mapi id 15.20.2178.023; Fri, 30 Aug 2019
 08:31:25 +0000
From: "Yang, Xiaotao (X.)" <xyang25@visteon.com>
To: mailing list <alsa-devel@alsa-project.org>
Thread-Topic: about pop chime on pcm api
Thread-Index: AdVfCcEMarxS8pnJSw6uYaa7h8B2hw==
Date: Fri, 30 Aug 2019 08:31:25 +0000
Message-ID: <AM6PR06MB49462A448954E689F9F87D37A7BD0@AM6PR06MB4946.eurprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xyang25@visteon.com; 
x-originating-ip: [165.225.116.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2da260e0-2bba-49cc-9a24-08d72d247243
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR06MB5777; 
x-ms-traffictypediagnostic: AM6PR06MB5777:
x-microsoft-antispam-prvs: <AM6PR06MB5777054806C5CC82A9EDA850A7BD0@AM6PR06MB5777.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(189003)(199004)(256004)(6506007)(9686003)(6436002)(99286004)(14444005)(8936002)(55236004)(81156014)(55016002)(81166006)(6306002)(54896002)(4744005)(8676002)(14454004)(186003)(5660300002)(316002)(478600001)(53936002)(26005)(66946007)(64756008)(86362001)(66556008)(66476007)(7736002)(66446008)(76116006)(7696005)(66066001)(790700001)(6116002)(486006)(476003)(71190400001)(25786009)(71200400001)(33656002)(74316002)(52536014)(6916009)(3846002)(102836004)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR06MB5777;
 H:AM6PR06MB4946.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: visteon.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QhuWt1k04pV5Ib0roguviJQ1DwerXqu37YqIVEgmSrLYwDpCKrgr5Js72rQGJOEg5ZTKAOpOutpYTEQXK5o3PkggQUfcGFIAwW/AJ0cqo20VOBupC8+PmGwAUMzm+AefyB2P257FnQFbWl4vEdyV+IZH2l0Q27G1XrVVDriQqpQ3ugZIGjvDj2raUKMKy5my5rIwmiNv0zJ/eU7cnkNVoD1hcoFBlRcdrLmJ/5DzuZZETQwyEU/ZlEteUua/NQ+No1+5lkgD9FNAS/PvTI4CizfHd10IQfXk6GvNyiH9e6GvH3n1yc2uB+2EBr9pSsDzM37bOdsC4RP+AdHK2IdBFJ3gRvRu0Aa6ZDuX46Ko9C+0ydynSYPV+PWbC9/TNFo/TMAhrOUy2q69Y6Xc21ommdztF81gQyz2U7qHbqJrJF8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: visteon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da260e0-2bba-49cc-9a24-08d72d247243
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 08:31:25.2471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a147aaf-01ec-498c-80a1-e34a8c63c548
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbnA2eHhbgoZ6RF0CTB9A8gPozJ/c9BbgdJZ6ySOq1cUEau7EBZooBjDlttdZpZTGxh3z5DI6yF+hFWPTcr5tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB5777
X-Mailman-Approved-At: Mon, 02 Sep 2019 17:20:12 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] about pop chime on pcm api
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

Hi:
               Why should I call api<snd_pcm_close()> between the interval if  I want to play a wav file two times repeatly, Otherwise pop chime occurs?

Eg: (fake code as follows):
         Following codes works good.
         Pcm.open();//open pcm device
         Pcm.play(demo.wav);//set parameter and call snd_pcm_writei() to play
         Pcm.close();//close pcm device
         Pcm.open();
         Pcm.play(demo.wav);
         Pcm.close();

        But following codes works with pop chime
        Pcm.open();
        Pcm.play(demo.wav);
        Pcm.play(demo.wav);
        Pcm.close();
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
