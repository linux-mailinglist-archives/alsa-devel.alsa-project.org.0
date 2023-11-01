Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0285D7DDB5F
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 04:13:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F8D822;
	Wed,  1 Nov 2023 04:12:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F8D822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698808428;
	bh=pM0oorGug54lY/c2fHGqNnBquIZpI5piHbm5wrZRB1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pMCsYLvNb3nM4naih55hxPfnuOWeggBAsd6GYm1qV64kxVrQ2nRc5T7d52UZ7AowL
	 AeANsrgsFZu7Xq9AGDwsPEMf8f1hCcwPa54iMtZItmae4orxAp5zp+R6HF+0rZTVza
	 QPaxGQXGAffwWS4sllJoBB9q7cXTqCPEwlvVkyBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB2E3F80425; Wed,  1 Nov 2023 04:12:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE1BF8016D;
	Wed,  1 Nov 2023 04:12:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B98FBF8020D; Wed,  1 Nov 2023 04:12:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0751DF80166
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 04:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0751DF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KIPOUaVe
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1cc53d0030fso3656635ad.0
        for <alsa-devel@alsa-project.org>;
 Tue, 31 Oct 2023 20:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698808355; x=1699413155;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Cpu8FCcyc2A7F5+NmDvHW8HgcRWKPKesIFO/S6SbPU=;
        b=KIPOUaVeLspFPiomL+4zyt02FvHZj15Jvcapt/q/54Knvn0G++zPeJorfg3F+k9HxD
         kxtHi5ogSfJQ/qyh0xNP9cFwJbGGjl79KGFfgM2DvXGZiYHvQvoJUjlhTs89F9PyP9bz
         qGheaS3n7GGbXQpCN4E/OeYOKpdJg2MNhwFjAn7VnpKMQOtH0jnaR1NnfqIhVBQS4KVR
         pIpDIyASCafYuhDy34bCGEy/2ISZOfs0hAPIUjQOSMjC+5jwLqvETLzI0pl6ZYkg+wfj
         tSTJvamxQ6ykqVy4XoNZ/IGrpBssUjZggv62ar4SPfxPbsXOlpnaj7oaL3OKcWIf3yN0
         Ctfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698808355; x=1699413155;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Cpu8FCcyc2A7F5+NmDvHW8HgcRWKPKesIFO/S6SbPU=;
        b=YuSuqIu8d6C4FMjrGj4t9glPGoFn/Yu4WjLT4J6R4pwWDWuNhK0HByaHLyU1kO93YP
         zy2EUbcvrd72S4wB9yER+2yUu2v364nNgzw+8gF9czGQD7GGt8poRm8a5oSU5OfgZTmh
         ZgG4vhlYT+RQkInXiUsYagaQ4jwg7qYnisrXg2S6tGRztkO+WebtqJswBBLn4v2zUOYy
         PjSZfJVpRaXbzFY0JY9xjxbEsxBGE/XCXlLX7ufQaroDr7/mO+nMM5WShCRbAPxj7mYy
         8G9ykLWVJwrzRiyt6tWpWoDDYCs30hoLwhxni/KjSclPICdXaCiOwmHlYsWnIa1t3O7t
         Sczg==
X-Gm-Message-State: AOJu0YwpB5SgQlhkQzU406xAk+eJfwer0A+G3p+94JaB+UpHE2FnH5GM
	GxwUWx5h9wDCDaTu2ZhmOieX3NQj2xIaUw==
X-Google-Smtp-Source: 
 AGHT+IGbolJOALJUQOgcfIzeXGsPJVyfOu1RbcM8idZu5sBMUi3xPlnRx8BtFbTpMl6d645lcjOGjg==
X-Received: by 2002:a17:902:db11:b0:1c6:362:3553 with SMTP id
 m17-20020a170902db1100b001c603623553mr5802943plx.31.1698808354886;
        Tue, 31 Oct 2023 20:12:34 -0700 (PDT)
Received: from zy-virtual-machine.localdomain ([116.232.53.74])
        by smtp.gmail.com with ESMTPSA id
 e18-20020a17090301d200b001cc32f46757sm269022plh.107.2023.10.31.20.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 20:12:34 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH 2/3] ASoC: codecs: ES8326: Changing initialisation and
 broadcasting
Date: Wed,  1 Nov 2023 11:12:31 +0800
Message-Id: <20231101031231.90879-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <3efaf177-f9f3-48c7-b5c9-d4530d350c0f@linux.intel.com>
References: <3efaf177-f9f3-48c7-b5c9-d4530d350c0f@linux.intel.com>
Message-ID-Hash: JHJZVBZDYI6EIGPNT2DG2G6SMHT32EGN
X-Message-ID-Hash: JHJZVBZDYI6EIGPNT2DG2G6SMHT32EGN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHJZVBZDYI6EIGPNT2DG2G6SMHT32EGN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > New chip versions require new initialisation and playback processes.
> > Changing the initialisation and playback process for better results
> Are the old chip versions in production systems or were they just in
> prototypes? If end users might have the old chip versions do we need to
> have runtime detection of which chip version is in use or are the old
> chip versions going to work well with the new sequences? If there
> aren't end users or if their systems will continue to work well it's
> fine but the above makes it sound like older chips might need the older
> sequences.
> Please do try to keep your commit messages wrapped at less than 80
> columns as covered in submitting-patches.rst.

The old chip versions are in production systems.The old chip versions 
are going to work well with the new sequences.We've tested this with 
version_v0 and version_v3 chips under the new sequence and they both pass.
