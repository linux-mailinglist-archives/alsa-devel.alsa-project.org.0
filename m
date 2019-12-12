Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28111D0A0
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 16:13:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6150F16F5;
	Thu, 12 Dec 2019 16:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6150F16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576163597;
	bh=N3YBrwEGsSjbCqv7wOjmFD5Tx5g20c6IknAkMdF46rI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yq2JtgzIKkIklNfkaxjP1C1rEPjfI2ZGZ42lUGFpUhfgAZbsrrMgwm3gHNFa/Swfw
	 HqN9O6yodwMZ/RGxzTWnmZNcBLdgHSwdR8PD/oiATPYgnHW0d5AdAj9PYPyJL8Fgw8
	 zXjQ4qbLIWkFM3JoTpcPx8XAzTo5NMcs2gxFaZqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE0B6F801D8;
	Thu, 12 Dec 2019 16:11:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85E34F8020C; Thu, 12 Dec 2019 16:11:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00074.outbound.protection.outlook.com [40.107.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FDFEF80089
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 16:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FDFEF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="r6AngJXb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFQkA2r70DYjpKtLHGpPfsJyFoSxQ98e+raGFbRjsFbmkCwDKhquKiDWDRFc0xISvgIQ+dKUmvdCDx6i+agxRR7+qNx7eon7AflcOINWOA+BpVh1XD+H7H0aiW0umkafFqqb4nABwlSPvgad4bRJ45WX3lKWLj4/xbWUNztkeY+SEwuDPryYjVMod9j7HXe7kXxj0zTGpJPdefU5mqkYCZJtunG4h+6UAHLzPIcEu7T+QD6/Uh/qxaxQJHP5QA05F7gbvMCW8yFWq6XI0Tt7C2wNrpSrsQUxPNxuwrTaMmThLr4AZFHLn0xK1/W5qts4TUvAPxsazM7YCfeIQbgdjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQxR2DrpnoE0P+8pbX2YRQ+BLw+gXVeGiupicA2EdsU=;
 b=McNJtmPJh9cWTNj8rFZjg2KYEM2UeK55aEPbjzzREOPPjXCBtP5eBMyl7GVex9ASBoV60IkA09HXzi3If5JzXmXHlBYF6PFXKQJ4VERGwgHqMbH/eWtE2KGHSrvmI5E93sUjWIWjIAPt2aaq3cNco9DQ5o7SYE63JqCs8P9nJzgbFxwxFsoLStxdCqU3MTEgICe468+y2hP02RyF+/MADc46CdFuxBzRIdYTcG+oBkTO6Z5DOijfP2A4AkUgTvDEVIJZIKlLN29TnV90aTdm0ruwaiLQWNSJOMELZy3HhndMlweIQoYy2YLZZVwen3yXTPch5b25/lppHHKyNbTRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQxR2DrpnoE0P+8pbX2YRQ+BLw+gXVeGiupicA2EdsU=;
 b=r6AngJXbCwOMK7Dg+AHI+4ZyIS/+gWwIDR0/VTxcNmv2GznXsPCH4avjUT9XSlG2UmqD4aijmxnl9PIYOEcCKi5Sl/+vmoNMbpLuxmHBBcgVN38qJJAnZfOrNW2PGSZPI2UrC23U/sAD8GZA+H/HK7X9uowvU5BnMIY19ZnH/4g=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3565.eurprd04.prod.outlook.com (52.134.9.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Thu, 12 Dec 2019 15:11:24 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::453:3c87:9a9:d1ad]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::453:3c87:9a9:d1ad%4]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 15:11:24 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: Alison Wang <alison.wang@nxp.com>, "broonie@kernel.org"
 <broonie@kernel.org>
Thread-Topic: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
Thread-Index: AQHVsLyIRDFbzLs7vEuxsFkXl6DgTKe2NokAgAAA1bCAAAyIYIAABwsAgAAh+quAAC5xAA==
Date: Thu, 12 Dec 2019 15:11:24 +0000
Message-ID: <0705e7e703b9ff110ad9465ee9e06c9db76fd998.camel@nxp.com>
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
 <VI1PR04MB40620DD55D5ED0FDC3E94C2BF4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <20191212122318.GB4310@sirena.org.uk>
In-Reply-To: <20191212122318.GB4310@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d87bdf34-29a9-4af4-b7c2-08d77f158df0
x-ms-traffictypediagnostic: VI1PR0402MB3565:|VI1PR0402MB3565:|VI1PR0402MB3565:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB35657DCDF12F3CFA88118F9FF9550@VI1PR0402MB3565.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(189003)(199004)(71200400001)(6506007)(4326008)(5660300002)(6486002)(110136005)(54906003)(316002)(4744005)(86362001)(26005)(81166006)(8936002)(81156014)(4001150100001)(8676002)(2616005)(66446008)(64756008)(2906002)(478600001)(76116006)(36756003)(186003)(66946007)(91956017)(66556008)(66476007)(6512007)(44832011)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3565;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +yW+6zGZI2NMAG9oAMXB2HDijHObklxKrbruK1cWTsrxH3FiapZTOjzg0BxoC93Cj1t1S3mJBwazyW3+R6HPMX7sxqRjAifTE8xWkwrrQbbpFauAf9ParBtbMJwHVQJlUTKoACgV8lAEtklb6bvXomvUg72R9lwRCdKf/Wx/e1ce31nYRdKrJW0ANkV5PG3YaPkB9d8cbBPmDQ7Tpb55iMKZYnmGyX/L/VmNbXRk+doYN4wXU2OF3YUl351DvCJheIDn2W+rTT2Igs38pN5zMOo094p/IOWZ/+6HIUsnnDHLkCq62jI3S9ONrCELtdu8qbOhwsjsz68bG6qFP9xDQHEtJFc9QLbVPvgMAKH6V8IhWch4ad4qSqXdZpo7vUn5ak+h8shBStOCPLVps8QJDlSIaqYFTaL2HGEtbZM8ZLWdI9pUF/d1qA7HR99kgQtQdoBXjvhNym3vVQOfpbRCx0Wpbm4fIb8/bnMD8KQUFkebXc4Px2KoI5CqAC17PN6a
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87bdf34-29a9-4af4-b7c2-08d77f158df0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 15:11:24.6869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YVBWRUSvxx1i8p8KGOZpB2Mj3H3THhCzLbUECxLfgBFXUpLaBBlfWfRPp1QkLhy4NzgdsGxVBhrEDwCn1R7K6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3565
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "igor.opaniuk@toradex.com" <igor.opaniuk@toradex.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
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

On Thu, 2019-12-12 at 12:23 +0000, Mark Brown wrote:
On Thu, Dec 12, 2019 at 10:46:31AM +0000, Alison Wang wrote:

> We tested this standard solution using gstreamer and standard ALSA
> tools like aplay, arecord and all these tools unmute needed blocks
> successfully.

> [Alison Wang] I am using aplay. Do you mean I need to add some parameters for aplay or others to unmute the outputs?

Hi Alison,

You can also update your asound.state file with default state for your controls.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
