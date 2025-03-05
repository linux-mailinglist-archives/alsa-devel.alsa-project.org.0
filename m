Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A27A4FA6C
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:42:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CBD260306;
	Wed,  5 Mar 2025 10:42:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CBD260306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167752;
	bh=G7lNHb5FcPzHpYwz16TxGaZ/8cEKwfkgGB9lffwD2f4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IRfyloHhxDcyXRSmMRcB0yOIBXLQQF2ttZMoifrh3UQzYYd9vNh0Is7ARjJcQQln8
	 M09KHDGGuScwAu0a9qqIfe6AowAS6bYK4sJHTTmwR/Y19QkINeUJfk+Tr0eDpWzBzd
	 WgQgjH6055RDS4r+5k5u8NdUEb3nRoYMUES0A0jU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E26D3F8963C; Wed,  5 Mar 2025 10:38:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A397EF8962C;
	Wed,  5 Mar 2025 10:38:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48212F802BE; Wed,  5 Mar 2025 03:56:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-80.sina.com.cn (smtp134-80.sina.com.cn
 [180.149.134.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0AB5F8011B
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 03:56:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0AB5F8011B
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.29) with ESMTP
	id 67C7BD4A00000ABB; Wed, 5 Mar 2025 10:56:11 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 90DE6B9322F841CEB486904D9CE450CE
X-SMAIL-UIID: 90DE6B9322F841CEB486904D9CE450CE-20250305-105611
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
Date: Wed,  5 Mar 2025 10:56:10 +0800
Message-Id: <20250305025610.58476-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RYOILGUHUDH3T4P4VOIHHEJXWMIQRL6R
X-Message-ID-Hash: RYOILGUHUDH3T4P4VOIHHEJXWMIQRL6R
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:37:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYOILGUHUDH3T4P4VOIHHEJXWMIQRL6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > +	ret = device_property_read_u8(codec->dev, "everest,adc-slot", &es8389->adc_slot);
> > +	if (ret != 0) {
> > +		dev_dbg(codec->dev, "adc-slot return %d", ret);
> > +		es8389->adc_slot = 0x00;
> > +	}
> > +
> > +	ret = device_property_read_u8(codec->dev, "everest,dac-slot", &es8389->dac_slot);
> > +	if (ret != 0) {
> > +		dev_dbg(codec->dev, "dac-slot return %d", ret);
> > +		es8389->dac_slot = 0x00;
> > +	}
> 
> set_tdm_slot()
> 
> Please don't ignore review comments, people are generally making them
> for a reason and are likely to have the same concerns if issues remain
> unaddressed.  Having to repeat the same comments can get repetitive and
> make people question the value of time spent reviewing.  If you disagree
> with the review comments that's fine but you need to reply and discuss
> your concerns so that the reviewer can understand your decisions.

We will register multiple codecs inside a single dai_link and differentiate these
codecs by of_node. And the adc_slot and the dac_slot may be different, they can 
be decided by the user.If we use set_tdm_slot,the adc_slot and the dac_slot will
be same.

> > +	if (!es8389->adc_slot) {
> > +		es8389->mclk = devm_clk_get(codec->dev, "mclk");
> > +		if (IS_ERR(es8389->mclk))
> > +			return dev_err_probe(codec->dev, PTR_ERR(es8389->mclk),
> > +				"ES8389 is unable to get mclk\n");
> > +
> > +		if (!es8389->mclk)
> > +			dev_err(codec->dev, "%s, assuming static mclk\n", __func__);
> > +
> > +		ret = clk_prepare_enable(es8389->mclk);
> > +		if (ret) {
> > +			dev_err(codec->dev, "%s, unable to enable mclk\n", __func__);
> > +			return ret;
> > +		}
> > +	}
> 
> Making the use of a MCLK depend on the configuration of a TDM slot for
> the ADC seems *very* unusual, what's going on there?

Because we are associating multiple codecs under a single dai_link, we will be
executing probe and init many times during initialization.But MCLK only needs
to be used once.So we decided making the use of a MCLK depend on the configuration
of a TDM slot for the ADC 
