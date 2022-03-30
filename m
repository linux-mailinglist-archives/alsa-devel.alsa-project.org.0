Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFCA4ECDD3
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82E7A1AE4;
	Wed, 30 Mar 2022 22:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82E7A1AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648671833;
	bh=4BnXKvZKuSID7h2I+0QNQw18nHyoNl3kL/EGdhEs0G8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W5R2Ef41iPT0sKL20pxXapbQ7ciK6AI1Ur4oODh69tLkGNPQ1j9q/KUD6JBqATx9P
	 js/FPDfFndLvjoYwWAsZt+SgVqzUC1K9r4h5eDXucKTihNvKILFhAT4gQawPjkO0GT
	 yn7Byt1aHSeHXuCupjYBbxkgEdKs7K8a638fK9a8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88849F80551;
	Wed, 30 Mar 2022 22:20:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3329F80536; Wed, 30 Mar 2022 22:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64914F80519
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64914F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CYPHQWVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648671588; x=1680207588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4BnXKvZKuSID7h2I+0QNQw18nHyoNl3kL/EGdhEs0G8=;
 b=CYPHQWVOlfAtRhvhe/YWNfZzApkrpWK7l98MJLw0dvmFli+gQPUyU7y9
 R5h7St2TXqv2ykvrClkPRQZBQkE0PTviWsklaWKLPQ0D7M+xdkItcTl2A
 oYfQCL/ZFHkinTSjYvdTwMC/sxnVnVvFe5TTmsaya1vNUOyQ3ZvCGTOPv
 CqzkxHEhfXmSTbUM/qy55132xmV4IFlhEHjYEFR4DqchmxJwDW8N+vkbR
 NA4ZZrVYUFKodNSSTUTnLpZz9x8qLu+gTthHLUQwgM3dZxoEfPr5SsVRD
 BHQlSiJnBMyOopdZ+0W4l0Tx299kl6V1P+jZF31VzVue9YBnrLOgSQjZ/ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322819835"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322819835"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522045048"
Received: from ggunnam-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:38 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/11] ASoC: SOF: Remove header from struct snd_sof_ipc_msg
Date: Wed, 30 Mar 2022 13:19:25 -0700
Message-Id: <20220330201926.1330402-11-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The header field is no longer used by the underlying code and
can be dropped from the snd_sof_ipc_msg struct.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index fd815ae7f20a..414413932b06 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -349,7 +349,6 @@ struct snd_sof_mailbox {
 /* IPC message descriptor for host <-> DSP IO */
 struct snd_sof_ipc_msg {
 	/* message data */
-	u32 header;
 	void *msg_data;
 	void *reply_data;
 	size_t msg_size;
-- 
2.25.1

