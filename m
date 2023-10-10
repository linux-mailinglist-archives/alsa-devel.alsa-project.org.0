Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B67BF031
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 03:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA39103A;
	Tue, 10 Oct 2023 03:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA39103A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696901016;
	bh=gv/ZkkxUQpVmHCKv2osK0oT17mWvRQQVi0vF7/ikPyQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cuYuD7H8XkOyJYnfeGzykRh3e+jVMG/TLouUPgZ0v2Dk003x28h6XFnDubPdmbihh
	 f4qxUX3yb1vRcfmiPyPLdAcFL37Rkn3zcLXnaUjmHxmQrRf+qDjmW9T88sfjLq5NdB
	 C0lRlgWhTxUpfjiEJm4+WFtQnbzYl6Bkb72pPp1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18BFAF805B1; Tue, 10 Oct 2023 03:21:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8D70F805A1;
	Tue, 10 Oct 2023 03:21:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98253F805AD; Tue, 10 Oct 2023 03:21:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2DE0F80567
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 03:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2DE0F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=p+T21sRC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDtHMfKajhTn7A2OwiWwLq79eLteCKz01V05weF+IoFt7JeZG7Lq8aPa6jAIDEN3bTqfitYD0tYupvHgHY/OYVSQl9sJfKGEJUnVY+c02kmnMw9eFZU9EGpaGZSu9gHZ/pWNvIDa/EJ3NjXCW5XwEsyIK8ZQm81y0jLomSrp22V1+n1e/qEFH+WTq7yKDVc4SHqL6S8LcKCulotBHYc0afHOxtpL0mLY262e0oScLhF0d2C3nvfjvt8VODGLvZcHyX+yxdMdIt5+Ef+NWzM8qvGHT4xyqzM6xp0YprpzkaoPweCnz4BZAUDJcU9JdoDQCcLyk+ImtyA38BXSSR0lew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLE19BC2ivYYfKqdPF5ibDvTydaPn4w8bmdnri+9FsE=;
 b=Q/xiGWbMhHLjjFXbMwZ/YVQ0axeDZD3CvV7w7ktxMP7sUQWwUmRJjbX3PO4QICSKV4z/ZMa80sqbijHpM1BXO4Eh3ob4d+XEtUuoeh050DLWh49jDS2KWf71FRWWTRLrNbOtyqW4UStYoXHTzqi5tv1iI2GgP6k+VQbXiJ02oTUNXlLD+kxEgr98h6gH5xYllWuZBrvO/1txgZ+VxnK/0OMRJn/UonAXrnQvesjtqEuaVf1JKxhyMZLyi12TUBJkoHThyzwjhPEl2B+lY3cSY+Laz/kX+2PINBjJW99si+QBIQqwJgtlqM4eEOZ5EzEwOXRTNRwLJR1VOgNvZlJAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLE19BC2ivYYfKqdPF5ibDvTydaPn4w8bmdnri+9FsE=;
 b=p+T21sRCdlbAD5H3vfYxwldyRRABNNKxMPmW38cReUBaGmIqacnLRtTX+hc5lP/TEXyAWla8wLhK6psPH3/GCtpOGXVwtTMDz25JpCxzFDlAo2Ifm0l8VvzZ5N9oRdcG22ufKfkzYATGBQOVp/Zczg8WGzeZef1EtKz8/z6qDNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9930.jpnprd01.prod.outlook.com (2603:1096:604:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 01:21:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 01:21:29 +0000
Message-ID: <877cnv8e7b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] ASoC: audio-graph-card2-custom-sample: add CPU/Codec =
 N:M sample
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Oct 2023 01:21:28 +0000
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9930:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4af4bf-6067-4463-f552-08dbc92f3ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dqLqORIvJ6xoqSlX45f30bQ9yr5SOkiUedOp/cK6URlpgyesR9aozo1aGTXg8M8LukHbgY/xDeIgf/mP7T9guVIV7n/FyIg9p8nBiyDkht5OtaemvXuRfRl2i3amcwfu22gJX+JVxES4ycJu/Fv2BtPJ1rAS/+33gitxalKUQ7OqQP54D5r/GBH40HKlJQxR1lfDnXMAyEc5bqlabdIpfTqxdOWKqwdKoQwtl/hG6JxrjAKNxibMtJf6pPekvL7IUzjOi9onJd3hncfJODqoS9SIHUKf1p8o6BLH0pBjYlmajy8FvvhPtbDajhga2f1DWCXoLYMwvS686IY6w4MtsJw5F7cJbLJQM/oFxkdRAkShJNQJ6aoq/MVFG99kLJfnTjKBogGW7JCTKqWTH2rvvxYt1orIYpQPHE2RqVnmefV1vXgJiSsGOzOHBXjSPNowOGAMfjri8euH3NLJvlFe8Cy+FO2FgqIWgDRh7mfSAO9BinzC04YnBGpOR8C1s/1OUNLDmB0TYqnyI6EAdoNQucZMbFdOyhmve5Ck0ZaxokoFAczSrb1eUVET2qKJDLQUs02yklmAYCQxPTvKK2NO52Q72YGvTKavQXilg/rOeDgfgxIwB2lDYwJmgN1Lcfy9BMq0Jd+T9D/EeqG7OkLCmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(83380400001)(8676002)(8936002)(4326008)(66556008)(66476007)(66946007)(41300700001)(316002)(52116002)(5660300002)(2013699003)(478600001)(2906002)(6486002)(110136005)(86362001)(6506007)(36756003)(2616005)(38100700002)(26005)(6512007)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OlONb1Xyye8U7ucPKZ56fKmpYQBxFHGBydwFHectlppLv8UO6wyNf59GNHNY?=
 =?us-ascii?Q?3T/nDtWuCwlGwUM8nX4XZzDl8cscKMLyjx6dHlaGNJSS9ZyiBrjnz5Gbv9fC?=
 =?us-ascii?Q?tPGyVn5xAbqERSCU3k8pME6F+VwnyZ7vSj6kME/aRNiuaS1tGP90Lgx06IgI?=
 =?us-ascii?Q?nd5ge5Lx5ilxiH1FCV6t38dOuWu91stToaVMah7szoul6ZQjYmYQK+0tZa6p?=
 =?us-ascii?Q?LEb0pj3qkt6bhaIAt86BbBIauUwjjvhOJqEtXgoOmMfvWWruxe8o0ST09Mrs?=
 =?us-ascii?Q?83iHg/0y7QL83B3v1D6AKy311QwlRWjYhG+2//Si/0JKa9HSMIssBJDf18wD?=
 =?us-ascii?Q?PlTKWsU0NaXj2TXH6IWsBSKOxwkIyzdWac3Bjm3b7N5scnZ9RWWhE+QSNF+f?=
 =?us-ascii?Q?pOJHhiJf8uyNjR5GBvxcvbqdkFtV6JVW6au6O/rOKedwuoMiQtTKA+YWnB/z?=
 =?us-ascii?Q?Z9+mLnKCzeBTWOlde/8T5o8nasdnYkdMuEf2HeXOB3RazKVN6rUxSGHEOk5B?=
 =?us-ascii?Q?+Y5BXk3aVymoNDtEbXkFlf9OWOmi9zswRu6ntOhk3ChDT9n3J2XBz8JI+aet?=
 =?us-ascii?Q?FE99Ma+dEmthiClaOWGbO4KIUPvD8lvht3nxmplipiXoJo6nefBaAy5TqJDT?=
 =?us-ascii?Q?0KUDc4Hg2u66EFXTsDwTd5PBzBJsxJh806rAUFioI2AzBlJTP8h2RzqMFAH2?=
 =?us-ascii?Q?Vyl8NajBgKnw2pbPuVoVtPt6HHcKwRSh51ncq7e+frTLpedNNHOLL6gi2EI6?=
 =?us-ascii?Q?nDca7gsDew9uTMSnVCVnm4I4rgj1RN6Vi9k/KCJToZWVWAm/e1npubGL9lAl?=
 =?us-ascii?Q?HFEI62vwXhUiTSZtHEufozxyi/IvH+C6SV5XDEgcdTdk7ZVZcsAM54EPHA0g?=
 =?us-ascii?Q?w5uKMVsA3vB2KgtKU1Vq0hq8OSVZz+itnLSCObmfFU4nq8cUeA3NaX7ntT1V?=
 =?us-ascii?Q?uiT4DsjKiTxAHdY8au6CRgIxEiID/S1HNzbaw3F1YTGTexZDS8L7YSkCL0ER?=
 =?us-ascii?Q?RCLvYfvTrGn51R8ACTVGL3thWoBq2vrMuKY+NGk6BfJ9YWLKuUaS1nVo0Nfw?=
 =?us-ascii?Q?ju0W5phSuEN5yw5KvenY0KKCxxYoBrlY4oKAVDi+QYiyMAbIei1m24hpWexV?=
 =?us-ascii?Q?xi1ybUO5oZLpU770+IS/M8NwR5orT/3RONq1UmSrWE16kOaJKvaFgTm2/1q8?=
 =?us-ascii?Q?/8w0y2+eO4ZIEF4BIvYJVLoxmOMEbS/KhdYmB5hiU+DwAEYC2nE/LMOZvyr4?=
 =?us-ascii?Q?2bY8mmDojQj3APFqAm7HrOk4bfOa+uT1iRYEvdctmkizJlUEc9cDW+HTvR7L?=
 =?us-ascii?Q?jXPNJF01vdU5fmLTv4hnbcpESnem8FQmXR70ejuaQet+2ovZL0rvXT188OZb?=
 =?us-ascii?Q?SqLMly8q/45kl57Q41UddxsBqg1sXDVlaLm/2Wrfb7minTsDvhr7tEgVHUTN?=
 =?us-ascii?Q?/yBDqHph7Xh6y/vsAAAExlXVhs/0KRsSYqcSDLXfz3wz5dO+hLxWfdZO5y6K?=
 =?us-ascii?Q?PkiqeUIvidQbcQIyGoHXJ+ZJFuTfxd9gdaNsdj7VrFdh4mARP68oPrxLUcmf?=
 =?us-ascii?Q?/sIMCL612gvH+lfNWA9Qq5EWYogkyZPtaFfxdxTGilX4fY3XYqkMhZCk9Son?=
 =?us-ascii?Q?MPvMJFC0RZqO3TpR3guqalc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a4af4bf-6067-4463-f552-08dbc92f3ab1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 01:21:28.9620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mtFwEcyleAooInU2zaRT5EvkpurqDZl38VQ/ONbmklBHLU/hXBrQjjaQXD3JtVadGU0VN0/ZeJ/G47tBMHC0TpjvblLNEQVukyL4pgLe87tHMq4VAuRuOfM/ANOY2aEf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9930
