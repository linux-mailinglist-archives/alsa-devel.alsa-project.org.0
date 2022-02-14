Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1DF4B48F6
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 11:13:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C407A1722;
	Mon, 14 Feb 2022 11:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C407A1722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644833632;
	bh=PHUhU0QdUBnaog/gWuKwaLHF3KmUXsofTeySow2Y9zA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c7CgCa9IAZVfhKE8fr+CcKtikIU9FWHF25DQHqy6fzi3hLdXAvsvIo37focDYBEoN
	 J77jAlCtjdR7rKj8Zje9NySig6UDSVzNRDubhX4FVUiT1LrW7tGYTcXo78WQHUplp3
	 7UHF9H/VY8wvSMPx0KscPm6+X2Ch3gVMHJvf+sDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8609FF804CF;
	Mon, 14 Feb 2022 11:12:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AE5CF80169; Mon, 14 Feb 2022 11:12:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7111EF800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 11:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7111EF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H7gXFzRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644833563; x=1676369563;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PHUhU0QdUBnaog/gWuKwaLHF3KmUXsofTeySow2Y9zA=;
 b=H7gXFzRBCUSyGB46lC8aBWWJ+BbKBD/sSKSqZgQ5mLwHvek95lA0i3XS
 nloKixiT6ZyDFwYO/opTN5dIEDXqa25QBM+PbnZhC76YROfQjTPvRcINa
 v62hVEqJMHcbyp6ezc3dszhMmz6Vq3p6eWGWR0xdoH4iNcJyiJvZ6FvtT
 sA2a+DuSYnOb1E+jWIuV9FjTQNkdl4jcn8tfxvldtVSAXyMALmp1yvveq
 DqOAQac415d4Xl4dtSYJRHrwqhre+6sR208Y+eYA81dpVdPpqWeFxA91T
 1sxgqRzJy+qanCjdz0wy2VkdQrVETpa9mlOUstubfxpEL0/YgB8IS8QJp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="313338749"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="313338749"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="495382184"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 14 Feb 2022 02:12:32 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/4] ALSA: hda: Expose codec organization functions
Date: Mon, 14 Feb 2022 11:14:00 +0100
Message-Id: <20220214101404.4074026-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Changes expose several function that are currently unavailable for
HDA-DSP drivers for use. Those functions are:

snd_hda_codec_cleanup_for_unbind()
snd_hda_codec_set_power_save()
snd_hda_codec_register()
snd_hda_codec_unregister()
snd_hda_codec_device_init()

This allows upcoming AVS driver [1] to re-use even mode of HDA related
code that is currently available in sound/pci/hda and sound/hda and
prevent any code duplication within avs-driver that would otherwise had
to happen.

Last patch in the series provides snd_hdac_ext_bus_link_at() - a helper
function which allows for retrieval of HDA segment (link) based on codec
address directly. This is simpler than parsing codec-name first to
extract the address what is the case for snd_hdac_ext_bus_get_link().
The latter function is updated to re-use newly added one so core logic
is not duplicated after the addition.


Changes v1 -> v2:
- snd_hda_codec_new() now calls snd_hda_codec_device_new() with
  'snddev_managed' param set to 'true', reported by Kai


[1]: https://lore.kernel.org/all/20211208111301.1817725-1-cezary.rojewski@intel.com/


Cezary Rojewski (4):
  ALSA: hda: Add snd_hdac_ext_bus_link_at() helper
  ALSA: hda: Update and expose snd_hda_codec_device_init()
  ALSA: hda: Update and expose codec register procedures
  ALSA: hda: Expose codec cleanup and power-save functions

 include/sound/hda_codec.h           | 11 +++-
 include/sound/hdaudio_ext.h         |  1 +
 sound/hda/ext/hdac_ext_controller.c | 31 +++++++---
 sound/pci/hda/hda_codec.c           | 94 ++++++++++++++++++++---------
 sound/pci/hda/hda_local.h           |  2 -
 sound/soc/codecs/hdac_hda.c         |  2 +-
 6 files changed, 100 insertions(+), 41 deletions(-)

-- 
2.25.1

