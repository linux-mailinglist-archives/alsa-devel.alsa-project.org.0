Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B477C624C
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 03:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D54661E7;
	Thu, 12 Oct 2023 03:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D54661E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697074455;
	bh=Wx4jcGMtPMzzFRvK9ibgwQXr3O3yEnRG1ZtKxyYVDKA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DzrSKalwIPq8GdVbK2txLVjVnIK6lEiot4zC2qY88yfI48gZnCmiEFyggk4qUhhZS
	 KQfctdLR2XpWG9EGUTTYn7lxE4bIj9jLC4pfeZfsB3Z54QzNpGymSPBSNf/IPX9RkP
	 yTjv29Nq4YwTk/Fnx+WJKFR94tLXjUJLZF+tyAoQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8171AF805A0; Thu, 12 Oct 2023 03:32:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F231CF8057A;
	Thu, 12 Oct 2023 03:32:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CFE7F80588; Thu, 12 Oct 2023 03:32:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92316F80557
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 03:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92316F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KhYfXX+9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnIlrwU0soSyKQ1Pvswz3g1cfpvVjhuvJbQZSKzyxGyBVAtZNNswAuZ+FXJxKSSEQCPMEOOQ83cwrlA1J6nK2c2KJiRgVWNM51OT1zaRmNIACxEj3F+4hkFYlZtEhQD0QsdwbwoX1g1zxXp63rESuafzQIBEseK+F6M3itjGeZoQb+wMsSgj2amcjV/tCEn009hN+NFht/aiAjjKVzc+gGawBmXazcYJ2FbLRLLvOBkCN0sT4P7nkfrZ/M4eE+PuU3A+TKEjBAFJjKdNBm8h2I4T3XleCZm6dYb/4KhoJA8np+cKpiU2fxwOFKgJCimwO4NJ6JAuBBMdLMTPZ+2cLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT512XT52jyir/q0l5HhNTVHyna6Pz+ZH9H/R2a2fIw=;
 b=Cmi7u+asgOLui/QSVYivMRUfUlN6IPYNzqE/NMVkdIipz4KzPzMXfrN3BMXZQeUBnYxUPE6ZgS7h1Qi4byJJYUIfBTK8iMqQze3ht995P4qrpwlendGj2tuzlMb5UYqvcS3Hzb0Rb0t6WW2jJl7HdiSVm8kKRoIwRoLEWtKkIQRSf8RgWJEOq4DuN3uXbQUBhTYuyjz00znx5sXSzhfKqM/FgqoXJowQLm9bNEVB6BWw9ctkV1I4a/Wxq2MK+f0J11LaKQi4QrUMqFqU8GQGmtFC6bFvee2RmzSzVeAiK9FpmGO2tyg9gOOglLFTfKvFjYnVmGKzeiwIj+rHrfoBVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT512XT52jyir/q0l5HhNTVHyna6Pz+ZH9H/R2a2fIw=;
 b=KhYfXX+9Pc1/FS/c/gJBun8JyN7DeHtH3ffJd6ZSLuKMgsOAtfVhUPYRCs5ZejsMABvcdGFZXrkIH4FaaElEzZ0m+p+NOy02tggo1j9xf47r0nrscqxINiL7wi78LQ662Yg6LLb/PMwNNnpnnqhdOA3zXUb7vDZ/LXn94QBS/3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8411.jpnprd01.prod.outlook.com (2603:1096:400:176::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 01:32:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 01:32:09 +0000
Message-ID: <8734ygy6av.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/4] ASoC: audio-graph-card2-custom-sample: add CPU/Codec =
 N:M sample
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Oct 2023 01:32:08 +0000
X-ClientProxiedBy: TYCPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cd0510-51f2-45f0-90fd-08dbcac30d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cdqlP3t9bslMB5q07z5pndSn/v3FVlxpdK3b7GZ6k63yJ0FjqK5LEk7RrXrnO5wsx1DyZYFy//3/g3QXBygmTtXs/hUeWjW6V/+FQi5kurA3WE1P/lkppSpzovCLAODBVWeM/VljsNSz8tMj9fJFXs0xBJyfpLm/0V/yySOWee6misgLpts1h0OdMSODx0pBbrTqG9rtwK/4u/9CyB8rRZtmO2+93wcVay6qPyW2icAdlZ+NnFxgIQ7X5m+lvRdd/P6SAH2o7WA6tNDbfVrFAOrLYBZjDeYHeQNiki8lf22rm+sGwmE0I2GPAdm1sh6sBVN+80sRlM7SKeGpLO0RkPBP0KYXU5heBqkhrdE3OzohXMvw4iIvZxggSeYJ9bkPDUpBAmxcNWUjanzurA4Ig0N91adN1d040FFc8F4ZntsrQL5VtF+4HUaLzVcd2LfG2NkqqyZSGGNjIK5LN+mL+dvzcvZtRJir7mNvOLCB5noRenVMq3yDUBHXahYKQx5v/Sqe4E0ubTV8EpL1vMEoz1fdKjSqNzNimVdh7gXWzeCpkqksqB9CPeaoN54x215QoN9cL0vpYPjO5OzGZEYMiK6qVeYTm05SN1xtFKwxG/QHoKen40RT8CEV9l01FBh4bu+n2Xe8EwYKNAYnbfIbSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(8676002)(4326008)(6486002)(6506007)(6512007)(38100700002)(26005)(8936002)(110136005)(478600001)(66476007)(66946007)(66556008)(316002)(41300700001)(2616005)(83380400001)(5660300002)(2906002)(38350700002)(2013699003)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/wYOlVwi7p3C897EHPkKojUz1ilxEuMIAOLK/94CAZNkGE/t2McRCUQPNeeP?=
 =?us-ascii?Q?zioL6gV5zTzKiAjNykp/i66OIHzBgPby5y3CNfB7Sn8whsc4/UmhS33W2WG1?=
 =?us-ascii?Q?0PSHi3aaAcusMa5nBYcxnI5NRd9lzqfDzTsKFj9rd2C17bUmiLJ6D8d+9Btv?=
 =?us-ascii?Q?4d0tHZWCpbr6tGsPVGZ4IgGI8N4PDFM7701KwKZBptdQjEYXmMGbtqSxpaSH?=
 =?us-ascii?Q?bpOv6o6J9FWTxACluxmB2mdz5t/ayrUob7gdFAMbAeyG6KvT23Ow4jjxL1PW?=
 =?us-ascii?Q?8J7bAam5D3W3GHIqllRxFbsvoTKmXnIRP+pRTdxJtis3WYr/xm8t44PzzSeH?=
 =?us-ascii?Q?MKJQus0skEAr0efvQJ0R85eUO3Egoq/U27s9QpgHMh+NNcrrbfhedCptmYRk?=
 =?us-ascii?Q?GAYCzfA3xzKs6NuhqCTRQAgqWX0VEJh04gLObVEOYZiAS/W74p/ytrBa2kz/?=
 =?us-ascii?Q?UedxRimx1j6QkZqzfxCSSFClIWDpw9kcAiCqiRYjFl0WEu9JhbKffhWtltkf?=
 =?us-ascii?Q?zx8nVge3/6XkHfe/zlGtSrwYRS66a1WzZszffmRMxWInDkz9y12lmIVJ7jsM?=
 =?us-ascii?Q?9DX0IMYZVhS5a6+JaV8f7eImOHg87S/2lNzu8OgYmfOGDomgSdy6AFAC9gOc?=
 =?us-ascii?Q?fqVtrrsv6xXeHGxQec9++2ap6Te2bpQjwBpc8Y/iJBnxCklZQ7inyv0iY3Di?=
 =?us-ascii?Q?P7CV3dpZkuEag5Xhsq18Duats36kSV/rLSWKmlZahAnMdkkE7PC+dM7G5oq5?=
 =?us-ascii?Q?Dyw1iXaRnSdosWLCCHJ9nk1XtSemZLV9lX/vrkfs1HO5MNqMMw4q578VaX/L?=
 =?us-ascii?Q?/KhHhW42zbfOFWd4dNHoCd5OGDNHmn25nLrqTrbU2FHLfKIF880ox3DaK7n7?=
 =?us-ascii?Q?51169/eYeHsK/PDiVesBNVVlEG3iE9P10DSphxBrvUDM6H1dnGLLWAJCNMzB?=
 =?us-ascii?Q?KGYA6DLj62XR9TMGoMsknSRMa94ZVxwTVTGymGfbr5n+mFWpeGPYoscoQwe5?=
 =?us-ascii?Q?1HEcMn2MU/tT3CFzx2cQQnVc+TJy976Ac9py1gV4M3e7zLYhxZYb/kxUfF6D?=
 =?us-ascii?Q?Kg9d8ai0LJV6vjGeKlHYZSvMhYba7RKgaCJqd1bD791hpZjlljBAiUJVvk6Q?=
 =?us-ascii?Q?GOA6NHXCIz7jKvq2Mxo3Zd6tsid4HZQMTF4qez4UF22Z6QAK081Low/fnOBC?=
 =?us-ascii?Q?0hJs/EcPbM0S/TJShcaVryRAPd/DktUW1e7EngRzJ/V3fDYWMuuL55h3o55x?=
 =?us-ascii?Q?ExUMJnBJ2x5sXzpF2JoC5bw4sqIHeoGrm+XQo+rZf8y+kFFm8DexSTtqYX7n?=
 =?us-ascii?Q?JpKZRKu/OQy73dQ73LGq5gx6wTIMCS5ztNveTpi/d7lQW7hxg540Kl+9H5k9?=
 =?us-ascii?Q?VkDxjWN4vfaebFOaP8h4KQZOscSNy5fG6JMXRMY8HU5NQssnbu5KcemmQGln?=
 =?us-ascii?Q?TI92zuxI7gorBMv0XzK7z5L3C8gFmBfeoa9qDL68z800YGAhDAa48iLvFHIW?=
 =?us-ascii?Q?LAXlXCjIlSF/55F0SH2J+mfizf2vo/hsTrghLbtez7dJTEaaTmdXYiZ1ZPCU?=
 =?us-ascii?Q?nXeM26jYwUSL8bOY6vHYxiRiCkfXuYR4/tQa9d5Fcex0CcGyXaCWRVHh49rG?=
 =?us-ascii?Q?OvrBcY8aM+HvqNRQPJf0i08=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 19cd0510-51f2-45f0-90fd-08dbcac30d23
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 01:32:09.2053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gOPLH31j9I1qULkVr9l5YKYFnWLHxRSbuUpw81u1NANFiOS9H/ucudc48KbUVbdKWMADXGXCwmU+kFD2mH+Q0QgPrk6ZeypVOLwhVjsWwLTANvtTwKZa+cQiNaAweIo/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8411
Message-ID-Hash: NIOXUYJAQVMLNG5AG5PRGPGN3GYFIP3L
X-Message-ID-Hash: NIOXUYJAQVMLNG5AG5PRGPGN3GYFIP3L
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIOXUYJAQVMLNG5AG5PRGPGN3GYFIP3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now ASoC is supporting CPU/Codec = N:M connection.
This patch adds its sample settings.

