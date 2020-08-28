Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ACF255502
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 09:23:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B29DD1823;
	Fri, 28 Aug 2020 09:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B29DD1823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598599390;
	bh=xyQN3cu4a5mEQ+QxulO9EYoVXzAejYoq0O4gwXQquIA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iDxajwmYjhAMYy/5xmsi20YFdShsMvSX0KvWxYa0Ac/6qvbA6kXcGOaSXQ9pVqF94
	 qmCfThG0bIKVY5sYhPJGbwrWGhFGWsnPtMLVHTR2RoyvBiRNcGBKZi4w+2DWx2fh2A
	 xmdgwV8eaXnmmxS6FwCOrOz37JdD0kIZjUo8knqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5AC0F80143;
	Fri, 28 Aug 2020 09:21:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80CBEF801D9; Fri, 28 Aug 2020 09:21:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77549F80105
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77549F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A8ShmgyM"
Received: from localhost.localdomain (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F01820CC7;
 Fri, 28 Aug 2020 07:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598599273;
 bh=xyQN3cu4a5mEQ+QxulO9EYoVXzAejYoq0O4gwXQquIA=;
 h=From:To:Cc:Subject:Date:From;
 b=A8ShmgyMrqC5A3ZF3Pu25zKmxa1uIZ4rCiiWp4dM0icgMehHjdbJ2ZSFOx1xIwqFE
 MnKKoZbQFFfEGp+9oKsSGBVctQ3tTDT4C6iOt7vqNHCI36oQPlJooF1OE5nO0AE8NF
 13yZiA70MU1pg39+OJSEJsKtnCxMImEK6v/X7oas=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/9] soundwire: use FIELD_{GET|PREP} in subsystem
Date: Fri, 28 Aug 2020 12:50:52 +0530
Message-Id: <20200828072101.3781956-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

Use the FIELD_{GET|PREP} in soundwire subsytem and remove the local
SDW_REG_SHIFT().  This makes code IMO look much neater

Tested this on db845c board

Bard, can you please verify this on intel boards.

Vinod Koul (9):
  soundwire: define and use addr bit masks
  soundwire: bus: use FIELD_GET()
  soundwire: slave: use SDW_DISCO_LINK_ID()
  soundwire: stream: use FIELD_{GET|PREP}
  soundwire: qcom : use FIELD_{GET|PREP}
  soundwire: cadence: use FIELD_{GET|PREP}
  soundwire: intel: use FIELD_{GET|PREP}
  soundwire: intel_init: use FIELD_{GET|PREP}
  soundwire: remove SDW_REG_SHIFT()

 drivers/soundwire/bus.c                 |  6 +--
 drivers/soundwire/cadence_master.c      | 53 ++++++++++---------------
 drivers/soundwire/intel.c               | 40 +++++++------------
 drivers/soundwire/intel_init.c          |  2 +-
 drivers/soundwire/qcom.c                | 22 ++++------
 drivers/soundwire/slave.c               |  2 +-
 drivers/soundwire/stream.c              | 13 +++---
 include/linux/soundwire/sdw.h           | 21 ++++++----
 include/linux/soundwire/sdw_registers.h |  7 ----
 9 files changed, 67 insertions(+), 99 deletions(-)

-- 
2.26.2

