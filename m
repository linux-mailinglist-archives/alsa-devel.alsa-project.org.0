Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B406154ED1E
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:08:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45BDD1B0C;
	Fri, 17 Jun 2022 00:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45BDD1B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655417304;
	bh=ZERpvGk6JBzFwOx//nRfYnj+hzodvXoYEt05yQtBDw4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dHd+1V2fHydeQJGtFOvnNYsZUSW3PfVCyLho4d5EdRrzc4oAVth66HCWjUkZgkknu
	 JcqEJkdWCLi3LwaigFkB6wgo/B319XM6bGF9qdys4PCfRGDFnpCGOqsNYEVh4J6eG8
	 fZEkURVUQfdgUn7+Fp6GFESSdRZdFd8zM3xsidCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA77F8055C;
	Fri, 17 Jun 2022 00:05:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D5A6F8055B; Fri, 17 Jun 2022 00:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC6D5F8053E
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC6D5F8053E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nZBUeLyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655417095; x=1686953095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZERpvGk6JBzFwOx//nRfYnj+hzodvXoYEt05yQtBDw4=;
 b=nZBUeLyfNbGJZwOxA4HsTmHeLmzgf2UQkC+0FI5tDsWzw+u/sSJUVzCj
 RJiQ6Xx03OiYs1ceZwnB0asWZdFq9ZrfuYLAQqqiTDy0OVZpA0GoafmXr
 DMaTCbtnotv2OfS02mNdmSM/d552T/oGlVOfjA33idArV65lXVF7y6ut4
 83i6zmbmQXcKDkDlgJXr4AZZZr3qZGAzgUBeqJbSaxs0RzmCuBHh81KEm
 Wxk3QXi/6TWwSTA0PSQxhV5V9NsqpwKco1QVbFghyNXKJiIMSRkb4SG97
 xSpG7L/b3m5IHbkBc04yK/CFgyAMYWOKvnqwxzC0ozjysDoqEfj6d8ugM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304810981"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="304810981"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:04:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="728085042"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:04:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/11] ASoC: ti: davinci-mcasp: use pm_runtime_resume_and_get()
Date: Thu, 16 Jun 2022 17:04:27 -0500
Message-Id: <20220616220427.136036-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
References: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
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

The use of pm_runtime_get_sync() is buggy with no use of put_noidle on
error.

Use pm_runtime_resume_and_get() instead.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/ti/davinci-mcasp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index e2aab4729f3ab..0201000b619f6 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2111,8 +2111,7 @@ static int davinci_mcasp_gpio_request(struct gpio_chip *chip, unsigned offset)
 	}
 
 	/* Do not change the PIN yet */
-
-	return pm_runtime_get_sync(mcasp->dev);
+	return pm_runtime_resume_and_get(mcasp->dev);
 }
 
 static void davinci_mcasp_gpio_free(struct gpio_chip *chip, unsigned offset)
-- 
2.34.1

