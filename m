Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF8B457958
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Nov 2021 00:11:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84E821786;
	Sat, 20 Nov 2021 00:10:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84E821786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637363473;
	bh=bxcc/uPQRoKWtrm7Fgr5WD9LQ14oXlysnF7XoVTylWA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBYF248gXdq6juLxzcEyWovOfiIp+9OODRiU6xixO1z3jDOxFmg7RAiFfOuETQls1
	 s0RwJ0xsOCufrFYRZca/W64FtcB0Rl6gbD9Al8XdXQ+NFxt154uSmjvVi77TMt6geJ
	 sD6QLsAd3g+ycu6FYXzGQTnvaKYOVdULiEkeqPVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF3A4F802C4;
	Sat, 20 Nov 2021 00:09:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2293FF8027D; Sat, 20 Nov 2021 00:09:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B2A7F8010B
 for <alsa-devel@alsa-project.org>; Sat, 20 Nov 2021 00:09:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B2A7F8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="234456138"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="234456138"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:09:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="496075707"
Received: from mredenti-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.30.252])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:09:15 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 1/4] ALSA: pcm: unconditionally check if appl_ptr is in
 0..boundary range
Date: Fri, 19 Nov 2021 17:08:49 -0600
Message-Id: <20211119230852.206310-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119230852.206310-1-pierre-louis.bossart@linux.intel.com>
References: <20211119230852.206310-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

In some cases, the appl_ptr passed by userspace is not checked before
being used. This patch adds an unconditional check and returns an
error code should the appl_ptr exceed the ALSA 'boundary'.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/core/pcm_lib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 4f4b4739f987..fdd992772b20 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2133,6 +2133,9 @@ int pcm_lib_apply_appl_ptr(struct snd_pcm_substream *substream,
 	if (old_appl_ptr == appl_ptr)
 		return 0;
 
+	if (appl_ptr >= runtime->boundary)
+		return -EINVAL;
+
 	runtime->control->appl_ptr = appl_ptr;
 	if (substream->ops->ack) {
 		ret = substream->ops->ack(substream);
-- 
2.25.1

