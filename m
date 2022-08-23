Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C798459D084
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 07:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BC7C3E8;
	Tue, 23 Aug 2022 07:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BC7C3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661232987;
	bh=PsN5V3CIeVtDCk84BpPh+cydDpOnRZudvadHlLgeH+8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QKjVhEHbdtqXgkrO6BaV+d2oWRTDCpBIT3LShh9QPo2FKeSczgCyxLIjbwPU2oFo6
	 Tj4JP/yPGqn247sCGKRHxhWaRtjjfbQ9UyqEb46hluJ6DxEN7SojbSXvAXayJuifwn
	 EG/JtE7IKIC7jePt8er1xSqocYochPG9UIE45aAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB934F80152;
	Tue, 23 Aug 2022 07:35:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55100F8027B; Tue, 23 Aug 2022 07:35:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 027A5F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 027A5F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a21oug4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661232924; x=1692768924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PsN5V3CIeVtDCk84BpPh+cydDpOnRZudvadHlLgeH+8=;
 b=a21oug4+IuiDiLXrou8bbHgQLRTUA/itArvl3pRXIXRPO+n6+mUUUewv
 QV9TxaPIPC65JVwf3f/97mRvkv8wkRZlimq5//dMNt9NHQT84i4nWzPSf
 3hfKse+xlEMZe/fF060Xgrbi3r868ODGVW5GKtR52mb3qCZhd1a0GiMCU
 aVh9xmxD3pEftrJ5+6QKKGKwoYR9ofNhZwsxtg4Yt9sv92C0s4Yr9iM+S
 g2lMjDyBKn6MmkbsL1l6J9NRzsxX6Gq98ts8fuW6R2nqf9JA5XXzUOj7H
 MmIRPkAdPRVYcuu7xa5S7/9i2lr6dKqq5fwX0HIbSUblQ6uUfcFPQeGFo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273349225"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273349225"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="698558234"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:50 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 00/11] soundwire: register cleanups
Date: Tue, 23 Aug 2022 13:38:35 +0800
Message-Id: <20220823053846.2684635-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

Clean-up and reorder/regroup SoundWire SHIM registers.

Pierre-Louis Bossart (11):
  soundwire: intel: cleanup definition of LCOUNT
  soundwire: intel: regroup definitions for LCTL
  soundwire: intel: remove IPPTR unused definition
  soundwire: intel: cleanup SHIM SYNC
  soundwire: intel: remove unused PDM capabilities
  soundwire: intel: add comment for control stream cap/chmap
  soundwire: intel: cleanup PCM stream capabilities
  soundwire: intel: cleanup PCM Stream channel map and channel count
  soundwire: intel: cleanup IO control
  soundwire: intel: cleanup AC Timing Control
  soundwire: intel: cleanup WakeEnable and WakeStatus

 drivers/soundwire/intel.c           |  5 +--
 drivers/soundwire/intel_init.c      |  2 +-
 include/linux/soundwire/sdw_intel.h | 63 +++++++++++++++++------------
 3 files changed, 41 insertions(+), 29 deletions(-)

-- 
2.25.1

