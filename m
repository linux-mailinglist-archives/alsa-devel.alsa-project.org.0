Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E9C20A59B
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FE2C1A97;
	Thu, 25 Jun 2020 21:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FE2C1A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112694;
	bh=84D8MHemuzYWBjTsujgvbc1/crc5eBU0ueQDbhs6JV8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oH1DGzY4NqzQmQoU1Af/pAkkMj4pZEH8PRQROnnG78ljmq8qxuQ51ZI0tF7b+ECjO
	 ORYH1gVz7/X9GxIBlzVzSa5KuMHMgzI6DHlCLuL6r1vYKXncHTv4u/qnCZL8/ks2P8
	 cqwQAyUgf33uNIqwrEATAkb2tzrNU+RELWHaCglY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB96BF802E8;
	Thu, 25 Jun 2020 21:14:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D3D4F802DB; Thu, 25 Jun 2020 21:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDB64F802A0
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDB64F802A0
IronPort-SDR: r/8I6i1MB+VvhORfOGIhV06Xv/8hrqmnmo5Hpc3b8YzZg9lve0uU7O/IV+CimSN7J0kEE7qPtN
 EoYxzXiMXZGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144120819"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144120819"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:35 -0700
IronPort-SDR: cuyS+xVGGgi9NKxhunZRqIlK6jSosi1MWM91A1VOeTuWkvL4/6HOqHLgSN1do6z7KCgHgmsF4M
 pTAENupX4DSQ==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354559475"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/17] ASoC: Intel: bxt_rt298: add missing .owner field
Date: Thu, 25 Jun 2020 14:12:55 -0500
Message-Id: <20200625191308.3322-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
References: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

This field is required for ASoC cards. Not setting it will result in a
module->name pointer being NULL and generate problems such as

cat /proc/asound/modules
 0 (efault)

Reported-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Takashi Iwai <tiwai@suse.de>
Fixes: 76016322ec56 ('ASoC: Intel: Add Broxton-P machine driver')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/bxt_rt298.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 7a4decf34191..c84c60df17db 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -565,6 +565,7 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 /* broxton audio machine driver for SPT + RT298S */
 static struct snd_soc_card broxton_rt298 = {
 	.name = "broxton-rt298",
+	.owner = THIS_MODULE,
 	.dai_link = broxton_rt298_dais,
 	.num_links = ARRAY_SIZE(broxton_rt298_dais),
 	.controls = broxton_controls,
@@ -580,6 +581,7 @@ static struct snd_soc_card broxton_rt298 = {
 
 static struct snd_soc_card geminilake_rt298 = {
 	.name = "geminilake-rt298",
+	.owner = THIS_MODULE,
 	.dai_link = broxton_rt298_dais,
 	.num_links = ARRAY_SIZE(broxton_rt298_dais),
 	.controls = broxton_controls,
-- 
2.20.1

