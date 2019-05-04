Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 994AB136CF
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 03:05:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 302DE18A4;
	Sat,  4 May 2019 03:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 302DE18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556931916;
	bh=0h4GHexaztySdcQpqxRl0zKV5a+uLMTFvSupGNgu7CY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gsWOSQ15INxWKenKHkUeyZCflo1rvVZksY/B79Tjt9upxupPCvzI8NPAFw1nr7KSo
	 RGwIdhX2Rd1NSyZKv9kGqcp+jg/cJcSrInUZyloweBzvf7L8+8r/tJirAeNWvudg3h
	 wmR0oGUSyBBsij2+r8JolpwOLHZhSixiClDbjIww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6F50F89735;
	Sat,  4 May 2019 03:01:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDE3EF89730; Sat,  4 May 2019 03:01:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBDF7F89728
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 03:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBDF7F89728
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 18:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="148114223"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga007.fm.intel.com with ESMTP; 03 May 2019 18:00:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 20:00:27 -0500
Message-Id: <20190504010030.29233-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com
Subject: [alsa-devel] [RFC PATCH 4/7] ABI: testing: Add description of
	soundwire slave sysfs files
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

The description is directly derived from the MIPI DisCo specification.

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-soundwire-slave     | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-soundwire-slave

diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-slave b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
new file mode 100644
index 000000000000..db2a0177f68f
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
@@ -0,0 +1,85 @@
+What:		/sys/bus/soundwire/devices/sdw:.../bank_delay_support
+		/sys/bus/soundwire/devices/sdw:.../ch_prep_timeout
+		/sys/bus/soundwire/devices/sdw:.../clk_stop_mode1
+		/sys/bus/soundwire/devices/sdw:.../clk_stop_timeout
+		/sys/bus/soundwire/devices/sdw:.../high_PHY_capable
+		/sys/bus/soundwire/devices/sdw:.../master_count
+		/sys/bus/soundwire/devices/sdw:.../mipi_revision
+		/sys/bus/soundwire/devices/sdw:.../p15_behave
+		/sys/bus/soundwire/devices/sdw:.../paging_support
+		/sys/bus/soundwire/devices/sdw:.../reset_behave
+		/sys/bus/soundwire/devices/sdw:.../simple_clk_stop_capable
+		/sys/bus/soundwire/devices/sdw:.../sink_ports
+		/sys/bus/soundwire/devices/sdw:.../source_ports
+		/sys/bus/soundwire/devices/sdw:.../test_mode_capable
+		/sys/bus/soundwire/devices/sdw:.../wake_capable
+
+Date:		May 2019
+
+Contact:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+
+Description:	SoundWire Slave DisCo properties.
+		These properties are defined by MIPI DisCo Specification
+		for SoundWire. They define various properties of the
+		SoundWire Slave and are used by the bus to configure
+		the Slave
+
+
+What:		/sys/bus/soundwire/devices/sdw:.../dp0/BRA_flow_controlled
+		/sys/bus/soundwire/devices/sdw:.../dp0/imp_def_interrupts
+		/sys/bus/soundwire/devices/sdw:.../dp0/max_word
+		/sys/bus/soundwire/devices/sdw:.../dp0/min_word
+		/sys/bus/soundwire/devices/sdw:.../dp0/simple_ch_prep_sm
+		/sys/bus/soundwire/devices/sdw:.../dp0/word_bits
+
+Date:		May 2019
+
+Contact:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+
+Description:	SoundWire Slave Data Port-0 DisCo properties.
+		These properties are defined by MIPI DisCo Specification
+		for the SoundWire. They define various properties of the
+		Data port 0 are used by the bus to configure the Data Port 0.
+
+
+What:		/sys/bus/soundwire/devices/sdw:.../src-dpN/block_pack_mode
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/channels
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/ch_combinations
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/ch_prep_timeout
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/imp_def_interrupts
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/max_async_buffer
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/max_ch
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/max_grouping
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/max_word
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/min_ch
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/min_word
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/modes
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/port_encoding
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/simple_ch_prep_sm
+		/sys/bus/soundwire/devices/sdw:.../src-dpN/words
+
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/block_pack_mode
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/channels
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/ch_combinations
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/ch_prep_timeout
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/imp_def_interrupts
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/max_async_buffer
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/max_ch
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/max_grouping
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/max_word
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/min_ch
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/min_word
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/modes
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/port_encoding
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/simple_ch_prep_sm
+		/sys/bus/soundwire/devices/sdw:.../sink-dpN/words
+
+Date:		May 2019
+
+Contact:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+
+Description:	SoundWire Slave Data Source/Sink Port-N DisCo properties.
+		These properties are defined by MIPI DisCo Specification
+		for SoundWire. They define various properties of the
+		Source/Sink Data port N and are used by the bus to configure
+		the Data Port N.
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
