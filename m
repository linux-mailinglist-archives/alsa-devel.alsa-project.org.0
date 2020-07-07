Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ABC2177AE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:14:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2253169B;
	Tue,  7 Jul 2020 21:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2253169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149281;
	bh=1wwqari9gNrxCPngf/VcrsP6hAfvT7mnantPtJjGLRs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kfyPxUgLHLZhUtH5GcEYpMNzlHejuYl1MpTXC0NugJOhOfiSSC6Oey7wGhSUtTwVw
	 Ja82AGdgy1zCZ4ZhPbatTBbUXIINFvKmhpAaa6eCift0QIhWSMWmQICojTLOztTM0Q
	 jnDvN/6h3TJdNfEJoAAtGWffXYdFJMtXuEIw7nCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D23D0F8033D;
	Tue,  7 Jul 2020 21:07:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5220EF8033E; Tue,  7 Jul 2020 21:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAD3DF80329
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAD3DF80329
IronPort-SDR: Cw0HqGg1llmNWybwiXpXUA0fZIJNAjTf4U6zTbmhxJRibJFoNLXFSjMbLDT99QL6TewXXsobuM
 VqUzN+qTa+OQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="212631596"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="212631596"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:07:00 -0700
IronPort-SDR: VJ7a0EjZrd0ufWqwP6r+7r7ZDBvNZaOy27CX22Oi8MF0jjxIKqJyzFF5i4M00cgPeYkH0Y/toG
 L5xkKMK4h7SA==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="268278694"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 12/13] ASoC: codecs: max98390: fix 'defined but not used'
 warning
Date: Tue,  7 Jul 2020 14:06:11 -0500
Message-Id: <20200707190612.97799-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Steve Lee <steves.lee@maximintegrated.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Lee Jones <lee.jones@linaro.org>
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

Fix W=1 warning and removed unused table. In this case this a
duplicate of

static const struct of_device_id max98390_of_match[] = {
	{ .compatible = "maxim,max98390", },
	{}
};
MODULE_DEVICE_TABLE(of, max98390_of_match);

already used in the rest of the code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/max98390.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index b345e626956d..3e8094241645 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -944,14 +944,6 @@ static const struct regmap_config max98390_regmap = {
 	.cache_type       = REGCACHE_RBTREE,
 };
 
-#ifdef CONFIG_OF
-static const struct of_device_id max98390_dt_ids[] = {
-	{ .compatible = "maxim,max98390", },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, max98390_dt_ids);
-#endif
-
 static int max98390_i2c_probe(struct i2c_client *i2c,
 		const struct i2c_device_id *id)
 {
-- 
2.25.1

