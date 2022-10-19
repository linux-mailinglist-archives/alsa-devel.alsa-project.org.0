Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECECD603733
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:39:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7364E68;
	Wed, 19 Oct 2022 02:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7364E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139986;
	bh=DXjoQ6fWdOF140b03+p6tZNuGNBBK1fcepGfgEQSjq4=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LMWgBsgGyBy0VsMSl5j58DF9BBezhboXWKE31xLxd9XPVQkbBYLhrHYlE03ofjEiS
	 gxJkPWAnXimeWojDe0SFgvvWkh70OxcDQtQ0KE7BpIISOyZtqjNJkmuZEERKHEZeU/
	 3DRk8FFsCYy1SvJBRZw6oP2JJVxiw834NIZLdR9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55132F8024C;
	Wed, 19 Oct 2022 02:37:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60478F80587; Wed, 19 Oct 2022 02:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CAD1F8024C
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:37:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CAD1F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="eOgsgxl/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHziJGBVxvNTdjW/W86deVSTneDeUIxZQerZEkkxBbR2ALziCEVqU27N4/Zt1RZNm2yuD7gLCNwH49Z8USjswilueyNf7mScN96fHrwqRvSzO4f+PtRIIhzzU+PcCu/5j33Y/1kqpJDa/sKUK9RteIt/qFKuFTVV4PTARxIzsv8clOOucg5xQBFlf+9hWnXHFxXcKGEGTcW8qCMRYTdZ5SWp2ONGMhvbXBc2CNqMqQptmmGJoG5tn5XPNIv152zyb0ETsBgXH1r8YOZoZg3oKLFsOb0pSyee5sLcgX8R9BdPe7cHUharsZ5IQCMkSxs87i30vn8yjs+lj9kUTTKwFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcJwnwKypDyuSGc3/d08Q7cuBDi9r8no8ZMLU529TCo=;
 b=KcXsBrOUZW8hIPcvorrnwbYMY/Ewm1f2ARIr/NFrJLXie+o2xW5kYEiLAhMuRrS8NqQsSeavKEXkdXzmHYZloaScFMIFc6R3xxhEu02iW45odBhyb6TBWCYMc9ItqvC+DQZDyszzBtZOHC6727U8wdtndlhlEXctrce6Yn3j4jLH5qsneaJXIv8uXNcpthW3R+XzEVq07mOeZrmoEK3M0mwsd3OK8f+4r2Q/sDiWB7Y9bQ9WPa0/854X/0pO2z2fDqQ7M+jgDFSxmQ4MoycQBNC7D4So5tsr1MKzn+vPj1fBUO+JV3Gn0+6eL+pbMdqAhZy6JFFIoSrwX0ak7BDfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcJwnwKypDyuSGc3/d08Q7cuBDi9r8no8ZMLU529TCo=;
 b=eOgsgxl/QYqeCfZxST/YHabPOEsxQHMguCr/zYusQBVqV7xxI5vbh6kQkrWqE78BHbnAQAtoosEsrVmjoChaG/52K/P+4DbrTN4BIEwp40K5DicJpKbSxwYhfOMkHZ8WM9mFNvUINwmscEooUDv6PJHLBMppInUbyc1YHFI0yjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9374.jpnprd01.prod.outlook.com (2603:1096:400:1a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 00:37:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:37:26 +0000
Message-ID: <87v8ogsl6h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 11/11] ASoC: soc-dpcm.h: remove snd_soc_dpcm::hw_param
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:37:26 +0000
X-ClientProxiedBy: TYCPR01CA0067.jpnprd01.prod.outlook.com
 (2603:1096:405:2::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9374:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9057a1-f5b3-4397-9c69-08dab16a18c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dV3aIjdsmyYQ+/zkd30hmVPqKWQsHDvpiA7SZgBN+j0Aa4RKzZ60FRQTKCRSe1q4oDArEf8AJvSRFyEy+nddFn++4ATzcbq4yRClmOmXxlzZBsGA6NRdnCO7gL/gQaQ/Qg0gf6y1nGI26h6ZlLSfSlB33rr1qq/Ae1V/GxtcU0zT0MccRpayCHRJbv7UAx3DDbdWFRsJgGTG5H0D8xk6sL4Yst9Q5hbmQc5YZ4gFMmjKGcOxLt0LOjO6Nb/8sLqimYsHSFDk/IyaLnJuDMt/kzGVJFZiYF+C5ehuHN85Tzo2zCRgdhn0S5aOUW5L427+XU5MzaHu8u9ZcFV/Fpp+kOKA0Fmh74yCfwk9nYxYkap2BRzY4/bRK/lMk1KECOW8a+2mFCLJYzFt9FyB7s2/CrGipP3XSStKQTkkNb/22u7p3YvN1V37SHr7z3ngCPCPfKBoghOo13ISdn+gq0gaDHuS+dkRIdehxyAWFfmXvPW0IaxB7eJIt7LOp8+eM6iertKrbcEw0JGUJzysjuP+jZy3VVg7LhtULewX0RhdrFHtbNpGqJe4XPULCv/Tl2ajHN7c/fuH69j+KiN0YrBPb4sPY7xg+4EitysaWCZoOI95wbBfaC0e7ZdodTdwTHR9AsHwYgnKwMcDG4KatEZEreEm2BwBkLoam9GeiD5m7gesDcXkm2J4FsTLH6fwomph8UXPv8tkv3JRNl0AWoqLRSyeIlZxpqtv1m/Gi6l5YyrfGxKGR6zFEYpesYM6N+8Vt+GW7uxYAqKlD0tVm32BCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199015)(6916009)(6486002)(36756003)(86362001)(5660300002)(38350700002)(2906002)(38100700002)(2616005)(186003)(83380400001)(26005)(52116002)(478600001)(316002)(6506007)(41300700001)(66476007)(66556008)(66946007)(4326008)(8936002)(6512007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJmdd5kWovytUk5fGF6LNJtFHKov8tIUK26Y8BgCzyKFjSMpIfDwSTh0Hwar?=
 =?us-ascii?Q?w5fgUk7Lzr5LvBTSFDEW4P00xCWQ3DZfPwVwBg6Zm21rv7Ri93ggSmM3j4+p?=
 =?us-ascii?Q?iAu0hYx21FpThEcL23zrgoERbw+XG5I3X9mORLQJdvM5Df0nxXvxk+x8vkQp?=
 =?us-ascii?Q?6QHovPcYz9urMinMCyU/QaRiMQJNFqwGElbGHa4xe2IAoxFzzFR8GkvNZ9Zc?=
 =?us-ascii?Q?LS+NEUoCW7TXiqJM3VPWxx98vd3T5jppMr/ge3wyt8ww3bpz7Cg8pc6w9CGv?=
 =?us-ascii?Q?CYGvppFR5cfMY6fVfD2YEdgiEZR3giuc0OD3n8jwoCSc8IlOXtrK4YKaSifh?=
 =?us-ascii?Q?xBGCX4pOi2vlFzGju1LIl7GAVHcuNpboMikHMwdeMMqMjFs8eP+OHFqOg/jH?=
 =?us-ascii?Q?nhOxU+uuvTv+7/xiOUgpsFJ4vGaUAd3Dz2y1o+3GqMdomlC7G1k0eXrrYhuK?=
 =?us-ascii?Q?ypAY35Giq9ptaf55cXSoN5dGdcSMuIB1CqdexdRdt2d2+dNWRD2lpFkZ2YDA?=
 =?us-ascii?Q?8TbmQFwr4DoPRozlx+vCyzrMUO9lbTH63JRUrhv9Rb8TQ8uzB204V5Ux4hNY?=
 =?us-ascii?Q?zC5mghdz1UWYUYBuf5oAj/MR3c+ekcr+601iz7x4bYeoPRQ3qLmV4x+6GbNR?=
 =?us-ascii?Q?Wcg+gC9R1SW0x5OsX+f7J+eGVUh+wTgIuqYl+EothWUSjjZUZ25BCdF3P1tb?=
 =?us-ascii?Q?IOdGHMY+BNhaNhtT16+T2OrojVkIyMln4DBxT7hJV2x22KT4gwJcrCIg0ZzG?=
 =?us-ascii?Q?XkT17RyTnIkxy90RU9D4VlvnNUjpLxvqsyDsCMjWD95u/4y0aCdl7v8+YKwl?=
 =?us-ascii?Q?BFSK19iYiR3tMxP9jvVgZBgAOfOJtB3uTk0/VJrP67ZqZLeJgp35+J6t8iFC?=
 =?us-ascii?Q?JAmb/CAQ+koQM/QJT0SND8f8cuD2grYwaG3BRgtixoWHoK/Bp6fnnppVSCMR?=
 =?us-ascii?Q?TIV6TuZS5UY6U3XF7WKvcqEFAhhVFN6JcZWm4jHx2Xd6dvsh5cX2/xnU9qsf?=
 =?us-ascii?Q?PXK3lmOKAcz1VGZb+72PQ0ZyZvKzYZ5AsL73qvUSTqYZ2nUbHJK+6LwbN/sV?=
 =?us-ascii?Q?quacivbaqufv12HfnczDv+v4lYmV3SLg7hxO9VSzA9qrKupuiAlqttMME8xf?=
 =?us-ascii?Q?Q/XkaaKF889M4oaczXhN8XSoNijcoosTwoGUPNz3nERfcsmVSku4Se553iuf?=
 =?us-ascii?Q?LKOsQQKkhoQoYYxqZ+4kCykd+ok5FvmHfkExcRF7WiLgQ5P9r+yzVIGZv8oq?=
 =?us-ascii?Q?4/Nh4D2NZW9AFToBRUuVkyPgCvBx9tbw+FiPEPxpNWdMbQ7sRx996tH3JO+N?=
 =?us-ascii?Q?nUsztgo1bYhgyJFtuN5NY7m+QipgWOSMJZ0fctxwh4FkX9/XU/FdjurTD2qp?=
 =?us-ascii?Q?+IvFv81V31ehFU5zGaSe4zY7t3sYTGkVoIuAi+dvvkSxp4wUajby/1MGUcLT?=
 =?us-ascii?Q?ErelHyAbN+0IoH4nIjmli7bOYu4+bjMiu+WU9AEM0qGI3tBhDzEhVN59OrYG?=
 =?us-ascii?Q?hBqUQI+wRIiOMUif5zdIX7BouLN7txoKG4Ym+8sbLI9uy3lChtMjfZuuDy94?=
 =?us-ascii?Q?MoJ0gLEufRk2MzmoRt6IQQcbkmJ1SB2tv2qS4Q1aGYaocFBCS3KAPHyq+vDm?=
 =?us-ascii?Q?Oyrgx46gjTLspgjuh4sQF3A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9057a1-f5b3-4397-9c69-08dab16a18c3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:37:26.7093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZAHF9gKW1Gn/cNlonu15oUe7ZijHDcCo2TkZpEY/tJPnheZq84JD7vhrbufs+0omyARtMo9vBaUyfOGaHJ4Xkw/uGmrV9feW5Q6hMDa50VDGidER3ddbhY0gKg+d+Vj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9374
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

Current soc-pcm.c is coping fe hw_param to dpcm->hw_param (A),
fixup it (B), and copy it to be (C).

	int dpcm_be_dai_hw_params(...)
	{
		...
		for_each_dpcm_be(fe, stream, dpcm) {
			...
			/* copy params for each dpcm */
(A)			memcpy(&dpcm->hw_params, &fe->dpcm[stream].hw_params, ...) ;

			/* perform any hw_params fixups */
(B)			ret = snd_soc_link_be_hw_params_fixup(be, &dpcm->hw_params);
			...

			/* copy the fixed-up hw params for BE dai */
(C)			memcpy(&be->dpcm[stream].hw_params, &dpcm->hw_params, ...);
			...
		}
		...
	}

But here, (1) it is coping hw_params without caring stream (Playback/Capture),
(2) we can get same value from be. We don't need to have dpcm->hw_params.
This patch removes it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dpcm.h |  2 --
 sound/soc/sh/rcar/core.c |  3 ++-
 sound/soc/soc-pcm.c      | 12 +++++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 5b689c663290..2864aed72998 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -78,8 +78,6 @@ struct snd_soc_dpcm {
 	struct list_head list_be;
 	struct list_head list_fe;
 
-	/* hw params for this link - may be different for each link */
-	struct snd_pcm_hw_params hw_params;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_state;
 #endif
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 7e380d71b0f8..6cebaef77f84 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1518,7 +1518,8 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 		int stream = substream->stream;
 
 		for_each_dpcm_be(fe, stream, dpcm) {
-			struct snd_pcm_hw_params *be_params = &dpcm->hw_params;
+			struct snd_soc_pcm_runtime *be = dpcm->be;
+			struct snd_pcm_hw_params *be_params = &be->dpcm[stream].hw_params;
 
 			if (params_channels(hw_params) != params_channels(be_params))
 				io->converted_chan = params_channels(be_params);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2ce9a8188378..57d748ee291e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -155,7 +155,7 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		params = &dpcm->hw_params;
+		params = &be->dpcm[stream].hw_params;
 
 		offset += scnprintf(buf + offset, size - offset,
 				   "- %s\n", be->dai_link->name);
@@ -1980,6 +1980,8 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 	int ret;
 
 	for_each_dpcm_be(fe, stream, dpcm) {
+		struct snd_pcm_hw_params hw_params;
+
 		be = dpcm->be;
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
 
@@ -1988,16 +1990,16 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 			continue;
 
 		/* copy params for each dpcm */
-		memcpy(&dpcm->hw_params, &fe->dpcm[stream].hw_params,
+		memcpy(&hw_params, &fe->dpcm[stream].hw_params,
 				sizeof(struct snd_pcm_hw_params));
 
 		/* perform any hw_params fixups */
-		ret = snd_soc_link_be_hw_params_fixup(be, &dpcm->hw_params);
+		ret = snd_soc_link_be_hw_params_fixup(be, &hw_params);
 		if (ret < 0)
 			goto unwind;
 
 		/* copy the fixed-up hw params for BE dai */
-		memcpy(&be->dpcm[stream].hw_params, &dpcm->hw_params,
+		memcpy(&be->dpcm[stream].hw_params, &hw_params,
 		       sizeof(struct snd_pcm_hw_params));
 
 		/* only allow hw_params() if no connected FEs are running */
@@ -2012,7 +2014,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 		dev_dbg(be->dev, "ASoC: hw_params BE %s\n",
 			be->dai_link->name);
 
-		ret = __soc_pcm_hw_params(be, be_substream, &dpcm->hw_params);
+		ret = __soc_pcm_hw_params(be, be_substream, &hw_params);
 		if (ret < 0)
 			goto unwind;
 
-- 
2.25.1

