Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC0603731
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68D07A81F;
	Wed, 19 Oct 2022 02:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68D07A81F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139956;
	bh=QB+3wt1ouhpJpsrupQxpbiZ46465zHSxemrQyBGg5m8=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G4HCTxvk39lU06psE/K3vMtgfHoCc/ESYg1nXGo085IDUYA1SBVJvNr6gUkR1IHx8
	 7nYOLQMDYKM1ciA8QRkVnr9OQmgIh8erdpZHW9c6PNs7J/RCcptztd/jX6KdaZmM0k
	 4yZXzramR9LnAmjdSwYkFYxu7lvcL2IR0XBOPi1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38AA1F80579;
	Wed, 19 Oct 2022 02:37:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 593F8F80579; Wed, 19 Oct 2022 02:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C14CF800AA
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C14CF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="hpVjhACw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lko7Rk75XBd2G1VmUyQ4GWAal7X4Fey+EeBRFgWEWseWVc6hF2RDGHwIpPJSESgeR6NwCWBi5hZCTJcDP1mGuHyQ4vOcItsC3VrSpVd5IA/cH/Nh0rgzQf7pb8RYCBEuTB3XDEi7bFCur6whQOp/9vMHV55mDXAm3sQMDjZIxGusMgQKU26Y3FGdP120druh2XhwPJ8IPu6ld0tr2SWmcGa3dxNmUlH/525ojN1nRhcglO6sKI/sHxC5zt07S13gGmUXRp13iuJGvJ8LbQ7YE8WFgxi/upLgZI86rUMd5pgZwTwHvWXW16HETsPiZmW8mQ7qpwoX0y1p7LGADXlm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8GmyKLYjPI6WO6tQMsbWAe2YZf1jXH6TaAyCcOrq4g=;
 b=kbMwQdO0/Q2oSs0H129yMksLdYbV4jXo1GA6g+YTi9hpWwaA1Gw80acegf9NrU0nDsY0z0YE+tmkirAQa6Otv1lJUYWqrTsx7HciLMrz2B6/RPoHdM6RyzPmxJ6G948pSaLpcN2G2Nlt1gWgvgi6ty+/i/ammGLa9dc0nDPBjHaqaJW+Zr5iaTMjDWeeKglhpRB5qkzXcEvqBaz2kksEWBioozoWBiRwJ05Lxbpfc1f/ff4ah0EMrcQkNww2drGkqBWud8qdyXDAm60rwuCOgMYHn3y31HEWF7S0QBOnPwaRDa8EFpdehrIl58xwnvPFB25YPJuiZI2yh17/RCJeCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8GmyKLYjPI6WO6tQMsbWAe2YZf1jXH6TaAyCcOrq4g=;
 b=hpVjhACwbbXMw1lv7nmqDYqrT//gsFs3w09h3d8JFb3SD+AAafrIVrBsu+mFwsDvzRJPs3BFiHjxbRk8Zf1mZxKZYBAkmHvbRLt/axz//ZGmaw3GqVLbGpa2b4tpnuKsrqimYOuj+gr1S9I9XlqfVwfsUWU89seWJBqjJcNz3pE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10149.jpnprd01.prod.outlook.com (2603:1096:400:1ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 00:37:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:37:20 +0000
Message-ID: <87wn8wsl6n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/11] ASoC: soc-dapm.h: fixup comment for
 snd_soc_dapm_widget_for_each_path()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:37:20 +0000
