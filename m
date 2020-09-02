Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDAF25AFCB
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 17:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4614C1878;
	Wed,  2 Sep 2020 17:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4614C1878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599061621;
	bh=NVUoYDXkzhrHQzC8YrZYEFQonoUmDGmHVoP+oKbd/b8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rWZg8BAOPHv/wIKAd/z72h92jzM554hNucVY7WJNDVQtYD8h7EYcjfbIrQ9UE+E3y
	 Vt9sT6KNeOKYkt/MQ4zwl0ISCvNgdUdsJODy5hEpjvzKOlQ2mMoalXM/gdD/vQmMmS
	 iuBIo2l27xk1Cz95Hd4BFbh09P+t49yvzcPWjOqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC22F802E8;
	Wed,  2 Sep 2020 17:44:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79162F802E3; Wed,  2 Sep 2020 17:44:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1E65F802DD
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 17:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E65F802DD
IronPort-SDR: O84w82xuMrHAFjf5f7YaeoRK9RvuJE1EOBdJCaZ3v8Lh1GWnPKj7tUP6knvfJ5Lo1neMI7bfDC
 kZLATgoj/7lQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="158406508"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="158406508"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 08:43:55 -0700
IronPort-SDR: lFqSYKbOVBqj0V7fzysjyqMmFUmy4+F6pekKf6/orInsBudPh9qs0fNNlxG1XDriW/hAS3hRtX
 njjgXGCqEkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="502178939"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2020 08:43:54 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda: add dev_dbg log when driver is not selected
Date: Wed,  2 Sep 2020 18:42:39 +0300
Message-Id: <20200902154239.1440537-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kai.vehmanen@linux.intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

On SKL+ Intel platforms, the driver selection is handled by the
snd_intel_dspcfg, and when the HDaudio legacy driver is not selected,
be it with the auto-selection or user preferences with a kernel
parameter, the probe aborts with no logs, only a -ENODEV return value.

Having no dmesg trace, even with dynamic debug enabled, makes support
more complicated than it needs to be, and even experienced users can
be fooled. A simple dev_dbg() trace solves this problem.

BugLink: https://github.com/thesofproject/linux/issues/2330
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 0f86e3765bb3..36a9dbc33aa0 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2127,9 +2127,10 @@ static int azx_probe(struct pci_dev *pci,
 	 */
 	if (dmic_detect) {
 		err = snd_intel_dsp_driver_probe(pci);
-		if (err != SND_INTEL_DSP_DRIVER_ANY &&
-		    err != SND_INTEL_DSP_DRIVER_LEGACY)
+		if (err != SND_INTEL_DSP_DRIVER_ANY && err != SND_INTEL_DSP_DRIVER_LEGACY) {
+			dev_dbg(&pci->dev, "HDAudio driver not selected, aborting probe\n");
 			return -ENODEV;
+		}
 	} else {
 		dev_warn(&pci->dev, "dmic_detect option is deprecated, pass snd-intel-dspcfg.dsp_driver=1 option instead\n");
 	}
-- 
2.27.0

