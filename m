Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68F456875B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C93F16C5;
	Wed,  6 Jul 2022 13:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C93F16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657108455;
	bh=dieqkM5s8040Xr/uwJHnUztLAPbicPv2r2/NubJgwf0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QEA7+h10lQUPBqUuYdpbgWLFR3t7Vwo6I2y8qZJAEI0KDVtpYqBNYubkg4n1QPomi
	 CWapRmUP+zQmZoDPhtsJW1xGYEBQG/ueaj7bw42n6Aa2ksL9z05e8WV3HlRsepQO5y
	 0k/PWTjli1DF2SyE2fkGTs45awNxRXqbKNmAt9BQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0982EF8052E;
	Wed,  6 Jul 2022 13:52:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF067F8052E; Wed,  6 Jul 2022 13:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21A92F80104
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21A92F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZfAyEvot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657108359; x=1688644359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dieqkM5s8040Xr/uwJHnUztLAPbicPv2r2/NubJgwf0=;
 b=ZfAyEvots6red1CCXoC/2qEnU+DuVb0FzvlEzoaIhkE8ujx3apStqe+T
 F075uH6KrH6SnwOorZrxvMyFa8C3KUzyLTF6WXyzq4x43WoPrDMFDYBXo
 xbMbT05GiYoO5+j9PrX8tUSPgwarLX+YvzG35ANuoX9UA8LC6f2pjPLUY
 q++o+tMUXe7cmyPBuFLXYR0TtAnYbcmPcviBVhN92FPxMZ8ok4gfWTJTX
 6imoP3OcDppOfSclRsQz0/Bj989Ygo6+73UY2ZXMhJs0pqCUhUgNDSl7/
 EROpHI5kF1VygaHxp0KNh0l7tWdxzO8QECWh7AN4tsqx20zTEIvUrzfhO A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="370042591"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="370042591"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 04:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920136246"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2022 04:52:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH 0/9] ALSA: hda: Codec-reload bug fixes and cleanups
Date: Wed,  6 Jul 2022 14:02:21 +0200
Message-Id: <20220706120230.427296-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

Total of 6 fixes and 3 cleanups - cleanups are last.

All of the fixes address problems that present themselves in situation
when user engages in codec driver reload. Second condition to reproduce
is two-step initialization of HDAudio codec - this is the case only for
ASoC HDAudio bus driver as snd_hda_intel calls only compound function
snd_hda_codec_new(). Once these conditions are met, several
reload/unload scenarios end with null-ptr-deref and page faults. Goal of
the series is to allow codec/bus driver reloading without any errors.

Amadeusz Sławiński (2):
  ALSA: hda: Reset all SIE bits in INTCTL
  ALSA: hda: Remove unused macro definition

Cezary Rojewski (7):
  ALSA: hda: Do not unset preset when cleaning up codec
  ALSA: hda: Fix null-ptr-deref when i915 fails and hdmi is denylisted
  ALSA: hda: Make device usage_count consistent across subsequent
    probing
  ALSA: hda: Fix put_device() inconsistency in error path
  ALSA: hda: Skip event processing for unregistered codecs
  ALSA: hda: Fix page fault in snd_hda_codec_shutdown()
  ALSA: hda/realtek: Remove redundant init_hook() in alc_default_init()

 include/sound/hda_codec.h           |  1 -
 include/sound/hdaudio.h             |  1 +
 sound/hda/ext/hdac_ext_controller.c |  7 ---
 sound/hda/hdac_bus.c                |  2 +-
 sound/hda/hdac_controller.c         |  7 +--
 sound/pci/hda/hda_bind.c            |  7 +++
 sound/pci/hda/hda_codec.c           | 83 +++++++++++++++--------------
 sound/pci/hda/patch_realtek.c       |  3 --
 sound/soc/codecs/hda.c              |  4 +-
 9 files changed, 56 insertions(+), 59 deletions(-)

-- 
2.25.1

