Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B146694F7
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 12:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E04E0A734;
	Fri, 13 Jan 2023 12:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E04E0A734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673607851;
	bh=jvIEaZNc9a/JtwZzFe9mobDzOIz8+rNt4DjJLjhg6cQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jvVc3IcNUPZ5M3/I8QL9U71qEmBMk0AEo0YzBOPPyXSu05FcpQa4k0luPBwdlmP1H
	 n2wwFGmH+3qwcZZ3zwvtLnlUndYokr+yoLWEN5kOkhsKm30Lh8P7Q2LWxq4bwEyDR2
	 LTkvavXGUZ9CCrrBCMOjOkFP/Mz5TDRQPERWlqZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D45FF80548;
	Fri, 13 Jan 2023 12:02:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84C6BF804A9; Fri, 13 Jan 2023 12:02:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D06FFF804A9
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 12:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D06FFF804A9
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n/woBrEa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673607743; x=1705143743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jvIEaZNc9a/JtwZzFe9mobDzOIz8+rNt4DjJLjhg6cQ=;
 b=n/woBrEa09eLdeetCiRbZBiH4lQg9i1QiVcEAd7aLOYxJihcfiVpKtby
 20Gj1E32Dl13VTdd+sK3Xn3ZdtsWAW9aq8KzJ5pJCo3QsyJeFhkP5B9fY
 vPxWOlwjrOxqDk5/t9RGa3GHOA6JEFvVPjvRFkEZtEU+gCt+hwmIFP8oP
 1DDwmJB7h1uVD8BLUmbEAg1CYRMutPU4LIbad81k8lAu/OgoLQtmjBfb8
 L3LT6IhuU34AZML/6tRdqCkuOeENtIoBaMS/hwMD36qR8aNBQU3jxQwy5
 4Sd80mfhIbOg/4kuidkW6V4tEcAA/G8kbyk5bKd7eKw9xQsL81MNqk6XY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325228501"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="325228501"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 03:02:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="832039947"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="832039947"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2023 03:02:18 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: Intel: avs: Use min_t instead of min with cast
Date: Fri, 13 Jan 2023 20:03:10 +0100
Message-Id: <20230113190310.1451693-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
References: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Checkpatch script recommends using min_t instead of min with the cast.

Fixes: 69b23b3937a1 ("ASoC: Intel: avs: Event tracing")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/trace.c b/sound/soc/intel/avs/trace.c
index fcb7cfc823d6..c63eea909b5e 100644
--- a/sound/soc/intel/avs/trace.c
+++ b/sound/soc/intel/avs/trace.c
@@ -24,7 +24,7 @@ void trace_avs_msg_payload(const void *data, size_t size)
 	while (remaining > 0) {
 		u32 chunk;
 
-		chunk = min(remaining, (size_t)MAX_CHUNK_SIZE);
+		chunk = min_t(size_t, remaining, MAX_CHUNK_SIZE);
 		trace_avs_ipc_msg_payload(data, chunk, offset, size);
 
 		remaining -= chunk;
-- 
2.25.1

