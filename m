Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F6D36FC0B
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 16:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2647B168C;
	Fri, 30 Apr 2021 16:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2647B168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619792582;
	bh=mLR6raiRuJRibKIsDfQ5GRyovDgGdY9JJn9c8sIn/1c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JIoristCbygE2e+s374YlmxaXDHIkHgKWXxLcpNQpohqU/ISBNl5Bc6coCz9whlT8
	 Jo1qkGHwIGH35pU/UZXYlPbEVMw+2o0+OIoqFw2QlmyM/SlMYWP2a+oobXzZBG65pP
	 HaiaLnSxPHAkm69oYEpfuWu8z3Ea25DRAc8zO5uI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72FD5F80171;
	Fri, 30 Apr 2021 16:21:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F496F8016C; Fri, 30 Apr 2021 16:21:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D66F8012B
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 16:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D66F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HGJ+0uBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619792487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w/gN216hU1Rn3Btpd2kd7hL2tCgT/dn3Xe/SlBBd5lo=;
 b=HGJ+0uBTOAEN796pJLh1GUHDhhSvCyBCMek40URJ+3n5R209VH3t49WdbzLSqeX/x7Q+zc
 vB/1ETHGA7O6Wg2ASeukNtvFiVxGmFV5LkM2HdjEh9R+gzAyEf5D0J66Gzzoja5qbR3z7f
 UQnYTfPW5IqijmSO3IDGoqb3ZjKjBpA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-sTmZ5xV8M6CSXsppQBCSXA-1; Fri, 30 Apr 2021 10:21:22 -0400
X-MC-Unique: sTmZ5xV8M6CSXsppQBCSXA-1
Received: by mail-qk1-f199.google.com with SMTP id
 p196-20020a37a6cd0000b02902e41c0c90bbso22962369qke.5
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 07:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/gN216hU1Rn3Btpd2kd7hL2tCgT/dn3Xe/SlBBd5lo=;
 b=o1PIjc1vh4KOCeDS7lU2uwSC1tY005MUOZ8KUCdrjpxbbmqJYKXcR66vkL31FL1+Da
 wy8/127AcDZEIoSccMuAbm+uRiTAnqNqy7B5Yr1MB0wBKYdnZ989MkeuBS6M60QEVg7P
 QnXCqdH7J/1NXImaaiMqMj5qw/LljtMkZOsGrR7YuULecKX0bZ1mFO+YxIXfJ4ZaCGfu
 7UDY61zGasEqHV7pCkzcGTo3jfbNSfnUN+DRhaWYt1D/goTGY3XwkLFIHYCRsoNmQfJW
 4UKrKOm+OSjYsH3XmGIWIVMzqJfPVxqQrqImIEXkmkuqvMRxlcbLAj/FxoVlESQtsFmY
 6eqA==
X-Gm-Message-State: AOAM531QS04pmm+c5zNqBpwogEYZe4eArrgT6xCirGFZ2F5hAG1Bfekv
 jIULnO13ssIwaNS4s5CyMhZj8yMdZPSjv0Zi0rRs3zdNH7mhLx7fU99+nkOXbd2Lgd8Mgy2Knhf
 Bv1W4wzsXqi4sWUpw7dvK66U=
X-Received: by 2002:ac8:5ac6:: with SMTP id d6mr4946522qtd.18.1619792482549;
 Fri, 30 Apr 2021 07:21:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdZI/RkrGjDivkFxS4UsfSFFktmqzzu95SsUqZ3E9oGQ70pLr6U5HZ8qsqrD35IpwXr+REig==
X-Received: by 2002:ac8:5ac6:: with SMTP id d6mr4946481qtd.18.1619792482162;
 Fri, 30 Apr 2021 07:21:22 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 1sm1477180qka.52.2021.04.30.07.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 07:21:21 -0700 (PDT)
From: trix@redhat.com
To: srinivas.kandagatla@linaro.org, bgoswami@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2] ASoC: codecs: lpass-wsa-macro: handle unexpected input
Date: Fri, 30 Apr 2021 07:21:17 -0700
Message-Id: <20210430142117.3272772-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

From: Tom Rix <trix@redhat.com>

Static analysis reports this problem

lpass-wsa-macro.c:1732:6: warning: Array subscript is undefined
        if (wsa->ec_hq[ec_tx]) {
            ^~~~~~~~~~~~~~~~~

The happens because 'ec_tx' is never initialized and there is
no default in switch statement that sets ec_tx.  Add a default
case that returns an error before the array is accessed.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2:
  - handle the input error, keep switch
---
 sound/soc/codecs/lpass-wsa-macro.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 1a7fa5492f28..d3ac318fd6b6 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1727,6 +1727,10 @@ static int wsa_macro_enable_echo(struct snd_soc_dapm_widget *w,
 		val = val & CDC_WSA_RX_MIX_TX1_SEL_MASK;
 		ec_tx = (val >> CDC_WSA_RX_MIX_TX1_SEL_SHFT) - 1;
 		break;
+	default:
+		dev_err(component->dev,	"%s: Invalid shift %u\n",
+			__func__, w->shift);
+		return -EINVAL;
 	}
 
 	if (wsa->ec_hq[ec_tx]) {
-- 
2.26.3

