Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFB1363AFF
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 07:28:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091EA16AA;
	Mon, 19 Apr 2021 07:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091EA16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618810139;
	bh=Q7TJptO0vIwQVFOD2bou9t/a0QOZPy+CmfrHAZjBNYY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TKXbOr8jjjoKY/0jplR3hprFCEw7Cx4KRoXivjSAtQdmAgacSnj/5SRl1fAC0qVUl
	 u/9yoVuh2OOZ4a0//iQlBgjxwx0lhBh/DHgUSsUcMzxaP5Q+tCuRDc2605xIQbft6A
	 vVfAJmnkb4ck8Ivm9GAs/B4O3gn2DV/2g3dEsjC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A45BCF80227;
	Mon, 19 Apr 2021 07:27:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51315F800C5; Mon, 19 Apr 2021 07:27:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D23EF800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 07:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D23EF800C5
IronPort-SDR: qQxNDj4TAn3f7+emv8/683hx0qGLMq0ENZAA2ql7e2SJr5W08PL/3hI2tBBqe1oDl/oASXVZ42
 jBRTyy8C7lXg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="192081477"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="192081477"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:27:17 -0700
IronPort-SDR: GUo2Fc2DtIux661H0B5bDXL7JJgDuHUt8iwz5tvO0A71MBCMcCvQauoesBxinNHK08ULXlj2n0
 JzBC6NPMn1yQ==
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="426370589"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:27:14 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/4] soundwire: only use CLOCK_STOP_MODE0 and handle -ENODATA
Date: Mon, 19 Apr 2021 13:26:59 +0800
Message-Id: <20210419052703.2782-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
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

Existing devices and implementations only support the required
CLOCK_STOP_MODE0. All the code related to CLOCK_STOP_MODE1 has not
been tested and is highly questionable, with a clear confusion between
CLOCK_STOP_MODE1 and the simple clock stop state machine.

This patch removes all usages of CLOCK_STOP_MODE1 - which has no
impact on any solution - and fixes the use of the simple clock stop
state machine. The resulting code should be a lot more symmetrical and
easier to maintain.

Note that CLOCK_STOP_MODE1 is not supported in the SoundWire Device
Class specification so it's rather unlikely that we need to re-add
this mode later.

If a device lost sync and can no longer ACK a command, it may not be
able to enter a lower-power state but it will still be able to resync
when the clock restarts. In those cases, we want to continue with the
clock stop sequence.

This patch modifies the behavior during clock stop sequences to only
log errors unrelated to -ENODATA/Command_Ignored. The flow is also
modified so that loops continue to prepare/deprepare other devices
even when one seems to have lost sync.

When resuming the clocks, all issues are logged with a dev_warn(),
previously only some of them were checked. This is the only part that
now differs between the clock stop entry and clock stop exit
sequences: while we don't want to stop the suspend flow, we do want
information on potential issues while resuming, as they may have
ripple effects.

For consistency the log messages are also modified to be unique and
self-explanatory. Errors in sdw_slave_clk_stop_callback() were
removed, they are now handled in the caller.

Pierre-Louis Bossart (4):
  soundwire: bus: only use CLOCK_STOP_MODE0 and fix confusions
  soundwire: add missing kernel-doc description
  soundwire: bus: handle -ENODATA errors in clock stop/start sequences
  soundwire: bus: add missing \n in dynamic debug

 drivers/soundwire/bus.c       | 155 +++++++++++++++-------------------
 include/linux/soundwire/sdw.h |   3 +-
 2 files changed, 70 insertions(+), 88 deletions(-)

-- 
2.17.1