But One note here is that it has many type of samples, it reached to
maximum of sound minor number. Therefore, new sample is disabled so far.
If you want to try it, you need to disable some other one instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 138 +++++++++++++++---
 1 file changed, 121 insertions(+), 17 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 8acaa2ddb335..14d638de120a 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -58,12 +58,32 @@ / {
 	 *			| |-> codec13
 	 *			+-+
 	 *
-	 * [Multi-CPU/Codec]
+	 * [Multi-CPU/Codec-0]
 	 *		+-+		+-+
 	 *	cpu1 <--| |<-@--------->| |-> codec1
 	 *	cpu2 <--| |		| |-> codec2
 	 *		+-+		+-+
 	 *
+	 * [Multi-CPU/Codec-1]
+	 * About ch-map (*), see
+	 *	soc-core.c :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+
+	 *	cpu8 <--| |<-@--------->| |-> codec14		[0]codec14 <---> [0]cpu8
+	 *	cpu9 <--| |		| |-> codec15		[1]codec15 <-+-> [1]cpu9
+	 *		+-+		| |-> codec16		[2]codec16 <-/
+	 *				+-+			(*) ch-map = [0, 1, 1]
+	 *
+	 * [Multi-CPU/Codec-2]
+	 * About ch-map (*), see
+	 *	soc-core.c :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+
+	 *	cpu10 <-| |<-@--------->| |-> codec17		[1]cpu11 <---> [0]codec17
+	 *	cpu11 <-| |		| |-> codec18		[0]cpu10 <-+-> [1]codec18
+	 *	cpu12 <-| |		+-+			[2]cpu12 <-/
+	 *		+-+					(*) ch-map = [1, 0, 1]
+	 *
 	 * [DPCM]
 	 *
 	 *	CPU3/CPU4 are converting rate to 44100
@@ -144,15 +164,38 @@ audio-graph-card2-custom-sample {
 			 */
 			 &cpu0
 
-			/* [Semi-Multi] */
+			/*
+			 * [Semi-Multi]
+			 * cpu7/codec12/codec13
+			 */
 			&sm0
 
 			/*
-			 * [Multi-CPU/Codec]: cpu side only
+			 * [Multi-CPU/Codec-0]: cpu side only
 			 * cpu1/cpu2/codec1/codec2
 			 */
 			 &mcpu0
 
+			/*
+			 * [Multi-CPU/Codec-1]: cpu side only
+			 * cpu8/cpu9/codec14/codec15/codec16
+			 *
+			 * Because it will reach to the maximum of sound minor number,
+			 * disable it so far.
+			 * If you want to try it, please disable some other one instead.
+			 */
+			//&mcpu1
+
+			/*
+			 * [Multi-CPU/Codec-2]: cpu side only
+			 * cpu10/cpu11/cpu12/codec17/codec18
+			 *
+			 * Because it will reach to the maximum of sound minor number,
+			 * disable it so far.
+			 * If you want to try it, please disable some other one instead.
+			 */
+			//&mcpu2
+
 			/*
 			 * [DPCM]: both FE / BE
 			 * cpu3/cpu4/codec3
@@ -182,24 +225,24 @@ multi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			/* [Multi-CPU-0] */
 			ports@0 {
 				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-			/* [Multi-CPU] */
-			mcpu0:	port@0 { reg = <0>; mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
-				port@1 { reg = <1>; mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
-				port@2 { reg = <2>; mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
+			mcpu0:	port@0 { reg = <0>; mcpu00_ep: endpoint { remote-endpoint = <&mcodec00_ep>; }; };
+				port@1 { reg = <1>; mcpu01_ep: endpoint { remote-endpoint = <&cpu1_ep>;    }; };
+				port@2 { reg = <2>; mcpu02_ep: endpoint { remote-endpoint = <&cpu2_ep>;    }; };
 			};
 
-			/* [Multi-Codec] */
+			/* [Multi-Codec-0] */
 			ports@1 {
 				reg = <1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				port@0 { reg = <0>; mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;  }; };
-				port@1 { reg = <1>; mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
-				port@2 { reg = <2>; mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
+				port@0 { reg = <0>; mcodec00_ep: endpoint { remote-endpoint = <&mcpu00_ep>;  }; };
+				port@1 { reg = <1>; mcodec01_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
+				port@2 { reg = <2>; mcodec02_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
 			};
 
 			/* [DPCM-Multi]::BE */
@@ -241,6 +284,50 @@ ports@5 {
 				port@1 { reg = <1>; smcodec1_ep: endpoint { remote-endpoint = <&codec12_ep>; }; };
 				port@2 { reg = <2>; smcodec2_ep: endpoint { remote-endpoint = <&codec13_ep>; }; };
 			};
+
+			/* [Multi-CPU-1] */
+			ports@6 {
+				reg = <6>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpu1:	port@0 { reg = <0>; mcpu10_ep: endpoint { remote-endpoint = <&mcodec10_ep>; }; };
+				port@1 { reg = <1>; mcpu11_ep: endpoint { remote-endpoint = <&cpu8_ep>;    }; };
+				port@2 { reg = <2>; mcpu12_ep: endpoint { remote-endpoint = <&cpu9_ep>;    }; };
+			};
+
+			/* [Multi-Codec-1] */
+			ports@7 {
+				reg = <7>;
+				ch-maps = <0 1 1>; /* see [Multi-CPU/Codec-1] */
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mcodec10_ep: endpoint { remote-endpoint = <&mcpu10_ep>;  }; };
+				port@1 { reg = <1>; mcodec11_ep: endpoint { remote-endpoint = <&codec14_ep>; }; };
+				port@2 { reg = <2>; mcodec12_ep: endpoint { remote-endpoint = <&codec15_ep>; }; };
+				port@3 { reg = <3>; mcodec13_ep: endpoint { remote-endpoint = <&codec16_ep>; }; };
+			};
+
+			/* [Multi-CPU-2] */
+			ports@8 {
+				reg = <8>;
+				ch-maps = <1 0 1>; /* see [Multi-CPU/Codec-2] */
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpu2:	port@0 { reg = <0>; mcpu20_ep: endpoint { remote-endpoint = <&mcodec20_ep>; }; };
+				port@1 { reg = <1>; mcpu21_ep: endpoint { remote-endpoint = <&cpu10_ep>;    }; };
+				port@2 { reg = <2>; mcpu22_ep: endpoint { remote-endpoint = <&cpu11_ep>;    }; };
+				port@3 { reg = <3>; mcpu23_ep: endpoint { remote-endpoint = <&cpu12_ep>;    }; };
+			};
+
+			/* [Multi-Codec-2] */
+			ports@9 {
+				reg = <9>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mcodec20_ep: endpoint { remote-endpoint = <&mcpu20_ep>;  }; };
+				port@1 { reg = <1>; mcodec21_ep: endpoint { remote-endpoint = <&codec17_ep>; }; };
+				port@2 { reg = <2>; mcodec22_ep: endpoint { remote-endpoint = <&codec18_ep>; }; };
+			};
 		};
 
 		dpcm {
@@ -323,9 +410,9 @@ ports {
 			/* [Normal] */
 			cpu0: port@0 { reg = <0>; cpu0_ep: endpoint { remote-endpoint = <&codec0_ep>; }; };
 
-			/* [Multi-CPU] */
-			      port@1 { reg = <1>; cpu1_ep: endpoint { remote-endpoint = <&mcpu1_ep>; }; };
-			      port@2 { reg = <2>; cpu2_ep: endpoint { remote-endpoint = <&mcpu2_ep>; }; };
+			/* [Multi-CPU-0] */
+			      port@1 { reg = <1>; cpu1_ep: endpoint { remote-endpoint = <&mcpu01_ep>; }; };
+			      port@2 { reg = <2>; cpu2_ep: endpoint { remote-endpoint = <&mcpu02_ep>; }; };
 
 			/* [DPCM]::FE */
 			      port@3 { reg = <3>; cpu3_ep: endpoint { remote-endpoint = <&fe00_ep>; }; };
@@ -337,6 +424,15 @@ ports {
 
 			/* [Semi-Multi] */
 			sm0:  port@7 { reg = <7>; cpu7_ep: endpoint { remote-endpoint = <&smcodec0_ep>; }; };
+
+			/* [Multi-CPU-1] */
+			      port@8 { reg = <8>; cpu8_ep: endpoint { remote-endpoint = <&mcpu11_ep>; }; };
+			      port@9 { reg = <9>; cpu9_ep: endpoint { remote-endpoint = <&mcpu12_ep>; }; };
+
+			/* [Multi-CPU-2] */
+			      port@a { reg = <10>; cpu10_ep: endpoint { remote-endpoint = <&mcpu21_ep>; }; };
+			      port@b { reg = <11>; cpu11_ep: endpoint { remote-endpoint = <&mcpu22_ep>; }; };
+			      port@c { reg = <12>; cpu12_ep: endpoint { remote-endpoint = <&mcpu23_ep>; }; };
 		};
 	};
 
@@ -363,9 +459,9 @@ ports {
 			/* [Normal] */
 			port@0  { reg = <0>; codec0_ep:  endpoint { remote-endpoint = <&cpu0_ep>; }; };
 
-			/* [Multi-Codec] */
-			port@1  { reg = <1>; codec1_ep:  endpoint { remote-endpoint = <&mcodec1_ep>; }; };
-			port@2  { reg = <2>; codec2_ep:  endpoint { remote-endpoint = <&mcodec2_ep>; }; };
+			/* [Multi-Codec-0] */
+			port@1  { reg = <1>; codec1_ep:  endpoint { remote-endpoint = <&mcodec01_ep>; }; };
+			port@2  { reg = <2>; codec2_ep:  endpoint { remote-endpoint = <&mcodec02_ep>; }; };
 
 			/* [DPCM]::BE */
 			port@3  {
@@ -395,6 +491,14 @@ port@3  {
 			port@c { reg = <12>; codec12_ep: endpoint { remote-endpoint = <&smcodec1_ep>; }; };
 			port@d { reg = <13>; codec13_ep: endpoint { remote-endpoint = <&smcodec2_ep>; }; };
 
+			/* [Multi-Codec-1] */
+			port@e  { reg = <14>; codec14_ep:  endpoint { remote-endpoint = <&mcodec11_ep>; }; };
+			port@f  { reg = <15>; codec15_ep:  endpoint { remote-endpoint = <&mcodec12_ep>; }; };
+			port@10 { reg = <16>; codec16_ep:  endpoint { remote-endpoint = <&mcodec13_ep>; }; };
+
+			/* [Multi-Codec-2] */
+			port@11 { reg = <17>; codec17_ep:  endpoint { remote-endpoint = <&mcodec21_ep>; }; };
+			port@12 { reg = <18>; codec18_ep:  endpoint { remote-endpoint = <&mcodec22_ep>; }; };
 		};
 	};
 };
-- 
2.25.1

