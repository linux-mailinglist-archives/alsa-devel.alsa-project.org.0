Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F390170E1CC
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 18:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80BDD1FA;
	Tue, 23 May 2023 18:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80BDD1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684859426;
	bh=9t+4khgt07z0sWtB5PBMA5v74CVB2QINxurebS6hjmU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hHosn1lxqNmFaYK79k/91wlZv8LVdzHAcqXh8LZWDY1fZChfhebrpZo5WWz9vbnHV
	 hUzos1Y4rvV76hPJYDGAOYmAda5vra4bMeNjC6N5hPfJ+lsoo63srE6PaINfBJG8Wg
	 0W/x58m/FS3GF2TrRht5sHhSk5dg9s075Mu92EmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 796C2F80249; Tue, 23 May 2023 18:29:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C14BEF80249;
	Tue, 23 May 2023 18:29:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 172C9F8026A; Tue, 23 May 2023 18:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB86FF800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 18:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB86FF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=FwwSFP0b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiDaWDmdiyLObTt8SJaNRN7vyaw7/bTpA3rFVsvwh3AMnBMIaJyX/6QI2ux4dFwe6Q26FmPpgQKOuB43sh5/qpjYzpFfC0VfpGETP3jgeH3ZAr1J30cmzzRtT+bKDK88wIhIcGBDcF+CXcJTkiG4w+3RdD4HdqHDON6epxaXWYbR3skxeKky+y1l+TsoLqkyZywnxo1L46lGISSkGj+0602Px2iC+EvFbHtQu+n3oVZPsOrBsBiorUTlpdR25LTJrZaWKuOdnaRkD+TZqerAoqfZCywh0q2LNHtxl6bO2ROFJ9XsHAY4AeXn2LIYo6lQy3WM24vv3ORoqazCMwfBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkU+XfaDwAH9bC/f6ZVjdNzjyyBCFlEMkJsoHC7Z9eY=;
 b=S9P2dv7/HOmX23n3h4jIu/kszkDhA4L28LR2PGqcWNeX/r9kdvDoyAnfn5Pm7zBG1RH/UKWHyScSsFYKYiQDElcwD5Ho+JK+0C1fuGMEfQwdIYEczsFxL3QCH2fjd5LzAe9MWewgGoCDn6cmH+sJzuLlcsg49lmz97z1N/+S0Qq8w1RKTeLUGP4WgGY830SldA8boZC+XisCKnjNHS7zN5EgXR9F40bPnTUzTp2suBnkcJHe9zyKiDyGoVWFFqoXw64sOYeyFD61OuWR0fTipoyJYi3KEgJs9rD+J0C5eGOhntxsBlAFt052d64f8CZ2OrPs3959Jt5xdtFyQtQ0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkU+XfaDwAH9bC/f6ZVjdNzjyyBCFlEMkJsoHC7Z9eY=;
 b=FwwSFP0b+QZ94pLPgtryvsnzqk2OpJz3wxbplnYMJk8oHqR9Trn/yHaNnYkOEcH9F9wwXUixBtwZJENdeL9mMPVeHsF4UMXJR3hC8lgLyU3lMydsqSySK8RDfi1taIPir7mM43SARzdVZUzo7ac44Y4PMr3x+4UVpQrrrIDOrhM=
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by OS0PR01MB5683.jpnprd01.prod.outlook.com (2603:1096:604:b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 16:28:50 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157%6]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 16:28:50 +0000
From: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
To: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
CC: Support Opensource <Support.Opensource@diasemi.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [ASoC: da7219: Add Jack insertion detection polarity selection
 1/2]  ASoC: dt-bindings: dialog,da7219: convert to dtschema
Thread-Topic: [ASoC: da7219: Add Jack insertion detection polarity selection
 1/2]  ASoC: dt-bindings: dialog,da7219: convert to dtschema
Thread-Index: AQHZjU+UTtRGl9xKPkyzV55UMBjkh69oDKsg
Date: Tue, 23 May 2023 16:28:50 +0000
Message-ID: 
 <OS3PR01MB6641FD6C6FD8C5EE212E57E4CD409@OS3PR01MB6641.jpnprd01.prod.outlook.com>
