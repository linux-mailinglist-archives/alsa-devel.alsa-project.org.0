Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C264E16C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 19:56:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C3DD16D9;
	Thu, 15 Dec 2022 19:55:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C3DD16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671130567;
	bh=YZXWFk12BqEf8sAsdvJ+ZpEfpctLDZin4pz6bzZL6g4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cgEl0xLD1vKzVOikUrMSvc8M6bQXrpx928E+yidW8ZERnFkSDal4VYoWHO/bJ2BzN
	 NXe4PSffLhB0MLitxr4O65cZwU10vmfk9LsKwdgon7ISdOJTxv26jRGR/BEDyisbSQ
	 ty9LrexBXQXlwgc8lN0njgcmwuxpdjoqN5m0x/SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71DE3F8052F;
	Thu, 15 Dec 2022 19:54:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42034F80515; Thu, 15 Dec 2022 19:54:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AEECF804FC
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 19:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AEECF804FC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Hl0WTl6m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671130456; x=1702666456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YZXWFk12BqEf8sAsdvJ+ZpEfpctLDZin4pz6bzZL6g4=;
 b=Hl0WTl6md1r9+WWUD2MLRg2ZZsHwgQbxCPxIW4RAEEA4TSeE1M3JmEPS
 OC+KhgFS8Rr1pwWv6k7Jm1duGl+2HAtxWQGtN5pGJUk0O5miPb9sV29mL
 xOWkp9SnJIgeJEZYiQ1Fq0LodwJLhf3ufZS4gVpcm0HoD12m5HVlekcXS
 ebNzto7DEFutKAhWSC8rnEa8/SzoZRNTRGahQrxMvht4m3giQ6Z0mbj41
 CmCwSbVJWvyzI2NesJqs8QH/l9k0q5+rRyqSYgU6fPgTDXUCYskfmIYgr
 x5MRd2TxOZX2Jkf3XlfNDP7ja/uI1tQYTCII3IqPuw7ycv+jbpSN3/Cfx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="318819932"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="318819932"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:54:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="738260654"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="738260654"
Received: from mayurarx-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.35.200])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:54:05 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: SOF: Add FW state to debugfs
Date: Thu, 15 Dec 2022 10:53:47 -0800
Message-Id: <20221215185347.1457541-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
References: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Curtis Malainey <cujomalainey@chromium.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Allow system health detection mechanisms to check the FW state, this
will allow them to check if the FW is in its "crashed" state going
forward to help automatically diagnose driver state.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/debug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index d9a3ce7b69e1..ade0507328af 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -353,7 +353,9 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 			return err;
 	}
 
-	return 0;
+	return snd_sof_debugfs_buf_item(sdev, &sdev->fw_state,
+					sizeof(sdev->fw_state),
+					"fw_state", 0444);
 }
 EXPORT_SYMBOL_GPL(snd_sof_dbg_init);
 
-- 
2.25.1

