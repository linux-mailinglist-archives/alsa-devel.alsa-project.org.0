Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A410F708E03
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 04:46:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1297201;
	Fri, 19 May 2023 04:46:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1297201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684464415;
	bh=yyfgCeBwlu9csDOxXn8FhqcNSVIfHXg6+Hy24OMgyY0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rwh86AQhas2xC2tuerxmZ1yvmq5yPVWaGKGfOXbjVeqiqCuzMDTo9xrcejAZa2T2y
	 sZhFrf7kiUOzkP5KhXHmcknYyk/Up51xPUujwn/AveFAzUoT8HDDn5CvfBtUKOrnPX
	 Tuyd9MTo9Iyp31fAzSNT1gvLhlmjISw9ILE9TLXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2F71F80431; Fri, 19 May 2023 04:46:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18297F8025A;
	Fri, 19 May 2023 04:46:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE8B2F80272; Fri, 19 May 2023 04:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B80DF80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 04:45:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B80DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=YzHO771V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLZ2uR9I8+3g0OIaSapkgDpplWqOwEglKu1mhXaY0DEF6OH37eTsDHWIg34uOznBG3WlexQEsdZloRhBFmlD04nAkMVNlZgHkfEaZR/txH/zbBii+ZNeEUDLJZ4O+yi2auGsCGuvfyP9HOei2vSbgKELjBlM9mNhEvn3zalY4HXeJKONnIcc/Sq2YPVfGAlmOKqi4bNvlsMXvSivuoqRRkc3fMNRAs9aaLvE2y9ClHR0Sh9/Uq9aUFf7DR9GN5saxJocVYBjK5kh22BfmBKTDnHVKAKjAWjiRMmio7xHZvmPP1TlpJMWakFSM5AXShzZr0ggNHq0CbeLsjsCgIctdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgbFj425T00pBp5yjTXrx6eOWxLQjPcOEBGdpAlNrkI=;
 b=B0Tp5uVn80Dl7wG/dsX0VAzIpQC9sDUDJdn5RZqqQI7J8n9+Qdb9l8i747NN4YttnxU36+GrKKfni0cspzoyisslsBwjmwHIcLAswJO/2bgTonUJvazYfuB3NUBWyZjwx2TVcaAcpw0J7OK/jPmXxYeJWu8fxdhy/5UuWq/XKiuoyJdFwSKepYiDGeqqB466lR9rwdXqCg3QdmSESi/1NYL+ArkiHn3a5cJNmcNocbosxXajdQrWws4OrLaz7Cts4PLHuExDwfqjSlUOxV1HXI267c5tkldFsGOZS3ogmTFs4tCwQB9QdoZ8zGHQ5PDmaHnxOwHbKIT3VQry2oRDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgbFj425T00pBp5yjTXrx6eOWxLQjPcOEBGdpAlNrkI=;
 b=YzHO771Vqb4GmMZQHc5H6YVyafS8Anqfu4eKCUSLsq2QiUb+ju2JGXOCuI1imO3WEYmBFn1hfNnscDVBOb0sFzX1xYiqwAjT942/9RbbIlVDkrE14VHcwmQdrUgrBib1WEsYMDxrX0ker/CgAVJpUs2ZHflT13HPkaiw0CRtX9M=
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by OSRPR01MB11647.jpnprd01.prod.outlook.com (2603:1096:604:22e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 02:45:34 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157%6]) with mapi id 15.20.6411.017; Fri, 19 May 2023
 02:45:33 +0000
From: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
To: Conor Dooley <conor@kernel.org>, David.Rau.opensource
	<David.Rau.opensource@dm.renesas.com>
CC: "broonie@kernel.org" <broonie@kernel.org>,
	"support.opensource@diasemi.com" <support.opensource@diasemi.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema
Thread-Topic: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema
Thread-Index: AQHZiWlFaZwxsGlTVki4XJjWobXVBq9gdPAAgABgOlA=
Date: Fri, 19 May 2023 02:45:33 +0000
Message-ID: 
 <OS3PR01MB664189A6C436B36FB93B4E7ECD7C9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
References: <20230518091449.17984-1-David.Rau.opensource@dm.renesas.com>
 <ZGaErqQ8lgtAofYB@spud>