X-ClientProxiedBy: TYCPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:405:2::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10149:EE_
X-MS-Office365-Filtering-Correlation-Id: c65d78ec-3f8f-47c8-f365-08dab16a1525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uGznGzB3c9uyJwU7CE94zXb4vkOGAvWpsLBJKxO6OULjcDo1OuMoZLAKbExSekyCQuVHNlMNGRygdHyGDwHEakZWmc0RLhJ8tVm8+dp/zzkUKjEBuf/5UJPqe4NsosGtQPG0HmduVISLRqNQziobvjXx/xUE+LUopnF3K9DGfKfoacknlchYlOPw3StUTwe9S9IsTt0FXo4m95ozZ7ZirQs6VNkPJsyXNzoV01Gu5D3FTBA2+hZ+3hRXGBmONYyziKyWEazw47CSI4appA8Yip0bngYQ0bp4rEyesBTm5uDVvHeHVZ/z4y4mZ8o7lCgsVUG2mi8SYCVm/mG+e0rnmGsTYlqhFjL/xpcRLS7vwUkwHef0b79npQDQOesDyzSAxIHbDYGw8Ohr+E3SgIaIyuFhycQUTbiGRcXYWX0r4mJ/k7OLYZJhsGvt60ow5tbMU8EBlIe0rS3JvdT5SIDnxcgNhI900EHXJshBHhlQS8o07D4ralndLXZeO/gbjRdTVltEoPPPPzmsjRzz08G9YYreTznzlIHduhnHf2QFSy99l95e46DgUCbw8WCYjb4rOcVEb2EJ+j+1ZPLhEjhLsceYWMDtdL5q1buD0FoSOaGBxSv4Dnyq0dgwYEsn+/UUX/6OhcYW3LEGTjT3/KYWWyVgYGi4Z6v5R8JdPsWhB1Le52radJ5JsYZP475TR6CWtE5rvD3LSQVuPZkeLBkn+dz2fX73VQXnkimS31D3R+2oSYvHUFFbzIhVjcVALJ6+3vSKEjFBpGABLBvdj+pBsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199015)(41300700001)(316002)(66476007)(4326008)(66946007)(8676002)(66556008)(36756003)(6916009)(38100700002)(6512007)(38350700002)(26005)(52116002)(6486002)(6506007)(478600001)(86362001)(186003)(83380400001)(2616005)(2906002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fz7CtPhgGhEnHnO6OYz3opqLs9I0bUxJlc00PEW55KatmSWnT2oouA6+jtMO?=
 =?us-ascii?Q?irnlBPsQHj5iBeZaVQZw39JgqGB2zW92WdavZ8XR/4ZxThaoKLYYVlreOxtA?=
 =?us-ascii?Q?agMXz8Oy/wxVP1+mTobDKq+EcqA+n0jKhW5GF0ILBsFBzao2+d6w/SUl6V5j?=
 =?us-ascii?Q?GYxoLAIRHnhi1pTOubH2n0IXBWcu6HcKB85iNI02CZQ5Lp3ljtska+Na73+r?=
 =?us-ascii?Q?pS82EGceEUbYKZaC25F4qUU3/fNut76WcAP8rsx/4PvqyYUrktuOEp2aQY/q?=
 =?us-ascii?Q?IebjrBLPMlPWmw5BH3SFsg5Ty2XMRIimx+oPsQHPpAtiEtAvW9ByGpGzRU9D?=
 =?us-ascii?Q?4M3SG2wjX2Aj9Fjz4z0jiHRgOKKBswN+Gspxc/kTIMFpgDUEeXEKxmftHnD9?=
 =?us-ascii?Q?Sm24XrlLzXOeIjTJMEPb2dx/eZmFmEG57lrcntpmFrv+hNLWdzXJQqAHca5K?=
 =?us-ascii?Q?DkdF+Oll2OufP9jRQIez3F5HyVA9/6fsxXiGe2Dd8UWe4GXg4jc43jLhHV7j?=
 =?us-ascii?Q?zYKkH4due9Q4HxdHnQbCts723K/ayOk2rUThimA61zqt3zkMosikwYaT61we?=
 =?us-ascii?Q?2vgAxskRayY0sotvtpRw1gRJyZeQ4McfJhLUo28DLU1vmVbh4Cn7pJRuKNxc?=
 =?us-ascii?Q?GDsF32WKO2ZpgmygAQIswUVNXUxIfl2eUPdyKgCQh4cY8KSHwUZK5y3SU5Ou?=
 =?us-ascii?Q?PI1Xz6RXIAY7h9/Gu2G16/wSCQeMRpYn0YT923R97eIgBzdoO5oQnRDBATnd?=
 =?us-ascii?Q?LNdbOPkjsVPPivDTmzCGIdIudMn9NyaZkJvtc+i8HhqHxiW0V5zFsYAtrQJv?=
 =?us-ascii?Q?5Z8Af373msrWUFmIQi8oQOOl8DM1jttZjSVjcr62d9eSwkvTVevIbXGxtGSh?=
 =?us-ascii?Q?DIWx79wzsJuPHvhwtv+3Vv7RnPE3yJ45AJqf7JJQBltOyIaJ78Sc6Ors3RoG?=
 =?us-ascii?Q?XsS4oh/JifLNim2SKvIeKZ5p/tABw37ojI4+7j2ygHuHkNQIvTQ+Z6U3qQ9S?=
 =?us-ascii?Q?Qb+iGI3JccKzyBGQumHPKm3REQSi1i9Z516vXydbm+4APp/3NjJMX+wypCT1?=
 =?us-ascii?Q?XuxLf1GHPO93Anpdsgs1NCwpqWJjprqLFRANbVtCtADHPYIld6/J6PWX3ESU?=
 =?us-ascii?Q?dpBO2L6RaL6c8OrPVLZDLMSvGHH8HdibpajL0T2mzCi57gOMIp56PS5E8T5v?=
 =?us-ascii?Q?a/U2O7DHyE1Sy4H58jlKUIHNP5G1fsTFiI+j4psOJ6Y8AA3P2iTLiBZ7YnFH?=
 =?us-ascii?Q?2JYPCgdVsExzQ/Jph2ZAxe77fpFaJxMn4BD5c87FuhnN3Ssnb1uSFMdqPQeG?=
 =?us-ascii?Q?Ve6NYA8TbLO/vuphLfWZlIZQwjFO43rfIzWz9NGxUMN8YGdJLpmKf9JvoSDB?=
 =?us-ascii?Q?QldxDgqxKLII3VkV/jOfU4X6HlvI5+eeCUOWSslD8LUTIMQ1UfDBH4ifYCZy?=
 =?us-ascii?Q?vTuEiSdQb50uG7Xuu3SsscDM9wLnHzm21sK1NDySGgZKjGn9aBwxXsLoe6V7?=
 =?us-ascii?Q?G+tChC9e002u8yjLaD0Xl9jee/uHXM5aP+1QOV4sheexxxOSP9bAwl/HCo47?=
 =?us-ascii?Q?NHnjx21H45YdHmjD5Oh8GdDOGrChfAc6OG08+oZK5Dj8KfVtyxWZlQFf3Fz3?=
 =?us-ascii?Q?YbgfMxV7twi/qymxeaomjso=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65d78ec-3f8f-47c8-f365-08dab16a1525
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:37:20.7210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CYXpbbOoYyu6uJhp5paJHzuqPfgR74dpFxtBHFFu+l89WhkmzAAvxwVWkxf7qsyzeT5N5RomnX75ZX2WP2o9FWplem3YoEQ0/FQ5dGI6yrTjtWY6QUkVb/14pcvuevk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10149
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

The comment of snd_soc_dapm_widget_for_each_path() (= X) has
"_sink_" (= s), but this is typo.
With "_sink_" is already exist at (A). This patch fixup it.

	/**
(s)	 * snd_soc_dapm_widget_for_each_sink_path - ...
	 *                              ****
	 */
(X)	#define snd_soc_dapm_widget_for_each_path(w, dir, p)

	/**
(s)	 * snd_soc_dapm_widget_for_each_sink_path_safe - ...
	 *                              ****
	 */
(X)	#define snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p)

(A)	#define snd_soc_dapm_widget_for_each_sink_path(w, p)
	                                     ****

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 44597e63344d..77495e5988c1 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -735,7 +735,7 @@ enum snd_soc_dapm_direction {
 #define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
 
 /**
- * snd_soc_dapm_widget_for_each_sink_path - Iterates over all paths in the
+ * snd_soc_dapm_widget_for_each_path - Iterates over all paths in the
  *   specified direction of a widget
  * @w: The widget
  * @dir: Whether to iterate over the paths where the specified widget is the
@@ -746,7 +746,7 @@ enum snd_soc_dapm_direction {
 	list_for_each_entry(p, &w->edges[dir], list_node[dir])
 
 /**
- * snd_soc_dapm_widget_for_each_sink_path_safe - Iterates over all paths in the
+ * snd_soc_dapm_widget_for_each_path_safe - Iterates over all paths in the
  *   specified direction of a widget
  * @w: The widget
  * @dir: Whether to iterate over the paths where the specified widget is the
@@ -754,7 +754,7 @@ enum snd_soc_dapm_direction {
  * @p: The path iterator variable
  * @next_p: Temporary storage for the next path
  *
- *  This function works like snd_soc_dapm_widget_for_each_sink_path, expect that
+ *  This function works like snd_soc_dapm_widget_for_each_path, expect that
  *  it is safe to remove the current path from the list while iterating
  */
 #define snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p) \
-- 
2.25.1

