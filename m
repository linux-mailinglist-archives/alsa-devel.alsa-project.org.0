Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D6B92BEE9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:56:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE06C218E;
	Tue,  9 Jul 2024 17:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE06C218E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540596;
	bh=68++p0TLm5vTWyW+78bNCCU7gxHIxep9gk/S1rYIeHc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Cui9S/61shCyOFrYAPsEl/nXVNivRfQzbn3p03hn7f49mP6zlsLfu43/Y10qqA3AR
	 /mkeb+/PoGRdviRZt0VstzNPc+Po31SqenwU5YSkky2jvUAuGd79xUhahozcT7Y/eP
	 MtUc0Hg/MZs9Zy/Azbj6exeuZv5tr+2z/F6xMJK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F8FCF80611; Tue,  9 Jul 2024 17:55:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90EDAF805FF;
	Tue,  9 Jul 2024 17:55:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9AEDF80494; Tue,  9 Jul 2024 17:29:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ACDFF800FE
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 17:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ACDFF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oAUZCxS/
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso8109625e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Jul 2024 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720538924; x=1721143724;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1uvKJVDAkNfWouoiWb+1kR3F4IBUjlyoO5Q61R4r4Tw=;
        b=oAUZCxS/OttPNlCToAh0Eyw6POm1HNUP+CZMEzMQ1TFEer3yyuV1YkZvmeOIn/o/e4
         NvMRug8lcQuun7bQnsXawWll5HkWwdXME2uWAKgZPz6pMrJlTxf6xzeb7nvGh3GCtRTc
         QWtBjRVZx6BS899cZxheIveBBb3+DrSDuRpwHFFhOG1zWIUX1u3YjMSFCBNvzWhMNsLH
         IeaIq8tjx4ginq7MYimxhHVHyvwbhlg9LCtq1DJANzhvUFksgXR9O0AsyBRDUe7c7UCD
         MFKKpBfkx7wiqIl+AAYGNWDy8TkNu5kx6e+Pwji14zkQXAHpNxroD3EdoEYgP1ajxYvn
         MxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538924; x=1721143724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uvKJVDAkNfWouoiWb+1kR3F4IBUjlyoO5Q61R4r4Tw=;
        b=IcWPS2H1zEVv5nmNFfDDdMrcMZrleM8MbcyJB8xQp4ZtO3ZhLXlZEV2uHYb64+SQpe
         3mZwdCaIpJGvIrTPbEp/SGBzQkmGOGxbt+aucEfNKNg2EAFlyPufJSPMCA10j/tF2QAI
         WmUawHMONSagB9bMaB8VdQHQ6srNPLfmDXaZ3+/uqQqz1JMVoVyEszwZaSjvIv6cF9r7
         FvNhZbXsp/KMDAGln7LDzzMtF7D4/b2gSQCms7/A+E6pcL56Ompo6jhN2c4dIepZURQg
         rlJuMgO5scJ8CaMOTPOn1D0goZQUoHhA2FJpaZ2lo5hjlHqPiNlHXzMi+6UvUm4LmKli
         PiJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURUNqRc3VnaRjZdEt6M51GlgKZPQp+xUEIsdJZ+U9NPTqIK1xTcfDEnHKg2BTbkMpnuSp3VaLVF0KzJMEB7hy3LoeK+IcU6TXDgsg=
X-Gm-Message-State: AOJu0YzDsgCt9pKfE0OA3okUI6SMpoe5B5e/XgHLhHQNyI7WwplIQ7HM
	S3VP19pGYkW4SjwU7Nnks0lv1WY5+GVz7VB+CyR5bibIDD/Uj9EGrNccQrAOB2o=
X-Google-Smtp-Source: 
 AGHT+IECZyuBODbUWxODlQIq2TNUEQPYhnYHr3v7tlYB31S3xcLkk0SWvj9qahKiYTMEWYdHqCwhUA==
X-Received: by 2002:a05:600c:2e04:b0:426:59ad:bbb3 with SMTP id
 5b1f17b1804b1-426708f1f54mr17918255e9.32.1720538923729;
        Tue, 09 Jul 2024 08:28:43 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f5a32sm45883775e9.24.2024.07.09.08.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:28:43 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] ASoC: dt-bindings: convert qcom sound bindings to yaml
Date: Tue,  9 Jul 2024 16:24:41 +0100
Message-ID: <20240709152808.155405-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: rayyan.ansari@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5QFZWMHHXRH5KHXPHEGIHW54LTR3OSMK
X-Message-ID-Hash: 5QFZWMHHXRH5KHXPHEGIHW54LTR3OSMK
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:55:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5QFZWMHHXRH5KHXPHEGIHW54LTR3OSMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,
These patches convert the remaining plain text bindings for Qualcomm
sound drivers to dt schema, so device trees can be validated against
them.

Thanks,
Rayyan

Rayyan Ansari (2):
  ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec: convert to dtschema
  ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema

 .../bindings/sound/qcom,apq8096.txt           | 128 ------------------
 .../sound/qcom,msm8916-wcd-digital-codec.yaml |  53 ++++++++
 .../sound/qcom,msm8916-wcd-digital.txt        |  20 ---
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 4 files changed, 54 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8096.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt

-- 
2.45.2

