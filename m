Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E9D700720
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 13:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E4C11D9;
	Fri, 12 May 2023 13:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E4C11D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683892011;
	bh=pe3FJEDN5yhlgWO9qxl+4rzfdblwTENuhY1tz6Vv120=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MOfhWHWNMLjt1V3BZwrmm0T4iCLz1uOMkI90x1M/fR9ZkRWpQpNjA7hSE4L9RJCbT
	 khw3ErukJwl2AmkLtI9BbbV4F/ePA9slDdWYgZzqiOAj6UBazSAr1WBx1rbRWUQ4EI
	 SZwXACGhriqvfemOMc+K5Yq/DQ+Z1h5bbgVpzgwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC9B7F80544; Fri, 12 May 2023 13:46:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D79BF8032D;
	Fri, 12 May 2023 13:46:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 756FDF8052E; Fri, 12 May 2023 13:45:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 604DDF8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 13:45:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 604DDF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OFu1fEHU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683891946; x=1715427946;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pe3FJEDN5yhlgWO9qxl+4rzfdblwTENuhY1tz6Vv120=;
  b=OFu1fEHUofrg9DkvmJLIkH+ajT6ZvvZr+uon89ozLDwytkn+A9YzSwyn
   m+VtLfQay6OQwUQOaBhCNTzLc7GRVfCUQxtTRVR7qd3CtSpNXRr096puQ
   wxP3AVmNneAsq8WAeOZEq/e/w93ksWOxehcnnKwKCgsYaB5vnmOS98FCs
   gS2EzHscM3MPeu1DTzxuoRB6ehtYMRrpiKDb9nTucuKob3/opsWcusDfc
   KALDJsxsF5/2bZEbosUU7Lz7UMBK0ZRS33VsJ9bjWuy988madOyD6g1kv
   fsmjG/Oei/kw0Q19M52u3wkJMtEWlce65Bmt2J6FDFe1Dlalq5KTczPyo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="340084868"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="340084868"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 04:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="733017148"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="733017148"
Received: from nhanph1x-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.38.84])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 04:45:37 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: topology: Fix logic for copying tuples
Date: Fri, 12 May 2023 14:46:30 +0300
Message-Id: <20230512114630.24439-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CAV62VJQRUQRIJ5EYOIG6XWXEWHJITLZ
X-Message-ID-Hash: CAV62VJQRUQRIJ5EYOIG6XWXEWHJITLZ
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAV62VJQRUQRIJ5EYOIG6XWXEWHJITLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Topology could have more instances of the tokens being searched for than
the number of sets that need to be copied. Stop copying token after the
limit of number of token instances has been reached. This worked before
only by chance as we had allocated more size for the tuples array than
the number of actual tokens being parsed.

Fixes: 7006d20e5e9d ("ASoC: SOF: Introduce IPC3 ops")
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d3d536b0a8f5..b80566570512 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -586,6 +586,10 @@ static int sof_copy_tuples(struct snd_sof_dev *sdev, struct snd_soc_tplg_vendor_
 				if (*num_copied_tuples == tuples_size)
 					return 0;
 			}
+
+			/* stop when we've found the required token instances */
+			if (found == num_tokens * token_instance_num)
+				return 0;
 		}
 
 		/* next array */
-- 
2.40.1

