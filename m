Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D214C717
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 08:57:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2E4166C;
	Wed, 29 Jan 2020 08:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2E4166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580284621;
	bh=eS7WI+X8+qKIPUnbPtvH4d+yYhcWf8xDUFHk1A3ohaA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1FxO7xzQAYFXoCinGCfGQYYNhX+9z/JCNvsvjJ/tP5NBsRJc7H3OSnPRaL05yBj6
	 thGBQiqbYZytoH5CRzYpzk5SoJRCVVQnO+A2/Gf/8nOtUQGzs0ezqsk1BS80FH31fy
	 v/FiRPXl5Irs/q83+0gH++9i8eXjzZceDjbbzO6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4806CF8021E;
	Wed, 29 Jan 2020 08:55:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49F64F8021E; Wed, 29 Jan 2020 08:55:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 410B1F80122
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 08:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 410B1F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="FBYYVA5w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buI41FPMUyPGeAOuzweXMiBtns8YA8FxXctjMKrwZPZgdrJZaTn/boEGNEbxA3G2A03t4jArJN8GEcZTc359+1i1Tp0VcWrOxRFiGxR9Q7kIiCJ/QIyq5eigmdK4BxYrQLxcAm1hiGYNKPlYiiwIbaH2KhKl+/E+7VjE9ZD51DQqJvV/Yu65qKX1g84HMlNLQ/q0RWrSXhhtJ8DQGIUw+RVdVwGswYiWugp6Ik0r4PWcMHSd2SXRGKGx7FH9ChEnH98/OctdYbJB8/L5vzUlxqkGSqvPTjOkfcMDL/UTrnrCm+IwLlOMzGFGxFSG3q62iZWfzCJXCSYYShsrUOeaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9A/2w+RA1+49LegPSMnpQc9kDizVEC0v0gBNFKPdLw=;
 b=Czw6DWi8gqcsguqE4yX/nfrsMFIsZwYggv7czkkwldj1T7bS8YK6E2tiwj0IVYN6GJOc0noBrCOL4gcv3K4u1xyHWDESbChvg4pxsPkT1dMnFiyha38Uaw6VPao3SP74uW7p1z6KQ18BpFMEmS5+pUTBKRreWq5pvY8y+WP/SCoubMlXhFUrTSYNlvoA/e8KcYIww86piEiuYk0swjbmvQB6rNxRhsohLH0vXKMJg808ut/wiZZrS5wV4DDPqlhxsktlPMH6ccx2ZSiJ7xrpbao3mris2B6iqbk515DoBxsJOMfzNB4XkvXg2/eis2RKrlaIj5cRFy/xG99T9SkonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9A/2w+RA1+49LegPSMnpQc9kDizVEC0v0gBNFKPdLw=;
 b=FBYYVA5wrQJ12bsFGP08zW3qFrhXvE5TXf/Fz+/HzxbPLsE67rGdbZND4WdCphuZ6U+DCXerEUpAU1DaGfcqNbcg4V0/K0pZu1jIRt/cqLp7xmedgZgwAbYZG2rDKMHNNXHuGYbylRU9z+JrcbnqQMl1Thd3HxI6fJ3SMOfL+Yo=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3408.eurprd04.prod.outlook.com (52.134.4.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Wed, 29 Jan 2020 07:55:10 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2665.027; Wed, 29 Jan 2020
 07:55:10 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH v3 09/11] ASoC: SOF: Intel: Probe compress
 operations
Thread-Index: AQHV1nltF1Tqbjk/M0e3+OwbrMhxaA==
Date: Wed, 29 Jan 2020 07:55:09 +0000
Message-ID: <e8a5f019516a7db1d42143c18d8e1c9081d4e37f.camel@nxp.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-10-cezary.rojewski@intel.com>
In-Reply-To: <20200128104356.16570-10-cezary.rojewski@intel.com>
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
x-ms-office365-filtering-correlation-id: b98e1045-9209-4064-fdb0-08d7a4909072
x-ms-traffictypediagnostic: VI1PR0402MB3408:
x-microsoft-antispam-prvs: <VI1PR0402MB340825D3D97580E42748D3B2F9050@VI1PR0402MB3408.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 02973C87BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(189003)(199004)(26005)(186003)(8936002)(81156014)(8676002)(81166006)(6506007)(478600001)(4326008)(2906002)(6486002)(44832011)(2616005)(36756003)(316002)(54906003)(110136005)(71200400001)(86362001)(6512007)(64756008)(91956017)(4744005)(5660300002)(76116006)(66446008)(66946007)(66556008)(66476007)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3408;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bkAtZldzSBnbmCViQsdGnhhF9ykW4nZcbxG6c4tOAIRBKROcLjGb5cqkO5MKBmmyuPoMJnMtw/ithac6vJe6GzGwrbmxMkg2tbo+UYnpBqhMYvBF1RT2Yyc2s4tk2aFmCDEuFwtaQ4X4fwer8+dxOBjGRy0mSPnUDj1Ze7EFg+8eqIsWuX/OfK00+bn84kXZTn1qU1YOkvuUlGsw6pKl3NXOnHadfMcKMqzsefFg3B4Kf5JB4kNOpT7cljBm1L617ku8PQKwG2mh9LOaXx6WWoROtSX/uCDjbQPKryQG1R5MdTycUV6H1Uv12g1BWnDzbPr7kWiG6d3tUv82HkaY2fH8evlr2anbO2XKMipd8ZinTPYjDgFx99n6id5EIe+FSpryjXjZuQhfIsb3cxHWTLejCu3aba/avHsF0JbO8Nz5MDE1PoirSXRYfDhqYXu1tWZZc+JdULaI1kfPUPRTusb4E48oxU9wVgFqzonKwMg=
x-ms-exchange-antispam-messagedata: GM8peyc8fRF47/qSyZV0vOfcCJCEpRPhlyGvaYtsRXc+y274DRYpIc8Ru8ETc9nq0np9WazAJ0/jcfhMZMdhiqrsPsq0c/yler8/REqA+Rq0YlEI/mCNyjkIT+/aEbKj6tGbkvh1fzFDl1TwS5BVeg==
x-ms-exchange-transport-forked: True
Content-ID: <E4FB7DF13DEC3344876572A39A2231E6@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98e1045-9209-4064-fdb0-08d7a4909072
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2020 07:55:10.1106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OjdBZRk3mKZfujWzrD119+A15OajprEzVgwyK2gGUSTIPrOOK/1ZWPMMVtcatu5MrA8DdWwgCwL8wC6KuIgZhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3408
Cc: "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 09/11] ASoC: SOF: Intel: Probe compress
 operations
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

On Tue, 2020-01-28 at 11:43 +0100, Cezary Rojewski wrote:
> diff --git a/sound/soc/sof/intel/hda-compress.c
> b/sound/soc/sof/intel/hda-compress.c
> new file mode 100644
> index 000000000000..da7de867d0af
> --- /dev/null
> +++ b/sound/soc/sof/intel/hda-compress.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)

I think SPDX is enough.

> +//
> +// This file is provided under a dual BSD/GPLv2 license.  When using
> or
> +// redistributing this file, you may do so under either license.

No need to add this boilerplate code.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
