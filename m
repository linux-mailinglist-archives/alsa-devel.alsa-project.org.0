Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAFFAB7F2D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C10161BF1;
	Thu, 15 May 2025 09:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C10161BF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747294531;
	bh=4r9tJ+EcKTSeTDqTruse8d4E3SvZHkJ5ztPCJLWlUSc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fLrHUuSUmEKH6QJEHqV30zJr6CYpmzEyecY9tHgsCR5b/kGg+ReA9hLqmGwJY+Ltv
	 14VL3Q8UrE6g86pHawoux+QhZn8al3tgpkhBLfnfox9hug5rpXABmIVVlclfE13ImH
	 jSDH1GKg+Jrmw3sdHk2XWL+Q9KFedImm1omJS7Ec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B86F89891; Sun, 11 May 2025 16:33:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B69B8F8987A;
	Sun, 11 May 2025 16:33:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93793F8A026; Wed,  7 May 2025 10:02:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB2F0F89E2A
	for <alsa-devel@alsa-project.org>; Wed,  7 May 2025 10:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB2F0F89E2A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=1sBQMU31
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so129415766b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 07 May 2025 01:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604925; x=1747209725;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=1sBQMU31w1Ga/3j/rg07wuT4e+8IR+C5xxU6qyX0fDQF3qkqbbiwowh91uwRnZqTAB
         HAkRjSW3iXgTKWiIIqGKkW+B5dTzLomAk9jSCeWVt+SPThdCFGkj2wQ1nEaxKrys+sqS
         cx1Sm/Lism0AcwSnOaUkv0AdNIAf1s4bx/gIz6hzmmjlkEVt2xG9DMWQQeYJphar88CF
         teY8sIH569A8e0fFwkbVQ18B59dGMRktQlq1tINz+nsPBqj47K9FFXi8IO+OrRLaQKyB
         eEUkXb9PP3f5fPaDY3sNiN7KgE5CuNgoQIynBrM969hVIonEfiYW48gf6oD84QdZ1HpH
         gb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604925; x=1747209725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=YP22Wf+/uR6eFzHCMUWvPVDn18u6NwtqtZVeIM2o0mVb+pc2uOYFUODFZABkXOp+Rk
         WyhHl+VmOg0lbbBv6zKT+8Hc44vuRJTmF7NI2FTIb+yCEfg58OnjAtwOysVVgP85hRNo
         UourZW620nJtFIX22gx5F590Ews+LFgdSCOJ4jMvkEN+HMfyLoho9/bHk++itYbi2Gmz
         4TcYBrJoW3leYmpTqCxrAnEaFfTptFiSnwVrYoJdRN2VNkO0f1wFnbDKWPFKMGqfzmaW
         nSlDH9tEA5MFqxEYen3x5OIvHYK423+kbYHcjOf8FzVRng7SuuQAGIyvQGMXDYm6+853
         P+Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHJRRXSi6g6kBkOalmDcOez4tyeL6+DiPCt/YwQY+5/RK5xhRSL/fMlSuvTOYyLPoycq1SScvHieR1@alsa-project.org
X-Gm-Message-State: AOJu0YxSlq5j5VMmVuifSk1pagpSQrOB5m1u0u8fd3vsLIrWedvPJI4J
	men1Y3IM0IOpADGlkgGXXQMaWo4P4Xfh+xcBTVa0ezF6/yy8AQ+DxFyue9mTjDs=
X-Gm-Gg: ASbGnct0g7Km0SXPS2K78myVx8KPnSu8IExPnbHKc/pu/1j9tb+roXLw7OinVFQT6FN
	EXhcLBqM4D5m8I1nY+DT7pkaNukfvvBLEd1K18fHG57Fm6iSm5yhrnGWkV0ECbe+awJAtmtqTfV
	cDgLPOBi55Rab4m/UHs8FHc3dIiQFC3XA9TFo4fT5/lerN75bch6tBH2Ogy6J0rJa5CuVrFvCsz
	YxuIF+GUyBrgo8/GT69t+cTj96aFdgruznKylPw+ZCywbMDr7I+n8fGeZMgK9qiZq4qIec7+SIF
	1LusTlqdPCgswObgIWbfvkMIbKyFx87pSaa2orwxxUBJCIifm9HbLfBLfPlLHVTuw9OTqBpoEq4
	5xEMDhxZUv3KiAw==
X-Google-Smtp-Source: 
 AGHT+IHM5j4LY8EC3by1L+VBxZrB2eMd8q7F5KhX7WQLdSlljTQckz7uR7Y8+kHuY5+YyPBVE5qv7A==
X-Received: by 2002:a17:907:8dc3:b0:ad1:d0e7:a698 with SMTP id
 a640c23a62f3a-ad1eaefad5cmr195699266b.2.1746604925541;
        Wed, 07 May 2025 01:02:05 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:37 +0200
Subject: [PATCH v4 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-1-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3SQJQZYJUAXIY72O7XBO5K67QPAUJY57
X-Message-ID-Hash: 3SQJQZYJUAXIY72O7XBO5K67QPAUJY57
X-Mailman-Approved-At: Sun, 11 May 2025 14:33:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SQJQZYJUAXIY72O7XBO5K67QPAUJY57/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document the bindings for the sound card on Fairphone 5 which uses the
older non-audioreach audio architecture.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c61adfd4b687227038d275f849480a..57f62a228c262f38e703816efdcf443355052619 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.49.0

