Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF9B4F3CD7
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90033189F;
	Tue,  5 Apr 2022 19:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90033189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179873;
	bh=6z1Po8k+I5542sDrkrAYS4D8uyISfHvLOgyChcVo2RM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KcxhUmleZNCSozEnPRmzTwaUsAOgh8puzNv3adO0LUICnR0tTuKTO/B6ku6PJMV+S
	 FqZZBRpa/wuodiCxun8Q8y8rH7h0hkhfXC6TW3ZAn+rKiLgP1lN+yqpgY9efkGou60
	 gK1I0Nqr3p/2aFWjavIqh4+9ykqvClV8FHPBFIIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14047F80548;
	Tue,  5 Apr 2022 19:27:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B641F80533; Tue,  5 Apr 2022 19:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66A5BF8014B
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66A5BF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LXHi2tnL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179658; x=1680715658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6z1Po8k+I5542sDrkrAYS4D8uyISfHvLOgyChcVo2RM=;
 b=LXHi2tnLkTvTx6F933ByLjiii/hX2C2CHnh3Z4QrYmXFPIsAM0dolYQl
 C/qI8DUeXW6+s4YPKyUojFQsmvQrLxn8kvmsoyRxXlakvDaSZq5N/4zD1
 yxbFi9gacAa6TgS/ghhAa+7sDVR2gb/cDLuoKsBDeNEUYaGMZW15I6auP
 og9SEky9/vpoDLJ6gwXJAzkKD+ARf5gIRrmdZtQLalo+TIgqkP1vU8GNG
 HQVCtcVTnlxxbGK8re/EYLVtSmAnf1FzTyv7MJHI3HDs8+B1G1g8HJWrf
 NrG0/q185Yu13v1xM7QuGh6TW7f4fOZJTH1F1roLz2ZDpA6+c4Djgs5MH Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986749"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986749"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140983"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:24 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/15] ASoC: SOF: ipc: Separate the ops checks by
 functions/topics
Date: Tue,  5 Apr 2022 10:27:01 -0700
Message-Id: <20220405172708.122168-9-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
References: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Separate the mandatory ops checks by topics (pcm and topology for now) to
be able to provide intuitive feedback on the possible missing ops and to
make it easier to add new mandatory ops checks in the future.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index a78b74514438..4966a2a41704 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -1043,6 +1043,7 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc *ipc;
 	struct snd_sof_ipc_msg *msg;
+	const struct sof_ipc_ops *ops;
 
 	ipc = devm_kzalloc(sdev->dev, sizeof(*ipc), GFP_KERNEL);
 	if (!ipc)
@@ -1062,11 +1063,16 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 	 * versions, this will need to be modified to use the selected version at runtime.
 	 */
 	ipc->ops = &ipc3_ops;
+	ops = ipc->ops;
 
 	/* check for mandatory ops */
-	if (!ipc->ops->pcm || !ipc->ops->tplg || !ipc->ops->tplg->widget ||
-	    !ipc->ops->tplg->control) {
-		dev_err(sdev->dev, "Invalid IPC ops\n");
+	if (!ops->pcm) {
+		dev_err(sdev->dev, "Missing IPC PCM ops\n");
+		return NULL;
+	}
+
+	if (!ops->tplg || !ops->tplg->widget || !ops->tplg->control) {
+		dev_err(sdev->dev, "Missing IPC topology ops\n");
 		return NULL;
 	}
 
-- 
2.25.1

