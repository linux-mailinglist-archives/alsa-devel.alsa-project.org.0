Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A34F936A686
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Apr 2021 12:14:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EFD2169A;
	Sun, 25 Apr 2021 12:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EFD2169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619345662;
	bh=24tAGv3l3j8eqIaQ9XAw9L1yiRdrP2HS/7JzTufwAx0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bxzr55tqI8cNMmAyqMwCAMxo4urHTCfXTnArprPWcQU6GOPldK1u7DbYApSm/HyZz
	 WYAG+XcVBmQ6AlqeYnJhZ5Q/zicrrTL+ZLlZOruYRXapOL3YiJM58zJwrgTmW+bl6+
	 rkCD9+f4uAOivW+GkQy5DJWqYhsd8picSfZhap0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A194F80086;
	Sun, 25 Apr 2021 12:12:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4159F801EC; Sun, 25 Apr 2021 12:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 500C2F800E3
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 12:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 500C2F800E3
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R431e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=12; SR=0; TI=SMTPD_---0UWg2GZT_1619345556; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UWg2GZT_1619345556) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 25 Apr 2021 18:12:37 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: perex@perex.cz
Subject: [PATCH] ASoC: q6dsp: q6afe: remove unneeded dead-store initialization
Date: Sun, 25 Apr 2021 18:12:33 +0800
Message-Id: <1619345553-29781-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 linux-kernel@vger.kernel.org, ndesaulniers@google.com, lgirdwood@gmail.com,
 tiwai@suse.com, nathan@kernel.org, clang-built-linux@googlegroups.com,
 broonie@kernel.org, Yang Li <yang.lee@linux.alibaba.com>
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

Variables 'wait' and 'port_id' are being initialized, however the
values are never read and updated later on, hence the redundant
initializations can be removed.

Cleans up clang warnings:
sound/soc/qcom/qdsp6/q6afe.c:933:21: warning: Value stored to 'wait'
during its initialization is never read
sound/soc/qcom/qdsp6/q6afe.c:1186:6: warning: Value stored to 'port_id'
during its initialization is never read

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index cad1cd1..442bf27 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -930,7 +930,7 @@ int q6afe_get_port_id(int index)
 static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 			    struct q6afe_port *port, uint32_t rsp_opcode)
 {
-	wait_queue_head_t *wait = &port->wait;
+	wait_queue_head_t *wait;
 	struct aprv2_ibasic_rsp_result_t *result;
 	int ret;
 
@@ -1183,7 +1183,7 @@ int q6afe_port_stop(struct q6afe_port *port)
 	struct afe_port_cmd_device_stop *stop;
 	struct q6afe *afe = port->afe;
 	struct apr_pkt *pkt;
-	int port_id = port->id;
+	int port_id;
 	int ret = 0;
 	int index, pkt_size;
 	void *p;
-- 
1.8.3.1

