Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C23F8565339
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:24:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB051734;
	Mon,  4 Jul 2022 13:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB051734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656933888;
	bh=em9N4VEiffh+83IzLX86PAg22pkmGInTrfu8DYNhLmw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vVUcBlDtbD64YpZCDuzWuHn3TLow0eayQ4Xsio+Pf/n5+MTkHbFfOsODEagsTQ56B
	 cvfqDUHvaGn7grc3LiBQFdzc08JmRkqO94+ZOdUPrWBwqucH3oztw0jcXZjHnpVsct
	 Yr54QYmt4YTH0WvhY2ks4A2YPvqSuirDhu/agDTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 592A4F8053A;
	Mon,  4 Jul 2022 13:23:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2269DF804D8; Thu, 30 Jun 2022 18:50:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E07F3F80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 18:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E07F3F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.b="ZAjCRAGf"; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.b="Lg4ZJgwO"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656607795; x=1688143795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=em9N4VEiffh+83IzLX86PAg22pkmGInTrfu8DYNhLmw=;
 b=ZAjCRAGf0pXfRhj0EqmxIR6n4sIdDIvz9jvGgZRNvzZTQkBIehxvFVKD
 7XngrcQINEeF9Xdba+AWg9bo+nOp9Kp4Bv0c5a2qAthHcN8BnYSwfbBn2
 Gb3T/c/PVdXbPvJ9lSFDQOkrCa41HlXuHPU2ejDbREsRLAeQqlgGCZXYe
 FrOfoEEyv9G18tM3nabWA4V1HlAJxI8193SbOtReApYDFjsyu8vgCIkBo
 DwJz6cGl/QML+nm5/qLhEUcT8dr9QxTQbcPVr40KZ2RyRP63gJWapGgiu
 aMdB8rPNE+Hfk7P4o+2PYFOfsmco7dUtgOqlHHIAWEZH95o8qElQvmcrm w==;
X-IronPort-AV: E=Sophos;i="5.92,234,1650902400"; d="scan'208";a="204507366"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2022 00:49:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZA40t86VrqbkfSY5NMq3r5Lr/yeUNLoOJ9TXYiF9RFC8oHRhNTNGtwhgqpyAyUDUTdotx5KcOJvD8M+vRtBZWcz4/w+LpIIPyFGb8cTfcZAGDa0uCYvu0NY5ESFm9X/KhAfpFoqBs2+iFxQUC9wPriHE3UTUvuNycGggS5bXh2wmvNrm1hzZW6n09DmRqbppVfUHtDyABWmDCqapFpmxQAcmTgMeSzVQN7hkoPNqpZw5Qhia5blhPDzr3jgUPAD44uN2clyxVZNXHAO95mmzPqn64dkFCPNEQ6b6z6ru7IxGt6N6EN+tA9ZSPCVilmRRtUQ13aQQOerfBZ3SJgmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ovFl1yj6jvEDVo4uL9Y68VenNJiNcKa6RbEBHiNf/I=;
 b=lYmTwDZUwmJ0ntwM0OTU6P5XDDimoTqCFQFB59kdOVvhNTGvaoCSUMJ4vpysL7kUuSwhiOiZG+EjgLEQy2atRtNtZ+2eTJuoZrlzEV9xx1TxLWqssPhTu4Yy1QDGCUBLoedCuRmqF7cuTbTRbyT1O7QFK4k97KQgT6wNOwE8+lYoqZ1wtqVenH97Sj7ZD4Lu4ylWb+8H0s6jocvrnRUhuHHxAfk2GTymLekgfqwDDLAD3+TIn4irjj3z7G/oDU+NW4n4ogXZXinp4z9UpFhS6vyhn2UwNgJCbl+fu7wzZuvK5h4avMsAEJBuOzUhq9lykewwXBG3kZicN4hRfpdIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ovFl1yj6jvEDVo4uL9Y68VenNJiNcKa6RbEBHiNf/I=;
 b=Lg4ZJgwOrkQ94g6LqEb+f1rN01yinkjS06RtFAUhLe5JCUIEjbNu4vqjEfwf2alFXu1Iq67sBMlfwIgIPgxWQYrAfYClFS2Pc32H8W4IQuCT3OnqDP5NvQmiH2CR78CagBplFTK0phGGbrCzOtSRuPSbJWK+6nUarRbF8c1j2Cs=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by CY4PR04MB0822.namprd04.prod.outlook.com (2603:10b6:903:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 16:49:46 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::6177:a7ca:8caa:d19c]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::6177:a7ca:8caa:d19c%5]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 16:49:46 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg} warnings
Thread-Topic: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg}
 warnings
