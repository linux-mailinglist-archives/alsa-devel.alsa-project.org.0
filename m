Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C124C460D
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:23:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4FAD1EED;
	Fri, 25 Feb 2022 14:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4FAD1EED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795391;
	bh=GLzWDimUUvBsKksT8nNSyX03GWs62ynqiT2FPYF0Tto=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LSyE9fF9SW+8CATQVhqRbXfThcbbz71GshyGfo9Svl+vOKxXkoEIX0D92uAz1fiBX
	 zbaRusJH52wFpaW6r0DoCuiLHPE4yzQxAl35q/cgtAGJrEk61//s90ncvRbExeeOWS
	 Hla5dYqQfUJGN2oRW1vEQJ1KKdHfLPStNH6GUvc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DF5CF8060D;
	Fri, 25 Feb 2022 14:11:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0A1BF80132; Fri, 25 Feb 2022 11:40:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37387F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 11:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37387F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Fly5+afl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645785615; x=1677321615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Lh99pIe6P2Nw6W6x79cUpkUeEAEuCSeab91A4DY0/c0=;
 b=Fly5+aflUMTv3QB5nrN4Xy6m1U7dYLNHa+iNeb5leJs7eO2QaAu7KaOY
 qqiEr/3A4bB9tog7EIPt+MpVt1wSl2/0GhehS94PGheuaBfNlouR1od87
 NLHpVNI/dHAr0o5VdI4EbepT5tnb2OFvxKF/YPjbnkaOptRBTq4w8JDgL k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Feb 2022 02:40:10 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 02:40:10 -0800
Received: from hu-rbankapu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 02:40:06 -0800
From: Raghu Bankapur <quic_rbankapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, ierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Kai
 Vehmanen" <kai.vehmanen@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Raghu Bankapur <quic_rbankapu@quicinc.com>,
 <alsa-devel@alsa-project.org>, Zubin Mithra <zsm@chromium.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V0 1/1] ALSA: pcm: fix blocking while loop in
 snd_pcm_update_hw_ptr0()
Date: Fri, 25 Feb 2022 16:09:32 +0530
Message-ID: <4d8b1cb4b0db88c3e28207a81403fbf1e4a87bff.1645784757.git.quic_rbankapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1645784757.git.quic_rbankapu@quicinc.com>
References: <cover.1645784757.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:19 +0100
Cc: Krishna Jha <quic_kkishorj@quicinc.com>
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

When period interrupts are disabled, while loop in snd_pcm_update_hw_ptr0()
results in the machine locking up if runtime->hw_ptr_buffer_jiffies is 0.
Validate runtime->hw_ptr_buffer_jiffies value before while loop to avoid
delta check.

Signed-off-by: Raghu Bankapur <quic_rbankapu@quicinc.com>
---
 sound/core/pcm_lib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index f2090025236b..bb9097f658be 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -352,7 +352,8 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 		 * the elapsed time to detect xruns.
 		 */
 		jdelta = curr_jiffies - runtime->hw_ptr_jiffies;
-		if (jdelta < runtime->hw_ptr_buffer_jiffies / 2)
+		if ((jdelta < runtime->hw_ptr_buffer_jiffies / 2) ||
+			(runtime->hw_ptr_buffer_jiffies <= 0))
 			goto no_delta_check;
 		hdelta = jdelta - delta * HZ / runtime->rate;
 		xrun_threshold = runtime->hw_ptr_buffer_jiffies / 2 + 1;
-- 
2.17.1

