Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E3C56A308
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:59:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9FD81682;
	Thu,  7 Jul 2022 14:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9FD81682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657198756;
	bh=AzTM3SmQRFfNYnQkQRvC+We0enMtYhZMtZYvOWjpu3w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OrMD//JKg6zNYHJ8/5pQbu3wO54ZOSfKZ01bLI0Hej0wMB1hFtlrDmAwiI80IpuVu
	 ur8tu1bW84wFJChS11UT8Nb+zHnH8ynFmKMBp9T2PSbpAjKhGYZlDglrBqQJI87YWs
	 ucUm9kJ4J1FYABN5VPcNGn8s/cpO7X9AA8NBrTzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0CE1F8054A;
	Thu,  7 Jul 2022 14:56:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E99B2F80544; Thu,  7 Jul 2022 14:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DE74F804FA
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DE74F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lH81vuB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657198609; x=1688734609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AzTM3SmQRFfNYnQkQRvC+We0enMtYhZMtZYvOWjpu3w=;
 b=lH81vuB5qyZg1sbF7ktcFjHnL0WnZ2TOizECA9qnmB7gW169avtbXYkQ
 vlFRE3pIgN/SvIbrNhjNcrMWp4mePEX2a4IdD3qPaPVPwVmZP/rx4W0jP
 EEOyztVCsv9wpInepBATuTZhNOOf4d1zxzIip5RM9DWJh4atQW8+nDV4x
 lk9h5+Xo+uowPCrqs2EcSsUrI3XnmXT1su0+jjMWwLoKxc6FYqXbrqvZ6
 g62nrSASjegGsxy4MhMArNWuDoVbHPQ9Er/R8zc0mN687+LhrR2SUf5i/
 zJtODyr0OE7I5lqx3nk5Lg1ukXrCcqElwAWwb9tYStPGDgy3HvlMXNuRA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272810626"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272810626"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="620781769"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 07 Jul 2022 05:56:44 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 4/5] ASoC: codecs: rt298: Set component to NULL on remove
Date: Thu,  7 Jul 2022 14:57:00 +0200
Message-Id: <20220707125701.3518263-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707125701.3518263-1-amadeuszx.slawinski@linux.intel.com>
References: <20220707125701.3518263-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Make sure that component is set to proper value, otherwise we may
dereference freed component in interrupt.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt298.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index e1d94f128fd9..b0b53d4f07df 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1022,6 +1022,7 @@ static void rt298_remove(struct snd_soc_component *component)
 	struct rt298_priv *rt298 = snd_soc_component_get_drvdata(component);
 
 	cancel_delayed_work_sync(&rt298->jack_detect_work);
+	rt298->component = NULL;
 }
 
 #ifdef CONFIG_PM
-- 
2.25.1

