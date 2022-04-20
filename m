Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C987E507EDA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 04:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49E5A18E9;
	Wed, 20 Apr 2022 04:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49E5A18E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650422047;
	bh=P/LF63BZojFF1TydFmx94mDoFedoUAjUhNq7cH5d2nc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CrRH+iaSktwIRaTt+E1DbnT3g1tt1rus+Y/R7jBhDmD0mKyfkYMV3ipX4zrL0roMs
	 9fOUsl3dNT4v5pNmq1ONftsXPyEkhroRQYhgtha2e4ob3umQlJ1a0k/5QGJPAdIBhR
	 tAfUz1tXv+dGRP2I8RkCjxO9R/U4H+wsa2RXLFlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 437E2F80246;
	Wed, 20 Apr 2022 04:33:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D900F800F8; Wed, 20 Apr 2022 04:33:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97DAFF800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 04:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97DAFF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FNvfq8lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650421983; x=1681957983;
 h=from:to:cc:subject:date:message-id;
 bh=P/LF63BZojFF1TydFmx94mDoFedoUAjUhNq7cH5d2nc=;
 b=FNvfq8lziaieFQwz+Q4YoW7p0i0GtnRcj3cLXxx3NjRfxxsVkqyZWPTO
 jpolVWt3TKGQ4jzv7Hyr/17o1MEHbqpbf2UqtwLHu4tCWNQAVzxHh8Qab
 usuRIYmhanyd3GTY7aI/J9+dbdOpGbAzedVz8CBvNo9ecx0asVbq125gU
 mVqBFn/ydS0gZqXUka3rQcsnNrPZ10iG1FxwekHiwTegoC85h7lxAff3B
 HEBTKrr/Ig82womJc9vqo1i5BcC9LlmHiyx4UTJQipL+TkDDGgGanfDnU
 GuzhbfN8bdyp3NPFW8vkHpTb9498Noo8e0dO2AaSUS9gpuBEtP02aGrqx g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263384308"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="263384308"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 19:32:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="529554550"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 19:32:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/3] soundwire: pm runtime improvements
Date: Wed, 20 Apr 2022 10:32:38 +0800
Message-Id: <20220420023241.14335-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

This series provides a solution to solve a corner case issue where the
manager device may become pm_runtime active, but without ALSA/ASoC
requesting any functionality from the peripherals. In this case, the
hardware peripheral device will report as ATTACHED and its initialization
routine will be executed. If this initialization routine initiates any
sort of deferred processing, there is a possibility that the manager could
suspend without the peripheral suspend sequence being invoked: from the
pm_runtime framework perspective, the peripheral is *already* suspended.

Pierre-Louis Bossart (3):
  soundwire: intel: prevent pm_runtime resume prior to system suspend
  soundwire: intel: disable WAKEEN in pm_runtime resume
  soundwire: bus: pm_runtime_request_resume on peripheral attachment

 drivers/soundwire/bus.c   | 12 ++++++++++++
 drivers/soundwire/intel.c |  6 ++++++
 2 files changed, 18 insertions(+)

-- 
2.17.1

