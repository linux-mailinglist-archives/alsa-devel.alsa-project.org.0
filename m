Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC15448C09B
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 10:02:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA4D1A4C;
	Wed, 12 Jan 2022 10:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA4D1A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641978150;
	bh=+LNZHxxl5hhVgyY0XAKkh0uPwdUOs8jU5euZhrYD8Z0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BMP3MOuT7QT/UOC/lMMQqJ3XG7uhUi+oYZcd1JgbYzEN0OvuGYYicxtHk8leYq14l
	 2Dc+8t8ZFk6VkAq8PP5qRLUhCS7V5R0ynAnSFQuZ4Xq8YoIrER9L8MlPT1IRqiq9aM
	 zLHVX6CLsB5wajl/JEr+Mdya+Y+MtJvJEG2isNkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA202F80507;
	Wed, 12 Jan 2022 10:00:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97267F80054; Wed, 12 Jan 2022 10:00:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4764F8026A
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 10:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4764F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ReGeui0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641978042; x=1673514042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+LNZHxxl5hhVgyY0XAKkh0uPwdUOs8jU5euZhrYD8Z0=;
 b=ReGeui0RP6H1ECTbNrtHfIb2XZyoGxQhZ1Hbfo7TGV0M8W2El39YcS4x
 2t841NSDNsGLOuWs1xOmwjSTMwW5qyOB6D5GBSKx0F6o/M7faonyJRJrU
 +uKWJp4sgFJHGF9W4Wonjf7IohZ/XO8ZF1VA5pkCOap00cILwhi3umnIw
 egK3CsZITLtBY5WSE+Ef3kJDusP17aFXXNFUQEwrvA6YrN6OOTRuAY/sZ
 rCER+/yzhQivyMApKKzDeEqBrbnlTAoD8N61Z+0UNSZXfyCikyMgnkfz+
 GuVGhbXkegKv/Cs2mSAfD7IyRV50Nx+6/o8oM9JNxTuzz7kZ+ZyJ4ipRv A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="223674382"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="223674382"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 01:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="691318378"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga005.jf.intel.com with ESMTP; 12 Jan 2022 01:00:39 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 2/3] ASoC: topology: Allow TLV control to be either read or
 write
Date: Wed, 12 Jan 2022 18:00:29 +0100
Message-Id: <20220112170030.569712-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112170030.569712-1-amadeuszx.slawinski@linux.intel.com>
References: <20220112170030.569712-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

There is no reason to force readwrite access on TLV controls. It can be
either read, write or both. This is further evidenced in code where it
performs following checks:
                if ((k->access & SNDRV_CTL_ELEM_ACCESS_TLV_READ) && !sbe->get)
                        return -EINVAL;
                if ((k->access & SNDRV_CTL_ELEM_ACCESS_TLV_WRITE) && !sbe->put)
                        return -EINVAL;

Fixes: 1a3232d2f61d ("ASoC: topology: Add support for TLV bytes controls")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index e0f72ddd72c1..9d24184f85f9 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -512,7 +512,8 @@ static int soc_tplg_kcontrol_bind_io(struct snd_soc_tplg_ctl_hdr *hdr,
 
 	if (le32_to_cpu(hdr->ops.info) == SND_SOC_TPLG_CTL_BYTES
 		&& k->iface & SNDRV_CTL_ELEM_IFACE_MIXER
-		&& k->access & SNDRV_CTL_ELEM_ACCESS_TLV_READWRITE
+		&& (k->access & SNDRV_CTL_ELEM_ACCESS_TLV_READ
+		    || k->access & SNDRV_CTL_ELEM_ACCESS_TLV_WRITE)
 		&& k->access & SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK) {
 		struct soc_bytes_ext *sbe;
 		struct snd_soc_tplg_bytes_control *be;
-- 
2.25.1

