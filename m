Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3AF5BE983
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 17:02:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F91186F;
	Tue, 20 Sep 2022 17:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F91186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663686155;
	bh=gWaxfyJ+dks25OJtU69CxQSENKPTsMvk1eAGI2JUxkg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qaom7CVzmIp6ytdNlfzeQ05InC7bYCuz9YP147HDPmfWPn1yo0mgQtOAnTCSfWNB4
	 GYV47D0FFjcdte9Y9JOwqAfnFCX+WrxDZEHMIgPfMne95MwkMYLR6p2fGvGNKbqUh4
	 npOM5EVAwR8XMP2vihPrjR8a4PBz+TVGiF695xB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12713F80155;
	Tue, 20 Sep 2022 17:01:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91957F801D5; Tue, 20 Sep 2022 17:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00645F80155
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 17:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00645F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WYAz7KK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663686092; x=1695222092;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gWaxfyJ+dks25OJtU69CxQSENKPTsMvk1eAGI2JUxkg=;
 b=WYAz7KK3CpVTkcJcA/793wnK6GLgojGIRaAaU+mKZ9jLv5FB1hv+V5KT
 1cToeOfYTdtrikbM1dyVpJZAMidQyzOKPjRvJpjZaBSwivP4Yrpc/p7Os
 XUyleXarP9XegOGPbRDBktSSnC/Nv7g3Oj24bcpCzUUhg0+3nxp3I2U6g
 aXHlVQIrP4DycrVSBoCXvTAMq7ueJb2Ig6mJdzDFhyrHRtwXtyLrXXi9R
 1QdktzNvwFSGrsiuUxE1yuM5f8Y92U82jdpMLZfwBC8DGflQfP2aOXopm
 nnaKnnOcAGZIN6t9OfGCk4Nq8gLusclwZMB/Z2WKLWdHfcTsLkTWo0YxV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="280097330"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="280097330"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 08:01:27 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="687443676"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.209.87])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 08:01:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: SOF: sof-audio: fix prepare/unprepare
Date: Tue, 20 Sep 2022 17:01:05 +0200
Message-Id: <20220920150107.2090695-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

2 patches from Rander required to enable mixing usages with multiple
pipelines.

Rander Wang (2):
  ASoC: SOF: clear prepare state when widget is unprepared
  ASoC: SOF: don't unprepare widget used other pipelines

 sound/soc/sof/sof-audio.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.34.1

