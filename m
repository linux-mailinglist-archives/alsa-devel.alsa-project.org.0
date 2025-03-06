Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3DDA551D8
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Mar 2025 17:52:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5148C604B6;
	Thu,  6 Mar 2025 17:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5148C604B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741279955;
	bh=wn6xJhbl/Pse1EyyU15U5P4N59HzRgpmak3FGuqgezc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Utth8H2OsozREWwL4RmzRYofbAhL5c7lYZi+QH6xiL8P5982CjHYfUp47PgqNIBW5
	 ydBncaYlubfNPTazkgId4v67RNNryrdMeRLrzZLgcBcMVvPF8usjvVLatdVGxx/lpd
	 hGwAZJM9NMxMki5K4fK3ugSvcomMtOBIjivffejQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9626F805C3; Thu,  6 Mar 2025 17:52:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA88EF805B2;
	Thu,  6 Mar 2025 17:52:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 833F3F804B0; Thu,  6 Mar 2025 08:24:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-102.sina.com.cn (smtp134-102.sina.com.cn
 [180.149.134.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18997F8011B
	for <alsa-devel@alsa-project.org>; Thu,  6 Mar 2025 08:24:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18997F8011B
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.32) with ESMTP
	id 67C94D8B0000292F; Thu, 6 Mar 2025 15:23:57 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 855E3EFC9669480CB4C67813C17AA883
X-SMAIL-UIID: 855E3EFC9669480CB4C67813C17AA883-20250306-152357
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
Date: Thu,  6 Mar 2025 15:23:54 +0800
Message-Id: <20250306072354.19987-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: M5FCEW5NHZLZQ2KWCDSIHP45MTY233E6
X-Message-ID-Hash: M5FCEW5NHZLZQ2KWCDSIHP45MTY233E6
X-Mailman-Approved-At: Thu, 06 Mar 2025 16:51:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5FCEW5NHZLZQ2KWCDSIHP45MTY233E6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > > set_tdm_slot()
> 
> > We will register multiple codecs inside a single dai_link and differentiate these
> > codecs by of_node. And the adc_slot and the dac_slot may be different, they can 
> > be decided by the user.If we use set_tdm_slot,the adc_slot and the dac_slot will
> > be same.
> 
> No, the machine driver should be configuring different TDM slots for
> each device - that's the whole point of the API.

We are using multiple codecs as a single device.So we can't use set_tdm_slot to configure
different slots for multiple codecs under one device.

> > > > +		ret = clk_prepare_enable(es8389->mclk);
> > > > +		if (ret) {
> > > > +			dev_err(codec->dev, "%s, unable to enable mclk\n", __func__);
> > > > +			return ret;
> > > > +		}
> > > > +	}
> 
> > > Making the use of a MCLK depend on the configuration of a TDM slot for
> > > the ADC seems *very* unusual, what's going on there?
> 
> > Because we are associating multiple codecs under a single dai_link, we will be
> > executing probe and init many times during initialization.But MCLK only needs
> > to be used once.So we decided making the use of a MCLK depend on the configuration
> > of a TDM slot for the ADC 
> 
> No, each device should just get and enable the MCLK itself - the clock
> API does reference counting so there's no problem with this, it's normal
> for a clok to have multiple consumers.

ok,I'll fix it
