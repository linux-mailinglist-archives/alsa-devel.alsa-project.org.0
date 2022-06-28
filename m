Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7755BD79
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 04:24:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ED631675;
	Tue, 28 Jun 2022 04:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ED631675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656383067;
	bh=tWZ9EunSuGCCxl4UhxUmXpJelRVkeuq3GF+P6mU2hRM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=reyhBEVL9ZKFkLtLZ0NczE0dI1/3cEhNPUZ3biDuxoLXM93FAO/XJXJxxXD4ZhT5Z
	 z4j275zVL1qNPpls7Jv+VNeRseR9z0+afC9a0Yyy3eSPCpQyLpOBthiEAs/qb6gSyP
	 ytcW1oP4nkeelW/fR96KyJBDCxlzlLWjbAk+D/hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4450EF804F2;
	Tue, 28 Jun 2022 04:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F9ACF8049E; Tue, 28 Jun 2022 04:23:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82A47F8028B
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 04:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82A47F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="grVnVqMT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4717C61861;
 Tue, 28 Jun 2022 02:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121C2C34115;
 Tue, 28 Jun 2022 02:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382996;
 bh=tWZ9EunSuGCCxl4UhxUmXpJelRVkeuq3GF+P6mU2hRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=grVnVqMTu6z/6XrdVupCZSpULLlqbIwEgpQnblRPa7KkecN7g/PEjsy82j+ot5a70
 5aKUTG90bTZzVq6F96S56Vrekx1yZWZGPZvFWeBUJWmwbRIsmQPVuCh+rP0QaoUDjM
 hVYjh5HkbJzfKFBYEZmQde7aEr2CRDXr3UvOEMnuLujk8fPFYsUn/dJpQh/DNFZULk
 /qmEmxq+yxpapFV4KvCiZUheKdiFZLWDrITqqlHtna00q7GgGUelrzHbDAYNEX0zYE
 WWjSzzRb0LHSdcpnNsutdwlEuJfOd8W3LuYhxLJHbwFV3cfUjPFdk7MfkS824Q6VHZ
 UX4DKw4W7r+0w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 12/34] ALSA: x86: intel_hdmi_audio: use
 pm_runtime_resume_and_get()
Date: Mon, 27 Jun 2022 22:22:19 -0400
Message-Id: <20220628022241.595835-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022241.595835-1-sashal@kernel.org>
References: <20220628022241.595835-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 jiasheng@iscas.ac.cn, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, nizhen@uniontech.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, gushengxian@yulong.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit bb30b453fedac277d66220431fd7063d9ddc10d8 ]

The current code does not check for errors and does not release the
reference on errors.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20220616222910.136854-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/x86/intel_hdmi_audio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 2c150bce30bb..bb0a03e14fed 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1067,7 +1067,9 @@ static int had_pcm_open(struct snd_pcm_substream *substream)
 	intelhaddata = snd_pcm_substream_chip(substream);
 	runtime = substream->runtime;
 
-	pm_runtime_get_sync(intelhaddata->dev);
+	retval = pm_runtime_resume_and_get(intelhaddata->dev);
+	if (retval < 0)
+		return retval;
 
 	/* set the runtime hw parameter with local snd_pcm_hardware struct */
 	runtime->hw = had_pcm_hardware;
@@ -1564,8 +1566,12 @@ static void had_audio_wq(struct work_struct *work)
 		container_of(work, struct snd_intelhad, hdmi_audio_wq);
 	struct intel_hdmi_lpe_audio_pdata *pdata = ctx->dev->platform_data;
 	struct intel_hdmi_lpe_audio_port_pdata *ppdata = &pdata->port[ctx->port];
+	int ret;
+
+	ret = pm_runtime_resume_and_get(ctx->dev);
+	if (ret < 0)
+		return;
 
-	pm_runtime_get_sync(ctx->dev);
 	mutex_lock(&ctx->mutex);
 	if (ppdata->pipe < 0) {
 		dev_dbg(ctx->dev, "%s: Event: HAD_NOTIFY_HOT_UNPLUG : port = %d\n",
-- 
2.35.1

