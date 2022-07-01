Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C4563749
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 18:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD45E16AD;
	Fri,  1 Jul 2022 17:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD45E16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656691241;
	bh=z3nZNoIeh3UvzBKNYJI2lW6Tj4nNvaLWSShsdZASZ2k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BdNNUVb7pLOqDhQ4Ls0NuSLVKe4kYL/SGUEfuxJdxXdAxWsB26os8E21hixHU2kZ5
	 PY8GKoX7g1WqViA7hQXfmtSPR37BH0y+pHa062A8oNBAGs/YyaUDUvLI0ICexsToDF
	 bCHwxMR5XDUFzYTLT3l6WKc+fIGY4EFePxd+utmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F34F80256;
	Fri,  1 Jul 2022 17:59:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AF19F80155; Fri,  1 Jul 2022 17:59:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACA38F8014E
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 17:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA38F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ecDLZ10i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656691177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3ViBZTo7+P6CuULplF5aZdglMlpqIG92IWrr6hqoZuI=;
 b=ecDLZ10iY+w2P1ZRWsQvhpv5B7c+41mtZOpeJDtbBTgbBsDhWpb2RP1t2IL3XeNlkhRHRB
 ZWJIQRM8kRXxmHImCpbe9fx+qT3lduvToqT/hHlIrhGAuCF2xXfhExy/fyoDyFCPzFsUfA
 iOUQF1xbNa52NcGrc3UfhSGcgs/jdS8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-PZQx4uB3MwC_X398eyK2AQ-1; Fri, 01 Jul 2022 11:59:36 -0400
X-MC-Unique: PZQx4uB3MwC_X398eyK2AQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 f10-20020a05620a408a00b006b267fdf71fso445668qko.6
 for <alsa-devel@alsa-project.org>; Fri, 01 Jul 2022 08:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ViBZTo7+P6CuULplF5aZdglMlpqIG92IWrr6hqoZuI=;
 b=fC3+iX1iU/0i1l1Y6sUXVSuXTXxYkiS4IV6obI64c4HXYMezEvEGL6Bkq8TO5YiFIp
 lwmPtjTF1QtT5N4j0keqB0wqw3FYRhVxnEbuYystYegnM+ADAG7Xubk6U3frtLiYeD2z
 g7tEM/paK7ObKXr1ZDWi+i/WFDE4WVZ5feaqXzhHhhi3e7+nAKQhdu+HvsHvwxfBRajI
 qPnq87vraFunsCz93N09RB7fbQF1mek5NQ+PbwCcSNVRyswQj7TUFPBpsGp3xKJCtiww
 Q/dp/RGNu5f88PjHfmnlV9ujbxyrG0UguPmREIhlzrMiSvDlCwpOVvPqlNizzcJc+sfp
 4KzA==
X-Gm-Message-State: AJIora8P47gq2TOUYbEkw3Z1vzMfqXrDslMxPhaOOWwusqmDWZm+GNwG
 0wFDCuxhYZoX7YyxFg4A+W5T4U4Yz+mPi1aYy38D+XZSEWTYC5/kh+z/LY/qkMtCtrXytnJN2E5
 ZxwlobAd1hf4IuPk8x/50q30=
X-Received: by 2002:a37:887:0:b0:6af:147c:fed8 with SMTP id
 129-20020a370887000000b006af147cfed8mr11398421qki.70.1656691175579; 
 Fri, 01 Jul 2022 08:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDN5DQ7LAZQpRQ7ZnFyAXmPCSLgKuUxkxMsCn5VlYgkvegKTTuDpjUoPZ9Z4CpwnlALkDIAA==
X-Received: by 2002:a37:887:0:b0:6af:147c:fed8 with SMTP id
 129-20020a370887000000b006af147cfed8mr11398381qki.70.1656691175122; 
 Fri, 01 Jul 2022 08:59:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a05622a121200b002f90a33c78csm16127153qtx.67.2022.07.01.08.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 08:59:34 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, nathan@kernel.org,
 ndesaulniers@google.com
Subject: [PATCH] ASoC: codecs: wsa883x: fix fallthrough error
Date: Fri,  1 Jul 2022 11:59:30 -0400
Message-Id: <20220701155930.262278-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
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

clang build fails with
sound/soc/codecs/wsa883x.c:1207:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                default:

Add the missing break.

Fixes: cdb09e623143 ("ASoC: codecs: wsa883x: add control, dapm widgets and map")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/codecs/wsa883x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 40c7d64a9c41..dcd88175b9cd 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1204,6 +1204,7 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 						      WSA883X_SPKR_PWM_FREQ_F300KHZ);
 			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
 						       WSA883X_DRE_PROG_DELAY_MASK, 0x9);
+			break;
 		default:
 			break;
 		}
-- 
2.27.0

