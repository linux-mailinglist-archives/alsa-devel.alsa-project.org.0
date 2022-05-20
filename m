Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B6352E181
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 03:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BC22177C;
	Fri, 20 May 2022 03:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BC22177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653008624;
	bh=XMPu2atQtf3G++7UyG84OWAs5XlIxvVCLBH8jiEVoxY=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zi+f7ziTRnl2rX3u1IkEjnc0hATYVG2vXtXmzTJycCnAqj+dJcBEoHZUIE1kMlNUd
	 TSfTVeO0XvV5j3XtRE+05O/YTrQV+IlbineacoQ7gPtG3uJqdo8/4r1DnfVDKut/FA
	 Bm7o7eUhgj5N26em2aqblsrYLXdQxgtqMD0W8QLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8BA8F800D1;
	Fri, 20 May 2022 03:02:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A915CF800D1; Fri, 20 May 2022 03:02:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::725])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89723F80109
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 03:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89723F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="INa5SpgR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg7blktaKPnebxViBPCJ6R1F/zhsvuccewoaBhYgXyN3m9fyYz25S+C73OMoKaLmo6XsKAFFJPzaKtQCEERbHmNxbPFgtweXIC4HxYvoPUhgIw63NC8k5voOEJxBszNasGvYZaLMScxBrWLz6mMfr2YsAsBsyAwpI7rg9cL9UBvPBNeGGlc5Dm906uthxfmVsZfMSFAJCgjFv6fLF2X8PemcLmNv1lVWq4+GDJeCiWs2Cvu86Ahz2MSssL/h2uP61joZwQDYHRqFJNCZdd3Io05fpjWJk/WLazOtWlczBynmE78kXYFRh/qwPouaSiV41pPr6uB3mxKo+4moCM4lKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnGXLrmNq5McOXwguv/4YiOqX7OLJxiaf1YGyWPUenQ=;
 b=fHqge9bQL/cURH8WLnaA2nBZQQttnjD1nzt5zRFZJYRTtK8zzuYk2WwqU4ihppVBZSH8KQ5ZecuyqKVnTibSlg9r4xD+vfKvOmx/J0dc6JibnWvuCsM8tYItXP+vzwhb86wJS6dBT4J2RXuokyQ0LLHcgHGs25bpfBsPTr+qcPEwbL/92dP5uZTqrG1hFmHZBpqsfWCg1uU7T/cwiAaozKXgtE9UkKi/GQXT6y7iCID4NdM8B3oZUmQm+DyqHp1q+dm6mtNzhN8i6a1GRAP0awPMWNIx5cSNiTsI0AHcmSrmJBxvJxX9H3t8k7bSEFsIX3UTy/0/556mVC5mYNpyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnGXLrmNq5McOXwguv/4YiOqX7OLJxiaf1YGyWPUenQ=;
 b=INa5SpgRH/HBaCnbQ+uce/h0eMbagPxDNHoX+GVlyjAQsPl0LjwOaGHDqe+akSD65U0iG8fLtjqpk6y42aj9Fs7P+cnfY0+32SwhB9x3w7ISDx2nZggtnaifWetIxRfvf8cX36LujHSPckuS6rcyVDxzwzauozW6K7fuc7awKkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB2679.jpnprd01.prod.outlook.com (2603:1096:604:1b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 01:02:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%8]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 01:02:33 +0000
Message-ID: <87czg98193.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 56/56] ASoC: simple-card-utils: Move
 snd_soc_component_is_codec to be local
