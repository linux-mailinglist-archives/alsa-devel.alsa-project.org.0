Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9A99737B2
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 14:40:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3171EAE8;
	Tue, 10 Sep 2024 14:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3171EAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725972050;
	bh=7o36PvgCdrSW8nk+DV+ultIJNeDQiKY0NK8w0v6rQOM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vBru/0klKg6GVr66cPs4EBcYW/RZNIb6804xh/UHNUas+/KdpzLQpmo1gCOvOfKrh
	 LJ2UCfhk/9x7QrnrFlyWAmLktdvXyH07HG6EbKTEZzUtD33Ja4fweJyBCbcXxCUkQC
	 D+3+DmKYR2GUk/kS/5shD2RamgNBuvWnHoG6FDQc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B5A3F805AE; Tue, 10 Sep 2024 14:40:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C316F804FC;
	Tue, 10 Sep 2024 14:40:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CF76F801F5; Tue, 10 Sep 2024 14:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC79BF800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 14:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC79BF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a51ub8V2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725972011; x=1757508011;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7o36PvgCdrSW8nk+DV+ultIJNeDQiKY0NK8w0v6rQOM=;
  b=a51ub8V2l1NaaisuipFVBcW8VmbpzFW4r3RgECOaE1EC93btksc+3CkF
   7Jdq1xcDN8gc8iHF+wTSLb7AYEOJdPVstNc0UsO67lwnAKVk53wgEfVjW
   VZgmVuWZ5+pHA0rR+WSNvAR3+2FOAb8Gj2xVZ/YsMJGECqeUYzBMUKmy6
   VPFkMb0HdPQiX86ARvjayclo/i/5awGgQu5eTjyS2cYKODSgbd1AnmOFU
   a5kI8ARIUqh6PLa8gtoQnJ6wRTfOHmHgtovSDNaBNHNHrTQa0bc62nTV7
   9MTEBcn44uVGCi+pRF0QqsJnzquO9lIYIE232MUXBWlPEDzi560EGb8EJ
   w==;
X-CSE-ConnectionGUID: F/0TUQpWRse0zYMT6aT09Q==
X-CSE-MsgGUID: 5i4dT8RxT9K9HunZn6ax3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28605852"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600";
   d="scan'208";a="28605852"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 05:40:05 -0700
X-CSE-ConnectionGUID: 2jmppOX+Ty+/TnGLgBojPA==
X-CSE-MsgGUID: jsKw4KNuR/yTnGgG0wVynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600";
   d="scan'208";a="67260782"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.intel.com) ([10.245.245.155])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 05:40:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	krzysztof.kozlowski@linaro.org
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH stable-6.10 regression] Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
Date: Tue, 10 Sep 2024 15:40:09 +0300
Message-ID: <20240910124009.10183-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QOX77M7GUTF3BB43EZS7C4LZW4ZHCABY
X-Message-ID-Hash: QOX77M7GUTF3BB43EZS7C4LZW4ZHCABY
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOX77M7GUTF3BB43EZS7C4LZW4ZHCABY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The prop->src_dpn_prop and prop.sink_dpn_prop is allocated for the _number_
of ports and it is forced as 0 index based.

The original code was correct while the change to walk the bits and use
their position as index into the arrays is not correct.

For exmple we can have the prop.source_ports=0x2, which means we have one
port, but the prop.src_dpn_prop[1] is accessing outside of the allocated
memory.

This reverts commit 6fa78e9c41471fe43052cd6feba6eae1b0277ae3.

Cc: stable@vger.kernel.org # 6.10.y
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

The reverted patch causes major regression on soundwire causing all audio
to fail.
Interestingly the patch is only in 6.10.8 and 6.10.9, not in mainline or linux-next.

soundwire sdw-master-0-1: Program transport params failed: -22
soundwire sdw-master-0-1: Program params failed: -22
SDW1-Playback: ASoC: error at snd_soc_link_prepare on SDW1-Playback: -22

Regards,
Peter 

 drivers/soundwire/stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 00191b1d2260..4e9e7d2a942d 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1286,18 +1286,18 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
 					    unsigned int port_num)
 {
 	struct sdw_dpn_prop *dpn_prop;
-	unsigned long mask;
+	u8 num_ports;
 	int i;
 
 	if (direction == SDW_DATA_DIR_TX) {
-		mask = slave->prop.source_ports;
+		num_ports = hweight32(slave->prop.source_ports);
 		dpn_prop = slave->prop.src_dpn_prop;
 	} else {
-		mask = slave->prop.sink_ports;
+		num_ports = hweight32(slave->prop.sink_ports);
 		dpn_prop = slave->prop.sink_dpn_prop;
 	}
 
-	for_each_set_bit(i, &mask, 32) {
+	for (i = 0; i < num_ports; i++) {
 		if (dpn_prop[i].num == port_num)
 			return &dpn_prop[i];
 	}
-- 
2.46.0

