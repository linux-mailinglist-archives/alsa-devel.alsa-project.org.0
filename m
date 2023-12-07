Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8834280955D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:31:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8208D208;
	Thu,  7 Dec 2023 23:30:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8208D208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988268;
	bh=5Y16m8g9pKASh23x6BVQ4S41YSM00CIvjMF1PwQU6IY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oAzP8+UFVeAKGebc48kUt/NgzqDxHW1KPzflRJ+TUUzyyLf58aw6vlsClwY+LbhPc
	 VEus+J+keKxsioWhDghG/kkfBJ8E/HrABu6ogQcX/j8aMoWPtN7FBt3NmYNVj3Tffr
	 0v/ySVH+2EvLKMQU8Pn2+qRHzywsMbojz51aujn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 507A6F805C7; Thu,  7 Dec 2023 23:30:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E2B2F8058C;
	Thu,  7 Dec 2023 23:30:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71256F80567; Thu,  7 Dec 2023 23:30:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E54AF800E4
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E54AF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RbfGOGGf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988214; x=1733524214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Y16m8g9pKASh23x6BVQ4S41YSM00CIvjMF1PwQU6IY=;
  b=RbfGOGGfWuqUiLtxMsHFIclz5MuXWTmOtApexsHaOETW852ErR9XDlFH
   JJFVGeFl7Dewvunl5ADAYYmocnUWyYvJumuAuItWgLXqAq1pXs0gv6gll
   4wHWLh38nSuukX1dUTqJ7NFRGlOkkgZzdQjeNz/gVwBXM5ZcREoQ0reQg
   naTepdedQN7FqHWgCXS2ZTJ7AmEQvB99COroMAWXEGUK3nOUpcI19cR6a
   p1PjQOLx+s9Py6/96Q/N4ULzHGHflfNOWCCii9pWUpE+qYQhMJ3nwdpY7
   2Dir57H/NgKfI7wYsdEAKEYs5tfqqTfyIfrvsvctr7pgr2datwK6HPS+a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516574"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516574"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307461"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307461"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:06 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Date: Thu,  7 Dec 2023 16:29:29 -0600
Message-Id: <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EO7JJHJQJZQ4SVZHG2NKQVJGG3PRL5IV
X-Message-ID-Hash: EO7JJHJQJZQ4SVZHG2NKQVJGG3PRL5IV
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EO7JJHJQJZQ4SVZHG2NKQVJGG3PRL5IV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Bulk Register Access protocol was left as a TODO topic since
2018. It's time to document this protocol and the design of its Linux
support.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 Documentation/driver-api/soundwire/bra.rst    | 478 ++++++++++++++++++
 Documentation/driver-api/soundwire/index.rst  |   1 +
 .../driver-api/soundwire/summary.rst          |   5 +-
 3 files changed, 480 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/driver-api/soundwire/bra.rst