In-Reply-To: <ZGaErqQ8lgtAofYB@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6641:EE_|OSRPR01MB11647:EE_
x-ms-office365-filtering-correlation-id: 6864bdb3-dbeb-40d2-0669-08db58131e06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uFhePdYbHEvIhkBMROUPo712wysLLW3YXgfRcc5XqsErqrsYV39d6JmZOx/T2evAJeeOjcacdVYHcnD+kgkiO2PXIpXVl1LU3O8v/C/m4Xmpp4OjNT+NQ/g66Vho627ESk7H6vTn/hhsMUdzYyiNOCXV7VX8b/3ok3IFpYFKF1GB7pNH67U+cDKBvKjTaAapFV/JNXOSnlda11ty2/yG+0NPCiRhyFCNg/FFhxg2REdZbaCCXpee2xXidwr+ClS3WDcbKGjUXH0ozVO9FUXp6bP5UnBCwe862acLN643pdlu5qCJuQdQG7Ruww8Je05/EBekHxlGFrkJJ63t4UddFVMIuh5t2ulLAvWvoG+nss3t+256zHcjHvCMQc/mN99Mkm1BRlkg1wge1egtHQ2ShQhnWPRXMrm6cDwdf3gR8OYfyKhRKGVOrE3k5Rtb2JVQRDlf6HODSmjdQBC13P6tEXTmJnmxWBrx12qlj2UcFfQJeS4A4aVWb0LLMEku/e4uA+P0aFgDtoPPZin+lbH2PJuPAe+UrVOXGIjG8uIps9QWuD6wW8SpV2/1uVRH6tmdnXQc3UMgQR4M525ViQzv00Hgb/rr7yJakPuQtYYibzU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(86362001)(33656002)(55016003)(8676002)(8936002)(26005)(5660300002)(55236004)(53546011)(9686003)(6506007)(186003)(7696005)(52536014)(7416002)(54906003)(110136005)(316002)(76116006)(66946007)(66556008)(66476007)(4326008)(966005)(41300700001)(66446008)(64756008)(478600001)(71200400001)(38070700005)(122000001)(38100700002)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GMe4/OEzc6LSDSRE1glvcF0aQMPucaPLvBcTxV/inqNKTUb/HXQX6reyMaFT?=
 =?us-ascii?Q?8mpMx50GtKhGr30mFHA4NBuX0Avh+dtCnGzAwO0t44BISOd6Em0xFMmzQNzC?=
 =?us-ascii?Q?bEGOQNmwsabeAbht+pZJIZEW97n0PnLLFrfc7cz4nD2To5Lg2Zkve0w+YThD?=
 =?us-ascii?Q?jsmqpQf5BOqA0x/kk6BWaHjvMaUxkg/TOv+G+P0u91MFNLrOv91fmQLP5bkY?=
 =?us-ascii?Q?177WnKHaHofywzAb8uhsy8MNTp2Gs8CUbm4DOvWwjZr8GWM2Rv8dT5Vir4UU?=
 =?us-ascii?Q?8lDhIb4tKxhPTGKG02MfBRT+Jh+Gumd9F5Pl7wZHIo7grPH8Ons3I4qhUqzB?=
 =?us-ascii?Q?+9m7tOM2EmE0QQ2JenKTHWs4cZGEEASXA9FfA8zwGxAqCMiBnyGehSejeUk8?=
 =?us-ascii?Q?juL0TCtjbzsRsI87hnOWSJ7ROcmvaDDALZoTE5SG7DRZHUPkeB88RYv43wj7?=
 =?us-ascii?Q?Wg5AZeZ6BeZ60Mt5QgvANtysmsNMOBPIxV0P9EphA7ioaUYliqcOb5Zzux65?=
 =?us-ascii?Q?y51dsfRXLWSobiSIFe+seDuAoWeNvGoHOHnQtDUcXdKtApJVzQV3GxHgTrVw?=
 =?us-ascii?Q?nkrTTmQjK9ggYqPDTJebBJyFIFUywEVDhPt6WHW35YfLDSeAdBkLZHmESxL1?=
 =?us-ascii?Q?8HTyoFJIwGhSbxyyR1enoh/pwDL5duku7uAtNOUH10SZKwvHJJFCOHjagx8r?=
 =?us-ascii?Q?96F03I7Fx/y1Sm0437Ds5Zv6Eg/VgwvDPH2+qz2ajQBtNApykKxff9xFwi4K?=
 =?us-ascii?Q?BrWa2nt3RTHbeQrxkGg3HoyKdPe27F29fFrSJNATQQYmBCG8nvmix4Lyl0+2?=
 =?us-ascii?Q?qi0+EbMO1d5OokCVFy3q3Ke0+lcN2MZEZ0F6L+atLFwDh2r4Bko4siCyFTgh?=
 =?us-ascii?Q?NFkCFSsjl7vzTe5qmTZ4hjlNfF2MFtX8sLM3ab7QpCNVc9yGJEKsShoX7WVa?=
 =?us-ascii?Q?oV20dKZDDNHS/IDChV1GH0GpldrF1Ap9+BTDTyYiSihZhGLz1jwleed8KCQk?=
 =?us-ascii?Q?HdMuCAMlNR+QsKB/VfBevYnQRhEy/RnyEBGyQx88vf/J1YYn4TGQmbI7hnwW?=
 =?us-ascii?Q?ITmVIu0YN7NaotZMpCa0qT9PbF9jML6otgl1X8xMxep5pMLXUVsuXAwONgPx?=
 =?us-ascii?Q?M63G4HSXPcwQiG1PU0jDJb7T6uBAeneq45RvozVdM3GgPcgJBnSfGoG2vYbo?=
 =?us-ascii?Q?mS3z7EGM+9+OArbYrQLuJ8GMM14HlVDRYDqZf3ooDBG4KkFFcNpkmhDKK6Ve?=
 =?us-ascii?Q?Iy+ReJm8kXOCypBFNdlJGgIP5Y2ATuNCDuVmjJPCDjAjj3R8mhfD/pVhCrOn?=
 =?us-ascii?Q?8tonWqFEAi7MO5SP61qo6fbWKYxxqXGnRuZ2xComE7h09EcRhcTP0eKdon0w?=
 =?us-ascii?Q?tEoSjtPzsqO+N5rxGK77MpHvWge+H9f7TlhmrhPDbVJ15nFp5JvDaf7bGw2G?=
 =?us-ascii?Q?AL6Qz3ePmsUZ6XrISwR7GCmlFjvRMQysRpHt+vOrsIRJ1OQLInLoSsnQgnIb?=
 =?us-ascii?Q?8Qej66X5WnNLsNsADGQV4wCPyTLtzmd5SFWt8/MkWcEyTAIleK6XVsRJ8R1C?=
 =?us-ascii?Q?r0uEm73akU3WWszMrsSNZMlDfr8Pq3vFkNZsCj/d?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6864bdb3-dbeb-40d2-0669-08db58131e06
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 02:45:33.3868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 KwdnQ56eor+NO61DDyi1PzHaMiS8OYgIWfleqpskuRjO+afylMnuyAmqseNEmu5CUWTQDtEFW3ytsYAvSxCqt/CgcPQonT7nXWLk5dOLMXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11647
Message-ID-Hash: FIKEL4FCHXOOEPU3SLBJF4BTZWNDEGNU
X-Message-ID-Hash: FIKEL4FCHXOOEPU3SLBJF4BTZWNDEGNU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBUJZPU63345XGFNJIBXWNFCXDWKKA5X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



