Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93E22241E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 15:42:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A0161662;
	Thu, 16 Jul 2020 15:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A0161662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594906924;
	bh=Yyy+Mx02i1R6ge7Qy6tM8AAZ9IRur5m0gPPl6sXfDJE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aWIfzLAxu1UNRLDlAGErxEFczsXoMEhHnho9eqhd2zeqBac/9jJVKeI09GWWQjSKF
	 Hg+jNZTHbrsrrXfGeGZ7XWX7Lmt5YKtB/vrCBXiU2xBz41hPAUmY0qbUPubs5igaJV
	 Zq3waRmqiQqGANxknPBT8FcA0ZpfsiVdzXhhXftw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5B42F8014E;
	Thu, 16 Jul 2020 15:40:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADA6EF801EC; Thu, 16 Jul 2020 15:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBA07F80110
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 15:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBA07F80110
IronPort-SDR: pvcFdbh66qU1wd1i/JUQOxInpkYZFsxFkfZZYnAEvhSaVgj1jjd/GHgT0hOMyQsXTSJoP19bj+
 6D2QOyMBAVAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="129447528"
X-IronPort-AV: E=Sophos;i="5.75,359,1589266800"; d="scan'208";a="129447528"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 06:40:09 -0700
IronPort-SDR: uG0DquBthR8tVISK6q0ZAOhyxFq7Pnx2z/01dKX/xXoTErlW7OVLVLilD6ZKiJQG+PdmRxYaL2
 p6HgZVsiXl5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,359,1589266800"; d="scan'208";a="286483239"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by orsmga006.jf.intel.com with ESMTP; 16 Jul 2020 06:40:07 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] topology: hda-dsp: Change processing domain of srcintc module
 to LL
Date: Thu, 16 Jul 2020 15:40:32 +0200
Message-Id: <20200716134032.31858-1-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 tiwai@suse.com
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

In order to make this topology universal for all FW branches,
change the processing domain of srcintc module from DP to LL.

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
---
 topology/hda-dsp/skl_hda_dsp_generic-tplg.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/topology/hda-dsp/skl_hda_dsp_generic-tplg.conf b/topology/hda-dsp/skl_hda_dsp_generic-tplg.conf
index 32ba9a7..ed2ea80 100644
--- a/topology/hda-dsp/skl_hda_dsp_generic-tplg.conf
+++ b/topology/hda-dsp/skl_hda_dsp_generic-tplg.conf
@@ -1684,7 +1684,7 @@ SectionVendorTuples."media0_in srcintc 0" {
         SKL_TKN_U32_PIPE_PRIORITY "0"
         SKL_TKN_U32_PMODE "0"
         SKL_TKN_U32_D0I3_CAPS "1"
-        SKL_TKN_U32_PROC_DOMAIN "1"
+        SKL_TKN_U32_PROC_DOMAIN "0"
         SKL_TKN_U32_PIPE_DIRECTION "0"
         SKL_TKN_U32_NUM_CONFIGS "1"
         SKL_TKN_U32_DMA_BUF_SIZE "2"
-- 
2.17.1

