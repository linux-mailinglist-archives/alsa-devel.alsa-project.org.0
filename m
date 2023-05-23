Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2E670E1CD
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 18:30:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D908B823;
	Tue, 23 May 2023 18:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D908B823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684859456;
	bh=LgdICdxrqFxBF10BnquremDkz3HKcc6yWRdaKBiTcj0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n5n8cL7DA9+PmLqPHd2c0mijczXuvP8drJWBuRp2btLCKGoYpSSZdfU/NTgqiAlrd
	 MvpWHWOn3i+3cCpJgQ6L1fd8eAvNSdSJ4mxGRHqJMRGUo0TYi6w2hSjGOUJAYyE2bf
	 gAZwUEfpR/KtN5lMm2yeRbZ+jwVVRxcIt0wd9CAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B1B4F80557; Tue, 23 May 2023 18:29:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CECDFF80551;
	Tue, 23 May 2023 18:29:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E153F80249; Tue, 23 May 2023 18:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B25FBF8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 18:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B25FBF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=eVTq86o3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEw5tl2yuQe7JAtmlx/Ht1tQ1siLbMID4PC2j+S1sAIm0N0bGPHvO3+eVkdzhC8H17bmuJhphKOhVZqsqQysOI2u/vvgT6m5db57+Yd8sFwB8F0EiFXR+QZoqQvhuKuHiiUWfVJ5ggU5i8FVk/k6d0ruxtU/XlEMrXegM/eYwZJKJa5Qn4WxZ7Eab+MDJj8jxgwcYGx+5Yn3oTu04vqP47M4BKEr+LGgYWaRcnhC603jBxrirJ0kY0EUUdYh++hVHFwf4OFchh34SFlLlEOIvHTfCWrfA3Am0diGMied0Z6XPAhcBkV8Nauu5b2CJPHBK4vxZcfGOH5iquv8osV8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CNEPmfyeiH/PU/2oAhOavBXO3Ce/Wj6VGB9eWmk9OA=;
 b=BQbQLbMx1b1Bh4xMLRHd7OiK9W0wFGi5QoQJFACGD6ZUKaVugusUTf95Bxu2dhs5JtaTB1e8ZbIUJdyrEfzp+cqR+Nzm2vhb/WKRFifRuQFB9OyIvJuZlC87NbFxEqn8sDPz2GFowprFI+Sw0yDt33z18FxB1YL4Yg/6W6rASKu9czWBkQHtpjSlXoM0hTVADgtCbFO3ZM6Nk1TEO/CoB+t66nms9BQJD9/2D0oZGBGZpuCzSjvh51kYvIaz8PFAtxOfEqY1aWlLClG9UQmd+Hx3DEWMCv4fld0z21bJ4IA6CIkrIO9FRfzjvuOJYM1KRf8+H/OXi9+v1Om3hktDyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CNEPmfyeiH/PU/2oAhOavBXO3Ce/Wj6VGB9eWmk9OA=;
 b=eVTq86o3cJGE4CdG3OXIwBaVKHnElLtkr81YrYQIhrrwX1Dbcyh7NWZMWFUrr2pxq5XA9W8OFkfgStjf/dKnbewalDvsTdFtwUxMSHVyOW2rRBhUPgQoauZnnaANJnnu/QF88PWaBTjGNMJz/kF0IlmyRYT5/JD5mUPxJrL+GhQ=
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by OS0PR01MB5683.jpnprd01.prod.outlook.com (2603:1096:604:b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 16:28:59 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157%6]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 16:28:59 +0000
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
 2/2]  ASoC: dt-bindings: da7219: Add jack-ins-det-pty property
Thread-Topic: [ASoC: da7219: Add Jack insertion detection polarity selection
 2/2]  ASoC: dt-bindings: da7219: Add jack-ins-det-pty property
Thread-Index: AQHZjU+XA/hyZrRWjEKSEULmPWt99q9oDLew
Date: Tue, 23 May 2023 16:28:59 +0000
Message-ID: 
 <OS3PR01MB66417773E562A95D0E1DA6BCCD409@OS3PR01MB6641.jpnprd01.prod.outlook.com>
References: <20230523082101.380-1-David.Rau.opensource@dm.renesas.com>
 <20230523082101.380-2-David.Rau.opensource@dm.renesas.com>
