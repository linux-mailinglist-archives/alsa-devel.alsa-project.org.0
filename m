Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D67340FB
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 14:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8552882A;
	Sat, 17 Jun 2023 14:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8552882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687004885;
	bh=IN60/ADMSOxCgI0LCDHy1IxiE1MH+k+kA7Q8qrQy2Nw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lCo4nkyC0Orbzqx9wvgQskDdi5aMtrsnQ92u4RUFL/RyjGhCLdX4uNT9Noc8MFA+D
	 fCkZomHTd9o+mfOUIU7HpUzjzLf8IbZuRwI8AhJsK1L+3AxCwQEoePGQGbMiy435uw
	 Hoj5oInJxeZ839TFeHWN8OtTau9zVoWbszxiC/BI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 037A1F80149; Sat, 17 Jun 2023 14:27:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6988FF80132;
	Sat, 17 Jun 2023 14:27:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B614F80149; Sat, 17 Jun 2023 14:26:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96418F800BA
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 14:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96418F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JVzftB/B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687004805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=szv0cF+bl4sIifpCG+zmQZUts/OGqmFER4Ll8Eqs/O8=;
	b=JVzftB/B+3YYE4vviwKDoZPnnYuhkb4sbKbdSnf/wbrcgIEuD9pSFsM+ibw5Rpu7bw3PQx
	dqaprjdOFLb23Km+HDLc5zs8s06ZyY8EVCjckFDa2hFjV9roN7Y5L2ienJg/IVMehYjV0j
	NX8KyAX50KCw65zIUS7/plHVsj9LICk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-n_YTZjMnOEO9hka4OFtu2w-1; Sat, 17 Jun 2023 08:26:43 -0400
X-MC-Unique: n_YTZjMnOEO9hka4OFtu2w-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-62fed7d0f05so21443066d6.2
        for <alsa-devel@alsa-project.org>;
 Sat, 17 Jun 2023 05:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687004803; x=1689596803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szv0cF+bl4sIifpCG+zmQZUts/OGqmFER4Ll8Eqs/O8=;
        b=RfK84LA26LEq9gZa7xD5aXsPM7cflcFNxz+raQjZfYz5uhg21FwDDa9dgyUa+LABQy
         dzRrlfcg+qgvJ5REto/VD5Oeuba9AnDMKEk9Y5afSZA60dpBnba7Sp7kyy/3hGob3ifB
         /AQievXBOj/nk1sRkuSdBv7kWzDgcaQx05bQLTSbnXqsZdnu0G7G6S72254oKv0i/NBY
         +h73a0pDfpoFWE4p6JKfNRkXc++N2iKAFZDnOn8fz5eSvJCaDdBo9IBPqfvdoea3XnpL
         skk8LWvraRMxdSnLTRC/1Z9Wb4O/SHvUBxfv0BrAq0wRbzMrk+HwRMsQGmTREqch1lu0
         wX6Q==
X-Gm-Message-State: AC+VfDxX1Aa9BQuuO/HyhTAq+lKXox9VXFs9LZxTsR7CVrO+9fu59lAl
	3rMWC1RTDAm8cBIjgxRPD4qpGrXAQU3pCjC82ef1MFkotrrXTzla7yDX3sDjiUi8d7wEe1E9Amy
	Xj6Vh6UlQ+69/rc8wMuM7+7U=
X-Received: by 2002:a05:6214:2aa9:b0:621:41f6:1f7b with SMTP id
 js9-20020a0562142aa900b0062141f61f7bmr4669478qvb.7.1687004803179;
        Sat, 17 Jun 2023 05:26:43 -0700 (PDT)
X-Google-Smtp-Source: 
 ACHHUZ6lHXpX8/GVgXs6SRlViW67tYe8C1zdG42GI7bVdDa/NP1rorw/xsL8eLyxOx5KpbTQEieK0g==
X-Received: by 2002:a05:6214:2aa9:b0:621:41f6:1f7b with SMTP id
 js9-20020a0562142aa900b0062141f61f7bmr4669446qvb.7.1687004802772;
        Sat, 17 Jun 2023 05:26:42 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id
 l8-20020a0ce088000000b0062df235c6d9sm5050098qvk.18.2023.06.17.05.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 05:26:42 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ryans.lee@analog.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ASoC: max98388: set variable soc_codec_dev_max98388
 storage-class-specifier to static
Date: Sat, 17 Jun 2023 08:26:35 -0400
Message-Id: <20230617122635.3225639-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: VIKBOLOISGGJARZMSQLLZS5RE4COEISO
X-Message-ID-Hash: VIKBOLOISGGJARZMSQLLZS5RE4COEISO
X-MailFrom: trix@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIKBOLOISGGJARZMSQLLZS5RE4COEISO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

smatch reports
sound/soc/codecs/max98388.c:890:39: warning: symbol
  'soc_codec_dev_max98388' was not declared. Should it be static?

This variable is only used in its defining file, so it should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/codecs/max98388.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
index 8062a7115007..b7d1d5c7b72f 100644
--- a/sound/soc/codecs/max98388.c
+++ b/sound/soc/codecs/max98388.c
@@ -887,7 +887,7 @@ static const struct regmap_config max98388_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-const struct snd_soc_component_driver soc_codec_dev_max98388 = {
+static const struct snd_soc_component_driver soc_codec_dev_max98388 = {
 	.probe			= max98388_probe,
 	.controls		= max98388_snd_controls,
 	.num_controls		= ARRAY_SIZE(max98388_snd_controls),
-- 
2.27.0

