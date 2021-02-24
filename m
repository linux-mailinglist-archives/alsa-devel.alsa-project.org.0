Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB9323ACC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 11:52:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD9515E0;
	Wed, 24 Feb 2021 11:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD9515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614163963;
	bh=+fIFepCrATe95dHrWmavbTfJXy1Q8C+8WY/Z/QxJgEs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f//G/BqTa5KxZao9j8LoRDDXscQ+/8gcAJycboXWlFL7BdHSF54YuZLO638+I1lmv
	 6ajJsSee1D6NQJ9dNy9WmgJY3GL0NuQDEITN9j41V+59hIlwirZk6uZCsNJYU0Wb8n
	 IkD8kiZwvx8drn66jcbgsH5eDmxBaurnVf/ylL0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFA44F800F2;
	Wed, 24 Feb 2021 11:51:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0562FF8016C; Wed, 24 Feb 2021 11:51:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49CF1F80129
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 11:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49CF1F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Rhq0qg9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614163864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bLKx3sPnI8hni2GLqmh/xHqEYOD+IYxi0da7Rn6t1Bw=;
 b=Rhq0qg9CZ+0+6nFHFYgf4V1iR69q5+iMBUcbuRSm1gpRJ6TTX8FEGg5Jl5ZoguYtnnECbo
 t+rl1ivkGb9VUrGRV9uH6fOTVS8c0q9INuYY3K1p4+/e9+3Lxz4wPrgOG3judKFHtYyy3Y
 OfVaYGFWKuJForP+x25OY7kuAaLV2oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-rDQy0zcPN3q-kYgQa7dyUQ-1; Wed, 24 Feb 2021 05:50:56 -0500
X-MC-Unique: rDQy0zcPN3q-kYgQa7dyUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BDEB801975;
 Wed, 24 Feb 2021 10:50:55 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-243.ams2.redhat.com [10.36.113.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15DBA2D035;
 Wed, 24 Feb 2021 10:50:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 10-p0XX OVCD
 current threshold
Date: Wed, 24 Feb 2021 11:50:52 +0100
Message-Id: <20210224105052.42116-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

When I added the quirk for the "HP Pavilion x2 10-p0XX" I copied the
byt_rt5640_quirk_table[] entry for the HP Pavilion x2 10-k0XX / 10-n0XX
models since these use almost the same settings.

While doing this I accidentally also copied and kept the non-standard
OVCD_TH_1500UA setting used on those models. This too low threshold is
causing headsets to often be seen as headphones (without a headset-mic)
and when correctly identified it is causing ghost play/pause
button-presses to get detected.

Correct the HP Pavilion x2 10-p0XX quirk to use the default OVCD_TH_2000UA
setting, fixing these problems.

Fixes: fbdae7d6d04d ("ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 Detachable quirks")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 24ced8e4a574..1f6a636571c2 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -581,7 +581,7 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 		},
 		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
 					BYT_RT5640_JD_SRC_JD1_IN4P |
-					BYT_RT5640_OVCD_TH_1500UA |
+					BYT_RT5640_OVCD_TH_2000UA |
 					BYT_RT5640_OVCD_SF_0P75 |
 					BYT_RT5640_MCLK_EN),
 	},
-- 
2.30.1

