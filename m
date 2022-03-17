Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E34DCCFE
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:55:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92D1192F;
	Thu, 17 Mar 2022 18:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92D1192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539726;
	bh=HwwaPa4ACpnTuzFjP03Rd66VY8t8NuKVtfI4ogqbS/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gjdnqdKHoAfQsTpWuQiUgUB1uzrztKZd4Ix3ODzxS06ehtHXm1cCWExy3qE74Sk7I
	 VLy9WFjSbzvV8XbYtiuAQWbS3GpGV1NJg4QcPteEavxZ/WpV9wrkijCK6Y+vDUgsVF
	 tba7dG1N3LWFnwkSvGm4umxWpOjwhZGIUt2YHhww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A16AF80526;
	Thu, 17 Mar 2022 18:52:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28098F80538; Thu, 17 Mar 2022 18:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B7B5F8051B
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B7B5F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bvKV79+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539513; x=1679075513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HwwaPa4ACpnTuzFjP03Rd66VY8t8NuKVtfI4ogqbS/M=;
 b=bvKV79+/IV5QZgsmKUA4FfIKRdOu7oY+Hd/DbEEVPmNFVvPW9z1TJp5l
 1GLvFw4YlpJ9NvdmYLi8pNPIz9m7jJylZJrLwIDUzYsKIKL5H4xep7qcG
 OnanxxHb2opT1TXWnuwC7FMsESabbW+i+Wjk9COD1hoYnBvd8UwnuXM3l
 qrnV42IFs49IO0IL60dlpuglKllqv/HSbS1P5vivA9QXZxY0xKdiU0JIs
 CuwVtORX4ZJd6BfJ4wo896Gkzku6jQBnmP5D86U8A9GDJE8eFsQdfuybe
 ZmFM0RzeFXMfuMTqQlhs0EQnDEKW1RwmJ4E9fm/TDZHKHyLuU2HtcWtzP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492923"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492923"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431145"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/19] ASoC: SOF: pcm: expose the
 sof_pcm_setup_connected_widgets() function
Date: Thu, 17 Mar 2022 10:50:37 -0700
Message-Id: <20220317175044.1752400-13-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

It will be used in IPC-specific code.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c       | 5 ++---
 sound/soc/sof/sof-audio.h | 2 ++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 1661b0bc6f12..47599b57ff19 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -105,9 +105,8 @@ int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev
 	return ret;
 }
 
-static int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev,
-					   struct snd_soc_pcm_runtime *rtd,
-					   struct snd_sof_pcm *spcm, int dir)
+int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
+				    struct snd_sof_pcm *spcm, int dir)
 {
 	struct snd_soc_dai *dai;
 	int ret, j;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 4d25e781e5ae..3ec3f746663a 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -457,4 +457,6 @@ int get_token_uuid(void *elem, void *object, u32 offset);
 int sof_update_ipc_object(struct snd_soc_component *scomp, void *object, enum sof_tokens token_id,
 			  struct snd_sof_tuple *tuples, int num_tuples,
 			  size_t object_size, int token_instance_num);
+int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
+				    struct snd_sof_pcm *spcm, int dir);
 #endif
-- 
2.25.1

