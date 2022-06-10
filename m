Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6653545A26
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 04:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FBFF20FD;
	Fri, 10 Jun 2022 04:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FBFF20FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654828629;
	bh=p7WLU+IK69OBzOtjzZZocvi403jXX7hShBwzlKgpaEc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pn1rPHdhs8OZ9oDnd1PRO+zj0+Se7evjfYhjnlvp/HKduTgG+7pbjYunv40aOso8V
	 ZqiTKL0Pevs7AkoaTnsS+gWnO/DRTQQT1aGIHg7J8+rAGBLepMMXT1XKKMXU+4cVl6
	 tYL4+q2hbDPXJTS1PiglO+ZrkK0CBGz0wEPUdaJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B01BCF804E7;
	Fri, 10 Jun 2022 04:36:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ADBAF804D8; Fri, 10 Jun 2022 04:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C108DF800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 04:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C108DF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZvyIMwGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654828564; x=1686364564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p7WLU+IK69OBzOtjzZZocvi403jXX7hShBwzlKgpaEc=;
 b=ZvyIMwGJ7+bgPj7brSAqHS0Xwp+sN4Xx1lBDhfJyypVYsKA6tgVS3NSk
 iPsOC+ifPy4G+8T6w7eo3LtEb2rOp9R9H8KsRSQVtE7nRNujcI0E3GLTH
 DhSK56nisPseUBz4w3OYYem+EZvUkY0VRItoTKZCWS6IbBcJ630V6FQMO
 0imLvx157tv+QbWx+ubhsuGfXbm5cArmHpgUgIBSXBQZLvgl43gWjQ1fy
 J1ueVeuipnYIE4QG37nqR01hKAhT1ncS2gn3cbjfsijy22gvWSQtRwhjO
 i5cq69IxpZkJQnr7QZTElIAT/eoI+uoDHuQocWII5n4yzEy/8oQKEUX6m Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266258662"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="266258662"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 19:35:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="637874939"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 19:35:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/2] soundwire: Intel: add trigger callback
Date: Fri, 10 Jun 2022 10:35:35 +0800
Message-Id: <20220610023537.27223-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

The .trigger callback will be used in ASoC.
Hi Vinod, Could you provied a tag so that Mark can take the tag to
his tree?

Bard Liao (1):
  soundwire: Intel: add trigger callback

Pierre-Louis Bossart (1):
  soundwire: intel: uniquify debug message

 drivers/soundwire/intel.c           | 36 ++++++++++++++++++-----------
 include/linux/soundwire/sdw_intel.h |  1 +
 2 files changed, 23 insertions(+), 14 deletions(-)

-- 
2.17.1

