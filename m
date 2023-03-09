Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB556B265D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 15:11:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA5591817;
	Thu,  9 Mar 2023 15:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA5591817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678371082;
	bh=RWtipuFF4/MU3/D2DDCzzXNXv2dqA21xjIsQ6IZ1rUg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MI3QqnTOeO8bDZwB82GmwB3l4bV4+ha1H9sOsC8nrpVjF6MC2M0UgoicSdDKBs+0r
	 MBfHfJfaM4cxpgrdFRPd0Q2B0SBzjzdHsOa8kHcd8RQdAUfpoQgNDuwztifMQoDvsi
	 RWHoke+CJjzCBBYQOPmyhYlb0R3qlQntDBHIjMSQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB98F80236;
	Thu,  9 Mar 2023 15:10:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33D1EF8042F; Thu,  9 Mar 2023 15:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18690F8007E
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 15:10:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18690F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=eb8CwY+E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678371019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ODObCz4UpLnL30PCazA7QvVVaLpuERoMVAQqToE74AA=;
	b=eb8CwY+ETMRNxvTfJK8+y/X/Yix1xL55xwD4XqMB3+xokHvvyXqjAPCefOY13GuP+cuIOt
	NH7GTfVOYXkiCI4uLrhcP1TGx06EGPs9EZuiPN379JG12WoHW0NqPGrw9rg/SVSsjq0wGU
	XY7pFd+KCua9oo/MnbpSjjxRm2LzXj4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-Q6ayuyb5MwKUIGb7qdpQSQ-1; Thu, 09 Mar 2023 09:10:18 -0500
X-MC-Unique: Q6ayuyb5MwKUIGb7qdpQSQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 19-20020a370c13000000b007428253bb55so1198135qkm.23
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Mar 2023 06:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODObCz4UpLnL30PCazA7QvVVaLpuERoMVAQqToE74AA=;
        b=eOuZR8p5EVW79A7Us9kA2kVZNnvLxR4V95GBYAfRRs/8jx/Hq4a1CYGaxdgRhp/JgW
         rU9firrqyWKiZ+HF2ftzBkRmUa9v9ekCAfRXNbbD7DriYbV7/MKQ91SGuczxh55il3+2
         HTipmoSkVErV1rHOMdD3J28pYDN2Nuxz6G7TSvf6gVC8ylUuTzdOkIiW+fOehOohwfVK
         1a2F1H8uzRzVCZ1mE/fTWS0ascPnu6ZlNXNf/aJwa9+1O3UYnsg1iAMQZRnRmvdazu41
         24VIRZ1R8nIs2o1CSHOAr8aRfHOgEWKKaF35+WfzdKxx6nOD8rwecmR7Gih9IgZRKT1g
         0+lw==
X-Gm-Message-State: AO0yUKVnE9fyoJG31ZC3k96VReW+L5ujB6c4wlHeaQ1lqJ9XevOHUofc
	kGLwc0sZvoMZOgCRjGcuZlr+EvWlPjPMV9ICbyr+58cWM5fAr/Ng1ysivphvt+/8J1iZUQvB+93
	4lmGTMKErmbPxypVeCHSBhS0=
X-Received: by 2002:a05:622a:1ba5:b0:3bf:dc55:ab0b with SMTP id
 bp37-20020a05622a1ba500b003bfdc55ab0bmr38055404qtb.42.1678371002496;
        Thu, 09 Mar 2023 06:10:02 -0800 (PST)
X-Google-Smtp-Source: 
 AK7set84SFK+UksjKHoQN7ky4OZAF9Nw0lVdbFSnR+EKabrEC4f94ZV+uwnSojcAGif2fvgAjpoXEg==
X-Received: by 2002:a05:622a:1ba5:b0:3bf:dc55:ab0b with SMTP id
 bp37-20020a05622a1ba500b003bfdc55ab0bmr38055355qtb.42.1678371002162;
        Thu, 09 Mar 2023 06:10:02 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id
 d17-20020ac800d1000000b003b848759ed8sm13644719qtg.47.2023.03.09.06.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:10:01 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: kiseok.jo@irondevice.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ASoC: SMA1303: set sma_i2c_regmap storage-class-specifier to
 static
Date: Thu,  9 Mar 2023 09:09:59 -0500
Message-Id: <20230309140959.2616497-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 6OLRUG4EXW37UFRG2WBWSBWWESW7YY2J
X-Message-ID-Hash: 6OLRUG4EXW37UFRG2WBWSBWWESW7YY2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OLRUG4EXW37UFRG2WBWSBWWESW7YY2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

smatch reports
sound/soc/codecs/sma1303.c:1594:28:
  warning: symbol 'sma_i2c_regmap' was not declared. Should it be static?

sma_i2c_regmap is only used in sma1303, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/codecs/sma1303.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index fa4b0a60f8a9..b6c132edf3bd 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1591,7 +1591,7 @@ static const struct snd_soc_component_driver sma1303_component = {
 	.num_dapm_routes = ARRAY_SIZE(sma1303_audio_map),
 };
 
-const struct regmap_config sma_i2c_regmap = {
+static const struct regmap_config sma_i2c_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
-- 
2.27.0

