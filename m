Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B87A913C05
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2024 17:16:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA078A4A;
	Sun, 23 Jun 2024 17:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA078A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719155762;
	bh=VTtHoMRrh/CknLnrTiA6cISWe0B7QIazQmbA5Bs4n5g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GRoxipZAw7nzBz3WLdDlAmTPz44NEf91soZg6fLJSYr5QlK3E8npnwV/4TTTVvEoA
	 dQo53P9K17Bz8ufYwWKohzTO0/by8ZIIwqcLUPJLgSvQqlMdMVDaq4vaf+q0NJ1YZU
	 Z5i+rpXbw5NAB25vA3K5gH7RTux3t5gE3ttZLx2c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3A8EF805AC; Sun, 23 Jun 2024 17:15:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73B19F8049C;
	Sun, 23 Jun 2024 17:15:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9990F80495; Sun, 23 Jun 2024 17:15:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from msa.smtpout.orange.fr (msa-211.smtpout.orange.fr
 [193.252.23.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15CD9F800E4
	for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2024 17:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15CD9F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=QCd1Vmfi
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id LOvzs9RlN2GQtLOvzsbDUH; Sun, 23 Jun 2024 17:15:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719155719;
	bh=6xc2xyXmsrpTItWg6IptTdpN90W19e46SCweNrwd4z4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QCd1Vmfi7/8s3qsK8bcJq1V3dXy73L7NZiNWiMW2h/YlojSzlRfWprMCDw3ibhUk2
	 W6vX3VEQsVlKfW1edVOsjY6V/EhNgQNszuWZH/BS9yyRwaR5+yQ93jQIHmSm/+j79y
	 YOoAdA2eMSBy5sq7mRbob3AguiMoy95CsrbLvgDwD7u4z4DKAAaxq2diqhomNZoN+H
	 eQ8JcyJ128zs2PY923RLqCPMgGbdeBEKLbcGAyV8G5PIc4fQuPgO7zgICNwhoFv+jv
	 6muz8tudmTkaRTOLabI5bXCM2DXdgFRef7pHsEL4PUEvn7CllwapiA6mL99TA6Z+dZ
	 N798nWjA/7hPw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 23 Jun 2024 17:15:19 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: Intel: sst: Constify struct intel_sst_ops
Date: Sun, 23 Jun 2024 17:15:11 +0200
Message-ID: 
 <098acdf266b2f4a922d6a624e9032ec24a09093c.1719155688.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AVRDRDRRLNEQD4JLHIK6F6HQGS2QCL5K
X-Message-ID-Hash: AVRDRDRRLNEQD4JLHIK6F6HQGS2QCL5K
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVRDRDRRLNEQD4JLHIK6F6HQGS2QCL5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'struct intel_sst_ops' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  12250	   1000	    112	  13362	   3432	sound/soc/intel/atom/sst/sst.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  12378	    888	    112	  13378	   3442	sound/soc/intel/atom/sst/sst.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 sound/soc/intel/atom/sst/sst.c | 2 +-
 sound/soc/intel/atom/sst/sst.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index e0357d257c6c..ff03fde12151 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -158,7 +158,7 @@ static int sst_save_dsp_context_v2(struct intel_sst_drv *sst)
 }
 
 
-static struct intel_sst_ops mrfld_ops = {
+static const struct intel_sst_ops mrfld_ops = {
 	.interrupt = intel_sst_interrupt_mrfld,
 	.irq_thread = intel_sst_irq_thread_mrfld,
 	.clear_interrupt = intel_sst_clear_intr_mrfld,
diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
index 126903e126e4..e0db7434543c 100644
--- a/sound/soc/intel/atom/sst/sst.h
+++ b/sound/soc/intel/atom/sst/sst.h
@@ -391,7 +391,7 @@ struct intel_sst_drv {
 	unsigned int		csr_value;
 	void			*fw_in_mem;
 	struct sst_sg_list	fw_sg_list, library_list;
-	struct intel_sst_ops	*ops;
+	const struct intel_sst_ops	*ops;
 	struct sst_info		info;
 	struct pm_qos_request	*qos;
 	unsigned int		use_dma;
-- 
2.45.2

