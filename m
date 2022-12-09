Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C906481EF
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 12:46:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D1D21F7;
	Fri,  9 Dec 2022 12:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D1D21F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670586416;
	bh=ph8ekkn6HK27InwTtKrS1ulnjoq0+tI23h1qGSCq7VU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GO9thHBt/YsJV1endUgrhHi0/2iswUe/uSwp22nME+WNKSlr9vTXEChImIFwSAPn3
	 HqNZosQWj1kp8zr9afjiqSRsbABM2Ow8o9OIye8McSrbaJZel93RjpGzpUZs0l1hf4
	 E9ambsftj0+UY9i2nvYbSNDUzTlBWbYa1z2tAuXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8C3BF8024D;
	Fri,  9 Dec 2022 12:45:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A43DCF8022D; Fri,  9 Dec 2022 12:45:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E394F8016E
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 12:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E394F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aCzL7fmE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670586356; x=1702122356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ph8ekkn6HK27InwTtKrS1ulnjoq0+tI23h1qGSCq7VU=;
 b=aCzL7fmEuuCb4BjOxxz/7pA3kb7ui0MhyKuOFn/YISeiFfPRDk5C+A2w
 v9YTBhU575qqR9yOP4VznWZcQ5HL0pqlguD7XAL+ed9l8xQatI1f4Ezqb
 l+U8pvgnWLw0VXMXIJkA4mSX1ksne0gOvcTaVAe/MDui11TUFjJmtOBOM
 lYU1QT5iy4l+8gbZJ1KFjoQCklTaZKi+hIdVv3/6J80v6EtmnoUJ5lQxP
 pwyUg7PBxXOw7l/HwWYVQCZbIUAA7Gp1HQFR6lR0n7BQITnxr8lSwz4rR
 cihH3JyroV+HlS6l8Xibx55Tt6iyZNOcwovM00jNSTxhfvDqDFcEoVKD5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="297122678"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="297122678"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 03:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="754000433"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="754000433"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2022 03:45:49 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
Date: Fri,  9 Dec 2022 13:45:27 +0200
Message-Id: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, tiwai@suse.de,
 daniel.baluta@nxp.com, Oliver Neukum <oneukum@suse.com>,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Zhen Ni <nizhen@uniontech.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patchset is an alternative solution to problems
reported by Ricardo Ribalda <ribalda@chromium.org> and
Zhen Ni <nizhen@uniontech.com>, as discussed in

- "[PATCH] ALSA: core: Fix deadlock when shutdown a frozen userspace"
 https://mailman.alsa-project.org/pipermail/alsa-devel/2022-November/209248.html

- "[PATCH] ASoc: SOF: Fix sof-audio-pci-intel-tgl shutdown timeout during hibernation"
  https://mailman.alsa-project.org/pipermail/alsa-devel/2022-December/209685.html

It was raised by Oliver Neukum <oneukum@suse.com> that kernel should
not let user-space stall the shutdown process in any scenario and the
unregister call in current SOF shutdown code is not right.

This series reverts the ASoC SOF patch to unregister clients and
the machine drivers at shutdown. To avoid bringing back old bugs,
the series includes a patch to fix S5 entry on certain Intel
platforms.

Kai Vehmanen (2):
  ASoC: SOF: Intel: pci-tgl: unblock S5 entry if DMA stop has failed"
  ASoC: SOF: Revert: "core: unregister clients and machine drivers in
    .shutdown"

 sound/soc/sof/core.c          |  9 -----
 sound/soc/sof/intel/hda-dsp.c | 72 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/intel/tgl.c     |  2 +-
 4 files changed, 74 insertions(+), 10 deletions(-)


base-commit: e85b1f5a9769ac30f4d2f6fb1cdcd9570c38e0c1
-- 
2.38.1