In-Reply-To: <20220519154318.2153729-57-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-57-ckeepax@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 May 2022 01:02:33 +0000
X-ClientProxiedBy: TYAPR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::24) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc054d00-1495-424c-5228-08da39fc6c43
X-MS-TrafficTypeDiagnostic: OSBPR01MB2679:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB267991AE2B74F5E2518B86F4D4D39@OSBPR01MB2679.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYjRlhq+Uoe5ZKcK6YOMXGtHUDvVNKEEF7XtvHkqLHEcRXdt51PqhFT/rqdx1ylG0/qEmCIZjT6mk14b8w94cA9kNo1vGWoVtXsxwnwZ6OaJ2bs7RkEMftXxwXljYmztJTaAtOD/rgd3uVVn6MLDg6pXz92JkJLk2YN8TL2x3ptwqPqx5X8ImFHVjH+o5XzdCsMTcrN4PMw3wxS91kmUr475x+EzNiVkdbSSkcDCuo3COl5R6lxZXz82QafTE/lNcz/mzw99gedjJTj6AXdZ+PivZMABpAQVIa3IQZbo1wy8MzNubD4eo4HVjvCRKx1ZYe8QUzxprI3bawLdQvJo0W92aOB4U1muwpxVuz4wd2113cmGtCiDIaIyx5XAwe/IJdcUyNxnufk0HOhn+5QopCdbIDpTmJK1MblVpVlcfTwhEsHKy4H6ovSyhifnTcgn+2o6T3708ic5yc3vlK7Njexxp39xM/mmvZjjXhlYTKZkMPiEGN86poGS46KFVVNFZzW3cjYcHEZL8+ExGhjLyTYeYbh07XrXmsnJku9lVeIlTbI71GclEmP7RH7KsxBETxB3wODZjjhvS9smCCDZ+2S8koDDJh4vQuqTZxNAF7wJLBAdlwzbraso4+fN6vQQTBMKc73VJ16SoSXAr8HOqvANyLYXHmTejO82bn/VSRCYrCNGaj4TkvfTnWq/HoOK5r6QANSURNjHSwJ/J17hLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(6512007)(36756003)(6506007)(186003)(26005)(508600001)(6486002)(66476007)(66556008)(38350700002)(6916009)(54906003)(86362001)(2616005)(4744005)(2906002)(5660300002)(7416002)(8936002)(66946007)(316002)(38100700002)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zePXVO57w/a7pKtEhQ7q8nOA7m+O89uomSeBC7uuSRAoBdgYRr8W7tYWRqgy?=
 =?us-ascii?Q?sVUhm4Kxsd7ht33SZwwoMwg/l4Lhcn/nARwjNZ6tFn1swp8A5b0mY1ikJ6jD?=
 =?us-ascii?Q?wtS0qAJ/z6mV7V5Cotdi4cyDsumGDL7f8/KXQntt3UcpfYi9sZMO8Yf+Kcm5?=
 =?us-ascii?Q?ikyPhTHYKwLWIO7QiyyizKYIemEOskcu1A0BFXFEufQgH3nSfFahXWpEhiBO?=
 =?us-ascii?Q?merE2rIGYyr9GVRKL2JJSk18OcPpPUw3bxZYnm9bMPRklXUBp7A7tJLqW3jR?=
 =?us-ascii?Q?oprN5NbTvNxkU+y62pXgD9m3eGiTn5QX3Tmt2DaqEdvcLTgd49/+jxQ0r42q?=
 =?us-ascii?Q?OzWWgVUIc1U/N2pFmsHj5RG5m8uinqG86IXvkwQXR1CnHEiY9KzLbtyfZU97?=
 =?us-ascii?Q?eLDwoBRPr/8ug60sQDMf3jbMqMps73TUyJUwdFfmaJh8jCaDJtFpU+RPH17H?=
 =?us-ascii?Q?XiI5Tp6cKBPU2eijxXTQTISempDwGsz7tcRYiK5x5Knhx11tlbCXS+LoyTt1?=
 =?us-ascii?Q?+vAdh1dzcO53GiaahkqZPszKXlKTx1hSxiD3F/+7SE4nkPJQbCJs8NUQVNBo?=
 =?us-ascii?Q?4s92d3ttA/1oad6cs860UgkUnr13JhGqwLvcs3iqCVVbwgRu6IxMEOY7zywj?=
 =?us-ascii?Q?7+fPCtdF7/8hHfl3eGDJFT0VS3nWT7eSqGTSBud0ehMRN00PxtmAx+xLN7XL?=
 =?us-ascii?Q?tWG6NBycB0rWjpeegi2s0RBOoIapYYU+2UKf66IXcNEJSvq1rxlPNmsc8ejR?=
 =?us-ascii?Q?oR1QXB/QeReSgslYuI/U+v+41sg3KIPlcG3IA6VX+9aVKCe5ulQcseYnnLF3?=
 =?us-ascii?Q?D2IOYMtgg9ljHkO9/aqSVEW0See9IHMiYiyoWoXrl04NgTs1kLlAv+Hc+wf4?=
 =?us-ascii?Q?IJbiPyjB1tg2yLW8Pd4lgbwB2OBVxK6BB7uIYLXfn97n2BygbFb01BUac2SC?=
 =?us-ascii?Q?DJ7BramrIx0hgpo6/PpIVuLYjNVHECEEAjy74BJLAKDfMccGj4p/9m13EGoP?=
 =?us-ascii?Q?SkQD/rogwHUKwHiTe5+P06jNTpsg1iBFjAZeDIqtYHQr/D3c0PLjqP1wERpN?=
 =?us-ascii?Q?wgbFK0mSGABOfjRZqNoU/lzmZ1/fE8crAqSCeYUV5xGhGubBlB1KQy22wfRW?=
 =?us-ascii?Q?VVq0rJiR6b6xILxIUUEkf4CNEMgJt5rS751lo7VzX3hqu7lc4cuDPZhxcXmU?=
 =?us-ascii?Q?+zGkdJ/q2AS4u4esorQYQKIZN5cYqGweLFv6e6P5IkNPbX3ZrnfxUSdUD3qq?=
 =?us-ascii?Q?iq0TENIH9xNb6EELhnnEo+IUaKCRKJfa/oNczE5wWDm1oO35690SWysXMFCl?=
 =?us-ascii?Q?oQAes+j7nPfxRH1SiU++6NwtHuqKj5W3E8F2oAe4DHKMLI3i8Nl/UWcnII2M?=
 =?us-ascii?Q?v602zFxIL/2x53F2IfCsAowqtYQzh/OGLwHkkWDdAA20pveoCdx44+GVp47c?=
 =?us-ascii?Q?9hxcCP07EXtcEJdZ1sFQEszl8CV1cqsjF0yujsZtQWsOF2thauTN20M+nvUe?=
 =?us-ascii?Q?9TSrOQrqKs1uDFZxlfdMHDRpKXBKfXohVjXmQbV/1B3xr01/ybJZWekXVy7T?=
 =?us-ascii?Q?c8hDqVD3+XhvIeKiedeq7xq49U+WIIDxcdC+ITfjw31utTbzV4rGUnHonKft?=
 =?us-ascii?Q?fwxzqMVHWfHJCuHLGH7RT04tK2W2YV30AtS5eRJbkxINXY7m/pTeXLVNgzQ3?=
 =?us-ascii?Q?8sdy1R3xxeiPYxFC4ldHMTItyweL6QK+thdlgY2jLpdc0aJs2bXKRS73TOhb?=
 =?us-ascii?Q?X0GxLElzQ0kdBwbnPyo+3jf/nHn2T/gPtmEos1q5hWZ4lnGGpc3c?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc054d00-1495-424c-5228-08da39fc6c43
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 01:02:33.8333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcKttPU3p8u8FU7GyDQojTG45/SWFtKMtzf1135JzAMmIn5tX0e8da/2FjhgkMX9h8qHRvIUDlZSkkK9ZsBwkaJ9kIek5XjtXRXPEKECj7H6EP2JdqrI2TW1Hi55SGgL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2679
Cc: cezary.rojewski@intel.com, heiko@sntech.de, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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


Hi

This is not related to this patch, but...

> -static inline int snd_soc_component_is_codec(struct snd_soc_component *component)
> -{
> -	return component->driver->non_legacy_dai_naming;
> -}
(snip)
> +static inline int asoc_simple_component_is_codec(struct snd_soc_component *component)
> +{
> +	return component->driver->endianness;
> +}

I have added "endianness" "non_legacy_dai_naming" to component
when convert old "Codec style" into current "Component style".
All codec needs to have these 2.

	69941bab7c7aeaa7bf7e84397e294c17f0b7c6df
	("ASoC: snd_soc_component_driver has non_legacy_dai_naming")

	273d778ef38a8861f880e9df5799029dc82bd55d
	("ASoC: snd_soc_component_driver has endianness")

The reason why I didn't use "codec" was that try to keep
original style as much as possible.
But it seems this is good time to use "codec" for it ?
I think the code will be more understandable.

-	.endianness
-	.non_legacy_dai_naming
+	.is_codec

Thank you for your help !!

Best regards
---
Kuninori Morimoto
