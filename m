Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72D2B11FE
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:45:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035271892;
	Thu, 12 Nov 2020 23:44:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035271892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605221141;
	bh=NeI+bkVx9W7r1ywesXisMcGm0AXaU3oBeihwRQv3UDk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iD/rnFefa0NJ1xbc/gE/UQn/PZxvaqOJ1aT3xgZFCh9zDp3y5aWwhnqU49G+fa/+k
	 UrRWv22kwayBRDOMUKn1Kyu4WHG0iRhTB6XejDomyGuVy/Y2LvN/pOfLBpniIseeI8
	 CRzkqL8vljsXIM4F9Rn/NULnFHvJNGpOBcnsTH0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22782F80534;
	Thu, 12 Nov 2020 23:39:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF8E4F804FA; Thu, 12 Nov 2020 23:39:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5EB3F80059
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5EB3F80059
IronPort-SDR: aYqMguyxn+JPMhF8fCRXQ7nS0Cp8luhSuXAyOKY1DB4/lJDB0K2YlDGNTU2Xc0z+WrW3X8apaH
 mw+gP4nP0SYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166885025"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="166885025"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:39:02 -0800
IronPort-SDR: xSFMI8Tszq1Si5NygmMRi4Jlm8IWiVdri6yWpXETs3WDWDM0ZJ1cX2Wey/re1yEsmLbfmUKRFD
 QJYVhlAIsMIA==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="323797506"
Received: from gjshield-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.180.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:39:01 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/14] ALSA: hda: intel-dsp-config: ignore dsp_driver
 parameter for PCI legacy devices
Date: Thu, 12 Nov 2020 16:38:25 -0600
Message-Id: <20201112223825.39765-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Rander Wang <rander.wang@linux.intel.com>
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

On Haswell/Broadwell/Baytrail/Braswell, the DSP is not used for the
HDMI/DP interface, and setting the dsp_driver parameter to a value > 1
has the side effect of preventing the HDaudio legacy driver from
probing.

The DSP driver selection should really only handle cases where a DSP
is actually used. This patch traps all known PCI devices and makes
sure the HDaudio driver can always be probed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 0dc079ba02ff..6a0d070c60c9 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -379,6 +379,20 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	if (pci->vendor != 0x8086)
 		return SND_INTEL_DSP_DRIVER_ANY;
 
+	/*
+	 * Legacy devices don't have a PCI-based DSP and use HDaudio
+	 * for HDMI/DP support, ignore kernel parameter
+	 */
+	switch (pci->device) {
+	case 0x160c: /* Broadwell */
+	case 0x0a0c: /* Haswell */
+	case 0x0c0c:
+	case 0x0d0c:
+	case 0x0f04: /* Baytrail */
+	case 0x2284: /* Braswell */
+		return SND_INTEL_DSP_DRIVER_ANY;
+	}
+
 	if (dsp_driver > 0 && dsp_driver <= SND_INTEL_DSP_DRIVER_LAST)
 		return dsp_driver;
 
-- 
2.25.1

