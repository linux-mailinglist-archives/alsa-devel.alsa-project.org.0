Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F98B2D04C1
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 13:26:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB215168F;
	Sun,  6 Dec 2020 13:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB215168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607257587;
	bh=K1q36zssMDbkzcVpi5HCsQOs4lr2yWjM7ztQSZhPI8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgz/J+ZsSM7W7ORsfPhrTp933jFCfcRXYv15tdUX8yRtSAcl1d82VjdkV9xYu62qn
	 bigKJ1df3HT6GDtpph53Op9aV1vx9HPWC0bc1GW10b/BxlrIk9k0EAABeEMQHoA0YO
	 6fqNCaZcWWlQwJnrKo+XG9aKOEQVCIq7iAiskp9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D847BF80255;
	Sun,  6 Dec 2020 13:24:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 385F4F8019D; Sun,  6 Dec 2020 13:24:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5581FF8010A
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 13:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5581FF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="C8DOG0vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607257485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPna4+2FWzTr09AosTFKfCdqfvHpCl9uEeyRRGqXlGA=;
 b=C8DOG0vuWCm6JvSJ5mtsinpTmcN4TTkNYKNxyDMl46UNpi0DPbsgqJQhWNJfNYGHncIFpO
 PdpXm7HvNtPYuWKAOaleyiSp6bAUnUN1F88D1UNTyh4dhRBKZjrVIED4It1rCWwonpMMub
 FPg2BMMz666BoYooFACjjSoCCNtCjhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-0fPhjxVpNFuVDPZ5vQfXrQ-1; Sun, 06 Dec 2020 07:24:43 -0500
X-MC-Unique: 0fPhjxVpNFuVDPZ5vQfXrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5148180A08A;
 Sun,  6 Dec 2020 12:24:41 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5DF25D6A8;
 Sun,  6 Dec 2020 12:24:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: Intel: cht_bsw_nau8824: Drop compress-cpu-dai bits
Date: Sun,  6 Dec 2020 13:24:35 +0100
Message-Id: <20201206122436.13553-2-hdegoede@redhat.com>
In-Reply-To: <20201206122436.13553-1-hdegoede@redhat.com>
References: <20201206122436.13553-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

When using the snd-soc-sst-acpi driver then the compress-cpu-dai bits are
not used, the cht_bsw_nau8824 machine-driver is the only BYT/CHT driver
defining them.

When using the snd-sof-acpi driver then the presence of the
compress-cpu-dai bits breaks things because the sof topology file for
by/cht devices does not contain routing info for them.

Drop the compress-cpu-dai bits, fixing the snd-sof-acpi driver not
working on devices using the cht_bsw_nau8824 machine-driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/cht_bsw_nau8824.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index 8131af1730f7..ac78173d01ec 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -176,9 +176,6 @@ SND_SOC_DAILINK_DEF(media,
 SND_SOC_DAILINK_DEF(deepbuffer,
 	DAILINK_COMP_ARRAY(COMP_CPU("deepbuffer-cpu-dai")));
 
-SND_SOC_DAILINK_DEF(compress,
-	DAILINK_COMP_ARRAY(COMP_CPU("compress-cpu-dai")));
-
 SND_SOC_DAILINK_DEF(ssp2_port,
 	DAILINK_COMP_ARRAY(COMP_CPU("ssp2-port")));
 SND_SOC_DAILINK_DEF(ssp2_codec,
@@ -209,11 +206,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
-	[MERR_DPCM_COMPR] = {
-		.name = "Compressed Port",
-		.stream_name = "Compress",
-		SND_SOC_DAILINK_REG(compress, dummy, platform),
-	},
 	/* Back End DAI links */
 	{
 		/* SSP2 - Codec */
-- 
2.28.0

