Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9504F7BB376
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 10:47:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 133A61E4;
	Fri,  6 Oct 2023 10:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 133A61E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696582061;
	bh=VG3aCr6mV5q4NPBrYY00pvU6MR58McuKNhltpn7Iaf4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=axUVOHe+gJ93QBv4kXnH/N6e0QU4visI/PpzK9ou3UnBEl5mcjB6HU23qsh4lmCBB
	 u0gg4Sxlwvoq5OGjpTvG+TcHzZexVXmA8qL02ZabvP6tvCV3682buFayaCFaVeYHcT
	 fI3puwSgF1vmSvjsCCXSfhpvUbNEMwJ5EDcblUVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0809DF80563; Fri,  6 Oct 2023 10:46:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D954F8055B;
	Fri,  6 Oct 2023 10:46:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E54FDF8047D; Fri,  6 Oct 2023 10:45:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFDDDF801EB
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 10:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFDDDF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m1H4mvmS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696581936; x=1728117936;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VG3aCr6mV5q4NPBrYY00pvU6MR58McuKNhltpn7Iaf4=;
  b=m1H4mvmSBzgQSn6X05gv1mqWjC+1LG19/QQxPkdIZbe/r2toCq6owWTt
   10+BBRs+b14jabOYsbxIu9dON6iY6HkCP3NTU2vhc6T4C16VGZNtNM96O
   KHSnpEV0eundzzpbEHVGL0f2p+ZKY42H6M91l5sBE77vKHN60ECgVDJfS
   mWcZd3B0WC/As3a8H3lqfyjZmcg27BYKNf31esIlCqxnVsP4V1W3Gye2J
   ysfoVRvJ8/ZNefRPQ7B3ifDXlJxMd56fboBFim2HqUlio6LslivUzMM2K
   C5m8eFWBXYTkURx2GEAfzvj6G3R2RfXnQo/D+Qa5OBPBbv2MQRgGhKBc6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="5263805"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="5263805"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="868266277"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="868266277"
Received: from mesalamy-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.42.190])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:44:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH 0/2] ASoC: SOF: ipc4: Take priority into cosideration when
 sorting pipelines
Date: Fri,  6 Oct 2023 11:44:52 +0300
Message-ID: <20231006084454.19170-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WRLNUQPYWCB755TQFMAR35B5RZZ33M3F
X-Message-ID-Hash: WRLNUQPYWCB755TQFMAR35B5RZZ33M3F
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRLNUQPYWCB755TQFMAR35B5RZZ33M3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Add pipeline priority support for IPC4: Add support for parsing pipeline
priorities from the topology. This will be used to break the tie between
pipelines to set the trigger order when multiple pipelines are triggered
simultaneously.

Regards,
Peter
---
Rander Wang (2):
  ASoC: SOF: IPC4: get pipeline priority from topology
  ASoC: SOF: IPC4: sort pipeline based on priority

 sound/soc/sof/ipc4-pcm.c      | 55 +++++++++++++++++++++++++++++------
 sound/soc/sof/ipc4-topology.c |  5 ++--
 2 files changed, 48 insertions(+), 12 deletions(-)

-- 
2.42.0

