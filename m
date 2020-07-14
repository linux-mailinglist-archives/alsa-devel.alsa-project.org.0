Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D212208DF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 11:33:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5445D1661;
	Wed, 15 Jul 2020 11:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5445D1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594805637;
	bh=4o5s9rgidwzF8BIHJaAY/b9zVfcl7tgWtGh1Q7oGg2s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F8nmzhJPTZvm1fLjEvytPfLmLpRw733DGM+W6AR3O/4bw7LSldt3DbypfyFE4d7Gm
	 J3rdoZ4mhXoFcIzFG7bfpYiouIT30ADYw9TUHmhaLSHrEMf+6YIwyiFvcdFirCJO9j
	 1nipFnq8OomlqN4wv2IrphKiP3+6hnos9iiz/Bd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CFBAF80227;
	Wed, 15 Jul 2020 11:32:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 057F4F80229; Wed, 15 Jul 2020 11:32:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49312F80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 11:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49312F80113
IronPort-SDR: SEqD48TzSGbCPvT0kf0PKs9DSVjIqOlQh7YOhDuqkmBtMRpYvtjriZysR8gBak57TFkENDJREU
 AsfwWJ//vbhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="137241492"
X-IronPort-AV: E=Sophos;i="5.75,354,1589266800"; d="scan'208";a="137241492"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 02:32:00 -0700
IronPort-SDR: wb/vu2F4P4Luom+m/Nzi3Mr2RRUdF5pPkZlb3vgbCJe+yJxvXC5vYRURDLZcG5o2+sBBQoPFFt
 STU0he2MnR0w==
X-IronPort-AV: E=Sophos;i="5.75,354,1589266800"; d="scan'208";a="460006199"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 02:31:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/2] soundwire: sdw.h: fix PRBS/Static_1 swapped
Date: Wed, 15 Jul 2020 05:37:42 +0800
Message-Id: <20200714213744.24674-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

Fix PRBS/Static_1 swapped definitions and indentation in sdw.h

Pierre-Louis Bossart (2):
  soundwire: sdw.h: fix PRBS/Static_1 swapped definitions
  soundwire: sdw.h: fix indentation

 include/linux/soundwire/sdw.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

-- 
2.17.1

