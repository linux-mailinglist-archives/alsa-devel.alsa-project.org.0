Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E56885143B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:11:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 044AB852;
	Mon, 12 Feb 2024 14:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 044AB852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707743509;
	bh=yZBlbkJpD1p3nFnJsrg8uJhSz73a9OCV1t7lzOQKRPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BN75AnIS9OxzeaE73x6VyJYHfkw2fqO+9d0od2gsuX4MLVtDJ4paKgLIPN1u/C6X8
	 +NSe0qES5FpAzhgK90PXwIUWNCZY656M1JzRS4N2PNz3xLZqINa3+nOI1vP8oD8L7y
	 fnjkaA04ttwqbKTFBS6E9Aa+sANP4T6hhnnguSdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B22A8F805EA; Mon, 12 Feb 2024 14:10:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA475F805CA;
	Mon, 12 Feb 2024 14:10:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B875F8025A; Mon, 12 Feb 2024 14:10:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 471F9F800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:10:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 471F9F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FEmmpwxC
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3ce44c5ac0so695466b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707743419; x=1708348219;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jX6V4JHyCBA4UlDc/HqdUeodRBCSbvRidLCxVmFMvHY=;
        b=FEmmpwxCUIsarZfxd7yS1tsaKNSG5FETGGNYzzxDVttGv6n1FsKzrOBFtqZ4zGP6KZ
         YbiUyNI1YVmt4G884IBkZNYYQDHJ3j1G3FsIFRQjJWH5hFMpbePNKRE1V+fKoSC+OAyE
         yqZL9jVO4MXQHnZ4CaL/YW93TTqbDWQyEV4K/cn0DYxFAZW7b7a12kDlQ7LW0oFyT0Q6
         y18AiEGnkTMuYyua0bqp8Wfv/y9AYqW8LQ4BXjeKYB4LM+4f5FQkopVdvAiaHaLL1lfs
         UjAIfM88P3bhsosceks7YU961Da89DqKXdT4aZrkl+Fdb35qNHzE3CE6HmkNvOatz7Y2
         mriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743419; x=1708348219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jX6V4JHyCBA4UlDc/HqdUeodRBCSbvRidLCxVmFMvHY=;
        b=GOlskJXp2pPm89o2K675n8XA3Tmx96BLUJn1oLVMrxIadaHiRlWHtJsifHm6tuKNok
         aKh2AjwWsHYfzzkpIHdObXvOaBCjSh1xtLPpgpRkXabD7a3VbS8XGMLt9VpvNdBuuRIG
         i/Zki+7rLVFulzNhO6y8zzNQFlehs3aGv69Gj9SIoKXDisxNmakbeuEFYD6m2tVnhi0D
         /zNo1X+NxffWybI3tHi3P3sB0L3CSG/Hkt9+oapwOtrn4E0PBGGGDkKIj2olPVjhjnIH
         FfhvijQPFmqEL3Yy8goNJUsNkJVBEt3KldLxfndspSUdnNwxz4REu7TAka3wb9S4GLJx
         vtEA==
X-Gm-Message-State: AOJu0YyyZSaQCamvhHbL4c7wCW5ZlEsaK4sufHUNqpdBxih7kPsJH/1A
	/VSG0m0ljlAv+eHWCH/EuChPagc1Po3zH0fe+Bqr+c82xuthvAUqxjtiH6azoSY=
X-Google-Smtp-Source: 
 AGHT+IGO9+7w76ORAQeM9qSstVbN2XfFoA5uDKb8YPD6yBzEGTZr1tiX17Skbe4o1ZbYT/isTQJ7qw==
X-Received: by 2002:a17:906:350b:b0:a38:5cce:1bad with SMTP id
 r11-20020a170906350b00b00a385cce1badmr4896835eja.68.1707743419202;
        Mon, 12 Feb 2024 05:10:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXZMWwd9P89QXJ1/oAaEto4XrLAdsJ/Y6AhqaY1lqSha7DU1UnxPIbMwuOuMF1ATV1L39R/gtW7J/3G0By+3aDtpPWY07ek8XLgMW5cLKQBvA2CNxA6m+7d/Ypx1p/S865sEtcFW2dLmCHoJiafKpzBUnp/LMqZr3ZzvKOWOe0VTVu9FBG4/HQYTkjLGM03+8FUhtGrLx7vSzqHQxjGhiuzINBYtk075Xs+Yd/0+kAkdqie1ZsL2iHFXJeJHKwykfIKLNdPi9jc17LnaTcHrasMsnZghhziCwblcGztD9oFJ/WhTHTPOqFUsniKV8A2QYbQo+TJzoirEPmFOY8Y2t8oGP7d9WG/r3lBdjDarYTtCntRdmSYb9/UtL3Sp2dR5wZXn/K0d8Ln3c1zdmmpmH6YtdJyhUyC8CvO5+Ue2k1FKvq+4sgPbgycRBhetv9p7B/ni5LkgEb6UQPPZ8idIIwH/ACvFbaqwDakOhMqASZvM4soPSjtUFcsrpRZi2e9bACdwUrEIdFRvgYSMG+uN4kJTIm3sTYAduwTbLHM5JZPIecFxpvfLg67XhafS3qIMbybuA7mUJTwJF9YpKIrzv52pj6QR/XHOrwr+Zz9RCrF4sBd2DCpDF3TX5AKfuf5jeVdmriBiVdwdLjHhuLc3TBv2ZUub8Za/url3NkEvhQKc5YZt+0mlD9MqtlhCuIZKm4Hr25IZaxtOGdg/gXW7UzyZredyrob9L1YLn9/eAdPEZrLbS44MC4aUUVVdivE0303q+DpE9E6YrDD+XBcBrd4UvF01Z4c7SjMf77PU1Md7qJOlQd1FEQEweCJPxD+8N/j0L0quBNJueEDkx2MeWT9qIAz
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl.
 [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id
 gz9-20020a170906f2c900b00a3515b35be4sm193052ejb.104.2024.02.12.05.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:10:18 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 12 Feb 2024 14:10:09 +0100
Subject: [PATCH 1/7] dt-bindings: ASoC: cs35l45: Add interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-topic-1v-v1-1-fda0db38e29b@linaro.org>
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
In-Reply-To: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707743413; l=694;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yZBlbkJpD1p3nFnJsrg8uJhSz73a9OCV1t7lzOQKRPY=;
 b=Typ0ntFsRGIVP8WOd06O4OXyj4D/TojGIZIW2/xa8742w39ZZQnOlVwlytnL69I4HHCDQYYQy
 lMI+CQBwB8MBNUEP7PJV7F4SEkn4v6myBhYcAd5suogucdMY0QxTzUH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: TSISXXPME3MH2B3LYRMTH4MCKJPVZJLQ
X-Message-ID-Hash: TSISXXPME3MH2B3LYRMTH4MCKJPVZJLQ
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSISXXPME3MH2B3LYRMTH4MCKJPVZJLQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This chip seems to have an IRQ line, let us describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 4c9acb8d4c4c..70f6c62aedca 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -25,6 +25,9 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 1
 

-- 
2.43.1

