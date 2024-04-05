Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD93899916
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:12:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D0162D2C;
	Fri,  5 Apr 2024 11:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D0162D2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308367;
	bh=A+RaWNl0uAuzryi863scci2ttj6MV/67NVWw5IM4vVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t1FhphuHmHduWGEV7JedUaFzxrRFVQU1H9DIg7vlp5zxV7Cw4vM6NVBVfDDhC/eQo
	 gIiXeIG6Hb7H0ucs9ulyd1u7mwGpZAO6yu2hqtZYEurnLzm0eh40JxwlZz8m5TIHS9
	 qwv0rnCjO79WSY+J9uOK66G/pgeVjezhJsRk8AWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A4B1F806A5; Fri,  5 Apr 2024 11:10:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D804F806AC;
	Fri,  5 Apr 2024 11:10:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DDB2F8055C; Fri,  5 Apr 2024 11:08:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37FC1F80571
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37FC1F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WK41LcnA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308108; x=1743844108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A+RaWNl0uAuzryi863scci2ttj6MV/67NVWw5IM4vVw=;
  b=WK41LcnAd6SxQZRiIgM0wW5+OujFm6xRC6tnDQ7uQDB80xpVvsCvVW1P
   C0kjcHUhbHDm50uqRgJ1z55Zu5gtvJWGNxrcyVN8oQqLO2LE2uCiy/NV4
   S1IRmeo61H4Z7D+M76zCv+WE3AMI+P3iuuhOY6WLdaAQ8rnZIV7xGAN+D
   1VRLgKhvjoBrf43woJJ7ZE8fnvjrzD8WM+QGmz/iiSIiZfOD77rrZKsD8
   I7BMhvy0oRsq/M8QpCTjAKcQX8vzM1nEjfNz3bkxv1tkTghEek7Uo/TXB
   ULcQdZgEI6U4VOWHaAhsQ2RHfyYDDoEm4EcQbPQRuJWASkUDqoFc61PVu
   w==;
X-CSE-ConnectionGUID: mUnfVN8rSMaReWeqvgIb4w==
X-CSE-MsgGUID: 6gHmHK5XTYufjjddVALWyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787475"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787475"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:26 -0700
X-CSE-ConnectionGUID: zvIWjhjbTNSy0k0A6X8rQA==
X-CSE-MsgGUID: wqVJDZEbTjmmSOhCNILeLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042447"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:24 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 10/13] ASoC: Intel: avs: Wake from D0ix when starting
 streaming
Date: Fri,  5 Apr 2024 11:09:26 +0200
Message-Id: <20240405090929.1184068-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OXVXXXAJOETASSWQRFFS3OFNW5SLESWW
X-Message-ID-Hash: OXVXXXAJOETASSWQRFFS3OFNW5SLESWW
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXVXXXAJOETASSWQRFFS3OFNW5SLESWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is recommended to keep the DSP domain in full-power when starting DMA
engines.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/icl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index 3e0716160f5a..d279ec1e0ad0 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -109,6 +109,10 @@ int avs_icl_log_buffer_offset(struct avs_dev *adev, u32 core)
 
 bool avs_icl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
 {
+	/* Full-power when starting DMA engines. */
+	if (tx->glb.set_ppl_state.state == AVS_PPL_STATE_RUNNING)
+		return true;
+
 	/* Payload-less IPCs do not take part in d0ix toggling. */
 	return tx->size;
 }
-- 
2.25.1

