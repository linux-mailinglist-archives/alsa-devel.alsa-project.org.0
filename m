Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F036BB51
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 23:41:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E9216FA;
	Mon, 26 Apr 2021 23:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E9216FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619473260;
	bh=eTxP4GWxAIRuvlJ61mUfs/61B2Onp8lvgrcpwElpufg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M7wpz4vk0oq1JkVUXYMIPiQyPRNgVmRjq3FD+XchDApYgIbqM6gNnKuq7KAMiLjff
	 rxBtzWfMRh53MwEnZFpimq5wIfskpL1ZpAAuJ+9f9u9qi57geNF0QvfJWyjd+Wutxj
	 eWMH7VsQJck/CwD7fsfscEd+z7AJeWIXtcBD0jG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72A2AF8012A;
	Mon, 26 Apr 2021 23:39:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37378F8016C; Mon, 26 Apr 2021 23:39:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C19F1F800E3
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 23:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C19F1F800E3
IronPort-SDR: TAarhiBj7o18MHfxLWNujMP8vJHvoCmmTEoMwUf5iFLJ7og+nrql9dsBi+qvfTyfd2IL/rgRmA
 Q/LqfxcQYOqg==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="196520038"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="196520038"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 14:39:11 -0700
IronPort-SDR: tItnYJ7GN/8s+Nc0J5oWUZQ6vq/YzbB9SfUPhXc3dLLUPXx4RXp+MVsm7ehUHzyge0ZN9v+4/4
 lqFaGwgijNsQ==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="465257428"
Received: from bcochran-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.24.80])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 14:39:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: virtio: fix kernel-doc
Date: Mon, 26 Apr 2021 16:39:02 -0500
Message-Id: <20210426213902.234711-1-pierre-louis.bossart@linux.intel.com>
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

make W=1 warning:

sound/virtio/virtio_ctl_msg.c:70: warning: expecting prototype for
virtsnd_ctl_msg_request(). Prototype was for
virtsnd_ctl_msg_response() instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/virtio/virtio_ctl_msg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 26ff7e7cc041..18dc5aca2e0c 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -61,7 +61,7 @@ void *virtsnd_ctl_msg_request(struct virtio_snd_msg *msg)
 }
 
 /**
- * virtsnd_ctl_msg_request() - Get a pointer to the response header.
+ * virtsnd_ctl_msg_response() - Get a pointer to the response header.
  * @msg: Control message.
  *
  * Context: Any context.
-- 
2.25.1

