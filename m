Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B40347D2236
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Oct 2023 11:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02D0384A;
	Sun, 22 Oct 2023 11:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02D0384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697966831;
	bh=NQQQgzz6og9mMTFgzJlbMK2C3lBdNE/tpZtnuq/Tqvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ONMjvywRn0+VxEktR68Z/ig48sFcKF2vkHJitTAtRyCG1cihcZrAVHf7g8IJTvlVk
	 8jmoY79u2sEkUmcW8hRnQEUKn2Nwk128VabgedQLtWDvHCCbLZ2pefB5aRiPDaOJ11
	 gxuRezMZhnepRMVZWDFx8Gu/HVA0wFI6326Qm9Vc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A183F80552; Sun, 22 Oct 2023 11:26:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED1CAF8032D;
	Sun, 22 Oct 2023 11:25:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0783F804F3; Sun, 22 Oct 2023 11:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2ED7F80134
	for <alsa-devel@alsa-project.org>; Sun, 22 Oct 2023 11:21:45 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1D03A1A5C;
	Sun, 22 Oct 2023 11:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1D03A1A5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1697966504; bh=kDvZqnWj3eg12SaNbsAgK/Ky150jsg2QYxz8l5xU/+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z4/N+aJBvPDXSpWUg1RaF7YRTlr1imZFZp5dBT70uG2kP7QVJQvnxXRx4OukQGCgU
	 fepKl7vrGs+OYjGbj3QLZ5xM6Qsvb6PyOOCThhJasg8RoGdxmbyp9T8lvrAnl4M+cQ
	 GAeOgdNqOj5r0Hd5PrSlTJNpGzif8nZmsBaw9X+0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Sun, 22 Oct 2023 11:21:38 +0200 (CEST)
Message-ID: <3dbee1fa-87c2-d6ee-64d3-f2c97928797d@perex.cz>
Date: Sun, 22 Oct 2023 11:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: soc-core.c: Log components string to help with UCM
 profile development
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
References: <20231021211710.115239-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20231021211710.115239-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WO2CLYEKTEUYBC7PGGFAK6YYDFPVBD27
X-Message-ID-Hash: WO2CLYEKTEUYBC7PGGFAK6YYDFPVBD27
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WO2CLYEKTEUYBC7PGGFAK6YYDFPVBD27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21. 10. 23 23:17, Hans de Goede wrote:
> Various ASoC board/card drivers use a components string to communicate
> to userspace which output (speakers / headphones) and input (internal mic /
> headset mic) routes have been setup by the card driver so that the UCM
> profiles can dynamically adjust to this.
> 
> ATM it is sort of hard to figure out what the component string has
> actually been set to by the kernel. Log the components string set on
> the snd_soc_card to help with UCM profile development.

I don't think that it's hard to invoke command like 'amixer -c 0 info' to view 
the components string.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

