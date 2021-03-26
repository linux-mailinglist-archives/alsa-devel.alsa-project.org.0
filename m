Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E4334A3F4
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 10:17:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 367371674;
	Fri, 26 Mar 2021 10:16:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 367371674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616750227;
	bh=bZcrVby0cG11lKYEsKVg+YyVkpCG3atrfEyGlH8xQlI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X/1I5g+k6yljVhdm67okNRx0t2TC4WYjV1paLT2KKvQf6sCjOxC5yGuZNVgiVBajX
	 GDL6wxdOrCt4jY+8Ph+L79j2d9e8LUBgUFZRknT0riYl2pruQGDqyx7h2uWTas1NkE
	 sacs1bgzWiHRgSloG0pACmobzfYYHQpcT+d8PKdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 817BEF80240;
	Fri, 26 Mar 2021 10:15:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C231BF801EC; Fri, 26 Mar 2021 10:15:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03416F80156
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 10:15:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03416F80156
IronPort-SDR: ZFViuYIPjtdCUpz8QR+iKL+aJmFC7UgNR0x3LLTo+urNAbmGEzVvJ0NMhDA3xvJDsmtcHooxen
 jxUGTjRwtHBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276249406"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="276249406"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:26 -0700
IronPort-SDR: bIPOm3R/3K2MdsaNAp5lh76tGzPU1ypOgvwIw0Wu+MnXshM9vEAY6scQGy2URBZIMLBAVT7U5W
 NR34V3WZVJnA==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="416463072"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:23 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH 00/11] soundwire: some cleanup patches
Date: Fri, 26 Mar 2021 17:15:03 +0800
Message-Id: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

To make soundwire driver more decent and less Cppcheck complaint.

Pierre-Louis Bossart (11):
  soundwire: bus: use correct driver name in error messages
  soundwire: bus: test read status
  soundwire: bus: use consistent tests for return values
  soundwire: bus: demote clock stop prepare log to dev_dbg()
  soundwire: bus: uniquify dev_err() for SCP_INT access
  soundwire: bus: remove useless initialization
  soundwire: generic_bandwidth_allocation: remove useless init
  soundwire: intel: remove useless readl
  soundwire: qcom: check of_property_read status
  soundwire: stream: remove useless initialization
  soundwire: stream: remove useless bus initializations

 drivers/soundwire/bus.c                       | 54 +++++++++++--------
 drivers/soundwire/bus_type.c                  | 15 ++++--
 .../soundwire/generic_bandwidth_allocation.c  |  4 +-
 drivers/soundwire/intel.c                     |  2 -
 drivers/soundwire/qcom.c                      |  3 ++
 drivers/soundwire/stream.c                    |  8 +--
 6 files changed, 52 insertions(+), 34 deletions(-)

-- 
2.17.1

