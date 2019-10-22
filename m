Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D78E00C8
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 11:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01F0C1654;
	Tue, 22 Oct 2019 11:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01F0C1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571736633;
	bh=jpR4OKK2FtW03xO1D/kxCvjJg5+0O6t3+Ei0bwj0Ju4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JgdeZUr5CiW3jP8m4vY5LLMrZxmyOiagNTKIt6TVoW5Ug4uTJzWcQmcDop8cci4xk
	 +h+S9uP9MoXkcMhYYoD0yqH73SGUgAs6rusySFTyoD0JPYeGo6OyKEIWKXwVZ4KIHO
	 XMMvhkiuLrPqmdBS+DllNBZjUW3mP2yjm9SQC9k0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CE58F8031A;
	Tue, 22 Oct 2019 11:28:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E64C5F8031A; Tue, 22 Oct 2019 11:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40088.outbound.protection.outlook.com [40.107.4.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C375F800C0
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 11:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C375F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="gTZ19UNn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmb+l2e+KaA6g6SfVRvx3e/Fxa39EkBtam3OPPhS4/nUm52Ak2VRVhvrqGDcExhxNTE+6yOeP/GK4bAokSqXYVXf6TZWLEoT6iCXcnl7NBqfhkJ1xHE8/6jF7J5nZ1srAOQCCtEbEbRhJbZd+IaYGAjwwaedOdSyNLNCFhTz/gS/ba7CMYT/XC0PILndS+IGGrYb1XuDOV1081KYu198P0FOCgvNCO70U7T+OwHGA8FZjlfiTDyjRAZMqxSfmxkAEJnty1mzVb91BRgCAYXlYLpm8CBFnJPppS7NBv7mE9I7zwHHvZ6BCV6fXc5QXX6MZW4m/oz6mdB2SnhssjAJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D10V4fW9IHq+iQcTC2wulYpsNCfkBnmA1vIQUgmCXDk=;
 b=b+EsAx7sC0cV54FgrxctL1TJmCPKzWagJuiBajNs1ighDHRg0Pu5e4RJzcjaFxZW/NPQJgvVAIgvm/akJ2xQeqetkS3AkLHwlM9nG68sjaCTaQTvzXwlWsvc5Uyxm/cWVZNv5Furmbw0rGUeCBernAZ4iiZwpWB/FYDYPWxVKFGG6/HZpejAFK0ZP8L4QJHL4WLlyWyXQjmIsMJsdGo/w3PEdy5MGfCa5e19KRNUc4uyVmM6FmJNU9ma82LVDMJg65o0jv5gnyZQEmq/CliC9Qt8sse3vk72061+LWL6l6iNUbB7tlTbQCWl5JwvNi+u/t0fox1Z+UfKNZgr88fUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D10V4fW9IHq+iQcTC2wulYpsNCfkBnmA1vIQUgmCXDk=;
 b=gTZ19UNn896t4blZ9uDaOzjEAk/IyWEIY/6yGAs5iaQeHKMpu3LiYCxS2FiVd5bNwInBVhVQx7DoxuvPZov36j6uahx2or5LwHJs7i3cj2fLYGXEPmZNqDFsFBsvxPUw66koBUsgb3rUFvMdQ5mFChkGRW9Mh84Ax4XkGeMPh9A=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6672.eurprd04.prod.outlook.com (20.179.235.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 22 Oct 2019 09:28:38 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c%6]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 09:28:38 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: Question about "957ce0c6b8a1 ASoC: soc-pcm: check symmetry after
 hw_params"
Thread-Index: AdWIuxPa2KG9e+CUQ5a0tVSv5de9fQ==
Date: Tue, 22 Oct 2019 09:28:38 +0000
Message-ID: <VE1PR04MB64794B718CAA0CBAB38C3918E3680@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c85bcac4-cb17-4cd4-b716-08d756d23867
x-ms-traffictypediagnostic: VE1PR04MB6672:
x-microsoft-antispam-prvs: <VE1PR04MB667257646CD071315B308F6CE3680@VE1PR04MB6672.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:561;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(189003)(229853002)(486006)(316002)(2906002)(86362001)(71190400001)(71200400001)(66066001)(66556008)(66476007)(64756008)(66446008)(76116006)(66946007)(81166006)(81156014)(256004)(476003)(14454004)(6916009)(5660300002)(4326008)(6436002)(26005)(9686003)(186003)(4744005)(305945005)(7736002)(7696005)(74316002)(102836004)(6116002)(54906003)(25786009)(3846002)(33656002)(8676002)(8936002)(99286004)(55016002)(478600001)(6506007)(52536014)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6672;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OSP7J+meGdhE6j7AXqD4DQhXNtqCfeS6xhNj9BrOUnbixx/s/YIKLqnnGehtkpv53LUnHXcUS4idJdRUdGZLUW/vJfidDQrF7PVnkZJdQTeIoKShp+kwlBTlmGH0Y9GdikALRNBrAyDmbeUZL4dekCJcPN2a7U7Av9vUW1WtrR9kq1alBUCBrF5qm5QzU+jgDTub46NyxnMfySOI/yNvIkMzghECK1osjALOdxvmFMcALuGS5CXRdh7oiaAdFuoZqHyZ7J9MdPZkCxqRB4iJmy6GHtlpkfMptZiS+0gbS47oQckkWMX4u8mqM52DmpxeqPrve/C28qcMzVt2x8nQVg/WyXTqlmXNSJasseFKggpyffSF/cO6ih6w5wrYjZT0EtTetFRCruvLczBBC5PqGAfiqOTVMu0osTw3AILTAXA17xco3hutiubuPZD1Luie
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c85bcac4-cb17-4cd4-b716-08d756d23867
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 09:28:38.3627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XRY3zExKlO6ogz6a5IEZTUJ90uQvaIe6WQ3VzJsF9/LiCFYy3qp89NM3B0+sKh8JTOp+6fm/i+Qgzjv3t/0uvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672
Cc: "jiada_wang@mentor.com" <jiada_wang@mentor.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Question about "957ce0c6b8a1 ASoC: soc-pcm: check
 symmetry after hw_params"
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

> 
> On Wed, Oct 16, 2019 at 03:05:16AM +0000, S.j. Wang wrote:
> 
> >      The soc_pcm_params_symmetry can't take effect, because its
> > position is after the change of cpu_dai->rate.
> 
> >    Is this an issue?
> 
> I think so, yes.

Thanks, but how to fix it?  because I don't really understand this
commit want to do, it is hard for me to send a fixed patch.

Or shall we revert it?

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
