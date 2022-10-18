Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006C2602BE4
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:40:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86BCA8C67;
	Tue, 18 Oct 2022 14:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86BCA8C67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666096851;
	bh=vyOl79lnKFcTaoykGkTKSO91hE/fx6d+lWeT8+3jnoc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XhP2fx3hzG6aoETFyK6Z4/GO+ud0xGlNl/yw7jzCYuAIOI84uyOAK1qCKwfggxOdy
	 s1TdJYX0MaNVDLWkz3PM64hv/ViLmQJlvHtX1MqNjsp/HfACXDLv/o1RhRrGiQG6/z
	 EmM53mNkMy0SDQOIaE5hvx25p2xb0x2+jZ8sPcGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D75F80542;
	Tue, 18 Oct 2022 14:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32FE7F80542; Tue, 18 Oct 2022 14:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97CFAF804C1
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97CFAF804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SVz48xYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666096792; x=1697632792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vyOl79lnKFcTaoykGkTKSO91hE/fx6d+lWeT8+3jnoc=;
 b=SVz48xYRwWJGHGyKC3IqJ+k9iptGHlNJ1EQBEVL4BTGes9BYEe2x/mfO
 x+Z3NNtsA3CePMn6ktnC57wAjyDfb+7CO8snj4cBm+udoWfgXxHx+Pgis
 BjwilndfX+m1FRLyYJqwWf9bkZQk0rXUmDWhmpripye/OfyWxI8xkOIKb
 nRtzqLYDQ2+LBNsETCLmPyub4AsZZJx544PCMtgoW59cHwXg8KSEnDCVY
 0cJAPmONeHoC/WICgjlnZJ1ZQB3hcP6BXVaZ/Q/AryLt3EjxCFUuUjX2d
 70wxmKzQtbzCzsyu1ioHSRM3x/QnaeAwhCMpsGD05YgW0xhnDFqbGIzgo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="304828555"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="304828555"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:39:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="717912763"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="717912763"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:39:47 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/4] ASoC: SOF: ipc4: Log the tx message before sending it
Date: Tue, 18 Oct 2022 15:40:05 +0300
Message-Id: <20221018124008.6846-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
References: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, rander.wang@intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

It makes more sense to log the message before it is sent to the DSP.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/ipc4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 6eaa18e27e5a..3c9b8692984a 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -342,6 +342,8 @@ static int ipc4_tx_msg_unlocked(struct snd_sof_ipc *ipc,
 	if (msg_bytes > ipc->max_payload_size || reply_bytes > ipc->max_payload_size)
 		return -EINVAL;
 
+	sof_ipc4_log_header(sdev->dev, "ipc tx      ", msg_data, true);
+
 	ret = sof_ipc_send_msg(sdev, msg_data, msg_bytes, reply_bytes);
 	if (ret) {
 		dev_err_ratelimited(sdev->dev,
@@ -350,8 +352,6 @@ static int ipc4_tx_msg_unlocked(struct snd_sof_ipc *ipc,
 		return ret;
 	}
 
-	sof_ipc4_log_header(sdev->dev, "ipc tx      ", msg_data, true);
-
 	/* now wait for completion */
 	return ipc4_wait_tx_done(ipc, reply_data);
 }
-- 
2.38.0

