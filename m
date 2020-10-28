Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E047229CFD0
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 12:52:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73B931662;
	Wed, 28 Oct 2020 12:52:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73B931662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603885976;
	bh=c12bJf2SLR1JPyc5Gc1S2OwnuOb2xlgGO1rOhQ9ypfo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FYaRflqbeav/XxAkjmW/75UPGMHbM8k09Llb/4WtCYo20uJp82IZiUk0UpJw23hZG
	 aa4Fs2lj9jXiQGE18t1XYOBsWVabAEuVhmxZ/1do6Rk8WpC98yclXXrNLqm3vyQhuV
	 LwA8FZKHBsCbDkJPPcl7CWqb315CYpaGMOPA11XM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B3CF80134;
	Wed, 28 Oct 2020 12:51:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0549F80212; Wed, 28 Oct 2020 12:51:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BACBF80134
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 12:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BACBF80134
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kXjyy-0003ON-Nj; Wed, 28 Oct 2020 11:51:12 +0000
From: Colin King <colin.king@canonical.com>
To: Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>, alsa-devel@alsa-project.org
Subject: [PATCH][next] ASoC: qcom: fix unsigned int bitwidth compared to less
 than zero
Date: Wed, 28 Oct 2020 11:51:12 +0000
Message-Id: <20201028115112.109017-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

The check for an error return from the call to snd_pcm_format_width
is never true as the unsigned int bitwidth can never be less than
zero. Fix this by making bitwidth an int.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/qcom/lpass-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
index 172952d3a5d6..abfb8737a89f 100644
--- a/sound/soc/qcom/lpass-hdmi.c
+++ b/sound/soc/qcom/lpass-hdmi.c
@@ -24,7 +24,7 @@ static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	unsigned int channels = params_channels(params);
 	unsigned int ret;
-	unsigned int bitwidth;
+	int bitwidth;
 	unsigned int word_length;
 	unsigned int ch_sts_buf0;
 	unsigned int ch_sts_buf1;
-- 
2.27.0