In-Reply-To: <20230523082101.380-2-David.Rau.opensource@dm.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6641:EE_|OS0PR01MB5683:EE_
x-ms-office365-filtering-correlation-id: 77e8cda7-e5f5-452e-938e-08db5baad033
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EAMIZCl3TPCuq/UrRaQQ9de/04H4KvxJiflFxgDG0P6MGlmHz3uw59TECiPAukY9sMvV91sPh/GVF5x34irST+3KyCANgaeqTIMPPOdxecpnCddDA37bDFyDXqP+J91LjIJ/4Yxtn96IRaSHHlp2pn/3oLX3FEwq+ZPF3ht9YycrRMcumADvTShJ7oOk9sOOklEL/v9NUotrG7q5xVEtqbcXSk/FBn+blq9TejiUoWdQJ6jqajaN3iXmrQwFFUI8gbKjkTY8yFQcPEzBydADilcp15v968fyP+timsBZkP3F4moaijgqaUTwbgyGVt6pW/ueOWGprexNPDKxG9RtSkZ/8OsOczF7ffwK1jmNsMW33tB4SSBXv2p9dZ5EWWSmhA5ij539dgTCv8HfNW3BFSbmBnig0iXcHEYWhIQnGlw92Ze6kqzQccNUL637jUEw/tMWQOoQ4wAaDZ70hyFV1FjRmPA1YoKEYVVGowZkdyhssCiP3cnY19QRaloc+vhpH9TtTiL4gCAt9SKUArNOJ8Cgm3HixnJgvYU7Lpu6dgN2FC+5RUryG63Iz165c5Ap92gqUul/Ogm5bMNhkpH23FlbEQyFmQv/SxSlj8/tKChNnpDfS7oEIMJQfbgS3+Yf
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(38100700002)(86362001)(2906002)(478600001)(8936002)(8676002)(33656002)(6506007)(52536014)(4326008)(316002)(5660300002)(9686003)(54906003)(110136005)(53546011)(7696005)(83380400001)(71200400001)(26005)(122000001)(186003)(76116006)(55016003)(38070700005)(66556008)(66946007)(64756008)(66476007)(41300700001)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AzXvE7qz52GWPxNZ10Gt0nPW8utP+1v1HFz5dmx8oXtwIBfK9zPXCizdj0yA?=
 =?us-ascii?Q?v23daK0Hh6mQ8Ejsukb5hjUbo00ZzU/pOgeb5WJ61OZY6qP8OgQxMQCayKOD?=
 =?us-ascii?Q?ItmU3qq+fhMkCUw4eLhwf6GYcb/ouE2wwG8JQSgdeO2lFl2iwc/1B32Md99a?=
 =?us-ascii?Q?IhwELRYMuQ2qlYlCYt4TSpSpf/HTzGGackx6h2XbXWWqHohIyubJc9MGbOM3?=
 =?us-ascii?Q?1LlprY7hSAt102iZEgozKr5vpnyGD3OK0R9SGiACd+VY4Bbjade0q5oDrn3Y?=
 =?us-ascii?Q?cHfn/QswyteCx5NMuA6BXD/h8QUutc+1c6vUicKhQtbB3L9cfe33NtuHpA0s?=
 =?us-ascii?Q?aoM+G2hVpoONIBT5dvfyuQfOc8qR8ybR/nkNHn9M9ooMlPNA8j/TaOnmBe2O?=
 =?us-ascii?Q?a/Av90eOBVHaFKsYi0dpQkq7nWXiRSillX/AXbeyx338DH6TTf6W5CO0XfPV?=
 =?us-ascii?Q?HR9q4k8oA+sdxOHqUVKLlSy3qC8unRuG+m3ti1EhDZyW1ThEhs9f2oVZytuh?=
 =?us-ascii?Q?WvDrZMbRU1/TeaMQrANOau2eGe3/AJyL+doUuXYai35X3oXmGHGU1j6ZuS9L?=
 =?us-ascii?Q?i47b2FzgbqeabdpSDHjLeIqtyO/7o/smVS13bGOwudQX596ucEQjz8VTSmjm?=
 =?us-ascii?Q?TZWfS07gdyuL/SfxMHpKwJk+UYTY6kHTXaWis1LTKMOnD5gtil8ukVvjHi9e?=
 =?us-ascii?Q?2iD/rHgDD1XcQl6rgaP6O17ODhn+M6DkJ+3eVAaWRciMv04uD2DGJgRo1RPU?=
 =?us-ascii?Q?/AftTCtM8duZm68DvryFJ7sIMDGvgSBgaaBvFg+o305teKV+5R3+ueRJNbgU?=
 =?us-ascii?Q?ZC+KNWi0JwoQlbtbuzCM8vDy00d/QnGrwexg5wC3gk+0OQWopp57AdZJq6H+?=
 =?us-ascii?Q?+wsZe3hHLGjDnOKkvN7+P97P+Qm6Qrac9npBJ4VMz9VN3Eo2anuMlGAg6XF4?=
 =?us-ascii?Q?/r16YWBAzqKrdo5vjs1gz1Dj2gzBCZVAl9SDAaSdsZWCtExJ6r/03awFKXNc?=
 =?us-ascii?Q?648w1JPmPb5w/t07NUkC4oBk7Bdo16PfuxwkVvy1PMcNTlNHaFW3E39cQ/z+?=
 =?us-ascii?Q?saY8DMTR7sqmd2a7dhskcmjp9K/Xk7PCFG0OORwRjUqvzkIjVsuv2TCX7OCK?=
 =?us-ascii?Q?KEIEkvuDNsoM5diaTSxOKfTMx6FeLdm47aMuEo3aU49lZYiaYR3AqZtFFi+v?=
 =?us-ascii?Q?7pnkI3/Jhf5Z515DYK51Atri/LvyjImmo1W6OE7NH+yIMoRqnADHyrDimqu7?=
 =?us-ascii?Q?+Z1KzXbR2fKAILqoQQH6hRzvgwDdVUe/Kw6yGif3pVwtxKjqGBPQ7gYz0H8G?=
 =?us-ascii?Q?Dkop2v+tDZmoZd0N+v4OuwjYaDUSMFFhq1HEaX5b6r08OQtn5/Bq2Xv4MaDq?=
 =?us-ascii?Q?XpOOvl+sMfU/iCSo3oyM3uichp98gr2eD1sTQpmb6abwD0E9Kf9xdmc137dA?=
 =?us-ascii?Q?X7uyFKknZ/ykeL3Jd5Tr4nzRW012JU7ibhh7sCboekXULZ0oaGcOqiEoc2wH?=
 =?us-ascii?Q?6HgTS+q3r6wgGwq8S5Kj55DvP/Sxz7jEfKfiNgUldcS4h8fhpm3mh8n+v3tG?=
 =?us-ascii?Q?TmQnBKXfca4OKWs/AhcS7yOa7B0qGAlkVSGPxHSsE6pNxst8H3HISFa9MgFz?=
 =?us-ascii?Q?Rg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77e8cda7-e5f5-452e-938e-08db5baad033
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 16:28:59.8453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rfV8vPK8jlj4mtAsIjESW5SSUaQAdqU/KD9gFWmkToZeFoYJWwCnN90E2L4VS4a6P0RfpIWF19u7cvP62ih1fLLPWxgSzvv4GPCsPaNYc1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5683
Message-ID-Hash: AIVPLJ7A5KXCCEX4AHITYMRFKAF5FUE4
X-Message-ID-Hash: AIVPLJ7A5KXCCEX4AHITYMRFKAF5FUE4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SUH2QK2OFIYQZQCBF74CK2X7XDMYMI2C/>
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
Subject: [ASoC: da7219: Add Jack insertion detection polarity selection 2/2=
] ASoC: dt-bindings: da7219: Add jack-ins-det-pty property

Add `dlg,jack-ins-det-pty` property for Jack insertion detection polarity s=
election.

Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>
---
 Documentation/devicetree/bindings/sound/dialog,da7219.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/D=
ocumentation/devicetree/bindings/sound/dialog,da7219.yaml
index 9160f68696dd..bb5af48ab1e1 100644
--- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
+++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
@@ -122,6 +122,12 @@ properties:
           Debounce time for jack insertion (ms).
         $ref: /schemas/types.yaml#/definitions/uint32
=20
+      dlg,jack-ins-det-pty:
+        enum: ["low", "high"]
+        description:
+          Polarity for jack insertion detection.
+        $ref: /schemas/types.yaml#/definitions/string
+
       dlg,jack-det-rate:
         enum: ["32_64", "64_128", "128_256", "256_512"]
         description:
@@ -215,6 +221,7 @@ examples:
               dlg,btn-cfg =3D <50>;
               dlg,mic-det-thr =3D <500>;
               dlg,jack-ins-deb =3D <20>;
+              dlg,jack-ins-det-pty =3D "low";
               dlg,jack-det-rate =3D "32_64";
               dlg,jack-rem-deb =3D <1>;
=20
--
2.17.1

