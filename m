Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CA1717592
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 06:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75C2C836;
	Wed, 31 May 2023 06:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75C2C836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685507297;
	bh=g9gEk9ucZABjhCJRLeSNeLHuSwXc1EUU4mIGULdD1n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RmUj6sg+i6VVtAXTynGFaatL0R86C+V8WfXe6HriVffDoHt7bxi2YeSwX0L8Nn8Np
	 TTbRqqNsbj7piqRo+7QQ/O9k2kWXFcvnABgJ++O+xvN4GTIvX3SsZ7nk7J4IBcB+/o
	 Z7124qdiAV270xpHPFFFoTcDqJ+3uu4aHW+wcb90=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC656F80563; Wed, 31 May 2023 06:26:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ACB8F8055B;
	Wed, 31 May 2023 06:26:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5235BF8042F; Wed, 31 May 2023 06:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from muru.com (muru.com [72.249.23.125])
	by alsa1.perex.cz (Postfix) with ESMTP id 7742AF800DF
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 06:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7742AF800DF
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id BEA558167;
	Wed, 31 May 2023 04:26:06 +0000 (UTC)
Date: Wed, 31 May 2023 07:26:05 +0300
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>, Dipen Patel <dipenp@nvidia.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dilip Kota <eswara.kota@linux.intel.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, timestamp@lists.linux.dev,
	linux-watchdog@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH 4/7] dt-bindings: slimbus: restrict node name suffixes
Message-ID: <20230531042605.GK14287@atomide.com>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-5-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: LP3UWKXJJM52WOJUIPDMRZNU5QM4J2ID
X-Message-ID-Hash: LP3UWKXJJM52WOJUIPDMRZNU5QM4J2ID
X-MailFrom: tony@atomide.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LP3UWKXJJM52WOJUIPDMRZNU5QM4J2ID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [230530 14:49]:
> Make the pattern matching node names a bit stricter to improve DTS
> consistency.  The pattern is restricted to:
> 1. Only one unit address or one -N suffix,
> 2. -N suffixes to decimal numbers.

Reviewed-by: Tony Lindgren <tony@atomide.com>
