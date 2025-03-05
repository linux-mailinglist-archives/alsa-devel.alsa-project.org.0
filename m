Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D3A4FA76
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:43:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4639A60433;
	Wed,  5 Mar 2025 10:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4639A60433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167800;
	bh=Jn41vaoxuKDMTnwNiVoq+YRmti9bdY6rpCo90h3envs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tRbo17ka46o/g0UB1atdapxmQAu47DY9Gx9eOZdNj8AZ7gmSwO5ASFt1fg33cPaHi
	 JQXJSxysxYJ8bNWwdUmLS42NMRoK/6i5hYLnNIsDbFmGksjLW0HhEAmfezthEhXX8e
	 8UkEF1cJnwgGWj6R7+b4fqWsDuRMugULW1RxteA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 352F9F896FA; Wed,  5 Mar 2025 10:38:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02041F896F9;
	Wed,  5 Mar 2025 10:38:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1317DF802BE; Wed,  5 Mar 2025 10:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-87.sina.com.cn (smtp134-87.sina.com.cn
 [180.149.134.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF80AF8011B
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 10:18:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF80AF8011B
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.30) with ESMTP
	id 67C816D500001C4D; Wed, 5 Mar 2025 17:18:15 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 240DE838EFAC402A9673847D6D4DD209
X-SMAIL-UIID: 240DE838EFAC402A9673847D6D4DD209-20250305-171815
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: RE: [PATCH v4 1/2] ASoC: codecs: add support for ES8389
Date: Wed,  5 Mar 2025 17:18:13 +0800
Message-Id: <20250305091813.49568-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2SXFHFPIRKL2WSNIN6ODI4LI4J2WIWWL
X-Message-ID-Hash: 2SXFHFPIRKL2WSNIN6ODI4LI4J2WIWWL
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:38:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SXFHFPIRKL2WSNIN6ODI4LI4J2WIWWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > @@ -0,0 +1,961 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * es8389.c  --  ES8389/ES8390 ALSA SoC Audio Codec
> > + *
> > + * Copyright (C) 2025 Everest Semiconductor Co., Ltd
> 
> Please make the entire comment block a C++ one so things look more
> consistent.

I will fix it

> > +	if (es8389->dmic == true) {
> > +		regmap_update_bits(es8389->regmap, ES8389_DMIC_EN, 0xC0, 0xC0);
> > +		regmap_update_bits(es8389->regmap, ES8389_ADC_MODE, 0x03, 0x03);
> > +	} else {
> > +		regmap_update_bits(es8389->regmap, ES8389_DMIC_EN, 0xC0, 0x00);
> > +		regmap_update_bits(es8389->regmap, ES8389_ADC_MODE, 0x03, 0x00);
> > +	}
> 
> We also had the DMIC mux, is that useful as a runtime control when we
> have firmware data telling us if there's a DMIC?  Can both a DMIC and
> analog input be present in the same system?
> 
> It does still look like a lot of these settings might be things that
> should be user controllable...

I'm going to remove es8389->dmic and everest,dmic-enabled and use only DMIC_MUX
