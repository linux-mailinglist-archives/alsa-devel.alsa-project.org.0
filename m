Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A72602D27
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 15:39:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E020D9158;
	Tue, 18 Oct 2022 15:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E020D9158
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666100366;
	bh=p+MDVVA/bJ2AmKjsTI6U0xnwldHtoLIYFUmjH+IJ+qU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EIgrt8sFCr8kzpxSzLVRVftq5BjfF/Tc+z0mxqnGki2CEDEuqhBklDRTzYStwwswi
	 uIh8HjQ6rFKh8UeU8DuW8yUXJ5hzy6U4Q04hJKNG0OV8kbEeDA2EzsuyD/eb1WifEa
	 22jf+IVIOhQZBuvKdJg+jtQRjFyX8bsilq7rZxlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A5F9F800AA;
	Tue, 18 Oct 2022 15:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 392D0F8024C; Tue, 18 Oct 2022 15:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30C52F800AA
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 15:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30C52F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="noFbK31q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666100307; x=1697636307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p+MDVVA/bJ2AmKjsTI6U0xnwldHtoLIYFUmjH+IJ+qU=;
 b=noFbK31qHS6uOE6s6/lJOsAeWgCERcZQwxLyzUbtAW+ZLAnWwRuJC7E4
 C5ARiyhXAon8Bd5O9QeOcUuqBQD6GTMQCXn0yYNEvg6Z3Dji5pnEbpnBi
 f9uCgKRKrmaYBO+wOefi8vniHPTwiB0MniegdDTFWHH9P2zCi8OTP3oJ6
 dmYO6xVPXZ/H36IvYS4YdXZZ5KGX+8vIhx7j1DkX3I/8SSEQLWKkYM0N8
 UnAe+2oThiIkVHOBB6EpgWDYB9UvmP92L1K2Nh2w9wyEBykfTZnhsbZTO
 uUeIskF4C7jSvgGA0eCHKOvOnErifnS/7LevYiAv/JYDMYTmgKnIdoxdH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="332650646"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="332650646"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 06:38:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="691810122"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="691810122"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 06:38:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc3: Log the tx message before sending it
Date: Tue, 18 Oct 2022 16:38:43 +0300
Message-Id: <20221018133843.16958-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
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
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index b28af3a48b70..1fef4dcc0936 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -329,6 +329,8 @@ static int ipc3_tx_msg_unlocked(struct snd_sof_ipc *ipc,
 	struct snd_sof_dev *sdev = ipc->sdev;
 	int ret;
 
+	ipc3_log_header(sdev->dev, "ipc tx", hdr->cmd);
+
 	ret = sof_ipc_send_msg(sdev, msg_data, msg_bytes, reply_bytes);
 
 	if (ret) {
@@ -338,8 +340,6 @@ static int ipc3_tx_msg_unlocked(struct snd_sof_ipc *ipc,
 		return ret;
 	}
 
-	ipc3_log_header(sdev->dev, "ipc tx", hdr->cmd);
-
 	/* now wait for completion */
 	return ipc3_wait_tx_done(ipc, reply_data);
 }
-- 
2.38.0

