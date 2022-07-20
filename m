Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A45F57B6E3
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 14:58:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D45DC168C;
	Wed, 20 Jul 2022 14:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D45DC168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658321889;
	bh=wdrNDjjTleU+YsTn831JnQVcBmPhMch9eEabtUrbKXg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NWMK7G67SFrb7VtV92B8ljviZylc4mdP/+tdiE9loq/+O/z7iuELcuN2td8rlsqJa
	 IOOduZMEcpT1geZfgJUGFd/w4kFY0tlnm+Q9vKPLWRSxz9CL0fRBWIIZRf5co2WbKQ
	 g8kcWDgr16auBYY+lKgfmqHRZqDfd/T/5gTRuVkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 463E3F8027D;
	Wed, 20 Jul 2022 14:57:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10154F8025D; Wed, 20 Jul 2022 14:57:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C70BEF80118
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 14:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C70BEF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QB0qUiUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658321825; x=1689857825;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wdrNDjjTleU+YsTn831JnQVcBmPhMch9eEabtUrbKXg=;
 b=QB0qUiUxOGhqHLYMDdyzVHQ74TmPijjkQo+RT53TaDr4RtHrnE2MCTyy
 m09dExwt1CJQevOnsx9BaAHVa09ykZi82fKyVNjDaxWK1sXXXV8UKVxTU
 G/c2MhDH3RKQhgngZEhrhjJU02UoA0XGeZybWyxaWeCdJraJndu/Yi/ec
 wTxJQUF06f8J6XzR7v1u3ABz+Ah2C+D2GPqtdwMIiinuggPWj1PIBXO/x
 0TV77kNz7c7fMD8Z8SK3S3u/SgB0OzHQa0wiuH0R1BEQHyNxu85wlap9/
 dZOoCHG1BCzGUNt7mo3ihMjk4DULD4XN9gflwUNXx0f+EAilayrG232VE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="269797804"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="269797804"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 05:56:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="656259001"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2022 05:56:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH 0/4] ALSA: hda: Unify codec construction
Date: Wed, 20 Jul 2022 15:06:18 +0200
Message-Id: <20220720130622.146973-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 peter.ujfalusi@linux.intel.com
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

A follow up to the recent HDAudio fixes series [1]. Given the recently
reported regression [2], before the page fault occurring on codec
shutdown can be fixed, codec construction procedure needs to be updated
for skylake and sof-intel drivers. Drivers: pci-hda and avs need no
changes - already making use of snd_hda_codec_device_init().


[1]: https://lore.kernel.org/alsa-devel/20220706120230.427296-7-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/alsa-devel/3c40df55-3aee-1e08-493b-7b30cd84dc00@linux.intel.com/

Cezary Rojewski (4):
  ASoC: hdac_hda: Disconnect struct hdac_hda_priv and hda_codec
  ALSA: hda: Make snd_hda_codec_device_init() the only codec constructor
  ALSA: hda: Always free codec on the device release
  ALSA: hda: Fix page fault in snd_hda_codec_shutdown()

 include/sound/hda_codec.h                    |  2 -
 include/sound/hdaudio_ext.h                  |  4 +-
 sound/hda/ext/hdac_ext_bus.c                 | 34 ++++++--------
 sound/pci/hda/hda_codec.c                    | 49 +++++++++-----------
 sound/soc/codecs/hdac_hda.c                  | 26 ++++-------
 sound/soc/codecs/hdac_hda.h                  |  2 +-
 sound/soc/intel/boards/hda_dsp_common.c      |  2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  2 +-
 sound/soc/intel/skylake/skl.c                | 24 ++++------
 sound/soc/sof/intel/hda-codec.c              | 29 +++++-------
 10 files changed, 73 insertions(+), 101 deletions(-)

-- 
2.25.1

