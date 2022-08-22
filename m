Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163759B7C6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 04:47:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5694167C;
	Mon, 22 Aug 2022 04:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5694167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661136461;
	bh=7p8xq7l9GbWEjeUEcorLnYzAxevN/o74Jr46tBnCGWM=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SEZAWha0AmoRsWbPN9/CfcszWvF5JVs3Q537ouwvWYSlBfw7HbYwb541WcjzH2b/L
	 iPtLZ91Lq4HRephMCC+eGNqxcw4LrBxohMFfl36t50X5zpjQulDErOBynOQTDE2JED
	 thM+65QxjNnQWyGtBxs7WYgMsYZTg9wj96FFe4jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B1CAF8026D;
	Mon, 22 Aug 2022 04:46:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B18E7F8026A; Mon, 22 Aug 2022 04:46:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BC20F800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 04:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BC20F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="WihRD2u9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvqYKJs7GbsF4ojg5BKo4xbedNnM/kV6AJKOCoOKX/JOWoJq1q6HPl4eaC9NwQ8TR8ZFwtJ8cJhfMA3546fiRS8NGAP622N/s/vvnO7f4EDbAMSA+hUkaAv9yveAMZrkYRrLQKEiz49pti3yR7BYXWE05Wz6eoRQqFnJuRi/APT1014XIxKju80s1YUUjTTJLgbX5aujvyCey2bVPP7VUXftk0wcm/oOslRxtXz5IyWnlhKTjWCAzTtj9d/TRHdzLjQNs3bvjT6zD/RguoCamAP7d0yvqin8yCCSb45XI625pnJtkkyY06MBn+b6KlTRQDvhWqHtTF/upb81eqXuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdN3/am11+5GRH6XIplKA1kOOa+oWJKe1XB/90+7EKM=;
 b=iPC8PLFA4jMt4sbxnYWPfS8T4fsVKVm9AjthgjO8RBvWCgwjbkhaokCGXGqDDyAMMs6d4MXA/ysoXLVpsUznT6+AZnVic/dipEz3o9UHym26a8N2DoybA2xFy5MBtkVUWCG5mjyNXDPbrfIbRk7xs/NoL1OdD2xpXUJC9fU9den6jblmJJtoxhhd2EF4cIE0frkV1sQDGF420Awo9PeyrshiHfwwldvZ+E7fIt37u9LSd9PjakUi6C/PAEdPrYy7G4Cq6HLSmg3awaSXdqy2L3klwkbdv/IW7UzklOSOGar6G2XaNN9hrHNitsooBsMUMHfpO+5VN2IZXRJEMe+J5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdN3/am11+5GRH6XIplKA1kOOa+oWJKe1XB/90+7EKM=;
 b=WihRD2u9pYdxfiRqDKPb215fZ5HSEbpPWxT7beQePfE6eYeg5789iVJw0sl9fMys7DeP61IOezDZCQiEl/77uuPdWoG1p8zzdV2QFmYVrPuUELvHxOEeyaun6Br9S4UZt143FfpAVxn37o4Q2nB1M952b5RS7JCRGUiGglnogcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB1978.jpnprd01.prod.outlook.com (2603:1096:404:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 02:46:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::cf2:7a63:ffc5:5cfb]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::cf2:7a63:ffc5:5cfb%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 02:46:25 +0000
