Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ABB613AB9
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 16:52:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D5AA1691;
	Mon, 31 Oct 2022 16:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D5AA1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667231551;
	bh=tT9hePL8GvHil/QRyJUeqhX3qTF0HyqiJPv0VHYrHvk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CoW0UK/76e+zod7j4oP8i10iGkR96WaY8yAmH2c5ySnCMI8yMwGYaQl9C6nf3Tr8Z
	 M17lL6w5AxeftgDH5zkyG6dzAA41+cgXKFYdC2Yek0B8BXCJNgRG/I/6bZ+F+kIk3m
	 XWsvPfd+DaXPQ8lBAUtiDX82PK31ZSRQIQm4lv7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86832F8057E;
	Mon, 31 Oct 2022 16:50:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 192A5F80549; Mon, 31 Oct 2022 16:50:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BD3FF80549
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 16:49:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD3FF80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HCuYRLe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667231396; x=1698767396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tT9hePL8GvHil/QRyJUeqhX3qTF0HyqiJPv0VHYrHvk=;
 b=HCuYRLe0x7UtzUCKiG23k1/5TiFdHt+NSy0efpXPWLbalH1PgvuRwDvX
 c6aHOlxph/cjJna0SFdbzMAZC9OC7tAdUXJSEDLLzjfPd9TP4ytxJxPHG
 A3zvVNqnOCYyY2hnBvVKLllZ7QFN4YC5O0lfgFzItb27GJylW8QzJ10uw
 CpiUeKmrFxeykdkPxDlWeeRQklob1L/8aUWOAggn9eeQBbqAqWdIa4W9D
 xfQez3bkveKbuMbemnw6U/xAWMf0X+QySYx4m8HCMCJpuTIbpIAzQwZy2
 +2jWArud3AcPZLJxy84OP2li+CNxa/hj/Jne2pvbe/jSStGryKYY75PDj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="308929968"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="308929968"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 08:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="776178940"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="776178940"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2022 08:49:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 6/7] ASoC: Intel: avs: Drop da7219_aad_jack_det() usage
Date: Mon, 31 Oct 2022 17:02:26 +0100
Message-Id: <20221031160227.2352630-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031160227.2352630-1-cezary.rojewski@intel.com>
References: <20221031160227.2352630-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Vijendar.Mukunda@amd.com,
 heiko@sntech.de, AjitKumar.Pandey@amd.com, linux-rockchip@lists.infradead.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, jiaxin.yu@mediatek.com,
 lgirdwood@gmail.com, hdegoede@redhat.com, Syed.SabaKareem@amd.com,
 amadeuszx.slawinski@linux.intel.com, trevor.wu@mediatek.com
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

Do not access the internal function directly, do so through
component->set_jack() instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/da7219.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 503a967a1c3a..ad86cef101cc 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -16,7 +16,6 @@
 #include <sound/soc-dapm.h>
 #include <uapi/linux/input-event-codes.h>
 #include "../../../codecs/da7219.h"
-#include "../../../codecs/da7219-aad.h"
 
 #define DA7219_DAI_NAME		"da7219-hifi"
 
@@ -110,7 +109,7 @@ static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
 
-	da7219_aad_jack_det(component, jack);
+	snd_soc_component_set_jack(component, jack, NULL);
 
 	return 0;
 }
-- 
2.25.1

