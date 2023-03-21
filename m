Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38466C34DC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 15:57:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C180C1F4;
	Tue, 21 Mar 2023 15:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C180C1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679410644;
	bh=xM0hm93uIx15wlohj0bmL+s8uzfsdOOubIUxAsf046k=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kVX9tVZMCtJ7zX0vLCYqgEyrEPFHYpHF/Mym0Q6wGRVIwEnTv4HUzeV7xcMH/kwSr
	 vvAdO7Bphlw3g0vDRGi8zOeytKfZaPu1OmkK8jyPoNHlOp3eWkx2MQV4ifJoCbJ7Js
	 c306M0lu6tliTGDi1tbxOxXrSAQojRfT4FAb7PHE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F160DF80254;
	Tue, 21 Mar 2023 15:56:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF2F8F8027B; Tue, 21 Mar 2023 15:56:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7F0CF8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 15:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7F0CF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JBt/LAwi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679410589; x=1710946589;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xM0hm93uIx15wlohj0bmL+s8uzfsdOOubIUxAsf046k=;
  b=JBt/LAwiAFLLPXiQWW3rmEOSND55hzPlxidEFVpjBP9qLJKqGA6rMFA5
   JYByHCXQiu5dEU/3ixGmwktC8XrPAQgxlyH6FV6KAZUGt3zq/de/VzuYa
   pqAV28M28Sexrn3jWMzpH9sm/y9O/dPGrwVa3ZcTSrZb/pzsoyZncP2pl
   XQ2/ECWUYpOmjsvVLQSeU9AVAMBzh5Pgvr1JXV0W0JKzPeJkJ4uwyp1n0
   CQZdwmAZX9YTEWCrCFQX7bBQlaLSCtLDUWG3XaM7VcnVXZwVusqg7r+C5
   a5RQIDgQN4Q5DROilvg+TBzeMmAc1Nx+rvaueRHPmRaVBngjM3ytMZC5i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341320152"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400";
   d="scan'208";a="341320152"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="658798059"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400";
   d="scan'208";a="658798059"
Received: from markusbu-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.60.215])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:56:22 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2] ASoC: SOF: ipc4-control: Return on error in
 sof_ipc4_widget_kcontrol_setup()
Date: Tue, 21 Mar 2023 16:56:51 +0200
Message-Id: <20230321145651.9118-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TNXNIRSTEJMLBEZLPYJUJ27Y6QXHLR26
X-Message-ID-Hash: TNXNIRSTEJMLBEZLPYJUJ27Y6QXHLR26
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNXNIRSTEJMLBEZLPYJUJ27Y6QXHLR26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch adding the bytes control support moved the error check outside
of the list_for_each_entry() which was not correct as at the end of the
list_for_each_entry() the scontrol will no longer point where the error
happened, but it to the list head.

Restore the original logic and return on the first error with the error
code.

Fixes: a062c8899fed ("ASoC: SOF: ipc4-control: Add support for bytes control get and put")
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/alsa-devel/6be945d2-40cb-46fb-67ba-ed3a19cddfa4@linux.intel.com/T/#t
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index d26ed2a6029f..6f0698be9451 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -429,14 +429,17 @@ static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_s
 			default:
 				break;
 			}
+
+			if (ret < 0) {
+				dev_err(sdev->dev,
+					"kcontrol %d set up failed for widget %s\n",
+					scontrol->comp_id, swidget->widget->name);
+				return ret;
+			}
 		}
 	}
 
-	if (ret < 0)
-		dev_err(sdev->dev, "kcontrol %d set up failed for widget %s\n",
-			scontrol->comp_id, swidget->widget->name);
-
-	return ret;
+	return 0;
 }
 
 static int
-- 
2.40.0

