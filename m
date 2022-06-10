Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9085466C8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:46:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7376F1F77;
	Fri, 10 Jun 2022 14:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7376F1F77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654865188;
	bh=okJo3Ekg93CoCM8n/hdpy8i06qkXjbI9BeToazTKuqQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mVsTjQISKqjXEXR8Lq8d0uOKXaJGAum13HZ3laZDX1IycCU5Zc+jKagYkXKQWQkJp
	 8pZR3uQtyRq/ZIELQhkrNH5uJTLkhSr5LVAOFrWPZX0CG/B0unBNYJcInX/gITqAIr
	 LraBVZd8gj8vB4vbS7knUOWKw24IyG+7BNKvuitM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 341B8F804D8;
	Fri, 10 Jun 2022 14:45:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2639F804D2; Fri, 10 Jun 2022 14:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF45AF800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF45AF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="P1BnqOV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654865125; x=1686401125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=okJo3Ekg93CoCM8n/hdpy8i06qkXjbI9BeToazTKuqQ=;
 b=P1BnqOV2LMEI9Ta48SeeTB90LWBVqvu+5rwHhwXt0nP1ORq8i/hbdqKI
 Zb1wzNKIAXnvaT6F/QP34GzsVoy0segIy5V5O+Nr9fMN8X7g+ybPxK2G3
 RzT+rPgzKFxcjDDtP4nG0d6WnK7Uzs6gYateUhbdS9PTE9E4iobSRK33Z
 57V3QQVX1Z4PD3opZHyqpDfkbYKmoiXwLzFNu0BeSVqhG5/8RKACkBOzZ
 T7QOyCgjsDgZBclo3IdEVVBBYcFcXtFZi/z+JDsRERPdeTYGpGo3/er37
 qlhj0j/v94CclF4DneM/S9ops0D6+N2IWqtxR81F/FJ9xVcJnPEeeuP34 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="260736420"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="260736420"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="610710574"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 10 Jun 2022 05:44:01 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Remove unused hw_write_t type
Date: Fri, 10 Jun 2022 14:44:20 +0200
Message-Id: <20220610124420.4160986-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Commit 81da8a0b7975 ("ASoC: remove codec hw_write/control_data") removed
use of hw_write_t in struct snd_soc_codec, but it left type definition.
Fully clean it up.

Fixes: 81da8a0b7975 ("ASoC: remove codec hw_write/control_data")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f20f5f890794..b276dcb5d4e8 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -408,8 +408,6 @@ struct snd_soc_jack_pin;
 
 struct snd_soc_jack_gpio;
 
-typedef int (*hw_write_t)(void *,const char* ,int);
-
 enum snd_soc_pcm_subclass {
 	SND_SOC_PCM_CLASS_PCM	= 0,
 	SND_SOC_PCM_CLASS_BE	= 1,
-- 
2.25.1

