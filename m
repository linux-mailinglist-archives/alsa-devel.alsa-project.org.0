Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4408CFF41
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 18:50:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5450986E;
	Tue,  8 Oct 2019 18:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5450986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570553447;
	bh=CMH1Fmlr9h2Z9pIhGd0f64+MqdhpkbECZ0u9W+sbaOk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s8DBRxRZ7RcLnh3lhkjdrxULf69QmjNkZJg55AZ7WItHj1AmEiLZ5CB+ZNO+sof/l
	 Z4aIdgU0fGch+wzcDPXRBjDBBtixmhMGmhaVZU0VkurBSmz2vWpOYUOgWXh5DyePyU
	 vavOwXmPZs3PBPW3mXyuJJtEZLqBSM2sy2JvgX54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E200F8063E;
	Tue,  8 Oct 2019 18:45:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95973F8060F; Tue,  8 Oct 2019 18:44:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D113F805FB
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 18:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D113F805FB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 09:44:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="218338339"
Received: from kwwong-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.150.53])
 by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2019 09:44:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  8 Oct 2019 11:44:41 -0500
Message-Id: <20191008164443.1358-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
References: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 7/9] ASoC: SOF: enable dual control for pga
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

Currently sof pga element supports only 1 kcontrol and you can't create
for example a mixer element with combined volume slider and mute switch.
So enable sof pga to have more than 1 kcontrol associated with it. Also
check for possible NULL tlv pointer as switch element might not have it.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d8172d3f672f..edfb5f1458b7 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1587,7 +1587,7 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 	if (!volume)
 		return -ENOMEM;
 
-	if (le32_to_cpu(tw->num_kcontrols) != 1) {
+	if (!le32_to_cpu(tw->num_kcontrols)) {
 		dev_err(sdev->dev, "error: invalid kcontrol count %d for volume\n",
 			tw->num_kcontrols);
 		ret = -EINVAL;
@@ -1624,7 +1624,8 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 	swidget->private = volume;
 
 	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-		if (scontrol->comp_id == swidget->comp_id) {
+		if (scontrol->comp_id == swidget->comp_id &&
+		    scontrol->volume_table) {
 			min_step = scontrol->min_volume_step;
 			max_step = scontrol->max_volume_step;
 			volume->min_value = scontrol->volume_table[min_step];
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
