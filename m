Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D509640A88
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 17:23:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F3617AA;
	Fri,  2 Dec 2022 17:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F3617AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669998227;
	bh=fZTkjSbuEFRQdYNzv8Of6w8bk1dDhu4FFaNSWBt3Xo0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kLzqK2j0otTJIix9rp1pR0lA9kE08pMk7YC2FrUSJDXctHfER4k1SxB8bTNWtyarQ
	 VsM+5JQV4TnypqB7RPdO/K2qaUweVv1gmGag+Thw2sF6KuYePR4JxiTgf1nZuImK4U
	 YTJXuqpKFr9/E2geCUiJlNf/q/YPqOVnRTQs2EVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C7E7F804B3;
	Fri,  2 Dec 2022 17:22:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BD28F804B3; Fri,  2 Dec 2022 17:22:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7936FF800BD
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 17:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7936FF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eNIJUgOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669998166; x=1701534166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fZTkjSbuEFRQdYNzv8Of6w8bk1dDhu4FFaNSWBt3Xo0=;
 b=eNIJUgOUr0uXYaH1AXrOPwD5dlMYbF3a24mUnYkDSI9sVHXvpFXCwV+q
 qCIghxpseHkJ/KLoZbKTD0gA4Ot6sknQKTo9qwkkxwxaZzrsN5Rwuq2fw
 EK5SRKzlYOVX83fk01PMM0thPUqEKrlrBKz/rB6EOptvcHphYyD4Zppxb
 6mqLyceslw8z+6EadaQf/x+Y0JGmOdyjUG5ScyNY6l22tR132SD5bH1DR
 izzS3zGRuIe/bkoPgO+r8OKh70NOio3m4oAXJtkif+xij2ORtpytGeYyG
 cL+Q2JI9eVeK0wX2Y6sR4CN1fJVl4K+Z5flYtSzaeGiUxreDb7i5xjAPN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="314689453"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="314689453"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 08:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="733858947"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="733858947"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2022 08:22:40 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/5] ASoC: Intel: Skylake: Topology and shutdown fixes
Date: Fri,  2 Dec 2022 17:39:40 +0100
Message-Id: <20221202163945.674746-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
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

Even though skylake-driver is going to be replaced by the avs-driver,
the goal is to keep it functional on all the configurations it supports
until its EOL. When comparing chrome trees against upstream
skylake-driver, couple fixes pop up that are not part of upstream
repository. These fixes are backed up by real bugs (issue trackers),
address real problems. There is no reason for them to stay in the
internal tree.

Except for the last patch, all changes combined together address issue
when the driver updates the presumably static audio format descriptions
coming from the topology files through its "fixup" functions. As long as
given audio format is used by a single path, nothing collides and any
updates are harmless. However, when multiple paths e.g.: DMIC and HDMI1
utilize the same audio format descriptor, any updates caused by the
opening of the first path, may cause the second to fail.

The last change from the set fixes driver hang sporadically occurring
during shutdown procedure. Once HDAudio links are powered down along
with the AudioDSP, the hang stops reproducing.

Cezary Rojewski (5):
  ASoC: Intel: Skylake: Update pipe_config_idx before filling BE params
  ASoC: Intel: Skylake: Remove skl_tplg_is_multi_fmt()
  ASoC: Intel: Skylake: Drop pipe_config_idx
  ASoC: Intel: Skylake: Introduce single place for pipe-config selection
  ASoC: Intel: Skylake: Fix driver hang during shutdown

 sound/soc/intel/skylake/skl-topology.c | 73 +++++++++-----------------
 sound/soc/intel/skylake/skl-topology.h |  1 -
 sound/soc/intel/skylake/skl.c          |  5 +-
 3 files changed, 28 insertions(+), 51 deletions(-)

-- 
2.25.1