References: <20230523082101.380-1-David.Rau.opensource@dm.renesas.com>
In-Reply-To: <20230523082101.380-1-David.Rau.opensource@dm.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6641:EE_|OS0PR01MB5683:EE_
x-ms-office365-filtering-correlation-id: 8373f99f-5445-4af6-02cb-08db5baacacd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SqGMDJnvorGiHN3me7FhFHhMthJp38Gr/tYEKugQkda3Ni11Nu7feypVErikjtQ7pKW7k9zpguHBoM3xGVOeD4brdaj/SLnHijYgYlltY18dt/xHvl+Lu60VNxnRwr3xXXqDFgzWZR/w74YZJJC8ucDlhgsjykia0Lz4wk2pXH4GTBbfV61Yiv4zmfgsAjX1ae3rj3eijWZOWynYYNqlf1YMUhgOzvuBU7kUTrQxhU9asOP+n2SyFU8nvcYb5ix3+/H81eES+aPpVSr0/kE44Ass9h39RYWPBqVmVLMXR+qL4WTkOjQNWpBrvYTYrq1CKvTgbGidbCk3gVQM1XCBW7c2QdDZje99IlCPQuDr6w2sfu+9uPX8zAjB8Eq5ZVsU8afx76b66YK0IJgarsHiMNkReZ6IDoeOnP3c9uEWLGHPyxAaZlUJO0WtxOOvNCnOcRU9+xQjbKZqK/FH6QcMkS+2UD0kxE0gkaGuG26A4BkhicFRHKMEoPB+WKw2Ge0bJjYBGQEy4EA6XFTall+V8pcZgw4Gw+Iqi8NNFyiRIyuYqT6MIneIaG/WI/9VMM8P7+L0+yoiq1J8zd+b2eCV1yB+N57haNt4LiAsqJL4f4U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(38100700002)(86362001)(30864003)(2906002)(478600001)(8936002)(40140700001)(8676002)(33656002)(6506007)(52536014)(4326008)(316002)(5660300002)(9686003)(54906003)(110136005)(53546011)(7696005)(83380400001)(71200400001)(966005)(26005)(122000001)(186003)(76116006)(55016003)(38070700005)(66556008)(66946007)(64756008)(66476007)(41300700001)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oF709qdZrXS0A36RWIgv9canvTUQIn416b2HUPzAiHzf7/XGoaxSLooCpl7s?=
 =?us-ascii?Q?63TE6p8x+stUmjSDNnvkq01bci7DabVDbTlYHFt6+RiHb5zeb33ShEvSbZou?=
 =?us-ascii?Q?wCxePFDTUZcq1B+Y80avVeC1xUsYhC1H5GFlntsIpYTE/VWwtxS8bG4ZnOiQ?=
 =?us-ascii?Q?7edkjwSVQ8zIBTHwloFIG7ca/5bZ2AT3zyKWtD419m9ofAb1X0pPG2bjT/Tu?=
 =?us-ascii?Q?SOFiB77sbVEdS3hnZR7iq0IpdXic9/49met5PRGEPZmeWczglfSdc5Bu90xb?=
 =?us-ascii?Q?r/OhEXR2nbJsaQ7avKqkamzpp3WZcFzXnYAtzMEj3VhkuOO1q9FoJzeUmkgH?=
 =?us-ascii?Q?8o1WFjLfidK5OWb+kLxSN/qRkm+LQ3P5q+MIS3Al2APMROE6OtiaQNClfnJb?=
 =?us-ascii?Q?aG6e1zUSdh+ZzYuPd5KbUjt7S9/3JYspQ7xNv0XqWt5NxGCim0YWdw0sw6Ah?=
 =?us-ascii?Q?9RLm1tjXKmhAJ0J74SYX1JgRtANM3EWIcN4jJAD7l2V6Xv+SfYr5wdZAHl2F?=
 =?us-ascii?Q?yax8mHFA5bRI+MgOuv95fAO9MI5WrfwMLwtuwUr94GnojIclNhH9m5m3IXDA?=
 =?us-ascii?Q?m3PJoDnoCqj5LJEprK43LaYsQCAYi5pP//LXJ9sXxpkESM7dpYOUCLpgaBN+?=
 =?us-ascii?Q?JMokUvb8MX2NEmna/0RSyHjWUuVr+mw7jkO/oFuDhvLIXgzpB3om9WAWHuwj?=
 =?us-ascii?Q?ylFr0+rogQuNoMKEPKqWoYdj3SczzGUk3Q+jmbVubQCo4XiU0pLNcnJxFPLr?=
 =?us-ascii?Q?chNEfEena3PnIkCwG4nGpoX9bZC165RqjtNnORjzUqFxjrhC6vb/7OtwXkQm?=
 =?us-ascii?Q?kjtQBaJb4mP1M0+hFNIQyd1kNntTbpKu+Fp8LmqdEg/SrbwlJ4/nAEika1xY?=
 =?us-ascii?Q?fMiX2G+mCZeL0yjOC/ViZ0ULD0lXzge1fdJyjD9VP/xR4H7OpGd8Dosu4c17?=
 =?us-ascii?Q?07LZZzSrpHA9pFT8PCfT+zZKxuxsVYbUKlwheVFOK+nqzXUq90Mw9Fyx1lRK?=
 =?us-ascii?Q?EKi9WsmjD2oiKunub/XtJIqvktbfpitJNUDRTuOdqjUh3XDa6togwNVy6eLu?=
 =?us-ascii?Q?zt5ScX6A2P1/UVKwd78f+WSQDpflPm9dFuWVFWyzOscbkkvpLQhjY3qBRS/O?=
 =?us-ascii?Q?orwLg2RfvFZmgn5oG9k9gLwle6+QBr+RfTpm+aYrm0oRcCx/PJ9tl+Esl+sq?=
 =?us-ascii?Q?LJvt+oB1zV1qTJf8gFkP0qxPMZZ00KCwRyAbWUJN6ERsws0DnRmSdLqI3GxD?=
 =?us-ascii?Q?HGCh2C1fq/CgPRSMey3dfvm+PKN9fJNgBFPWzOqTsfROUJRRJH9PJ+Vac0D2?=
 =?us-ascii?Q?OLvLd15I+vTtdMjOUTpf2M3qvL4jdNjDqxSvi4bmSSNiwUNgc1vZWi6av6iE?=
 =?us-ascii?Q?BXVijGKyfAtqMAbvKdxHR/c0Xk1zw9r9L4b1D740H30u94mDVieER8KHJ+qz?=
 =?us-ascii?Q?BfRjIPv5FWDZOhKmNBPhkJP0D6JEQDIqpySAHakU6ObWR553Dx5wmZaXMNy9?=
 =?us-ascii?Q?UB13PtEG2KN/d7535YRAsCO0UeJ+QWbLJmHaYubWFfEU3DTTOjJ4ky7mGQ5B?=
 =?us-ascii?Q?yZ0fGplaTV15wTCVGrQdYv8+nDBfT6ZqmDjaCokum8RZdGWUhTYj27P83eCu?=
 =?us-ascii?Q?hg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8373f99f-5445-4af6-02cb-08db5baacacd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 16:28:50.7491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 4VtGXHV0Xkb73xB2Fo409mSXobwlnPVkkwXvqe5Hsl6z9l/Rv0+dMvhV9Siq17RWSAj4Upnxz1thUx2D/+rwwYEFFb9/ccZuX2v5trhLpmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5683
