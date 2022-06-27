Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220AB55B57F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 05:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8B85886;
	Mon, 27 Jun 2022 05:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8B85886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656299152;
	bh=OSadyDeklAj3l6a7oJEisYY//jfTuXyQg5isenQwxzg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XSSewcUYrgziw4EbyUwCz12nqjpL6WKSt2kxucrSRY5Ih6uB01oXpveRucVgq894n
	 AzTxUekQlHax9QC2sAP2cvbjwx8WpIN7Za6s0sqgjaCH6xVIlreQYPV282tgfqOV8G
	 b99KdJnymmoPlc75evkBWRi9GC0EgvkSGT9cKEKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 255F9F800E9;
	Mon, 27 Jun 2022 05:04:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B516AF8028B; Mon, 27 Jun 2022 05:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2111.outbound.protection.outlook.com [40.107.114.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EAA1F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 05:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EAA1F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="eILFnj+3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnByzaNcMedkjTkXuCsfhh0E+wc0+LY178kHB2hc+BQo7L7wI/kKyMBu2Z0WEXuPlVhfQ2vsoUHe7C7S3e6IbLuNkUSZp19ySxrOh6h/6fSrZa9zC3VElTC9lIomcxi4/LAGbAs/r1zhUNHcYuEHJewnjq126AFFdtnFtrnjpDGy3HGXpvzIPv4dVUBkgRnJNkl+pdiWYlEG+6hnBYptHs7gR2k5Db7DJWBnBGrY051nLj78XSJLlS6Ftp8NjicfubkIzMEF4n2DhzmYqa98BMeXMlq0XydWvfCMny4qhGe5sNYf1gucExnhZnC7skFyaltfG0mky6dTlPjHUJF4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGDB5KMnT2VGvKPkU1frwki70qAQDZCszIiWrxStBaY=;
 b=Wx+WDNEu7z3we5OD/12mmouC2PFtylhS/RiNjgoGFEzmFEfMm/huhNDJnExfTOc4v0RavsLAdCne2RgYX87Q0XW4ocizmK3XHgw/YSIlAH/ePnU9P/LLPm6WEjm4k28ZPwGEr2SpEmMXVuFNUlPipUsyEW11qFuBF+CxMNos9vOaeSPIHqsfHEVPFyUQ6IR6qnw44kkx1p+JBNlxuyiR5vyuc+756vQgBPMmPw7FyRSUegd40J214Ew1GSEagZrNTpLr3Hx65NTzb5lhYfQAJ9CnH/O6uqkdVzBh2TgrGHG2w4TH62fkKcD+o15EFgPvz/xjTjXXr3o2N6JBhrC+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGDB5KMnT2VGvKPkU1frwki70qAQDZCszIiWrxStBaY=;
 b=eILFnj+3+vEkoPZfsB7BsNupfLZmz/qoscM3d1760enQvCUro/UQpY51HCwRUnME2mbmqG/rcYgjuXu+523IRi4YNGaWHYxzQolfyBE18mZMOH1G7ODnsW6rTny0ACJg80hWFS7SWt6vF6y40Xa8f+LIJ2/t9vL4i0FwNANg/tE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6093.jpnprd01.prod.outlook.com (2603:1096:400:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 03:04:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%8]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 03:04:39 +0000
Message-ID: <875ykmx0vt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Question about DPCM locking
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Jun 2022 03:04:38 +0000
X-ClientProxiedBy: TYWPR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bdb906a-9cde-4493-ac28-08da57e9c62f
X-MS-TrafficTypeDiagnostic: TYCPR01MB6093:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfMUJC6Ao8ABAbCuqrNetFR5kGfufMhOB0tKSXAQPm7AW/QOMJ5ZeXJhR238IOe0PGX/uFac7c74nnB0sbROTh6QwTCWsZWOQIEC8cHGqJZLOUvt8i//3gcCNVPSahSJFbewbz+HYsgrjWykgWcZopIhA+9Td24fMfVBV9KrRvpAwin8r0CnaLB+rzCSUdNWAwVgS/pjwyBknNIyuIJmO2eMkXXAOLYOtOTQ2pn7lRgjxKhJEcp24YfsZ2DpXqTMWbRMD58gmJgjUBxC22Lm9qEAH65g/ORhplxRilF0byE3LymAMTmdhhL8gykDfqn3kzfV3jf49GVecDktLZvZgHborPFl9jl/ovvwGR+JEx8JGJiwk7leOPjwxhcz4w6Cve5r6F2+NHj0JJqVT7n+zvabQfojCAcvZ8Mon9cbEgL97rg+qUVHDwKuSmuSPtIwMjpfRrmortX4dsznghfV6BuBSrciQ831ue75UWoICzsNd0EgWNnHY9Ti23ALYUvf+8/gCJ815K9Y7f51+D6piekhEHIz1VE4r6UQJgvJRx2K8V91Zq5rvCCkl8W/xaUwuwyihrcnaCNug0SqHgMWpCVVC6ScoPdqVcpkk7EG+aXfnC/Cy4aBm7O2EeiqLOSNdM+veSDsr/fhHoHWs8fcuu8KFTJwrtcdRl7tWu/wrYup8jqEFVWQUgpBNgM8lSlzscseJhIhvNJWuB8Am2Bv7KB6asFfT7WV2T1S1eXBGz9OEd8Wfaypv+rnZtAgsaj5yZCKzcenv3F0ZCL6JN+8jTI7gCnwFCwqWqIESwWTpzom5AIl5PhtFX6yclYJMnU+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(36756003)(86362001)(52116002)(38350700002)(316002)(2906002)(6916009)(3480700007)(6512007)(6506007)(26005)(4744005)(83380400001)(66476007)(6486002)(66556008)(66946007)(8676002)(4326008)(38100700002)(5660300002)(2616005)(41300700001)(186003)(478600001)(8936002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Xf/XdGIUzAmsKOLALtFZw0sMCogKf6TAMmvHTLPY7jLY91W9Lh5ixStlaQu?=
 =?us-ascii?Q?66gItRC6OkY5bZ592XK4XpFhQp61sRkIQjqxyiEsWYglXZICbM9ymdd0JX2B?=
 =?us-ascii?Q?ZgFKk9NrvOTvReeDSZxfWvDTQqaph06rHmzepdtc1xlS+WDgBOEudyG0P15k?=
 =?us-ascii?Q?ns4sHyaE8Fg5R1NFCOJ+V0Cua0FVetFKcA8sjqRZIpHKhFQASgIHI/yFKtUk?=
 =?us-ascii?Q?503uummByQ4tHUvDF4eDVwxfQeCbD56ZLI2GjIayJdt1A6/9prG8pgoX1ihl?=
 =?us-ascii?Q?x8Vk9iI6SQcxxZ806I48g7wJNS41DdluNpA5qtHaTYQ9/IYw55W25qBFDR+h?=
 =?us-ascii?Q?Bz4+tPiI8gBhpJ6T/jCfCWp/JHunRmZFAnsZf/6H8vBjCrp4JsyvaLE4Bd/s?=
 =?us-ascii?Q?hW+PaP4gpXCdFux1NvxgL/3pViqwrYSDaOw311mM+B17Ir/jEMv+IKafGo2j?=
 =?us-ascii?Q?hffnZSM469ZoxIPrmGjSNYl8yBsdQS1MX3hHsgKCrBb0oZc8SnzxJmAw+wiu?=
 =?us-ascii?Q?LaVA72U3LIjx+ASW/vIbRv+kdheN9hQw749T4xUQrWYsYBNNjmyIaW2X68Iq?=
 =?us-ascii?Q?9h9FFrSkbWtg+IuYORyss2q7Rt4mbGV55URy6ZokmwgpObPJjnaW/GM7yJMN?=
 =?us-ascii?Q?W8TGkghjuUJ2N2mK2I9OcZcurevJzErFqflPDNQgIZwYCrk6rUfemM28Y87T?=
 =?us-ascii?Q?gfceR3MneCNAaOMTAzKcl9oYyek3ty1NTPBMMXU6VaPYnsHPROGqTC9oDZWO?=
 =?us-ascii?Q?UebWd1Uzu1tV0PTKwgRtQh7Cs2f6Cwv5BjPkm5PLNDJCoU9o97fehHIcTu5u?=
 =?us-ascii?Q?DiHOvYztPNZllCN49ZILWWOwkwkui8VMDqWB66kWUiSuLbritOg/b80IhvVP?=
 =?us-ascii?Q?1lSn+RLHq0yOvkNUBSgCAWgK/TYjDoKKrivndLQmspYn6muliu4genbWgQ0U?=
 =?us-ascii?Q?lSSaLpDs00eRsSfatJBAGsjbw0UClFJq49LFUF4GM/AqADA5QCZkrwDXJK3w?=
 =?us-ascii?Q?Zq1MAbwKl0FSVQvNR6q3rxFjJ0u7gvRxt1Rcy1d7DLAQyK2/0QYxjfa1/TUg?=
 =?us-ascii?Q?5AoQikoNa/gzIH5rzGcWkR0930R0821Rx2s9E/OtP1J/mfy/NlkWd5WLBMPZ?=
 =?us-ascii?Q?kHriUQLPP/NKoId/EDlu927tkrpC+e3CAtbviN3bppvWFB+rkAKVxGYcaXFk?=
 =?us-ascii?Q?UbJf3tPlf4jROX1f9bghocxaIOmWnOT58akaQTmKSZ/dkkUZDzOi+kk6Fe2z?=
 =?us-ascii?Q?Bp7rDHiByCwDHatCOVBfC6RGzJHNeZMmkwLGLYplYev2Pss1hujDM8N2jc06?=
 =?us-ascii?Q?AijCwoiYZG39XZHnJDptmSUQzqfQYek2nStpjRIQjXFrWIuY7RIWY1P2o6td?=
 =?us-ascii?Q?Np97S17vzw/ebmvg56xfcFs49tSsNDpBZVq+t/5VWckVp+qBvoXix3iVy0Ap?=
 =?us-ascii?Q?cb+qRjMUmv8GO3Hd2MiAB8TIX1nzhqQQTJiX9iqSYu6SLw//U80U1ztK8gld?=
 =?us-ascii?Q?Kv7XMefZp9eXjhkTmiTwPdLfRY4JCobsrEPlBj0PcyZ/GdBvbbyGkf7qwv0i?=
 =?us-ascii?Q?isJnFIrK/YmPFz0EpzT/abXHKKRA0U4Odu+wi7V51K7W3UVRjIZRA8Kp16eF?=
 =?us-ascii?Q?PnXMjqTs+Pt7Th9A4z0pa6s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdb906a-9cde-4493-ac28-08da57e9c62f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 03:04:39.2230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oq1Pmt9YHOIWpBhAbl9mUEp4teEqaAfzuC55aLerzQC9qVohzt8Cb0sARpNtPiKnSTMtyqiDbuOSH+p6KLMFVtOSYHIPjApFUk8rFX3N6rJ0od1VB4Pj4jeI+sE8mrCW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6093
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


Hi Takashi

May I ask about this patch ?

	ASoC: soc-pcm: Fix and cleanup DPCM locking
	b7898396f4bbe160f546d0c5e9fa17cca9a7d153

Q1.

It exchanges many function parameters

	- func(substream, xxx)
	+ func(rtd, substream, xxx)
	       ^^^^

I guess the purpose is it want to call snd_soc_dpcm_mutex_assert_held()
inside the func ? But it looks very verbose.
we can do like this, but am I misunderstanding ?

	func(substream, xxx) {
		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);

		snd_soc_dpcm_mutex_assert_held(rtd);

		...
	}

Q2.

It added new __soc_pcm_close().
But soc_pcm_close() is using soc_pcm_clean() instead of __soc_pcm_close().
Is this just a mistake ?

	static int soc_pcm_close(struct snd_pcm_substream *substream)
	{
		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);

		snd_soc_dpcm_mutex_lock(rtd);
-		soc_pcm_clean(substream, 0);
+		__soc_pcm_close(substream);
		snd_soc_dpcm_mutex_unlock(rtd);
		return 0;
	}


Thank you for your help !!

Best regards
---
Kuninori Morimoto
