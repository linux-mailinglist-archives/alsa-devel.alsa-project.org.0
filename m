Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5917952A82
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A572C12;
	Thu, 15 Aug 2024 10:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A572C12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710700;
	bh=P3GUG1eZhwJPZBj4ysklklKE9pHdqV5t3M7UnF/qKLQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mrYzHu18PrlGew6ab/Gv4+IbvGaE7PvcNVmf1qv2UZNu0iPwjetkdtKHD+/YrKC9b
	 VPW2CGKlmWMHsmCYk1OwLFGX4/OHrmoxx7Nju6ehxqpNaYhGqBxJD34cVWl0cvo5E5
	 NErKg0Ihi4V6Fw8Tc3o8fGqJvUTfY4A/EyY1/JpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E78D6F806A8; Thu, 15 Aug 2024 10:28:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FA34F806A7;
	Thu, 15 Aug 2024 10:28:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEFC5F800B0; Thu, 15 Aug 2024 04:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-79.sina.com.cn (smtp134-79.sina.com.cn
 [180.149.134.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86AB5F800B0
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 04:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86AB5F800B0
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.131])
	by sina.net (10.185.250.29) with ESMTP
	id 66BD63FE00001346; Thu, 15 Aug 2024 10:12:15 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: BDB669027F374A149A515693763A9D26
X-SMAIL-UIID: BDB669027F374A149A515693763A9D26-20240815-101215
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1] ASoC: codecs: ES8326: Adjust buttons
Date: Thu, 15 Aug 2024 10:12:19 +0800
Message-Id: <20240815021219.13717-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GTTZELBA7CTKSY6GC2FHNHVMT3AAUQY6
X-Message-ID-Hash: GTTZELBA7CTKSY6GC2FHNHVMT3AAUQY6
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:27:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTTZELBA7CTKSY6GC2FHNHVMT3AAUQY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > To adapt to chrome, we have adjusted the buttons to match the system.
> 
> This needs a bit more of a commit log explaining what's going on.
> 
> > +#if IS_ENABLED(CONFIG_SND_SOC_MT8188_MT6359)
> > +	const int hs_keys[] = {
> > +		SND_JACK_BTN_0, SND_JACK_BTN_2, SND_JACK_BTN_3
> > +	};
> > +#else
> > +	const int hs_keys[] = {
> > +		SND_JACK_BTN_0, SND_JACK_BTN_1, SND_JACK_BTN_2
> > +	};
> > +#endif
> 
> This will remap the buttons no matter what system we're running on so
> while it's a bit better it's still going to cause issues.  We could use
> a per board approach like this but it needs to be at runtime, based on
> the machine compatible rather than a build time selection.
> 
> The support for this device was added in e794a894427b1d ("ASoC:
> mediatek: mt8188-mt6359: add es8326 support") which was added in v6.8
> so this would also be a potential issue in mainline, given that this is
> likely only used by Chromebooks and didn't make it to a LTS yet we could
> possibly give it a go but we might have to revert.

Because this change is to adapt mt8188-mt6359.On mt8188-mt6359, SND_JACK_BTN_2 
corresponds to KEY_VOLUMEUP and SND_JACK_BTN_3 corresponds to KEY_VOLUMEDOWN.
So we modified the es8326 driver to adapt the mt8188-mt6359.
The changes we are making will not affect the application on all platforms.

