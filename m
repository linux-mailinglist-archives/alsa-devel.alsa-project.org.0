Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0FA743E2F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 17:03:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29BF17F8;
	Fri, 30 Jun 2023 17:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29BF17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688137421;
	bh=h+MIJ+LU5Ly4AO3Nptyu4+vH9JwJ+WtPCu5ckPXbpWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jhAPBXNpwEdJlloXNdQwopjJ2eEu6ywyHEgGvYu4J5nW965mR0WUKnWoy8SqKblic
	 UN+SenIs38yVV/9GTJ+4L1+73RRDunmMg+utm5vqm785isvLSNiVzWOwzbDC3RTtbO
	 XUswvK5LbBhIioG8Y4S4EZIH35oaW/ky+rRTnQc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D3FDF8051E; Fri, 30 Jun 2023 17:02:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44287F80212;
	Fri, 30 Jun 2023 17:02:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C17C5F80246; Fri, 30 Jun 2023 17:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72294F80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 17:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72294F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=T+6sWpEW
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc0981755so18661885e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 30 Jun 2023 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688137354; x=1690729354;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XkW0ju1DfGLdkGmFEpNKOeGgt/oTLnPR/vBNsWYtTw=;
        b=T+6sWpEWNaNvJCk70tUnQ7ziTP17oZtBYhn3Ywf4K4FPwXvc2KrTIHPNt8VLVIKgKQ
         JAwKb6mpFuTWw1Qy8wNENmKMue7fvogPzhBbL3CRtSyikw5CgcSzW03pNACvI3tl/qwp
         CM+FQKK3skDeb8Ms/oTxZ+Wm2I85CwpVP9ysZIjX5fr4q6vkgKy2OR1fTtFpERYbemk1
         6Cgv2uyfryFhbl688BTDMAwTtgB9o6RGG/TtcPAl/z0FVR1k1Rs3GSwpNLDQkDKah111
         9IjdHNE3TDjsZlhjNLcgmnwtNwDIggMOWtxXMSZkgYBsoW5VWhK2mXkT7i+unaDb2feV
         PI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688137354; x=1690729354;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XkW0ju1DfGLdkGmFEpNKOeGgt/oTLnPR/vBNsWYtTw=;
        b=SRO29Kb+65jxKi70DkqztodEAaOinA/wLsVvArBbwwlEETd0GjC8Gjb1AeoZ5sfXp9
         lt0BTK8N+7vDwNz2LWdbKl73mM9KnztbtWYVA1I4DEngM1/vcSQVl7SDmBPKJ91XdJ87
         J2sKIJyKetdGTLOKVjCGYjeqafwecO4JXmtp0B1wvgIedNQfnia9CDxRLYll4bnT7I/w
         v4N1G91kq/UHE2nseeie6rpfCOdFmruSb7B0e35Fv7OKfAt0FxomQ6zsTZsZQWKm//e6
         +zl8tt+OMyqmz0YtzdR8uvDIXDfkv22AdhiZareSeLX22zqlgXvdfBGOZnxl28O1r+PZ
         4UjQ==
X-Gm-Message-State: AC+VfDwicQok/2h10VYzioimX0Gcypys25Y4NYVf6fGIBMjgbwIQwxGZ
	i2gB+n4swpeV8WcOojE3xkHxXw==
X-Google-Smtp-Source: 
 ACHHUZ6fO6EpxJ+iOICbEV1K5cvBhUyJ6l4rYRLUp1Lmucz+u3sm9qi9CAw4KbgZjDOgQ5K3ugspEw==
X-Received: by 2002:a05:600c:ac6:b0:3fb:b3aa:1c88 with SMTP id
 c6-20020a05600c0ac600b003fbb3aa1c88mr2169011wmr.26.1688137354397;
        Fri, 30 Jun 2023 08:02:34 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 u12-20020a05600c00cc00b003fbc681c8d1sm1900627wmm.36.2023.06.30.08.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 08:02:33 -0700 (PDT)
Message-ID: <07881d30-cec6-5885-ecb6-fbfaea88f3c1@linaro.org>
Date: Fri, 30 Jun 2023 16:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/5] ASoC: codecs: wcd938x/wcd934x: loglevel fix and
 cleanups
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230630142717.5314-1-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230630142717.5314-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XR5B2TPZAMXPUFM65LOSTNFHAZO4YDUT
X-Message-ID-Hash: XR5B2TPZAMXPUFM65LOSTNFHAZO4YDUT
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XR5B2TPZAMXPUFM65LOSTNFHAZO4YDUT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 30/06/2023 15:27, Johan Hovold wrote:
> When investigating a race in the wcd938x driver I noticed that the MBHC
> impedance measurements where printed at error loglevel which is clearly
> wrong.
> 
> Fix that, and clean up the logging somewhat by using dev_printk() and
> addressing some style issues.
> 
> Included are also two patches that drop the bogus inline keywords from
> the functions involved.
> 
> Johan
> 
> 
> Johan Hovold (5):
>    ASoC: codecs: wcd938x: fix mbhc impedance loglevel
>    ASoC: codecs: wcd938x: drop inline keywords
>    ASoC: codecs: wcd938x: use dev_printk() for impedance logging
>    ASoC: codecs: wcd934x: demote impedance printk loglevel
>    ASoC: codecs: wcd934x: drop inline keywords
> 

lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini


>   sound/soc/codecs/wcd934x.c |  8 ++++----
>   sound/soc/codecs/wcd938x.c | 17 +++++++++--------
>   2 files changed, 13 insertions(+), 12 deletions(-)
> 
