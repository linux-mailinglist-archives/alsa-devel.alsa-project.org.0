Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 705DD2213B4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 19:48:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 141DA1663;
	Wed, 15 Jul 2020 19:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 141DA1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594835310;
	bh=CLJoYKfsvwQeQKavKIg/Y4LkoReiiuik5OejZI5d324=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W/dt/b5l3jjFd2yvjUVRgHPKTAtibrnIbAEAOk2kU4j28i22BvAWBrE+uffW+usnl
	 KJhhH6A51QarYhrZfxFU7c3qEQubUFsJoLHzYNeiWRbnFELIi5b5o7StXHgBzktAwN
	 R2yfNBtXTlQxn8oUNxrz2HeFEviHEeotnIMrJt74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C658F8023F;
	Wed, 15 Jul 2020 19:46:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6A72F80227; Wed, 15 Jul 2020 19:46:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 747BEF80217
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 19:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 747BEF80217
IronPort-SDR: TCiBBjFnS0R8KeE6AjVvsSn92sCR+jTQFpr5TtxE4meYHKqYdFD1wf0QWICW/dsg3aj8wYfU8Y
 wKEU1QeM9b8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="146739488"
X-IronPort-AV: E=Sophos;i="5.75,356,1589266800"; d="scan'208";a="146739488"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 10:46:28 -0700
IronPort-SDR: +0+PYIT3883zFgoHDjxWXbH3IyyclHnuGnzG21Pf+cpCOc8F8fI6kivdCJDTL8whZvp1YTRutL
 Ub3/FkyI7pzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,356,1589266800"; d="scan'208";a="326259053"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga007.jf.intel.com with ESMTP; 15 Jul 2020 10:46:26 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 0/2] ALSA: hda: export snd_hda_codec_cleanup()
Date: Wed, 15 Jul 2020 20:45:49 +0300
Message-Id: <20200715174551.3730165-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

Hi,

this small series is preparation for a set of bugfix ASoC patches
addressing a memleak at module unload for the HDA codec wrapper.
Instead of duplicating HDA code in ASoC tree, I chose to export
more functionality from hda_codec.c so it can be (re)used in ASoC's
hdac_hda.c.

Full series:
https://github.com/thesofproject/linux/pull/2252

Takashi and Mark, feedback is welcome on how to best handle this
kind of series where I have dependent patches both in sound/pci/hda
and in ASoC. For this series, I'm sending the patches separately
and when/if first set is merged by Takashi, I'll route the ASoC
patches via our usually SOF set to Mark.

Kai Vehmanen (2):
  ALSA: hda: export snd_hda_codec_cleanup_for_unbind()
  ALSA: hda: fix snd_hda_codec_cleanup() documentation

 include/sound/hda_codec.h | 2 ++
 sound/pci/hda/hda_codec.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.27.0

