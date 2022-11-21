Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12554633870
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:29:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C311686;
	Tue, 22 Nov 2022 10:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C311686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109372;
	bh=4RXM0pWKM+kHHrZ4tU4sxrRVPFAjWVRYYi/el98rXhQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d2RCED+ewfjjxEV3FOC9t6R7qRwUBfOqpajVjtowIjK6TX75eZwdvvMYohlhlsxW9
	 zom+bX0/9zc5bwqM0BahEFkBAMzrBKAlOnHIwQ15tHN4ERREu71WNyC0rjiGZldTLY
	 xztfo7bmiHtljWcDZ0M210uJoWIZNNbtwuWysKoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7470EF80567;
	Tue, 22 Nov 2022 10:27:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B398F8026A; Mon, 21 Nov 2022 01:26:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF83FF800B5
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 01:25:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF83FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="da/RP4YH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZpJFgqe8VBIqpZBjYZZBiu70M0e872u259g5I7Y7YuKHdJ50q3D1/9j7a5KFjR6swqUvXCPrAKiwn8+DaVOMTZLGMcgJIpBNMeK/ofhQloHfhYlZGR8vKv96Kg2NmTBSWUOL+gcaNwUS7WHFmA3YWwZscF5ES/y2CATsxlOZyFexBex8r/klb+2ykgZcvogoT7mxo4vCLSKdKM0Nkk3+UPR5iOxaHrXrc/MXNMneyvkNHzq504n2yOZxeBMbTYdoAEHQRnImWpSqOI1gCSjJ2XTZFWZdidouKUsQmw0Ln3JRcYuTbi1jbrRvsnsUJdEKeMkaecm4VSxo34b3vzw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqJlfBDTfAAeQn0nYl5/qpcSiOchA+pQ+TQI6hJnY/E=;
 b=NE4d3udQSuTEM425g2Z37/xLGXHK/SXqUOFuGwDIY1MQ5TnHwz+5ekS4i2iCfgZCLOCML45n7xJhA7v2MlW4HshM38aYgyMKgVOR4ziiWEE5J9qHbjoqsH1cgNiqrCiGtdnCxk7vP0M61DAlS1AIKms5aVxnNaT4Tuy+qIMGhTHRhEQFWmAIAcSJqguWy91YQd6VhhulvCMr9zxiemIegkWCoK6X3PNJ3ZqMSjOI4Io8T0jfYJGLUS3i/rMYIRd+GChANCZhRoJwmOHcj7gi4L0HhOlX5IgPSilCVjS8qPYPAZkrxDh9FVye3I8uxXMynIufCZEcCy5CUgeGBPWOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqJlfBDTfAAeQn0nYl5/qpcSiOchA+pQ+TQI6hJnY/E=;
 b=da/RP4YH6OcstbDPr+ECwt2Rtt5FQYu1T06hwEoPJ98UfygNRElPSNyi8yRgaC6Aecb9OWTjkGDQ3cU1WccErxvpAPW4PlHQTzSD1dq9nvGEedBRkk1eQ/BN17mAGVkpif0EqOwssbqB+8SR2xKkE/19ZOUa4zIVQUeNMZ20DHk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB9407.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 00:25:52 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%9]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 00:25:52 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Rob Herring <robh@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Yangtao Li <tiny.windzz@gmail.com>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Javier
 Martinez Canillas <javier@dowhile0.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime
 Ripard <mripard@kernel.org>, Daniel Mack <zonque@gmail.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
