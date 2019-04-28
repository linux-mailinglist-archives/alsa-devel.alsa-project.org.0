Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF78B57D
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE814892;
	Sun, 28 Apr 2019 09:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE814892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556436463;
	bh=fR9uq3LocuvIS1eGDie+LvbAb320+vHwk2XfcZgNdRQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=swaGa3FDYDqbLOadBj9Ifpn+vAxSFFp/Ht7qbBbexx4X3GGvtGuGW26IuRVyEOWa+
	 HyXJ2Sdk3/Vv2lyBlGGMWHjzeH6UPSJeoTmlaIUras1kL6v8iEWC9yT9qQCcuEdQSL
	 fGsejKHynWrYCz8LCVRmGDUnN9V/r9gv4c25xRkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FD24F896AA;
	Sun, 28 Apr 2019 09:25:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 771EDF896AA; Sun, 28 Apr 2019 09:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF04CF8070B
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 09:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF04CF8070B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 34FFDAD0C;
 Sun, 28 Apr 2019 07:25:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 28 Apr 2019 09:25:48 +0200
Message-Id: <20190428072550.31087-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 0/2] ASoC: CX2072X codec support (revised)
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

v1->v2: Uncomment SOF entries in ACPI binding
        Move snd_soc_dai_set_bclk_ratio() call into init callback

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
 sound/soc/codecs/cx2072x.c                        | 2197 +++++++++++++++++++++
 sound/soc/codecs/cx2072x.h                        |  317 +++
 sound/soc/intel/boards/Kconfig                    |   11 +
 sound/soc/intel/boards/Makefile                   |    2 +
 sound/soc/intel/boards/bytcht_cx2072x.c           |  286 +++
 sound/soc/intel/common/soc-acpi-intel-byt-match.c |    8 +
 sound/soc/intel/common/soc-acpi-intel-cht-match.c |    8 +
 9 files changed, 2838 insertions(+)
 create mode 100644 sound/soc/codecs/cx2072x.c
 create mode 100644 sound/soc/codecs/cx2072x.h
 create mode 100644 sound/soc/intel/boards/bytcht_cx2072x.c

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