Message-ID: <87bksdgflq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-pcm.c: summarize related settings at soc_new_pcm()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 22 Aug 2022 02:46:25 +0000
X-ClientProxiedBy: TYAPR01CA0236.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3212c4dd-bbbb-442d-2062-08da83e881a6
X-MS-TrafficTypeDiagnostic: TY2PR01MB1978:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EznmVyePG7UHc3NqIbrJhQOWnJ7+qqv7eN5C5yhvV6S3PbPrqEy1h0H6kF3KurSmcTr35RKwYS8xjWW7ePFiVfWNoVzpRb7PjB1FmJ9ubhHIPNnhCLb+INfQpfiZb7xYLGmhmvy2lgjTGT2YxCdBnw0n1sQWgbjvRAEHpL2bcdF5d6egrpFmYJ/XpSZ19/kHCSxzvAiJy1SsRo5fROSVMKm3EuQobkMRLXLpAjUmteg09z9EWwdXsMBXzSfKyLU9smuJBXV29FF4i61ZvpDzEexZyLwzJFTF/L0yxWcH0KwOUfZq3j+f+is3K+lEXGT/3rJ5lsEkvWSIUQyGjz+emEs9k2ma24Eld/FycF3OPbJyo9NbUKBJb5HaD4aq2Qa4PDh/lYlJLST2RcYBhuBJ0ElqDE8mRyz0qn3oKGhtuKL8i80BtaC9estKId8AJ+pNkOXqaGZvgTeHWqm3mVfSSeCF8tV03mr6ZsTPMG3c/uzRh00lLqj/X6mlUNZwrNOQL/SExHsp2qFtLPW8Yz8zCQtkAeq9pgo8VXuVFS9HjZGYDxdRV2W24lz46TTWvP320b3INsAHBWoE4oTRKrlTcoHL2CNF/b2Wu4HJzIq7mAUjkNP+JAI9ZKsziVgThubsb2903RTAfxRGgJvrXUFhfpBNFroxAKxuxi5Ij4weyf3JMsO1jDXvoYDRx62IT4lvLL12Dbrt96ojAz0rGZ04KwGYnqD/tlnVv1urMBM/ZG2EoR8NNQfDVCFtHWIePxrvVV+CTcTRqxUiFG3Cm7eAaVltM5ToVD9CEYr2gPVcjXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(6486002)(478600001)(316002)(6916009)(26005)(5660300002)(8936002)(6506007)(6512007)(2906002)(186003)(2616005)(86362001)(52116002)(41300700001)(38100700002)(38350700002)(83380400001)(8676002)(4326008)(66946007)(66556008)(66476007)(36756003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0jimy8BzTZDhdUGjD7FQ5TBZZ9Av6B6LWuhtG9ruFUMlAejcuZwShvutySuy?=
 =?us-ascii?Q?n9YSxX22IpB7zmjEFsnlR6O+j99VgmM0uLthSbHF4B+KCOdv3GMk3kuB0Vr3?=
 =?us-ascii?Q?ywH+rEyQV6SXvxF15+7YfJLwFMdh2kz9DhqVztXn2/XRLZqyCM3RPkd3KbdZ?=
 =?us-ascii?Q?EJdhR9NntY4oLqa/W3s9jBCV3vcaNVjvKdxuaUrKE//Jt4pnVnoP3nhL801i?=
 =?us-ascii?Q?t5PEKOKjS6Li4w7XKbn5+sl9Nzhh7sJO0a1S5B6zfJhcuo1lYCerVPxw0SAw?=
 =?us-ascii?Q?A0m+GrXJOBB6W1ljPgwIH/bd75y8Ai4lOOZ0vYZyWVF38ofIkGtSr2iVJQfI?=
 =?us-ascii?Q?wrn5R4yR20LIYzKiadFTZBUvVbKhPd+TPDBqzim//1QHP6dUMAdBVd/RANlp?=
 =?us-ascii?Q?XW9j8BpTFInlBdVi9lqScpvreooom/+ObwF35FmZLDAx8p5yk6p/zOXHOKl5?=
 =?us-ascii?Q?pFeen4TcXT+xnt6XgQSglUBsTN2pMVamuVPYe9wxxIT5UIpemQmHRyS/K+tQ?=
 =?us-ascii?Q?9imFHXl5zsbxnEzW79PoPYHNmaPx5DgtjWf4yn4pdYFRZeYrWKCKv99w8XkD?=
 =?us-ascii?Q?+wEWbzHheya+BhOIAxpm5xgnmrtJdr7JEnTFcdq7BmsTW3VLhAKw9yrs8S4u?=
 =?us-ascii?Q?RJSnUQDgR1iVa0cmHFuNroVe1Eg1TK5ReaYeYW0ojH7jeafPV3WWRlI2GEnn?=
 =?us-ascii?Q?pk7Vvh/nqxs3A0nW3ua1x/Ou65oBcxE04QB4GklA39ScbOWcVXQXc6lnlege?=
 =?us-ascii?Q?//gzxXPdSlmslis59M2REVx7EheuFw1nhsa0IpUyAkrjTNSq3x3kXx4QcS2z?=
 =?us-ascii?Q?G2dpqHpQ5G0v4UDaWmEXtupIprBVwFBiqLcmEZupv0tcI+MzMeiqGYOa/wf+?=
 =?us-ascii?Q?8jLuMCkBod5PU/a+CGHju7roGe3Xo8R90NvNUqT0OZH+7chopM5YPXQgMBDR?=
 =?us-ascii?Q?c2y2OeBvz11fV/BlU9yj7Q+ZZ4qFXomBSFtp6R0XwRa65/EU7T+zXxaCRoS9?=
 =?us-ascii?Q?+xcZpBChWR/Ex96BAHYWl2P/KMCenENFxitaPAhbvU52LXKY3hSr0AJjcQHl?=
 =?us-ascii?Q?b6OV5m1KQtzAcrKZibSB4rzeEZJG4Ez2pVrUijXzjod6DolyMnocP9x7MgYw?=
 =?us-ascii?Q?pwDGFmIh4vKb8fZ2IUgVA0DaPtCfb1l94VBfIrGH0QF03k/3NUZpAJIs6iO+?=
 =?us-ascii?Q?IcS/bxjY1Plr1ePRlUJlD8N/0WAZRB384sGtMVmwtioVQee47f+tyPTdxx3h?=
 =?us-ascii?Q?tC7RKSab0jF1UW5AJlqJ9RAPzgg9Wdsvz14hXo3VYzLTMcThWjO4b1S2Y5ni?=
 =?us-ascii?Q?Q6xBJbK+eY95qbjX6oCRseRbgsRlNy8Q2HZGuqe10xhP/H/Z9Bfrcb6B/hfm?=
 =?us-ascii?Q?1xbabfy941jk/iHLYsmgLwJNz8LRJvku+5Mu72e+jlIRYNownHMCAETRJcqw?=
 =?us-ascii?Q?Mgt/CJI8mNhM35Dqv0EFhlFhgx/WoBrponnBU1eA/q0R/PwCzoZkZ7IDWxdj?=
 =?us-ascii?Q?Y5KAUxEIotFUvOPh0LnfcV1yeuR6QJvf8IcllDjQy21+LFeLrMMS6mmAl+ND?=
 =?us-ascii?Q?zd78gq0BJysF37ucSH8yHRx6aScWhYX3l9z2vvTCWV55IocWkojakJN/6Xa9?=
 =?us-ascii?Q?z5CJOyUVqJl014XQmh98ag0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3212c4dd-bbbb-442d-2062-08da83e881a6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 02:46:25.8864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zw9hLBU6pv5AkskCu12e6bhebFFDW4lIo19JgcbK6NsJfshMOXBjegHERXDDf/jYj1IaAOTI/QCfgZE5oGDRtRDcua63faYZFeJHbOocWX941YViC3m/WZiAXGeSocRy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1978
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

soc_new_pcm() sets pcm->no_device_suspend, but it sets other pcm->xxx
at the same function with different timing.
pcm->no_device_suspend setup timing has no effect. This patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ce4a4151e784..4baa24fbf924 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2898,6 +2898,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	rtd->pcm = pcm;
 	pcm->nonatomic = rtd->dai_link->nonatomic;
 	pcm->private_data = rtd;
+	pcm->no_device_suspend = true;
 
 	if (rtd->dai_link->no_pcm || rtd->dai_link->params) {
 		if (playback)
@@ -2952,8 +2953,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	ret = snd_soc_pcm_component_new(rtd);
 	if (ret < 0)
 		return ret;
-
-	pcm->no_device_suspend = true;
 out:
 	dev_dbg(rtd->card->dev, "%s <-> %s mapping ok\n",
 		soc_codec_dai_name(rtd), soc_cpu_dai_name(rtd));
-- 
2.25.1

