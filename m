Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C225B5CD
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 383F91877;
	Wed,  2 Sep 2020 23:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 383F91877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599081838;
	bh=yIJxxaJN0t9f8x6YTYV0OAKr9uijRIuaA2eyoKS5XTA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PKxEgWcmUpMBqbJrpXdzfS/XMYNUJoqmohG33tcG9iDigEuC5n5DExtxJCzrViBGf
	 l39At7p9gV1Pha1LebqopKTF2agCR64GiwpqCRE5Pf6Vp1s9hUadVB3OkETQq8sfTr
	 Ly2LOMCz3v/7iyfuXA+Sk94S91wdsB4pLxQEF5uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A09F800F3;
	Wed,  2 Sep 2020 23:22:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE37FF80212; Wed,  2 Sep 2020 23:22:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 001CBF80212
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 001CBF80212
IronPort-SDR: eTSm7thJ1rrRXFq67cSNSI8Qk/nhwyEdfx+l0nf95XC1kIn2MQcPQdywKyiY/XFJfKWf4Nsvmf
 2i0WnvBQWQoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482845"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482845"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:21:58 -0700
IronPort-SDR: 2j0gl/CuZ/SKucU1oNKg7dtVtysQrVCT9+4kZamFrsMs63K5olxSJgL9iorqk95nMErxHOjlfY
 QBVyO2/JUqkg==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798262"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:21:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/18] ALSA: cleanups for sparse/cppcheck warnings
Date: Wed,  2 Sep 2020 16:21:15 -0500
Message-Id: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
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

Various cleanups for ALSA core, compressed, hda, usb, ac97 and
Digigram cards.

Pierre-Louis Bossart (18):
  ALSA: core: pcm: simplify locking for timers
  ALSA: core: memalloc: fix fallthrough position
  ALSA: core: pcm_memory: dereference pointer after NULL checks
  ALSA: core: timer: remove redundant assignment
  ALSA: core: timer: clarify operator precedence
  ALSA: compress_offload: dereference after checking for NULL pointer
  ALSA: compress_offload: remove redundant initialization
  ALSA: core: init: use DECLARE_COMPLETION_ONSTACK() macro
  ALSA: aoa: i2sbus: use DECLARE_COMPLETION_ONSTACK() macro
  ALSA: hda: auto_parser: remove shadowed variable declaration
  ALSA: hda: (cosmetic) align function parameters
  ALSA: usb: scarless_gen2: fix endianness issue
  ALSA: ac97: (cosmetic) align argument names
  ALSA: atmel: ac97: clarify operator precedence
  ALSA: rawmidi: (cosmetic) align function parameters
  ALSA: vx: vx_core: clarify operator precedence
  ALSA: vx: vx_pcm: remove redundant assignment
  ALSA: vx: vx_pcm: remove redundant assignment

 sound/ac97/ac97_core.h          |  2 +-
 sound/aoa/soundbus/i2sbus/pcm.c |  3 +--
 sound/atmel/ac97c.c             | 22 +++++++++++-----------
 sound/core/compress_offload.c   |  5 +++--
 sound/core/init.c               |  3 +--
 sound/core/memalloc.c           |  2 +-
 sound/core/pcm.c                |  8 +++++---
 sound/core/pcm_memory.c         |  3 ++-
 sound/core/rawmidi.c            |  2 +-
 sound/core/timer.c              |  6 +++---
 sound/drivers/vx/vx_core.c      |  4 ++--
 sound/drivers/vx/vx_pcm.c       |  2 --
 sound/pci/hda/hda_auto_parser.c |  2 +-
 sound/pci/hda/hda_jack.h        |  2 +-
 sound/pci/hda/hda_local.h       |  8 ++++----
 sound/usb/mixer_scarlett_gen2.c |  2 +-
 16 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.25.1

