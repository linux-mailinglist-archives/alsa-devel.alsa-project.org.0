Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D814F8FEA
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A960A191F;
	Fri,  8 Apr 2022 09:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A960A191F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404394;
	bh=fuLj5aWMQeZjCKF43WXMKreR/llj3qvultl2+FsPBAs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYgE/w1ig2bxcTVzA9WR9mGa52jE9qA5Eqi4uoMS6onRjFiLTYTBqeOmlmeuSUEdX
	 VrBLvL9hAhYw0Ndega6uMkasIddo7yYUDvNJ7NzvHDGucLW4wrVaYKvEqzkxmJUXHu
	 eQI46ftuL2IHpEIfOmXpm7Ch6AaO1oB912LkwsEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E33F80579;
	Fri,  8 Apr 2022 09:48:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09624F8024C; Thu,  7 Apr 2022 18:11:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E93FF80054
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 18:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E93FF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="alOLYFap"
Received: by mail-pg1-x530.google.com with SMTP id 32so3210257pgl.4
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zZ+X5NwIT3Ilre3MBBFmMIR7GaB22k8MhpZuVDzBpfg=;
 b=alOLYFapVJTwjNCt+HI8OgHd4gZ7wRBv6j9rqciH7HeTcTE0zUmp1UzM0juI6ONaNd
 /x6sTIs/2QyP14JTKesaY7AzYWzmW6Dg9o8Nb/jZ7oAVtSL82LAEKymuFTyaGrExb5dZ
 kcvlnoeFawLSjkW6h3PmF4SZ7oHJ8SqQGNf57pRnX1nQlOZdPsr+lNxi4kKkgxoCip8U
 uV2THYWuW2JfO7WAZe/II0fF7ljf/vWTnSTVQh9Nu1byvBovupmqArUmffcbm4eV0m8v
 KZuYS+xCfJlY1ve8w2G+nE+egKTDFyOOrUyCHtwiAAWMoqOnnO95xxnxhmE46JnIu3RY
 4REw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zZ+X5NwIT3Ilre3MBBFmMIR7GaB22k8MhpZuVDzBpfg=;
 b=69+Lzs01ixz0CnDQzoegYSYzn5YIiaRhTRjZ3JkgVP34M+aetRMGG1qt2liUM08aFY
 Qv0sTW3cvslGg9DTIHv/EBO3v/6h/2b2QNvF0aRGe4E2xWjGPcCk4uR3E2HHdHwW5rIY
 kavIr1xxIZ5vMu2SHwkcN3vZuyvr3f7PuJc67Z7K/vHJDO1ua2GWTc3hTMowxwkTK3M1
 ftaWhrm5BQKTa/K8qDWljf0kei04gYyoiBHsA9AsgepXerBr7nxaaZT/EzbM+e492LxM
 P8qJuGc1sNcXmNlVVHrRU/pyRcPsRm2D8qBtKA/qzPEs9nfirlCWiB4Jaz+lK/oFqh2k
 8KzA==
X-Gm-Message-State: AOAM532Nr35yBwBfCIiWn6wErR1KDl7jfTj+qZyQok7IMUiQY9Q59Pyc
 8SE+eOlZUv2BtLqn5493T80=
X-Google-Smtp-Source: ABdhPJzXpBKnMk8RUBqHUQgMBr4hdwI+4c4C1MfdJdjMdh8OLbohG8kS5yhbNPL3aaJRQtENqg68RA==
X-Received: by 2002:a05:6a00:1589:b0:4fb:e7c:7c53 with SMTP id
 u9-20020a056a00158900b004fb0e7c7c53mr14654280pfk.78.1649347886338; 
 Thu, 07 Apr 2022 09:11:26 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a056a000cce00b004fabc39519esm24090890pfv.5.2022.04.07.09.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 09:11:25 -0700 (PDT)
Message-ID: <f86a10e1-b5a7-5c59-8e53-cec65d97234b@gmail.com>
Date: Fri, 8 Apr 2022 01:11:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: rt5682: Add jack kcontrol
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220407141316.5099-1-akihiko.odaki@gmail.com>
 <Yk7+jbQ0KBM0zVh9@sirena.org.uk>
 <96dae189-c0ff-4054-3d00-41c3b44c2cd6@gmail.com>
 <Yk8Ktyyt0veW4g+j@sirena.org.uk>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <Yk8Ktyyt0veW4g+j@sirena.org.uk>
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

On 2022/04/08 1:00, Mark Brown wrote:
> On Fri, Apr 08, 2022 at 12:46:04AM +0900, Akihiko Odaki wrote:
>> On 2022/04/08 0:09, Mark Brown wrote:
> 
>>> Why not use DAPM for the jack?  Note that normally the jack is part of
>>> the machine driver not the CODEC - there's no way the CODEC can know how
>>> it's been wired in on any given system.
> 
>> It seems it is an unsual case where the codec knows the source of the jack.
>> RT5682 has interrupts and registers for the jack; see e.g.
>> rt5682_button_detect in sound/soc/codecs/rt5682.c for details.
> 
> That bit is very common but there's still machine specific aspects - is
> the required hardware wired up, if it is wired up how exactly are things
> wired (separate microphone jack, headset jack, one of many jacks?).  A
> lot of the machine driver part of things is about labeling things so
> that it can be displayed in a way that's easy to connect to the physical
> system.  Generally the machine driver would define a jack and then
> connect the CODEC to it.

Whether the required hardware wired is told from the user of the codec 
via jack's type specified with snd_soc_card_jack_new(). The other 
details live in the codec.
