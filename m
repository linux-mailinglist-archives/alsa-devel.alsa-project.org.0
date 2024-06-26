Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE191DF52
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 009512BAF;
	Mon,  1 Jul 2024 14:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 009512BAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837116;
	bh=QqDQKa4LD3qlLSNztsP9dsHOJQVrbClZ9+0uidt4Ojg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mpkHHMDwlN+oxIOwwYHTbnsy8vIDRexHArFcuZhUtwDpjVeF07WzZpa7ioyQR+IiC
	 4p6yyWDyxm3GaExtjo+Ydo8BRMGmLhNF6Km4tGFVtV9KkgCBD9v75p+0w1asRHftLr
	 nOtXZuxmbOaRA1/VRtxnlGZiW4lXGd4ZBkQl7/vc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99441F89938; Mon,  1 Jul 2024 14:22:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF9EBF8993E;
	Mon,  1 Jul 2024 14:22:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85959F80423; Wed, 26 Jun 2024 05:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp134-88.sina.com.cn (smtp134-88.sina.com.cn
 [180.149.134.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34014F8013D
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 05:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34014F8013D
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.227.101.59])
	by sina.net (10.185.250.30) with ESMTP
	id 667B84FA00002B56; Wed, 26 Jun 2024 11:03:24 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: FA0BC9EDF65249D79170811C639D03B2
X-SMAIL-UIID: FA0BC9EDF65249D79170811C639D03B2-20240626-110324
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 2/4] ASoC: codecs: ES8326: codec can't enter suspend issue
Date: Wed, 26 Jun 2024 11:03:23 +0800
Message-Id: <20240626030323.2439-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OYMS33CLFEWZIK4G4PSZCRFAGJDK4OAT
X-Message-ID-Hash: OYMS33CLFEWZIK4G4PSZCRFAGJDK4OAT
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:22:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYMS33CLFEWZIK4G4PSZCRFAGJDK4OAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > > Thanks for your advice. But unfortunately codec didn't enter suspend after marking
> > > the widgets with snd_soc_dapm_ignore_suspend(). We will modify the trigger conditions
> > > for enable_micbias and disable_micbias to solve this issue
> > Really? We should fix that - that's the use case for this feature.
> > What goes wrong?
> 
> We mark "MICBIAS1" and "MICBIAS2" with snd_soc_dapm_ignore_suspend() at es8326_enable_micbias(), 
> and make "MICBIAS1" "MICBIAS2" active with snd_soc_dapm_force_enable_pin_unlocked().
> But when the device enter suspend, the codec can't enter suspend. 

I'm sorry to bother you.  I have marked "MICBIAS1" and "MICBIAS2" with snd_soc_dapm_ignore_suspend() 
at es8326_enable_micbias().I'll show this part of my drive below. But the codec can't enter suspend.
And no error messages were found at the kernel log. Do you have any suggestions?

static void es8326_enable_micbias(struct snd_soc_component *component)
{
        struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);

        snd_soc_dapm_mutex_lock(dapm);
        snd_soc_dapm_ignore_suspend(dapm, "MICBIAS1");
        snd_soc_dapm_ignore_suspend(dapm, "MICBIAS2");
        snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS1");
        snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS2");
