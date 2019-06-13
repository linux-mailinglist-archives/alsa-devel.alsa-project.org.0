Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F2435A7
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 13:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39E9B181C;
	Thu, 13 Jun 2019 13:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39E9B181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560426377;
	bh=uQ96amlyZ42rL/XtjVyaHlhOH/7exK7pOVQIx0EJKC8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bc6tUD+acdWcIafADdJjqe37hVVoKT0M2N81T5rFul4D1VM2g5QL2jnUncfxqJfZC
	 JEx65uGV+/1wU75UvmexapzJ5bVjpzSbX5Zynkz8lKqtOz4Y3o9Clv+oMFrdkFpL3X
	 yjMuABKioqItnefFIjyxdSnYp9yxEoJDyRHvRJAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A828EF896F1;
	Thu, 13 Jun 2019 13:42:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B571F8970F; Thu, 13 Jun 2019 13:42:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1213F80794
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 13:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1213F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="ARq6OKiJ"
Received: by mail-wr1-x443.google.com with SMTP id f9so20373141wre.12
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TExrEtVR1Qp+m2eA960X7wRJwZP76vaDnZqCemHrZMo=;
 b=ARq6OKiJiNJ8rcawe7B7CKa+kO25GegV4OLzlT2aC16bZB7ZbGOeh4KfbetAfkiOk3
 YmtzX9XOJh2s/leNI5KQNSwKtxxkdQjzpdv8KAotEvXsQ7oqgwqaUX6IhwnhwJULiEzw
 HQINex/o0ZH99njmn2fOFSgGPlL6gLGHjJxPe1kpQMtpPZAoo0d79nsOVRjthp0VlL/6
 exoH2sc5NANWn1mm4wVjEwCcQknz0R7B57hFUlVQDaYC8nALkbz73efD7CqPRVL9NhQ1
 XRALVm86xKQJFghDjinxQgkadLhBSdqqAw2EQXBtQw/hKgK7S1lvbkzlqzbIo6KxT59B
 aS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TExrEtVR1Qp+m2eA960X7wRJwZP76vaDnZqCemHrZMo=;
 b=KxvLHICgwqkrN9+q1REUklAoRxhb2+HfqOkhiSTr6OJQc3o0gilI+vTFeJb5B8Ogab
 ql3D92nff+M4G39/HrHGc+CteoOvQIOMHZl9OwhQeeBAS0VxMDNuFldS38zzDb8RJeVK
 HHztZmI13SfhO4mOTl0QVR+McmTPOpV2fbfExMiBwgk79P8dJQoFubPZWF7GBOHcOncD
 D7snX6c3YyePnQYOlJMti/qnfKz7vFjDFdUb8VQJTZH4ZgjPPfn0SDHR4KeNTCL565hN
 OKlxoravNI3/mqI327rpJWfvzMek+ZVM6nxfIkNnq+wmUaZ3OAvpygyNTOrG0Vu7o05P
 CKSA==
X-Gm-Message-State: APjAAAVACsEL49rcZLcBIzUGWBcbiTzWdC9In0ls1sYWqwzpwFBtQ/lD
 VbYE6WXuiXUvmyjpYDBwIV6TEw==
X-Google-Smtp-Source: APXvYqz/BTbpTahJKuFfHLaXnGe/ye7zKjSH9AReM7p3t9Gmxi21Yj4MpRdaVoBmNQqviV7TOcVAMQ==
X-Received: by 2002:adf:eb09:: with SMTP id s9mr57922277wrn.127.1560426162128; 
 Thu, 13 Jun 2019 04:42:42 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b5sm2598490wru.69.2019.06.13.04.42.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 04:42:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 13 Jun 2019 13:42:32 +0200
Message-Id: <20190613114233.21130-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613114233.21130-1-jbrunet@baylibre.com>
References: <20190613114233.21130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 3/4] ASoC: meson: axg-tdm: fix sample clock
	inversion
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The content of SND_SOC_DAIFMT_FORMAT_MASK is a number, not a bitfield,
so the test to check if the format is i2s is wrong. Because of this the
clock setting may be wrong. For example, the sample clock gets inverted
in DSP B mode, when it should not.

Fix the lrclk invert helper function

Fixes: 1a11d88f499c ("ASoC: meson: add tdm formatter base driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm.h b/sound/soc/meson/axg-tdm.h
index e578b6f40a07..5774ce0916d4 100644
--- a/sound/soc/meson/axg-tdm.h
+++ b/sound/soc/meson/axg-tdm.h
@@ -40,7 +40,7 @@ struct axg_tdm_iface {
 
 static inline bool axg_tdm_lrclk_invert(unsigned int fmt)
 {
-	return (fmt & SND_SOC_DAIFMT_I2S) ^
+	return ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) == SND_SOC_DAIFMT_I2S) ^
 		!!(fmt & (SND_SOC_DAIFMT_IB_IF | SND_SOC_DAIFMT_NB_IF));
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
