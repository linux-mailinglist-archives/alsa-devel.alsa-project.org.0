Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB9E56CF
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 01:00:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF3018CA;
	Sat, 26 Oct 2019 00:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF3018CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572044446;
	bh=y9dXLx6+rlVPIi4MGaSv1YdGnYLPHsLIDVrEuXAvmEw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=toxlos+hjBDigsclYjNHnZ6s2uPrqreKvcCP3UmEWo5gkSjfH4cPd/OOtmFquQq1D
	 6oDDG2sWV/Z7TXS9n/W8Ylr4oT+zUFL+QqIybYFSQ2DWcDqS/iBy1Bm/TdkuCLbzyy
	 R7lrdkPRvFlOKOLRjh6cZIKvm4xSVGmYQyuyJMZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D7F3F80863;
	Sat, 26 Oct 2019 00:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E6F1F8063A; Sat, 26 Oct 2019 00:42:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14999F80637
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14999F80637
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458236"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:21 -0500
Message-Id: <20191025224122.7718-26-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 25/26] ASoC: SOF: PM: Add support for DSP D0i3
	state when entering S0ix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Keyon Jie <yang.jie@linux.intel.com>

When system is entering into S0ix, the PCI device may transition to the
D0i3 substate instead of D3. In D0i3, some always-on functionality can
be enabled, such as acoustic event detection, voice activity detection
or hotwording. When an event is detected, the DSP firmware can wake-up
the device for a transition to D0 with an interrupt.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pm.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 99e4e6ffff74..560a937e0484 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -430,12 +430,58 @@ EXPORT_SYMBOL(snd_sof_set_d0_substate);
 
 int snd_sof_resume(struct device *dev)
 {
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (sdev->s0_suspend) {
+		/* resume from D0I3 */
+		dev_dbg(sdev->dev, "DSP will exit from D0i3...\n");
+		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I0);
+		if (ret == -ENOTSUPP) {
+			/* fallback to resume from D3 */
+			dev_dbg(sdev->dev, "D0i3 not supported, fall back to resume from D3...\n");
+			goto d3_resume;
+		} else if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to exit from D0I3 %d\n",
+				ret);
+			return ret;
+		}
+
+		/* platform-specific resume from D0i3 */
+		return snd_sof_dsp_resume(sdev);
+	}
+
+d3_resume:
+	/* resume from D3 */
 	return sof_resume(dev, false);
 }
 EXPORT_SYMBOL(snd_sof_resume);
 
 int snd_sof_suspend(struct device *dev)
 {
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (sdev->s0_suspend) {
+		/* suspend to D0i3 */
+		dev_dbg(sdev->dev, "DSP is trying to enter D0i3...\n");
+		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I3);
+		if (ret == -ENOTSUPP) {
+			/* fallback to D3 suspend */
+			dev_dbg(sdev->dev, "D0i3 not supported, fall back to D3...\n");
+			goto d3_suspend;
+		} else if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to enter D0I3, %d\n",
+				ret);
+			return ret;
+		}
+
+		/* platform-specific suspend to D0i3 */
+		return snd_sof_dsp_suspend(sdev);
+	}
+
+d3_suspend:
+	/* suspend to D3 */
 	return sof_suspend(dev, false);
 }
 EXPORT_SYMBOL(snd_sof_suspend);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
