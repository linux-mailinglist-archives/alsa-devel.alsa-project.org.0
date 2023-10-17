Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5377CC877
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 18:13:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB6D852;
	Tue, 17 Oct 2023 18:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB6D852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697559181;
	bh=sQ3SeCPd+0Lqa046J6tIMPZMzDJgd5cO8vP1Z8zMzJM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OyBmdim0WPgvRDNTwVRmZCTu7xMqfV1ZmZQr9TcPI8CySbt34cNOOBEzAkPXS7g1x
	 D52qQaG85L/ZUD9zYcdvDAXTuKR6tNGLszY4QlROB0YLZmhSgI8HP2hy8i+10D8te8
	 LP0rvaBTVS2UEvEde5AWJ9OLWjC+k/Vf9c62PZw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BD4FF8055B; Tue, 17 Oct 2023 18:11:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1676F8027B;
	Tue, 17 Oct 2023 18:11:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65E06F8032D; Tue, 17 Oct 2023 18:11:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB3BDF80166
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 18:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB3BDF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PcFfsvfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697559084; x=1729095084;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sQ3SeCPd+0Lqa046J6tIMPZMzDJgd5cO8vP1Z8zMzJM=;
  b=PcFfsvfaONI9kM0zIiFiBOlzLKMsq3ohzl8dVy0YzzI98MMQTit3boL7
   tZ6tzs5UjmEXjDj7axrvJVZbGzyVt+EUNq5/dsCZX0aszeZW1DgzbWiwY
   ykzgT2RQ6cMKFXikgcDjH1FHCrUR7xdUMIUGZY+kmYUJYn9+WOaTD7y66
   6LrcoS1fvFTIZBh09m8eIxQkAniC6e+n+QGYPPnREqTcYfc/3pLUjEopi
   8fU7fKYTmnYg4anPua97ihxbEDuQiXuyK5Q5UtfFl6JDGc94EdokG2IUO
   Q1xRv4/0vt4cEvQviFfheYTO2afFo5hLBnDHmqeNYjCDYWfXyo1dTiEiA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="365167497"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200";
   d="scan'208";a="365167497"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 09:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="759865013"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200";
   d="scan'208";a="759865013"
Received: from asprado-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.55.179])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 09:09:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 0/2] soundwire: introduce controller ID
Date: Tue, 17 Oct 2023 11:09:31 -0500
Message-Id: <20231017160933.12624-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HICHK5NYAGRVAOY7ICG7MSX5567UWAB5
X-Message-ID-Hash: HICHK5NYAGRVAOY7ICG7MSX5567UWAB5
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HICHK5NYAGRVAOY7ICG7MSX5567UWAB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset is an alternate proposal to the solution suggested in
[1], which breaks Intel machine drivers.

The only difference is to use a known controller ID instead of an IDA,
which wouldn't work with the hard-coded device name.

This patchset was tested on Intel and AMD platforms, testing on
Qualcomm platforms is required - hence the RFC status.

[1] https://lore.kernel.org/alsa-devel/20231004130243.493617-1-krzysztof.kozlowski@linaro.org/

Krzysztof Kozlowski (1):
  soundwire: fix initializing sysfs for same devices on different buses

Pierre-Louis Bossart (1):
  soundwire: bus: introduce controller_id

 drivers/soundwire/amd_manager.c     |  8 ++++++++
 drivers/soundwire/bus.c             |  4 ++++
 drivers/soundwire/debugfs.c         |  2 +-
 drivers/soundwire/intel_auxdevice.c |  3 +++
 drivers/soundwire/master.c          |  2 +-
 drivers/soundwire/qcom.c            |  3 +++
 drivers/soundwire/slave.c           | 12 ++++++------
 include/linux/soundwire/sdw.h       |  4 +++-
 sound/soc/intel/boards/sof_sdw.c    |  4 ++--
 9 files changed, 31 insertions(+), 11 deletions(-)

-- 
2.39.2

