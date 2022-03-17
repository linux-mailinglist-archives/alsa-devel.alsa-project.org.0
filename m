Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBA24DCD13
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:58:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6884A1AAF;
	Thu, 17 Mar 2022 18:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6884A1AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539910;
	bh=gUs2VhEZAGhDbjAQmkiKLxXwNNpF/D8m1ekix5YtTh0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDgv6nunRVEUarcXnjQzQDyimGD75HrNKIlqxHJzYDt9JcBUd5WvMxtuGo/TMlZNn
	 FBREWKlzSX9b/gQdPRVO399Fh62JnGxSh7R8nso+hHSvBq1SECZegEljtgFd6bOqOp
	 6h8qQaCMZRCutWW+9zNdosxoN/vCsIfFwgOyNGKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA665F805BF;
	Thu, 17 Mar 2022 18:52:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32E44F8053C; Thu, 17 Mar 2022 18:52:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48E69F80124
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48E69F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H2cVNjfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539517; x=1679075517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gUs2VhEZAGhDbjAQmkiKLxXwNNpF/D8m1ekix5YtTh0=;
 b=H2cVNjfiXbxkiVMxx/qs7pN/IpzvdMEmSOrQY9mHumPoAvVid1eljIuo
 xmjPc8YeTJxt/DlJn6SJ7zyjQoHQcCnp4bDRVk9b1HXTrVKM1JP4Xms6y
 3EUOIpginPJfjaWD1gzwI6qOYrxHyv/as/DtPdVkw+JFsnAjFBQ1EArg0
 0E20TwTcamrOIdzOwAHMWhao6FwlwlTVMiUEu10yatSdDDmQoG7IgMcGm
 X9mH/AauARnCnrco1tgkB9Mb+8DNyeohYkUDrx11mW7BEkYTf7K4sMbJQ
 2DOjesU6hNLA6R2cJpThw9uu3hhorD16wASA4/XaZ4Mzh9X39jniwM/El g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492935"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492935"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431158"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/19] ASoC: SOF: expose sof_route_setup()
Date: Thu, 17 Mar 2022 10:50:42 -0700
Message-Id: <20220317175044.1752400-18-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

This will be used in IPC3-specific code.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 4 ++--
 sound/soc/sof/sof-audio.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 5088ec7019ed..8885709f40df 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -204,8 +204,8 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 }
 EXPORT_SYMBOL(sof_widget_setup);
 
-static int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsource,
-			   struct snd_soc_dapm_widget *wsink)
+int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsource,
+		    struct snd_soc_dapm_widget *wsink)
 {
 	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
 	struct snd_sof_widget *src_widget = wsource->dobj.private;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 3ec3f746663a..777da321e2aa 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -441,6 +441,8 @@ void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata);
 
 int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
+int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsource,
+		    struct snd_soc_dapm_widget *wsink);
 
 /* PCM */
 int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
-- 
2.25.1

