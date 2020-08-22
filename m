Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390124E7BA
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Aug 2020 15:50:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C854166F;
	Sat, 22 Aug 2020 15:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C854166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598104222;
	bh=mCm8jMFIxNttI6Qpw9hPtbgzU78M7Kvn+KVrlrzxf4Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iPoIwKSSO8DMrAK+Ay7CXMqkeVp3JFw+TxFbgZBR0dD0dHNdDNfoA0lO+rZaPRagY
	 gCVtE6rUtMEMknk91bqVMV09M/ylaemK4LURanb5Q2vFFUtFjFfIE01GOnfCQyn7In
	 rZH/0fKJiaqtWpVk6FnKa+jBAtQa1LMzlMv3CVTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C83EAF8007E;
	Sat, 22 Aug 2020 15:48:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90654F801F9; Sat, 22 Aug 2020 15:48:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28489F8007E
 for <alsa-devel@alsa-project.org>; Sat, 22 Aug 2020 15:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28489F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sTSZ2XxK"
Received: by mail-wr1-x441.google.com with SMTP id a15so4400661wrh.10
 for <alsa-devel@alsa-project.org>; Sat, 22 Aug 2020 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mCm8jMFIxNttI6Qpw9hPtbgzU78M7Kvn+KVrlrzxf4Q=;
 b=sTSZ2XxKslxUt+qAwrD5UUCZPpTwt4KLH2O+jHj5zpwteyNWrPPd3txgriyS51sx2T
 jDft5+t87RS7Q1HvhXlUq46Rt4Tdsb+XkrxYE7SBOrCTBD1pI06df/JrImXuFDvjLkUH
 n9qmXTT27p0gbkRAqnTSGvIz7f0VjlLYAvot/PsygGLfolPSoJpj/CalWtOhywgEz7cE
 WnmOwFW7U+Uk4z3cBaxjZcmPwU1e7O0A/Gx73/1s8XydzDj/4Uoy9ZNFUrdNGnQw5jm7
 +pdQWr5plXgUNRCtzTDyU6JghN6ddZiJEO1MF6AwwpsXFgLpdSP/kG8rXJJ7Z3Q56TuE
 Ev0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mCm8jMFIxNttI6Qpw9hPtbgzU78M7Kvn+KVrlrzxf4Q=;
 b=mMYFkHNQcbW9BRhGBRpj0WS6h3O2JkZwSixHFr+fyBh8rEKsI8WTLLQRPGc5Pnt6C0
 eCr8G3aAU1Pa+n+PIvp7d+PVS44LgtHhfaOXygC2CGaH+RmHLunq2tW5mG8Y0308YiCj
 i/wPZTC7HgvMDLWMZDfBTdYmhF17OXS0pvIy4Yo6PR3YcR/HgsF7wzV92prfw265wFjB
 es/PEz2gidicCITXfrAX3+bNBCdIZTXyAfwQ6kc4v+mouLvAtt4+OMbu5I8piv9S/T7H
 YwNtrzw93qsycwenyZNH6iasbpfVaEQtNlZWNVRBiAG4edb+Ax6c/Xhbr9Mmf1owlNWy
 TCgA==
X-Gm-Message-State: AOAM5334LXw0coQFNGdWSPebEsH0ThAOR95a6EBxWSu2/6thlWDyhVwJ
 YIQV88hdmBjAGPM6iAiepEc=
X-Google-Smtp-Source: ABdhPJzWhCw/arov4mC5syWiooyXvGKHtvNxAwBRfnrw2AcioDkLKwXl1UY7lWGfY+AbbXN1XaJNDA==
X-Received: by 2002:adf:ec10:: with SMTP id x16mr6850429wrn.74.1598104113188; 
 Sat, 22 Aug 2020 06:48:33 -0700 (PDT)
Received: from [192.168.0.74] ([178.233.178.9])
 by smtp.gmail.com with ESMTPSA id 3sm11491977wms.36.2020.08.22.06.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2020 06:48:32 -0700 (PDT)
Subject: Re: [PATCH 1/2] ucm: Add JackSwitch definition
To: Curtis Malainey <cujomalainey@chromium.org>
References: <20200820233205.505925-1-cujomalainey@chromium.org>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Message-ID: <b98a8a77-7652-1995-27ba-eb7b6d30202a@gmail.com>
Date: Sat, 22 Aug 2020 16:48:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820233205.505925-1-cujomalainey@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>
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

Hi, I'm not really a kernel person, but wanted to point out an
alternative I think is better.

On 21/08/2020 02:32, Curtis Malainey wrote:
> Some codecs can differentiate headsets based on the number of rings.
> Should we choose to differentiate the config we will need to be able to
> select based on the jack event code.

AFAICT from ChromiumOS UCM configs, you're using JackSwitch to detect
whether a plugged-in jack is/has headphones, a headset mic, or line-out.
Instead, if you add something like my recent commit d0508b4f1604 ("ASoC:
rk3399_gru_sound: Add DAPM pins, kcontrols for jack detection") to the
machine drivers, you can just use JackControl to specify them in your
UCM files, and your audio server could distinguish between those cases
by the values of the jack kcontrols (e.g. PulseAudio already can).