Thread-Index: AQHYi+hXj2sosdWAnkOJ8cSxOUjZ261oKvyA
Date: Thu, 30 Jun 2022 16:49:46 +0000
Message-ID: <Yr3UKQ/772oFyvc6@x1-carbon>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-14-mail@conchuod.ie>
In-Reply-To: <20220629184343.3438856-14-mail@conchuod.ie>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54a3f5bc-a463-4316-cd64-08da5ab88a07
x-ms-traffictypediagnostic: CY4PR04MB0822:EE_
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xGwGUHx7mHv3lLZqCjr6IHRlopQ3KdwLtf9EnHckofit3NosD75K/LpDEAxwv8zrpR/P/cL2FhCgG1T/Fpj74NoRwxLHZ+L4Se/p23xFQ1wKZksLlWqxXNvbvrk4WoEcWCTV3S12Uj0+Nsn9ZZix7brb3UUjZfD79ZBaRUf0xacK5qlj5Iwr8B3eGIybIUHyaTSsPqJtssLn0t9KqwUAOK6gMYb7ZgoJOlcVycpM2XH3BeiafABz/gnRaDvJmUTZsKiZC5C3Lc11iUTH41anVXFWY7jSjPxT1i+VXrtFJ32KkGRZ8EspSFs+qnBwJMS5Od71tPtxCvjA96Xv2gAYGyWEwGhL5oib1qCQQyi5RU9FjT7DdO6+ziEeKsYpLa3s3FZQy0lqSl55CPFeczZzLvs10g4JRe74iJkjE8PW+NxDlgj0xA1TXj8sBioTqTCdOgKdM3W9RAVrLufrWLAwzquQOl4dO8uG2FvoSYQ5oArOvXVe1SjjLFQNhGWfDI68pgQ0Xxta36O0D3+59nNv//NtHtmtOU9J3ARDEmuJ63QcAjebGjI1Pingeou2Mi/cXylDG2huSxLk1JyXDfqrfWs0Lx2ELzQniM3Rzl9tx5iNPYKI701q56P9Jg10WER0jUjnxrMC9LzR9D/Haf1jGpLxGT4O0zqBBaYhFTk3Awsg3JD32H+1G7t/JSfeAMR1JAGwV0oJKnzcR+X8IUx5QXQEXRlT2WZnDYoPz+6m00KOBvV83RPm85oxdnGXelq7wJL6J2DUJ+Yt0iVjMqrFZ3M7x6z2v8DbSGDIsjhnr4JVTo5pQ0G0VGfxQFZbSmbS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(6506007)(5660300002)(4326008)(54906003)(8936002)(7406005)(26005)(8676002)(66446008)(71200400001)(7416002)(6486002)(38100700002)(38070700005)(33716001)(2906002)(41300700001)(122000001)(316002)(6916009)(76116006)(66946007)(66556008)(86362001)(64756008)(66476007)(186003)(82960400001)(91956017)(9686003)(6512007)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Ikj2H3ZEkcXbufqWKX8oYZu4rBxP0LN+xhyBpLWCFe16QxSRHJoW0PHt6fm?=
 =?us-ascii?Q?EP0MR3PmcpJewdiaFSTRAVZ1681EJSRMUvQA0VJ2hO3DdKiwNWouDrnIO42v?=
 =?us-ascii?Q?Uf1MGETTlUy3ZygnBy5uG5nRRC1Q+L0CXm3vPiCUt9jRuZ8BlBiVKtAqJMpG?=
 =?us-ascii?Q?PpNHw/j1snaR+nVqo17A4aVr41U32yqlX/bdzWIEzxwMYISPvzBnz/fAXcOl?=
 =?us-ascii?Q?j/RBeQpEm6KbmKLi+J+JMNNp6JW281kOnAgMtRpCV5q0xt/VCHVJCtnt3X7Z?=
 =?us-ascii?Q?WjPqIwlisKJqe2nOS2fBM4+oqDHQv/Lja4nVmty3HEzZxaEISRIhTQWQQYFa?=
 =?us-ascii?Q?cpHmq8acZlkZ2iIAXyKZW+XDMXaSrOtkgqZbAoPJeBCkeorQ9S2EfrVAduM0?=
 =?us-ascii?Q?Dz+YLOkB0nSL0cdmt1Vm2Vmas2XTJDN39yRRq0U0274l5+qbq1hXvMuj//yA?=
 =?us-ascii?Q?vCB4WRfXa/uq+iyQ5IIUH6xvX7IPmqn5IXXVK3tqRBYF124aEfSze4gUzvQq?=
 =?us-ascii?Q?kDwoK55hewLWqBBYjyNZ7sZEJEiYigMbmzpCgCU8FzTtrTy52fjV6u3r6y3x?=
 =?us-ascii?Q?ESiJRFEqrf1U8AV0QhayW7puFRd6sVcBFZt0DTYo9NnIPOsv+AWxehPLStkU?=
 =?us-ascii?Q?PeOqslMGHR/An7kR3yRO5YBKWD7bSARG2mRqagc7TXPek2qZZHTWteub5vFu?=
 =?us-ascii?Q?LgxrAxXB4No6hP5DmW2BkJ9tp8FRop2/IvfZpi/V4WW29G96Yiy6RGABRYsQ?=
 =?us-ascii?Q?zp5H6pOBlD2QeoPJcklyzFx2X+2MLHvMu3QqCjwrHUmf4xQy+NKTptunrU3F?=
 =?us-ascii?Q?ozWp/NSq3DsczPR601JyXnZhw0SdQppAXe3cs9v+u1t+y5G/HzY5+vMvHELB?=
 =?us-ascii?Q?TGeHkCqmtoTpoH4eHboHF/KVeO41IepYq4XNo8MtDbO9NYyFaxpI1W0M1QAF?=
 =?us-ascii?Q?wM2ay9WUMPo39HuGUA4AB6UXC9eg4rIiG9b90jlkpBdLikgeZ2hiQxJ0crMQ?=
 =?us-ascii?Q?ZthBevD7Ih0B3/RA9lvcQNUmrYB19DSnFd5oFcMiirNCpLZ6wxZkPD1t06Gb?=
 =?us-ascii?Q?P3PzlbKSlcR8xu3O5BAVtQlhEAxT+C07f7EnR8JXYCod4pwlyGle32rkI7O3?=
 =?us-ascii?Q?U2OWcdVC0cXpLdRFZB7pScwEmlcx3+u9/twG+UU6yZqi7QdGBpenMHCjOY8G?=
 =?us-ascii?Q?+MO9p0jnaKUyJ7/go/b/fKd8RJyNmpiI0RtgYECGQLbBUfms79sbahgfo3Ix?=
 =?us-ascii?Q?XrX6lBX/TA7uPdioETBLWpxSxCSxb/fyXVKOlRVsCcgfuWIo4//o8FvYhfAE?=
 =?us-ascii?Q?ufbfgq8N2c+uaMJ8RImRuW2FldyE+2CDlYD72kTUjzXgshoJZuh6q+K5rB9U?=
 =?us-ascii?Q?JU8P0GckUNtD8pahdo9PSuKjuNxYFxhxGAb6R7TpYlcOAoaqo/uJYcxRXCc+?=
 =?us-ascii?Q?Wzfq++vtIaKRGJhJmKWlx8/gdjURJP9PRbO/hYOKbFyBm1TkHRlqKC8FERfG?=
 =?us-ascii?Q?lXmMHl9KzxRQ6WZ2p0PY/SykBuKitpJEFHoaXTGqdoU3G/mDQm6OgOD0ilhW?=
 =?us-ascii?Q?+gy9vfuFBs2neqdEvFd6byTaX6fWZk7fZq/UTWMuIXnY5K9YTjwAeXk/Qon8?=
 =?us-ascii?Q?CQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BD1370083812634290D1F8639994943B@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a3f5bc-a463-4316-cd64-08da5ab88a07
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 16:49:46.2127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sqA3RwBwWVXvGgEYwKeeZQ6coBLmxfl67IQRrjo36+liXyJOxoU/fZkNXcsZwAr3BEbnw42X70RgpT2CChfheA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0822
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:01 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jun 29, 2022 at 07:43:42PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> The k210 devicetrees warn about missing/empty reg and/or ranges
> properties:
> arch/riscv/boot/dts/canaan/k210.dtsi:408.22-460.5: Warning (unit_address_=
vs_reg): /soc/bus@52000000: node has a unit name, but no reg or ranges prop=
erty
> arch/riscv/boot/dts/canaan/k210.dtsi:352.22-406.5: Warning (simple_bus_re=
g): /soc/bus@50400000: missing or empty reg/ranges property
>=20
> Add reg and ranges properties that naively cap the buses after the
> allocation of their last devices.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/c=
anaan/k210.dtsi
> index 948dc235e39d..6a34dc4f3e51 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -163,7 +163,8 @@ apb0: bus@50200000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			compatible =3D "simple-pm-bus";
> -			ranges;
> +			regs =3D <0x50200000 0x200000>;
> +			ranges =3D <0x50200000 0x50200000 0x200000>;

This looks wrong.

The property is called "reg" not "regs".

And I don't think that you should provide "reg" at all,
simply supplying "ranges" should be sufficient, no?


Kind regards,
Niklas

>  			clocks =3D <&sysclk K210_CLK_APB0>;
> =20
>  			gpio1: gpio@50200000 {
> @@ -382,7 +383,8 @@ apb1: bus@50400000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			compatible =3D "simple-pm-bus";
> -			ranges;
> +			regs =3D <0x50400000 0x40100>;
> +			ranges =3D <0x50400000 0x50400000 0x40100>;
>  			clocks =3D <&sysclk K210_CLK_APB1>;
> =20
>  			wdt0: watchdog@50400000 {
> @@ -437,7 +439,8 @@ apb2: bus@52000000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			compatible =3D "simple-pm-bus";
> -			ranges;
> +			regs =3D <0x52000000 0x2000200>;
> +			ranges =3D <0x52000000 0x52000000 0x2000200>;
>  			clocks =3D <&sysclk K210_CLK_APB2>;
> =20
>  			spi0: spi@52000000 {
> --=20
> 2.36.1
> =
