Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC28E8BDFB6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 12:28:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A9E3823;
	Tue,  7 May 2024 12:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A9E3823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715077710;
	bh=UA3F40A7r6F4bjPkfKJpAKLHE1h9mHy8CdOamekYs/0=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XQt3Z7CC7UKzMN5XMt2tbMf2LtcI4X5S9EKvKEoRK6Hfn3SydWw8LHtD++cvycy/B
	 Maa5U/bV7bRtqf525wSkNRJMbMGoDhm96mjgRPkOsgQik5LIg47U/weEMVMYbt/NVf
	 v0NHH0qELAy1tYmF3CajNuRDlOUlO0HN+Mvknb84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0F69F805AD; Tue,  7 May 2024 12:27:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D7F6F8057C;
	Tue,  7 May 2024 12:27:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3000F8003A; Tue,  7 May 2024 12:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDB63F80152
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 12:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDB63F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FFYpNn/p
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a59ad344f7dso564551166b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715077663; x=1715682463;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFiLG2QOTgMREMZMtW7unZxhYPzyuGBw42NHTzIrjEg=;
        b=FFYpNn/p6oCL2e0O9dY6j5xdiIWuWpjPKi64qnRW/gtSFHDaU08/UUbqgQpI3l2cDy
         M3dAcGg6O6kKyvrSmor7NLd8H+ERdHvZIPXRmRX72fODKWXKSnEcU4Cmrry/0pgSJf5Q
         hb4oYWoGsGTUiQwA/2WBAFM5B9mP4xMsLU65FFQp9zRzzrqgANN6bgm4p0DDRYn59h2B
         5Q2fgbYNgWzSofEaXdoEFEwBqQlQwLSK6d+FcghF9neIcWoU6gLULpEteHoOCDKIfrrz
         tB3dd58ddUiqqKQ0JKi91u7nN0Q9bCk9Hq6S/gAOF39aQVghUZ44MB+H6GpO6gqf3aAJ
         +YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715077663; x=1715682463;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFiLG2QOTgMREMZMtW7unZxhYPzyuGBw42NHTzIrjEg=;
        b=tQeSuWd8z7ZGaFHgDSQqSKXAxWKqdygoTkNg5bLDEA7/j1bz6dy2EzIETDHCwsqql3
         sYgOs+YiwouNbDrl/1qJuiFdRg2TLslOYdLVB6Pnu/mBBbjrDu170/cxTQ62hCmakNns
         hTJ5uPW6L8w6ZzumCL/0h2umvXkII1W2IXlcM1966A2MV8NLfKIgMRj92CPzPiVbXM8w
         qeOFlcnLTE/dGRK99pY3ks9l4ovgpitI8XAg7l6/LrvbO7L5j4g6RFUdsUWZZCpPL3E+
         bI62GaFkIae7XC0bakcjEA3jJKi192mq0fMIcwQXqJerE0afmEyC0eO27uZvVCRSR5yi
         bC6g==
X-Gm-Message-State: AOJu0Yxj6h3fF4QCRNNY1rwkXGByO23OYMJq0i9v8tQhx5cuYVuVg4LT
	XtAKmBw96DKj25jJpcW7zk2Nsjrm65zEkWSZXNJRu9GoeK8PpUwHFTJRhDTAlWU=
X-Google-Smtp-Source: 
 AGHT+IGiGDBt5yxrFViI2K6OwEdG5BxYWaB5AQ6x9sPDuZmTlizY4kXoke2k+cqZtkEZS82lyV2hMg==
X-Received: by 2002:a17:906:f595:b0:a59:affe:b9f with SMTP id
 cm21-20020a170906f59500b00a59affe0b9fmr6075822ejd.6.1715077663076;
        Tue, 07 May 2024 03:27:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 bo15-20020a170906d04f00b00a59b87dd0bbsm3370093ejb.161.2024.05.07.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 03:27:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] ASoC: qcom: x1e80100: Correct channel mapping
