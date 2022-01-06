Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DF5486365
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 12:03:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6B4C1868;
	Thu,  6 Jan 2022 12:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6B4C1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641467038;
	bh=wIRKXX47jlCaYcl09owqdEv7pF/Q7FLUdJNFZVcmhEw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cFZj5laz1NtX1BRSGqiLe6D1tRiKIkDsvKAyFPIkgg1pqK+PZ9eU1Lsl4h5hCWJ4R
	 XNaNU392iW2Ar7uaVfy9wWGMdyFTZLPGcDQm6FxjLmXkAn4Y9+QqBDhbd6uqmckkBO
	 t374Ezeug8m6fl+Lz9qQAi/ahfLLsUGEZLGOGRzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C48EDF80515;
	Thu,  6 Jan 2022 12:01:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02A7DF804FB; Thu,  6 Jan 2022 12:01:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE9CDF800BB
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 12:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE9CDF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DPGBTJK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641466899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DH7c+j/JJm/6lgho1gqY0xzSzN0YIryPVi/RpIaE6/w=;
 b=DPGBTJK2zk3QYi/gplutnT2pm87jlrKs2szdzb1LmcSXcc3h6HWXqIL2qjDMomyASO+IeV
 0wAzZlR4JTd7sXiEtNbYZyfvkavhGcvolqMM7iJUz6pUGMJoFYP+eOm6YfDj91/HnM8slz
 kn6BQMG+1Jpqtc0Z/zGfRKjg2BdCBkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-kyg9SdNMPomuI0OyxHyZYQ-1; Thu, 06 Jan 2022 06:01:35 -0500
X-MC-Unique: kyg9SdNMPomuI0OyxHyZYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FEE41023F4E;
 Thu,  6 Jan 2022 11:01:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39F6D7E124;
 Thu,  6 Jan 2022 11:01:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/6] ASoC: rt5640: Fix possible NULL pointer deref on resume
Date: Thu,  6 Jan 2022 12:01:23 +0100
Message-Id: <20220106110128.66049-2-hdegoede@redhat.com>
In-Reply-To: <20220106110128.66049-1-hdegoede@redhat.com>
References: <20220106110128.66049-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Bard Liao <bard.liao@intel.com>
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

Commit 2b9c8d2b3c89 ("ASoC: rt5640: Add the HDA header support") adds
re-queuing of the jack_work on resume when rt5640->jd_src != 0.

But the jack_work will unconditionally deref rt5640->jack and that might
be NULL. E.g. the sound/soc/intel/boards/bytcr_rt5640.c machine driver
call snd_soc_component_set_jack(codec, NULL, NULL) from pre_suspend to
disable the IRQ to avoid spurious wakeups, so when rt5640_resume()
runs rt5640->jack will be NULL in this case.

Make the queueing of the work conditional on rt5640->jack instead of
on rt5640->jd_src to fix this.

Fixes: 2b9c8d2b3c89 ("ASoC: rt5640: Add the HDA header support")
Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index f3659b14c74e..ceb2d50b17aa 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2737,7 +2737,7 @@ static int rt5640_resume(struct snd_soc_component *component)
 	regcache_cache_only(rt5640->regmap, false);
 	regcache_sync(rt5640->regmap);
 
-	if (rt5640->jd_src) {
+	if (rt5640->jack) {
 		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER)
 			snd_soc_component_update_bits(component,
 				RT5640_DUMMY2, 0x1100, 0x1100);
-- 
2.33.1

