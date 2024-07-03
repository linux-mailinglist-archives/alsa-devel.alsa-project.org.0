Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A5C926739
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 19:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6FAF50;
	Wed,  3 Jul 2024 19:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6FAF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720027994;
	bh=yiZwVs34KAsMmVpnWF6wgCRNg80IMF2DlKj/9xcYU0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hlvUbLMCAMT4/KP+ZHBdmraVOXRsQxOO68ifTirAKvQY2NkzD20Y9ZcPJ+M0lISp4
	 8KBrbNS0glnyPugL0X+OBS/5tnK9lzwhdG5FpjKFAr2/IDTpc+xRYtBGAS8QjHLyiC
	 4TDt4qDzrkYDlA1vXGWzrxGXUjp4ep1ETVlaEngk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3837AF805B4; Wed,  3 Jul 2024 19:32:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 854E4F80272;
	Wed,  3 Jul 2024 19:32:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC6F6F8025E; Wed,  3 Jul 2024 19:32:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3080DF800F8
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 19:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3080DF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cCEBtHeM
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-424ad991c1cso50376785e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 10:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720027955; x=1720632755;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oskWmBG9bN19QP7asfXU5sdItpYr22CgLvmAviCVAVc=;
        b=cCEBtHeMaDL99SdULeGFZf3cwsX5ljNdJ4gG33AMheIJv9z4AEfCSEydGdLna3zHxa
         /rcnZQWol/xAcofFKoSJR62Ka+Zs3kheJz4DXZEj9uLfc/VLtR7hlSapTOa8HIRn6Vtk
         5eARagRBbnoaDAdnG+cEaT8Dy6NERzvjxAZdCdXZaIVHTFPL2gS3VdZ4NbZ0xjHvMQqt
         hjWPsDiwH4oUcxBblok+3ggX/G/2f1a6ktQCITy0MIbjHCljPhxFPnntsbokkXjEuVgz
         MEfo+mgkli+DE1h30X/EYMDd+wL5X2Qh2EdnkpvdwnHvep8Sc0ZFghydF6sAP1WBaP2i
         plSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720027955; x=1720632755;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oskWmBG9bN19QP7asfXU5sdItpYr22CgLvmAviCVAVc=;
        b=iNnb7fNrK0iymI25oiijxh018J1qyC6+cOyxt8fmIIJ0lNmF7ts/PkN/ZqTwaVveK9
         /iJjXGiIREq+lNOOcn+PJsRM1e3PFJZMWLDSJdZxCQsN8a4OfTbCoBg0VxMp4FNjtpIM
         3HBMHo8qn8ueMocPvUNjVVlf03IQT6OttgTb8YELvY8rgSa7PU6tWgEHEIgD3ZhHAYcN
         TNIy052UWYW9ENp5mxIAw3rZmtVkERBsqlgiBN918PzZmqKsVKyMVm8HikV9MWsH+3vW
         bk19UuyEC0V0XVCqDbKmTxYRQbUZTndC/uRuifLlD+x9Lwjf9y6GUL3RpMRoncMVFFbN
         xlyw==
X-Gm-Message-State: AOJu0YznLdC776DgbZg1soA/bmi+Xtucaihwy7MLyRPAASVjIPvGbwMc
	20PPjI3obMBZDfm9u/Qzlr3DXWTM6yFbqRSq40Xymivn0a1kNjjiJophBvOZOPo=
X-Google-Smtp-Source: 
 AGHT+IFyHHiiFlnwelv6JSIST8hjX2FhMJ9p/4P+xzny04uXYYyA9EwNzHKULeV4HsPzKoQ5t0WQLg==
X-Received: by 2002:a05:600c:181b:b0:424:c837:f54b with SMTP id
 5b1f17b1804b1-4257a0270f4mr102800275e9.38.1720027954898;
        Wed, 03 Jul 2024 10:32:34 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c0f99sm252728595e9.41.2024.07.03.10.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 10:32:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 rbmarliere@gmail.com, skhan@linuxfoundation.org,
 Amit Vadhavana <av2082000@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <20240616203231.43724-1-av2082000@gmail.com>
References: <20240616203231.43724-1-av2082000@gmail.com>
Subject: Re: [PATCH v2] slimbus: Fix struct and documentation alignment in
 stream.c
Message-Id: <172002795407.299941.2477625564170300581.b4-ty@linaro.org>
Date: Wed, 03 Jul 2024 18:32:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: F6DJ5TSSI3NJSNYPQ5A5MGFOXFJMKRQF
X-Message-ID-Hash: F6DJ5TSSI3NJSNYPQ5A5MGFOXFJMKRQF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6DJ5TSSI3NJSNYPQ5A5MGFOXFJMKRQF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 17 Jun 2024 02:02:31 +0530, Amit Vadhavana wrote:
> The placement of the `segdist_codes` array documentation was corrected
> to conform with kernel documentation guidelines. The `@segdist_codes`
> was placed incorrectly within the struct `segdist_code` documentation
> block, which led to a potential misinterpretation of the code structure.
> 
> The `segdist_codes` array documentation was moved outside the struct
> block, and a separate comment block was provided for it. This change
> ensures that clarity and proper alignment with kernel documentation
> standards are maintained.
> 
> [...]

Applied, thanks!

[1/1] slimbus: Fix struct and documentation alignment in stream.c
      commit: cea500f1ad5f6e93e67ab6f9a317d713524732cd

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

