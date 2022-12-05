Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D916423D7
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 08:51:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48C49174A;
	Mon,  5 Dec 2022 08:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48C49174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670226672;
	bh=Y8yRwuIHPRpCDF8C5RaJ3VPEF50aqhyeRCRNXtHm8mc=;
	h=From:To:Subject:Date:References:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DGJt59XMODwU6QtrUfuWUiwZHczgjGHj0ZH9uLozkwCzcY8KR9KfuypLaPp4Z0mPy
	 HYxIyLIB2ELDes3MjC0d1NX+J/nAG5vhdkr5kA6iBuUhGdGDRtsQGQdCDmS17fusRz
	 aPR6+NSYkSIpi3WHGP5+QIKWCR8DqJB2uJ/ZqMMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC501F8047C;
	Mon,  5 Dec 2022 08:50:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF16CF80236; Mon,  5 Dec 2022 08:50:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 001E4F800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 08:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 001E4F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="G+hLTF5H"
Received: from epcas3p2.samsung.com (unknown [182.195.41.20])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20221205075002epoutp04cc4ebe44348a601fbb07f3ceefb52187~t1j73lFa_1834118341epoutp04g
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 07:50:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20221205075002epoutp04cc4ebe44348a601fbb07f3ceefb52187~t1j73lFa_1834118341epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670226602;
 bh=l6xlszKrTZ5l1lHScImjFKz3w88BROKK4ko0iHaL+yY=;
 h=From:To:Subject:Date:References:From;
 b=G+hLTF5HgYATbKXEUwkbeN4+JBGcw06/FLEVfj6rWUIIM0QlsU/Db8/qphw4E+raV
 n+FczKMJLChnU8tzLS9zVsosS19ZMB+csaYMOegccSC3BMYpvIVGUzwGm5p/n1U/Mq
 4tN6hncF11hD3E1MsvJK84KYmIh4ctfXBvtRMCv0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas3p3.samsung.com (KnoxPortal) with ESMTP id
 20221205075002epcas3p3a649e107eb190f715a9325630b5a844e~t1j7tDHTb0502805028epcas3p3s;
 Mon,  5 Dec 2022 07:50:02 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp4.localdomain
 (Postfix) with ESMTP id 4NQbLL3q9Wz4x9Q7; Mon,  5 Dec 2022 07:50:02 +0000
 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20221205074650epcas2p2bf7d43767ed34d8f8a9dcfe6e763e4e0~t1hIe-5S40315803158epcas2p2K;
 Mon,  5 Dec 2022 07:46:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221205074650epsmtrp193daa271e728d5ce3a906acd38e48433~t1hIeO1cm2128221282epsmtrp1O;
 Mon,  5 Dec 2022 07:46:50 +0000 (GMT)
