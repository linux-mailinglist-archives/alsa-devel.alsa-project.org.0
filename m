Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C66591BBDBE
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 14:40:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63507169E;
	Tue, 28 Apr 2020 14:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63507169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588077652;
	bh=XL1QtG2NnBAQVBQJlNr9ZKRK6Qrpjvb7ghzUv9MmWFs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tQw0xxKLx+KAewwxm7zZb10d9uyFhLQhr387Us1MWii4TLg1L8Aocu5xZtwaIuMj+
	 huxigiApGiDcG22n8DbLhr92IBUq+MnJhlCBsHvROLgkYKcQhm7pqq9uSPREs6yZ4z
	 6r7zWe7dgVTDlpF2GwIYAz1IAcXEWT3yMedO+aVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6649AF800D2;
	Tue, 28 Apr 2020 14:39:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06A90F800B8; Tue, 28 Apr 2020 14:39:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BD90F800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 14:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BD90F800B8
IronPort-SDR: r9nL0nXEgYKdWU6dBFtXxGYThjf//7XoCQFBz61quN1SVuMlgCoMeFJT9ttdIIymJjmwiZFg8v
 7aW+ofdz6rZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 05:38:47 -0700
IronPort-SDR: 3A3oT3Ut5bK1qHKmZ1l2IvUG2WZR/xYuPhQlMst8N9GeLsZeleDl/Rom7Z9//CkCidRAwpoyql
 G+3urqc8KBow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; d="scan'208";a="282128681"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2020 05:38:46 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	nmahale@nvidia.com
Subject: [PATCH] ALSA: hda/hdmi: fix race in monitor detection during probe
Date: Tue, 28 Apr 2020 15:38:36 +0300
Message-Id: <20200428123836.24512-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

A race exists between build_pcms() and build_controls() phases of codec
setup. Build_pcms() sets up notifier for jack events. If a monitor event
is received before build_controls() is run, the initial jack state is
lost and never reported via mixer controls.

The problem can be hit at least with SOF as the controller driver. SOF
calls snd_hda_codec_build_controls() in its workqueue-based probe and
this can be delayed enough to hit the race condition.

Fix the issue by invalidating the per-pin ELD information when
build_controls() is called. The existing call to hdmi_present_sense()
will update the ELD contents. This ensures initial monitor state is
correctly reflected via mixer controls.

BugLink: https://github.com/thesofproject/linux/issues/1687
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 403baca89452..e8f0ae5af3d8 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2194,7 +2194,9 @@ static int generic_hdmi_build_controls(struct hda_codec *codec)
 
 	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
 		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
+		struct hdmi_eld *pin_eld = &per_pin->sink_eld;
 
+		pin_eld->eld_valid = false;
 		hdmi_present_sense(per_pin, 0);
 	}
 
-- 
2.26.0

