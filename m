Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF741B01C3
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 08:48:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B8B31670;
	Mon, 20 Apr 2020 08:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B8B31670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587365288;
	bh=/+XsRIRTH9fgPZkHp38Flj4+a/9jYmsOaYBVSPFCu28=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RoE3soMPwINPvJNJv3+M1zEA4sV9kLuo8mPySLuVF/1d5TrabwTj1Yvs1muuq6CKg
	 Bd4l62j07MJt/svRBSgnHlqlDxt1Pc+cbzd0+/Yrafh15Qw8sqAyw0xStM7AaFVtXT
	 NPZPcm/Phrpwm4Jk58jByWfn3QCcfryeAFlbTyt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38681F8012F;
	Mon, 20 Apr 2020 08:46:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECF7AF8020C; Mon, 20 Apr 2020 08:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D6C3F800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 08:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D6C3F800E7
IronPort-SDR: LcGnTsbIrtDREBHMOn7Hd3KGQ9Necx2OjxxvT9IWYo8INgUN4hERZr0B5cDZMmLV70wJ+199Uz
 iYHurt7I8Mpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 23:46:11 -0700
IronPort-SDR: CEQtgG2TlUFykrrmk1GKgfeLqWwsttNnsS0NGryxHW7Vz/K5W/HCCcTcYK1gppwZ8oYXG+803K
 2vLggYJXz9Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="254845023"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga003.jf.intel.com with ESMTP; 19 Apr 2020 23:46:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/4] Documentation: SoundWire: clarify TDM mode support
Date: Mon, 20 Apr 2020 02:51:14 +0800
Message-Id: <20200419185117.4233-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

The current description of stream topologies does not explicitly
mention 'mirror' topologies used for audio amplifiers, where all
amplifiers see the same data and generate a different output based on
configuration or dynamic information. Add examples and notes to
explain how channels can be transmitted and mapped.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 Documentation/driver-api/soundwire/stream.rst | 89 ++++++++++++++++++-
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/soundwire/stream.rst b/Documentation/driver-api/soundwire/stream.rst
index 8bceece51554..1b386076402c 100644
--- a/Documentation/driver-api/soundwire/stream.rst
+++ b/Documentation/driver-api/soundwire/stream.rst
@@ -75,8 +75,33 @@ Slaves are using single port. ::
 	                                                   |     (Data)    |
 	                                                   +---------------+
 
+Example 4: Stereo Stream with L and R channels is rendered by
+Master. Both of the L and R channels are received by two different
+Slaves. Master and both Slaves are using single port handling
+L+R. Each Slave device processes the L + R data locally, typically
+based on static configuration or dynamic orientation, and may drive
+one or more speakers. ::
 
-Example 4: Stereo Stream with L and R channel is rendered by two different
+	+---------------+                    Clock Signal  +---------------+
+	|    Master     +---------+------------------------+     Slave     |
+	|   Interface   |         |                        |   Interface   |
+	|               |         |                        |       1       |
+	|               |         |           Data Signal  |               |
+	|    L  +  R    +---+------------------------------+     L + R     |
+	|     (Data)    |   |     |    Data Direction      |     (Data)    |
+	+---------------+   |     |   +------------->      +---------------+
+	                    |     |
+	                    |     |
+	                    |     |                        +---------------+
+	                    |     +----------------------> |     Slave     |
+	                    |                              |   Interface   |
+	                    |                              |       2       |
+	                    |                              |               |
+	                    +----------------------------> |     L + R     |
+	                                                   |     (Data)    |
+	                                                   +---------------+
+
+Example 5: Stereo Stream with L and R channel is rendered by two different
 Ports of the Master and is received by only single Port of the Slave
 interface. ::
 
@@ -101,7 +126,7 @@ interface. ::
 	+--------------------+                             |                |
 							   +----------------+
 
-Example 5: Stereo Stream with L and R channel is rendered by 2 Masters, each
+Example 6: Stereo Stream with L and R channel is rendered by 2 Masters, each
 rendering one channel, and is received by two different Slaves, each
 receiving one channel. Both Masters and both Slaves are using single port. ::
 
@@ -123,12 +148,70 @@ receiving one channel. Both Masters and both Slaves are using single port. ::
 	|     (Data)    |     Data Direction               |     (Data)    |
 	+---------------+  +----------------------->       +---------------+
 
-Note: In multi-link cases like above, to lock, one would acquire a global
+Example 7: Stereo Stream with L and R channel is rendered by 2
+Masters, each rendering both channels. Each Slave receives L + R. This
+is the same application as Example 4 but with Slaves placed on
+separate links. ::
+
+	+---------------+                    Clock Signal  +---------------+
+	|    Master     +----------------------------------+     Slave     |
+	|   Interface   |                                  |   Interface   |
+	|       1       |                                  |       1       |
+	|               |                     Data Signal  |               |
+	|     L + R     +----------------------------------+     L + R     |
+	|     (Data)    |     Data Direction               |     (Data)    |
+	+---------------+  +----------------------->       +---------------+
+
+	+---------------+                    Clock Signal  +---------------+
+	|    Master     +----------------------------------+     Slave     |
+	|   Interface   |                                  |   Interface   |
+	|       2       |                                  |       2       |
+	|               |                     Data Signal  |               |
+	|     L + R     +----------------------------------+     L + R     |
+	|     (Data)    |     Data Direction               |     (Data)    |
+	+---------------+  +----------------------->       +---------------+
+
+Example 8: 4-channel Stream is rendered by 2 Masters, each rendering a
+2 channels. Each Slave receives 2 channels. ::
+
+	+---------------+                    Clock Signal  +---------------+
+	|    Master     +----------------------------------+     Slave     |
+	|   Interface   |                                  |   Interface   |
+	|       1       |                                  |       1       |
+	|               |                     Data Signal  |               |
+	|    L1 + R1    +----------------------------------+    L1 + R1    |
+	|     (Data)    |     Data Direction               |     (Data)    |
+	+---------------+  +----------------------->       +---------------+
+
+	+---------------+                    Clock Signal  +---------------+
+	|    Master     +----------------------------------+     Slave     |
+	|   Interface   |                                  |   Interface   |
+	|       2       |                                  |       2       |
+	|               |                     Data Signal  |               |
+	|     L2 + R2   +----------------------------------+    L2 + R2    |
+	|     (Data)    |     Data Direction               |     (Data)    |
+	+---------------+  +----------------------->       +---------------+
+
+Note1: In multi-link cases like above, to lock, one would acquire a global
 lock and then go on locking bus instances. But, in this case the caller
 framework(ASoC DPCM) guarantees that stream operations on a card are
 always serialized. So, there is no race condition and hence no need for
 global lock.
 
+Note2: A Slave device may be configured to receive all channels
+transmitted on a link for a given Stream (Example 4) or just a subset
+of the data (Example 3). The configuration of the Slave device is not
+handled by a SoundWire subsystem API, but instead by the
+snd_soc_dai_set_tdm_slot() API. The platform or machine driver will
+typically configure which of the slots are used. For Example 4, the
+same slots would be used by all Devices, while for Example 3 the Slave
+Device1 would use e.g. Slot 0 and Slave device2 slot 1.
+
+Note3: Multiple Sink ports can extract the same information for the
+same bitSlots in the SoundWire frame, however multiple Source ports
+shall be configured with different bitSlot configurations. This is the
+same limitation as with I2S/PCM TDM usages.
+
 SoundWire Stream Management flow
 ================================
 
-- 
2.17.1

