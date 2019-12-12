Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9D11CFCA
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:29:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C1916D7;
	Thu, 12 Dec 2019 15:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C1916D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160949;
	bh=bBWhnPMw7xuSwrD3WNzJtD2QTEtjc8q78jQLsHtrA30=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4nGQ/WQTIEEQcTm+YxdqVritd/huomAJJ/9CDJ3kcdBS9EGYgQDJpA+EYXQOM2vw
	 JAnzZroo2gyIIz+QxvpcmONjCjtEFTdjy6pE1WQdL2Rz4HV4n66SWB+S4rfu/FCVka
	 Yc3rZnh8kUhf9sInsl0D7zcM+DwyYQ5G031yDyf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A8B9F802DF;
	Thu, 12 Dec 2019 15:19:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB85EF80217; Thu, 12 Dec 2019 13:31:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,HTML_MESSAGE,SPF_HELO_PASS autolearn=disabled
 version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7098DF800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 13:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7098DF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="HCaSeh5J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xw5bHlQJsD8Q5tyonI2byXlS/8cDhn2yUJdlJUPYtMgUeWzuoL9So2b2ThTdtN8O95Bf3+l8ufTsHT425gHGybv8kcrhSvnMff0LXg71VUvcHBQu3kVOkPbgbyM164V3izCBrtmduWOobgJcfMgrz+894KYL+O6c1muNUwZp/MgGf8vwFPYiXVCXKGNrs7ndNsfL5HZ2R87dsMWbHHus9Ehrna48t/QaTVrKEd0aX41UO7VqOCKwc2qWlEm0uC4kqTacHGB8TAEA5arFfVnwBL+rHCayX9HeBUd2IR5/dzW1Iq62IFfSnb4lH1CEpnO0NC1GypDK0XlNuZi8i973wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6YWPz/kKxOzpIiaOl4hRKv0m9l8OfqDSbJMOe8RxCw=;
 b=Zk0ln/6sEg2PkkBrcGt13MlZGhgYc11N1XRIvTJyt853Lcn+4qYZ2lCGPj8drgqotiuXpiMG8hDEPSPuBQX8AY/LDuEEMSTmCOUQkVLR8P5gdACgrDOC2gnunCgZ386xI0QYof0qC7mllmstNG39S1t7hXiSf7MS3mtSB8kE7zx7Ms0Rp333q7seKupbrfURLKTBs3PccbBiqqh0LFgD7nNoUEf2ERRL1flCKY9kzj5ROw/zjaxt/b9ZiBJyaFqKY1zmWnfthTHXp4f4YaRVY4auPgEedH67EkEfsPOFihMjB6GxiLxgfGp7ZeT8XY3tE3nIH8SvZgyDY3nplRiNZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6YWPz/kKxOzpIiaOl4hRKv0m9l8OfqDSbJMOe8RxCw=;
 b=HCaSeh5JhxawnyG5+mSVZUAjFQL8fZwkoXivWOchkdTGkyFmSOXnwSbc2nwjyFfpWfmWcQ6JwvcMSz8e4vh/vCynp3dZ+H4bCIY6QgelaozDrPM9hnUNMlc1P+jcpIFLKURrrtfLs9WwOxf/AeDX+VSzf0T8wSq2EpmqFgZSgjY=
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com (52.133.12.32) by
 VI1PR04MB5440.eurprd04.prod.outlook.com (20.178.121.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Thu, 12 Dec 2019 12:31:19 +0000
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03]) by VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03%7]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 12:31:19 +0000
From: Alison Wang <alison.wang@nxp.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of
 unmute outputs on probe"
Thread-Index: AQHVsLyIRDFbzLs7vEuxsFkXl6DgTKe2NokAgAAA1bCAAAyIYIAABwsAgAAETYiAAB0nAIAAAbGh
Date: Thu, 12 Dec 2019 12:31:19 +0000
Message-ID: <VI1PR04MB4062585AB0F5A89D6682AC67F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
 <VI1PR04MB40620DD55D5ED0FDC3E94C2BF4550@VI1PR04MB4062.eurprd04.prod.outlook.com>,
 <20191212122318.GB4310@sirena.org.uk>
In-Reply-To: <20191212122318.GB4310@sirena.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alison.wang@nxp.com; 
x-originating-ip: [123.114.33.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 089b2f60-d101-4f16-1d0b-08d77eff308b
x-ms-traffictypediagnostic: VI1PR04MB5440:|VI1PR04MB5440:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VI1PR04MB54406D3C25169242120D276AF4550@VI1PR04MB5440.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(199004)(189003)(7696005)(81166006)(81156014)(8676002)(5660300002)(55016002)(6506007)(52536014)(6916009)(33656002)(71200400001)(9686003)(4326008)(478600001)(44832011)(64756008)(91956017)(66946007)(86362001)(66446008)(186003)(26005)(4744005)(2906002)(66556008)(8936002)(66476007)(76116006)(54906003)(316002)(9126004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5440;
 H:VI1PR04MB4062.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cqGHPQt1JJAe57ctnPxPXxd6Vh+TcgTricJK0KHp72qM1wwKITuppPfz9IWsBYJC8dFlULCtn3QC6eP/HykMi04a6hQr44wRuWPRMA4pTPwXTRicf9J2oZ+8Mh2OwifYnkNh4DVb6igbM3BNHW/FQPY3Sw1NNQHMghhc6xGHm5Hbw/mhhYl4BITIq4hnLFqwuIo0d1PU5U9K0lMDLUxv/mx4N3UHHxnpDOTRyPaTAi8VPFL7x15Nhx7FiHXL21l6jKNvGf3rBL2UZfQunSDOkhIq5SmpFBMCvPqyxhRhg0P6kElOkEKY/LFWzSfXhNt7SaSaRjSv36yHwC4Zk//m8xctYdBpz8OCBvvMJreGI1KtsBLJe9JthDH90SCZnWfBil0ed8TaUGB7fNVwOp8fXKLgWduA35qy069upml+dCBNHJQNOskAs1RzieAwjv0G6nQdL/q5hJpbP7AXkDbwcr3N3pdXKWWJMmZ80iALqYM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 089b2f60-d101-4f16-1d0b-08d77eff308b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 12:31:19.1018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uhZuZDDIsvvtS/lrBbe28EPyotKZ5khDbVv7KDxbk7KrwS5HIFTemK/UFjjSsYjXAQKZbG+raalXb+LMA3FbLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5440
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:28 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
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

On Thu, Dec 12, 2019 at 10:46:31AM +0000, Alison Wang wrote:

> We tested this standard solution using gstreamer and standard ALSA
> tools like aplay, arecord and all these tools unmute needed blocks
> successfully.

> [Alison Wang] I am using aplay. Do you mean I need to add some parameters for aplay or others to unmute the outputs?

Use amixer.
[Alison Wang] Got it. Thanks.

Best Regards,
Alison Wang
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
