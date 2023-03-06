Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 657D56ABE7B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 12:40:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1831C10E4;
	Mon,  6 Mar 2023 12:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1831C10E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678102824;
	bh=vvOX44h0zKlQ5TfvQBfPZppWmLj4AS4el9fu9wB41F8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rWXzggHYxVOKnfew0uhESyzH9gMSBHYVdZ6/uva2hmqKkB+js/09jKh4RI3GwjCi2
	 y3m2qgySvWY11Ff+wIO4PmEJGRQRLZpHTcae9Iz+hkQVKcNAGq+f3uJgX3021Rkpc8
	 Ry8VeTMC6Zm4Wu90wI8PYTrFrkvuAnRdhwHZEwPk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68098F80236;
	Mon,  6 Mar 2023 12:39:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1AC6F8042F; Mon,  6 Mar 2023 12:39:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31C52F8007E
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 12:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31C52F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uHGGjWaL
Received: by mail-ed1-x52f.google.com with SMTP id a25so37441922edb.0
        for <alsa-devel@alsa-project.org>;
 Mon, 06 Mar 2023 03:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678102761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOwpkhY0VMzGqwYvvdIIY+PDDP+eSachjPL5/6vvxwc=;
        b=uHGGjWaLwwtd1qnco3tAffq4+y4t/BBWgWyqTg8tohKtzY+MKYR41mDbatfLhGkPWJ
         X2Z/pRrbMHS95UNiZegynAI1GEndlXPgaMaoQI9CPO7Ftln7OReiHnVjuVt8OG3XTNOx
         X8N+dGEHyMc9/ESqPkkUyUhkF7Xx50SAjCZJmu9sAUnsLVr/N2KvXjXXhlF7T/g9VZir
         fUR9a4YLJldfvwQfz6zIvd+kyOpHoWJq6hC5pKMtpeJErjlP/FWNH/w/bQFjg66S+dRg
         27DWdFsHJ/7cF0JDJq8/7KP/1XRyyxTYxfeMztO7dZx8R3RIPPu+qXStvgKgtpieKodf
         jwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678102761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOwpkhY0VMzGqwYvvdIIY+PDDP+eSachjPL5/6vvxwc=;
        b=JOeMhGhNXoMaoulQp1OxUL8/YGndZmrwM9I+R/UrVtig6zvcCKtG8HuPlU98zz806Z
         RU6xvXyy8XXvaRWznlTATWm88O0EyrWI47oBrOxWHrY0mX32EKLeTLijXXYjpvX6Kwap
         7HTjvksoc4nfx2GixEfOO3ivTcen8w5qlzG/DG4sYw/mqI65OTp36v7k1VWBmtV6U7q/
         iQbR2tkPVCR7ytkoIPUDR1H48PB3cWZWOdgr8oG4HmrWRB5TkK2gbtqfx8AtDosr4hVG
         mF6ZWchAK7ooczzoFOH5Ba06vKxHnlRXkyVW4Qougb4+a4TYApbWL4Fj5OBs8NHKjwsY
         HBAQ==
X-Gm-Message-State: AO0yUKX8LFb2SqltwTO64TL0aWa0FMS4shpo64/wFqni4KHgzUpUIQie
	ThXavn7byo2vhAusnay+yyfsRA==
X-Google-Smtp-Source: 
 AK7set+2d8kZqPdKpXeq5pwga95WBNECs47qUaTLd/DZCBqEalqOpBwXh1rtQBno91qttDxdOmfW9A==
X-Received: by 2002:a17:906:dac9:b0:8d9:8f8f:d542 with SMTP id
 xi9-20020a170906dac900b008d98f8fd542mr11381523ejb.32.1678102761141;
        Mon, 06 Mar 2023 03:39:21 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id
 ch10-20020a170906c2ca00b008cf8c6f5c43sm4411936ejb.83.2023.03.06.03.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:39:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Randy Li <ayaka@soulik.info>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	- <patches@opensource.cirrus.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-samsung-soc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	alsa-devel@alsa-project.org
Subject: Re: (subset) [PATCH 3/3] ARM: dts: exynos: fix WM8960 clock name in
 Itop Elite
Date: Mon,  6 Mar 2023 12:39:09 +0100
Message-Id: <167810274095.82312.7597082551301229104.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217150627.779764-3-krzysztof.kozlowski@linaro.org>
References: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
 <20230217150627.779764-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6XLPA3LIZ5DKKBICMJY2JXGK7VYFPBAQ
X-Message-ID-Hash: 6XLPA3LIZ5DKKBICMJY2JXGK7VYFPBAQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XLPA3LIZ5DKKBICMJY2JXGK7VYFPBAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Feb 2023 16:06:27 +0100, Krzysztof Kozlowski wrote:
> The WM8960 Linux driver expects the clock to be named "mclk".  Otherwise
> the clock will be ignored and not prepared/enabled by the driver.
> 
> 

Applied, thanks!

[3/3] ARM: dts: exynos: fix WM8960 clock name in Itop Elite
      https://git.kernel.org/krzk/linux/c/6c950c20da38debf1ed531e0b972bd8b53d1c11f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
