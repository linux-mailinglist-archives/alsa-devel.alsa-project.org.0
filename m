Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0861EDEF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 09:57:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C176B83A;
	Mon,  7 Nov 2022 09:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C176B83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667811463;
	bh=Sy+udHQ358tyh2+I8pFvLeKtYKkBFziI4cvLCcZdmbg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EGS9I9zOtvSfn9fHgMDCTvIluFttbJeosS8Wt+5ybn6I2aQOSdt4lAVUx6FHDOIJC
	 X59k1dap9iIGS4vSFEX0w6/rdUDYDuZdwp9E2GoAzGRb6FLmY5+Ywkvgwmz6H7DrEe
	 5JZtYsLP2xaSUDGbz5y8gwuJhXk+XvjOIMUxU+rQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6602EF80116;
	Mon,  7 Nov 2022 09:56:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0E81F804BD; Mon,  7 Nov 2022 09:56:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F149F800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 09:56:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F149F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FSWleOwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811404; x=1699347404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sy+udHQ358tyh2+I8pFvLeKtYKkBFziI4cvLCcZdmbg=;
 b=FSWleOwgSL2po28E6ayCJ0gFz9GTBhp7DqfT4+6yt18eHTLnq9gnqYBF
 S2883SFxrK3XtJnHdXyWuhw5GnASz6bd+prvECECRaNMqU5N0aI3bzsIx
 xrK0kxxe9NFjN6G35LEvphnauAsFV3SPXPu06RV+EbPsLfBILQjj9CKZf
 RbPFcW5pV79pfi+6WuBKTRRYujFpV6jg5OKtBQFoltp2eP8wNpEhpT56J
 QP2yiLZsA7qRTz9hfbIeM0C2sRVDnvJGv+iPrA1l6ojVJZ+NRv+Opsjmf
 GkpoVnGNxST4+W//zi3x7h0snzEn+29VfZyorpFyR0DeU455SFD2RNYrt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372481162"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372481162"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:56:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="635831426"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="635831426"
Received: from akharade-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.14.37])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:56:38 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	chao.song@linux.intel.com
Subject: [PATCH 0/3] ASoC: SOF: ipc4-topology: Add widget queue support
Date: Mon,  7 Nov 2022 10:57:03 +0200
Message-Id: <20221107085706.2550-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
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

Hi,

with SOF topology2 for IPC4, widgets might have mutliple queues they can be
connected.
The queues to use between components are descibed in the topology file.

This series adds widget queue support (specify which pin to connect) for
ipc4-topology with topology2.

Note: currently queue 0 of a widget is used as hardwired default.

Regards,
Peter
---
Chao Song (3):
  ASoC: SOF: Add support for parsing the number of sink/source pins
  ASoC: SOF: Add support to parse pin binding array from topology
  ASoC: SOF: topology: Add helper to get/put widget queue id

 include/uapi/sound/sof/tokens.h |   9 ++
 sound/soc/sof/ipc4-topology.c   | 133 +++++++++++++++++++++---
 sound/soc/sof/sof-audio.h       |  42 ++++++++
 sound/soc/sof/topology.c        | 177 ++++++++++++++++++++++++++++++--
 4 files changed, 340 insertions(+), 21 deletions(-)

-- 
2.38.1

