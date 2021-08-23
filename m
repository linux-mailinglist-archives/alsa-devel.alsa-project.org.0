Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A73F4957
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 13:06:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDA5E166C;
	Mon, 23 Aug 2021 13:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDA5E166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629716773;
	bh=Dvy+oSUKwVeHzc3ASm+h6Hb1e6Gn78F6nO05XlAtf/k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TqzfEoL98JSkKyCj9cHv96/PChMx4Rox3VZH0069XIWz0GRhhRF15jp/wIumGj3V2
	 JKPqWJFOdqTCwM4DIgZFrP/c4vS3WUbKs3rlYJWYRJ3Zr8KQE6v5SwePGYv+wD2JKy
	 /des8vpBo3dNz17CtP6m1R/aJk/D2UrUxIeT6sqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27B06F80217;
	Mon, 23 Aug 2021 13:04:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B8DCF80217; Mon, 23 Aug 2021 13:04:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68E9CF8016E
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 13:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E9CF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OdnAqygr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629716678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HXwpApKQMGbc+i21EwUQRmZrqroK6h/T7YFq+z+HcqE=;
 b=OdnAqygrLohbaqhwZF6EgAf+bAEixztq0Vhefc5iOS+dnF23SlvpMFF4XifsV0+NNLO1eh
 uZRvYKJm/kxkWwHFPTc99ee0yf70MNi2LPJusyoxQUYBPbFb6Qy6WSok+Rw9Jhk/AObnEW
 Z4inGviUpc+rxq5fpvneAejEtPn67jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-yugNnwIZP0CfQLbIedFjZQ-1; Mon, 23 Aug 2021 07:04:37 -0400
X-MC-Unique: yugNnwIZP0CfQLbIedFjZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90C47190B2A1;
 Mon, 23 Aug 2021 11:04:35 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.194.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E61218432;
 Mon, 23 Aug 2021 11:04:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: bytcr_rt5640: Mark
 hp_elitepad_1000g2_jack?_check functions static
Date: Mon, 23 Aug 2021 13:04:32 +0200
Message-Id: <20210823110432.64860-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>
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

The byt_rt5640_hp_elitepad_1000g2_jack?_check functions are only
used inside bytcr_rt5640.c, mark them as static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 2f151ba80be5..05667a33d919 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -490,7 +490,7 @@ static const struct acpi_gpio_mapping byt_rt5640_hp_elitepad_1000g2_gpios[] = {
 	{ },
 };
 
-int byt_rt5640_hp_elitepad_1000g2_jack1_check(void *data)
+static int byt_rt5640_hp_elitepad_1000g2_jack1_check(void *data)
 {
 	struct byt_rt5640_private *priv = data;
 	int jack_status, mic_status;
@@ -506,7 +506,7 @@ int byt_rt5640_hp_elitepad_1000g2_jack1_check(void *data)
 		return SND_JACK_HEADSET;
 }
 
-int byt_rt5640_hp_elitepad_1000g2_jack2_check(void *data)
+static int byt_rt5640_hp_elitepad_1000g2_jack2_check(void *data)
 {
 	struct snd_soc_component *component = data;
 	int jack_status, report;
-- 
2.31.1

