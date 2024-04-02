Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B74CE8957A7
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A24802C08;
	Tue,  2 Apr 2024 17:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A24802C08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712070124;
	bh=7SUUzrMM9vVUTGjyOMCz5njlZv6H/FWKf1uf9PfnM48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jn0uFS0SDGFUIVZY7rD8hpmuaUdKOPx7CkhTkPERkKVBP7j4pjGXTmCpmjTYSZ7jc
	 X11KMEeXJTZyAGWm4ZOH6ZHx7zlvw6xT+YkpKWmwhk82W9yv0PblDTh6WgEN7T9nSj
	 6ydoHCSB/y4jWMObF/5WjUHv/tC0b00V2svOaxxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C120F805B4; Tue,  2 Apr 2024 17:01:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 115F3F805A1;
	Tue,  2 Apr 2024 17:01:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC855F80238; Tue,  2 Apr 2024 17:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B727F80236
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B727F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EiPVIszm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712070022; x=1743606022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7SUUzrMM9vVUTGjyOMCz5njlZv6H/FWKf1uf9PfnM48=;
  b=EiPVIszmRhY8vQG77BkfMjocdt6s30AcfnBGaMhsffxPy7GLvrjcVO66
   3VB06aMagY9mwtooBiQecHcEk4T2ZiaiCrt3aaIxSCZJhxXuDi31HkP5Y
   PqhtAqRiCphdY4XemhruczxcC+eUvQ4M/NK88nn8oZKmG6FWNRgk8w0uG
   f+4C0lmQIeNpFMb8Ddm7u/cPRuHalEX9uhc7BMzmnYw67ZVP8ti0sZ+MG
   uZhnTHgca26qMPpvJpVRAXg9QnZUv+8AE5MiZ1Bo3nTPoHX1Q/ky6pF/c
   lvvZPEm6Q1kRKgXxi8rvrxLvJiLYUs+4fPC8VxnMPmOE1kuRBZzxCe0lN
   A==;
X-CSE-ConnectionGUID: d3TpK5muSYSFL0L+YWcUDQ==
X-CSE-MsgGUID: e4x/tH4vTRaYVL267khYWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7433831"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="7433831"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:00:13 -0700
X-CSE-ConnectionGUID: 6QlY+RSbSYimAso6nlNcmQ==
X-CSE-MsgGUID: KsKYp1ZhRAqBurZSVlwiDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22558029"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:00:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/4] ASoC: SOF: ipc4-priv: align prototype and function
 declaration
Date: Tue,  2 Apr 2024 09:59:58 -0500
Message-Id: <20240402145959.172619-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
References: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YDG7E2OZ33Q37WF7JLFF2UWZYWXOMNTC
X-Message-ID-Hash: YDG7E2OZ33Q37WF7JLFF2UWZYWXOMNTC
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDG7E2OZ33Q37WF7JLFF2UWZYWXOMNTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Somehow instance_id and id were mixed. Align on instance_id for
consistency.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index afed618a15f0..e157ab80a103 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -98,7 +98,7 @@ extern const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops;
 extern const struct sof_ipc_pcm_ops ipc4_pcm_ops;
 extern const struct sof_ipc_fw_tracing_ops ipc4_mtrace_ops;
 
-int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state);
+int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 instance_id, u32 state);
 int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core);
 
 int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev);
-- 
2.40.1