Thread-Topic: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
Thread-Index: AQHY+55sqHJJZXHHEUGv/qPttLIYU65Ih+IA
Date: Mon, 21 Nov 2022 00:25:52 +0000
Message-ID: <TYBPR01MB5341D75C3C139DEAFAA599EDD80A9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20221118223728.1721589-1-robh@kernel.org>
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB9407:EE_
x-ms-office365-filtering-correlation-id: ce582612-997f-4390-e5f5-08dacb56f29e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xiULpy+xv0GaeT+uC/cVHMJdfDztyRubeh/MOVrfkimUNsovV8NZYpnFb6B+IjWw5EnqJrLykjeo2C4L7rPsuZfVMOYBAc9ZMMQE2+bS/SX+hvx1tcqO9k8ngk7Wyi51tGHmQZof7sNzcoIbfwHXBnGf20Tm5SkwJu40EFlrCkB5tjEKf3TbdYO+ZsoRLYYDRc8/Ah/sqQcsxRvR4W4mozD1KJX6e3gN7X7lOb243jQH3zmpCNz4S2PA+CWbGeldYflqT57M/o2dRe3Z6LlgQEk1CIHnkmjDb2Ek2BJRGt1nmZttnhJ62ir78aLP1PNbGKbXd+Mx0ZRFqcCIszZKVBOTeswfirsrLM4vWR7+otQwN33Ln1OHtlKQItKRPeZy/C/9ygaXbCOCqbYBCmX00Zkj3KV/0Vbm6J+LItOeihTUMVJdKLKO03h/KnkEbr2pZQxEmyIxtoRHIhV2ATi1g2L8nOZ35b7bJknGK6BnpY+OLPysXox2o4zae395rkIhfDc7j09qrPlFgjAhAwxq/T6nU8bzugqnxCnbGfWqj9G6E1oPjPzLf4nFpYBHpJXDqBrWGcLw+B1q0m9JrjIOsh+fLA2t1EvsjvNJWRkWvusJg/Yp9065Ja8cBwt7+XHypKBA6KEZ8x2eiqw77PQDjCEjkd27AIASwKLZLe4Ji6ctJQc0qdpE0qFJq69DqmHNq1sGN6ODINIv4iA+oVQYzCWmBKc+8TItDIP5pBTB/Jw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYBPR01MB5341.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199015)(6506007)(38070700005)(110136005)(921005)(2906002)(71200400001)(478600001)(86362001)(55016003)(38100700002)(122000001)(7696005)(9686003)(33656002)(186003)(4744005)(52536014)(7406005)(8936002)(7416002)(41300700001)(66446008)(4326008)(8676002)(66476007)(76116006)(66946007)(66556008)(5660300002)(316002)(64756008)(54906003)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Lo9iqX0dXJcYY1aDnJE359K66hPEIQHEwjljLdFufIxr3skSSZ5ZfospLQqi?=
 =?us-ascii?Q?RJHhIaqMmaKXPTkLJfK8SuCP7+pqqhrqU5UH1B/5I3xRQVbBqiNY60FKzeUd?=
 =?us-ascii?Q?KIf6fKLG9kV004OjV/uqHQvARjZJ4eeBn9uuWHXBFtrfzY8C/e+e/DibtLyY?=
 =?us-ascii?Q?j5khT/rX8s7uJSFP52Nnvcec6cYVldukO4pGCDAJrb/m0uHUZZ/pmCEBFHW4?=
 =?us-ascii?Q?lVsQAtFhkef5g1a8KtJw7xMOwbXKIWlSbZQJEYEJ6wPvf8XiofpZdFXYkiou?=
 =?us-ascii?Q?dnpKMkN5nm4B76LSBrvEUxBzsGQxFjJW+dqkx6T3Wgq41RX93mw2aZfBc4DQ?=
 =?us-ascii?Q?g2eS8/eFkCZZKLVB3RAjdZCMk7RbCzJs7Oe5CHYzrGxIdrKm/CWVC/cnu+er?=
 =?us-ascii?Q?tvjmuQ0hgFr9CvwCfrwKSad+V10uZ0dWii+AsoSbDWZiuQfi4mt69pZ++dGt?=
 =?us-ascii?Q?H/wqwVu9ZVoLZt6NWlWdCJvK++wXVRWy6ud6JfidpEOO7mawgfY2OBarvBrR?=
 =?us-ascii?Q?DP9s/Qtas+Rpya98atXl4p1KnsDPoTEUjNHHoAKm7OJKsTYdxnHJ3Vymyh8d?=
 =?us-ascii?Q?oSgilU1Tw23Jt3f4Vt5mDaBqNWnppB+nv8X5msi3ay3DzTg85Di3arC8GQ0D?=
 =?us-ascii?Q?quQfsA0/Zn6/cpUb4jm61TatOnhxgHFgUNbO22dL3I43FVwFQkCVAq/g/CuN?=
 =?us-ascii?Q?llhhpr9bsrJEccKVioKwF/DAkRyg86cRJudds8i2mblVb+DOx5cVxDjS1aH3?=
 =?us-ascii?Q?tmN+MZswAgqFje4BN57Lj0+taogSRFw1VxcHbtqpxw3IYv1uP6P0CkzICyge?=
 =?us-ascii?Q?cFh2URokZY2p5u18o28ViuaM6EZr8VXyhwTbigYID6TEa6i0IGt/e33GOr0m?=
 =?us-ascii?Q?FfmskgF4sS7zDqlMiPSDeRBrc/mKyfmXQ8CRAsRqDuFp9YLIErF0vYpQz+Ix?=
 =?us-ascii?Q?qTXQM0aMZP1ksXGLcJPzrKvDDOuYzfYNYLbvzxYLTxehRfWiKrvlrSlgM/pX?=
 =?us-ascii?Q?al6OrRXNf/7151STn7Y1O7rDKLR2ip7dGP0NjTrHNtsG68iSF1at61Hnllil?=
 =?us-ascii?Q?+FUYcePCLRLTSNTCXglaqOs5VEp15RUWhXTlr+Rr/gpfGdWDXZTX30ptLOgf?=
 =?us-ascii?Q?qb1iVFR5uvZgjISY6y2CBeBcz52ZFGW9yKeNBw5rS7oGuhSLSzhW7WKy7ziK?=
 =?us-ascii?Q?bpB4WYqcKXQVPgHT0l8XnZgvL1CAQXK4iYl5qtndCQcYbSwN9/nCCDNkY7MR?=
 =?us-ascii?Q?mZPcbkqzJ0OQDLV0IMDBo3sAuXAK541oWYQLWdOnV3K8XgkkgntsQvluB8Qg?=
 =?us-ascii?Q?vdrXGu8b84hSHn+TonWh1/Lr4BuIIupp5MdEepGLg1eXuWc33AK0hr5fJHu2?=
 =?us-ascii?Q?JZc6iReLz8FdI4wZGn+00vBi0Ww4krfHOkZo+LTsHbEXhe2b454vhWndnrXM?=
 =?us-ascii?Q?sVWsh2j1z2cqt5SmVjPM256CG1hMYSCAaxFus/5TUbO3OKYHpSpq6SpmzGDj?=
 =?us-ascii?Q?Gvzhqe/J7O5owekDI7OdNFWXr7g/yE4XUT4P8BIEwvn3IBJFzoWlvuz+tsN9?=
 =?us-ascii?Q?7myrAw/ioUUAjn9U5JJi6T/8kbiiXlf/cxRgzjxdtLQJdZoj25W9NRVAUSdt?=
 =?us-ascii?Q?aWKegdS3U6Hc+HjujpeVk6YMj3NJ76fZECQZEpvnJhk4l6UfgRv7ilqaTg7E?=
 =?us-ascii?Q?MaTMhQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce582612-997f-4390-e5f5-08dacb56f29e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 00:25:52.3847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MOsZdQW+2Yww1wsWAMJmrRrUwSCHQ7U8dNi5IielUC0CPYtj/QzZfXJDpFoC7SGVjqEbtT0JIWm5v94gIyVxFPhyGazBxAyrG7cnz8pMPqrkRfAOqONf/Q0PbT3kzKu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9407
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:19 +0100
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

Hi Rob,

> From: Rob Herring, Sent: Saturday, November 19, 2022 7:37 AM
>=20
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml       | 2 +-
>  Documentation/devicetree/bindings/hwmon/adt7475.yaml          | 4 ++--
>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 ++--
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 2 +-
>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-

Thank you for the patch! For R-Car PCI,

Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

