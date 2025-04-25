Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF165AB7F71
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:57:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A2D061662;
	Thu, 15 May 2025 09:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A2D061662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747293910;
	bh=IG5EYBIkkvxAjFWHA58vQMRAHNLYBMvaI/+axls57V4=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Gmouk3fCHHh8GSBcl8Htf3k7ej8RiOkuRy9NmWbypSYMDXU1QVK0pwE/6pozQD3Ku
	 Qxf2ody13Q4lYhTSCHgPkWl79olbam4+YjNA4hK/qwC3eooKWNZXMcE+/C6FMuXGQV
	 v9VjCC4C3E1NyZtZegEQrPQIH/0cUAcf1DvA6IE8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9942EF80C16; Sun, 11 May 2025 16:32:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B586F808C3;
	Sun, 11 May 2025 16:32:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF851F8E557; Fri, 25 Apr 2025 10:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9827AF8E231
	for <alsa-devel@alsa-project.org>; Fri, 25 Apr 2025 10:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9827AF8E231
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=OGqktdEi
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so2076154f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Apr 2025 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568451; x=1746173251;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hwsfA2vx1w0Hd+MxkBOwMy08bPVFTSGUVL5IKHTSRSw=;
        b=OGqktdEi4wFprLp20/BK+YKgsgdwofdqNvSGCiQtsYN3pWnvJDbzG8y2uKaWim5/II
         lelmx1p9LKjBkGNzHYgDxIVKQJVdSqjZCVJMPr8o6KH42vXI1JsG7MwVA93W4t9Z59/H
         yZeQbhBl8CMR3shzrx4S8E/8z7hVL5zcaniFjHCKdT7pevGbDK1FksYWzUaGJek8QJVh
         f/8T/MX2Z8GpO740Dg+/lixLPiqoCcBt79q+EAkSZVxoJawIUy8LlEgbnFrF0DOsjbYv
         JTkYhxBieVU+GinB1tPHjjRKrwFMokv8d5rbiQZbclPkFlnCwH/o4RXbtp/roMXvlEIJ
         FDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568451; x=1746173251;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwsfA2vx1w0Hd+MxkBOwMy08bPVFTSGUVL5IKHTSRSw=;
        b=INkPA68F85PD8UuuQ0wOJsXIEg0kwWC36eBuGWiUlK0AREopU7DO7Bi7Z+4SRXpWOa
         Wrj2O82Ni+1WunyiuD+IfohjtUHQt9MHEJatRguynzsm8x/BJYvzwtHKuQUum+j5p648
         IoZUJ9rixqNGYvv7FpigCOrFPAHLushZLUkTgozgc/tQxjxayhpHExsqx3WJBkzZJ0c9
         m2/18Zaf8qNKH0+qNOll58skFs+gABRYvi3YehCGp3CZyis2QJ3cR19UKhi4GZZbUzX3
         onaC2nBTCYsKEvbDgW8YpAKKWYVPLGTmRnR+U0Y1pfgLr/HB6kJSBFskJMbsWDJj6XmC
         0tIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7C/UpSCbaGUzH+hvFpfvTRhS1V82KrejOdHHdKMvlVEZxvDuP2H8YjSlSOUW3WRl+tX8d+VEmHNpR@alsa-project.org
X-Gm-Message-State: AOJu0YyaNng2j9slhcgJlHRdAeBC5GL68oFtXp38Wd3KV/xMCxnJMlXn
	BhlNhpiIZMaabW6929kVW5O/Y43zhaWNa9NhnYFqOLdtjN9wrPJySQ9YOXYXQ0s=
X-Gm-Gg: ASbGncs6YPCtPMguyP7Vy6iD3EHPVJfiNr82UlEG5nIUW7nIelwsC0XnIVJBR6DGuLS
	mEyC/I59aYqV0EnE4GLbRS63R3y7Br5g3kLdm5IzUSsNBRT0JukVRA0o7FT+EktCrqhwAbb5JFb
	A0T/dVfooEu7t+ni94zIhkv8cPWuXsFStcUTiPDqqiTujCokKcgYe+ovrQSA4BjSeMsPJ8Ol5vg
	0KhRzA9PZM8V346BtsgaZzqbC/QnoqeCLyZ57YwJX5d4R3giKrIJimhCYdyFI47f0slOvNrSkZr
	ol4EN1Q+2g4lM3TM8SHInb/YG0x7V539SmyUKRw3b3E1ZLMg8QMp8krDlK0w+E32kNRqnRKJriP
	6BniEitEDIxGKw2QjrF5z3UmffJO0BiFto2ppjVTQ5EvIuZOmX3d6PfaKZH+0sa+dh48=
X-Google-Smtp-Source: 
 AGHT+IED++efpf5n1mpdrpKSqo0nctSBfmgC5H7SE7rg0sC07MwBn9G01Iz8pW4KpUWARaD7Nc47rg==
X-Received: by 2002:a05:6000:4203:b0:39c:2669:d7f4 with SMTP id
 ffacd0b85a97d-3a074f39913mr987084f8f.43.1745568451325;
        Fri, 25 Apr 2025 01:07:31 -0700 (PDT)
Received: from [100.64.0.4]
 (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at.
 [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/5] Add DisplayPort sound support for Fairphone 5
 smartphone
Date: Fri, 25 Apr 2025 10:07:24 +0200
Message-Id: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxCC2gC/3XMsQ7CIBSF4VcxzF5zodBSJ9/DOJQClkEgoETT9
 N2lTVyaOP4nOd9MsknOZHI+zCSZ4rILvkZzPJBxGvzdgNO1CUPGUWIPNgrQEXJ4eQ2q6VppG6S
 90qReYjLWvTfueqs9ufwM6bPpha7rH6hQQNCdGtjIuG1Vf7GDS3EK3pzG8CArVtgPEMip3AGsA
 ih0KyxKrlDsgWVZvmKzgnbtAAAA
X-Change-ID: 20240809-fp5-dp-sound-b3768f3019bd
To: Srinivas Kandagatla <srini@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2L6RAKTGXLDW5GNBGDTXBM42GXNWY3CX
X-Message-ID-Hash: 2L6RAKTGXLDW5GNBGDTXBM42GXNWY3CX
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2L6RAKTGXLDW5GNBGDTXBM42GXNWY3CX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the necessary sound card bits and some dts additions to enable sound
over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.

The UCM files can be found here:
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm

This series - in spirit - depends on the series enabling DisplayPort in
the first place, but can land pretty independently, especially the ASoC
bits:
https://lore.kernel.org/linux-arm-msm/20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Simplify return qcom_snd_wcd_jack_setup in machine driver
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com

Changes in v2:
- Revamp series based on comments on v1, doesn't have much too much in
  common anymore
- Use sm8250 instead of sc8280xp sndcard file, so port other required
  changes from sc8280xp.c to sm8250.c
- This also changes the sound card compatible to from
  qcom,qcm6490-sndcard to fairphone,fp5-sndcard
- Link to v1: https://lore.kernel.org/r/20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com

---
Luca Weiss (5):
      ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5 sound card
      ASoC: qcom: sm8250: set card driver name from match data
      ASoC: qcom: sm8250: add DisplayPort Jack support
      ASoC: qcom: sm8250: Add Fairphone 5 soundcard compatible
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 31 ++++++++++++++++++++++
 sound/soc/qcom/sm8250.c                            | 27 ++++++++++---------
 3 files changed, 47 insertions(+), 12 deletions(-)
---
base-commit: 7f1dd4e6634d085f3c9652d4e0f1903659fb96f9
change-id: 20240809-fp5-dp-sound-b3768f3019bd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