-----Original Message-----
From: Conor Dooley <conor@kernel.org>=20
Sent: Friday, May 19, 2023 04:04
To: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
Cc: broonie@kernel.org; support.opensource@diasemi.com; devicetree@vger.ker=
nel.org; alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; conor+d=
t@kernel.org; robh+dt@kernel.org; lgirdwood@gmail.com; krzysztof.kozlowski+=
dt@linaro.org
Subject: Re: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema

On Thu, 18 May 2023 09:14:49 +0000, David Rau wrote:
> - Convert Dialog DA7219 bindings to DT schema format.
> - Add Jack insertion detection polarity selection.
> - Remove unused `dlg,ldo-lvl` parameter.
>=20
> Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>
> ---
>  .../devicetree/bindings/sound/da7219.txt      | 112 --------
>  .../bindings/sound/dialog,da7219.yaml         | 240 ++++++++++++++++++
>  2 files changed, 240 insertions(+), 112 deletions(-)  delete mode=20
> 100644 Documentation/devicetree/bindings/sound/da7219.txt
>  create mode 100644=20
> Documentation/devicetree/bindings/sound/dialog,da7219.yaml
>=20

> (partially sending this to make sure that I can actually send these thing=
s during Rob & Krzysztof's absence)

> Running 'make dtbs_check' with the schema in this patch gives the followi=
ng warnings. Consider if they are expected or the schema is incorrect. Thes=
e may not be new warnings.

> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.

> Full log is available here: https://patchwork.ozlabs.org/patch/1783077

Hi Conor,

Thanks for the kind feedback.
There is no such warning message in my test environment. (RPI-4)

  DTC_CHK arch/arm64/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb
  DTC_CHK arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dtb
  DTC_CHK arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb
  DTC_CHK arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dtb
  DTC_CHK arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dtb
  DTC_CHK arch/arm64/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dtb
  DTC_CHK arch/arm64/boot/dts/broadcom/bcm2710-rpi-zero-2.dtb

> da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
>	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
>	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
>	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
>	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
>	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
>	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
