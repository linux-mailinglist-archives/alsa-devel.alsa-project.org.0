Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D97806CD
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 10:00:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10DF5844;
	Fri, 18 Aug 2023 09:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10DF5844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692345610;
	bh=vC7VMPqjM9fPKdF4J2HXCVxJMz5gaJgVjCjBydNLrys=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Pfkv3ZfVvsnDLIozk8VE+kjj+IhDSB0/q6pH/d221Kl7/9H+lj0Up6npvsj3PcPDm
	 eFwFAqlof0iwDrOrbR6y12YbDtFoTYIvXdnTdiAaGKI/Wa4RC9oNqH0OZOyent6yd4
	 /9F1AUU/5vBV95Xw/a+W77IukEA1DHYr4+uD1tL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67FE4F800D1; Fri, 18 Aug 2023 09:58:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9691F8016D;
	Fri, 18 Aug 2023 09:58:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C93B0F801EB; Fri, 18 Aug 2023 09:58:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADAE4F800EE
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 09:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADAE4F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=PCXSKo6g
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-d6b1025fc7aso613670276.3
        for <alsa-devel@alsa-project.org>;
 Fri, 18 Aug 2023 00:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692345522; x=1692950322;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=igcyBE54FCe4GlK5viSpawwrjs2JcpTaXwROqWjpeCE=;
        b=PCXSKo6gfJjz3PyvYyfmUuKxQV6dGTG0d5umZJoVxgv/3pC1hBNrTcEEDWbhJh9HWv
         Quc91/RP5huv3BAKCwY8PRTwLcTt1SGuXtLF3+cjw1lG8w063AUZfr+BKb13iGaVh49A
         LhNKOjWFc/RvgBpMy3n1dxfB4T546pBVtCSHBW/s0Y2AYmcifYH5CNR+RJnO6OBrx6Ou
         Aa/e6+RJYa46OqBeUW3E5FpfBB6W/lmT0wlEey6bZEV+FZ1j23ujrw88KJ5OcgZXKtyP
         oArROJw62IQxw3NXjiQYXD6RLUEhK5TuhCExF2q8CVV42jytPfm96KNved8aEepkCbgX
         n25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692345522; x=1692950322;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=igcyBE54FCe4GlK5viSpawwrjs2JcpTaXwROqWjpeCE=;
        b=cKlBuXSJbVv7Dp6OvfKdUv07BHIENR8/9FB/+yHd/D8vLMLp7/Wd9Bw6zDxYdZl1VR
         1SEXp7Jfvo6b4wVjbyAUuUVztRVeZfMIpUwHJV9xvUzVhqK79s3BVH24HwNJT1NrKzBV
         GrTfUmmxHUCmh71ZIhx7x5eRI6PHkqbtVaPGsenS2tq2In8w64MkMnZckbWXJHRvK/Em
         XtjAG55s84jX4pEPKsjj+y0ZakiEsAUFxqDfXgB8IBEOFyVWMa21zU9m8D9HxmwPEPdH
         +Ej4qNILpRBuIUWstDZn/RHvnwDNwjUOJ6guo446ZvVsX9AnHe7P4F1Jqe++/TGBde2h
         fwVw==
X-Gm-Message-State: AOJu0YxbWgCTOS5lwch7OORflljsmHsig1V+od9iHBtckG8ErEI/9WiM
	s18obUvXFIFMzsoCfxBoNPmbZ1nfcrF9jTUww1o=
X-Google-Smtp-Source: 
 AGHT+IF7SZTlg1W3WmhN9LjoK0SeT1n6Zc3/k66R8oKVvRyfCT2JOKAFCyx0jRDo5HPrGYUJd0VaEhmno4mj001Hf5c=
X-Received: by 2002:a25:ddc3:0:b0:d39:5e6a:9e6c with SMTP id
 u186-20020a25ddc3000000b00d395e6a9e6cmr1870133ybg.24.1692345522473; Fri, 18
 Aug 2023 00:58:42 -0700 (PDT)
MIME-Version: 1.0
From: Zhu Ning <zhuning0077@gmail.com>
Date: Fri, 18 Aug 2023 15:58:31 +0800
Message-ID: 
 <CANPLYpDc8DTN2vkmCDhTpBQnEkOCyPTA5T1LLWO4s3Zdgb06gw@mail.gmail.com>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables sound
 for systems with a ES8336 codec
To: posteuca@mutex.one
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
	yangxiaohua <yangxiaohua@everest-semi.com>, Ning Zhu <zhuning0077@gmail.com>,
	Zhu Ning <zhuning@everest-semi.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 5WII7PYTE2QDPWKWI7OVVS3OCPC7DRFQ
X-Message-ID-Hash: 5WII7PYTE2QDPWKWI7OVVS3OCPC7DRFQ
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WII7PYTE2QDPWKWI7OVVS3OCPC7DRFQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > This is saying that the machine driver should disable jack detection
> > over suspend and restart it during resume.  The machine driver should
> > suspend before the rest of the card which should mean that the CODEC
> > gets powered off then.  The core can't tell if jack detection is
> > supposed to work over suspend, it is a standard wake event on systems
> > like phones, but it sounds like on this system the power gets removed
> > from the device so that can't work.
> >
>
> Sorry, I don't understand what you are trying to say here. My intention
> is to find a way to have sound working when suspending/resuming
> with jack inserted by not fudging the jack in the machine driver but
> fixing it in the CODEC.
>
> > I don't understand why that would be expected to help?  The main effect
> > of keeping the bias on all the time would be to consume more power.
>
> I don't fully understand the whole bias thing (I did try hard to
> understand it from the code), but in this specific instance it helps for
> suspending the CODEC. If idle_bias_on is true then idle_bias_off will be
> false, that would mean that during suspend (with jack inserted)
> in snd_soc_suspend() in switch (snd_soc_dapm_get_bias_level(dapm))
> the flow goes in case SND_SOC_BIAS_STANDBY and since dapm->idle_bias_off
> is false it doesn't break from the case but falls through to
> SND_SOC_BIAS_OFF case which in turn calls the CODEC component's suspend
> callback.
>
> The reason the sound stops working with jack inserted is that the CODEC
> suspend callback never gets called. It only gets called when the jack
> is not inserted.

Hi Postevca, I just reproduced the bug on my side. You are right that
when jack inserted,
the codec driver will never enter  SND_SOC_BIAS_OFF or suspend or resume. This
makes sense because the codec needs micbias power to detect button. Problem is
that  ALSA or dapm thought the codec power is on during suspend, but
the system power
is turned off and the registers are reset. The system power is
controlled by EC and neither
dapm or codec driver can do anything about it. The system power is
just turned off.

Disabling the jack detection before suspend is ok because the system
stops working during
suspend anyway. Maybe a detailed comment is needed to explain why?
