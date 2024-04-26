Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D85648B3BC6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:39:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A4DB6A;
	Fri, 26 Apr 2024 17:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A4DB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145996;
	bh=eM/sttqnYNYtqvj+qs1fjCmYwwwzfirvpY5itd0R1kI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KV2Y9bP1fzaik7Vz13N9uHyScUkIqkcUjq1C1CARs4aWDvbSQ+4GYP3IFbUZQDE6n
	 jTpU5+aK231+HMsQGBEjCnxdYKx7iI/Sz1zGF3H9d0EzA2tqBYgsAu14oTH7647RKH
	 VtNqU6jhnM5yxSs7FjEOJtqoz/jRwSUXvxLhiR5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F77AF80587; Fri, 26 Apr 2024 17:39:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23052F805A0;
	Fri, 26 Apr 2024 17:39:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41694F8045D; Fri, 26 Apr 2024 17:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E59ACF8003A
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E59ACF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TSvbUeN+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145955; x=1745681955;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eM/sttqnYNYtqvj+qs1fjCmYwwwzfirvpY5itd0R1kI=;
  b=TSvbUeN+EkE2kDE8TxVdNHKYtaALMQWc/5BIBZmbXKlnVpzJxZE+Zo1O
   Agk46jxrnkxgWVjXcCbRScXAuvPW4umh3SFSsKY7HT5dJH0ZSX2whmYBI
   4voF3ANz69/otntYzRxpk6K+B5rj+eIDLxDzZMu6XWmBdc1TfGAT5NxA0
   P9U94dNK7KglgZCN6CJ4CVkg4x9lsbVr+/zTxaRBt4gFuRUuXDf1odw36
   WcN5r9diPzEYp6O49iVQ/U7ZCgKy0MxS91ROmE4XxvTGHjmeamRInpAUf
   Hp8HsstqPGpV7KyCoMwAo383vP9qQT949Q0j4I91JfP0Vq0HVZMzMvVqF
   A==;
X-CSE-ConnectionGUID: VwE+28enSEqLQMblyHb3zQ==
X-CSE-MsgGUID: cDhLMwHfSgqh5JZq8aRoCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718428"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="9718428"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:10 -0700
X-CSE-ConnectionGUID: vuhXo5NPT1GQZobhfCYJdg==
X-CSE-MsgGUID: O0vOHuzxQwW5Ph6otZtkwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="56623531"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/5] ASoc: SOF: misc updates for 6.10
Date: Fri, 26 Apr 2024 10:38:57 -0500
Message-Id: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LOQLIEADTCMNO5UOXXN5FDXZYET7GWKG
X-Message-ID-Hash: LOQLIEADTCMNO5UOXXN5FDXZYET7GWKG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOQLIEADTCMNO5UOXXN5FDXZYET7GWKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixes when fw_lib_prefix is not set, updated error messages, improved
dmesg logs to SoundWire configurations not supported by ACPI
tables/topology and support for IEC61937 passthrough.

Peter Ujfalusi (2):
  ASoC: SOF: debug: Handle cases when fw_lib_prefix is not set, NULL
  ASoC: SOF: ipc4-topology: Advertise passthrough capable PCMs (using
    ChainDMA)

Pierre-Louis Bossart (2):
  ASoC: SOF: Intel: hda: simplify and reduce indentation for
    hda_sdw_machine_select()
  ASoC: SOF: Intel: hda: list SoundWire peripherals on mismatch

Yong Zhi (1):
  ASoC: SOF: topology: remove incorrect widget id in error message

 sound/soc/sof/debug.c         |  23 ++++-
 sound/soc/sof/intel/hda.c     | 154 +++++++++++++++++++---------------
 sound/soc/sof/ipc4-topology.c |  50 +++++++++++
 sound/soc/sof/topology.c      |   7 +-
 4 files changed, 160 insertions(+), 74 deletions(-)

-- 
2.40.1

