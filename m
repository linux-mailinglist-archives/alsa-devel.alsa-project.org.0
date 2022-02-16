Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 038D74B8A7E
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 14:42:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86255193E;
	Wed, 16 Feb 2022 14:42:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86255193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645018972;
	bh=+HjmFFyU9TBYVrekDbQdE0Jhys2x7gct4Jglzs9fCT4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DmK9Zl6ZTPdsX8b6BzO+s9HiQ6Q4bLcG2rb6ubLlpwfF76NgTtCggjdPnGM1/O4DQ
	 hbQ6qmuqDOV32rZ5bEyYmtD6mhNr94jXbYET1ZIYZhTRe+xwChMnHYn03XZkI9O/NP
	 qQSFkQtsGeDlhyLOQ5d1MJ+l5LDq2h0CiuVCXbMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A33F800D8;
	Wed, 16 Feb 2022 14:41:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D02F0F80128; Wed, 16 Feb 2022 14:41:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C61E5F80118
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 14:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C61E5F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="h7C2pulG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645018895; x=1676554895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+HjmFFyU9TBYVrekDbQdE0Jhys2x7gct4Jglzs9fCT4=;
 b=h7C2pulG/d6U3VavwG3NL1U0G3qd0RdEewybw6opqBaGqyth3XrEKCzh
 km+C5SiS3cLELOKanemg2WLVyRrsRegT8UBxB85/NOFJqBBTby0jMu1Xc
 xeu15o88ezjdEnxcD/p1bhc1G5ZHJX/aC0bB6m1a3WR04QxtT6wUSEP+q
 dBcOj+lb5v53lY5Jl5g+us4o6taH2yuujL5RTfC6ANkf+SH6V+WNWrmdC
 +f/SS4VkUKj2PEgHgHCxrqO0w9m/u0j2loUOBDs8vdHXbwm7I+mQOz2B7
 DqOVlL/B7Zp1sXdSSir3WZAX6axqjHf1R6BZoajiAQpfzxSNU0GYrEOz3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="337038364"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="337038364"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 05:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="704302843"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 16 Feb 2022 05:41:27 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2] ASoC: SOF: core: unregister clients and machine drivers in
 .shutdown
Date: Wed, 16 Feb 2022 15:32:41 +0200
Message-Id: <20220216133241.3990281-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, daniel.baluta@nxp.com
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

On a platform shutdown, the expectation for most drivers is that
userspace tasks will release all resources. When those sequences do
not complete, it can be the case that PCM devices exposed by ALSA
cards are used *after* the DSP shutdown completes, leading to a
platform hang.

When the clients and machine drivers provide an _unregister callback,
let's invoke it in the shutdown sequence.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

V1->V2:
  - correct patch title to have "ASoC: SOF: " prefix (reported
    by Amadeusz)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index d99ecbb4282d..2a35d8ddf43e 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -463,10 +463,19 @@ EXPORT_SYMBOL(snd_sof_device_remove);
 int snd_sof_device_shutdown(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_sof_pdata *pdata = sdev->pdata;
 
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
 		cancel_work_sync(&sdev->probe_work);
 
+	/*
+	 * make sure clients and machine driver(s) are unregistered to force
+	 * all userspace devices to be closed prior to the DSP shutdown sequence
+	 */
+	sof_unregister_clients(sdev);
+
+	snd_sof_machine_unregister(sdev, pdata);
+
 	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
 		return snd_sof_shutdown(sdev);
 

base-commit: f7d344a2bd5ec81fbd1ce76928fd059e57ec9bea
-- 
2.35.1

