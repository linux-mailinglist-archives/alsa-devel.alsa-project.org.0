Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 849888A0CB9
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 11:46:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53BF3240C;
	Thu, 11 Apr 2024 11:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53BF3240C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712828800;
	bh=eSyKcInUKbmtE5Y1+3hBHxtToRvcjM10VKeKGmaF0V8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AUBlWzZSNfHxFvrmXVAvrmTv/uLofpmpmm6UmxTjW2/hGpZA/XoeQ8lXWFF+2fgOR
	 gXIr+fdSNiulI40frpbLv6BHxGhMnXJCe76mmrDSqlQpYq0ZC2/grIutRpBQnNCS9G
	 gHl1PS53VBdR7Bg9ZMnH6qyV1zx1a3q0vB/bGGKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C12B4F8013D; Thu, 11 Apr 2024 11:46:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A905F805A0;
	Thu, 11 Apr 2024 11:46:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF65DF80238; Thu, 11 Apr 2024 11:46:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9988DF80130
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 11:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9988DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HZi4q37C
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-343bccc0b2cso5427155f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Apr 2024 02:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712828754; x=1713433554;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soqiGAyue3FuM/b/TmgD29RWhuxHuHd7HM0YcZRTcDc=;
        b=HZi4q37Cs0F1S/+7YEWK8EO8g8ppeoRJFfNpvge8C5lo3+JW8h6Q00Adcyz3TjZ1G7
         oI0uvHuCdEHJk+8vaddbCby6VDWvav3b3wryA/KXPJ6cUd0hdI1YMtjQACnkxSaIPZyf
         LGVcnaeqoeHXXvH9Ucb8Rzi8Mg/xAe/aKXjT8aAOVZSPZsLcbrJ+K2+PLQSZKcd5LcqN
         IF5kV0Fv8jEoOqF5hmEPgD1ttPYg0HVbXLMua2yOPfJoHHDUot0kEP6+V7MBRsYdH9gJ
         wpJG+5dp77ikRlzMCE/PT4ra9c1rC/nPmpDt7r3Zc0plfobMxfY9Tm0QTzx9Qc+3ceXl
         6Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712828754; x=1713433554;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soqiGAyue3FuM/b/TmgD29RWhuxHuHd7HM0YcZRTcDc=;
        b=fqERf82f2aFKvjcXhxI89Dr0XtLSv/9THGk//6ID0FrTudYRKrrBLUlo3FDb78ARN4
         vSdSWhRCasWQD/UlXb8cmpAqL9TEAv/hPachA2+K4AhXs7hYPApCzuqZ3o+8OxNfzJk0
         MX/LVOFJKrdHiPvU+IJCzYBG14RLHA+ahJbwtUpIZvRaNsiGuGzajmOhVj2rRAOWfjyV
         Uc22Bc3jSurOw+6CZ1a8Ix3Rj+cQN4NNayNqKrV66FhLQyYJxUzITarWpS2oiZ/IyYBl
         rzr0N9+W7USHQT/H7Jt1jWZwCmxJq4hLtufL46Ee9mZuqi8X6j2HlJJfDFEpGPQ8IQrA
         qrCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf2iSzAxK3zND8oxFuoOria+X+nQ5whL7DbcanXugqC/78/XUUmdNl67Ws10+9rHWI6ZPg1GUwQOknoJ/MEoAS1ie2yn2bB049W+U=
X-Gm-Message-State: AOJu0YzahtrYACWu9Z0du8i2p8m+szB4qeRwaCkiEY4CRYuGzCJOR48w
	dm1Dv1RX/JfN8PGYAJzPHaBx77+AQrBOaVMGhn0u34tTVpnkeyMJC6sun9tATsk=
X-Google-Smtp-Source: 
 AGHT+IHUpiBhwrClG1Yb1ijNQVSZvTkZWBxIBXCiKjub2VkkWSuV69NprTyCfS/hJrUjAf6b5Q6RTw==
X-Received: by 2002:a5d:4c89:0:b0:343:a4eb:b85b with SMTP id
 z9-20020a5d4c89000000b00343a4ebb85bmr3781716wrs.67.1712828754607;
        Thu, 11 Apr 2024 02:45:54 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 e34-20020a5d5962000000b00341c6440c36sm1357739wri.74.2024.04.11.02.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 02:45:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: andersson@kernel.org, konrad.dybcio@linaro.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
In-Reply-To: <20240308124129.7833-1-quic_vdadhani@quicinc.com>
References: <20240308124129.7833-1-quic_vdadhani@quicinc.com>
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: Reduce auto suspend delay
Message-Id: <171282875386.157849.13077540195293855777.b4-ty@linaro.org>
Date: Thu, 11 Apr 2024 10:45:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: NMLI4TRZO6E5JCEOJZNABE7SEF4Z6IO5
X-Message-ID-Hash: NMLI4TRZO6E5JCEOJZNABE7SEF4Z6IO5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NMLI4TRZO6E5JCEOJZNABE7SEF4Z6IO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 08 Mar 2024 18:11:29 +0530, Viken Dadhaniya wrote:
> Currently we have auto suspend delay of 1s which is
> very high and it takes long time to driver for runtime
> suspend after use case is done.
> 
> Hence to optimize runtime PM ops, reduce auto suspend
> delay to 100ms.
> 
> [...]

Applied, thanks!

[1/1] slimbus: qcom-ngd-ctrl: Reduce auto suspend delay
      commit: 5e8e32f818138fff0087d7a9708806db49b650a4

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

