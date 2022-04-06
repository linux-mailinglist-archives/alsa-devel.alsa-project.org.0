Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E11184F6A29
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:42:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83DE51709;
	Wed,  6 Apr 2022 21:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83DE51709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649274127;
	bh=xSLxzBIO+EYlgpnH6wtZBL/C/urRGfBDMdm7W2329HE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EaNgrzpT/rJ8H0ka35adQTWRNkuHkZxZ3njntwTbdDEfcs17bpcky2k7Jgcu9VB9x
	 jlS+RlrWX9ntQ+2xBPbcER1z1hMF8HR9ZJEibVRG9ipbs0c8CIbOu7lDHDJfA6YQIB
	 woJZIaIhFYk00J1LYlzzzxViu7HpnWzqxhUk56lU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07FD9F80475;
	Wed,  6 Apr 2022 21:41:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C53DF802DF; Wed,  6 Apr 2022 21:41:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BBD0F80054
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BBD0F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H0BZg+El"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649274066; x=1680810066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xSLxzBIO+EYlgpnH6wtZBL/C/urRGfBDMdm7W2329HE=;
 b=H0BZg+El16VItLfqZc9FhMdxtHPBCCSLMWnG6TkYT7wUfJ9eka2thZHL
 d+QCnEEKIFjCXy/mToOd+njm7bG53b6R9v9WBVRd00VHTCNMcalKCNU4e
 wC+GVtLdYZiiS56eOloB51fYoTUDtxiy3ke3enH9yj8GBg6BKrBA5PbwP
 xJJUF9+hwioCrXecTG8OO8SjnYokmDhFMQTL11+YyaOKAKLwqlE+m7tZZ
 Tq0dcHBPQVK45ipItMclroyRIXO4jF66QwWn2ky6EE9HwZghTutf7D3c7
 XTEkwqFdWyDDZlA5ySgwHqf7O/7Ca+SXE3NZL/ssRNK4vRmDINdYtM+d6 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347582609"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="347582609"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:40:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570713299"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:40:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: SOF: AMD/Mediatek updates
Date: Wed,  6 Apr 2022 14:40:44 -0500
Message-Id: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Hardware/IPC updates for AMD and shutdown support for Mediatek.

Ajit Kumar Pandey (2):
  ASoC: SOF: amd: Add psp_mbox_ready() and psp_send_cmd() callback
  ASoC: SOF: amd: Use dedicated MBOX for ACP and PSP communication

YC Hung (2):
  ASoC: SOF: OF: Add shutdown callback for SOF OF device
  ASoC: SOF: mediatek: mt8195 add shutdown callback

 sound/soc/sof/amd/acp.c                | 66 +++++++++++++++++++++++---
 sound/soc/sof/amd/acp.h                |  6 ++-
 sound/soc/sof/mediatek/mt8195/mt8195.c |  7 +++
 sound/soc/sof/sof-of-dev.c             |  6 +++
 sound/soc/sof/sof-of-dev.h             |  1 +
 5 files changed, 77 insertions(+), 9 deletions(-)

-- 
2.30.2