Message-ID-Hash: PGFADTE7W26T3QIYVNR33ZBFOQR2BWJR
X-Message-ID-Hash: PGFADTE7W26T3QIYVNR33ZBFOQR2BWJR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGFADTE7W26T3QIYVNR33ZBFOQR2BWJR/>
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
index 8acaa2ddb335f..d43a4d2cdaa5f 100644
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
+	 * for ch_map (*), see
+	 *	soc-core.c :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+
+	 *	cpu8 <--| |<-@--------->| |-> codec14		cpu8 <---> codec14
+	 *	cpu9 <--| |		| |-> codec15		cpu9 <-+-> codec15
+	 *		+-+		| |-> codec16		       \-> codec16
+	 *				+-+		    (*) ch_map = [0, 1, 1]
+	 *
+	 * [Multi-CPU/Codec-2]
+	 * for ch_map (*), see
+	 *	soc-core.c :: [dai_link->ch_maps Image sample]
+	 *
+	 *		+-+		+-+
+	 *	cpu10 <-| |<-@--------->| |-> codec17		cpu11 <---> codec17
+	 *	cpu11 <-| |		| |-> codec18		cpu10 <-+-> codec18
+	 *	cpu12 <-| |		+-+			cpu12 <-/
+	 *		+-+				    (*) ch_map = [1, 0, 1]
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
+				ch_maps = <0 1 1>; /* see [Multi-CPU/Codec-1] */
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
+				ch_maps = <1 0 1>; /* see [Multi-CPU/Codec-2] */
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