Message-ID-Hash: 3FBA2XXFSIGULFGVKTZFT7LZ5RTRFLIJ
X-Message-ID-Hash: 3FBA2XXFSIGULFGVKTZFT7LZ5RTRFLIJ
X-MailFrom: David.Rau.opensource@dm.renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTNPZUWXUH6FD7S7777LRFPUYVJ2PYPY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Please ignore the patch.
Thanks.

-----Original Message-----
From: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>=20
Sent: Tuesday, May 23, 2023 16:21
To: conor+dt@kernel.org
Cc: support.opensource@diasemi.com; lgirdwood@gmail.com; broonie@kernel.org=
; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; alsa-devel@alsa-pr=
oject.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; David.=
Rau.opensource <David.Rau.opensource@dm.renesas.com>
Subject: [ASoC: da7219: Add Jack insertion detection polarity selection 1/2=
] ASoC: dt-bindings: dialog,da7219: convert to dtschema

- Convert Dialog DA7219 bindings to DT schema format.
- Remove unused `dlg,ldo-lvl` property.

Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>
---
 .../devicetree/bindings/sound/da7219.txt      | 112 ---------
 .../bindings/sound/dialog,da7219.yaml         | 230 ++++++++++++++++++
 2 files changed, 230 insertions(+), 112 deletions(-)  delete mode 100644 D=
