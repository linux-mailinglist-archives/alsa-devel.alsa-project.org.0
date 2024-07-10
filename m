Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC78792D36C
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 15:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8169F6;
	Wed, 10 Jul 2024 15:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8169F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720619601;
	bh=xCLRTG7ipn4tiGh+nXkgwfMZfAsmNK9dFGTdCsvf/7E=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NMtUOnGlThs1FhoObk5Gld9PC+LntFeif1pT6aed/keSIqgOLAulEcae9wSw4XOZt
	 qEYvSmdho84hZ2wNiCL4FwJN1RRIrHbkKW+C27EO+I9nKdsSfwShomdaDpJHl4EQTK
	 ae+BHK9LL8Wy6i4+dk2xGOoNrmCyiUrQG/7GHeLs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CF65F805AC; Wed, 10 Jul 2024 15:52:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 979D2F805AC;
	Wed, 10 Jul 2024 15:52:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27D20F801F5; Wed, 10 Jul 2024 15:52:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA9F4F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 15:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA9F4F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lSeUDUea
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52ea79e689eso7520950e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Jul 2024 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619561; x=1721224361;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eG+Sr5tcj4iLYaVgjAszjSri4jbIahacA3U2hkyfLzQ=;
        b=lSeUDUeaDs45ypp9070/Av3OUh9skfjN3rLVsKw4IVCZpEUAOzOLMGPIeqEp++kq56
         VfFOGIBmueymMNe1UDspLnz1qzfQHEWAVYjvWXyRnuuae1BkGpB+TPTxF8B06lj66pkH
         INjQ4HL1eHTzfsGqPBZcAfBCGRaBfVjMWyM0eW185mG5LaeWKI0aYmRAV84uS256vk6/
         GaXyAKz4XNtG8Fj6yUhQQvqWDe976WQhJOSo90FNEjZ+hMIH6QXaacNbf9LarigvXelk
         +hrCqZmn7WG/q6EypGhDgynpiWg98QJdtdQ8JK89nX6WGXKsH+zDGzsZ1W48dp+3y18Q
         BXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619561; x=1721224361;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eG+Sr5tcj4iLYaVgjAszjSri4jbIahacA3U2hkyfLzQ=;
        b=FZY6Le8HD5U+w3d9UdHNpTtAzRFvv26eMjhdFxTlfv9F8HwXDR8oHqi8LNDhWSfzcR
         esy3Epx0e4FKtGNwaXUJm45OUdW5sjnc45wtGk8DSt0BFc+tB/GvsCBWoghGIHzam/vA
         aCQikTmV++vZLcB4HvJjZ3pW8D/f8uUaRajJQnGS3XkTyl0mcbSghQWQ8KC0SrHbL03P
         p4Exk7uf9GJbEZC9RvtBK6jRjyNYugRZf0spm8E71o2Ui9vIJgxgsrHxJAadGNGkBKXn
         mcsJqt+GMVQiWR7kkyIybaY2wrjatt2LsOL7lYoF9zPSurWswaRv675q0RptKlAvBdCU
         /cUg==
X-Gm-Message-State: AOJu0Yw/pcP7zae0Lt8pcvD1DswjK8MVw9vn+4oTYO7WE7LwjW4L5fVl
	cHdSm7hAASvtzp/tKicvntG1g8CSPWPV1SVEaxTQMiCHdQkOdP61n8SCFbe4DHE=
X-Google-Smtp-Source: 
 AGHT+IGI74Tkk+bMOUOiLt7ShAbiFrBfr/fOEAEBbMRa7tJDzVxniq8rJ4ZAffl1kUcxrWh4qs60mQ==
X-Received: by 2002:a19:7708:0:b0:52e:9921:6dff with SMTP id
 2adb3069b0e04-52eb999c2damr3844744e87.26.1720619560886;
        Wed, 10 Jul 2024 06:52:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] ASoC: codecs: wsa88xx: Few cleanups
Date: Wed, 10 Jul 2024 15:52:29 +0200
Message-Id: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2SjmYC/x3MPQqAMAxA4atIZgOx/nsVcSg2ahaVBrRQvLvV8
 Q3fi6DshRWGLILnS1SOPUWRZzBvdl8ZxaUGQ6aitiC0esx4q+26EPBi/wF0jqjsTVObqoZET8+
 LhH87Ts/zAvQQhONmAAAA
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xCLRTG7ipn4tiGh+nXkgwfMZfAsmNK9dFGTdCsvf/7E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIgOoSVr2Zwu1wsDHRIcZrveKRJRSIuDq8nt
 RPtif7BrGWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SIAAKCRDBN2bmhouD
 1wh/D/9lsgACXVjSoXDNyKh/50MNApgsGUF1FAG7hSEA8wgGCwfXTAlF+T6iLK/CwOAkjjYnr/X
 cmNfVrwGDq8BVLYIMRKbC2HNV2obW+l+Ujo07/fLa+g9aQUhC7ZEP4tHAm8qrlY/m3aK5hPDBuf
 z6IZTOW4byybU0zESW2OFb82RYXE1kt2ykvp+Q10qcYohOJloV/KKrC0YByHeLAv1/58adeBjeo
 gcSIsfPleSMx29G2WjbpQ7tXT5wWDIANzMl4+PkUGgZrbd27unoL+xYm+0NqyGqis0G/BXI4JqH
 +yErT3gQKDJaI4RNI8edaxLj3mkY5KYSQbSiQ75wklEz+xLdGmiQ7hdduSwxr+JagfZNuKIeaZe
 jEuRBkbyQ4lQGu4kzyMJkXOWgFTWo1gDOSBVIvc0HcWvRtWs+Xtw3jiNjg7EJVGEnxyAy36AjBq
 f2hQCZncbX3Kz85G7x/ARpGU79aXANhLFec/a/mWVqG5sqowgfvYq4Yh4Jax9Vyzfe1DODtHWLz
 Y+Z39HzUJqBiosEnlz/+5ptF4y+/rUSDig+76co81LY2E3B6BzDxg7II0oZtO8pwoVfS9ivMuzv
 C20tQU+/QOyG+ZDA2TVW688bOr4jgRDpAGFngu4vigPD0N5Of9bXOj5fnwQQWS1reYa49NMsF2u
 B8nHm7ztuwmkKjA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: N7AXQIEVSI4UYFHYUEN5UROWS6QHYMGD
X-Message-ID-Hash: N7AXQIEVSI4UYFHYUEN5UROWS6QHYMGD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7AXQIEVSI4UYFHYUEN5UROWS6QHYMGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Few cleanups around wsa88xx codecs.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: codecs: wsa881x: Drop unused version readout
      ASoC: codecs: wsa883x: Handle reading version failure
      ASoC: codecs: wsa883x: Simplify handling variant/version
      ASoC: codecs: wsa884x: Simplify handling variant

 sound/soc/codecs/wsa881x.c |  2 --
 sound/soc/codecs/wsa883x.c | 33 ++++++++++++++++++---------------
 sound/soc/codecs/wsa884x.c |  5 ++---
 3 files changed, 20 insertions(+), 20 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240710-asoc-wsa88xx-version-dd0039265245

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

