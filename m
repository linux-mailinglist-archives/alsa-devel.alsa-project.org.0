Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52955BD67
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 04:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79F5C1672;
	Tue, 28 Jun 2022 04:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79F5C1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656382983;
	bh=7+vAJRMgtUyHbUhQ3ZnX7OzDRmk02qzdXICIrnOXpPQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NDqCWhVeqWQL4n7IUzEiMYx7PoWin3ajrvQV8tpu0WFGTwq1fRiXVgS9rCaqfAODB
	 MRSyOWI2fFw22PrDmgfSRSQFgZqP0PKwlGZA2D2+3AJ60Tda95woirBZLat/QDohlt
	 wng9VNo6PwjP6KeTc6LUKb2KKHKSRO9VATJDRuhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1014FF80537;
	Tue, 28 Jun 2022 04:21:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC2BFF80538; Tue, 28 Jun 2022 04:21:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 732C9F8052E
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 04:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 732C9F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kLdOhpI2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9F886184B;
 Tue, 28 Jun 2022 02:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C52C34115;
 Tue, 28 Jun 2022 02:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382900;
 bh=7+vAJRMgtUyHbUhQ3ZnX7OzDRmk02qzdXICIrnOXpPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kLdOhpI2cwqrbQrajZkKuLpg7qNyYCkG+vnq0mE6ehJGXEvzgYvmazMnXR8yfS6XQ
 Yqmfya0+rjqKCI5ZyZ/WRkv/N+AumQ2HkMFekSUa9nA8LIV8VGsnhsId5s4/CUOioi
 TZCJ3p7lUeg3dUPIYr4cWExXRXfHcSLX6HGR4GzpMjur4CcjnJr+Mkw61a8pmf2k2X
 v75ty0B99pQtrnncI4W5nSH2OT3FpcZid8GcPuBcZ67fQo/3QOp513tOlZdjAz5bfw
 cbLFIEV8loK55BuMk/GpXCTyKtjmd3VIhjHZFbq9yCynqS90latO9YsJPKjxwVBY/Z
 7FvHljPE2nfrg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 15/41] ALSA: x86: intel_hdmi_audio: use
 pm_runtime_resume_and_get()
Date: Mon, 27 Jun 2022 22:20:34 -0400
Message-Id: <20220628022100.595243-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022100.595243-1-sashal@kernel.org>
References: <20220628022100.595243-1-sashal@kernel.org>
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
index b16657de9d25..fea043ec42fe 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1068,7 +1068,9 @@ static int had_pcm_open(struct snd_pcm_substream *substream)
 	intelhaddata = snd_pcm_substream_chip(substream);
 	runtime = substream->runtime;
 
-	pm_runtime_get_sync(intelhaddata->dev);
+	retval = pm_runtime_resume_and_get(intelhaddata->dev);
+	if (retval < 0)
+		return retval;
 
 	/* set the runtime hw parameter with local snd_pcm_hardware struct */
 	runtime->hw = had_pcm_hardware;
@@ -1549,8 +1551,12 @@ static void had_audio_wq(struct work_struct *work)
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

