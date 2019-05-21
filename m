Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294E24811
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 08:29:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 933F915E5;
	Tue, 21 May 2019 08:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 933F915E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558420175;
	bh=jieUhlGhyFouuX2lm2hwXJEdUC1o9rrIR6zNHh8rlXo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GEDfjYXFTzOwk+lHphqUEMHizbkDVxP5k6RmthXuX471SP0xYAOZIRRnwl0YjoE2p
	 p/Y0yTOZdC8txsFL69Cx8rFC0fO38ojf+27U44RD2bw+Nb9F3hO3Zf+iqkIOz7ZaCI
	 o74gENIMkRew26P53iyHIGWjlBCYRvfulb2wnjqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12863F8972A;
	Tue, 21 May 2019 08:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26067F89707; Tue, 21 May 2019 08:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEF67F806E7
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 08:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF67F806E7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E7B10AE08;
 Tue, 21 May 2019 06:26:55 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 21 May 2019 08:26:51 +0200
Message-Id: <20190521062653.734-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v6 0/2] ASoC: CX2072X codec support (revised,
	v6)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

the merge window was closed, and now it's time for fun again.
This is a v6 revision of ASoC CX2072X codec support patchset for Intel
platforms.


Takashi

===

v5->v6: Drop buggy&untested EQ and DRC codes
	Lots of code reduction/cleanup in codec driver
	Add more comments about platform-specific stuff

v4->v5: Move clk management to runtime PM
	Sparse warning fixes
	Some more code simplification
	Drop tricky regcache fiddling
	Apply mutex locks around possible racy sequences
	Move exported jack detection stuff into set_jack callback

v3->v4: Fix the wrong endianess conversion in reg write
	Minor code cleanups

v2->v3: CX2072X codec driver:
	* Move register tables to appropriate place
	* Remove some confusing codes
	* Set snd_ctl_boolean_* helpers directly
	* Fix EQ put callback
	* Rename to "DAC1 Switch" from "DAC1 Mute Switch"
	* Drop superfluous regmap calls at shutdown
	* Avoid regmap_register_patch()
	* Add missing register definitions
	* Fix register access on big-endian machine
	* Remove regcache messes
	CX2072X machine driver:
	* Add Pierre's ack
	* Drop superfluous ssp0 routes

v1->v2: Uncomment SOF entries in ACPI binding
        Move snd_soc_dai_set_bclk_ratio() call into init callback

The original cover letter is below:

===

It's been long time ago the first version of CX2072X codec patch was
submitted, and I hoped that it'd be resubmitted, but never happened,
as the original author seems to have left, unfortunately.

Since I have such a laptop (ASUS E200HA), I took some time to cook and
brush up the patches.  The patches are for 5.2, should be applicable
to ASoC tree for-next branch.

Will post the corresponding UCM profile patch once when this gets
accepted.


thanks,

Takashi

===

Simon Ho (1):
  ASoC: Add support for Conexant CX2072X CODEC

Takashi Iwai (1):
  ASoC: Intel: Add machine driver for CX2072X on BYT/CHT platforms

 sound/soc/codecs/Kconfig                          |    7 +
 sound/soc/codecs/Makefile                         |    2 +
 sound/soc/codecs/cx2072x.c                        | 1727 +++++++++++++++++++++
 sound/soc/codecs/cx2072x.h                        |  314 ++++
 sound/soc/intel/boards/Kconfig                    |   11 +
 sound/soc/intel/boards/Makefile                   |    2 +
 sound/soc/intel/boards/bytcht_cx2072x.c           |  262 ++++
 sound/soc/intel/common/soc-acpi-intel-byt-match.c |    8 +
 sound/soc/intel/common/soc-acpi-intel-cht-match.c |    8 +
 9 files changed, 2341 insertions(+)
 create mode 100644 sound/soc/codecs/cx2072x.c
 create mode 100644 sound/soc/codecs/cx2072x.h
 create mode 100644 sound/soc/intel/boards/bytcht_cx2072x.c

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
