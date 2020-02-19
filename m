Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24032164F09
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 20:39:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB94816AD;
	Wed, 19 Feb 2020 20:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB94816AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582141168;
	bh=d0uvZGBq0urLFgPlMVJkZ+12wabocbfsya8skJX3wPo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=evjtL5677Q6cTun6Zfkp4JqGj+emm9934NCOA4v+Q6mmwnH69sjcUKLTKdUZD04Cz
	 6abJWK9xe50UbOiYlh/GSz9FqXRxkptMGmUEkz6uBgGLJ2WTZUUUaP4Vn76EGw/GpY
	 bIX3J8fT5gGZk8EqnuYJfB33b00A/ueeYw9eUmlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7763F80276;
	Wed, 19 Feb 2020 20:37:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D1C0F80273; Wed, 19 Feb 2020 20:37:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92FE4F80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 20:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92FE4F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KFGut0nt"
Received: by mail-lj1-x244.google.com with SMTP id e18so1580762ljn.12
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 11:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mzWZicQ2at9CpDZ83VmBTNUZQfIsC35v3C9eIFua7XI=;
 b=KFGut0ntTndLGQqzVLszp7IXot4CQXsHkzMHHFkvp90c8UR3SnJnaAHtjD0Rue2KJc
 1J7xkyi5oZmdr18H6QhImwkH66a9gCLiJW3ovAwsQrhfOikH4rKMZ2uw+xQCOmmDAEkB
 35UXqRSuuS0dAMGt2Wv2NaBcXkVukbu/QMEKJla9xjpnSyRwjS4/c3rbp0/KysTPtRbI
 AmmnHqXHZc2NfjHxAGoetavDIttNQZtQ0iAgjfeNxcCjbhOBKUCo8ugobo9rMkO9o/WA
 FOXfAndVPwuzyn/0nMe6jzEBhv+QucXn2ZkvSXqM8bOEVDspcKVa22HtANBydqVn5+yN
 +0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mzWZicQ2at9CpDZ83VmBTNUZQfIsC35v3C9eIFua7XI=;
 b=qzLczi6+V9LuJlGwiGH8wjTEQTw19HyBybxMVbrXyHDkHLznatHzicDo56SAoPP7s0
 3mbIKQX+v8DtU8q2g38qyb/KXQs7iQYfldJhasoDVVUJZaBFZ4AT/wlBXawa5qzlFl9j
 ftJkP4Z9p0zwmQ/++gxJcliJZFTzelpDldNnUxfyvuMYrptSl1/CpwFXSALmKO3877Bt
 01Bw5DMpsJge3VlRiE8+ErMctswgqR2Np7bGUBBu1VQnj0Gc373TGq9pPh8qqM7q/2bK
 akYkcLMkDySlhI62SjWUo9RPhB8iA57nI/KYflETnESaNSwRhhlIcIKQI+uQBmEDE6IX
 4M8Q==
X-Gm-Message-State: APjAAAUzYts4BwxIA4+0rdousgbwXYZVMB04AtbQ5eeZ7YG2JIQGMt6J
 NqP6YMkfzLzIGHzWoYR7RI0=
X-Google-Smtp-Source: APXvYqzQ8PKwhTI+g3u7v/eT+ES1E56alKNLw3KsYp9bX8pItjRpRSvzC2bITwOPJqUyWjZIZVsS9Q==
X-Received: by 2002:a2e:9157:: with SMTP id q23mr16694881ljg.196.1582141061483; 
 Wed, 19 Feb 2020 11:37:41 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id d22sm313850lfi.49.2020.02.19.11.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 11:37:40 -0800 (PST)
Subject: Re: [PATCH] ASoC: soc-pcm: Revert "call
 snd_soc_component_open/close() once"
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
References: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5d7260a6-a9fe-4e2e-4f0e-54a0dbeae44d@gmail.com>
Date: Wed, 19 Feb 2020 22:37:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

19.02.2020 21:26, Kai Vehmanen пишет:
> ASoC component open/close and snd_soc_component_module_get/put are
> called independently for each component-substream pair, so the logic
> in the reverted patch was not sufficient and led to PCM playback and
> module unload errors.
> 
> Fixes: dd03907bf129 ("ASoC: soc-pcm: call snd_soc_component_open/close() once")
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---

Thanks,

Tested-by: Dmitry Osipenko <digetx@gmail.com>
