Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086533C25B
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:42:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F267B17BA;
	Mon, 15 Mar 2021 17:41:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F267B17BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615826551;
	bh=2tsCdGJrlm7rYgVWK1opS+T7B/2Sm3z0L6QTt6VjmOo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ICGfpceDn/pXYcr8qr/PH6xjEVFZ/uC5qvyTbzJ8ZoErNGCzUQyRNh6MyrvlafKZH
	 IDCgZWOiS6c5kNaZv6hocye0PE/tUV+bjiuLWwhleY9ubjHF2jo1T0QXtaHZRshiit
	 7VzsrSGWbI9VUBKsjh87+rmKegc3URIgszw6svdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FDAEF80424;
	Mon, 15 Mar 2021 17:40:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CF9AF80423; Mon, 15 Mar 2021 17:40:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34453F801F7
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34453F801F7
IronPort-SDR: ugjPNQDrf1mztqfZvs7s2O4zTI0z80YMYZzoZB8+eL7FyOdJWYtCLV9KM4MbI37dkdAB/fvwQ3
 PKSokttK10ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="274160570"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="274160570"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 09:39:45 -0700
IronPort-SDR: 3EP6WpDAfYPCw3g2XApnjVgCwxQl7v3Z0GQ8OuQMFn8vT0fDNsXfcpDS8QX6cjFtFtZVZrJVKy
 WenHcMUHAwuA==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="604912907"
Received: from pwells-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.5.38])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 09:39:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: SOF: remove superfluous NULL check in debugfs read
Date: Mon, 15 Mar 2021 11:39:32 -0500
Message-Id: <20210315163932.18663-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315163932.18663-1-pierre-louis.bossart@linux.intel.com>
References: <20210315163932.18663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Xiuli Pan <xiulipan@outlook.com>, Keqiao Zhang <keqiao.zhang@intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

When reading from IPC flood debugfs entries no need to check whether
.cache_buf is NULL - it's impossible since otherwise the initialisation
would have failed. This also fixes a klocwork reported issue:

passed to function and may be dereferenced there by passing argument 2
to function 'memcpy' at line 510.
sound/soc/sof/debug.c:510 | sof_dfsentry_read()

Reported-by: Keqiao Zhang <keqiao.zhang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Xiuli Pan <xiulipan@outlook.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 778c7d028493..a51a928ea40a 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -451,8 +451,7 @@ static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 
 	dentry = file->f_path.dentry;
 	if ((!strcmp(dentry->d_name.name, "ipc_flood_count") ||
-	     !strcmp(dentry->d_name.name, "ipc_flood_duration_ms")) &&
-	    dfse->cache_buf) {
+	     !strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))) {
 		if (*ppos)
 			return 0;
 
-- 
2.25.1

