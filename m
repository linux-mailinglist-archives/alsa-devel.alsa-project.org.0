Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D3477FF8C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 23:10:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1074F3E8;
	Thu, 17 Aug 2023 23:09:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1074F3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692306630;
	bh=NVXwTpTC1CjboR6SCktJMnp2EJB2bG5MH4brewxq8wQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vEFna1W5JsrvIkPyDIYycSu2uS5Msm4Tpc7jX/3Bxvu4s4gSwlAvd31o/seGps6C1
	 6OyqbPrErcJh2+Gxuahjo+8YQ9aUFOCPvN7GSUdErImWAPfpJG9osXjygEA4pXJXB2
	 C+zZ3mF1Py6Qei2cvqm71h5kAtiNHacXqavAy5kM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EB03F80272; Thu, 17 Aug 2023 23:09:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AAFCF8016D;
	Thu, 17 Aug 2023 23:09:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5EDEF801EB; Thu, 17 Aug 2023 23:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05A11F80027
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 23:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05A11F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=UmXyllAJ
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 704B016C0048;
	Fri, 18 Aug 2023 00:09:22 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppT7QGoPTKLu; Fri, 18 Aug 2023 00:09:21 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1692306561; bh=NVXwTpTC1CjboR6SCktJMnp2EJB2bG5MH4brewxq8wQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UmXyllAJYrJCA2Og0Z6DlTw203aSXWQtvDgzJPxuCx3UZdCpNCrv8aUhxKWv7TOO4
	 RETmq1tar2+WpOvHGLjziCOQeBHLkEyxnqkfUjHnH7LM36S/gOXZu/7N2ZvUrqOCKN
	 tFnOE3BnxOEZ2X8MrYS36h97ftKoCpNdb0WmcAa0=
To: Mark Brown <broonie@kernel.org>
Cc: =?utf-8?B?5rKI5LiA6LaF?= <zhuning0077@gmail.com>, yangxiaohua
 <yangxiaohua@everest-semi.com>,
 Zhu Ning <zhuning@everest-semi.com>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
In-Reply-To: <ZCRCqJ7oG6oefo9g@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-4-posteuca@mutex.one>
 <141a3320-ff65-459f-9d00-c8bed691dcfc@sirena.org.uk>
 <87lejpwxzf.fsf@mutex.one> <ZBr9rJn50ovG1w9W@sirena.org.uk>
 <87ttycjyw3.fsf@mutex.one> <ZBty1CdPaWm0IcRi@sirena.org.uk>
 <87r0t9uc08.fsf@mutex.one> <ZCRCqJ7oG6oefo9g@sirena.org.uk>
Date: Fri, 18 Aug 2023 00:09:19 +0300
Message-ID: <87zg2pxtog.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: DVQP3LLDREMDJDOOW7TOTZVOIQ7TYUNA
X-Message-ID-Hash: DVQP3LLDREMDJDOOW7TOTZVOIQ7TYUNA
X-MailFrom: posteuca@mutex.one
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DVQP3LLDREMDJDOOW7TOTZVOIQ7TYUNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Sorry for taking so long to look into this.
I think I understand why sound doesn't work if suspending with
headphones inserted.
When the jack is inserted, function
es8316_enable_micbias_for_mic_gnd_short_detect() is called and 3 pins
are enabled: Bias, Analog power, Mic Bias.

Since these 3 are supplies, the loop for_each_card_widgets() in
dapm_power_widgets() will always force the target_bias_level to be
SND_SOC_BIAS_STANDBY. So the codec component will never enter
SND_SOC_BIAS_OFF bias level.

When a suspend happens (with the headphones inserted) in
snd_soc_suspend(), in the for_each_rtd_components() loop, since the
bias level is SND_SOC_BIAS_STANDBY and dapm->idle_bias_off is true the
codec's suspend/resume functions are not called. Because of this the
codec stops running correctly.

Now I'm not sure what a proper fix would be. Enabling idle_bias_on in
struct snd_soc_component_driver fixes this issue. Would enabling
this option have any unwanted side effects?
