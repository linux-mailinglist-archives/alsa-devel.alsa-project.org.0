Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 405D2952A63
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D70112BCE;
	Thu, 15 Aug 2024 10:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D70112BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710366;
	bh=6QJ2T7K5t8dnL1cUxpMGwsGVpEL0ZBUMr9mtcKTcoUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C6Jimuu94ZeYPyFMdrJAx1m0cBE1xsBgVmWBrkHGo3QXWjHi8wwq78t4hHmFfKpxX
	 M4wt5IMEcZeo225+uMKh/BCcRdUi0MRkLLmpga3TAeXsieZLMfWjvPZ/X63KWwa9zC
	 SKb6U/C+mbq873WTe9CEIkET1466To86Et9fIOUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61678F806C6; Thu, 15 Aug 2024 10:23:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C132F806D1;
	Thu, 15 Aug 2024 10:23:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AECB8F8047C; Fri,  9 Aug 2024 10:34:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5C07F800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 10:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C07F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=d2Vyc0wj
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5b7b6a30454so2228316a12.2
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Aug 2024 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723192452; x=1723797252;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTOapbhsSh2iPDvdrkY7GqTcvxUdYMzOhi4gx0LwDTs=;
        b=d2Vyc0wjQm6C8IDqedr3G18saAn0lFOr82DB5tLEPYhNtUCSPz4w6+ZmFfL13Wj7qs
         O2xFnZRDUKUZ7aMtEhgpz8XW9lPFSIFftEPtR41dFeRr527YjZl70ZJ9M5JE3UdTJz2i
         i/5/RI3qsYI0sUXs4tXxwpo75IGY9NiALy/ozFDfONlIHb9XvDXLdL/p6PgShsLcjhXn
         7VcVFBZslUxrlx7MXBR3AzPqGMjuQTrfMc9dQdOj+vEOzliCwQpMjOT0UpM+FmchqjfY
         bwaMUOv40g2SgqxEKmi8B7P7mtJOrPjyZENmqHlEBXnfANorloTfvRpmhnpaST6+PWtg
         koIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192452; x=1723797252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTOapbhsSh2iPDvdrkY7GqTcvxUdYMzOhi4gx0LwDTs=;
        b=EvMHKVkVLXZ0D75ujHN5Oll1zNC7JzP3nbCL8qV9xyPOpvO4w4+AD4OS+TnoOKcyTl
         AOmX5YCQky1Mw7+/C4Eyfexn7syN3oNawckd+kDkl3UkSVb5wneTDjXbj8UBp184vgpL
         yinV3tBdepkx6iM/jun069OytxnRm5cvgpyOWOuZxMxIvq1rgSDHM+IUZnwWcUw2GqTk
         RmFaas79wyBMezx7Gn/Ez7ez2dHmJtqQKPpLuRe7FT6EE/Bs2uDbSfAPEcH7vu8iarrE
         zWqHDynp1H+SSqDcJe8CPmxxYB+muJHSka99Zi9Tcak8lc7vtdRycbzdWM8CVel9SnnE
         Oplw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE+Rk3kAA+/4ijpaHWByhedUUNzYKfByTJN9mJ7516cxk6hpsMc4V0gskGFyBjbvE032E4GiM3Ll96XJxQEFaQ9BzTBTS33XCpIe8=
X-Gm-Message-State: AOJu0YxPFhg95NvGW3bRhDmd9qjXYLvZ+yIKHTwaGCAUOhPpGQQTo95Q
	J5hndIA29XIvyIQS/WkOaPucZpmBsZ9jIMcYDrvRQHPMKFEr1YYiopOFRY7h/nc=
X-Google-Smtp-Source: 
 AGHT+IFiDy9k54HEGxK1zO78LfIscSKahK5f+32thKpNVMqGdYYVC41qcymWbEmBTFDakPWayhpGMQ==
X-Received: by 2002:a05:6402:34d6:b0:5a2:9683:2bb6 with SMTP id
 4fb4d7f45d1cf-5bd0a50df2dmr535009a12.1.1723192451945;
        Fri, 09 Aug 2024 01:34:11 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2c41916sm1336288a12.41.2024.08.09.01.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:34:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Aug 2024 10:33:57 +0200
Subject: [PATCH 1/3] ASoC: dt-bindings: qcom,sm8250: Add generic QCM6490
 sound card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-fp5-dp-sound-v1-1-d7ba2c24f6b9@fairphone.com>
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
In-Reply-To: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.1
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7Y43U6Y57KUEJLTKZ6MGT2C6XHYM4EEK
X-Message-ID-Hash: 7Y43U6Y57KUEJLTKZ6MGT2C6XHYM4EEK
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:23:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7Y43U6Y57KUEJLTKZ6MGT2C6XHYM4EEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document the bindings for the Qualcomm QCM6490 sound card.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index c9076dcd44c1..0a31be6d917f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,apq8096-sndcard
           - qcom,msm8916-qdsp6-sndcard
           - qcom,qcm6490-idp-sndcard
+          - qcom,qcm6490-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard

-- 
2.46.0

