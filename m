Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB68D7FF6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 12:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2962E1DF;
	Mon,  3 Jun 2024 12:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2962E1DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717410557;
	bh=GFqX5r9hkOet5jHFaGDfztMJVt5pXGz34ax6hpUonoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c18ejWEHp3DeenrvZ80Y0VBu1MURg0LX5x+YiKKlF53bn5k6F126/WJgOjDF2rJU4
	 PmMFRD0qcMeoOSkr4r1biqXoYNgrZJmbGri6fAeIEoxchmLZ+eEKe3iLBkGWa5vkv0
	 0k3b4R6dDdRcIQ2Yae/vdBUCWK9f/2sudh996uY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98090F80612; Mon,  3 Jun 2024 12:28:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC397F805FD;
	Mon,  3 Jun 2024 12:28:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28536F8025A; Mon,  3 Jun 2024 12:27:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72CB8F80236
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 12:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72CB8F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bS8C5R91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717410468; x=1748946468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GFqX5r9hkOet5jHFaGDfztMJVt5pXGz34ax6hpUonoQ=;
  b=bS8C5R91DKG9NxWOSQ7W5np5rGQDXrp/12PqnR11NR6uBEBO2rzoZu6o
   DFcZ4B9cvs2IOrL81IgQpOgtyKtu2yIgBYj/9Z4bYXFrrxqE8pBRE5IQR
   lu72YzDnSS98fdmjLy7HxkY8WhhwF2aWqsgNleCv8Co5xi64WTpRb3eyo
   w7419VbvK/i2JseHLHUFt5viJYtm2lqptX2nJBptgxgqXQ+XE5RdeeVfo
   b1EIurluN2qN8wmdTxpiKLhqkvTPCPWJCVvAzDsRbMF0bgId/CIzHBfze
   qCNK2hSYfGYeTXs9mIJ6muYQ8/hZFB4UfJaBYTn5jrxUFDEhbuD771dg5
   A==;
X-CSE-ConnectionGUID: Y/6wltOuQ6GmAGs60RgGJw==
X-CSE-MsgGUID: uMdPgm5uROCOtwBiPJ4MCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14017231"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000";
   d="scan'208";a="14017231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 03:27:45 -0700
X-CSE-ConnectionGUID: FptEqLsIStuFGfizIt204Q==
X-CSE-MsgGUID: 1hlQtdrKTgqqzIUQECmNXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000";
   d="scan'208";a="37430047"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 03:27:42 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jason Montleon <jmontleo@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 3/4] ASoC: topology: Do not assign fields that are already set
Date: Mon,  3 Jun 2024 12:28:17 +0200
Message-Id: <20240603102818.36165-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HOE2DXYWNIPZNHHSQND6FNFANBQDFS2H
X-Message-ID-Hash: HOE2DXYWNIPZNHHSQND6FNFANBQDFS2H
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOE2DXYWNIPZNHHSQND6FNFANBQDFS2H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The routes are allocated with kzalloc(), so all fields are zeroed by
default, skip unnecessary assignments.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 75d9395a18ed4..1db540aaad451 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1072,11 +1072,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 			break;
 		}
 
-		/* set to NULL atm for tplg users */
-		route->connected = NULL;
-		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0) {
-			route->control = NULL;
-		} else {
+		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) != 0) {
 			route->control = devm_kmemdup(tplg->dev, elem->control,
 						      min(strlen(elem->control),
 							  SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
-- 
2.34.1

