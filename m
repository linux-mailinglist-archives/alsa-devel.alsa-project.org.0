Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB05652F6D
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 11:26:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 851A216BD;
	Wed, 21 Dec 2022 11:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 851A216BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671618393;
	bh=zRfeGGUeehUOSAdNt/mTy9vJ+jy7NNlpmZd/7MRVOn4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gHVIABl2W36JNUEFx3oM8wj2AeI4noNZaZS7voGHxviFQVq5ToSXS6MtV6LOgpPQ0
	 2KjyiIcsHcp2fjOzvzAFgpfQbi5VltQHbdPrHEmb9Q9IhBze8br1TWjdb5TIin0WLY
	 QqC2DaQhjPNQ0yOvj24RAnMj11pi485asHgF2tpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E05B6F8053D;
	Wed, 21 Dec 2022 11:24:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF867F804AD; Wed, 21 Dec 2022 11:23:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4F95F80423
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 11:23:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4F95F80423
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XkkVJy48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618211; x=1703154211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zRfeGGUeehUOSAdNt/mTy9vJ+jy7NNlpmZd/7MRVOn4=;
 b=XkkVJy48lWPqvK+3WwiRHwoXfmtG99/JOy1pvY9/lpj+gXCkxZA2uR0q
 Uc9C4OW9+zeRPFXify3XhqQ3gtW1VLTxEMj4WSVXEx+FrT2oWHbIuSv8O
 u4HBBuNgTEVAhhHyLfNNzxBk46nyE0QfixDAEGVqBujUNo+dHvXliH/SG
 eUVwn6seB/S0SWlmNkefs0dwHZ9wGWPy4iFNs24GnxOl6Wy/b3lIbyt4y
 8GfLkGVG6jsrR6jouyEVhlQIOSWHAwURwkrDjaWo6J3vzZOOSxlPgNnRu
 PKbx1oVm1EbXAz+iFIq932Iq8WgI9/GZeJ886JeVXKpycpT2pwhs9A2TA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078611"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078611"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681984280"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681984280"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:23 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 01/11] ASoC: SOF: sof-audio: Treat tplg_ops->route_setup() as
 optional
Date: Wed, 21 Dec 2022 12:23:18 +0200
Message-Id: <20221221102328.9635-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
References: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Other topology ops have been treated as optional, including the route_free.

Handle the route_setup in a conforming way as optional callback.
Note: we do not have checks for the callbacks itself which makes them all
optional in practice.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/sof-audio.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 7306a2649857..2c7d942427c1 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -174,7 +174,6 @@ int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsourc
 	struct snd_sof_widget *sink_widget = wsink->dobj.private;
 	struct snd_sof_route *sroute;
 	bool route_found = false;
-	int ret;
 
 	/* ignore routes involving virtual widgets in topology */
 	switch (src_widget->id) {
@@ -212,9 +211,12 @@ int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsourc
 	if (sroute->setup)
 		return 0;
 
-	ret = ipc_tplg_ops->route_setup(sdev, sroute);
-	if (ret < 0)
-		return ret;
+	if (ipc_tplg_ops->route_setup) {
+		int ret = ipc_tplg_ops->route_setup(sdev, sroute);
+
+		if (ret < 0)
+			return ret;
+	}
 
 	sroute->setup = true;
 	return 0;
-- 
2.39.0

