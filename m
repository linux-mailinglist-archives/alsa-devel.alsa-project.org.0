Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4374F8FE9
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 403141917;
	Fri,  8 Apr 2022 09:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 403141917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404378;
	bh=f9FOyM1QAnoi8ncak6D+m6kioDEzQhc8BCxF07uW01U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tqZLPhJloHn/7nZWwJa41C6tb0jQId6dOa6ewvs5zwpzYDo843tY/Llg73Eht+YeG
	 3JovJWd56S83Ogyd9T8RDnaePrIrpg7eQOkszlvk+fXsMjFMbe8C6SdGwW34rg9D9D
	 Q2uN7Uu3ZwPtetF6KLdYV7tWONwa+EYzLck1DKZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F344F80566;
	Fri,  8 Apr 2022 09:48:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C591F80054; Thu,  7 Apr 2022 17:46:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA597F80054
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 17:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA597F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hefoP6nG"
Received: by mail-pf1-x42e.google.com with SMTP id y10so5790254pfa.7
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 08:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kp+q9ML7Jywsrgwy6TQGYaSUuB+moeachq4LWhV6igg=;
 b=hefoP6nGQpP3n6tFd6H/gJBidYMW/2hakYiLJlLUV2wzwWwvqep+6g2uBEJU0sw/Sy
 hxjhrUtVa5AurtECklDgEjEpPeRJM8jW41FrL0OU471FMjcTCXmhWPMwcVTx1Eho74A+
 l2VwZMM3YF/J/s6bGa0mKdGL1i0TLo90SpxnaH3VcVRSdCxkJaVTs4gsACxpRx694ArE
 sWa4BVaVqZ04blrMwo2qFHQGY56IYpFA9/IDtKivnivTVCYyTr5XS4Gv9e4sYh20NQF7
 bEpLKI2EHE1LKybWHmtbnr1sCQTpGOaa/qpK1T4pZltmKPubMhc1zAbjd8bVr+4vvjZH
 1w4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kp+q9ML7Jywsrgwy6TQGYaSUuB+moeachq4LWhV6igg=;
 b=LkN90hyCX5as4xmxnfBWsBU8/OCUJOtZAZUT7OijhRGRiSrgPOh5QG/GIoNpe2B935
 3PRrnl9zWEa+L4mfFah5YLTNMwtLJ4Yzu1jU8Ojhy4YShii9zFdcOzcTPMkm+NRdHPPW
 5yS8cg2B2Zt7Ce/vqNVNRTIY8MLQtBon/bffoEZ4ocJZaOm9eeUtc/g5qHJ4ckINfW12
 Q0tFYytzVxE+UOq6StxCidrv3imqwuGR7qnhrgTugPhMX5CNbT6W7luI1aAvp3MmvRY/
 VuG6HgwOSA0MiK1LZUu3pPKG6z7pLxya/YsS98DUh/Jh+e9R5UEV1tWGkHxVZ3qjWAtv
 wXtw==
X-Gm-Message-State: AOAM532GC8HxuUGjj5j61i1X69aBtlRLlGp0QkWTTJe/7a0KhWwslJeP
 Jb8dgSUfDqNwEfkAraaBwEE=
X-Google-Smtp-Source: ABdhPJxt5Re64SMX9kNXS2PPlitna87huotHYdm5S7iB2YXVyFqJ1QBNvBG4+Sv54aLnQKi9iXwluA==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id
 l15-20020a056a00140f00b004e069959c48mr14877749pfu.59.1649346368636; 
 Thu, 07 Apr 2022 08:46:08 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 lx13-20020a17090b4b0d00b001c9989c721esm10028459pjb.17.2022.04.07.08.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 08:46:08 -0700 (PDT)
Message-ID: <96dae189-c0ff-4054-3d00-41c3b44c2cd6@gmail.com>
Date: Fri, 8 Apr 2022 00:46:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: rt5682: Add jack kcontrol
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220407141316.5099-1-akihiko.odaki@gmail.com>
 <Yk7+jbQ0KBM0zVh9@sirena.org.uk>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <Yk7+jbQ0KBM0zVh9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 2022/04/08 0:09, Mark Brown wrote:
> On Thu, Apr 07, 2022 at 11:13:16PM +0900, Akihiko Odaki wrote:
> 
>> Create a jack kcontrol manually as rt5682 does not use DAPM pins
>> for jack and will not have kcontrols for them.
> 
> Why not use DAPM for the jack?  Note that normally the jack is part of
> the machine driver not the CODEC - there's no way the CODEC can know how
> it's been wired in on any given system.

It seems it is an unsual case where the codec knows the source of the 
jack. RT5682 has interrupts and registers for the jack; see e.g. 
rt5682_button_detect in sound/soc/codecs/rt5682.c for details.

Regards,
Akihiko Odaki