Date: Tue, 07 May 2024 12:27:29 +0200
Message-Id: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABECOmYC/x2NwQqDMBAFf0X23IVNiNX2V0oPUZ92QWNIQATx3
 xs9DgwzB2UkRaZ3dVDCplnXUMA8Kup/PkxgHQqTFeukloZ9XnveDVoxIuz4sgJmXnyMGiaGr0e
 x3QvPpqVSiQmj7vfh8z3PP1coU5NxAAAA
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UA3F40A7r6F4bjPkfKJpAKLHE1h9mHy8CdOamekYs/0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmOgIZDiepsVWvVzHlozJIF74v2e8BDRMWdJ9yg
 tul3Qy5IlSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjoCGQAKCRDBN2bmhouD
 106XD/492uoI9DGw7QfAgKxvhjg/WFIaXDR7JoFHNQBWWpD6g8oM/uOyKXhus/RrfCk7ZXcD+H9
 1bhDN+FFWC9W43rhUMYNBsJlql7J5BH5PXmEuB2YdsEmIgEHw9fuzNtXCeN/hj4DVtmcpuVlZ62
 8lpWMKS3FSpH9BYVlMKzN7C1V1RvxktZl2h/bXs4eHVMCGnUBNkyzOTzkFwdIPdRy33RBidEjBP
 AVPtgRJMSg2SENodHxrjpvdM9gzNZD7Ag4h1S1AIUm14eD1fdnNeaZoDwrinJ0U+G4NOIScL2NS
 VxDR8P437XoyX5dsE/1kviIFmp7ZvB3jhXf/gqJm0HYq6sbnx3GXWcuGrxSiVnHuIpMhCu9VQhn
 DVFU2IcSCJlXZpd/PteAxMbE12AOQUrKCac3CnJHl38KiceuRIyF4iasoquQmtsEL2WEA94z+ie
 BA8IP+TPVkABmK5jhnLs8gULj5/mshiB+jPdqGCMuXRSt/iwBkuV83XFk5y42RYy6dr286bz3r5
 JK2Xpj6KCLkpD6/mpHknjMk2Eb2NJzoAMjsU4qaGgjNI/07WAT/GLCnV3eswbEl2Jet58KdMA3+
 TEzMjoO7nZ8GsatHKT/TLgKrV90MCRwXw4aloqAZdjAz60ocAoZi9meM0T77FLj0KstAFiq1iQX
 hGestPGsZPrgzaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: AGR732Z2CXVQU6AZY2YLZJRCJHO4XTGR
X-Message-ID-Hash: AGR732Z2CXVQU6AZY2YLZJRCJHO4XTGR
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGR732Z2CXVQU6AZY2YLZJRCJHO4XTGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

First patch is a build dependency.

Description
===========
X1E80100 CRD is the first board, which comes with four speakers, so we
still keep fixing and adding missing pieces.

The board has speaker arranged as left front+back and then right
front+back.  Using default channel mapping causes front right speaker to
play left back stream.

Adjust the channel maps for frontend DAIs to fix stereo and four-channel
playback.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: Constify channel mapping array arguments in set_channel_map()
      ASoC: qcom: q6dsp: Implement proper channel mapping in Audioreach
      ASoC: qcom: q6dsp: Set channel mapping instead of fixed defaults
      ASoC: qcom: x1e80100: Correct channel mapping

 include/sound/cs35l41.h                 |  4 ++--
 include/sound/soc-dai.h                 |  8 +++----
 sound/soc/codecs/adau7118.c             |  6 ++++--
 sound/soc/codecs/cs35l41-lib.c          |  4 ++--
 sound/soc/codecs/cs35l41.c              |  3 ++-
 sound/soc/codecs/max98504.c             |  6 ++++--
 sound/soc/codecs/wcd9335.c              |  6 ++++--
 sound/soc/codecs/wcd934x.c              |  6 ++++--
 sound/soc/qcom/qdsp6/audioreach.c       | 14 +++++--------
 sound/soc/qcom/qdsp6/audioreach.h       |  1 +
 sound/soc/qcom/qdsp6/q6afe-dai.c        | 16 ++++++++------
 sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 +++++++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  6 ++++--
 sound/soc/qcom/qdsp6/q6apm.c            | 28 ++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6apm.h            |  8 +++++++
 sound/soc/qcom/qdsp6/topology.c         | 12 +++++++++++
 sound/soc/qcom/x1e80100.c               | 37 +++++++++++++++++++++++++++++++--
 sound/soc/soc-dai.c                     |  4 ++--
 18 files changed, 142 insertions(+), 39 deletions(-)
---
base-commit: c5e512ffe106f751c61e5a036560f522e58eadcd
change-id: 20240507-asoc-x1e80100-4-channel-mapping-ea5f02b9e678

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

