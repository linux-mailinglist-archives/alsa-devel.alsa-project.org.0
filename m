Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2017869101
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 13:55:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF2786F;
	Tue, 27 Feb 2024 13:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF2786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709038510;
	bh=hzcl8ETz418dMjd6G20Lpf/mTOdZjZj2Qy8qFzLW91I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tc+vJW27inunYtZPrlHKgX3SLsJFUEMag1v26iWn1ocdWbLs3EVg8m1JIFqSUcSse
	 LNq87VzmLqzMfLSOwV+43UajMzGrw3mCy/9CB8VNs447CWKMyEQqxgxvAyKoTg2D6M
	 gEV0D8SHE3I+jvaIt7ch/0V0vAkNmTaiES7ZmT8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 535CDF80571; Tue, 27 Feb 2024 13:54:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3783F805A1;
	Tue, 27 Feb 2024 13:54:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D41BF801C0; Tue, 27 Feb 2024 13:54:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56CABF800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 13:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56CABF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eW8WcQfn
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-563f675be29so4499182a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 04:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709038476; x=1709643276;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu6wnvLt7SL5MDp9Rtohqbab7bq75miqKe0wHBxnz5c=;
        b=eW8WcQfnSWU4Kv07NUmSQigvRovUInT8YeNSj8IvBEEXqAMSbYryfVK/gpT96d2dgy
         hHmAtXmkKA9hdkjqW6paLsKYIOj41EkcnWNkhXuqfTPxj4elW9xRZygbgXbQoERAW4Um
         TngufumHP247L5lAeTp0sy0B1s/QSIqKaow1A0A0B7OrMNnVAIfEuApAuSDSoD3Xvo+k
         8h1PnFm+WFkT5X4pIE+T8XpHFqBpULAnh8Ry4yyKT5aI7tvhXaXeDIRLzusfyDla5DPp
         OZrxAalIWGyvsgCyWv5HT2f8vwEMyd/cA0ld481TtfbT8zYq6+DpgItFW17qylXoOQKe
         XWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709038476; x=1709643276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fu6wnvLt7SL5MDp9Rtohqbab7bq75miqKe0wHBxnz5c=;
        b=Lv6HiqaoFtkN9QvzfkUEY2fNXybdzGcmV2HbnG6WhCQfDUw7uuNiSUyR8nIaJWZ+XW
         2iWWJrceu0iJZf7TnkXVk9g/HUeZKYYD64pwlj5GvNx2NfZBF0MFbmClIFQ1iuCU3e3O
         m5TYE33B/kv/i5Ulydu0dDyEwhCHsFNuaCJI+KU0x0GUNNM6q3xBQIoE5ZL+FSYFyND4
         Vdpfms+v/rQTBxG0yLmboKUtwDqVxmGETL6yAkZQpwgrK6f6WBHnQpgRvozdxkUhetkP
         VRaI5ypVK88T9wzpVNF/UoJkU/78oM+TjNjkTETlxvdgo0nvECtQfDTp/w/JghrrdBhM
         q2yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM2RMYgfXWEpKg/e+AlVe5E75MdIGckIjBoC/Wuk4+7kE5bWX/ZAPvT9ZACvIqaDMs0qlT/tXm39sNFEUyKXXuld2ys4CwzRqREYw=
X-Gm-Message-State: AOJu0YxX+9w6V+hgPD4fk+LqSBR+t78wCFsKiiRYmTBd8UAgsw5bTl2n
	jKafkSNH7IbYcvxWpwEyUJS9yeRUKhT7pQUP/AGgb3fdGeWCNso15ccRu8PT2LZtfO/lcAEqP+B
	7rdPwG33yQarifn4t+7MUj2BqnNU=
X-Google-Smtp-Source: 
 AGHT+IF4BkL4UQx6+4pVk9ZzaBlJ7bwex+QDUbRui4NuhDaik48pgZL9E2yleH+qiS3w9aoTwufqHq9Nmlhk7ZfBnLY=
X-Received: by 2002:a17:906:35cd:b0:a43:2aef:b5ea with SMTP id
 p13-20020a17090635cd00b00a432aefb5eamr4451060ejb.66.1709038475924; Tue, 27
 Feb 2024 04:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20240227123602.258190-1-javier.garcia.ta@udima.es>
In-Reply-To: <20240227123602.258190-1-javier.garcia.ta@udima.es>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 27 Feb 2024 14:54:23 +0200
Message-ID: 
 <CAEnQRZD1chD+14iFc=m1zY17rEQXGB9AQTxLZnhcPg7VVmR=PA@mail.gmail.com>
Subject: Re: [PATCH] Convert the Imagination Technologies SPDIF Input
 Controllerto DT schema.
To: =?UTF-8?Q?Javier_Garc=C3=ADa?= <javier.garcia.ta@udima.es>
Cc: daniel.baluta@nxp.com, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 7D4K6K7FCJK7AGMFI5D7K2OAZD2LXF5A
X-Message-ID-Hash: 7D4K6K7FCJK7AGMFI5D7K2OAZD2LXF5A
X-MailFrom: daniel.baluta@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7D4K6K7FCJK7AGMFI5D7K2OAZD2LXF5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Few comments:

Subject should contain a prefix e.g:

ASoC: dt-bindings: img,spdif-in: Convert Imagination ....

Also do not add a '.' at the end of the subject line.

one more comment inline:

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/pistachio-clk.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/reset/pistachio-resets.h>
> +    spdif_in: spdif-in@18100e00 {

Node name should be generic:

e.g spdif_in: spdif@18100....
