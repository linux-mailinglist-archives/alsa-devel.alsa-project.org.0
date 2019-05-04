Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50539136CC
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 03:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE7B61895;
	Sat,  4 May 2019 03:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE7B61895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556931793;
	bh=l6w+kbXNgfEFpEGsrL78fh841eZiMFSA6VwN/yCsv3k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jGQH+xFKxpi/woPk+tjDm5PL6EFc2aCd3tM7U/zAYfu1AoJJQOKekFMx/MTnfBEJh
	 DRkJLlMvqyKWclcvv2x/VusfnqrQWgGC7Y8U86DHGhV0DpFYxWS80R6H8EFNWbCGN8
	 Tf65qZvbvESL5m1CjirsTYYCIWl/urrftsrVIV7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A109FF896F0;
	Sat,  4 May 2019 03:00:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31546F80720; Sat,  4 May 2019 03:00:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E8F5F8075A
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 03:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E8F5F8075A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 18:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="148114192"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga007.fm.intel.com with ESMTP; 03 May 2019 18:00:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 20:00:23 -0500
Message-Id: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com
Subject: [alsa-devel] [RFC PATCH 0/7] soundwire: add sysfs and debugfs
	support
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

This patchset is not fully-tested and is not a candidate for any
merge. Since I am not very comfortable with sysfs and debugfs support,
and I am not the initial author for this code, I could use feedback
from smarter people than me. 

This series is intented to be applied on top of the 'soundwire:
corrections to ACPI and DisCo properties' series

Parts of this code was initially written by my Intel colleagues Vinod
Koul, Sanyog Kale, Shreyas Nc and Hardik Shah, who are either no
longer with Intel or no longer involved in SoundWire development. When
relevant, I explictly added a note in commit messages to give them
credit for their hard work, but I removed their signed-off-by tags to
avoid email bounces and avoid spamming them forever with SoundWire
patches.

The sysfs parts essentially expose the values of MIPI DisCo
properties. My contribution here was mainly to align with the
specification, a number of properties from the Intel internal code
were missing. I also split the code to make sure the same attribute
names can be used at different levels, as described in the spec.

One of the main questions I have is whether there is really a need to
add new devices, or if the attributes can be added to the *existing*
ones. For example, the sysfs hierarchy for the SoundWire 0 master
shows as:

/sys/bus/acpi/devices/PRP00001:00/int-sdw.0# ls sdw*
'sdw:0:25d:700:0:0':
bank_delay_support  hda_reg           paging_support           source_ports
ch_prep_timeout     high_PHY_capable  power                    src-dp2
clk_stop_mode1      index_reg         reset_behave             src-dp4
clk_stop_timeout    master_count      simple_clk_stop_capable  subsystem
dp0                 mipi_revision     sink-dp1                 test_mode_capable
driver              modalias          sink-dp3                 uevent
firmware_node       p15_behave        sink_ports               wake_capable

'sdw:0:25d:701:0:0':
bank_delay_support  high_PHY_capable  paging_support           source_ports
ch_prep_timeout     master_count      power                    subsystem
clk_stop_mode1      mipi_revision     reset_behave             test_mode_capable
clk_stop_timeout    modalias          simple_clk_stop_capable  uevent
firmware_node       p15_behave        sink_ports               wake_capable

'sdw-master:0':
clk_stop_modes     default_col         dynamic_frame  power      uevent
clock_frequencies  default_frame_rate  err_threshold  revision
clock_gears        default_row         max_clk_freq   subsystem

For the first two Slaves, this results in pretend-devices being added
below each master, the actual Slave devices are children of the
PRP00001 devices, so here we add a bit of complexity. Likewise, the
'sdw-master:0' is a pretend-device whose purpose is only to expose
property values. Is this the recommended direction? Or should all the
sysfs properties be added to the devices exposed by ACPI?

The debugfs part is mainly to dump the Master and Slave registers, as
well as the Intel-specific parts. One of the main changes from the
previous code was to harden the code with scnprintf

Feedback welcome.
~Pierre

Pierre-Louis Bossart (7):
  soundwire: Add sysfs support for master(s)
  soundwire: add Slave sysfs support
  ABI: testing: Add description of soundwire master sysfs files
  ABI: testing: Add description of soundwire slave sysfs files
  soundwire: add debugfs support
  soundwire: cadence_master: add debugfs register dump
  soundwire: intel: add debugfs register dump

 .../ABI/testing/sysfs-bus-soundwire-master    |  21 +
 .../ABI/testing/sysfs-bus-soundwire-slave     |  85 ++++
 drivers/soundwire/Makefile                    |   4 +-
 drivers/soundwire/bus.c                       |  13 +
 drivers/soundwire/bus.h                       |  30 ++
 drivers/soundwire/bus_type.c                  |   8 +
 drivers/soundwire/cadence_master.c            |  98 +++++
 drivers/soundwire/cadence_master.h            |   5 +
 drivers/soundwire/debugfs.c                   | 214 ++++++++++
 drivers/soundwire/intel.c                     | 115 ++++++
 drivers/soundwire/slave.c                     |   2 +
 drivers/soundwire/sysfs.c                     | 376 ++++++++++++++++++
 drivers/soundwire/sysfs_local.h               |  42 ++
 drivers/soundwire/sysfs_slave_dp0.c           | 112 ++++++
 drivers/soundwire/sysfs_slave_dpn.c           | 168 ++++++++
 include/linux/soundwire/sdw.h                 |  24 ++
 16 files changed, 1316 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-soundwire-master
 create mode 100644 Documentation/ABI/testing/sysfs-bus-soundwire-slave
 create mode 100644 drivers/soundwire/debugfs.c
 create mode 100644 drivers/soundwire/sysfs.c
 create mode 100644 drivers/soundwire/sysfs_local.h
 create mode 100644 drivers/soundwire/sysfs_slave_dp0.c
 create mode 100644 drivers/soundwire/sysfs_slave_dpn.c

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
