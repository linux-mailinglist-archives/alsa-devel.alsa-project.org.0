Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD43729D71
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:55:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20241E75;
	Fri,  9 Jun 2023 16:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20241E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322514;
	bh=tlmN7wIfwR/Ux2AzCHAsNlZLgnUc+amCY3lp87gbeRI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Vf+jTZXCIj9kPMgdjMy4l8HEy6m0ZJnP9qkdUCpCUXibgjuq8fk/dQkztPslfKnps
	 FIq+R8XrkXeI+inCbW2fYYKasZoIOFUfBYbJlOwOOzTMqmgeOgmFgn+swVF567eUUf
	 SAsu7P+yxRa/n/Y3/JwiD09ghIW7m1wR3KCot8tw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D65C6F804DA; Fri,  9 Jun 2023 16:54:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA8BAF80254;
	Fri,  9 Jun 2023 16:54:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9E26F80199; Fri,  9 Jun 2023 16:54:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9517AF800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 16:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9517AF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KSOkzUtK
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f62b512fe2so2464132e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322454; x=1688914454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeftDeyvvysATSitJ+hgLelm68R1NmQyMnxNP/qXI28=;
        b=KSOkzUtKrwVPxWpFH7oNQ7Fv+3X39paXhtnpEsPt+jAqXuCsDV9K4ANu1Hzlg03d1o
         jVYB5dJdyl1nlnrZSu4WyJ2RnAl9gMmKFIZ469cV3tSOiCHeIRMjVrOHLafx5Wkq4oJM
         xMoymFNVcUtkE+b1mnEiecCGzP7l8yCRVHeGq5lncuHOfaxXK+K77AdDU+jAwflnMobM
         1Trb+ckh94xZwnPpyKHvplw/j+U0OGLIuj5rPfKvldMNHhUTN7N/zD7b541UB3nkaoOU
         Jl9vIVpslY/2GcIGa2s3k6Ce60foTnSPlqsDR8r5KSYOPNr4pMwKUkdU3WcsAjcHJyL3
         2Yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322454; x=1688914454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeftDeyvvysATSitJ+hgLelm68R1NmQyMnxNP/qXI28=;
        b=d0DcFYKkT9CTCoZLnfGYpXCg8xQCHKbAaO8zU3HRSKECIBQB/oP9TMjkcoYyCOKF8t
         Kb16m2+HQEPmOk4wqjMD0HqwLGupJItb7QXNBCaml/b6+uJTAD5v9+0PK7C4MgUUpgDV
         W8Go1Gx1biuswUNMmzi4f6RHacw/REIj1OSIYM8/8yeqozFy49StFNPCsuDgtUDFfAx/
         FwDawXLzUgDCLnEv/ls7wxoPl06GenQQRf59jjs61LxqSH9+CkpobmuOmA7TTIL3vtQz
         3ZmJCDmsNO/DC6DogY6OQTRq4AxYWd0BwNkFfaZaggMLG6dzlEAswQgqU4g/oZITNJbt
         MJKQ==
X-Gm-Message-State: AC+VfDzoM6VPTGLtEzRyojTUszhxOUIqZu4krcqONYz0an+UD/zjmP7P
	ZknFscGh9g6gqCq814ke+f1ynA==
X-Google-Smtp-Source: 
 ACHHUZ7jY1rwqaF8movy77QYmPcO580cVoSBABEAOaV3TJjxtZk5cpIC4Dy6acTqJyBocb1nRz7Hjw==
X-Received: by 2002:a19:5f16:0:b0:4f6:25a3:95ab with SMTP id
 t22-20020a195f16000000b004f625a395abmr1044393lfb.25.1686322453936;
        Fri, 09 Jun 2023 07:54:13 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm2946632wmr.2.2023.06.09.07.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:54:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 00/11] ASoC: qcom: audioreach: add compress offload support
Date: Fri,  9 Jun 2023 15:53:56 +0100
Message-Id: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D3UIO4RPP75WCUFM4TADGWDAZEJDARSN
X-Message-ID-Hash: D3UIO4RPP75WCUFM4TADGWDAZEJDARSN
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3UIO4RPP75WCUFM4TADGWDAZEJDARSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds compressed offload support to Qualcomm audioreach drivers.
Currently it supports AAC, MP3 and FALC along with gapless.

Tested this on SM8450 and sc7280.

thanks,
srini

Changes since v1:
	- removed lots of code duplication
	- moved ALSA patch out of this series.

Mohammad Rafi Shaik (4):
  ASoC: qcom: SC7280: audioreach: Add sc7280 hardware param fixup
    callback
  ASoC: q6dsp: q6apm: add end of stream events
  ASoC: q6dsp: audioreach: Add support to set compress format params
  ASoC: q6dsp: audioreach: Add gapless feature support

Srinivas Kandagatla (7):
  ASoC: q6dsp: audioreach: add helper function to set u32 param
  ASoC: q6dsp: audioreach: Add placeholder decoder for compress playback
  ASoC: q6dsp: q6apm-dai: Add open/free compress DAI callbacks
  ASoC: q6dsp: q6apm-dai: Add compress DAI and codec caps get callbacks
  ASoC: q6dsp: q6apm-dai: Add trigger/pointer compress DAI callbacks
  ASoC: q6dsp: q6apm-dai: Add compress set params and metadata DAI
    callbacks
  ASoC: q6dsp: q6apm-dai: Add mmap and copy compress DAI callbacks

 sound/soc/qcom/qdsp6/audioreach.c | 248 ++++++++++-------
 sound/soc/qcom/qdsp6/audioreach.h |  51 ++++
 sound/soc/qcom/qdsp6/q6apm-dai.c  | 445 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      |  68 +++++
 sound/soc/qcom/qdsp6/q6apm.h      |   6 +
 sound/soc/qcom/sc7280.c           |  23 +-
 6 files changed, 745 insertions(+), 96 deletions(-)

-- 
2.21.0

