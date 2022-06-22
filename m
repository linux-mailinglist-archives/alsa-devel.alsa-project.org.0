Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7704155427E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 07:55:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2244A1F75;
	Wed, 22 Jun 2022 07:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2244A1F75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655877325;
	bh=hXNSsXc5D/tYsIoC9D2Tu6uokBpKDbzfgINmvzuZhvE=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bcHhPpDh/S2gYgyz6DhArfNhl8BqyYScUemJb1OHEch0YDDKgrvkHjhf+qeI1Oqak
	 gQVik88pgUEtr9F2U6YOFLq/GgDpbtFVwAn8xTejnJ1XgJZUlrNsyVkrLd24E5fEHo
	 JUyBD0EdCCVmB1BXbDsockZaPBFLBPo/fYzfnNsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71326F80424;
	Wed, 22 Jun 2022 07:54:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FA86F80482; Wed, 22 Jun 2022 07:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2135.outbound.protection.outlook.com [40.107.113.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A7BF80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 07:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A7BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="KHOLZrdV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZTEagtn8jJvAx8RVNdOzJzH3hpLpc7wjp/+disQiFAOMvjge1e8rtIgmjPsissQh9GCdFfbYOCIuaHWan8HuTP36NwZ03mIIyYDGQjGedjo+wKfDiT8M3Kb4Vx8AFhfIJJJEoR8u57I5IqL0/p62KCgrv2HWXIPKWvzezTrvZ0IWf/JVbUDCRtpsSGW3S2WKDnbINVc1CHyoCYQLnUyA68istnij32Bkq+n82/vRYCGjcUXZwH0Hm7bzwVCFTVe9q8assCu4o8ZGKRta34BUSTojw/b/sK/e4I+ztoX+IvATSSWozOKk5QtS9dERn+Kt+WY4r9xRYqnjHdfwaR7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWwy6PUyZ+/hWL/n67tosZjBFYYsKYVjkt60Igpn58o=;
 b=Wc9w5oRUWe0UWdmsxGLp5wxuMmjr+lgE6VskjJ6Mn33fxOxT/QjzTMVsCGYAHc5budWPtULE2Tsdc5VLq2qGrDs6CXDUoVRZ8l1NDHKP0/iDbXDSwMcO546o2fZjYLEPzEO3vMHFpbMFsjK674w41ro8iDy9di7UsrPkpAXxyhstwZBcu8ZXcJJi7meQrsB1Y8A1l0/UKip5VJjXimRDTUg04+Ll2dNdVASh27xLWGHqr0owNvsdWHohiSWVPqMFerJoXmV3BYBFLLww4KoraNcZYW6evQIBcP9+WvwbjzZVmJ8tepg4tTjzAUpWzaAgFswpmQ3qkhyw0MPOtZyqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWwy6PUyZ+/hWL/n67tosZjBFYYsKYVjkt60Igpn58o=;
 b=KHOLZrdVa6p/RxwJyMmHa9CmpZweq3WF9jiigS4zlho4JzcCUaiouE3lIL4QyCyA9JNqj6CxTQ7Lj0DTvy5LaN52472566SGZ7aQzGZwFn/YGdbr0A+74ZhzmX4li5Ss2JlaiueStUPbMfoIWPXJ4fMbDyb7Wzd4U9KD9d8xO3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYXPR01MB1712.jpnprd01.prod.outlook.com (2603:1096:403:10::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 05:54:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%8]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 05:54:06 +0000
Message-ID: <87zgi5p7k1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: soc-core.c: fixup snd_soc_of_get_dai_link_cpus()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <871qvhqm56.wl-kuninori.morimoto.gx@renesas.com>
References: <871qvhqm56.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Jun 2022 05:54:06 +0000
X-ClientProxiedBy: TY1PR01CA0206.jpnprd01.prod.outlook.com (2603:1096:403::36)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 861b16dd-d6fb-4daf-2e50-08da54139e86
X-MS-TrafficTypeDiagnostic: TYXPR01MB1712:EE_
X-Microsoft-Antispam-PRVS: <TYXPR01MB17121DD6914F83F6E2463429D4B29@TYXPR01MB1712.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7PzpSvqO5EZtwOmpODwgKPOYNQ7JUMhEe/deqb8wSn9IM7kTOSrYzogQDd7/4Tpin61QFKm9VyIRortLq7Ud6SlVu9w6vq1QqvggqxUUs5kn7BnfXMNUyvL3Ya04kb2kRY2uAKdVwZ9jnvi2sopSgJ6zhMmDCi0+cahTuO4DNfSIljwB9IKt7dqcuH8x2XTfxWw2J8QNAHpMJ6WU73N85MVabxckUXc+/yG8yBerhux1pz7HdUTrN6Jur/8VAr7TBv25WCoElDQDo1np5vhbu8QPYS6erdGFIOy8JH/l5yAlgvespf9Qa9qQ7X/CSmLYbPugO+TcgxFk1fWcyz9gVbA/f4RJx292lp7eDvhwtP9Zsg+VrPJ+/3HtqL17qzrJxQzoj0r25+vHJrRHczRBLYZTOrSSxueFFHz/WSNalb0RTqqosbPIMAa0LCCQErMItfpAcJeT2BKTLcqU3dApUIi3d7lfJqYc5/4Su5OwmylO+T2ClecMYytXOFLvxcCMqDlxqVXLBstCqd+zfUmG7wTvzu+g2SpOyfdSFSTo5qyLJ34Bl08TSGaFm3/kumwXsSkZsB1cPfTwiU5c68qXpwZsJVFxTynQmOAJgsowW2HmoMaa/54T+bp1RUn7OK2+2dP14au1vqBF0yA/vWITVP8Ik2O3O8MIuaO9sBMlVXoT7PLSK2Gy+UiWc8aR4h78vRIM11NNTSDRTk+fwgUR4vSEtSnspp16XMM/6xiJMVV3oD3PhXd/JYiuI82T8guBY+vn23V18Pp3qZ1lyuD/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(83380400001)(316002)(86362001)(36756003)(6486002)(478600001)(8936002)(6916009)(4326008)(54906003)(66476007)(8676002)(66946007)(66556008)(5660300002)(52116002)(38100700002)(2616005)(6512007)(186003)(2906002)(41300700001)(6506007)(38350700002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6mwDx8gDjNM4tm+WAcAWLOpC8Kjgt2gdkUmSOVPUUBIhjI+AbCUT6Djfr0A6?=
 =?us-ascii?Q?xpBxCPUeuUNfjtZuqfp4EWX6Q8nbUcaRDkZW6utJzGjyYcvKgySdUR1MTUvN?=
 =?us-ascii?Q?yZhO+Io9AmZEVuCxRueZsbkjldZa2DiFrFLb12n86iZ9QHLdnGidC2pxFA6e?=
 =?us-ascii?Q?+00zarSOkDh+nIVpNIH5IOpsv1o9yc+/irlR6x5V+ZhL8S2tTKay/MC1Z2CT?=
 =?us-ascii?Q?/FIlVMp2fodpgidoAY4DC8nMiAccW/2fBuvsKXQAjeFJoo4V4O3x7S3HyrMz?=
 =?us-ascii?Q?7xHsyLT7itpSusH64ExPOwuVuPsGl08JtZjKPoFISEz+NqNeM2VoB9Az4srC?=
 =?us-ascii?Q?RseT23Rn7ifdL5ZNqXE3+J/upq3zDSqursTuMqL1Uu+5AwDfpE+23F42EVDx?=
 =?us-ascii?Q?02WoBZCxc+/mhIGS5hvf+L4hXHCCHjTv9UXxrB0P6L13kpXA9ZozY0ln290H?=
 =?us-ascii?Q?pAsyHpN+SYgTzbQ9r4XroKQdYg5QPj2K5BdPxn1PWlZh2sLozTtoi2R8Y99p?=
 =?us-ascii?Q?cUsbLbaWNRAGJHxRJsa228ZD8wksF9UZyT3/ZTzx2OzJI/gxCjPggagWKhCT?=
 =?us-ascii?Q?2Ac9PPehaAr7sqVi6hTV2IwFvl6s4yzS5MCCKGu5ZRQ2R7XK5yybX1/WfchT?=
 =?us-ascii?Q?Jqj3m9ZvnzkEX2bVTbn1NaKv2NL1suB07ncGt7asHt10jEONMc08w3BHpVu3?=
 =?us-ascii?Q?bO5KkI6l+Q5Thv6v6iTpqcNzqqV1v3+Gp7HR7cEvVMD0DbxDG43odKbQzdhm?=
 =?us-ascii?Q?73ub1pNuOaMYtDnN3Qe6G9o00ER3dHSZKgSRqOqPPE4x2uGPNUvDKOat8b3A?=
 =?us-ascii?Q?LcH28Kq6CseQQuyjIRe1pWfWwYLfC5DJvp+PCjfYiS4fGn7t6u4Vkiy5/R4F?=
 =?us-ascii?Q?NNeLRw1OD3z5mV20F0qZyTarXrihDjgtOukjpXTseqXg7BS3WCq0yohuwcpK?=
 =?us-ascii?Q?iCcVwWpqIQHemuB7y3FY0ve1iyvYaqLfAja4RxwTd9twy+BHSwqYtgCiJJIu?=
 =?us-ascii?Q?EWF0ox+FZYJ9QiBdEpkUtkUEZEws4oBhl5E91T64Rru8MxP/YqG3jo5RNBXH?=
 =?us-ascii?Q?OI2fb4epuoO4g2aD5CUNLVXaTmb1JeQz4YkXl0zXEfCd9Hh3SasU2qZekG6g?=
 =?us-ascii?Q?TO6g0SR0juQub6o1BfH/9vATqCbuRlRRh2EWj3v1XX2J8scEJMjnklDDkoqX?=
 =?us-ascii?Q?k7WdQ9Q3hHp2iKNFv07fAPuj59Z8ETGaRJ/RTyZF0DLoh5CxYmZzOvgZMYA6?=
 =?us-ascii?Q?4Q9jRH2iAPYIh5IH9AX12zrsjOCYGJQ9mklAYzoYIJCYDVAuNgPy/DNjcq0Z?=
 =?us-ascii?Q?pNF4Q5A7v+Ma+XpTAbdZGEDovVK2NszfZ8SKtVrb33kUvyn7ve6BVpOBtX2Y?=
 =?us-ascii?Q?PhmnphbiCmRl8D/UX9TspZNdllQSGR5jM9fKSS4Eu9sPhe/bdCWeRuxzM+0D?=
 =?us-ascii?Q?H1JEhmuIor3lsqbAnNfIVOeCwUNsbwppXXPm1vukwpP27hFhWq4gbbwWyVLz?=
 =?us-ascii?Q?EynTNKh3lOHXjwOXUPNSgtFPl0R6fHa9IXT6FuhgkC9iGzbBBp/jbyM5ajxZ?=
 =?us-ascii?Q?qHABTHqaYvbJthwWgRF8/Q/oEWvU7DbWylKXI0trluvfbYOjm7AcW59e+OUD?=
 =?us-ascii?Q?fptZPqurbFxm1gaIisW9XCs4Rtzs0TAku9Itbdjd459mw81d/VlMmenzMBSO?=
 =?us-ascii?Q?TFk03jGTtZUInxSC/RUvxRX5zF1VkKYxMLcLwNKuQv11MzbL+caOQoTFUspV?=
 =?us-ascii?Q?1fnHpEfEDf1OA2EMXg8XLbqKJex5FaL5MlAMXB8CyeqNZMYy+gm4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861b16dd-d6fb-4daf-2e50-08da54139e86
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 05:54:06.8458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYGTE++hM35tQKXGta/B+0il44ACcabcl5Xnz7ZJgF8M6U9QbfYFTCF0Hxg66eF6SD4LwPshbcSA+q10wbnV526zEAsgEZLdaxrR3GDO3v846FNhHj1dMGbQNdwtQggG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1712
Cc: Martin =?ISO-8859-2?Q?Povi?= =?ISO-8859-2?Q?=B9er?=
 <povik+lin@cutebit.org>, Linux-ALSA <alsa-devel@alsa-project.org>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

commit 900dedd7e47cc3f ("ASoC: Introduce snd_soc_of_get_dai_link_cpus")
adds new snd_soc_of_get_dai_link_cpus(), but it is using
"codec" everywhere. It is very strange, and is issue when error case.
It should call cpu instead of codec in error case.
This patch tidyup it.

Fixes: 900dedd7e47cc3f ("ASoC: Introduce snd_soc_of_get_dai_link_cpus")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 57f7105c12b7..669e4164d167 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3426,26 +3426,26 @@ int snd_soc_of_get_dai_link_cpus(struct device *dev,
 	struct of_phandle_args args;
 	struct snd_soc_dai_link_component *component;
 	char *name;
-	int index, num_codecs, ret;
+	int index, num_cpus, ret;
 
-	/* Count the number of CODECs */
+	/* Count the number of CPUs */
 	name = "sound-dai";
-	num_codecs = of_count_phandle_with_args(of_node, name,
+	num_cpus = of_count_phandle_with_args(of_node, name,
 						"#sound-dai-cells");
-	if (num_codecs <= 0) {
-		if (num_codecs == -ENOENT)
+	if (num_cpus <= 0) {
+		if (num_cpus == -ENOENT)
 			dev_err(dev, "No 'sound-dai' property\n");
 		else
 			dev_err(dev, "Bad phandle in 'sound-dai'\n");
-		return num_codecs;
+		return num_cpus;
 	}
 	component = devm_kcalloc(dev,
-				 num_codecs, sizeof(*component),
+				 num_cpus, sizeof(*component),
 				 GFP_KERNEL);
 	if (!component)
 		return -ENOMEM;
 	dai_link->cpus = component;
-	dai_link->num_cpus = num_codecs;
+	dai_link->num_cpus = num_cpus;
 
 	/* Parse the list */
 	for_each_link_cpus(dai_link, index, component) {
@@ -3461,7 +3461,7 @@ int snd_soc_of_get_dai_link_cpus(struct device *dev,
 	}
 	return 0;
 err:
-	snd_soc_of_put_dai_link_codecs(dai_link);
+	snd_soc_of_put_dai_link_cpus(dai_link);
 	dai_link->cpus = NULL;
 	dai_link->num_cpus = 0;
 	return ret;
-- 
2.25.1

