Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C831F262
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:35:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 336501663;
	Thu, 18 Feb 2021 23:34:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 336501663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613687713;
	bh=vwBNrlzHMaJuoEUheDlD5yindgWjyN5jaJDmk/gXzwo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m6FHBcKLK6VRYOyMrsCemfeGB9nQE4eApndcMUMzTlmszUhLLIIpnXaAXpMN25pvw
	 svkLJSzufB7bYjkZ2m0TReeiq3M0CzVsEkdUsYvb+1evEoAha63EJ4f3kMpFRfgQZN
	 /usFNSQMi3hPHLjvCONIodL6RD2IKjqO0IPRotZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86C31F804E4;
	Thu, 18 Feb 2021 23:30:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22DE4F800D0; Thu, 18 Feb 2021 23:30:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C080F80229
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C080F80229
IronPort-SDR: fuv9TP+duesVPKgB8FcKMeEAtxli5C8McWzdCsNXT9vambHF1cmipTOsCc2/a9EqLfZiSduOpv
 12UPHH452oRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="182875641"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="182875641"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:40 -0800
IronPort-SDR: fys6WBFy949YwjDXlifXQim9E4e/UVf6/UhPTmQnLKwUjnHWieVLxQgp8R/s1q2E+6gw6+WD2o
 MBwUgZVYT+Ag==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364990840"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:39 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/10] ASoC: qcom: q6asm: align function prototypes
Date: Thu, 18 Feb 2021 16:29:12 -0600
Message-Id: <20210218222916.89809-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
References: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
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

cppcheck warnings:

sound/soc/qcom/qdsp6/q6asm.c:502:16: style:inconclusive: Function
'q6asm_map_memory_regions' argument 4 names different: declaration
'bufsz' definition 'period_sz'. [funcArgNamesDifferent]
        size_t period_sz, unsigned int periods)
               ^
sound/soc/qcom/qdsp6/q6asm.h:150:16: note: Function
'q6asm_map_memory_regions' argument 4 names different: declaration
'bufsz' definition 'period_sz'.
        size_t bufsz, unsigned int bufcnt);
               ^
sound/soc/qcom/qdsp6/q6asm.c:502:16: note: Function
'q6asm_map_memory_regions' argument 4 names different: declaration
'bufsz' definition 'period_sz'.
        size_t period_sz, unsigned int periods)
               ^
sound/soc/qcom/qdsp6/q6asm.c:502:40: style:inconclusive: Function
'q6asm_map_memory_regions' argument 5 names different: declaration
'bufcnt' definition 'periods'. [funcArgNamesDifferent]
        size_t period_sz, unsigned int periods)
                                       ^
sound/soc/qcom/qdsp6/q6asm.h:150:36: note: Function
'q6asm_map_memory_regions' argument 5 names different: declaration
'bufcnt' definition 'periods'.
        size_t bufsz, unsigned int bufcnt);
                                   ^
sound/soc/qcom/qdsp6/q6asm.c:502:40: note: Function
'q6asm_map_memory_regions' argument 5 names different: declaration
'bufcnt' definition 'periods'.
        size_t period_sz, unsigned int periods)
                                       ^
sound/soc/qcom/qdsp6/q6asm.c:823:47: style:inconclusive: Function
'q6asm_get_session_id' argument 1 names different: declaration 'ac'
definition 'c'. [funcArgNamesDifferent]
int q6asm_get_session_id(struct audio_client *c)
                                              ^
sound/soc/qcom/qdsp6/q6asm.h:146:47: note: Function
'q6asm_get_session_id' argument 1 names different: declaration 'ac'
definition 'c'.
int q6asm_get_session_id(struct audio_client *ac);
                                              ^
sound/soc/qcom/qdsp6/q6asm.c:823:47: note: Function
'q6asm_get_session_id' argument 1 names different: declaration 'ac'
definition 'c'.
int q6asm_get_session_id(struct audio_client *c)
                                              ^
sound/soc/qcom/qdsp6/q6asm.c:1573:52: style:inconclusive: Function
'q6asm_write_async' argument 6 names different: declaration 'flags'
definition 'wflags'. [funcArgNamesDifferent]
        uint32_t msw_ts, uint32_t lsw_ts, uint32_t wflags)
                                                   ^
sound/soc/qcom/qdsp6/q6asm.h:100:52: note: Function
'q6asm_write_async' argument 6 names different: declaration 'flags'
definition 'wflags'.
        uint32_t msw_ts, uint32_t lsw_ts, uint32_t flags);
                                                   ^
sound/soc/qcom/qdsp6/q6asm.c:1573:52: note: Function
'q6asm_write_async' argument 6 names different: declaration 'flags'
definition 'wflags'.
        uint32_t msw_ts, uint32_t lsw_ts, uint32_t wflags)
                                                   ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/qdsp6/q6asm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 82e584aa534f..394604c34943 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -97,7 +97,7 @@ struct audio_client *q6asm_audio_client_alloc(struct device *dev,
 					      int session_id, int perf_mode);
 void q6asm_audio_client_free(struct audio_client *ac);
 int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
-		      uint32_t msw_ts, uint32_t lsw_ts, uint32_t flags);
+		      uint32_t msw_ts, uint32_t lsw_ts, uint32_t wflags);
 int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
 		     uint32_t format, u32 codec_profile,
 		     uint16_t bits_per_sample, bool is_gapless);
@@ -143,10 +143,10 @@ int q6asm_stream_remove_trailing_silence(struct audio_client *ac,
 					 uint32_t trailing_samples);
 int q6asm_cmd(struct audio_client *ac, uint32_t stream_id,  int cmd);
 int q6asm_cmd_nowait(struct audio_client *ac, uint32_t stream_id,  int cmd);
-int q6asm_get_session_id(struct audio_client *ac);
+int q6asm_get_session_id(struct audio_client *c);
 int q6asm_map_memory_regions(unsigned int dir,
 			     struct audio_client *ac,
 			     phys_addr_t phys,
-			     size_t bufsz, unsigned int bufcnt);
+			     size_t period_sz, unsigned int periods);
 int q6asm_unmap_memory_regions(unsigned int dir, struct audio_client *ac);
 #endif /* __Q6_ASM_H__ */
-- 
2.25.1

