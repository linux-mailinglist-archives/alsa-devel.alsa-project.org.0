Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E004E4352
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:49:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A25A11732;
	Tue, 22 Mar 2022 16:49:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A25A11732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647964194;
	bh=k9HdjOm2oLLUm+/TjF+bj2AcjzHOpnumMpBi9ZN5JGo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RW771HBpW9wml/EpKM4ED2ZDbrcmafc66mAmeZQ5Uh0LM42TzYIpwa4HzxYhvmlEM
	 WJoehgXSJiUyuW3b//GbdHoLjidq5U7OTMY9ocYWKpZzLx/8f4KqGSJO+kTng58PK2
	 PnIzvMgMCLQJES36RA9qnvmO/sPJikc7XiVJShsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE9DF8012A;
	Tue, 22 Mar 2022 16:48:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F208F8016C; Tue, 22 Mar 2022 16:48:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37D4BF80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 16:48:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37D4BF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="zhoXFgCk"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="2Vsyqf9G"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 62D231F388;
 Tue, 22 Mar 2022 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647964112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DTE9I7qa9MhB/J5xvqDekO0wkX+47GMipzGFMyWvaEM=;
 b=zhoXFgCkKhccE03+hc8rMpmTxO+eqUiASra0E9wFqbZ5KkISXLUYUt/7x2HmKJPreYT3VV
 eV6b5lZQUcIs9xBRiH2ILbVASvdHrAJbc5bSpY792D92A3sqT/CdG5dyyhgV4dDe1vnHDS
 AVFmzLiwrEJR/LtWbsbvi8fjMDjkiSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647964112;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DTE9I7qa9MhB/J5xvqDekO0wkX+47GMipzGFMyWvaEM=;
 b=2Vsyqf9GDm9lmZmeMWkAS8nFECYDJZUVoWK71hvkjqj53AGpOkRBwX3lNhJPw05OG/b1TK
 UMN+v5TG104YK/AA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 09C84A3B81;
 Tue, 22 Mar 2022 15:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: intel: atom: Remove superfluous flush_scheduled_work()
Date: Tue, 22 Mar 2022 16:48:26 +0100
Message-Id: <20220322154826.19400-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
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

It seems that flush_scheduled_work() is called without any real
purpose at sst_context_cleanup() (the driver doesn't put works on the
global queue at all).  As the flush_schedule_work() function is going
to be abolished in near future, let's drop it now.

Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/atom/sst/sst.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index e21e11dac000..3a42d68c0247 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -360,7 +360,6 @@ void sst_context_cleanup(struct intel_sst_drv *ctx)
 	sst_unregister(ctx->dev);
 	sst_set_fw_state_locked(ctx, SST_SHUTDOWN);
 	sysfs_remove_group(&ctx->dev->kobj, &sst_fw_version_attr_group);
-	flush_scheduled_work();
 	destroy_workqueue(ctx->post_msg_wq);
 	cpu_latency_qos_remove_request(ctx->qos);
 	kfree(ctx->fw_sg_list.src);
-- 
2.31.1

