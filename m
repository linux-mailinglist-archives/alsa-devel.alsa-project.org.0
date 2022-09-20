Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3675E7604
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 10:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EBDD82C;
	Fri, 23 Sep 2022 10:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EBDD82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663922630;
	bh=ErvmcgaMaPKlKZ87Wx9k2z+T7Ey3Yaox/7y+QDbvjxY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=czj4vK91lN489qusfJYbbvClDwiieOOVewaKe1PN86LajgUcuD4xltQ+VVhEDZisc
	 2bauLcuHMxeKzvEP/zQYsjpgV3VFSq6OFEFs49DbkeNuz1+P64CNYbClOMXQYJdUfZ
	 kSsmXcHOAWddEFamkYCaE7vhsd6ewhXbWNNjg6i4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B9BAF804D1;
	Fri, 23 Sep 2022 10:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E88B0F80171; Tue, 20 Sep 2022 05:46:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-m11883.qiye.163.com (mail-m11883.qiye.163.com
 [115.236.118.83])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9721EF80155
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 05:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9721EF80155
Received: from rockchip.. (unknown [58.22.7.114])
 by mail-m11883.qiye.163.com (Hmail) with ESMTPA id E29D18401F8;
 Tue, 20 Sep 2022 11:45:53 +0800 (CST)
From: Jason Zhu <jason.zhu@rock-chips.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 1/1] ASoC: soc-dai: export some symbols
Date: Tue, 20 Sep 2022 11:45:45 +0800
Message-Id: <20220920034545.2820888-2-jason.zhu@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
References: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUpKVkhDGB9JQxpJGEwfTFUTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PC46Ayo5KT0uDB0NUR4dN0sw
 HhFPChZVSlVKTU1ITU9OTk5PTkhMVTMWGhIXVREaCBQVVQETDjsJFBgQVhgTEgsIVRgUFkVZV1kS
 C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU9LTUo3Bg++
X-HM-Tid: 0a83590095b22eb8kusne29d18401f8
X-Mailman-Approved-At: Fri, 23 Sep 2022 10:42:24 +0200
Cc: sugar.zhang@rock-chips.com, Jason Zhu <jason.zhu@rock-chips.com>,
 alsa-devel@alsa-project.org
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

Sometimes we need to make some dais alive when close the card, like
VAD, so these functions must be exported so that they can be called.

Signed-off-by: Jason Zhu <jason.zhu@rock-chips.com>
---
 sound/soc/soc-dai.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index d530e8c2b77b..75294e830392 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -405,6 +405,7 @@ int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
 end:
 	return soc_dai_ret(dai, ret);
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_hw_params);
 
 void snd_soc_dai_hw_free(struct snd_soc_dai *dai,
 			 struct snd_pcm_substream *substream,
@@ -420,6 +421,7 @@ void snd_soc_dai_hw_free(struct snd_soc_dai *dai,
 	/* remove marked substream */
 	soc_dai_mark_pop(dai, substream, hw_params);
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_hw_free);
 
 int snd_soc_dai_startup(struct snd_soc_dai *dai,
 			struct snd_pcm_substream *substream)
@@ -436,6 +438,7 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
 
 	return soc_dai_ret(dai, ret);
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_startup);
 
 void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 			  struct snd_pcm_substream *substream,
@@ -451,6 +454,7 @@ void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 	/* remove marked substream */
 	soc_dai_mark_pop(dai, substream, startup);
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_shutdown);
 
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num)
@@ -556,6 +560,7 @@ int snd_soc_pcm_dai_probe(struct snd_soc_pcm_runtime *rtd, int order)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_soc_pcm_dai_probe);
 
 int snd_soc_pcm_dai_remove(struct snd_soc_pcm_runtime *rtd, int order)
 {
@@ -578,6 +583,7 @@ int snd_soc_pcm_dai_remove(struct snd_soc_pcm_runtime *rtd, int order)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_soc_pcm_dai_remove);
 
 int snd_soc_pcm_dai_new(struct snd_soc_pcm_runtime *rtd)
 {
@@ -594,6 +600,7 @@ int snd_soc_pcm_dai_new(struct snd_soc_pcm_runtime *rtd)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_soc_pcm_dai_new);
 
 int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream)
 {
@@ -612,6 +619,7 @@ int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_soc_pcm_dai_prepare);
 
 static int soc_dai_trigger(struct snd_soc_dai *dai,
 			   struct snd_pcm_substream *substream, int cmd)
@@ -624,6 +632,7 @@ static int soc_dai_trigger(struct snd_soc_dai *dai,
 
 	return soc_dai_ret(dai, ret);
 }
+EXPORT_SYMBOL_GPL(soc_dai_trigger);
 
 int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 			    int cmd, int rollback)
@@ -659,6 +668,7 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_soc_pcm_dai_trigger);
 
 int snd_soc_pcm_dai_bespoke_trigger(struct snd_pcm_substream *substream,
 				    int cmd)
-- 
2.34.1

