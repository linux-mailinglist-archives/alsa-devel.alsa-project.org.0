Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD2905943
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:58:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 454CFE9A;
	Wed, 12 Jun 2024 18:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 454CFE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718211500;
	bh=wN0d/8ELr/wL1/Cpgz+AM71Z3Ev6/U/uMM5xUQsA7zg=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uJRKO+BhgazoAUDWHAVXEOY6yFyMlDt+ShPA6JkucywZHfjFQcSbHg9Qpf5VZgzLA
	 Hs32fjrXOcTytib6jXev8HKk5Q5fibManWOa1dJAegMsxGaTy9vMqbGuw82EqdtK1p
	 6a4jKQnXSWFJ3o8lCk9v80el6CH4BPCZ6gChq0/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C27AF805BB; Wed, 12 Jun 2024 18:57:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92382F80496;
	Wed, 12 Jun 2024 18:57:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91DA4F8057A; Wed, 12 Jun 2024 18:57:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBC2DF80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBC2DF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ju6QFyLn
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57ca578ce8dso1938809a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718211459; x=1718816259;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++OGzFVcBm4uEhH5yU1JqM6E2MpRXisSlLqZSmtECO8=;
        b=ju6QFyLnPe5Vjtj9zyAK0T9sNEj/yztiZW5qJCJqGDN1WlQABlSOnSxTTU7SWDgnFZ
         dxJ0tdBv0B90Q+sXIaqzlc/qi58vIYkJ17RcPAb6KzeiFcPTBaqaY2XJL564FcSigSv5
         nbZpU7miw/KKIvHdUzdIBHx6nrcWAsOpUlBbaBeJPmWRZlB1eXJMDU2wRHOO0Xu76oG/
         qZKLjnPbzqsLl5KrjMZlP1PQR9iQfInhiQxAVL8+cVLntb7Al+MlK8OFlCFIEZivdA2J
         PB4I/UerbH5h34D1UHd8xGeoDPLg3alCj7ZPqdPHYt8JhwT5gaM+8xWD7kKiwHPPjCom
         f5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211459; x=1718816259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++OGzFVcBm4uEhH5yU1JqM6E2MpRXisSlLqZSmtECO8=;
        b=qBKsMvhIzSdakjyadSQ7nFbQEM9r9dOsfOKc8olCi0aEhbKO7p8tX8Ij90pAKgaovQ
         d4S7Eh5qax6OiykLsTJDKGjzNPWbE6IvLheMBYmXnnLqbLzqKmMl2ZL9rNL5+/nOWVLF
         eRWrsdB7KZSV8W8IcppXbvEFjddCBLLJ/WQfHSTPHfVA4paxbaEzq0NxQdpaPKSS0/CR
         E7hEfdcs8yJQ+aGCEPvMGTmhhZwd+XPLANuJPduVavEZHzj3oARgGWeZ3PsCfZsXgwO1
         dhgyWPXqA50t6tmc2rLZ2ID5sFYcPIKl5Z8gXcFrW7Xwm/wj6HqfBJvTY0ukjOZUvNUm
         JA9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiSFKZz8i4kF2UHGl7xllbbw2gtJPTlPipc8RNUFNPP0L41lnnI5buuFS8d/q+NAW7NsUuAkonZ72mPJMFegTUKQ7CUfTYmBf3jpw=
X-Gm-Message-State: AOJu0YxxuajeTaqtHl98XIkYSRhHyyMU9h2uSK/9IMLw89+pnDhZpFza
	ptFuxQ2PCEaLKlWUJs3nCWReW91dBgM340JIVhhG2S93Kos7zStRogdRRj22YzA=
X-Google-Smtp-Source: 
 AGHT+IF836A5i+me8GLcRRQJaRgp0OVmTJirfPxSvaoJYHrk64DZsC+Tv1+4VFubuAyRndBPcsBGRg==
X-Received: by 2002:a50:d6dc:0:b0:57c:748e:8c57 with SMTP id
 4fb4d7f45d1cf-57caaae5c4fmr1629719a12.37.1718211459331;
        Wed, 12 Jun 2024 09:57:39 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57ca8caed84sm1564048a12.43.2024.06.12.09.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:57:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/3] ASoC: codecs: lpass: add support for v2.5 rx macro
Date: Wed, 12 Jun 2024 17:57:20 +0100
Message-Id: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDTaWYC/x2N0QrCMAwAf2Xk2UBbZ0F/RXxI28wFtBuJFGHs3
 +18PI7jNjBWYYPbsIFyE5OldvCnAfJM9ckopTMEF0YXfcDXSmaYl8IZW7jgyNfoKJUY/QS9SmS
 MSanm+ejeZB/WQ6zKk3z/qzu0Mzz2/QfybOppfgAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=wN0d/8ELr/wL1/Cpgz+AM71Z3Ev6/U/uMM5xUQsA7zg=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmadOCosZkrFenGj0f4v6e63uCrImo/xB0NSFBy
 7MarRKB6YSJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmnTggAKCRB6of1ZxzRV
 N2ELB/425bmlrp+cAozeGyMGB7MzypQjhkcZfef10UJpMmk9KWUX9JXme1UsbIhEZQtPEd5lpkr
 UgTyqxnVH/ustTMcPyWH/HbBx6/5SLHpT0d39gxe4yuurbggrKwl0y2XRfeMsRqgpzOribmyl8g
 ZLRm+T/zMe944k4Hu5RtAZMW0G0EmodGZExlt69yl56iG2Zz/TMI2Ty3GuFEhRgrAw6ZZWXizPA
 0oCOUfIfkMewz5nl7HgV2oHhtGF/2XSUSWNMvwKcUOki8PepLl8T6OV52XgJo6N7GgHUAJQXu1J
 3Bx5zJDJlTeYe6bsPgbt8MB3irCMst43fiF6gAKgaxJcvpDV
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: Y6AOSDI2DIUNIJQE2ZLWT7D4OHVZ6CSV
X-Message-ID-Hash: Y6AOSDI2DIUNIJQE2ZLWT7D4OHVZ6CSV
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y6AOSDI2DIUNIJQE2ZLWT7D4OHVZ6CSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds support to reading codec version and also adds
support for v2.5 codec version in rx macro. 

LPASS 2.5 and up versions have changes in some of the rx blocks which
are required to get headset functional correctly.

Tested this on SM8450, X13s and x1e80100 crd.

This changes also fixes issue with sm8450, sm8550, sm8660 and x1e80100.

@Neil Armstrong  can you pl test it on sm8650

@Krzysztof Kozlowski can you pl test it on sm8550

Thanks,
Srini

Changes since v2:
	- added some locking around version variable.
	- split 2.5 changes to a new patch.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Srinivas Kandagatla (3):
      ASoC: codecs: lpass-macro: add helpers to get codec version
      ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions
      ASoC: codec: lpass-rx-macro: add support for 2.5 codec version

 sound/soc/codecs/lpass-macro-common.c |  23 ++
 sound/soc/codecs/lpass-macro-common.h |  35 +++
 sound/soc/codecs/lpass-rx-macro.c     | 555 ++++++++++++++++++++++++----------
 sound/soc/codecs/lpass-va-macro.c     |  29 ++
 4 files changed, 490 insertions(+), 152 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240612-lpass-codec-v25-4e960abd661f

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

