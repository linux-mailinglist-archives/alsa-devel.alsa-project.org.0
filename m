Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626454ECE6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:56:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB431B08;
	Thu, 16 Jun 2022 23:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB431B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655416586;
	bh=qaYjoDafa+OjC6LFqARHacT5WUU7JTQ5bcPXzBExjSA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VIydoiuaKnNii5xhQRZkGgeba7q9pwZIJYrxfyvVdJYRr1zNHNiw+gvVzvg1mP+Xt
	 wvNrZyibNmNZddA+Io0KrTN2Tz/H+rOXyaXVrRGxsemJt5lhz7w92kw3OWaCeqUmZd
	 1ojVPg0t3yNecaxYv6cbEk301GvBfiuTxrqAQTFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8412DF80535;
	Thu, 16 Jun 2022 23:54:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCF9AF801D8; Thu, 16 Jun 2022 23:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61436F801D8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61436F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QDClzuHW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416484; x=1686952484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qaYjoDafa+OjC6LFqARHacT5WUU7JTQ5bcPXzBExjSA=;
 b=QDClzuHWpKBCe5JNK/wN5AyGniM4iTBKpZD/m5pMs1nMYhaoxAvueLDc
 lWhXkkxGZNOegeO/UivnYAr/TIWo94lzEHrEiaewh2Nssvux5jPLyZm2J
 3u+7ZAssvOkztt+ivR3Ruu77DbDkowEX4MHWSJ4BdPeMHFnreI4O54Myk
 iN20AKCaDqZYR4KQKx1P5Yrg24/KoZcpLpuqGZ8lwZsgcmIy8Rzc4Z1WT
 Qx1XdApJwEHY6YaNEK9P1WHY5wcSulV9kmKxn7YiImSyAMYbPemVtSjvf
 x/E054llX3N+zsE7sQJ8unUwQIZsHtJe8IgZZKuZzqtZ1pI4rbZn7jZKD Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268047818"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268047818"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="675212671"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/13] ASoC: SOF: ipc3-dtrace: remove use of __func__ in
 dev_dbg
Date: Thu, 16 Jun 2022 16:53:44 -0500
Message-Id: <20220616215351.135643-7-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/sof/ipc3-dtrace.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index ecca6dceaad29..b815b0244d9e4 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -470,7 +470,7 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 		dev_err(sdev->dev, "Host dtrace init failed: %d\n", ret);
 		return ret;
 	}
-	dev_dbg(sdev->dev, "%s: stream_tag: %d\n", __func__, params.stream_tag);
+	dev_dbg(sdev->dev, "stream_tag: %d\n", params.stream_tag);
 
 	/* send IPC to the DSP */
 	priv->dtrace_state = SOF_DTRACE_INITIALIZING;
@@ -544,8 +544,7 @@ static int ipc3_dtrace_init(struct snd_sof_dev *sdev)
 		goto table_err;
 
 	priv->dma_trace_pages = ret;
-	dev_dbg(sdev->dev, "%s: dma_trace_pages: %d\n", __func__,
-		priv->dma_trace_pages);
+	dev_dbg(sdev->dev, "dma_trace_pages: %d\n", priv->dma_trace_pages);
 
 	if (sdev->first_boot) {
 		ret = debugfs_create_dtrace(sdev);
-- 
2.34.1

