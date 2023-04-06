Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B37256D9C25
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1C35EE9;
	Thu,  6 Apr 2023 17:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1C35EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680794646;
	bh=UNFfzsqiFT0eXl6gKLAIIVUqI8cuoseA0VGDEGs8SZM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FcJBbabs/E3pysqO3JRmcuUcsgHBz2U8tMQBjZtH9+s6sf9mzKmqPjggfAxy/Vq+k
	 erwnUz8INwZt7+aueSJb2aPb7YIdFzn65NMHi8VDbHgHVpBnVEX65Hw3L28z/sN6DT
	 59/ivOXLDrzIAQ4xWDh2Gnew6sISdO3mhrRUuzXE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C1BEF80171;
	Thu,  6 Apr 2023 17:23:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22539F80246; Thu,  6 Apr 2023 17:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9848F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9848F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=H8FqDMjk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680794586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mb2Sx08sAZAB72OxlGRSKRYkFlVM9JheVxzU3a3tBgA=;
	b=H8FqDMjk+zkJU4tzYS1L+5QD9xHF+sPyaRlegajC9T+ha5ys2/AkEMokpvyjRD9osoTl66
	Lpy7QS1Na+IEUKzE6y8o7w9sS/O9Vt1CuutsPVkPr6CydscUXcqALI5dyQw6Z0l5xyKNZr
	VL/939snDWskPEjfch1OlJWwDtk8eKs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-b9acTtYaP_KqcDKG7QV4FA-1; Thu, 06 Apr 2023 11:23:04 -0400
X-MC-Unique: b9acTtYaP_KqcDKG7QV4FA-1
Received: by mail-qk1-f197.google.com with SMTP id
 s2-20020a37a902000000b0074a28a891baso7352893qke.18
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 08:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mb2Sx08sAZAB72OxlGRSKRYkFlVM9JheVxzU3a3tBgA=;
        b=fOWBTsB9JUlZhzjtyPUk1/cPIBUCOJGXzNplhjzeXpUkzLHjexJLDgujUjxelHWk8u
         WzESPqU4Bwcp0OVOw+M8gFATYvVXYAuEYvoHq95O9GlQriczBci4Sg73hWfNVjq9AfVw
         ez7VihimAhdq1trp4eW6hIVIZSUSSzFuZOzMPfnn+ugsO99PKnohluVyJhXq6Iy7WGA1
         73MczcMYriI7NAwUQyTEDOOrNvV+wPtzIOuNxBe0eR/GlpucEDdg8naNWN1HQEvW4Ipy
         Qw+eEXsi11UJQRyUCZjWfUO1QTZqGuZGoAccNa/2kZ2/W5LXl9kjJDGEzb0IGOY8IuoA
         1VJQ==
X-Gm-Message-State: AAQBX9f7Z+7fGF0G+NV88QeY3oIMjyeYLoRYExf5YuyyD7l/7dHWARoF
	tp/i/NcexDaqlAZAzVeyuiV5m7LiLUsnwMBw+Q8IE7OeL4s3uaLCm85TtyEK/GE2cJ+lvnadcgl
	jKZXqZcAHs/4UxDUfgSA2V0A=
X-Received: by 2002:a05:6214:27c8:b0:5e7:9e1b:b26d with SMTP id
 ge8-20020a05621427c800b005e79e1bb26dmr251077qvb.16.1680794584255;
        Thu, 06 Apr 2023 08:23:04 -0700 (PDT)
X-Google-Smtp-Source: 
 AKy350Zr6EDiDUbNCN6HoQhjJ/hxrFFPN0pY0RRcYSf2GAMT0RjMAz8z2j2goR/9tR/0D9pNLsZoXA==
X-Received: by 2002:a05:6214:27c8:b0:5e7:9e1b:b26d with SMTP id
 ge8-20020a05621427c800b005e79e1bb26dmr251020qvb.16.1680794583895;
        Thu, 06 Apr 2023 08:23:03 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id
 da1-20020a05621408c100b005dd8b9345bcsm579903qvb.84.2023.04.06.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:23:03 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ryans.lee@analog.com,
	pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: max98363: set varaiable soc_codec_dev_max98363
 storage-class-specifier to static
Date: Thu,  6 Apr 2023 11:23:00 -0400
Message-Id: <20230406152300.1954292-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: CFXHKLRQX3YCBRLD7R3TFNSAK7W3P46X
X-Message-ID-Hash: CFXHKLRQX3YCBRLD7R3TFNSAK7W3P46X
X-MailFrom: trix@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Tom Rix <trix@redhat.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFXHKLRQX3YCBRLD7R3TFNSAK7W3P46X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

smatch reports
sound/soc/codecs/max98363.c:392:39: warning: symbol
  'soc_codec_dev_max98363' was not declared. Should it be static?

This variable is only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/codecs/max98363.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index 4585ebb1e82c..dcce06bff756 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -389,7 +389,7 @@ static const struct snd_soc_dapm_route max98363_audio_map[] = {
 	{"BE_OUT", NULL, "AIFIN"},
 };
 
-const struct snd_soc_component_driver soc_codec_dev_max98363 = {
+static const struct snd_soc_component_driver soc_codec_dev_max98363 = {
 	.controls		= max98363_snd_controls,
 	.num_controls		= ARRAY_SIZE(max98363_snd_controls),
 	.dapm_widgets		= max98363_dapm_widgets,
-- 
2.27.0

