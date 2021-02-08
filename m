Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF72C31442B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:42:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3567D16A0;
	Tue,  9 Feb 2021 00:41:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3567D16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612827754;
	bh=Cl7GGVvVfUZcz3BTJR/nZqtkTQDw6UV3wqX6KSzflQQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fsg3+pzneuJBw/CtEboaAfX6DOUCQA1kxgSOCfVu6gHPG3mk02TiSfGn8bsg4BRPk
	 9LfA+LDtFD8dnLLs0P1Wmvj1q2//4FtE+oEi9rpB++r+t2SawRWWxDV/GQa1AEn1Up
	 qpuHfRhq2pZWl9oop2rTwYwDsvpE1eto2aalMFQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE51F80165;
	Tue,  9 Feb 2021 00:41:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A41FF8022D; Tue,  9 Feb 2021 00:41:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1B2FF80114
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:40:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1B2FF80114
IronPort-SDR: haMegh4VhBtmY+GgXBmcloAqAGRnvABxKLyEdZJ9F5yBoko7YP8Mi5JjQFRmaNCBbUrU2a74DN
 95xb/csZ+lzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243297906"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="243297906"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:40:52 -0800
IronPort-SDR: 08TlvZ2Z0JtPxTYUvsHYL0qcXCBR0p7V66U9T+ZHBq1/+72hZkFG+zRT6og7lj4jkT2z0Lddcp
 TG4DepZK46LA==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="487640911"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:40:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 0/2] ASoC: dapm/pins: handle component prefix
Date: Mon,  8 Feb 2021 17:40:41 -0600
Message-Id: <20210208234043.59750-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

SoundWire machine drivers make a heavy use of component prefixes to
uniquify control names. This however results in errors when looking
for widgets or pins. This patchset suggests two solutions but feedback
or suggestions on how to take the prefix into account would be
welcome.

Bard Liao (1):
  ASoC: Intel: boards: max98373: get dapm from cpu_dai

Shuming Fan (1):
  ASoC: dapm: use component prefix when checking widget names

 sound/soc/intel/boards/sof_maxim_common.c |  5 +++--
 sound/soc/soc-dapm.c                      | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.25.1

