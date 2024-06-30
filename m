Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08D91D03B
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jun 2024 09:02:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 513CE22A9;
	Sun, 30 Jun 2024 09:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 513CE22A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719730941;
	bh=92Fr2FI0hzTIr3j6+QoFA8EzGb3LeRI2MHqAshn6kcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hRYNwxmX+y97Ahu07OF5uWsV4jqiHB0FBF+q2wUl2f7j2A8snay6MnMH9h6b0xz/m
	 dn+SzwVS6vGi4C870k9TYC/W9AwZwHN9SbnfhJFrXKZPU3GTmcMGBYk8NFBumFmEX4
	 DCD0RLSCRaKlJatExlAmuUlDTmtxVDOjjaTyt5gc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F9C2F804F2; Sun, 30 Jun 2024 09:01:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A4BF805B3;
	Sun, 30 Jun 2024 09:01:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19B19F8028B; Sun, 30 Jun 2024 08:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6CE2F800E4
	for <alsa-devel@alsa-project.org>; Sun, 30 Jun 2024 08:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6CE2F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BsoWE5n9
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec408c6d94so19733371fa.3
        for <alsa-devel@alsa-project.org>;
 Sat, 29 Jun 2024 23:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719730398;
 x=1720335198; darn=alsa-project.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ew4KWJgmKbpOxqo+GQy5qo/brhj1D5g+M8tiJYpqXX8=;
        b=BsoWE5n9uxVsQgYo0t3ZUn0ByQlSkLfSqkANp4u7QTVsU9ni7k1bLNJTI5fv+PoVaY
         fU5iUcOldnrtr7Spktz2eRircyiXPA9brquGG2bd8IADYKeSWgOxf13g0jjJ2JX9JG3f
         ijxxAI4mGO7C/LsehlhMmAmo9lpd94IeRszEg3suni6yVcEVy4pKMl+17yGfL/q7LeYU
         0pTdsfqBX9sLOxGLR7hVHvjsmGS9yD8q0sI9Rs9+60pluQGH7FhlO9/uKppgJAJldWnS
         15dtnxM5nqewfI9jTU52WpSqBaHFs+RSGQd2gmd8WvdnfCZGWPPvtMuUCSTIOUqcuk46
         kuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719730398; x=1720335198;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ew4KWJgmKbpOxqo+GQy5qo/brhj1D5g+M8tiJYpqXX8=;
        b=fD3Uu/hVLMosGHa+hrSrAlwMDAOyD+ZDem0I4gQcJ2tFbgLvOmSIzZa73NuwQ4I/Sq
         RPLrRQ3AM8gWKGBhEcpk7kSYbRSWjDXBvuauZN2tMavgW/JHyPHU1Cs/Zq4HFXeOudTx
         5zspFFZtJzL6Qy0v/dFTSccnzE7S2ndOb1H2aIzvpK8kTJtsBkMvG5JIcYOIuWbC0lPT
         T+qrO+Z+UhzSuuj4tr9E+J91BjYah1ICwujvsNtmTlWfSVCxKLoQYn+DQaeGPq7w+kPC
         lkfzazMpfM4vWhoeB37c5HmikkckfE8DNtlPdl4jjqVvFcBUOeA0pq9KN0onOoFHw8GF
         65oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGY7//9BuzuRydBSlhByCmY/g+ybi76cWIOlBG4w03qcOIN4+dSML2/dayyBSjwOf1ClEuQ7T8ZCnUpqkCNVZGFY+cpLLnzcb42hg=
X-Gm-Message-State: AOJu0YzSwniJ2Cs4gTaLRMtItcmtF28OesjEH9j+0AWKngZWunqCMy/3
	2Z1t57vziExc6BB6DmEjPOLskHDflLgmxvVFuvhUnTnRTj6Xr+0Xva6gi9exDRk=
X-Google-Smtp-Source: 
 AGHT+IEnzCb0ZjEgk4HVemu0D2vV5LVoJK9bnWbsrBx3BpfdiC+g0YptGg0s/NfloHGeam0Y9qPU0w==
X-Received: by 2002:a05:6512:4014:b0:52c:b479:902d with SMTP id
 2adb3069b0e04-52e82643b97mr2093475e87.4.1719730397113;
        Sat, 29 Jun 2024 23:53:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:51e2:ba1a:8ad5:52c9])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b09a073sm100168595e9.32.2024.06.29.23.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 23:53:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Takashi Iwai <tiwai@suse.com>,  Jaroslav Kysela <perex@perex.cz>,
  oe-kbuild-all@lists.linux.dev,  alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
In-Reply-To: <202406300718.iL828kaG-lkp@intel.com> (kernel test robot's
	message of "Sun, 30 Jun 2024 07:29:29 +0800")
References: <20240628122429.2018059-2-jbrunet@baylibre.com>
	<202406300718.iL828kaG-lkp@intel.com>
Date: Sun, 30 Jun 2024 08:53:15 +0200
Message-ID: <1j1q4ej50k.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: R55OCC7NIRDINKPKZ645YHB7SW7DFLS3
X-Message-ID-Hash: R55OCC7NIRDINKPKZ645YHB7SW7DFLS3
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R55OCC7NIRDINKPKZ645YHB7SW7DFLS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun 30 Jun 2024 at 07:29, kernel test robot <lkp@intel.com> wrote:

> Hi Jerome,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tiwai-sound/for-next]
> [also build test ERROR on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.10-rc5 next-20240628]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/ALSA-pcm-add-support-for-128kHz-sample-rate/20240629-201915
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
> patch link:    https://lore.kernel.org/r/20240628122429.2018059-2-jbrunet%40baylibre.com
> patch subject: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
> config: i386-buildonly-randconfig-004-20240630
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build):
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406300718.iL828kaG-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> sound/usb/caiaq/audio.c:179:2: error: #error "Change this table"
>     #error "Change this table"
>      ^~~~~
>
>
> vim +179 sound/usb/caiaq/audio.c
>
> 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26  176  
> 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26  177  /* this should probably go upstream */
> 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26  178  #if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
> 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26 @179  #error "Change this table"
> 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26  180  #endif
> 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26  181  

This file is not in mainline or
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
branch ... Don't know what to make of this error ?

-- 
Jerome
