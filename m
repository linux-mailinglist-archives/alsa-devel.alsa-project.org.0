Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1D7F9F3E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 13:07:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 072597F8;
	Mon, 27 Nov 2023 13:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 072597F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701086835;
	bh=xIC41fFBzmKznL9WIQam10RoJy2/XeapkxNoaEOHH84=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RyTIPaePb3dIMb4MdGD/pgcbZQ4XvZkBByvvuVhPBhVNYGxJl+V1xfEHwixrvsPZG
	 tLyZ4fcxLLc/bnMeSsibPDis0JUsuTtG8A82MNt6esk46bKhLpjo5NMfwmtdhat1B7
	 ClOOA6RdmhuuiInROpE34fXxPzNkFZREQxEu5srg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3941F805D5; Mon, 27 Nov 2023 13:06:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 278CEF80578;
	Mon, 27 Nov 2023 13:06:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4873AF80246; Mon, 27 Nov 2023 13:06:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32B65F80104
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 13:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32B65F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QMuA+Olh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701086792; x=1732622792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xIC41fFBzmKznL9WIQam10RoJy2/XeapkxNoaEOHH84=;
  b=QMuA+OlhrzEW9mFeJVjFpRKOe8rDcEjjG+4Q9vymrS1sadPQaFO/pPM2
   wdsoJ8DlmvM6gJk115oNLHSo5Mk4yYgK9tLY6lNWXQSYg9FWGYqNP3xmG
   JX0DJ8/UidwoaqnFrMxUQRptR3qo/IDAJhe+qoO5jApLRy051lbWJNW8d
   epgSZsUxZJ1RBnix6vM/vIVkAYaoqQzp79fmXUg4Wqj85q2RnJXvgNbO/
   aBS0wDhUOoH4n8FmpMcs6lRWMXyWvaEnIHlpX2TpjDNRthdsp0DYcZsuL
   Bz3aK6R+BD1tfsQF+t1jnMiPKKDYcqkYNC2jDEBedVkV17WE/YDggffYb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14249587"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="14249587"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 04:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="859035570"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="859035570"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 04:06:22 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	brent.lu@intel.com
Subject: [PATCH 0/2] ALSA/ASoC/SOF: SSP dev_type support
Date: Mon, 27 Nov 2023 14:06:55 +0200
Message-ID: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7NX6FIYTKP7DIPPRLNQWVU2QGEGLML2R
X-Message-ID-Hash: 7NX6FIYTKP7DIPPRLNQWVU2QGEGLML2R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NX6FIYTKP7DIPPRLNQWVU2QGEGLML2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

SOF always passed 0 as dev_type to intel_nhlt_get_endpoint_blob() when looking
up the blob from the NHLT table. This causes issues since alsa-utils commit
3a47ef2487ed ("topology: nhlt: intel: support more device types and directions")

The dev_type is no longer always 0 in the topology embedded NHLT table resulting
lookup failures for analog codecs since they will have dev_type=4.

With SOF the dev_type is not used, we always use the SSP port index for looking
up the configuration blob.

The solution for the issue is to fetch the dev_type for the SSP port and feed it
back to the intel_nhlt_get_endpoint_blob() to be able to find the configuration
regardless of the assigned dev_type.


Regards,
Peter
---
Brent Lu (2):
  ALSA: hda: intel-nhlt: add intel_nhlt_ssp_device_type() function
  ASoC: SOF: ipc4-topology: support NHLT device type

 include/sound/intel-nhlt.h    | 10 ++++++++++
 sound/hda/intel-nhlt.c        | 26 ++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.c | 19 ++++++++++++++++---
 3 files changed, 52 insertions(+), 3 deletions(-)

-- 
2.43.0

