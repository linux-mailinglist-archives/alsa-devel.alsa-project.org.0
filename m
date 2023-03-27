Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC726CA26A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16FD5836;
	Mon, 27 Mar 2023 13:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16FD5836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916669;
	bh=SPP4W5mq6Y+8hpECYf7SeOkBV9H0zwmF5MIq1rFf0Gk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iEE2Wo8Feqqjb4X7bw/pF+uCHj2omdvI9PrAJq9IwMTHHmY1T7cIM7kwnQllUcMBC
	 ATRvkAc8IF9mdIiozsM5CQvrPdZsw+xo9Bhk91skoN90hLWoA97WomvYR4XXgeH0Lz
	 0r3P2QftKhY1o6FKgvisITmd8Q0s37UqKY1HsP20=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1313AF80527;
	Mon, 27 Mar 2023 13:29:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF085F80482; Mon, 27 Mar 2023 13:29:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6A0BF800C9
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6A0BF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KGs8qI7k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916551; x=1711452551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SPP4W5mq6Y+8hpECYf7SeOkBV9H0zwmF5MIq1rFf0Gk=;
  b=KGs8qI7k0JsfT2kxkKsfFmJXrGjs8iKmt2ZR38k/vjtZOSkbMODdMqLU
   D0W7/PZT/WDhFJUBCswuIp9GIaxy4uvy9Cjwr8Gx4beTB98Lykvo/Ue7r
   3QsKn7006zgmK565xF2mypbQBL1hVkUweCxuw46UDob1HIRJquCadNhrf
   uzMNJiiT1fEzPEGtSILXZvtFaHM30SrhiAXWEviOwvq6bIVfjdNouSenU
   1Mc1sDvikAV1Wn0/KlqnPvJ/g3dSOFkJFWTEZKlhL8OWtUjdupfg9+hTD
   6/wdKQm+KdYg5QK5pjqijuxWhSid+42dWk4asdVrR/TdBfhoLTdmY/udw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367986875"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367986875"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620358"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620358"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 01/18] Documentation: sound: add description of Intel HDaudio
 multi-links
Date: Mon, 27 Mar 2023 14:29:14 +0300
Message-Id: <20230327112931.23411-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UUKFP5QRH72KZOQ5BALZVTKOIFDJHVN4
X-Message-ID-Hash: UUKFP5QRH72KZOQ5BALZVTKOIFDJHVN4
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UUKFP5QRH72KZOQ5BALZVTKOIFDJHVN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add description of 'Skylake' multi-link structure added in 2015 and
recent extensions to support SoundWire/DMIC/SSP interfaces.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 Documentation/sound/hd-audio/index.rst        |   1 +
 .../sound/hd-audio/intel-multi-link.rst       | 312 ++++++++++++++++++
 2 files changed, 313 insertions(+)
 create mode 100644 Documentation/sound/hd-audio/intel-multi-link.rst

diff --git a/Documentation/sound/hd-audio/index.rst b/Documentation/sound/hd-audio/index.rst
index 6e12de9fc34e..baefe4a5d165 100644
--- a/Documentation/sound/hd-audio/index.rst
+++ b/Documentation/sound/hd-audio/index.rst
@@ -9,3 +9,4 @@ HD-Audio
    controls
    dp-mst
    realtek-pc-beep
