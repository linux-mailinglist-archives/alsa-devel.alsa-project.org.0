Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFBF3296E8
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 09:29:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3F2C1663;
	Tue,  2 Mar 2021 09:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3F2C1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614673744;
	bh=7IELr/ye3VEMFfm+7UYSNs7tWvTjeLaMjyW6kT1clNs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q9rhmJA7MLVKRIx2nzMcJbu7GFoFPhjq4GmtMRme1gvqXh09lmYQOJmhSZYvV0pg8
	 megl5BYoZSGreA8HhCypVZOmiBRND/4I4rVvJqevATgOJ6wENd7dvFL0AtRGHA3zms
	 WbXYrR6QkG8zLc56WqkXWwoQSZzyD/T4nkPytZGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05F72F80227;
	Tue,  2 Mar 2021 09:27:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D4BFF80269; Tue,  2 Mar 2021 09:27:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 524F5F80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 09:27:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 524F5F80227
IronPort-SDR: XXc0vxxhd59D5TzJxPsGGCT0EjfUaE9t8hMeW2NoXdg17axKN9uiHkt5zr1SgYWrC2SHC2o1nQ
 frnJbHXGTR4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184302351"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="184302351"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 00:27:23 -0800
IronPort-SDR: FELPuuSxJMRfmBQIfF71vfY8TV+Wl4uWBHOM9QLs+JL1hUuXr3WcQrBBAF9OHmkODhb/knIpE9
 MDiwUHji5Btg==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="406613386"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 00:27:19 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/3] soundwire: clear bus clash/parity interrupt before the
 mask is enabled
Date: Tue,  2 Mar 2021 16:27:17 +0800
Message-Id: <20210302082720.12322-1-yung-chuan.liao@linux.intel.com>
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

The SoundWire specification allows a Slave device to report a bus clash
or parity error with the in-band interrupt mechanism.
Unfortunately, on some platforms, these errors are randomly reported and
don't seem to be valid.
This series suggests the addition of a Master level quirk to discard such
interrupts. The quirk should in theory have been added at the Slave level,
but since the problem was detected with different generations of Slave
devices it's hard to point to a specific IP. The problem might also be
board-dependent and hence dealing with a Master quirk is simpler.

v2:
 - Reorder the patches sequence.
 - Add comments about each quirk.
 - Use u64 quirks.


Bard Liao (3):
  soundwire: add master quirks for bus clash and parity
  soundwire: bus: handle master quirks for bus clash and parity
  soundwire: intel: add master quirks for bus clash and parity

 drivers/soundwire/bus.c       | 39 +++++++++++++++++++++++++++++++++++
 drivers/soundwire/intel.c     |  3 +++
 include/linux/soundwire/sdw.h | 22 ++++++++++++++++++++
 3 files changed, 64 insertions(+)

-- 
2.17.1

