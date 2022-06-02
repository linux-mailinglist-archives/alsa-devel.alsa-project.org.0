Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A7053BA5C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 16:00:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87EC91785;
	Thu,  2 Jun 2022 15:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87EC91785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178427;
	bh=uOwNYbOInNeH7er3n7+1lBokyIeBy+L3vOymfZhD1Ww=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DZzLPN1yVV/XNT5MWvoRsLLgf0GeDl1wupkIvfTsqLfk9WHuA0Jq/PlfuUOOHYu4O
	 tlc7zFRFaqVr5XhMY20mqUc2ilPhy77Zlxf3/hgPQy3WbxxX98//lOQa6XtmtuiQdp
	 GVr9Z9c9fwLSk0KsKs1EXTxjwZMP+y/vN6MUwoEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4881F80525;
	Thu,  2 Jun 2022 15:58:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A22F5F80272; Thu,  2 Jun 2022 15:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C814F80149;
 Thu,  2 Jun 2022 15:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C814F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="C/1m/ApB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654178286; x=1685714286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uOwNYbOInNeH7er3n7+1lBokyIeBy+L3vOymfZhD1Ww=;
 b=C/1m/ApBx6Mq72/2Yv8xOjAHVfRblOdbWfRv6XEvNcpyKhWK20P4hUCT
 3y+vOKy5MPU16HPzZD5YWz6hubB0BGUus4A9Uj9ZopJPgKcQBVO2NfbO0
 axeYEIFX/YQnYe8+VXC2J+AwbTyBkkKWLlyfZDRxhzKiZ9N/cj/jdZ6jg
 fM+Q57CDHwRGnGpSRF+vF5v7BLYX2bAZBADrN6dvEXFvLHa5vKMOXqHTX
 5W+55PODamqRa0u0RDfCRjoBmQFNDMe8+VhLrGxmDkXSzCWt0TSjGGR6/
 CeR/M0PtW9IEQ55l3bnl9d1+ix4oO8fbUUFAnfcQfYC0HcCyF6JFt76Vh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="336612795"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="336612795"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 06:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="646007960"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2022 06:57:56 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Fix potential NULL pointer dereference
Date: Thu,  2 Jun 2022 15:57:57 +0200
Message-Id: <20220602135757.3335351-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

Cleanup path for sof_prepare_widgets_in_path() should check if unprepare
callback exists before calling it, instead it checks if it does not
exist. Fix the check.

Fixes: 370014c8197a ("ASoC: SOF: Add a prepare op to IPC topology widget ops")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index cd41d0599cef..789d0a1f1a77 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -323,7 +323,7 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 			p->walking = false;
 			if (ret < 0) {
 				/* unprepare the source widget */
-				if (!widget_ops[widget->id].ipc_unprepare && swidget->prepared) {
+				if (widget_ops[widget->id].ipc_unprepare && swidget->prepared) {
 					widget_ops[widget->id].ipc_unprepare(swidget);
 					swidget->prepared = false;
 				}
-- 
2.25.1