+   intel-multi-link
diff --git a/Documentation/sound/hd-audio/intel-multi-link.rst b/Documentation/sound/hd-audio/intel-multi-link.rst
new file mode 100644
index 000000000000..bf0bb78833e7
--- /dev/null
+++ b/Documentation/sound/hd-audio/intel-multi-link.rst
@@ -0,0 +1,312 @@
+.. SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+.. include:: <isonum.txt>
+
+================================================
+HDAudio multi-link extensions on Intel platforms
+================================================
+
+:Copyright: |copy| 2023 Intel Corporation
+
+This file documents the 'multi-link structure' introduced in 2015 with
+the Skylake processor and recently extended in newer Intel platforms
+
+HDaudio existing link mapping (2015 addition in SkyLake)
+========================================================
+
+External HDAudio codecs are handled with link #0, while iDISP codec
+for HDMI/DisplayPort is handled with link #1.
+
+The only change to the 2015 definitions is the declaration of the
+LCAP.ALT=0x0 - since the ALT bit was previously reserved, this is a
+backwards-compatible change.
+
+LCTL.SPA and LCTL.CPA are automatically set when exiting reset. They
+are only used in existing drivers when the SCF value needs to be
+corrected.
+
+Basic structure for HDaudio codecs
+----------------------------------
+
+::
+
+  +-----------+
+  | ML cap #0 |
+  +-----------+
+  | ML cap #1 |---+
+  +-----------+   |
+                  |
+                  +--> 0x0 +---------------+ LCAP
+                           | ALT=0         |
+                           +---------------+
+                           | S192          |
+                           +---------------+
+                           | S96           |
+                           +---------------+
+                           | S48           |
+                           +---------------+
+                           | S24           |
+                           +---------------+
+                           | S12           |
+                           +---------------+
+                           | S6            |
+                           +---------------+
+
+                       0x4 +---------------+ LCTL
+                           | INTSTS        |
+                           +---------------+
+                           | CPA           |
+                           +---------------+
+                           | SPA           |
+                           +---------------+
+                           | SCF           |
+                           +---------------+
+
+                       0x8 +---------------+ LOSIDV
+                           | L1OSIVD15     |
+                           +---------------+
+                           | L1OSIDV..     |
+                           +---------------+
+                           | L1OSIDV1      |
+                           +---------------+
+
+                       0xC +---------------+ LSDIID
+                           | SDIID14       |
+                           +---------------+
+                           | SDIID...      |
+                           +---------------+
+                           | SDIID0        |
+                           +---------------+
+
+SoundWire HDaudio extended link mapping
+=======================================
+
+A SoundWire extended link is identified when LCAP.ALT=1 and
+LEPTR.ID=0.
+
+DMA control uses the existing LOSIDV register.
+
+Changes include additional descriptions for enumeration that were not
+present in earlier generations.
+
+- multi-link synchronization: capabilities in LCAP.LSS and control in LSYNC
+- number of sublinks (manager IP) in LCAP.LSCOUNT
+- power management moved from SHIM to LCTL.SPA bits
+- hand-over to the DSP for access to multi-link registers, SHIM/IP with LCTL.OFLEN
+- mapping of SoundWire codecs to SDI ID bits
+- move of SHIM and Cadence registers to different offsets, with no
+  change in functionality. The LEPTR.PTR value is an offset from the
+  ML address, with a default value of 0x30000.
+
+Extended structure for SoundWire (assuming 4 Manager IP)
+--------------------------------------------------------
+
+::
+
+  +-----------+
+  | ML cap #0 |
+  +-----------+
+  | ML cap #1 |
+  +-----------+
+  | ML cap #2 |---+
+  +-----------+   |
+                  |
+                  +--> 0x0 +---------------+ LCAP
+                           | ALT=1         |
+                           +---------------+
+                           | INTC          |
+                           +---------------+
+                           | OFLS          |
+                           +---------------+
+                           | LSS           |
+                           +---------------+
+                           | SLCOUNT=4     |-----------+
+                           +---------------+           |
+                                                       |
+                       0x4 +---------------+ LCTL      |
+                           | INTSTS        |           |
+                           +---------------+           |
+                           | CPA (x bits)  |           |
+                           +---------------+           |
+                           | SPA (x bits)  |           |
+                           +---------------+         for each sublink x
+                           | INTEN         |           |
+                           +---------------+           |
+                           | OFLEN         |           |
+                           +---------------+           |
+                                                       |
+                       0x8 +---------------+ LOSIDV    |
+                           | L1OSIVD15     |           |
+                           +---------------+           |
+                           | L1OSIDV..     |           |
+                           +---------------+           |
+                           | L1OSIDV1      |       +---+----------------------------------------------------------+
+                           +---------------+       |                                                              |
+                                                   v                                                              |
+             0xC + 0x2 * x +---------------+ LSDIIDx    +---> 0x30000  +-----------------+  0x00030000            |
+                           | SDIID14       |            |              | SoundWire SHIM  |                        |
+                           +---------------+            |              | generic         |                        |
+                           | SDIID...      |            |              +-----------------+  0x00030100            |
+                           +---------------+            |              | SoundWire IP    |                        |
+                           | SDIID0        |            |              +-----------------+  0x00036000            |
+                           +---------------+            |              | SoundWire SHIM  |                        |
+                                                        |              | vendor-specific |                        |
+                      0x1C +---------------+ LSYNC      |              +-----------------+                        |
+                           | CMDSYNC       |            |                                                         v
+                           +---------------+            |              +-----------------+  0x00030000 + 0x8000 * x
+                           | SYNCGO        |            |              | SoundWire SHIM  |
+                           +---------------+            |              | generic         |
+                           | SYNCPU        |            |              +-----------------+  0x00030100 + 0x8000 * x
+                           +---------------+            |              | SoundWire IP    |
+                           | SYNPRD        |            |              +-----------------+  0x00036000 + 0x8000 * x
+                           +---------------+            |              | SoundWire SHIM  |
+                                                        |              | vendor-specific |
+                      0x20 +---------------+ LEPTR      |              +-----------------+
+                           | ID = 0        |            |
+                           +---------------+            |
+                           | VER           |            |
+                           +---------------+            |
+                           | PTR           |------------+
+                           +---------------+
+
+
+DMIC HDaudio extended link mapping
+==================================
+
+A DMIC extended link is identified when LCAP.ALT=1 and
+LEPTR.ID=0xC1 are set.
+
+DMA control uses the existing LOSIDV register
+
+Changes include additional descriptions for enumeration that were not
+present in earlier generations.
+
+- multi-link synchronization: capabilities in LCAP.LSS and control in LSYNC
+- power management with LCTL.SPA bits
+- hand-over to the DSP for access to multi-link registers, SHIM/IP with LCTL.OFLEN
+
+- move of DMIC registers to different offsets, with no change in
+  functionality. The LEPTR.PTR value is an offset from the ML
+  address, with a default value of 0x10000.
+
+Extended structure for DMIC
+---------------------------
+
+::
+
+  +-----------+
+  | ML cap #0 |
+  +-----------+
+  | ML cap #1 |
+  +-----------+
+  | ML cap #2 |---+
+  +-----------+   |
+                  |
+                  +--> 0x0 +---------------+ LCAP
+                           | ALT=1         |
+                           +---------------+
+                           | INTC          |
+                           +---------------+
+                           | OFLS          |
+                           +---------------+
+                           | SLCOUNT=1     |
+                           +---------------+
+
+                       0x4 +---------------+ LCTL
+                           | INTSTS        |
+                           +---------------+
+                           | CPA           |
+                           +---------------+
+                           | SPA           |
+                           +---------------+
+                           | INTEN         |
+                           +---------------+
+                           | OFLEN         |
+                           +---------------+           +---> 0x10000  +-----------------+  0x00010000
+                                                       |              | DMIC SHIM       |
+                       0x8 +---------------+ LOSIDV    |              | generic         |
+                           | L1OSIVD15     |           |              +-----------------+  0x00010100
+                           +---------------+           |              | DMIC IP         |
+                           | L1OSIDV..     |           |              +-----------------+  0x00016000
+                           +---------------+           |              | DMIC SHIM       |
+                           | L1OSIDV1      |           |              | vendor-specific |
+                           +---------------+           |              +-----------------+
+                                                       |
+                      0x20 +---------------+ LEPTR     |
+                           | ID = 0xC1     |           |
+                           +---------------+           |
+                           | VER           |           |
+                           +---------------+           |
+                           | PTR           |-----------+
+                           +---------------+
+
+
+SSP HDaudio extended link mapping
+=================================
+
+A DMIC extended link is identified when LCAP.ALT=1 and
+LEPTR.ID=0xC0 are set.
+
+DMA control uses the existing LOSIDV register
+
+Changes include additional descriptions for enumeration and control that were not
+present in earlier generations:
+- number of sublinks (SSP IP instances) in LCAP.LSCOUNT
+- power management moved from SHIM to LCTL.SPA bits
+- hand-over to the DSP for access to multi-link registers, SHIM/IP
+with LCTL.OFLEN
+- move of SHIM and SSP IP registers to different offsets, with no
+change in functionality.  The LEPTR.PTR value is an offset from the ML
+address, with a default value of 0x28000.
+
+Extended structure for SSP (assuming 3 instances of the IP)
+-----------------------------------------------------------
+
+::
+
+  +-----------+
+  | ML cap #0 |
+  +-----------+
+  | ML cap #1 |
+  +-----------+
+  | ML cap #2 |---+
+  +-----------+   |
+                  |
+                  +--> 0x0 +---------------+ LCAP
+                           | ALT=1         |
+                           +---------------+
+                           | INTC          |
+                           +---------------+
+                           | OFLS          |
+                           +---------------+
+                           | SLCOUNT=3     |-------------------------for each sublink x -------------------------+
+                           +---------------+                                                                     |
+                                                                                                                 |
+                       0x4 +---------------+ LCTL                                                                |
+                           | INTSTS        |                                                                     |
+                           +---------------+                                                                     |
+                           | CPA (x bits)  |                                                                     |
+                           +---------------+                                                                     |
+                           | SPA (x bits)  |                                                                     |
+                           +---------------+                                                                     |
+                           | INTEN         |                                                                     |
+                           +---------------+                                                                     |
+                           | OFLEN         |                                                                     |
+                           +---------------+           +---> 0x28000  +-----------------+  0x00028000            |
+                                                       |              | SSP SHIM        |                        |
+                       0x8 +---------------+ LOSIDV    |              | generic         |                        |
+                           | L1OSIVD15     |           |              +-----------------+  0x00028100            |
+                           +---------------+           |              | SSP IP          |                        |
+                           | L1OSIDV..     |           |              +-----------------+  0x00028C00            |
+                           +---------------+           |              | SSP SHIM        |                        |
+                           | L1OSIDV1      |           |              | vendor-specific |                        |
+                           +---------------+           |              +-----------------+                        |
+                                                       |                                                         v
+                      0x20 +---------------+ LEPTR     |              +-----------------+  0x00028000 + 0x1000 * x
+                           | ID = 0xC0     |           |              | SSP SHIM        |
+                           +---------------+           |              | generic         |
+                           | VER           |           |              +-----------------+  0x00028100 + 0x1000 * x
+                           +---------------+           |              | SSP IP          |
+                           | PTR           |-----------+              +-----------------+  0x00028C00 + 0x1000 * x
+                           +---------------+                          | SSP SHIM        |
+                                                                      | vendor-specific |
+                                                                      +-----------------+
-- 
2.40.0

