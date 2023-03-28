Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7F6CEF11
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:17:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D85EFE7C;
	Wed, 29 Mar 2023 18:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D85EFE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106649;
	bh=5X6LCr9TTEDssQ65BhlKOVqNIrpPmVgFkWpXU8L83XA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=koc1KYT5/lYnfsd3HTR4K4OmUpJPF5w1QXUEdQY0VeQkXf6mhNiYqtpZomOyuOvDq
	 fbjAAD1tWTxGyasDKMPmKLn41jFl0f28JTsZ+SBBU/A+tvEk4x46s7yu89aIVhYD1U
	 5h9bNpg5LD+AM3qrGMUHxXCwKu5xhfbCZMoEY8Sc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57713F8024E;
	Wed, 29 Mar 2023 18:14:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E758CF80272; Tue, 28 Mar 2023 10:34:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7883F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 10:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7883F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SIosOkaD
Received: by mail-pj1-x1030.google.com with SMTP id j13so10158040pjd.1
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 01:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679992433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eASjuq7QsT1jP8e0B7Ep9hMFmqx6RAn1FELDlXM3sM=;
        b=SIosOkaDUhjhmzZHFExwoJ5Wpc/KV5sFPxiqDz4tHq7Ugy3FaER99RpfqdXPjAUqV5
         CeJUXZdaLv+u4nLTryHSV8/oApWO30A4XVQWUqlUoW6Jec4FBG2VA8rYdv4+Woleu9P0
         GuWjqDJpNyc1GalXL6k/QU+wuIRZGZ4Adat5YgGlNb3DQPIwkauw61k0uSYhLVgJxgUa
         KXrTKPyMxUCLNBWQXSKTI0CJO4wwBBPHyIkbSmHkw1IWkpfkHG7eQbOXrTg8KIXDBNy2
         N1iIa8yRRB2trtv6Gya2Nou4crGnWXVqU9BkMDVhvJBYvKRmviC6kMPgCedYYSoWWvAR
         7/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679992433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eASjuq7QsT1jP8e0B7Ep9hMFmqx6RAn1FELDlXM3sM=;
        b=pfoHPlAlKNOq66D2klhhQ2ifeOyrqTNOZB6fzZTx1XniHS+2ThgXp9M3ZdHxRrLyWL
         tZM6C+Zb59Ivxdx8Ae4uG6ggV7DebN026yRijl0MSWe9otHpqgVksDYmKwGInlbY6kUK
         fNrAbneMZabgKZIfvqL3I/btPyM6u5P07HbpoMXgrQqwM3Zw/BNj2OE21AHLS3VjsTA+
         0F1gGuaEP4kHlJTQ8Hy/NpV5CkNKs5o04irkoEz6iO14J/r3Ri67DZrYqkCqI7+GNR6L
         +uPWNND1uAANM5lbOawe6aPcbZYwtX+Mw8r3J1jHul4tUT9wTqmzEr9dSVjchW3wUWLZ
         djUg==
X-Gm-Message-State: AAQBX9cT/c88vnG0vzCfT0FYM2o65kp9ZM1xL8tzuavEk6855HpR55gW
	e7Mu3ui29WFM+ThBSZI4qzk=
X-Google-Smtp-Source: 
 AKy350aGqfEkgasMNRB2lsZyLqmvpcd2JhSPu34Dni4d6ESTjCoYiWk/NiBwqlK/d6bq/OPfRWH3OQ==
X-Received: by 2002:a17:902:da8e:b0:19c:c9d0:5bf8 with SMTP id
 j14-20020a170902da8e00b0019cc9d05bf8mr18783116plx.35.1679992433287;
        Tue, 28 Mar 2023 01:33:53 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:db37:2c9f:dcb8:89a9])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a170902b20c00b0019abd4ddbf2sm20505307plr.179.2023.03.28.01.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 01:33:53 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v4] ASoC: dt-bindings: alc5632: Convert to dtschema
Date: Tue, 28 Mar 2023 14:03:47 +0530
Message-Id: <20230328083347.54958-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9490b5ef-3068-fcbb-0105-baf3839c21df@linaro.org>
References: <9490b5ef-3068-fcbb-0105-baf3839c21df@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: F6SKOAS3P2G3AFGDJEZ2PODX5O34LHCO
X-Message-ID-Hash: F6SKOAS3P2G3AFGDJEZ2PODX5O34LHCO
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:14:31 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, leon@leon.nu
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6SKOAS3P2G3AFGDJEZ2PODX5O34LHCO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.

Apologies but, this is the output of get_maintainers.pl, is there something that I missed?

I am currently working no 6.3-rc3 as my base kernel.

> saalim@pavilion:~/workspace/linux$ scripts/get_maintainer.pl Documentation/devicetree/bindings/sound/alc5632.txt
> Liam Girdwood <lgirdwood@gmail.com> (supporter:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...)
> Mark Brown <broonie@kernel.org> (supporter:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...)
> Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> alsa-devel@alsa-project.org (moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)

Thank you,

Saalim
