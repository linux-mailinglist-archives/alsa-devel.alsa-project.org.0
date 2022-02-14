Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B674B4286
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 08:09:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3B3168D;
	Mon, 14 Feb 2022 08:08:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3B3168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644822554;
	bh=zRwIjWadERt36ALUSui8bA9C99V5TX7zIVkUucu64Fk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qpxUFqa2r3LHAxB6GykM7vlZ0yPrBn0BhflJ3hSI5FTtXSlPOSm2Juyh/gdOn8Iuo
	 UVoDZHBHgN8Fuw168G3Wx/1gmnENpnwbjsxCmQ6V2QsGd9fjKDXIgWdRs1lJJ/aeGn
	 I7Svd5osArWaaDJxmomywC8dJvCxoDRqLWAEjaM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 650A2F8012F;
	Mon, 14 Feb 2022 08:08:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE784F80310; Mon, 14 Feb 2022 08:08:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE795F800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 08:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE795F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nnPpqY6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644822480; x=1676358480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zRwIjWadERt36ALUSui8bA9C99V5TX7zIVkUucu64Fk=;
 b=nnPpqY6CbnLGiAoBmL4h5B+6i35GgvWUPxk7+0eGHpU1V30Gb3EgdIOU
 /r5v+604q+yPWNgi4TlIjvs+fsBPK013xIy4HsAHJuroUwprVts0GVjky
 hXnJSMlU7F8RN1Al4SFu0UAEx9gEBe22L/a29kQ/kcxXPztNleBGvphP+
 dmC8XpD9QrsFkMT2AwQpzHHS/8wydqAsUzc9t+D1mz1Ubdi8OjF8+1HpL
 szx0PacQy7RSKokKXkMTCclzupp1WUfxnyoaV+mkMH2EjQWYYkShbhqqg
 YLWcv82V2UzKN0E4myOm+HzFE352ZoTzvMsTqsAXSS2bBTnXay2hi4wGz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="249778421"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="249778421"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:07:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="543255797"
Received: from amrobles-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.75])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 23:07:51 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: SOF: Makefile: Fix randconfig sof-client build when
 SND_SOC_SOF=y
Date: Mon, 14 Feb 2022 09:07:52 +0200
Message-Id: <20220214070752.21063-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

From: Peter Ujfalusi <peter.ujfalusi@gmail.com>

Intel's kernel test robot found the following randconfig combination:
SND_SOC_SOF=y
SND_SOC_SOF_CLIENT=m

In this the sof-client object is not going to be built into the snd-sof.o
and we will have undefined references to the sof-client functions.

Fixes: 6955d9512d0e ("ASoC: SOF: Introduce IPC SOF client support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
Hi Mark, Pierre,

When the client support was added we did some permutation tests (at least I did)
but missed this combination.
It is a valid one for sure and the proper fix is via the Makefile.

Sorry for mising this

Regards,
Peter

 sound/soc/sof/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 4d31282c847d..a0459f06c68a 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -2,7 +2,9 @@
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o
-snd-sof-$(CONFIG_SND_SOC_SOF_CLIENT) += sof-client.o
+ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
+snd-sof-objs += sof-client.o
+endif
 
 snd-sof-$(CONFIG_SND_SOC_SOF_COMPRESS) += compress.o
 
-- 
2.35.1

