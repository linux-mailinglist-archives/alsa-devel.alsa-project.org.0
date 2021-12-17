Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE531478A80
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 12:57:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A031ACE;
	Fri, 17 Dec 2021 12:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A031ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639742226;
	bh=7wjgN/XnNNp13TkLcLeUPfjUrBdb+sTUpgsiRjNz1UI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dQGEdaEJEDU0gYRpnvlN8YXQdY35YARJmVibUaDpCfueif7oBPBhMM9dtWZ5pXZZk
	 pngEFTtBsGV7h8MqfAnl8wUgTI4FjUB7kppi7Oz1d41L5/gFYsOnns4s4h5vcsTBXX
	 inthxQ0hWnmCpu3yXV7nUmExUdqfFDxZO4W1GkPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCC7AF800F4;
	Fri, 17 Dec 2021 12:55:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C48E2F80143; Fri, 17 Dec 2021 12:55:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72FEEF80143
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 12:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72FEEF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gj4M7BgL"
Received: by mail-lf1-x133.google.com with SMTP id g11so4128774lfu.2
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 03:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IVoSwh1vrOcOYMzSFZcBGiekwmrvmnu/yu9ynAy3UtA=;
 b=Gj4M7BgLMNPwhiJBvGzl/JDenwkO7HDujABojJBRvVGLCRYQeHHyruewEpwh6ybCyL
 Av1yUjLdjkR52TDV9592LyZLu1xchFpalL3pBfN/s4J6GTD8OOlofaYsxubHYKVU2D6O
 CbHHedms1cH2t6sC0TTo3ffEOH/fd2BqYI9jaqOIfwtwvVCamaraABKsvlzeRrJ4cZOF
 7tXhjqCqOV+AEwTPnXm7hTyGdi7sLrHvX26MLPYSwDk05X49ikx2cs4YXE2R435mCgYf
 BeB9yakD/M3i6mbNh1aJSrhdCmtLCJpriqea6faSFaKjZhK9ZTwQb/aCz6oBwahpX3C/
 o4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IVoSwh1vrOcOYMzSFZcBGiekwmrvmnu/yu9ynAy3UtA=;
 b=Rpl7mg1dggC9qySRzLXOTgYJTlQR9HsFINU7tUohNPRkJ3FN447YwQTnBBxOYxQGDZ
 ZG6ykUGLe/JqGJMRb99JoOCQGKYlG4J0gzmUsQJGeT+4j3s8DDaKjJV5npbdw0zuYKe2
 qczmoc9sWjQNsuTK3+Nd8i40DA8UI9bywtQ8AegE0NolNfw4JmYIm02mxq3nC6xeAYmC
 ccXCH6vyAHue71dEKtTmqGWCkQKGMFTbW+X5iqKP7JdtzVOU/NMeRds34YANLUTiSuD3
 gyhQ2Gj/FEXL46olUuoQd/haJ1WSFWw5ay9rIxaYE5Do+2Xut7NTy5jc3NrUb4bMa44r
 sqgA==
X-Gm-Message-State: AOAM532S/NzVSRPs07VvlK9lkD3KHR6EfVaXygcjrEMEQS9X0Xf5S6HW
 ZGYlanMeW8x8LG9A+SLppQQ=
X-Google-Smtp-Source: ABdhPJzR7F4ntqza5TxeJHdnruw3Sr909Ky7UaeX6gfiS/xaUtY7aJ1DkExo+7MWJU3p6Tpo8cWycQ==
X-Received: by 2002:a05:6512:308b:: with SMTP id
 z11mr2508194lfd.177.1639742150078; 
 Fri, 17 Dec 2021 03:55:50 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id f10sm1355834lfg.211.2021.12.17.03.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 03:55:49 -0800 (PST)
Subject: Re: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-5-digetx@gmail.com> <YbtLJeIxXlVyQhd3@orome>
 <Ybxwovlw2GARzqUO@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4edfbff2-ffd9-1c33-de0c-013a29dc286c@gmail.com>
Date: Fri, 17 Dec 2021 14:55:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybxwovlw2GARzqUO@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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

17.12.2021 14:12, Mark Brown пишет:
> On Thu, Dec 16, 2021 at 03:20:21PM +0100, Thierry Reding wrote:
>> On Sat, Dec 04, 2021 at 05:37:07PM +0300, Dmitry Osipenko wrote:
>>> Document new optional sound-dai-cells property of HDMI node. This node will
>>> be used as endpoint of HDMI sound DAI graph.
> 
>> It's probably best for this to go through ASoC along with the other
>> audio-related bindings.
> 
>> Alternatively, I've just sent out a patch that converts the host1x
>> bindings to json-schema, so I could work this into that as well.
> 
> It doesn't apply to the ASoC tree for whatever reason so probably best
> to roll it in with those JSON updates.
> 

This hos1tx binding patch indeed will conflict with the Thierry's patch.

Thierry, will you be able to take the binding patches into the Tegra
tree and resolve all those hos1tx binding conflicts there?
