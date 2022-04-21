Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C8150A5DA
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 18:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E0C1654;
	Thu, 21 Apr 2022 18:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E0C1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650558919;
	bh=aOo6+ogMmF9Q9DLVbt9gTEpSlsX+VQadsVrOQ/jrPnU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jVEsMDoZkxrixVHLbp/GVW0C7aRPHWzQsA7z1FYVf3Z2LTImuU3FAvfID+k7Ry86Z
	 JLk0RtwQCs0Je3GGrEHOE6HBpZC10Uu8apv4FdliTIsHNp9a/IGiNAFDzDf0P2zsx1
	 PqI6IFGVzXYR9BN65GopNtALsiyupvHfAXPRqA5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2305AF8047D;
	Thu, 21 Apr 2022 18:34:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48FF0F8032D; Thu, 21 Apr 2022 18:34:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C6C9F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6C9F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gumscKiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650558857; x=1682094857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aOo6+ogMmF9Q9DLVbt9gTEpSlsX+VQadsVrOQ/jrPnU=;
 b=gumscKiTCL1yti1OPCr54kjoIGMkDbMU5W2iKC77A3fAItYJ7tAhOCPn
 seeHv//9Vwg/PRdHvrgwbMavuKJXJVuLcsWscoqY2b/ShTbW2h40g7la/
 rtkb/zUxiVhzNOKMbp4BV3b52TA0EBQjo23hl+kY51HPy7VIVru+cR7c4
 rCAmtTCA6f2hD9UCQ2ciU7v0+Ev9clT5mO5Ex2qEwS9/Hh1LIhWGEAzPn
 IGH4WIVjbvJtzDIEiMhIEuArR0iSVdMzbsH82g1mX8fpdrFw9IQbH0p2M
 s0Q9pOPmDG3W9sSHPI03iohenMtguJiXVA4eEHiBxwwyVnz8shje0XzTD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246310242"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="246310242"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:34:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="614980736"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:34:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: SOF: pci: add quirks and PCI IDS
Date: Thu, 21 Apr 2022 11:33:54 -0500
Message-Id: <20220421163358.319489-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Add two PCI IDs and quirks for APL Chromebooks and Intel IPC4
selection for developers.

Gongjun Song (1):
  ASoC: SOF: Intel: pci-tgl: add RPL-P support

Muralidhar Reddy (1):
  ASoC: SOF: Intel: pci-tgl: add ADL-PS support

Pierre-Louis Bossart (1):
  ASoC: SOF: sof-pci-dev: don't use the community key on APL Chromebooks

Rander Wang (1):
  ASOC: SOF: pci: add ipc_type override for Intel IPC4 tests

 sound/soc/sof/core.c          |  7 ++++++
 sound/soc/sof/intel/pci-tgl.c |  6 +++++
 sound/soc/sof/sof-pci-dev.c   | 45 ++++++++++++++++++++++++++++++++++-
 3 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.30.2