ocumentation/devicetree/bindings/sound/da7219.txt
 create mode 100644 Documentation/devicetree/bindings/sound/dialog,da7219.y=
aml

diff --git a/Documentation/devicetree/bindings/sound/da7219.txt b/Documenta=
tion/devicetree/bindings/sound/da7219.txt
deleted file mode 100644
index add1caf26ac2..000000000000
--- a/Documentation/devicetree/bindings/sound/da7219.txt
+++ /dev/null
@@ -1,112 +0,0 @@
-Dialog Semiconductor DA7219 Audio Codec bindings
-
-DA7219 is an audio codec with advanced accessory detect features.
-
-=3D=3D=3D=3D=3D=3D
-
-Required properties:
-- compatible : Should be "dlg,da7219"
-- reg: Specifies the I2C slave address
-
-- interrupts : IRQ line info for DA7219.
-  (See Documentation/devicetree/bindings/interrupt-controller/interrupts.t=
xt for
-   further information relating to interrupt properties)
-
-- VDD-supply: VDD power supply for the device
-- VDDMIC-supply: VDDMIC power supply for the device
-- VDDIO-supply: VDDIO power supply for the device
-  (See Documentation/devicetree/bindings/regulator/regulator.txt for furth=
er
-   information relating to regulators)
-
-Optional properties:
-- interrupt-names : Name associated with interrupt line. Should be "wakeup=
" if
-  interrupt is to be used to wake system, otherwise "irq" should be used.
-- wakeup-source: Flag to indicate this device can wake system (suspend/res=
ume).
-
-- #clock-cells :  Should be set to '<1>', two clock sources provided;
-- clock-output-names : Names given for DAI clock outputs (WCLK & BCLK);
-
-- clocks : phandle and clock specifier for codec MCLK.
-- clock-names : Clock name string for 'clocks' attribute, should be "mclk"=
.
-
-- dlg,micbias-lvl : Voltage (mV) for Mic Bias
-	[<1600>, <1800>, <2000>, <2200>, <2400>, <2600>]
-- dlg,mic-amp-in-sel : Mic input source type
-	["diff", "se_p", "se_n"]
-
-Deprecated properties:
-- dlg,ldo-lvl : Required internal LDO voltage (mV) level for digital engin=
e
-  (LDO unavailable in production HW so property no longer required).
-
-=3D=3D=3D=3D=3D=3D
-
-Child node - 'da7219_aad':
-
-Optional properties:
-- dlg,micbias-pulse-lvl : Mic bias higher voltage pulse level (mV).
-	[<2800>, <2900>]
-- dlg,micbias-pulse-time : Mic bias higher voltage pulse duration (ms)
-- dlg,btn-cfg : Periodic button press measurements for 4-pole jack (ms)
-	[<2>, <5>, <10>, <50>, <100>, <200>, <500>]
-- dlg,mic-det-thr : Impedance threshold for mic detection measurement (Ohm=
s)
-	[<200>, <500>, <750>, <1000>]
-- dlg,jack-ins-deb : Debounce time for jack insertion (ms)
-	[<5>, <10>, <20>, <50>, <100>, <200>, <500>, <1000>]
-- dlg,jack-det-rate: Jack type detection latency (3/4 pole)
-	["32ms_64ms", "64ms_128ms", "128ms_256ms", "256ms_512ms"]
-- dlg,jack-rem-deb : Debounce time for jack removal (ms)
-	[<1>, <5>, <10>, <20>]
-- dlg,a-d-btn-thr : Impedance threshold between buttons A and D
-	[0x0 - 0xFF]
-- dlg,d-b-btn-thr : Impedance threshold between buttons D and B
-	[0x0 - 0xFF]
-- dlg,b-c-btn-thr : Impedance threshold between buttons B and C
-	[0x0 - 0xFF]
-- dlg,c-mic-btn-thr : Impedance threshold between button C and Mic
-	[0x0 - 0xFF]
-- dlg,btn-avg : Number of 8-bit readings for averaged button measurement
-	[<1>, <2>, <4>, <8>]
-- dlg,adc-1bit-rpt : Repeat count for 1-bit button measurement
-	[<1>, <2>, <4>, <8>]
-
-=3D=3D=3D=3D=3D=3D
-
-Example:
-
-	codec: da7219@1a {
-		compatible =3D "dlg,da7219";
-		reg =3D <0x1a>;
-
-		interrupt-parent =3D <&gpio6>;
-		interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
-
-		VDD-supply =3D <&reg_audio>;
-		VDDMIC-supply =3D <&reg_audio>;
-		VDDIO-supply =3D <&reg_audio>;
-
-		#clock-cells =3D <1>;
-		clock-output-names =3D "dai-wclk", "dai-bclk";
-
-		clocks =3D <&clks 201>;
-		clock-names =3D "mclk";
-
-		dlg,ldo-lvl =3D <1200>;
-		dlg,micbias-lvl =3D <2600>;
-		dlg,mic-amp-in-sel =3D "diff";
-
-		da7219_aad {
-			dlg,btn-cfg =3D <50>;
-			dlg,mic-det-thr =3D <500>;
-			dlg,jack-ins-deb =3D <20>;
-			dlg,jack-det-rate =3D "32ms_64ms";
-			dlg,jack-rem-deb =3D <1>;
-
-			dlg,a-d-btn-thr =3D <0xa>;
-			dlg,d-b-btn-thr =3D <0x16>;
-			dlg,b-c-btn-thr =3D <0x21>;
-			dlg,c-mic-btn-thr =3D <0x3E>;
-
-			dlg,btn-avg =3D <4>;
-			dlg,adc-1bit-rpt =3D <1>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/D=
ocumentation/devicetree/bindings/sound/dialog,da7219.yaml
new file mode 100644
index 000000000000..9160f68696dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
@@ -0,0 +1,230 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog Semiconductor DA7219 Audio Codec
+
+maintainers:
+  - David Rau <David.Rau.opensource@dm.renesas.com>
+
+description:
+  The DA7219 is an ultra low-power audio codec with
+  in-built advanced accessory detection (AAD) for mobile
+  computing and accessory applications, which supports
+  sample rates up to 96 kHz at 24-bit resolution.
+
+properties:
+  compatible:
+    const: dlg,da7219
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  VDD-supply:
+    description:
+      VDD power supply for the device.
+
+  VDDMIC-supply:
+    description:
+      VDDMIC power supply for the device.
+
+  VDDIO-supply:
+    description:
+      VDDIO power supply for the device.
+
+  interrupt-names:
+    description:
+      Should be "wakeup" if interrupt is to be used to wake system,
+      otherwise "irq" should be used.
+    enum:
+      - wakeup
+      - irq
+
+  wakeup-source:
+    type: boolean
+    description:
+      Flag to indicate this device can wake system (suspend/resume).
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    minItems: 2
+    maxItems: 2
+    description:
+      Name given for DAI WCLK and BCLK outputs.
+
+  clocks:
+    maxItems: 1
+    description:
+      phandle and clock specifier for codec MCLK.
+
+  clock-names:
+    const: mclk
+
+  dlg,micbias-lvl:
+    enum: [1600, 1800, 2000, 2200, 2400, 2600]
+    description:
+      Voltage (mV) for Mic Bias.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  dlg,mic-amp-in-sel:
+    enum: ["diff", "se_p", "se_n"]
+    description:
+      Mic input source type.
+
+      diff - Differential.
+
+      se_p - MIC_P.
+      Positive differential analog microphone input.
+
+      se_n - MIC_N.
+      Negative differential analog microphone input.
+    $ref: /schemas/types.yaml#/definitions/string
+
+  da7219_aad:
+    type: object
+    description:
+      Configuration of advanced accessory detection.
+    properties:
+      dlg,micbias-pulse-lvl:
+        enum: [2800, 2900]
+        description:
+          Mic bias higher voltage pulse level (mV).
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      dlg,micbias-pulse-time:
+        description:
+          Mic bias higher voltage pulse duration (ms).
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+
+      dlg,btn-cfg:
+        enum: [2, 5, 10, 50, 100, 200, 500]
+        description:
+          Periodic button press measurements for 4-pole jack (ms).
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      dlg,mic-det-thr:
+        enum: [200, 500, 750, 1000]
+        description:
+          Impedance threshold for mic detection measurement (Ohms).
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      dlg,jack-ins-deb:
+        enum: [5, 10, 20, 50, 100, 200, 500, 1000]
+        description:
+          Debounce time for jack insertion (ms).
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      dlg,jack-det-rate:
+        enum: ["32_64", "64_128", "128_256", "256_512"]
+        description:
+          Jack type (3/4 pole) detection latency (ms).
+        $ref: /schemas/types.yaml#/definitions/string
+
+      dlg,jack-rem-deb:
+        enum: [1, 5, 10, 20]
+        description:
+          Debounce time for jack removal (ms).
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      dlg,a-d-btn-thr:
+        description:
+          Impedance threshold between buttons A and D.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+
+      dlg,d-b-btn-thr:
+        description:
+          Impedance threshold between buttons D and B.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+
+      dlg,b-c-btn-thr:
+        description:
+          Impedance threshold between buttons B and C.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+
+      dlg,c-mic-btn-thr:
+        description:
+          Impedance threshold between button C and Mic.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+
+      dlg,btn-avg:
+        enum: [1, 2, 4, 8]
+        description:
+          Number of 8-bit readings for averaged button measurement.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      dlg,adc-1bit-rpt:
+        enum: [1, 2, 4, 8]
+        description:
+          Repeat count for 1-bit button measurement.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - VDD-supply
+  - VDDMIC-supply
+  - VDDIO-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      codec: da7219@1a {
+          compatible =3D "dlg,da7219";
+          reg =3D <0x1a>;
+
+          interrupt-parent =3D <&gpio6>;
+          interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
+
+          VDD-supply =3D <&vdd_reg>;
+          VDDMIC-supply =3D <&vddmic_reg>;
+          VDDIO-supply =3D <&vddio_reg>;
+
+          #clock-cells =3D <1>;
+          clock-output-names =3D "da7219-dai-wclk", "da7219-dai-bclk";
+
+          clocks =3D <&clks 201>;
+          clock-names =3D "mclk";
+
+          dlg,micbias-lvl =3D <2600>;
+          dlg,mic-amp-in-sel =3D "diff";
+
+          da7219_aad {
+              dlg,btn-cfg =3D <50>;
+              dlg,mic-det-thr =3D <500>;
+              dlg,jack-ins-deb =3D <20>;
+              dlg,jack-det-rate =3D "32_64";
+              dlg,jack-rem-deb =3D <1>;
+
+              dlg,a-d-btn-thr =3D <0xa>;
+              dlg,d-b-btn-thr =3D <0x16>;
+              dlg,b-c-btn-thr =3D <0x21>;
+              dlg,c-mic-btn-thr =3D <0x3E>;
+
+              dlg,btn-avg =3D <4>;
+              dlg,adc-1bit-rpt =3D <1>;
+          };
+      };
+    };
--
2.17.1

