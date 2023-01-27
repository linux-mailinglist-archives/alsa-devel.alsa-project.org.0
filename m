Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 214C067E91E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:12:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40FE3E78;
	Fri, 27 Jan 2023 16:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40FE3E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832322;
	bh=xtb0XqFG+2cY/GJ4AQz/lNgJKSgLLing/rI71xFuRQY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FoBqK0uik3Av+PjkMBNlFBt2qUZASRgcd3svOqDH5b2B1Ru0Xst+U1nxHvBPcFXEy
	 f6Oo/q4JMmUeOax+mGI6UTJsyy965ClUr3NIRqYJkvSDpRIutu2vGIlSEFX4K1iWyE
	 n32moPOEPLJk1f8SMcY9zBI0TMuO2QULRX0BUYiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 311CFF80494;
	Fri, 27 Jan 2023 16:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4DA6F804F3; Fri, 27 Jan 2023 16:10:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2B4EF801F7
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B4EF801F7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PGubtNJ+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832218; x=1706368218;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xtb0XqFG+2cY/GJ4AQz/lNgJKSgLLing/rI71xFuRQY=;
 b=PGubtNJ+FVJpvuaZDC/yvfrMBa/fGQ+cpUyglMW4kaipdImWCkpSoWLU
 3WelPejfldbZdvsk/NqeU1fZOkocPsVSJvhuzCipb9KBTGEWXGU84Ye4g
 WpLxwlRbWQcm5yMpENOZC+Lxzyn9bitxfZk3Oumo5RVl4AHXGfLXhGv6G
 zRlIKLY3y8PXALdat1JMQuop3owPlP7ewJPXu0pdecQYa+iKpWaARTxwO
 ivFATPCHSCsZHm72ZFZBgYV9OOg8gVANrUO7ybxGpnbF+Mo/nhEIFa8Va
 BZxGN3XUaCOzZI3p1qW73SkPBWz7JzYrlmwnyagxx26jhpLV4d36CcL2H g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795757"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795757"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908708974"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908708974"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:09 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/11] ASoC: topology: Fixes and cleanups
Date: Sat, 28 Jan 2023 00:11:00 +0100
Message-Id: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Following is series of fixes and cleanups for core topology code. Few
patches fixing various problems all around and few fixing function
names.

v2:
 - fix commit messages
 - change order of last two patches
 - as there is no code changes, add Reviewed-by from Ranjani

Amadeusz Sławiński (11):
  ASoC: topology: Properly access value coming from topology file
  ASoC: topology: Remove unused SOC_TPLG_PASS_PINS constant
  ASoC: topology: Fix typo in functions name
  ASoC: topology: Fix function name
  ASoC: topology: Rename remove_ handlers
  ASoC: topology: Remove unnecessary forward declarations
  ASoC: topology: Pass correct pointer instead of casting
  ASoC: topology: Return an error on complete() failure
  ASoC: Topology: Remove unnecessary check for EOF
  ASoC: topology: Unify kcontrol removal code
  ASoC: topology: Use unload() op directly

 include/sound/soc-topology.h |   2 +-
 sound/soc/soc-topology.c     | 183 ++++++++++++++---------------------
 2 files changed, 74 insertions(+), 111 deletions(-)

-- 
2.25.1

