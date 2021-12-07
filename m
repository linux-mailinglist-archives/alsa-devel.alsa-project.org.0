Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C4E46BAB5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 13:07:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047EE2391;
	Tue,  7 Dec 2021 13:06:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047EE2391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638878825;
	bh=+MF9He0dUm729OnqJvmSYqV5rz9fxqxCHrPPzByKckI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXEowoJnV4gobYNBsrd+PU5gkxV73Bvh6KeGKjMNwt8fdqxBidmea58yj/1/Jx6HL
	 2yC7b7/3Au/6o2mz2qww8ppAU67q+pn8qoRPZWiE9ye1OgUBn5aPnvOcwRsu80phqg
	 ky8n+l03YDvrNPk2GSGU4IHhyVl9Ksf7Rqe86Ljw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92D56F80259;
	Tue,  7 Dec 2021 13:05:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 225A6F8028D; Tue,  7 Dec 2021 13:05:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1CA3F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 13:05:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1CA3F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IsyGD1u7"
Received: by mail-lf1-x12b.google.com with SMTP id d10so13065885lfg.6
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 04:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5KguUb/6H3/lFEhf1osMyGDeEZ7yTTjU3cEIbM5ujcg=;
 b=IsyGD1u7lrKJX2EiEtATetS94Wv2RLht0Q+4fMKQzjV4ZwywlvXHU6hGjX4Un7/vwo
 y/g37T90X0gd0o42hntPjoKihVG44480rF3scm3+BpmSYLegLdkoeXGN1ra1ortv5mWv
 lF7aDu88gO+lHbuVsDVc+skOhdZAzkHxnu5vjDP0aKiIkn7MSzLKteiZxoFqRsD83EKO
 yVRAGq5rJVQG2yqV+U/axnGP86PWWTKGbXx34+UDTjfdMU6FHJyQ++MxOJWd5XHG+EKi
 /CZmuI6NsQsAFmiYDJgiUUbb/4J2KQXkExK8v9g6+yiK68gNIU/C9UEonnNeRKh/XUAw
 HETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5KguUb/6H3/lFEhf1osMyGDeEZ7yTTjU3cEIbM5ujcg=;
 b=YbYoZjkOADhjBP48ir6KNCZaxrHjIbEo4+uAREaOp/EdJTcy8vf5O0b+bIG0me1yR1
 8JkK2+G8MlUg0AFS2i4cQgVVjhw3oDD8kOycyFeOdNoh4RM9AwuATNNBfyPi/0ZXxBxq
 5OYCr9CHEUdBljzC/5cXM8AqA3jb3e3HPo9Oi5c5CXL9Z+JADUw2QOL39I5B38IL8DxM
 3vmKdck1fRwVaBa2+CwSLMgEQJ4zA2v6W6r+jpErneJnzNHAKIRo2Fz2dYdMB7zUsE00
 L/Ng1PrB7IiFKglmmTtmnwE+yw9Mle2lD+zYGLst+FBpnlNYQN/swIe7YqLv3dKoH6hg
 4isQ==
X-Gm-Message-State: AOAM530Lk5LyZ+IHHLUFzqUxFRiA5u5ec4tNzFNlUbPJSZ8suyvs+atY
 z5ZOM0SvHMhTnkOfMAIAdYg=
X-Google-Smtp-Source: ABdhPJx4NtgiFUA11M9GWn2N+bw7b/A2Y96uMLskZdbgm8PDefZKgiFTwWLlFC/3Iw5WpMq6kwTR8w==
X-Received: by 2002:a05:6512:1192:: with SMTP id
 g18mr40937025lfr.40.1638878743940; 
 Tue, 07 Dec 2021 04:05:43 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id s15sm1663658lfp.252.2021.12.07.04.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 04:05:43 -0800 (PST)
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 perex@perex.cz
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-2-git-send-email-spujar@nvidia.com>
 <7742adae-cdbe-a9ea-2cef-f63363298d73@gmail.com>
 <8fd704d9-43ce-e34a-a3c0-b48381ef0cd8@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56bb43b6-8d72-b1de-4402-a2cb31707bd9@gmail.com>
Date: Tue, 7 Dec 2021 15:05:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8fd704d9-43ce-e34a-a3c0-b48381ef0cd8@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, Mohan Kumar <mkumard@nvidia.com>
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

07.12.2021 15:00, Sameer Pujar пишет:
> 
> 
> On 12/7/2021 3:52 PM, Dmitry Osipenko wrote:
>> 07.12.2021 09:32, Sameer Pujar пишет:
>>> HDA regression is recently reported on Tegra194 based platforms.
>>> This happens because "hda2codec_2x" reset does not really exist
>>> in Tegra194 and it causes probe failure. All the HDA based audio
>>> tests fail at the moment. This underlying issue is exposed by
>>> commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
>>> response") which now checks return code of BPMP command response.
>>>
>>> The failure can be fixed by avoiding above reset in the driver,
>>> but the explicit reset is not necessary for Tegra devices which
>>> depend on BPMP. On such devices, BPMP ensures reset application
>>> during unpowergate calls. Hence skip reset on these devices
>>> which is applicable for Tegra186 and later.
>> The power domain is shared with the display, AFAICS. The point of reset
>> is to bring h/w into predictable state. It doesn't make sense to me to
>> skip the reset.
> 
> Yes the power-domain is shared with display. As mentioned above,
> explicit reset in driver is not really necessary since BPMP is already
> doing it during unpowergate stage. So the h/w is already ensured to be
> in a good state.

If you'll reload the driver module, then h/w won't be reset.
