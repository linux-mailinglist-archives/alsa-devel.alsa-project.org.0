Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB8754ECF6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:58:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7184B1AC9;
	Thu, 16 Jun 2022 23:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7184B1AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655416731;
	bh=bQBvuhpbm4i7AJrw0J900uNdeOELlHKd206lPQJRYFQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LuRGkWHGVsDQ9BKPLZrNrwIs/fqc8pHpR54hqxjCycwYHZ7PA0xoWw5nUKkypKX6w
	 BcNA1z4hYFq418rq4vCgzrsiSV3ahr8oRtjDFs2Gp2FWYukDfnnhnvWJHQA+IvlsM6
	 e2mHwh7Qiin0FNxxIdkeqRpy82CYSx5l7ZbVSopk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6686F80570;
	Thu, 16 Jun 2022 23:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E884AF8053D; Thu, 16 Jun 2022 23:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7274CF8052F
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7274CF8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JJqa7Hz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416486; x=1686952486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bQBvuhpbm4i7AJrw0J900uNdeOELlHKd206lPQJRYFQ=;
 b=JJqa7Hz2jKEzYaqeA85yIusDXU3dTYnmkvVEcFl1SyRe/9tgEsVkXlla
 a4evGg+yW572oVECaQKeEETVe5lQYQfWgp4SNSNqN2JFvZHjwHouPVwwX
 cLg802LGhJZ9gQnAIRk3Hhr5OV2NScEki9+1MuabVS8QfuA8p6zwK5L9B
 6jBmUGvcdyVWH9XHSS1nyqyT4u6xaVTUY3xngs1PnwcGalguA8Y/iCI2k
 mn7MahwyOPVe1ZrOz1zh5aNODJrIZ95qOPdMgXDtjGUJvwerpRvKGmb1y
 z4jXys2ZDIsBTchJPY/wKBwSL9nWEIOHXVIjrsM5razmCEsBVNFR9I3q+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268047828"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268047828"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:20 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="675212680"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/13] ASoC: SOF: ipc3-topology: remove use of __func__ in
 dev_dbg
Date: Thu, 16 Jun 2022 16:53:46 -0500
Message-Id: <20220616215351.135643-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
References: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 28d3c14145728..99b62fe7a95cd 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1452,8 +1452,8 @@ static int sof_ipc3_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	if (ret < 0)
 		goto free;
 
-	dev_dbg(scomp->dev, "%s dai %s: type %d index %d\n",
-		__func__, swidget->widget->name, comp_dai->type, comp_dai->dai_index);
+	dev_dbg(scomp->dev, "dai %s: type %d index %d\n",
+		swidget->widget->name, comp_dai->type, comp_dai->dai_index);
 	sof_dbg_comp_config(scomp, &comp_dai->config);
 
 	/* now update DAI config */
-- 
2.34.1

