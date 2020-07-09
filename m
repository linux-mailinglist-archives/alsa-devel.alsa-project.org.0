Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 535D321A4C0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:26:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4C291662;
	Thu,  9 Jul 2020 18:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4C291662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594311999;
	bh=/42enHWFYMt+3GZhZfRvPdqhhC3BG6NgnHIaCBq9EB8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fyVv+6G7PSH+xR3CXK9J1eiCjfRSTNIlHOhgO599wJpm0U3FsilRpLrC5ZJh5yw8x
	 RaVwXdn5ioUpbCBnXy76IVdTI4yNiBRthxJxP5QDeO/3Pv2GFTuE/LBgZtUydW7sE+
	 4i+BVsZuErJNkCRQRg3A6vp0JC4N9Cazp4586uH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F29F801F9;
	Thu,  9 Jul 2020 18:24:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A344F802BE; Thu,  9 Jul 2020 18:24:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73CE5F800AE
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73CE5F800AE
IronPort-SDR: TQwNiz75zTqIini2gadxqHFcu7+eVjHeLSmKnwPc3PU2b5StZfMnfq3S/6yL4yCueCbpur69Uc
 nzqqiXvoDuHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="149515619"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="149515619"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:44 -0700
IronPort-SDR: o5wxybthMLOSoX8vtEzUionP4cDeJvp8FUkjdghoDd1My8WEGfmOeaBmnMztT5xOfjtzvAUs1q
 m0O98zXqCC+w==
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="280352973"
Received: from mdcoakle-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 02/10] ASoC: qcom: qdsp6: q6asm: Provide documentation for
 'codec_profile'
Date: Thu,  9 Jul 2020 11:23:19 -0500
Message-Id: <20200709162328.259586-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
References: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Banajit Goswami <bgoswami@codeaurora.org>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Weitao Hou <houweitaoo@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Lee Jones <lee.jones@linaro.org>
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

Fixes the following W=1 kernel build warning(s):

sound/soc/qcom/qdsp6/q6asm.c:924: warning: Function parameter or
member 'codec_profile' not described in 'q6asm_open_write'

Cc: Patrick Lai <plai@codeaurora.org>
Cc: Banajit Goswami <bgoswami@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index e0983970cba9..755062eadcc8 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -912,9 +912,9 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
 
 /**
  * q6asm_open_write() - Open audio client for writing
- *
  * @ac: audio client pointer
  * @format: audio sample format
+ * @codec_profile: compressed format profile
  * @bits_per_sample: bits per sample
  *
  * Return: Will be an negative value on error or zero on success
-- 
2.25.1

