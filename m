Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDC8914DC7
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDB351E7;
	Mon, 24 Jun 2024 14:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDB351E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719233714;
	bh=DOxpGDRPXOULudQMfRyURG+LRWh3ynkAOi8ERNjON/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zgzw3tXpjs2FM91LXgyCeRUB+Gt60k3g3+vMnOtgv6AkkLvggSueF22QMx7xg7kmI
	 9FSzmKafEv8Rvc+1HU7eujDBeF81oqHZ+XV3P4AopK6ab3vUL3g1CB34ZnhDSi5Zi1
	 ViD7gU/9hoIsobB7fdS6NYoTeDE0VD10lb/p9tQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35F58F805A9; Mon, 24 Jun 2024 14:54:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB25F805B1;
	Mon, 24 Jun 2024 14:54:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DB3CF80495; Mon, 24 Jun 2024 14:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88D9EF800E4
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88D9EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e/pkAeOO
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-df4d5d0b8d0so3782260276.2
        for <alsa-devel@alsa-project.org>;
 Mon, 24 Jun 2024 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719233672; x=1719838472;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T4MhoPIjswsMp7f7a8/ndhL9pANhZJFzHy+iV0sTzTk=;
        b=e/pkAeOOgvz4dzenOi9U/qouARMGuNu1Hp3yKB+i5EsYWj9yXnmh5rzXR+dDBL7wcP
         6trYygfDBIkxORYAKAARDLJgEdCZiWtdJnNT777wzYXUyz7H9C6YnyI9RaLxSLm6N2ZQ
         G+hQxaFnL4f6gXnIwmoe43G9Ast34+ot6A7tzMNBIEtlFjt7KjS4MbemaIbpezfl4n7i
         r46PzvcHvBXcPSIlRusx4o3O+WJfr2Mp0vlRKKpRLP0NsAF5YMlBTkFAqgCu/LxH91ff
         VGjjf3i1J/o/tMbOI3QI4Ku5W3bfEQxykIh3k4rySJow6FRLfy9mggBMPcNpcNDH/bBi
         xSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719233672; x=1719838472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4MhoPIjswsMp7f7a8/ndhL9pANhZJFzHy+iV0sTzTk=;
        b=TLCe+rHqx+JzUxR01T/2y66MxzAx5aJdeZUfYucP54hBOvLIc6P8NUNATmy4f9NpN0
         icWQYP1LJy/BGwUGQ/LJjQQYM/w2YXq02Vl60npLFl5eHZFaTPqJxHGE6t1fGBT8KO0a
         Tr131Jpy6jlNCq6UrnaargPhZs8eKD47xgQ6divvno01+Yxtxt1LkARQ0GP+c7TveRXx
         4mWw1PHWnwhvkpOxqRFOYHP2hQ4qByJQZTz0TVLaHJjyB/L4KWMcn6GYfZZuZ+zRxoRk
         p42DQ4nHYLYWzNj5VGE0aR/3ujjYjk0yZZRlVNnrzunmiP4YPTHCHbeX+G2m8ZLlG03B
         fLAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjPuF3ZG4fVNHWVK4NAxT8AIm/P17t3KxRadlLD79IeMVoJ+dD0vO+p9tGURfh5mWe4TNIuiMut2/AjowaF2siUHIPPAxaYRgc8h4=
X-Gm-Message-State: AOJu0YyPorHTDjJYeECudTEiCBG72px+xvE4gYYh6UbEovO5ZbJSmrdC
	mEck8Fn3Y9lERpQYxrpYrI14YrK2ztM5RSCL0ef35pRh3NVeDU0VD7d2DAo6tE+o+ZFVRlalHpt
	ZlT1Nqf6TfbPQVACLOF7TNLBBEgUcm4rfSbcCmw==
X-Google-Smtp-Source: 
 AGHT+IEEe2Wox3jWC9RV0LVT1QsuSsNWmLHgdKtfDBvlgM6eb1pktgBqHVRKocFL/tWEa8Hwpz7Px1YRrvmHbynoaFc=
X-Received: by 2002:a5b:bce:0:b0:df4:476e:7577 with SMTP id
 3f1490d57ef6-e03040182b2mr3570101276.60.1719233672328; Mon, 24 Jun 2024
 05:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
 <20240619-lpass-wsa-vi-v2-2-7aff3f97a490@linaro.org>
 <hz5eqta4ttzsnwttqzqrec4vcwvyleoow7thoiym3g3wjsfqk4@tx23nktde3gh>
 <fe75671f-c292-44b7-9024-15e0825c55c2@linaro.org>
In-Reply-To: <fe75671f-c292-44b7-9024-15e0825c55c2@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 15:54:20 +0300
Message-ID: 
 <CAA8EJpoLE5zUEvC4-q8h5KH=c_ucew=py5TV2qCTaSEQNQeQzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of
 enabling vi channels
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Manikantan R <quic_manrav@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: WFXHA7WNOFW32BVAVKBFCPSJCYG5TVBU
X-Message-ID-Hash: WFXHA7WNOFW32BVAVKBFCPSJCYG5TVBU
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFXHA7WNOFW32BVAVKBFCPSJCYG5TVBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Jun 2024 at 15:35, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 20/06/2024 21:28, Dmitry Baryshkov wrote:
> > On Wed, Jun 19, 2024 at 02:42:01PM GMT, Srinivas Kandagatla wrote:
> >> Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
> >> paths eventhough we enable both of them. Fix this bug by adding proper
> >> checks and rearranging some of the common code to able to allow setting
> >> both TX0 and TX1 paths
> >
> > Same question. What is the observed issue? Corrupted audio? Cracking?
> > Under/overruns?
>
> two Issues with existing code which are addressed by these two patches.
>
> -> only one channels gets enabled on VI feedback path instead of 2
> channels. resulting in 1 channel recording instead of 2.
> -> rate is not set correctly for the VI record path.

Thanks. This should be a part of the commit message.

>
>
> --srini
>
>
> >
> >>
> >> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> >> Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
> >> Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   sound/soc/codecs/lpass-wsa-macro.c | 112 ++++++++++++++++++++++---------------
> >>   1 file changed, 68 insertions(+), 44 deletions(-)
> >>
> >



-- 
With best wishes
Dmitry
