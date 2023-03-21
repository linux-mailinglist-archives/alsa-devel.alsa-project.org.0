Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E87E06C3347
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 14:50:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D6E01EF;
	Tue, 21 Mar 2023 14:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D6E01EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679406601;
	bh=gGn3HPFPRfEBgynHqb55GeXZRWkp2JTMA8oRQaYGmH8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Lln6+nIwmhiC/kRM60q57SuInsu77+DUKYxb0iYpyCDRaf1RSqcyf2eVMvNav1GS7
	 fcs53aVC1ALtTPkUQMXw1hD0GUJ3kjiefKsiPYlDjf/J2uvFZ4wmyg61wPUitdDvcO
	 qgRJ0q8fTLcGLKHO9wge1MWoF+33dWjdbIYUFf2M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D8DF80254;
	Tue, 21 Mar 2023 14:49:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 160B6F8027B; Tue, 21 Mar 2023 14:49:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C08B6F80105
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 14:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C08B6F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OTk9IIEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679406542; x=1710942542;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gGn3HPFPRfEBgynHqb55GeXZRWkp2JTMA8oRQaYGmH8=;
  b=OTk9IIEF0Za3OUccUgfWTelyZa+QJvohH9MscY6EJtHXw7T5r8Tf6blr
   Wv0TfGnK/9Yr7VLSjC3BF3A25IMUdZpiEuvVD72TSnUg191dPuAmAupbM
   K++F1YN7XprOxalgKvJjYKQi/5fpqvgjn1AGt2F7hD91EkIKT4Ccto+0P
   GQSzXgbPdB9yK6jnfrj0D5HfFefOHtFn87WhbyhrhQ5MHj/LHNPaxqAZg
   dC5FsW/Ln5RtfuSNj1gqvl6S42yBnlJH8y3IQE9Lnr2WZMmI1Jv9YUyJH
   h9NXefIf1nHTltsae2tgnnIg1/tjahCNH/E/WgBiRmyqkpMJQVlsghLGa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="338979239"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400";
   d="scan'208";a="338979239"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 06:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="855700611"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400";
   d="scan'208";a="855700611"
Received: from markusbu-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.60.215])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 06:48:51 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4-control: Return on error in
 sof_ipc4_widget_kcontrol_setup()
Date: Tue, 21 Mar 2023 15:49:19 +0200
Message-Id: <20230321134919.25844-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I7FZEKTXW5GKBQ2M6SUYOK2GKTNZ7H6Q
X-Message-ID-Hash: I7FZEKTXW5GKBQ2M6SUYOK2GKTNZ7H6Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7FZEKTXW5GKBQ2M6SUYOK2GKTNZ7H6Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch adding the bytes control support moved the error check outside
of the list_for_each_entry() which will cause issues when we will have
support for multiple controls per widgets.

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

