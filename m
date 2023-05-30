Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B1716500
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 16:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 848D9208;
	Tue, 30 May 2023 16:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 848D9208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685458198;
	bh=GcAuHZEcow9hik/LJK+VDfxCnFXDFSi+9NN8y44Dsfo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z9Q/upczA74/btSjePw7lOIqVl52QAgCHRVS+1wgGjL309/6Bp+oz2DOtELQNhYN6
	 sFve24Z6xxhrBh1XBqCep2auC7VpdeLj0Yot6FARm2iZnz0EuG2xCZZe+QA8QUkJzk
	 BtpekqDFNFVJVKKwoRyC7Vaok3i4/rtF8gJFy2CQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66B9EF8042F; Tue, 30 May 2023 16:49:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05F49F8042F;
	Tue, 30 May 2023 16:49:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27415F804FC; Tue, 30 May 2023 16:49:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0289F8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 16:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0289F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=q6DaxHgq
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51458187be1so8039204a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 30 May 2023 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458136; x=1688050136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iV7Orb1i2HT8c6ntLQeDsScnfo8QsjoWIKrRpD+mlDM=;
        b=q6DaxHgqELE2tu8Q1AxgIsCDpH+TNAJJHJp6Q7g8/Fkd/88Tk4TUy/ri0mT4Ktg5Mo
         8loUDrV8rgOV4A6XNocbQ8st6LPKLPsCoM9M7NfuJiiPgFmWodAuWDMcEhGTqfI+4Tzf
         71FhpeXfe33npOU4xXk8C/+4upzoWtXD+5OuR9V4CwEY+McHM/HpsrVpr/f2HM5wwk11
         q6ItDg0BTxwcfJWB6uZBQGx+4pwaP2uzwuVXxHf91dLVKqsCTNfh3dg7BgyEkITCyOjh
         IHl3EJehb7WHjyFD+D9eQjjetOZhYahUl2+MIzDnN4ovGk7najQrxWq/MU940DgRFDiZ
         Y5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458136; x=1688050136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iV7Orb1i2HT8c6ntLQeDsScnfo8QsjoWIKrRpD+mlDM=;
        b=aKL7RaVGJ/SeRpw+O+j+odrM3YH4moCb0OqPUbaATipmBljh6DQxvxWbv6B1YnAagc
         alcyqzQpmGXDT1T4tMbVBCWXRw41QGQ3cs9iPQ6YPbJy7Rqj4DKNaKsDHXWgbf4s8qCG
         AOLf2WpbQ5u0FFy2nSx7kw7kbylaz/QWI0O/51SbVl/anGSuerg28DuMkjA3RULW1h9O
         93XbcZbKa5+XeWskJnwJhu+fwdtLUytm61xaV9u7ZrituiiSuddavVMlg1xclBCnWr++
         KvApTiBKNmpMtznQ8B68ajDLpa2FDNMA5jQLGe0RzadyaR51ZuK3Tg77b384Hyhxkjb0
         N/TA==
X-Gm-Message-State: AC+VfDz/wdnravsEa5PDBv+BBNEXnviPygm8cQQ+hFjigIMxgS1xpMTT
	0n5PoHup73mgF6WvpkUGOYjN6A==
X-Google-Smtp-Source: 
 ACHHUZ57600gdJ8fZghoBNthDb/ZJ2da044/ygwaZp54+5w2nAm+4l+5lOMfpN+gAlzBZIyE3wXFJQ==
X-Received: by 2002:aa7:d9c4:0:b0:50d:fcfb:861b with SMTP id
 v4-20020aa7d9c4000000b0050dfcfb861bmr1926404eds.0.1685458136376;
        Tue, 30 May 2023 07:48:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id
 q21-20020aa7cc15000000b00514b2717ec6sm631283edt.28.2023.05.30.07.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:48:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Dipen Patel <dipenp@nvidia.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dilip Kota <eswara.kota@linux.intel.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	timestamp@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tony Lindgren <tony@atomide.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH 0/7] dt-bindings: restrict node name suffixes
Date: Tue, 30 May 2023 16:48:44 +0200
Message-Id: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YMXIFMVGA5XQWWRAJDCKFIHQS4YE7PON
X-Message-ID-Hash: YMXIFMVGA5XQWWRAJDCKFIHQS4YE7PON
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMXIFMVGA5XQWWRAJDCKFIHQS4YE7PON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Tree-wide cleanup of DTS node name suffixes "-N", e.g. "pwm-5", so we allow
only decimal numbers.  In few cases narrow the pattern to also disallow
multiple suffixes, e.g. "pwm-5-5".

No dependencies, can be applied by individual subsystems.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>

Link: https://lore.kernel.org/all/20221127182232.GA128974-robh@kernel.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  dt-bindings: phy: intel,combo-phy: restrict node name suffixes
  dt-bindings: pwm: restrict node name suffixes
  dt-bindings: rtc: restrict node name suffixes
  dt-bindings: slimbus: restrict node name suffixes
  spi: dt-bindings: restrict node name suffixes
  dt-bindings: timestamp: restrict node name suffixes
  dt-bindings: watchdog: restrict node name suffixes

 Documentation/devicetree/bindings/phy/intel,combo-phy.yaml    | 2 +-
 Documentation/devicetree/bindings/pwm/pwm.yaml                | 2 +-
 Documentation/devicetree/bindings/rtc/rtc.yaml                | 2 +-
 Documentation/devicetree/bindings/slimbus/slimbus.yaml        | 2 +-
 Documentation/devicetree/bindings/spi/spi-controller.yaml     | 2 +-
 .../bindings/timestamp/hardware-timestamps-common.yaml        | 2 +-
 Documentation/devicetree/bindings/watchdog/watchdog.yaml      | 4 ++--
 7 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1