X-AuditID: b6c32a2a-c13ff700000048d4-91-638da1eace29
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 9F.B8.18644.AE1AD836; Mon,  5 Dec 2022 16:46:50 +0900 (KST)
Received: from KORDO035882 (unknown [12.36.182.71]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20221205074649epsmtip1e71b8892e6df141770b786ceea6a7154~t1hIUzqSs0687406874epsmtip1P;
 Mon,  5 Dec 2022 07:46:49 +0000 (GMT)
From: =?ks_c_5601-1987?B?sK29xcf8?= <s47.kang@samsung.com>
To: <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
 <tiwai@suse.de>, <lgirdwood@gmail.com>,
 <pierre-louis.bossart@linux.intel.com>, <broonie@kernel.org>,
 <cpgs@samsung.com>
Subject: [PATCH] ASoC: soc-compress: Reposition and add pcm_mutex
Date: Mon, 5 Dec 2022 16:46:49 +0900
Message-ID: <626742236.41670226602525.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdkIfZUmQIy5r27gRA6zsfpgxG9cbA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWy7bCSnO6rhb3JBjdWsFhcuXiIyWLqwyds
 Fi8PaVq8OryL0eLblQ4mi1//nzFZvNz8hsmB3WPD5yY2j52z7rJ7bFrVyeYx72Sgx7czE1k8
 +rasYvTYfLo6gD2KyyYlNSezLLVI3y6BK+PUOaeCE8IVmzt+sDcwPhLoYuTkkBAwkdh8bxdj
 FyMXh5DADkaJZ7f/MEIkJCS+7fzKAmELS9xvOcIKUfSMUWLlrt1gCTYBK4m7TVPYQBIiAqcZ
 JW5P3cQGkhAWcJRofDAfrIhFQEViU99ipi5GDg5eAUuJ7VvEQMK8AoISJ2c+ASthBrqi8XA3
 lC0vsf3tHGaIxQoSP58uYwWxRQT0JP4tesQGUSMiMbuzjXkCo8AsJKNmIRk1C8moWUhaFjCy
 rGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4KLa0djHtWfdA7xMjEwXiIUYKDWUmE
 V21xT7IQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwcnFINTIIc
 N13FnWTd+ycYlrakJ2noOZTKuHO4b5pwtm+ZZcXReaHT70bcspqw44StxM/yVxpzeZfH5qzS
 +8O1v3yTtDhr/9dfuXdUBDInvjQp3HNDd62TvFTvk60vEkKn6b7InahmlTs9xML6zrTel1W9
 Tu3PjO9pHelOUC1l3COtkyG1uUpkgv+f78LLHezf/75yQXS9wpl5jH+n9zIyXD1xTrf2z6H9
 wS2Hn2+8dZO1a2bN2ty9H5fw/A39PbNihXfMxh7lCKkpqopbpWSV2n1a+HX+tSR+NEisO/jr
 Xcmbd5KpPxcJawcs+u35R93JdcI6j4SHMoWVXnlHij5/PJla93Jr6y4d1k2MT99etvBpUWIp
 zkg01GIuKk4EAHfDAMD5AgAA
X-CMS-MailID: 20221205074650epcas2p2bf7d43767ed34d8f8a9dcfe6e763e4e0
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20221205074650epcas2p2bf7d43767ed34d8f8a9dcfe6e763e4e0
References: <CGME20221205074650epcas2p2bf7d43767ed34d8f8a9dcfe6e763e4e0@epcas2p2.samsung.com>
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

From a385cc2614c17ba3002b263c0ca47dfbf6395c78 Mon Sep 17 00:00:00 2001
From: "s47.kang" <s47.kang@samsung.com>
Date: Fri, 2 Dec 2022 15:45:16 +0900
Subject: [PATCH] ASoC: soc-compress.c: Reposition and add pcm_mutex.

If panic_on_warn is set and compress stream(DPCM) is started,
then kernel panic will occurs because card->pcm_mutex isn't held
appropriately in
soc_compr_set_params_fe, soc_compr_open_fe and soc_compr_free_fe.
So, I reposition and add pcm_mutex to resolve lockdep error.

Signed-off-by: Shinhyung Kang <s47.kang@samsung.com>
---
 sound/soc/soc-compress.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 870f13e1d389..7bce5088b455 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -149,6 +149,8 @@ static int soc_compr_open_fe(struct snd_compr_stream
*cstream)
 	if (ret < 0)
 		goto be_err;
 
+	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
+
 	/* calculate valid and active FE <-> BE dpcms */
 	dpcm_process_paths(fe, stream, &list, 1);
 	fe->dpcm[stream].runtime = fe_substream->runtime;
@@ -184,7 +186,6 @@ static int soc_compr_open_fe(struct snd_compr_stream
*cstream)
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
 
-	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	snd_soc_runtime_activate(fe, stream);
 	mutex_unlock(&fe->card->pcm_mutex);
 
@@ -215,7 +216,6 @@ static int soc_compr_free_fe(struct snd_compr_stream
*cstream)
 
 	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	snd_soc_runtime_deactivate(fe, stream);
-	mutex_unlock(&fe->card->pcm_mutex);
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
 
@@ -234,6 +234,8 @@ static int soc_compr_free_fe(struct snd_compr_stream
*cstream)
 
 	dpcm_be_disconnect(fe, stream);
 
+	mutex_unlock(&fe->card->pcm_mutex);
+
 	fe->dpcm[stream].runtime = NULL;
 
 	snd_soc_link_compr_shutdown(cstream, 0);
@@ -409,8 +411,9 @@ static int soc_compr_set_params_fe(struct
snd_compr_stream *cstream,
 	ret = snd_soc_link_compr_set_params(cstream);
 	if (ret < 0)
 		goto out;
-
+	mutex_lock_nested(&fe->card->pcm_mutex, fe->card->pcm_subclass);
 	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_START);
+	mutex_unlock(&fe->card->pcm_mutex);
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;
 
 out:
-- 
2.21.0