diff --git a/Documentation/driver-api/soundwire/bra.rst b/Documentation/driver-api/soundwire/bra.rst
new file mode 100644
index 000000000000..4cc934bf614d
--- /dev/null
+++ b/Documentation/driver-api/soundwire/bra.rst
@@ -0,0 +1,478 @@
+==========================
+Bulk Register Access (BRA)
+==========================
+
+Conventions
+-----------
+
+Capitalized words used in this documentation are intentional and refer
+to concepts of the SoundWire 1.x specification.
+
+Introduction
+------------
+
+The SoundWire 1.x specification provides a mechanism to speed-up
+command/control transfers by reclaiming parts of the audio
+bandwidth. The Bulk Register Access (BRA) protocol is a standard
+solution based on the Bulk Payload Transport (BPT) definitions.
+
+The regular control channel uses Column 0 and can only send/retrieve
+one byte per frame with write/read commands. With a typical 48kHz
+frame rate, only 48kB/s can be transferred.
+
+The optional Bulk Register Access capability can transmit up to 12
+Mbits/s and reduce transfer times by several orders of magnitude, but
+has multiple design constraints:
+
+  (1) Each frame can only support a read or a write transfer, with a
+      10-byte overhead per frame (header and footer response).
+
+  (2) The read/writes SHALL be from/to contiguous register addresses
+      in the same frame. A fragmented register space decreases the
+      efficiency of the protocol by requiring multiple BRA transfers
+      scheduled in different frames.
+
+  (3) The targeted Peripheral device SHALL support the optional Data
+      Port 0, and likewise the Manager SHALL expose audio-like Ports
+      to insert BRA packets in the audio payload using the concepts of
+      Sample Interval, HSTART, HSTOP, etc.
+
+  (4) The BRA transport efficiency depends on the available
+      bandwidth. If there are no on-going audio transfers, the entire
+      frame minus Column 0 can be reclaimed for BRA. The frame shape
+      also impacts efficiency: since Column0 cannot be used for
+      BTP/BRA, the frame should rely on a large number of columns and
+      minimize the number of rows. The bus clock should be as high as
+      possible.
+
+  (5) The number of bits transferred per frame SHALL be a multiple of
+      8 bits. Padding bits SHALL be inserted if necessary at the end
+      of the data.
+
+  (6) The regular read/write commands can be issued in parallel with
+      BRA transfers. This is convenient to e.g. deal with alerts, jack
+      detection or change the volume during firmware download, but
+      accessing the same address with two independent protocols has to
+      be avoided to avoid undefined behavior.
+
+  (7) Some implementations may not be capable of handling the
+      bandwidth of the BRA protocol, e.g. in the case of a slow I2C
+      bus behind the SoundWire IP. In this case, the transfers may
+      need to be spaced in time or flow-controlled.
+
+  (8) Each BRA packet SHALL be marked as 'Active' when valid data is
+      to be transmitted. This allows for software to allocate a BRA
+      stream but not transmit/discard data while processing the
+      results or preparing the next batch of data, or allowing the
+      peripheral to deal with the previous transfer. In addition BRA
+      transfer can be started early on without data being ready.
+
+  (9) Up to 470 bytes may be transmitted per frame.
+
+  (10) The address is represented with 32 bits and does not rely on
+       the paging registers used for the regular command/control
+       protocol in Column 0.
+
+
+Error checking
+--------------
+
+Firmware download is one of the key usages of the Bulk Register Access
+protocol. To make sure the binary data integrity is not compromised by
+transmission or programming errors, each BRA packet provides:
+
+  (1) A CRC on the 7-byte header. This CRC helps the Peripheral Device
+      check if it is addressed and set the start address and number of
+      bytes. The Peripheral Device provides a response in Byte 7.
+
+  (2) A CRC on the data block (header excluded). This CRC is
+      transmitted as the last-but-one byte in the packet, prior to the
+      footer response.
+
+The header response can be one of
+  (a) Ack
+  (b) Nak
+  (c) Not Ready
+
+The footer response can be one of
+  (1) Ack
+  (2) Nak  (CRC failure)
+  (3) Good (operation completed)
+  (4) Bad  (operation failed)
+
+Example frame
+-------------
+
+The example below is not to scale and makes simplifying assumptions
+for clarity. The different chunks in the BRA packets are not required
+to start on a new SoundWire Row, and the scale of data may vary.
+
+      ::
+
+	+---+--------------------------------------------+
+	+   |                                            |
+	+   |             BRA HEADER                     |
+        +   |	                                         |
+	+   +--------------------------------------------+
+	+ C |             HEADER CRC                     |
+	+ O +--------------------------------------------+
+	+ M | 	          HEADER RESPONSE                |
+	+ M +--------------------------------------------+
+	+ A |                                            |
+	+ N |                                            |
+	+ D |                 DATA                       |
+	+   |                                            |
+	+   |                                            |
+	+   |                                            |
+	+   +--------------------------------------------+
+	+   |             DATA CRC                       |
+	+   +--------------------------------------------+
+	+   | 	          FOOTER RESPONSE                |
+	+---+--------------------------------------------+
+
+
+Assuming the frame uses N columns, the configuration shown above can
+be programmed by setting the DP0 registers as:
+
+    - HSTART = 1
+    - HSTOP = N - 1
+    - Sampling Interval = N
+    - WordLength = N - 1
+
+Addressing restrictions
+-----------------------
+
+The Device Number specified in the Header follows the SoundWire
+definitions, and broadcast and group addressing are
+permitted. However, in reality it is very unlikely that the exact same
+binary data needs to be provided to the two different Peripheral
+devices. The Linux implementation only allows for transfers to a
+single device at a time.
+
+In the case of multiple Peripheral devices attached to different
+Managers, the broadcast and group addressing is not supported by the
+SoundWire specification. Each device must be handled with separate BRA
+streams, possibly in parallel - the links are really independent.
+
+Unsupported features
+--------------------
+
+The Bulk Register Access specification provides a number of
+capabilities that are not supported in known implementations, such as:
+
+  (1) Transfers initiated by a Peripheral Device. The BRA Initiator is
+      always the Manager Device.
+
+  (2) Flow-control capabilities and retransmission based on the
+      'NotReady' header response require extra buffering in the
+      SoundWire IP and are not implemented.
+
+Bi-directional handling
+-----------------------
+
+The BRA protocol can handle writes as well as reads, and in each
+packet the header and footer response are provided by the Peripheral
+Target device. On the Peripheral device, the BRA protocol is handled
+by a single DP0 data port, and at the low-level the bus ownership can
+will change for header/footer response as well as the data transmitted
+during a read.
+
+On the host side, most implementations rely on a Port-like concept,
+with two FIFOs consuming/generating data transfers in parallel
+(Host->Peripheral and Peripheral->Host). The amount of data
+consumed/produced by these FIFOs is not symmetrical, as a result
+hardware typically inserts markers to help software and hardware
+interpret raw data
+
+Each packet will typically have
+
+  (1) a 'Start of Packet' indicator.
+
+  (2) an 'End of Packet' indicator.
+
+  (3) a packet identifier to correlate the data requested and
+      transmitted, and the error status for each frame
+
+Hardware implementations can check errors at the frame level, and
+retry a transfer in case of errors. However, as for the flow-control
+case, this requires extra buffering and intelligence in the
+hardware. The Linux support assumes that the entire transfer is
+cancelled if a single error is detected in one of the responses.
+
+Cadence IP BRA support
+----------------------
+
+Format requirements
+~~~~~~~~~~~~~~~~~~~
+
+The Cadence IP relies on PDI0 for TX and PDI1 for RX. The data needs
+to be formatted with the following conventions:
+
+  (1) all Data is stored in bits 15..0 of the 32-bit PDI FIFOs.
+
+  (2) the start of packet is BIT(31).
+
+  (3) the end of packet is BIT(30).
+
+  (4) A packet ID is stored in bits 19..16. This packet ID is
+      determined by software and is typically a rolling counter.
+
+  (5) Padding shall be inserted as needed so that the Header CRC,
+      Header response, Footer CRC, Footer response are always in
+      Byte0. Padding is inserted by software for writes, and on reads
+      software shall discard the padding added by the hardware.
+
+Example format
+~~~~~~~~~~~~~~
+
+The following table represents the sequence provided to PDI0 for a
+write command followed by a read command.
+
+::
+
+	+---+---+--------+---------------+---------------+
+	+ 1 | 0 | ID = 0 |  WR HDR[1]    |  WR HDR[0]    |
+	+   |   |        |  WR HDR[3]    |  WR HDR[2]    |
+	+   |   |        |  WR HDR[5]    |  WR HDR[4]    |
+	+   |   |        |  pad          |  WR HDR CRC   |
+	+   |   |        |  WR Data[1]   |  WR Data[0]   |
+	+   |   |        |  WR Data[3]   |  WR Data[2]   |
+	+   |   |        |  WR Data[n-2] |  WR Data[n-3] |
+	+   |   |        |  pad          |  WR Data[n-1] |
+	+ 0 | 1 |        |  pad          |  WR Data CRC  |
+	+---+---+--------+---------------+---------------+
+	+ 1 | 0 | ID = 1 |  RD HDR[1]    |  RD HDR[0]    |
+	+   |   |        |  RD HDR[3]    |  RD HDR[2]    |
+	+   |   |        |  RD HDR[5]    |  RD HDR[4]    |
+	+ 0 | 1 |        |  pad          |  RD HDR CRC   |
+	+---+---+--------+---------------+---------------+
+
+
+The table below represents the data received on PDI1 for the same
+write command followed by a read command.
+
+::
+
+	+---+---+--------+---------------+---------------+
+	+ 1 | 0 | ID = 0 |  pad          |  WR Hdr Rsp   |
+	+ 0 | 1 |        |  pad          |  WR Ftr Rsp   |
+	+---+---+--------+---------------+---------------+
+	+ 1 | 0 | ID = 0 |  pad          |  Rd Hdr Rsp   |
+	+   |   |        |  RD Data[1]   |  RD Data[0]   |
+	+   |   |        |  RD Data[3]   |  RD Data[2]   |
+	+   |   |        |  RD HDR[n-2]  |  RD Data[n-3] |
+	+   |   |        |  pad          |  RD Data[n-1] |
+	+   |   |        |  pad          |  RD Data CRC  |
+	+ 0 | 1 |        |  pad          |  RD Ftr Rsp   |
+	+---+---+--------+---------------+---------------+
+
+
+Peripheral/bus interface
+------------------------
+
+Regmap use
+~~~~~~~~~~
+
+Existing codec drivers rely on regmap to download firmware to
+Peripherals, so at a high-level it would seem natural to combine BRA
+and regmap. The regmap layer could check if BRA is available or not,
+and use a regular read-write command channel in the latter case.
+
+However, the regmap layer does not have information on latency or how
+critical a BRA transfer is. It would make more sense to let the codec
+driver make decisions (wait, timeout, fallback to regular
+read/writes).
+
+In addition, the hardware may lose context and ask for the firmware to
+be downloaded again. The firmware is not however a fixed definition,
+the SDCA definition allows the hardware to request an updated firmware
+or a different coefficient table to deal with specific environment
+conditions. In other words, traditional regmap cache management is not
+good enough, the Peripheral driver is required track hardware
+notifications and react accordingly.
+
+Abstraction required
+~~~~~~~~~~~~~~~~~~~~
+
+There are no standard registers or mandatory implementation at the
+Manager level, so the low-level BPT/BRA details must be hidden in
+Manager-specific code. For example the Cadence IP format above is not
+known to the codec drivers.
+
+Likewise, codec drivers should not have to know the frame size. The
+computation of CRC and handling of responses is handled in helpers and
+Manager-specific code.
+
+The host BRA driver may also have restrictions on pages allocated for
+DMA, or other host-DSP communication protocols. The codec driver
+should not be aware of any of these restrictions, since it might be
+reused in combination with different implementations of Manager IPs.
+
+Concurrency between BRA and regular read/write
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The existing 'nread/nwrite' API already relies on a notion of start
+address and number of bytes, so it would be possible to extend this
+API with a 'hint' requesting BPT/BRA be used.
+
+However BRA transfers could be quite long, and the use of a single
+mutex for regular read/write and BRA is a show-stopper. Independent
+operation of the control/command and BRA transfers is a fundamental
+requirement, e.g. to change the volume level with the existing regmap
+interface while downloading firmware.
+
+This places the burden on the codec driver to verify that there is no
+concurrent access to the same address with the command/control
+protocol and the BRA protocol.
+
+In addition, the 'sdw_msg' structure hard-codes support for 16-bit
+addresses and paging registers which are irrelevant for BPT/BRA
+support based on native 32-bit addresses. A separate API with
+'sdw_bpt_msg' makes more sense.
+
+One possible strategy to speed-up all initialization tasks would be to
+start a BRA transfer for firmware download, then deal with all the
+"regular" read/writes in parallel with the command channel, and last
+to wait for the BRA transfers to complete. This would allow for a
+degree of overlap instead of a purely sequential solution. As a
+results, the BRA API must support async transfers and expose a
+separate wait function.
+
+Error handling
+~~~~~~~~~~~~~~
+
+The expected response to a 'bra_message' and follow-up behavior may
+vary:
+
+   (1) A Peripheral driver may want to receive an immediate -EBUSY
+       response if the BRA protocol is not available at a given time.
+
+   (2) A Peripheral driver may want to wait until a timeout for the
+       on-going transfer to be handled
+
+   (3) A Peripheral driver may want to wait until existing BRA
+       transfers complete or deal with BRA as a background task when
+       audio transfers stop. In this case, there would be no timeout,
+       and the operation may not happen if the platform is suspended.
+
+BRA stream model
+----------------
+
+For regular audio transfers, the machine driver exposes a dailink
+connecting CPU DAI(s) and Codec DAI(s).
+
+This model is not required BRA support:
+
+   (1) The SoundWire DAIs are mainly wrappers for SoundWire Data
+       Ports, with possibly some analog or audio conversion
+       capabilities bolted behind the Data Port. In the context of
+       BRA, the DP0 is the destination. DP0 registers are standard and
+       can be programmed blindly without knowing what Peripheral is
+       connected to each link. In addition, if there are multiple
+       Peripherals on a link and some of them do not support DP0, the
+       write commands to program DP0 registers will generate harmless
+       COMMAND_IGNORED responses that will be wired-ORed with
+       responses from Peripherals which support DP0. In other words,
+       the DP0 programming can be done with broadcast commands, and
+       the information on the Target device can be added only in the
+       BRA Header.
+
+   (2) At the CPU level, the DAI concept is not useful for BRA; the
+       machine driver will not create a dailink relying on DP0. The
+       only concept that is needed is the notion of port.
+
+   (3) The stream concept relies on a set of master_rt and slave_rt
+       concepts. All of these entities represent ports and not DAIs.
+
+   (4) With the assumption that a single BRA stream is used per link,
+       that stream can connect master ports as well as all peripheral
+       DP0 ports.
+
+   (5) BRA transfers only make sense in the concept of one
+       Manager/Link, so the BRA stream handling does not rely on the
+       concept of multi-link aggregation allowed by regular DAI links.
+
+Audio DMA support
+-----------------
+
+Some DMAs, such as HDaudio, require an audio format field to be
+set. This format is in turn used to define acceptable bursts. BPT/BRA
+support is not fully compatible with these definitions in that the
+format may vary between read and write commands.
+
+In addition, on Intel HDaudio Intel platforms the DMAs need to be
+programmed with a PCM format matching the bandwidth of the BPT/BRA
+transfer. The format is based on 48kHz 32-bit samples, and the number
+of channels varies to adjust the bandwidth. The notion of channel is
+completely notional since the data is not typical audio
+PCM. Programming channels helps reserve enough bandwidth and adjust
+FIFO sizes to avoid xruns. Note that the quality of service comes as a
+cost. Since all channels need to be present as a sample block, data
+sizes not aligned to 128-bytes are not supported.
+
+BTP/BRA API available to peripheral drivers
+-------------------------------------------
+
+ASoC Peripheral drivers may use
+
+   - sdw_bpt_stream_open(mode)
+
+      This function verifies that the BPT protocol with the
+      'mode'. For now only BRA is accepted as a mode. This function
+      allocates a work buffer internally. This buffer is not exposed
+      to the caller.
+
+     errors:
+         -ENODEV: BPT/BRA is not supported by the Manager.
+
+         -EBUSY: another agent is already using the audio payload for
+          audio transfers. There is no way to predict when the audio
+          streams might stop, this will require the Peripheral driver
+          to fall back to the regular (slow) command channel.
+
+         -EAGAIN: another agent is already transferring data using the
+          BPT/BRA protocol. Since the transfers will typically last
+          10s or 100s of ms, the Peripheral driver may wait and retry
+          later.
+
+    - sdw_bpt_message_send_async(bpt_message)
+
+      This function sends the data using the Manager
+      implementation-defined capabilities (typically DMA or IPC
+      protocol). If the message exceeds the size of the buffer
+      allocated in the 'open' stage, the data will be copied and
+      transmitted in multiple chunks using the buffer. This function
+      cannot be called multiple times to queue transfers, the codec
+      driver needs to wait for completion of the requested transfer.
+
+      errors:
+
+         -ENODEV: BPT/BRA is not supported by the Manager.
+
+	 -EINVAL: no resources available.
+
+    - sdw_bpt_message_wait(timeout)
+
+      This function waits for the entire message provided by the codec
+      driver in the 'send_async' stage. Intermediate status for
+      smaller chunks will not be provided back to the codec driver,
+      only a return code will be provided.
+
+      errors:
+
+         -ENODEV: BPT/BRA is not supported by the Manager.
+
+	 -EINVAL: no transfer queued
+
+         -EIO: some sort of transmisson error happened, typically a
+          bad CRC was detected.
+
+	 -ETIMEDOUT: transfer did not complete
+
+    - sdw_bpt_stream_close()
+
+      This functions releases the buffer allocated in the open stage
+      and decreases the refcounts.
+
+      Note that it's possible to call send_async/message_wait multiple
+      times, it's not required to close/open.
diff --git a/Documentation/driver-api/soundwire/index.rst b/Documentation/driver-api/soundwire/index.rst
index 234911a0db99..8d826fd5781f 100644
--- a/Documentation/driver-api/soundwire/index.rst
+++ b/Documentation/driver-api/soundwire/index.rst
@@ -9,6 +9,7 @@ SoundWire Documentation
    stream
    error_handling
    locking
+   bra
 
 .. only::  subproject and html
 
diff --git a/Documentation/driver-api/soundwire/summary.rst b/Documentation/driver-api/soundwire/summary.rst
index 01dcb954f6d7..260a1c78545e 100644
--- a/Documentation/driver-api/soundwire/summary.rst
+++ b/Documentation/driver-api/soundwire/summary.rst
@@ -187,10 +187,7 @@ reconfigurations.
 Future enhancements to be done
 ==============================
 
- (1) Bulk Register Access (BRA) transfers.
-
-
- (2) Multiple data lane support.
+ (1) Multiple data lane support.
 
 Links
 =====
-- 
2.39.2

