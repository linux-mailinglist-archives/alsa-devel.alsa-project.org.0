Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACDC5738CA
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 055AC1723;
	Wed, 13 Jul 2022 16:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 055AC1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657722408;
	bh=2Y8BF1Rg345QyJ8e8eE55+o9RRvwy3FhDzVO20P6JmI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DKAd70TkpHe7Zgfi86HSlXoZOIFzvUcvffFcNLOuMBOsdIfJLchmEnlthB2/1jY0Y
	 iNg+Gxzwh0PmZS/c3S4HQigdM9ZQurCUhKH0U7OK2oXG+EOaWzH0FPR5fSjStobn5J
	 xMwrwvftEdPYQ5SaJvxo+38csyMmBJ/9QsleIEB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68087F8047B;
	Wed, 13 Jul 2022 16:25:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F989F80310; Wed, 13 Jul 2022 16:25:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 730B4F80134
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 730B4F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Clh409WJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657722344; x=1689258344;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Y8BF1Rg345QyJ8e8eE55+o9RRvwy3FhDzVO20P6JmI=;
 b=Clh409WJQls6MDNL486sJQztqhcC41rZZN0kKdrcOLLr9MDh1Uny9Of7
 xyLMpe9kpJ7cSohFN0AwopecEu4BxR9PRQHOswOvwvas3IRSFVpScRgwg
 QP3v4vreJYvFKPOwu8WgdxrbWaYH0qLE59lBPVi8qPXKtp6vab0OSN8eM
 OtU27j+ZSbxGFH6frs2GEnwIlzRl5gkp8KYcx34PBa8/L3xpa23caZQoX
 2sAV8dqJ0b00RjorEcCEn+RTv0Cs25600tlVhUyGz1SrLTAgwtXPyshUa
 spFljDFDoo/lBHZiyGp6DxSiUQ6Kt7jHRP8bM5FqWrgb5IOq839geWqMi g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="349195660"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="349195660"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:25:38 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="570643748"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:25:37 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/3] soundwire: allocate device_number with IDA
Date: Wed, 13 Jul 2022 22:25:26 +0800
Message-Id: <20220713142529.17323-1-yung-chuan.liao@linux.intel.com>
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

The device_number is currently allocated in the scope of each bus and does
not need to be unique at the system level.
This leads e.g. on Dell devices with three or four Device1 on different
bus segments. To make the device_number unique at the system level, and
unified with the HDaudio/iDISP SDI values, this PRs allocates the
dev_number with an IDA restricted between 4 and 11 (inclusive).

Pierre-Louis Bossart (3):
  soundwire: bus: rename sdw_ida as sdw_bus_ida
  soundwire: bus: allow device number to be unique at system level
  soundwire: intel: set dev_num_ida_min

 drivers/soundwire/bus.c       | 29 ++++++++++++++++++++---------
 drivers/soundwire/intel.c     |  4 ++++
 include/linux/soundwire/sdw.h |  4 ++++
 3 files changed, 28 insertions(+), 9 deletions(-)

-- 
2.25.1

