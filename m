Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C57D7E1C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 10:11:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C82183A;
	Thu, 26 Oct 2023 10:10:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C82183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698307886;
	bh=DWJ10AzaodAsOAoFkT5X0T0vegH/64SPa8LlWVBZ8IU=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nZ0JpAU6jG41w7foHIR87iFth/+uB2ZIEXvDRflUeam2Ctm5pT2NoADdB6zFiI6DW
	 zaw92pjGPfNbFPlYme+T0z7EIiiWG3rDemq1infeHZjqw0CC7tVYAlT5UuqVLq6hH8
	 G9SiDfwz61vl4YFiBJ9fCdjvavv1a6pP4nkD5qbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 209CFF8019B; Thu, 26 Oct 2023 10:10:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE16F8014B;
	Thu, 26 Oct 2023 10:10:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7525DF80165; Thu, 26 Oct 2023 10:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50F67F8014B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 10:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50F67F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bihhPttf
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c9fa869a63so4553965ad.0
        for <alsa-devel@alsa-project.org>;
 Thu, 26 Oct 2023 01:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698307821; x=1698912621;
 darn=alsa-project.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS0JDvw2Y7iSHdnpDlvBW8JTP6jh8SxazuhN3wAyMC4=;
        b=bihhPttfPSjoNRmM6lIhoh/jelrlwUESzeamuvCqS/acUJbJ08QAIereoVVTsfKvSb
         wm6xyl8dl+hPOy1fbTeHUI7Shf10yumALy7nV77GUzx+lzucatBzOiFzR1HzuTWYiDSB
         5bv09u0j5gByzKyFoG6AytfxC6P5TYziqFw5C0rA59LAvUEX4dipSzUjBGfWoG88L77A
         2U6GF9WO0aG+wmxu9ZvbuiIDXVdRGg0F05Xv6D8/jtSJF/PsFQ9ZvvN0rNns7N4YEACH
         ECuPUqCorf4O6ptrI8I4gjhgXI1mzDReXFBPAEaVsJ0tkM3XfkZcgm0Uxsleqe39mJr1
         xykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698307821; x=1698912621;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tS0JDvw2Y7iSHdnpDlvBW8JTP6jh8SxazuhN3wAyMC4=;
        b=BGoBwgnk8dogQSQ1wKWmm7CDvJc38OfJ/2znsrmhl+GOpaTQs7Tb0UR5BATOOcvw0p
         Xt2FdnhpfYSOFQqaC1WkM8xkDXa4SKgT1ltgr/9rc9t6i2+tTvgzHG+DT1v4p/rkHNsC
         G+2bZ8xAftApUMgkANH1jpyUgQ4en0E1VzvWhAnp+rY1UbF/3OWULMkAUnfymuSD4nXU
         hvx07sR6JTNleomFtXWNlun7Vb5Y3t+15TGh2LKdJ048i2BTn+cVfwUHpCZLjY7fz586
         Da18YEV0x/72uVCukzRsd2up4MZY6Aa1wZlwM3oD0LsQ9oINNaYmKBrtFrwYJDeq4O9y
         J4yQ==
X-Gm-Message-State: AOJu0Yx5sO3CxdL+K7IpYnQQXEkSxalX3LanfAje53AI0Oz6sPgY8FIg
	vImlDkwJY8cFsFYDBXZm6Wo=
X-Google-Smtp-Source: 
 AGHT+IFkQdCmx6azCnuYBVfNXe7b1jeF68gbYN099m/fl0+tvRJFjSHIvuyMrHv3CuxWGzlEL+mXeQ==
X-Received: by 2002:a17:902:f542:b0:1ca:8e43:765a with SMTP id
 h2-20020a170902f54200b001ca8e43765amr18310249plf.9.1698307820770;
        Thu, 26 Oct 2023 01:10:20 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id
 q9-20020a170902dac900b001b9c960ffeasm10385498plx.47.2023.10.26.01.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 01:10:20 -0700 (PDT)
Message-ID: <d6e886d4-9084-4d56-a544-36d9ba526dcd@gmail.com>
Date: Thu, 26 Oct 2023 15:10:17 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ALSA Development <alsa-devel@alsa-project.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, aguertin <aguertin+kbz@aguertin.net>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: No sound from monitor speakers unless snd_hda_codec_realtek is
 inserted before snd_hda_intel
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QZKMJYPLXE47KKV5OHV4WQBK6DRFIVNJ
X-Message-ID-Hash: QZKMJYPLXE47KKV5OHV4WQBK6DRFIVNJ
X-MailFrom: bagasdotme@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZKMJYPLXE47KKV5OHV4WQBK6DRFIVNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I notice a bug report on Bugzilla [1]. Quoting from it:

> I have an Asus Pro B550M-C/CSM motherboard, which uses a Realtek ALC887-VD, and a monitor (with speakers) plugged in via DisplayPort. On booting normally, I get no sound from the monitor speakers (other sound outputs like USB or bluetooth headphones work fine).
> 
> I have found two workarounds for getting the monitor sound working:
> 1. rmmod snd_hda_intel && modprobe snd_hda_intel
> 2. ensure that snd_hda_codec_realtek is inserted before snd_hda_intel (e.g. by adding `softdep snd_hda_intel pre: snd_hda_codec_realtek` in modprobe.d)
> 
> Notably, timing does not seem to be an issue: even if snd_hda_intel is blacklisted from loading at boot, it will not work when it is loaded unless is is unloaded and loaded again or snd_hda_codec_realtek is loaded first.
> 
> This is not a recent regression - it has been happening as long as I have had the hardware (since at least late 2021).
> 
> Since it's not clear which is more useful, I am attaching two runs of alsa-info.sh - one is from a normal boot with sound not working, and the other is after running rmmod snd_hda_intel && modprobe snd_hda_intel with sound working.

See Bugzilla for the full thread and alsa-input output on both working
and buggy cases.

AFAIK, it looks like module dependency issue.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218027

-- 
An old man doll... just what I always wanted! - Clara
