Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2376E26D94C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 12:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D0061616;
	Thu, 17 Sep 2020 12:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D0061616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600339359;
	bh=VcskyxHglFoxWJ88Kiug6sFHASX0f8rxijv727AW244=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s5K3PBUhWeaKgX+kUg0P32YIpdLVQsNNQRY4CjWKnxdeE6ES526rzRJuz5x84ahD8
	 aOKGlTPz6F8aCtr1Tnp9jL0AlOs4a/t6wIraAjl83kzegkD4bQk/WT+Rx+Cqa2mvqh
	 ITYU9hVo0l6w8Ntne1xmC4O0hvubpr2VPN3TO3F8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7474AF800E8;
	Thu, 17 Sep 2020 12:40:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19DBBF80212; Thu, 17 Sep 2020 12:40:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C9A0F800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 12:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C9A0F800E8
IronPort-SDR: ZI1nyv2+YDS9t5qYzvlaS49x0E36b+ND+dZgIPun0v7yEVpetP0oeIkKx7cg1WZ+SBv0AJ+q7Y
 oZ3FJJd++8Xw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139177375"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="139177375"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:40:40 -0700
IronPort-SDR: oZKiHeww1/ciMrHSvcvz8FJPurPx/dqA3RwA/6wEu6+0S65Uul+dZftrjLXPSCUnH3tBhrRSJW
 Rws2cbWV6gVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="508355477"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005.fm.intel.com with ESMTP; 17 Sep 2020 03:40:38 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: topology: disable size checks for bytes_ext controls if
 needed
Date: Thu, 17 Sep 2020 13:39:12 +0300
Message-Id: <20200917103912.2565907-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jaska Uimonen <jaska.uimonen@intel.com>, kai.vehmanen@linux.intel.com,
 Takashi Iwai <tiwai@suse.de>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

When CONFIG_SND_CTL_VALIDATION is set, accesses to extended bytes
control generate spurious error messages when the size exceeds 512
bytes, such as

[ 11.224223] sof_sdw sof_sdw: control 2:0:0:EQIIR5.0 eqiir_coef_5:0:
invalid count 1024

In addition the error check returns -EINVAL which has the nasty side
effect of preventing applications accessing controls from working,
e.g.

root@plb:~# alsamixer
cannot load mixer controls: Invalid argument

It's agreed that the control interface has been abused since 2014, but
forcing a check should not prevent existing solutions from working.

This patch skips the checks conditionally if CONFIG_SND_CTL_VALIDATION
is set and the byte array provided by topology is > 512. This
preserves the checks for all other cases.

Fixes: 1a3232d2f61d2 ('ASoC: topology: Add support for TLV bytes controls')
BugLink: https://github.com/thesofproject/linux/issues/2430
Reported-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-topology.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 28faaf58326e..63086fa8b861 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -592,6 +592,17 @@ static int soc_tplg_kcontrol_bind_io(struct snd_soc_tplg_ctl_hdr *hdr,
 		k->info = snd_soc_bytes_info_ext;
 		k->tlv.c = snd_soc_bytes_tlv_callback;
 
+		/*
+		 * When a topology-based implementation abuses the
+		 * control interface and uses bytes_ext controls of
+		 * more than 512 bytes, we need to disable the size
+		 * checks, otherwise accesses to such controls will
+		 * return an -EINVAL error and prevent the card from
+		 * being configured.
+		 */
+		if (IS_ENABLED(CONFIG_SND_CTL_VALIDATION) && sbe->max > 512)
+			k->access |= SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK;
+
 		ext_ops = tplg->bytes_ext_ops;
 		num_ops = tplg->bytes_ext_ops_count;
 		for (i = 0; i < num_ops; i++) {
-- 
2.27.0

