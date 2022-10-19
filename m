Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86573603728
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:36:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2907AA80C;
	Wed, 19 Oct 2022 02:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2907AA80C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139802;
	bh=EFYKLP4lBBnZjMIrQpO1dCRq5Q3xBLAXNb85uOdd1UE=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FufL+Vwi6CBSvnRgkMm9LeaqMhEzLRVVQR6qkJuM0s062rgvpi5NVPKtwtUbAkq0H
	 IZ6rURZUVdjK1G3rMK+NPZeEbMWAMXAu642JDa9n/NY12pGgssVMnYVGAnwEghBTBJ
	 4244jbdc+sIosY6tOL8dAOtziVoNqdmx2STMuEsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BFCFF804BD;
	Wed, 19 Oct 2022 02:35:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93A6EF8024C; Wed, 19 Oct 2022 02:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2123.outbound.protection.outlook.com [40.107.113.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9BE7F800E5
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9BE7F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="pKX257ym"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdKMFwiVa9pngmUhj9bYZefbvdZ1TEa96vOMKuUBPwsiIJP26Sc5L6mR1tok0KH4L0qp5THjWwLqmwHu4WYJpV/VInq2BGoQUSA5KS2o3Y+pMqNASgjMij+x3bnWL14PGHr220w8tciR/NwtUVkwUe0dbRRROw6DSJR46jL2+/j+LItfxeGUkOuR/eMXphtzzHaB7+erQS06OUTTA1lJmhum4RCtqHPQ5QOJg79r+/AKmaClrjFzXp3EgpvuHb2yNsiVIBBbNuSgmpSo/3vlG5lRrkqYfic3mwlT6of8NnEgwbNauUl06J8lC/G0JYPfdC0Gp2RpC6ilazwLwVc7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkdZ/Q4rPrjaJp3ZSrMbUe0f36QAJ9aI9psHVfDIMik=;
 b=VYuvWAdm+zhNcBv5z4C61uASZliXouDPhr+8VH4CC06XztzbeJo9yTNndhgaDuzEEh0K5M2/5ibrDlQYeCKKBCUz5LLqOprVRNcMzqqQlUaE36qjDiaodFlf0GD8VHrrBhaOL8B7+zBtlWbu1W3KHxkou+PWAWnCT367zPQ2szJgeeICGGTxnIhaJST1Zx9II9Ps31Dzc4rkurcHyORb/brETqLzpxrpxnomK3oEsyAW5UPRFnx2tEbt+L7pjoT+72bxDIN31OQZCySuRZsb0j+0Pry51lsE3ZtnwUYB0SDE/QgF+vzoX2dApSIPy3eo3Sw5xJ9W1hwK+O7Tdpb3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkdZ/Q4rPrjaJp3ZSrMbUe0f36QAJ9aI9psHVfDIMik=;
 b=pKX257ym48hmmj5LxKpEeejw76pPY6wT3XTcZ/qlQ9irES8U9cPeSqb5ET6rGQhDVQpF+50sp0JZf47g15rBK9sJ3zklYvsgvs7zhF+tkiHfDrGAhtxhtiz+xGtafEoBofSxqGXOXb90psOLWG3OB+ocRVl7T+k9asBpbdIAq+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8082.jpnprd01.prod.outlook.com (2603:1096:604:167::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 00:35:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:35:34 +0000
Message-ID: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 00/11] ASoC: soc-dapm.c random cleanups
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:35:34 +0000
X-ClientProxiedBy: TY2PR02CA0072.apcprd02.prod.outlook.com
 (2603:1096:404:e2::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a10facb-f2ff-480f-ddad-08dab169d5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 10qaKxQ6QE2o74RicH7SBDzmA2yl5hyGrg5LfE/dQKzQu/x4VQlxXqUT0ucRS2Z09Inccx8FbNjKJuiOGhd3qkT+kRDnQQbYqcgc4jhfhI3cGwNt3ToNbZp+/RvO89wGeDjTj0d+F+fp4cDGrtxo1lgtaObCaUe+fK+OdUDfp5OjJLEWfMx1BRQRPsIAImn3mqwhAhVjUcKyZKuhjGpBN9gXplI2awo0bB+UatV0LGNkahewtzjD/ZJtMF4niDKaP8FMfO13vz9L1CeRqXrzgkAyurgDFtOIr9TWyYrHZPHeDLSH8iWAKBu0m3jJ0tYXcdjowDmEqSkZS5NWsnypTvbYd6BqaqViEOxIs0WyeE3UzodFvJVdZBILqKYFksgwaD5lvJslSjZEpLVMyD1AYQbUvp+OKOI7X6aqpKdK5wgB/Tu+PeNhzyPLP0CwMynPwO7HXyRxVJEozhTF3qtbVcYCbNKs0tZH0aOfWqAw2wYjNQX91B5JzaZeyoDa6CeXtEL3DIUatQEpOtsdPJiE9dk/okYr62HQlgl11mhsG7M6VbODeDIcZAF9zRoL+aRO2AEGALgI8yN/MsytVEdoLtE7l4qz5HiKUFemktwMzeG6QCz5PG+QJg2y+wsqo+ChHwrP00J/k02VfyAbT0eJKIZa6ucvXiRnok51Id6QIzVSEZJ3oHcFW9yyzcEkSTI+AQAfSig8rgIhEsO3fx+DYhHE5RZr+h+qN7QJY8ia92U77VTjHK8ep8ViHpgMc9xs3EPlHtK7KVVBizhEcw5goCNWkfx3jal6Vc0wFs+26Xs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199015)(83380400001)(86362001)(36756003)(38350700002)(38100700002)(186003)(316002)(478600001)(966005)(6486002)(6916009)(8676002)(6506007)(6512007)(2616005)(26005)(52116002)(5660300002)(41300700001)(66556008)(4326008)(66946007)(2906002)(66476007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vyAG8peFgnbBHbvJPq971pgv0CB6g0pr3GNRQkOjlZJLG7k0sxVkpyH1l9IS?=
 =?us-ascii?Q?d0YlzwT926XLfVKI7VFel4mK2b6FLOvKTEEerFJqrUMx5ptf71fsbNCsm+fv?=
 =?us-ascii?Q?51ddE4gM/LQdvcfNp5KkP7lFS6CWkjW1G+U8FT/Gkp7TycHUfKnp+dvJAiMJ?=
 =?us-ascii?Q?mnSh88PLhqZxFuM/YYMpq02vFuh5PWhcZxJI36OsPKe2kDKb2eZVlyptnFhJ?=
 =?us-ascii?Q?vxEkMngvPoEN5gVZDlyUHl3QB7OBEduRgQ/Yh2LNdt5BKOjASGnySIEp99cX?=
 =?us-ascii?Q?3BrhduDmFD0q8xVsMkZKE+Vb7DpFoIL/9PQ/llvR7BDg6N+V2FK+HpNpjCQn?=
 =?us-ascii?Q?0ytMen0/JXw8K9zyQ1h2tNAVm2SR1Tgz+ELm0osk34Qj3zQVabvNQsPa7JAw?=
 =?us-ascii?Q?pRBS1VoEZCqdWXYVV+x8A9ip0M0UgUSLc8wBI465+df44t1v0VbE29yMwTUq?=
 =?us-ascii?Q?rIuBkLvricG4MA+Vr2DCr/ID3vj7v5H7/JrvVLaRBVnjfkt2mSQ8E3VVOZV0?=
 =?us-ascii?Q?0g2DBs/pLug7+W0oxhttMSef1CIR/Eug3NeQBDcX2ZjT/gIcPspeQbtGdymw?=
 =?us-ascii?Q?VzwwyOoe5rO/FBw9kvC08nzus+IqS0ffIECz4H+mMMMvXSRg2eBAcBYYK2ka?=
 =?us-ascii?Q?YTElCXrnqh6z/RPxWJ66QjJhCVKPVgE1Tr3JvtpoXKgg0HW58EDNj8is2pux?=
 =?us-ascii?Q?2WVRmFrOSz2FX5on0vWiiKVb0TG7WYqGXU3aUAVxENmy02as+6hOrZ0WMF+v?=
 =?us-ascii?Q?WqVZo/M36WTwZZbua8iOkpcJg1rpH+ihcUsY/X1Ic57dyMfSnonlha2Y4Sem?=
 =?us-ascii?Q?YOzc+NvThLwJvtf2OzLeXY6VuvyiC2fr4Xpimr8H9NZm2j45+GKCXP9T2O4o?=
 =?us-ascii?Q?Dn/nAXCu9qFHf715bjgAjMg2w2yaB8iomUO0p06bGw0PRN/gY11BbWsW548F?=
 =?us-ascii?Q?mx7TFUHGBcLF+uRGknaL0784Ce/NLz0HRZkviLF9AX8DnfnZYqQV22emqcsO?=
 =?us-ascii?Q?23eU8vjADouwSIvejIPc2iFxzumjZTCgy3ITW4FqupVC9rT72CVWR3Pxy9ma?=
 =?us-ascii?Q?DL0GLaQ697A1tWRSPc+qHjg5ai7WQOkvUIF+b3BW5ST0iRA17GvYeP4FvflD?=
 =?us-ascii?Q?eNKXe/l109Eq5w1W3jrh4g/VKLhcAoVp32tMGOynn7tYtMKywDVHMW0vieZF?=
 =?us-ascii?Q?QoE58KQk4mafmaFvT8BI78q1F9FFkKDGbaKC8fDC7blXAcpj/hl3umbikz1/?=
 =?us-ascii?Q?38m6niMv/5KbClnQ1corv4e9pS8BIXrT4qYSDWbcpiPrGUeqPv2vGCiP8UUG?=
 =?us-ascii?Q?afxIe99rlWo1MwM/O4xF+r9XB22cf0jRu8pxlNtBZzqnK3PQd1YAMxt9RRZt?=
 =?us-ascii?Q?HOxUom/LV1svyaeVWKml8My0CtiazOtQU7zXIKKxG13GGFbwQFyc2Ozzjn5f?=
 =?us-ascii?Q?yLKWsfcg8qHlJSy2F3ZG07wua6YnaavLpbi94ulRHp4YV1hDaVVdTtIxJsW1?=
 =?us-ascii?Q?L9E7Thy1S9UINPrRd+errUrfj/aKKKW+U8EZ5rhCp6iMwFSPnrDQqSRTmWfS?=
 =?us-ascii?Q?KL8RzuAVJ7ezRs52OktXtcLyShL8E62MT7QxmYmBDyaQGPeNU9CdEaF+lE3I?=
 =?us-ascii?Q?2sUMtvYk+xfaN4+JmX6HfFk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a10facb-f2ff-480f-ddad-08dab169d5fa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:35:34.7110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQavtkFmL3oTNSZ56f6F9faaXDRrkbdIyu9Svhjekp+OO17N4qjacWF7dru8oNLyoRwZb/SIqD4foxhAuVB4Sa9jksmkdRcr3GFqV4yCR0plK0WKC9gT2TanrDdauEC3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8082
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


Hi Mark

These are v2 of random cleanup for soc-dpam.c/h.
Basically, these are just cleanup, nothing changed.

v1
	https://lore.kernel.org/r/8735bmqazf.wl-kuninori.morimoto.gx@renesas.com

v1 -> v2

	- add "break;" on default

Kuninori Morimoto (11):
  ASoC: soc-dapm.c: replace snd_soc_dapm_wcache to snd_soc_dapm_widget
  ASoC: soc-dapm.c: tidyup error handling on snd_soc_dapm_add_route()
  ASoC: soc-dapm.c: remove no meaning variable from snd_soc_dapm_add_path()
  ASoC: soc-dapm.c: ignore parameter NULL at snd_soc_dapm_free_widget()
  ASoC: soc-dapm.c: cleanup dapm_widget_set_power()
  ASoC: soc-dapm.c: merge dapm_power_one_widget() and dapm_widget_set_power()
  ASoC: soc-dapm.c: cleanup snd_soc_dapm_new_dai()
  ASoC: soc-dapm.c: numerical order for dapm_up_seq
  ASoC: soc-dapm.h: cleanup white space
  ASoC: soc-dapm.h: fixup comment for snd_soc_dapm_widget_for_each_path()
  ASoC: soc-dpcm.h: remove snd_soc_dpcm::hw_param

 include/sound/soc-dapm.h  | 188 +++++++++++++++----------------------
 include/sound/soc-dpcm.h  |   2 -
 sound/soc/codecs/hda.c    |   6 +-
 sound/soc/intel/avs/pcm.c |   6 +-
 sound/soc/sh/rcar/core.c  |   3 +-
 sound/soc/soc-dapm.c      | 190 ++++++++++++++++----------------------
 sound/soc/soc-pcm.c       |  12 ++-
 7 files changed, 171 insertions(+), 236 deletions(-)

-- 
2.25.1

