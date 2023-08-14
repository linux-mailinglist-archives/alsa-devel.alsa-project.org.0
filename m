Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25477C3ED
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 01:25:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADEC7832;
	Tue, 15 Aug 2023 01:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADEC7832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692055530;
	bh=YWiIp/tFL4a9PLxSEQX+uwLd81Di0oyL5y5PXi/twzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pX+BRk2ZDeaxJbblyGWU2wkqYbVNcT8D76Ujhgr0mCb3tAUGso1d7T4lK8PCyZKrc
	 iC2DgNLRl1TC0NQhz4nxuGTL5TlgUBh634yML102w6G2VGqbtbK7AaMQ7IiHKRU+Yb
	 UBADq6h+RGLdNdHp5bj9jp4ZM2o2X3DfJOyXz0Xo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4AE5F80558; Tue, 15 Aug 2023 01:23:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41ED0F80553;
	Tue, 15 Aug 2023 01:23:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F16E4F80016; Tue, 15 Aug 2023 01:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 968FCF80016
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 01:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 968FCF80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ib6O6bZY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692055424; x=1723591424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YWiIp/tFL4a9PLxSEQX+uwLd81Di0oyL5y5PXi/twzg=;
  b=Ib6O6bZYTuLcgccd9aDHHUjcOtqssU0gP/UMPqxDKFhxnd3XBJj908fD
   E5jyNkvYDB5wXoOeP383m59GzEKLoh0x8XY3KqEWowR7Y2csuZgHOMYpH
   zzAmKIoSAmZH0nRCqleq0ho8Xm5uZMBa6qprF0U5YcyoCIbYtarviGEXJ
   gRZymFBrqJKviCQx7p0TrWZeSdbEjMiByRj1OO7zFl5BjwHQHTgkiArdo
   B0uKrQxAK2eKbni1s+aEoqnLH1P4ryeURaTCPA634x0kYvOipcEw0CI1Q
   23k/5VvrZsknaPbBM2mEJMySI+5n8bkpbwdj9ofJGJ5IQcJK2j1negngK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436051851"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="436051851"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823642504"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="823642504"
Received: from dishasur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.104.139])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:23:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Jyri Sarha <jyri.sarha@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/2] ASoC: dapm: Add a flag for not having widget name in
 kcontrol name
Date: Mon, 14 Aug 2023 18:23:24 -0500
Message-Id: <20230814232325.86397-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230814232325.86397-1-pierre-louis.bossart@linux.intel.com>
References: <20230814232325.86397-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P4BW7WCJQOX2IQGU5FWLA555ASXMYJ7G
X-Message-ID-Hash: P4BW7WCJQOX2IQGU5FWLA555ASXMYJ7G
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4BW7WCJQOX2IQGU5FWLA555ASXMYJ7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jyri Sarha <jyri.sarha@intel.com>

The existing soc-dapm code may add a prefix to control names, which in
some cases is useful but in others leads to long and confusing kcontrol
names such as "gain 2.1 Main Playback Volume".

This patch suggests an added flag to prevent the widget name prefix
from being added. That flag will be set in the topology file on a
per-widget basis.

The flag no_wname_in_kcontrol_name is added to struct snd_soc_dapm_widget,
and the logic in dapm_create_or_share_kcontrol() is changed to not to
add widget name if the flag is set.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Jyri Sarha <jyri.sarha@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-dapm.h | 1 +
 sound/soc/soc-dapm.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 2e38dff16779..d2faec9a323e 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -650,6 +650,7 @@ struct snd_soc_dapm_widget {
 	unsigned char power_checked:1;		/* power checked this run */
 	unsigned char is_supply:1;		/* Widget is a supply type widget */
 	unsigned char is_ep:2;			/* Widget is a endpoint type widget */
+	unsigned char no_wname_in_kcontrol_name:1; /* No widget name prefix in kcontrol name */
 	int subseq;				/* sort within widget type */
 
 	int (*power_check)(struct snd_soc_dapm_widget *w);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 3091e8160bad..f07e83678373 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -916,6 +916,8 @@ static int dapm_create_or_share_kcontrol(struct snd_soc_dapm_widget *w,
 				return -EINVAL;
 			}
 		}
+		if (w->no_wname_in_kcontrol_name)
+			wname_in_long_name = false;
 
 		if (wname_in_long_name && kcname_in_long_name) {
 			/*
-- 
2.39.2

