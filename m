Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30E45984A1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 15:47:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 365E3163F;
	Thu, 18 Aug 2022 15:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 365E3163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660830468;
	bh=FkqgeAt0+1e3Uhl/7pMMtl6fdsAWF2PA5T6BX1AA/aY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q63o7SkFZ9QdBWnupN4ICiVWNsZ+kvB2iyexZkJ7i3wSGehDXMCx034Hkb3q9NnT1
	 n5Nb+IR/AZ1+S1sK38s9uoqD6UJiHEgBsWr4VgxBvVHfHuMlBH3GXV+ktnrHGVD5U1
	 X6tfQEcYU5a9qaJjPi2wr3IucM7dBjW+FBUZzvEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 951A5F8049E;
	Thu, 18 Aug 2022 15:46:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE4D7F800E9; Thu, 18 Aug 2022 15:46:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3485AF800E9
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 15:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3485AF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tvrEW8/A"
Received: by mail-wm1-x32a.google.com with SMTP id
 i129-20020a1c3b87000000b003a62f19b453so72569wma.3
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 06:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=9Ds9SCyWv8tIHrUgmAXNfm5+EVXzQeANVhipst31cuo=;
 b=tvrEW8/AFy1sphi52sXodEZD6wK9GmoWGc+ximO7cDQvzygeAaMtzKMn2ziNYCiTAW
 UK9NR0jh+gK8Odieb+jUppFmQgp4fq40x4jb4KQG9ziYLy6dcS6pQwW3CLOAdHRD6pj4
 4J+ExVTNOdwIH1Pe/lYa7q5N90EuGJdhZVXEdCplaB7umGhSeEqOAekqEpbiTqky5xEj
 opvnIwdmJZkpnIYgshi7L8c0o+KGDDOZ11x4Tx6ko3eX2GzKWrhlL+R5LHAbbXa6RJyg
 X3AKIiF9eyBTuUavO1EHAF/365xQPu9Sr5T1vBSY2oQPyGuxyLOIXb+m16isyzVnQ6KD
 +LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=9Ds9SCyWv8tIHrUgmAXNfm5+EVXzQeANVhipst31cuo=;
 b=kgs+4dRI631/fJ7VWN6yPhPqw6tKojrD+t48aCgohRUof2+xzvK9qxRFUeokLod5uh
 L6OeAIktIgq9LAR6vsSfPK4tIlmO2Q+/dfICAB+7epWTH6Fq89mDveQsaJnNq4P0YoX+
 gZQBDFJFH6F4zSnR4V8m5LMuMBc+tigaeVt1sm+OcXOm0cNOZQxx+IPE77+JHklDD82z
 V26pLZiFDuSshr1XAupl5cR2ZElz0JKW5742ACFUMudyjpusCZfLJOi7mTE0ecBsODr+
 MrtPlq5QclAgNqY3GIv3ovtsLt1naCwSjPCen8P9i9p33FYXiaN+8POdHLhapiHv4b97
 63Eg==
X-Gm-Message-State: ACgBeo2Y5X2go/WNheTbwzmFL6bktg31p3IhDAGzwfOOVuqZROB862oZ
 k6bUrd1wXf+lmQtObYSl0lNcCQ==
X-Google-Smtp-Source: AA6agR6Khq9CsT5T42xFf9oRrqQfOqFWWEfHyu70AyJ9wlCf9tg/6xeEEvxs4pqI2+lWO8ozK6D0Ig==
X-Received: by 2002:a1c:7708:0:b0:3a5:5543:cec4 with SMTP id
 t8-20020a1c7708000000b003a55543cec4mr5270398wmi.47.1660830403389; 
 Thu, 18 Aug 2022 06:46:43 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a5d6785000000b0021e47fb24a2sm1454549wru.19.2022.08.18.06.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:46:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/6] ASoC: codecs: lpass: add support fro sm8450 and sc8280xp
Date: Thu, 18 Aug 2022 14:46:13 +0100
Message-Id: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
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

THis patchset adds support for SM8450 and SC8280XP SoC.

Tested SmartSpeakers and Headset on SM8450 MTP and
Lenovo Thinkpad X13s.

THanks,
Srini

Srinivas Kandagatla (6):
  ASoC: qcom: dt-bindings: add sm8450 and sc8280xp compatibles
  ASoC: codecs: wsa-macro: add support for sm8450 and sc8280xp
  ASoC: codecs: tx-macro: add support for sm8450 and sc8280xp
  ASoC: codecs: rx-macro: add support for sm8450 and sc8280xp
  ASoC: codecs: va-macro: clear the frame sync counter before enabling
  ASoC: codecs: tx-macro: add support for sm8450 and sc8280xp

 .../bindings/sound/qcom,lpass-rx-macro.yaml   |  2 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml   |  2 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  2 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |  2 +
 sound/soc/codecs/lpass-rx-macro.c             |  2 +
 sound/soc/codecs/lpass-tx-macro.c             |  2 +
 sound/soc/codecs/lpass-va-macro.c             | 72 +++++++++++++++++--
 sound/soc/codecs/lpass-wsa-macro.c            |  2 +
 8 files changed, 82 insertions(+), 4 deletions(-)

-- 
2.21.0

