Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CAB5609CB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 20:55:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 604321634;
	Wed, 29 Jun 2022 20:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 604321634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656528905;
	bh=IAxGgIafkS92CaWg2unY2iGs359fQAM6HGC/VgT927A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SeqhpwDXzq5h+Tl9BPYVdvVyvhFzkkaSvh55+jGdmO2VJBfd1WfDnT5rEH1NOJoIG
	 lSozNCo7Z88fIdafeGFOdiAPGjnoe57ApYa9w5ns0nSXyTgBtDnyUeAA117he9MRf2
	 37W4+MNJo4haxqxeaX5WcweED1//mLe9+wYF6zzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEFD9F80245;
	Wed, 29 Jun 2022 20:54:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7A64F80115; Wed, 29 Jun 2022 20:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F0AEF80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 20:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F0AEF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="F7NX32j8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656528841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EzOiWzYVI0mEc79jZBk4HlKwQXxVL7d+puocaZTpstw=;
 b=F7NX32j8kCSUIYkjL4NM5Wk9tpiLHqRKSpbVEhXKrY2wMgaZw3b+9NK7B2P3RO3PBWTPzQ
 eJdx1foJZdSuxogF8DvLZmfFHDUVsVPsLyQ4GZ5MUMhprT+WfqMd65uFzfgkXiXjm9iCqU
 nYE6ohO/OI+EioVfLV3wVOco2FG1VyE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-BsqDpnx0PcC__AQ-waZihA-1; Wed, 29 Jun 2022 14:54:00 -0400
X-MC-Unique: BsqDpnx0PcC__AQ-waZihA-1
Received: by mail-qv1-f72.google.com with SMTP id
 x18-20020a0ce252000000b004703cbb92ebso16292950qvl.21
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 11:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EzOiWzYVI0mEc79jZBk4HlKwQXxVL7d+puocaZTpstw=;
 b=4UrZknMuAyi77VPavC5ArKUoORjkc1yHw+D6YqajF7j9asE0CFnXZqUPMMiWXrJrWs
 eDV9ZJAU9pGPf13IgME87gkdqCNgRmxUjjQF3ttRpik1brLIy/5LSiiPSD3P4hxB357v
 l/0ktXuDBFr0vq0YxHJ+gtxnbuVsqp3FALWblHKZkG0EIpoRI4xDda9ZZ8UavOEEpmLn
 RfDfByXRM4MLL43AykekfxiF8zcJi7aXHosQfqJ2zjKCpZsajDpO8MuX9XXsBBuVIxu7
 eUx8IV3p/0d8V+zQze5iZVksQ+0Z3GZpxwti4gF0ZbIq2ZTPh8Ib6CLHm/q3MxwvLCJa
 nQQA==
X-Gm-Message-State: AJIora/lDM7ytjTTNhm0kU1mNp6MyuV9PN3j1onOMhZ7dlak6PZcwE4u
 awn5NGqhTRXQwIjWXpaWGVV+O69erqqPtHn3ebC5y3moV7Oo24z7e3OvIpT12MkVidmeEpWPALN
 GZY2Au8slHzkGfCuj+AEXFiA=
X-Received: by 2002:a05:6214:c4b:b0:470:8a1a:fed0 with SMTP id
 r11-20020a0562140c4b00b004708a1afed0mr9353641qvj.125.1656528839567; 
 Wed, 29 Jun 2022 11:53:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v7HasjPeb63XOccShZcAVfjGTKQd7gcGfCjzhmhoDE2TfmMib4mfVm1foRZjItlX4x5Cy26w==
X-Received: by 2002:a05:6214:c4b:b0:470:8a1a:fed0 with SMTP id
 r11-20020a0562140c4b00b004708a1afed0mr9353631qvj.125.1656528839281; 
 Wed, 29 Jun 2022 11:53:59 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 b14-20020ac84f0e000000b00317c3ce1f4esm11009895qte.45.2022.06.29.11.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:53:58 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: krzysztof.kozlowski@linaro.org, s.nawrocki@samsung.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 arnd@arndb.de
Subject: [PATCH] ASoC: samsung: change gpiod_speaker_power and rx1950_audio
 from global to static variables
Date: Wed, 29 Jun 2022 14:53:45 -0400
Message-Id: <20220629185345.910406-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

sparse reports
sound/soc/samsung/rx1950_uda1380.c:131:18: warning: symbol 'gpiod_speaker_power' was not declared. Should it be static?
sound/soc/samsung/rx1950_uda1380.c:231:24: warning: symbol 'rx1950_audio' was not declared. Should it be static?

Both gpiod_speaker_power and rx1950_audio are only used in rx1950_uda1380.c,
so their storage class specifiers should be static.

Fixes: 83d74e354200 ("ASoC: samsung: rx1950: turn into platform driver")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/samsung/rx1950_uda1380.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/rx1950_uda1380.c b/sound/soc/samsung/rx1950_uda1380.c
index ff3acc94a454..abf28321f7d7 100644
--- a/sound/soc/samsung/rx1950_uda1380.c
+++ b/sound/soc/samsung/rx1950_uda1380.c
@@ -128,7 +128,7 @@ static int rx1950_startup(struct snd_pcm_substream *substream)
 					&hw_rates);
 }
 
-struct gpio_desc *gpiod_speaker_power;
+static struct gpio_desc *gpiod_speaker_power;
 
 static int rx1950_spk_power(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
@@ -228,7 +228,7 @@ static int rx1950_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, &rx1950_asoc);
 }
 
-struct platform_driver rx1950_audio = {
+static struct platform_driver rx1950_audio = {
 	.driver = {
 		.name = "rx1950-audio",
 		.pm = &snd_soc_pm_ops,
-- 
2.27.0

