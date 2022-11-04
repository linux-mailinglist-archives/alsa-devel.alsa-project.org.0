Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA36196AC
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 13:57:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52DFA1634;
	Fri,  4 Nov 2022 13:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52DFA1634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667566655;
	bh=gYttK6lyXB6FJSnFqhLPWNrRIzhDxzxvFT7b0LWR+kk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxb2LgJz0sqlKm42zrjPfx02famc22lKZu9iVeBAdodbw6/uWtjG3+Dzv6IudYuCx
	 G5pOwsySqF16RUlA6JGhYoCFu7mAta9kT6j474WwapjE45CSALj5y8j1cpnu/6zuc6
	 55kp/V7DA1cAZjBXUZLp+u1FEXyLFwIst74JapeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4DD6F804E7;
	Fri,  4 Nov 2022 13:56:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4D56F80506; Fri,  4 Nov 2022 13:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E651F80149
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 13:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E651F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Vs+v4DDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667566572; x=1699102572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gYttK6lyXB6FJSnFqhLPWNrRIzhDxzxvFT7b0LWR+kk=;
 b=Vs+v4DDbvPlj8BM42MHTLXEflPgKuIVHjKj4SL7DqJxmxJ7tRFLw1Cfd
 gRuy7g1RsMKCezglb1PPTlrFGq6dYi2wknGfrYdWdOQnpq/39bdubMyqx
 lUNXOGGm1R+A61ULJjQZshRRxVxb73uLPi41gcrkwq+Td/UAcqm+F1xMo
 CfP+giUOIFVqGX16Q1VSNWqI7Gr8q9Dxkx9h4LPF+kSIoQyntzO9jFgZs
 zTcoiXw8Z+ah4CmeYm86ciY/nMF1roCjr+McO4628yMz6oNOAW5fAMJ7R
 dxRE7Xgj7nGVorql2g9ZFNrt8TZmZZpteVjtSzVdSTXJOekfM/jeckucN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="290347647"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="290347647"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 05:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="666357618"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="666357618"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 04 Nov 2022 05:55:48 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: component: Propagate result of suspend and resume
 callbacks
Date: Fri,  4 Nov 2022 14:12:42 +0100
Message-Id: <20221104131244.3920179-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104131244.3920179-1-cezary.rojewski@intel.com>
References: <20221104131244.3920179-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Both component->driver->suspend and ->resume() do return an int value
but it isn't propagated to the core later on. Update
snd_soc_component_suspend() and snd_soc_component_resume() so that the
possible errors are not squelched.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-component.h |  4 ++--
 sound/soc/soc-component.c     | 22 ++++++++++++++++------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index c26ffb033777..421f0fc4df3e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -456,8 +456,8 @@ int snd_soc_component_open(struct snd_soc_component *component,
 int snd_soc_component_close(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream,
 			    int rollback);
-void snd_soc_component_suspend(struct snd_soc_component *component);
-void snd_soc_component_resume(struct snd_soc_component *component);
+int snd_soc_component_suspend(struct snd_soc_component *component);
+int snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
 int snd_soc_component_probe(struct snd_soc_component *component);
 void snd_soc_component_remove(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index e12f8244242b..27b862ded846 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -318,18 +318,28 @@ int snd_soc_component_close(struct snd_soc_component *component,
 	return soc_component_ret(component, ret);
 }
 
-void snd_soc_component_suspend(struct snd_soc_component *component)
+int snd_soc_component_suspend(struct snd_soc_component *component)
 {
+	int ret = 0;
+
 	if (component->driver->suspend)
-		component->driver->suspend(component);
-	component->suspended = 1;
+		ret = component->driver->suspend(component);
+	if (!ret)
+		component->suspended = 1;
+
+	return soc_component_ret(component, ret);
 }
 
-void snd_soc_component_resume(struct snd_soc_component *component)
+int snd_soc_component_resume(struct snd_soc_component *component)
 {
+	int ret = 0;
+
 	if (component->driver->resume)
-		component->driver->resume(component);
-	component->suspended = 0;
+		ret = component->driver->resume(component);
+	if (!ret)
+		component->suspended = 0;
+
+	return soc_component_ret(component, ret);
 }
 
 int snd_soc_component_is_suspended(struct snd_soc_component *component)
-- 
2.25.1

