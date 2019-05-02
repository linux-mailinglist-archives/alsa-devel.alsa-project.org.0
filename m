Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC9B120FE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 19:27:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EAF5182F;
	Thu,  2 May 2019 19:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EAF5182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556818074;
	bh=E+i4qucg/itBEro3r4qEGv/iyP7ZQe34eS4xT3DOGfo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oPbEaS+DEMP1jnD5LoZ5ilKKNIWIdt4Z7OKUbMTtdTgZdwaySwp8bSgou+yvifoUz
	 t9wbnXBlCNiJJm8VkCeoAybwl/jlw06+CqoMMqIz577+VTNX3RqGuZS5VpsF565n+D
	 MprHkYzB9q4Bm+MOouEzA0LBGrxVr6/KKd+/v5VQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFD4FF8971A;
	Thu,  2 May 2019 19:25:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 498BFF896E3; Thu,  2 May 2019 19:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A168FF896AA
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 19:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A168FF896AA
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BDCBFACBC;
 Thu,  2 May 2019 17:25:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Thu,  2 May 2019 19:25:22 +0200
Message-Id: <20190502172524.10746-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v4 0/2] ASoC: CX2072X codec support (revised)
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

this is a revised patchset for ASoC CX2072X codec support on Intel
platforms.


Takashi

===

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

===

Simon Ho (1):
  ASoC: Add support for Conexant CX2071X CODEC

Takashi Iwai (1):
  ASoC: Intel: Add machine driver for CX2072X on BYT/CHT platforms

 sound/soc/codecs/Kconfig                          |    7 +
 sound/soc/codecs/Makefile                         |    2 +
 sound/soc/codecs/cx2072x.c                        | 2151 +++++++++++++++++++++
 sound/soc/codecs/cx2072x.h                        |  319 +++
 sound/soc/intel/boards/Kconfig                    |   11 +
 sound/soc/intel/boards/Makefile                   |    2 +
 sound/soc/intel/boards/bytcht_cx2072x.c           |  284 +++
 sound/soc/intel/common/soc-acpi-intel-byt-match.c |    8 +
 sound/soc/intel/common/soc-acpi-intel-cht-match.c |    8 +
 9 files changed, 2792 insertions(+)
 create mode 100644 sound/soc/codecs/cx2072x.c
 create mode 100644 sound/soc/codecs/cx2072x.h
 create mode 100644 sound/soc/intel/boards/bytcht_cx2072x.c

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
