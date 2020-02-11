Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ABF159402
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:55:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B6FF1671;
	Tue, 11 Feb 2020 16:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B6FF1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436526;
	bh=y/qwzwXFkHt2DNY6BoA66cSV3mOsTqPf2RZVXryZZJ8=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nQcmYDaxO1G7pnYz47+1RXZTnHl+NcGZv2cTHRIWWMY0p/2Y+t+9FP5UqkDzSOAmn
	 YKiy1InNgaV3NTPZrRf24doZzaoQ2G5EGyC/hEc2PCQjyF6QpREbC3br+G+MwBW9SK
	 WfxWQA7L2F1dKQKSgXaMzmBo6c8vyS9xyADmdETs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AE0EF802EC;
	Tue, 11 Feb 2020 16:48:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60FB7F802D2; Tue, 11 Feb 2020 16:48:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6A85AF802A8
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:48:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A85AF802A8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EDF731B;
 Tue, 11 Feb 2020 07:48:42 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D87233F68E;
 Tue, 11 Feb 2020 07:48:41 -0800 (PST)
Date: Tue, 11 Feb 2020 15:48:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20200129220726.31792-8-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200129220726.31792-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: Amend the DSP state
	transition diagram" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: hda: Amend the DSP state transition diagram

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 207bf12f642f39e749ca65d3efca9d48311e629f Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 29 Jan 2020 16:07:24 -0600
Subject: [PATCH] ASoC: SOF: Intel: hda: Amend the DSP state transition diagram

Amend the DSP state transition diagram in preparation
for introducing the feature to support opportunistic
DSP D0I3 state when the system is in S0.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200129220726.31792-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 36 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 8c00e128a7b0..7b8425330ae0 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -488,33 +488,31 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 /*
  * Audio DSP states may transform as below:-
  *
- *                                         D0I3 compatible stream
- *     Runtime    +---------------------+   opened only, timeout
+ *                                         Opportunistic D0I3 in S0
+ *     Runtime    +---------------------+  Delayed D0i3 work timeout
  *     suspend    |                     +--------------------+
- *   +------------+       D0(active)    |                    |
+ *   +------------+       D0I0(active)  |                    |
  *   |            |                     <---------------+    |
- *   |   +-------->                     |               |    |
- *   |   |Runtime +--^--+---------^--+--+ The last      |    |
- *   |   |resume     |  |         |  |    opened D0I3   |    |
- *   |   |           |  |         |  |    compatible    |    |
- *   |   |     resume|  |         |  |    stream closed |    |
- *   |   |      from |  | D3      |  |                  |    |
- *   |   |       D3  |  |suspend  |  | d0i3             |    |
+ *   |   +-------->                     |    New IPC	|    |
+ *   |   |Runtime +--^--+---------^--+--+ (via mailbox)	|    |
+ *   |   |resume     |  |         |  |			|    |
+ *   |   |           |  |         |  |			|    |
+ *   |   |     System|  |         |  |			|    |
+ *   |   |     resume|  | S3/S0IX |  |                  |    |
+ *   |   |	     |  | suspend |  | S0IX             |    |
  *   |   |           |  |         |  |suspend           |    |
  *   |   |           |  |         |  |                  |    |
  *   |   |           |  |         |  |                  |    |
  * +-v---+-----------+--v-------+ |  |           +------+----v----+
  * |                            | |  +----------->                |
- * |       D3 (suspended)       | |              |      D0I3      +-----+
- * |                            | +--------------+                |     |
- * |                            |  resume from   |                |     |
- * +-------------------^--------+  d0i3 suspend  +----------------+     |
- *                     |                                                |
- *                     |                       D3 suspend               |
- *                     +------------------------------------------------+
+ * |       D3 (suspended)       | |              |      D0I3      |
+ * |                            | +--------------+                |
+ * |                            |  System resume |                |
+ * +----------------------------+		 +----------------+
  *
- * d0i3_suspend = s0_suspend && D0I3 stream opened,
- * D3 suspend = !d0i3_suspend,
+ * S0IX suspend: The DSP is in D0I3 if any D0I3-compatible streams
+ *		 ignored the suspend trigger. Otherwise the DSP
+ *		 is in D3.
  */
 
 static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
