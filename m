Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F456DC413
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Apr 2023 09:58:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B620DF2B;
	Mon, 10 Apr 2023 09:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B620DF2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681113494;
	bh=+t7Io9b0xapKrg+J597+vOEMw4l4d8kxiptOV6vFOD8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XRbYoGsxZbEo3x8yrJw0OTZNk2fb1D9MmtZaiTnT7bVDy4xlJvKkWxF6S4e75MDVl
	 hjXd/8gHJObIVZBg4HqpDlljRZT/D+r8q/CcAoJtjEjgGoqhPjTPP2wvjrb3gC3gR4
	 KbExbsC+enFtOZtOxh1bc4E/JMNsb5XRqQ89xR7g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCE8F8052D;
	Mon, 10 Apr 2023 09:56:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DB19F8026A; Fri,  7 Apr 2023 00:10:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 235E3F8015B
	for <alsa-devel@alsa-project.org>; Fri,  7 Apr 2023 00:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 235E3F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iimJxSsT
Received: by mail-pj1-x1030.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso6898653pjc.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 15:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680819025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t7Io9b0xapKrg+J597+vOEMw4l4d8kxiptOV6vFOD8=;
        b=iimJxSsTN4DPUvczAgFy0U4h9XYwp3BTGx//p8IKWZvW/FUk8uYyw/7g25QSy4j8x7
         LRQ/xz3YPp43k8DEAs5llOLKBGNMkI441AtF5IOVairVzXSJ0GW4BD25faQGisGN/54Q
         CAWZaN7dbLW8URWjBaLRLgu2Cc0Z3LzlCMZgUfWwpNpvujjPlSsiUo1274EsP37VwPYE
         BFjacjhHEGurmkYXU2TacowWJ5u3iZfy0kc/gnBCsL/Xd3Xf2q7N2RC5b0pE2Ce/+c93
         JIQU7HQPloMwf7n6egsC0PiHjU3z7hHzpqtBaiyKSuh9uKGpfs5C5GRKSU7Kw9uKbiZG
         0qAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680819025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+t7Io9b0xapKrg+J597+vOEMw4l4d8kxiptOV6vFOD8=;
        b=LuArwwYKEflm+YFoaXxkg4z0d6FmxHVONV8gVXVvZMqTbQEeP6l0Qm0b17yU7/UFMx
         7PYtks7DCv8tEj+zVfUNK+m3DF1JWFtZ8Rr+XHUjYVn6WnsM9oNRMe5Q4gj2LzTrKq+P
         PvXLZdNu3spDJfsDgkpCGuK3EqL7FgIA3AQg6C9wcMh7KJl8I7M0r7+iCyoP6K41YMZ0
         tbsdTqBxPvWLj78ifd9Yt86xE+KeQYA3/Vra7tm2EwNZ9zxeOp9tqVpl00Dx+6j07QnK
         hlH00OqgGwtxMjPvce2Cu1PPI0blxweYVJIOogZxA0x1BaNqzNdIaOcPVL+NI1jeqSNi
         OG3g==
X-Gm-Message-State: AAQBX9f+k+QrEDe+RzsWzoSkKNYsyi0ZwM3XoPE95dpAdA6Qmdphb1s+
	pJlsIUDF0gWVKxx5/6B31Z8=
X-Google-Smtp-Source: 
 AKy350aUIQPjcpFlnTV201aedCQbecb4SHDk62k2oFALEXUdwYNP/zwYK4tYwxbFicGu+p4+zmMrHA==
X-Received: by 2002:a17:90b:4a44:b0:23f:37b6:48f4 with SMTP id
 lb4-20020a17090b4a4400b0023f37b648f4mr35172pjb.43.1680819024501;
        Thu, 06 Apr 2023 15:10:24 -0700 (PDT)
Received: from pavilion.. ([2402:e280:218d:82:a082:a1e:6444:f6a5])
        by smtp.gmail.com with ESMTPSA id
 jh19-20020a170903329300b00199193e5ea1sm1825739plb.61.2023.04.06.15.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 15:10:23 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH] ASoC: dt-bindings: wm8523: Convert to dtschema
Date: Fri,  7 Apr 2023 03:40:17 +0530
Message-Id: <20230406221017.4746-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2dc882b7-d09f-dfa0-67a1-3f9e6f1ac457@linaro.org>
References: <2dc882b7-d09f-dfa0-67a1-3f9e6f1ac457@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MKUK6KVFZCZ3ZTU77NZ44FMSHXOIVKFP
X-Message-ID-Hash: MKUK6KVFZCZ3ZTU77NZ44FMSHXOIVKFP
X-Mailman-Approved-At: Mon, 10 Apr 2023 07:53:29 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MKUK6KVFZCZ3ZTU77NZ44FMSHXOIVKFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I will check if there are other bindings under wm as well and squash them up into one.

Kind Regards,

Saalim
