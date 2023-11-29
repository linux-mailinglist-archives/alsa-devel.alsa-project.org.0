Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F47FD7A6
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 14:14:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FE05844;
	Wed, 29 Nov 2023 14:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FE05844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701263658;
	bh=PiVe9U4U1W5hG4xscPTKgCHmOs8bL4bJ2WtBt7pjeWU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=afD7Db2Qn4uid0iR1lliTrM0/632NHikbc5i0lX5QIRx4xtLX3qXGcetE1AhARV36
	 Lc6Vq+rOnJmyfe+Y1YK0qoUv2e5poJcJipA0OQjBsmU5nGZgQHwYrxfFzgxcf45SC/
	 CuBoKcAmw+6mZPqyAji809dei8B/UgNhDKLR7ukU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A9C0F8007E; Wed, 29 Nov 2023 14:13:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E655CF80567;
	Wed, 29 Nov 2023 14:13:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DE31F8007E; Wed, 29 Nov 2023 14:13:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F39F2F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 14:13:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F39F2F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hWsL4SvH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701263624; x=1732799624;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PiVe9U4U1W5hG4xscPTKgCHmOs8bL4bJ2WtBt7pjeWU=;
  b=hWsL4SvH4+MnY6E43A3oCSWdHJs0iG/hSWJOG/utagQ7EkCKCUHAC8HT
   8/eKCYkvkuFqNdYG30BVLihIK4hRzde8MRwqwu6oJ1P5XA8bYTg8Q7cQ4
   qmioh6KfLPq2qqbk0oWvDMp440RwnnCOUQbr143dwUTVbCpqkDT225nul
   /r4Ksir6RPRK6M3IEApxtkv8XwKxhhdiS5vOMQBqyEtiqD/MIogTWRDif
   KlC5luaGstoSJ/JaOG8tIIrx19Q2VMbgdfYAxK3aAf4/pPSoe24v285bD
   +fwYDHKBwRyRzdCbYf86GJaeTgpxICPiS8I7Sjksgs5CeBy3E9kZfBA6T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383553817"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="383553817"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 05:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="912850181"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="912850181"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 05:13:35 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: ipc4-topology: Correct IPC message struct
 layouts
Date: Wed, 29 Nov 2023 15:14:09 +0200
Message-ID: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2SBRAM5V2BIXCUAA3BZJE5BOWOSU7QWA
X-Message-ID-Hash: 2SBRAM5V2BIXCUAA3BZJE5BOWOSU7QWA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SBRAM5V2BIXCUAA3BZJE5BOWOSU7QWA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The SRC and GAIN module defined it's kernel side private struct in a way that
part of that is used as IPC message without making sure of proper alignment and
padding, which happens to work but it is better to be not 'clever' about these
sort of things.

The two patch corects this overlooked detail.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: ipc4-topology: Correct data structures for the SRC module
  ASoC: SOF: ipc4-topology: Correct data structures for the GAIN module

 sound/soc/sof/ipc4-control.c  | 20 +++++++-------
 sound/soc/sof/ipc4-topology.c | 52 +++++++++++++++++------------------
 sound/soc/sof/ipc4-topology.h | 34 +++++++++++++++++------
 3 files changed, 61 insertions(+), 45 deletions(-)

-- 
2.43.0

