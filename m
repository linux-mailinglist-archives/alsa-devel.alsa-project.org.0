Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 641AA26EB4D
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 04:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02AB01693;
	Fri, 18 Sep 2020 04:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02AB01693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600394780;
	bh=K8YFbiPi9jArRe8RYEmaRUiNBfLLK+iMBy+K9lLk7ok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CnFpH1H/dnUhjfOvwLwiBG+SThw8h9V11aQ14UH66nxYzT9EU+k5jb6R5Yd0v7fIQ
	 5RrnzeRZ4ZJ31lcPgBQpjiL5Xi6CytXfTXxtz6eDmANzKzdQFDchxYhSiLAErAmATK
	 r0YIgrQc7yJH0HC//VXtI3LNAGkwG3GtNK/2id78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5AB9F802A7;
	Fri, 18 Sep 2020 04:04:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 653A5F8020B; Fri, 18 Sep 2020 04:04:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF1D2F801F7
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 04:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF1D2F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uK8PWcIn"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3E1723600;
 Fri, 18 Sep 2020 02:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394652;
 bh=K8YFbiPi9jArRe8RYEmaRUiNBfLLK+iMBy+K9lLk7ok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uK8PWcInO1WMeNq4wtmczq5BxJY/IVrRnyjZz+qD6f5qJYQL2EY/erK6eU+GpFmHL
 oF5TurkOxi8Lu1Zoritgc995r0Tzxw1tOSQEyKMfgvi0Ajr0CHLhX7wozWA8ZPM1E5
 tm4RyvKhKgDPbqGIHoGoCt8B3PkYvt/d9+lIZSoc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 149/330] ASoC: SOF: ipc: check ipc return value
 before data copy
Date: Thu, 17 Sep 2020 21:58:09 -0400
Message-Id: <20200918020110.2063155-149-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Jaska Uimonen <jaska.uimonen@linux.intel.com>,
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

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

[ Upstream commit 1919b42ca4ad75a2397081164661af3ce5a7b8f4 ]

In tx_wait_done the ipc payload is copied before the DSP transaction
error code is checked. This might lead to corrupted data in kernel side
even though the error would be handled later. It is also pointless to
copy the data in case of error. So change the order of error check and
copy.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Link: https://lore.kernel.org/r/20200228231850.9226-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/ipc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index e7b1a80e2a14c..f38f651da2246 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -215,15 +215,17 @@ static int tx_wait_done(struct snd_sof_ipc *ipc, struct snd_sof_ipc_msg *msg,
 		snd_sof_trace_notify_for_error(ipc->sdev);
 		ret = -ETIMEDOUT;
 	} else {
-		/* copy the data returned from DSP */
 		ret = msg->reply_error;
-		if (msg->reply_size)
-			memcpy(reply_data, msg->reply_data, msg->reply_size);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(sdev->dev, "error: ipc error for 0x%x size %zu\n",
 				hdr->cmd, msg->reply_size);
-		else
+		} else {
 			ipc_log_header(sdev->dev, "ipc tx succeeded", hdr->cmd);
+			if (msg->reply_size)
+				/* copy the data returned from DSP */
+				memcpy(reply_data, msg->reply_data,
+				       msg->reply_size);
+		}
 	}
 
 	return ret;
-- 
2.25.1

