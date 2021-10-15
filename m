Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B9C42FCB4
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 22:01:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 520B0189B;
	Fri, 15 Oct 2021 22:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 520B0189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634328090;
	bh=lvQsvx615qVvy1/hJux2gY9BbbEfRTMcTF0+Q9fIGR0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nD1eWoVV3dqAgikTNyip1hLXBTH6L/0KgP/BnU/Jfbj+CpSCYXekTB2Mn0M0whFMz
	 HjA2dLmaCm2xtpfmkop3GTCsaeLawitm0vgfjkdhd5Hc2U8wZjRi6U0XNIN+JZ3xO6
	 ydIj1emosEluSVGgMX982FC6Fud+bf0VkjtqXGf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D78ECF804D8;
	Fri, 15 Oct 2021 21:59:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00139F804D8; Fri, 15 Oct 2021 21:59:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FA94F8025B
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 21:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA94F8025B
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="228257929"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="228257929"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:59:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="593081845"
Received: from ssureshc-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.190.93])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:59:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 1/4] ALSA: pcm: unconditionally check if appl_ptr is in
 0..boundary range
Date: Fri, 15 Oct 2021 14:59:29 -0500
Message-Id: <20211015195932.224925-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015195932.224925-1-pierre-louis.bossart@linux.intel.com>
References: <20211015195932.224925-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Kai Vehmanen <kai.vehmanen@intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
---
 sound/core/pcm_lib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index a144a3f68e9e..ec53a3e7cf35 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2132,6 +2132,9 @@ int pcm_lib_apply_appl_ptr(struct snd_pcm_substream *substream,
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

