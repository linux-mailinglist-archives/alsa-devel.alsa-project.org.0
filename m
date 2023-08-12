Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE90977A217
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 21:59:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D14D391;
	Sat, 12 Aug 2023 21:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D14D391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870387;
	bh=GP7mt4vQ+QzRp+Jwmpqhtbmy1Qzd07aiYPK5D7S9Zu8=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Jgmh2u383yCL6yH+eMNatIyrFd2wPQ/fUqcBmDaRHN5JiUUOWFTglJlgBahwsLpOH
	 MjVvGoH9Oj7em5qGU6C5GjxBSH32rxTO1UIWMyHzXXvKHwvwIdR2LTlD8Z8Na5YKke
	 Zeq7z9fttAI8csguo0HwNd/AYejtwBz+LPeuMPaM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28434F8055B; Sat, 12 Aug 2023 21:58:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A30CF80166;
	Sat, 12 Aug 2023 21:58:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FD1AF80510; Sat, 12 Aug 2023 21:56:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DFC7F800F4
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DFC7F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B+0ak7e0
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4ff1b5c93e7so501750e87.3
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870207; x=1692475007;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fL1GkCls/lRXUl11jGLVZ3NysdneBSUheg11xD/AOY=;
        b=B+0ak7e0NYxaQA0IFyknC3O07CuBJ0eWe3yOt3pRfk38UguGu+aqbZlTFPJqxy56q5
         q/FWH/4fFc2hsxupFUps36/WNAIyzGznaB23LdJlvgfDK/yuo0EFfXJ+AzCJ9EkP2utT
         Qs9c/nNErtazQ5FfHQxYr/O2+c8eYx8HkFmkOdZAsZ4kXVivGLCE1AK9H2ybPnocHJh3
         l6KflfM66GEqP0Ri7XaKBHrZA0cEeeuPHai4WcElM3Q+rkf1sTGGKclDn5JVIAeWlYH1
         v5qzM5MGwdJv5Sj1cg89U/komYKTMxaYiKqD2tGkbu2QYQ7UAvUWC4xLNQ2+as3r4ASR
         UKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870207; x=1692475007;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fL1GkCls/lRXUl11jGLVZ3NysdneBSUheg11xD/AOY=;
        b=UQgfRqHlcogVODNwMEd9vCCWuo5AzFiWgvc76YCCeXaBRJ2liILSZMmRYCFMFSJAiv
         c/LvFzmsVAuePwcF42Y3+5OoI6c53b5iB24ddtZh9mbUvDg92INNjPi5pxmaF49JV6iu
         mM0hs9XFhkOjwlK04mk2Uuv2EhKAphAwFTvs7Os4AA24BLZSPx4gXFdnYxVVUrqsnUBd
         u2SKKoTW0nMOUeWNyXWPDzHcT+v4ETaMbv89+QjsSZqJmWlYkADj9ojsxd0HKQRdcl0g
         LOKDidVZ+C2DieGPFVUIbovgBE+tdU1medAlKFGMQdK12jDyCmiTSKV37PooTZVMhK//
         mxFQ==
X-Gm-Message-State: AOJu0YwrwnKtIwtcFMQo9sYu0iORo1JLaIpBTth1UnC7Ey9FJmu4A4xP
	cv66h6HGr/5XEP4Rov1g8dNXdg==
X-Google-Smtp-Source: 
 AGHT+IEjRfyIk6V1H50lmax7c5pwSA33ciPquKzJ5WZQiKGci2UG5OBX+V+me9wsIOwkHtcZauSGmw==
X-Received: by 2002:ac2:435a:0:b0:4fe:ec5:2698 with SMTP id
 o26-20020ac2435a000000b004fe0ec52698mr3265045lfl.50.1691870207247;
        Sat, 12 Aug 2023 12:56:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/14] ASoC: rt: Drop unused GPIO includes
Date: Sat, 12 Aug 2023 21:56:38 +0200
Message-Id: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbj12QC/x2MMQqAMAwAv1IyW2hThOJXxEFq1CxtSUQE8e9W4
 ZYb7m5QEiaFwdwgdLJyyU18ZyDtc97I8tIc0GFw0Xu7kCbhehRRO2tJFtHH0K8fCC2rQitf/3K
 cnucFtD2j62IAAAA=
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: KN6FNIHMPSFKXC5GZPXOZ6OMYRN23QM5
X-Message-ID-Hash: KN6FNIHMPSFKXC5GZPXOZ6OMYRN23QM5
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KN6FNIHMPSFKXC5GZPXOZ6OMYRN23QM5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These drivers include legacy GPIO headers for no reason
at all, so get rid of the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (14):
      ASoC: rt1011: Drop GPIO includes
      ASoC: rt1015: Drop GPIO include
      ASoC: rt1015p: Drop legacy GPIO include
      ASoC: rt1016: Drop GPIO include
      ASoC: rt1019: Drop GPIO include
      ASoC: rt1305: Drop GPIO includes
      ASoC: rt1308: Drop GPIO includes
      ASoC: rt5514-spi: Drop GPIO include
      ASoC: rt5514: Drop GPIO include
      ASoC: rt5645: Drop legacy GPIO include
      ASoC: rt5659: Drop legacy GPIO include
      ASoC: rt5660: Drop GPIO includes
      ASoC: rt5682-sdw: Drop GPIO includes
      ASoC: rt715: Drop GPIO includes

 sound/soc/codecs/rt1011.c     | 2 --
 sound/soc/codecs/rt1015.c     | 1 -
 sound/soc/codecs/rt1015p.c    | 1 -
 sound/soc/codecs/rt1016.c     | 1 -
 sound/soc/codecs/rt1019.c     | 1 -
 sound/soc/codecs/rt1305.c     | 2 --
 sound/soc/codecs/rt1308.c     | 2 --
 sound/soc/codecs/rt5514-spi.c | 1 -
 sound/soc/codecs/rt5514.c     | 1 -
 sound/soc/codecs/rt5645.c     | 1 -
 sound/soc/codecs/rt5659.c     | 1 -
 sound/soc/codecs/rt5660.c     | 2 --
 sound/soc/codecs/rt5682-sdw.c | 2 --
 sound/soc/codecs/rt715.c      | 3 ---
 14 files changed, 21 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230811-descriptors-asoc-221835f35f32

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

