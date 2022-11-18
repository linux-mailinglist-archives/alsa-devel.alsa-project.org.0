Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129E62EC33
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 03:56:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFFE516CC;
	Fri, 18 Nov 2022 03:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFFE516CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668740210;
	bh=Ewq6eAdnNoMnZKMRbGQiXD5EkArZxytL7hT/pN2Emlw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NJtIYLeTrAYw4e39uNnoMTneiSxFMtNDKS90i4i1q1tQu2b0gEvns9wRK6rJyL3En
	 CcfyO2uOJ2Kco5mCJErvH6eFjUBl8zdhPYtyBbsshfyxpG8BEUNFgXKvAH0m04YCG8
	 94h1S+IcYHMIEmY+eoUBX7IaOX4S6kbtU6lQqu7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82B96F800FD;
	Fri, 18 Nov 2022 03:55:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ED34F800FD; Fri, 18 Nov 2022 03:55:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 240DEF800FD
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 03:55:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 240DEF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KbllElWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668740152; x=1700276152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ewq6eAdnNoMnZKMRbGQiXD5EkArZxytL7hT/pN2Emlw=;
 b=KbllElWcEUfOWhPWM8yzzHTCwqqNAuPs66ayTtm5bkY9cvwxv7vz0HNd
 TWdWptHrlCMX7x0mabHlfgeQ1L3t6kKtA68T6QGYiMMM6aVKK3f5BTFZj
 KSSfFc6588E+lnQp1S8a2/QRkV3/GyOFhwkpl8Wa+ELNxmYaVb6+pLOrK
 mVYZdekKJgJt7KydVoCZYh6cEPntbsSnJF1ztdl9voCbRTqjZnFydH/Ut
 mBh6cGQ9wNSXfPmUCjMb+inS0+8RTtPTdkXPPzFbd04IPtf8ogvmwSXul
 Ml+lxetzSkCojDEupxx5Pb6VC2eqS+gWdzSmJtjXbIFMec0cLlMcmKhQ3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="399323284"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="399323284"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:55:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="642347880"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="642347880"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:55:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH v2 0/2] ASoC/soundwire: revisit support for clock registers
Date: Fri, 18 Nov 2022 10:58:05 +0800
Message-Id: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

SoundWire clock base and scale registers are only supported for SDCA
devices. That's fine, but that leaves SoundWire 1.2 with optional
registers not supported. This is a corner case that needs to be supported.

The change is mainly on soundwire. But rt1318-sdw.c was applied to
ASoC tree recently and not in SoundWire tree yet. @Vinod, Are you good
if we go throutgh ASoC tree? Or @Mark can provide a tag and we can go
through SoundWire tree?

changes:
v2:
 - remove is_sdca flag from rt1318-sdw codec driver, too.

Pierre-Louis Bossart (2):
  ASoC/soundwire: remove is_sdca boolean property
  soundwire: enable optional clock registers for SoundWire 1.2 devices

 drivers/soundwire/bus.c           | 11 ++++++-----
 include/linux/soundwire/sdw.h     |  6 ++++--
 sound/soc/codecs/rt1316-sdw.c     |  1 -
 sound/soc/codecs/rt1318-sdw.c     |  1 -
 sound/soc/codecs/rt711-sdca-sdw.c |  1 -
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.25.1

