Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B16CEEEB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37562206;
	Wed, 29 Mar 2023 18:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37562206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106396;
	bh=rZoTVVPMdeOuR8lkpKJ0XhqM3bpkMLWeyCjoJL1wbLI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Auo7RxPj3vjnm5qSaNfMwvxL8U2yu/0fLNmrvNbiHejiuaHGSZC64IWzpyqkBu7M8
	 h6gltK+EXqtZ+o3H1v2cQGIchfIQwJmcJQuS88leNffAUu5aNJqakmzdEsxqdz0Ovg
	 PiaWSAEEzGtHc3+uBu74sV2kz8s8iIIToXIkRC5w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA5C9F80423;
	Wed, 29 Mar 2023 18:11:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8225F802E8; Sat, 25 Mar 2023 21:15:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 975A5F800C9
	for <alsa-devel@alsa-project.org>; Sat, 25 Mar 2023 21:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 975A5F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=atrmOeiY
Received: by mail-pj1-x1036.google.com with SMTP id a16so4330842pjs.4
        for <alsa-devel@alsa-project.org>;
 Sat, 25 Mar 2023 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679775336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GynnLGwZMbxNI26jMYN/r8iX51c7YhYkKStLbWeQRLo=;
        b=atrmOeiYQpvjjBfOuA9YWxmwGx9ptCjyJUp0uRUIQBmPc9fiGz2R8mUxpxNt7s2F+J
         aWGtEIzjIeyovO2rJqMF5WGrI7jDmuLlYQA15EurbkjC8admVfTq7ZB6iiKOvOboRlCz
         Drxl3GxYDlaI+6w6TOqWcZ7Vg8rsIM8+34IHqUx41VZv16GrldK/GRAFi2e7uOt0O3NT
         yDAYQkibwBXSllAcK8RsSyIqc47z6xxq6dyX4wHCbqS6yUQTXKdG1gYL34inGdvBSGQF
         hOUpfUKUo2pSivKftWRsINGLk77myY4mnNQYE4r4eXzDCSZC8+qChUsqXCKixxlL4K1l
         Vmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679775336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GynnLGwZMbxNI26jMYN/r8iX51c7YhYkKStLbWeQRLo=;
        b=TPXOt/HdQPm6L0ylspmNKWbzQvmYSrmyaqj7I+iiR1VLKh8ytMN/852WgVpYQ8X6RR
         bwsu3n5YbL9Bo4d2iJyml6AH6FalzsADb0KJkKSXuq0aYg1NTbbjCqiG2j0MlESIs4q8
         8uaO0dxmkmXuESEBAJNRMMppdNWe8rYqqDuFU6EvHis2gRyClQGlQsXdS5kUScEzpO3O
         oIRYVB9zizZFVepPPMX5pZmtGQriyiLDBAmVIAYKFy2fLApWRErHsxBUJEXt1SPPcNbn
         t9nn3eiheyEg1ed1TqDI993/YX1jbbFS/KvzEIfZye7z0KYsU51MC29MV6jSwL3HqZZ9
         0aCQ==
X-Gm-Message-State: AAQBX9e0MA6azMTYGFsN7AylT71rmH3Vwl5Sw6Z3AjiNZP765KjQ8cyD
	bESRP7eJz6RXXR136mubKkI=
X-Google-Smtp-Source: 
 AKy350ZwCXg2+eAH5gibMUxQymcbwVRsrBiQvmO21J9lujKijFkVdRa7PdcDqLOHLQGCaj0A8J4LiQ==
X-Received: by 2002:a17:902:d503:b0:1a1:b8ff:5552 with SMTP id
 b3-20020a170902d50300b001a1b8ff5552mr9488134plg.6.1679775336507;
        Sat, 25 Mar 2023 13:15:36 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:dbe7:6935:261d:5dd6])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a170902b19800b0019e5fc21663sm16103643plr.218.2023.03.25.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 13:15:36 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: danascape@gmail.com
Subject: Re: [PATCH] ASoC: dt-bindings: ak4458: Convert to dtschema
Date: Sun, 26 Mar 2023 01:45:31 +0530
Message-Id: <20230325201531.13037-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325201007.13006-1-danascape@gmail.com>
References: <20230325201007.13006-1-danascape@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HHITP4UNR57SMC635SUORTWWU6GJFEHQ
X-Message-ID-Hash: HHITP4UNR57SMC635SUORTWWU6GJFEHQ
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:11:32 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, shengjiu.wang@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> +  dsd-path:
> +    description: Select DSD input pins for ak4497
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - const: 0
> +        description: select #16, #17, #19 pins
> +      - const: 1
> +        description: select #3, #4, #5 pins

I hope if you can review this part correctly.

Thank you,

Saalim
