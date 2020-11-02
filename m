Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE4D2A2B13
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 13:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D2BD16CE;
	Mon,  2 Nov 2020 13:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D2BD16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604321831;
	bh=cfAR1pH3dVtSxS5RypZthRJK5XDo9UIFqfEchlaeJXc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CHQM1PDPrxbCtGJu1YoqOlkFow3N+l/PlygmR2AJRyqMJnkwnMatA+Za2qW7ktAWK
	 oLZpNWzkVd8AFMzZ1Q7aGX9VUYAvfC6XpQNz3YwSV4mO0eqfrDi4IZVYWvMKVR8JSZ
	 BXAGXMdEfuZrui6JiNREIafDBWIPxK7Feq570x6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C9FF80234;
	Mon,  2 Nov 2020 13:55:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E021F80232; Mon,  2 Nov 2020 13:55:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF0EFF80083;
 Mon,  2 Nov 2020 13:55:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF0EFF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="pekivcZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=638; q=dns/txt; s=axis-central1;
 t=1604321731; x=1635857731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FwAyDfF8hpGLaLeCnfcNMUsZXvQZIufsf9z0qm9Gy8o=;
 b=pekivcZxtSbava6t6vPdosuBhBcJS1VRtAmMZHkN4NuSpJa+c6VNu5fF
 wEyqQa0K9Wp0KTLpCCD/ADi79pl/bhpQmq7tgZslQVJmCDTjC2MGdKdRf
 YbArAIcMRHRhKzU6jmHKEwS0D1AcI86aVh7BUo20FT+h+bR7KgjSMVAoK
 c6vg4GuK1zC1clMI7MZA0Yqp6f7gcGMJ97SrkiZfbFVS8IOSNIRxFUjiu
 QfT4tezMpyY9jG8vYG/NVqq+TMbuyJ2bnZE3abQBPUVEStLAFcMX2AAgr
 Z8bi4CB9+XP1Xwo+4apzZ6jCFwXcJBeQr4eTBeLT2uDkq+IUDLXpbzDL9 Q==;
IronPort-SDR: 8KQ3HAlPnH6l/SfutxQ6CynuvNX0Wc3mVbukqr0xnkkWS7VShmRiclHz+d+kL6+YrrV4AAAeIM
 ON7JTFrbw5fwu0dTXDDh+h8FWP43bFHvFrQWjfaTWjzRm7aVrRPImko9c4ymq+9j+MKpFWKZ0g
 8VEK3M7pzzRYnvy+K4a2xKEqLup2t8qP5ofz11xdQR6VVqmIr33A8ofZP2zDw507TeHaSsIMV6
 3ZuIKz/NLxSZIdoaNwmIauqOF4QGOG0OSTH3Jtkx/ZaOJ4iqTU40ekxmznc/Wk+ONfLIXeLndv
 F2s=
X-IronPort-AV: E=Sophos;i="5.77,444,1596492000"; d="scan'208";a="14649641"
From: Jonas Holmberg <jonashg@axis.com>
To: <patch@alsa-project.org>
Subject: [PATCH] pcm: set the snd_pcm_ioplug_status() tstamp field
Date: Mon, 2 Nov 2020 13:55:25 +0100
Message-ID: <20201102125525.194607-1-jonashg@axis.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org
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

Signed-off-by: Jonas Holmberg <jonashg@axis.com>
---
 src/pcm/pcm_ioplug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/pcm/pcm_ioplug.c b/src/pcm/pcm_ioplug.c
index a437ca32..9b1b8ac3 100644
--- a/src/pcm/pcm_ioplug.c
+++ b/src/pcm/pcm_ioplug.c
@@ -115,6 +115,7 @@ static int snd_pcm_ioplug_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
 	snd_pcm_ioplug_hw_ptr_update(pcm);
 	status->state = io->data->state;
 	status->trigger_tstamp = io->trigger_tstamp;
+	gettimestamp(&status->tstamp, pcm->tstamp_type);
 	status->avail = snd_pcm_mmap_avail(pcm);
 	status->avail_max = io->avail_max;
 	return 0;
-- 
2.26.2

