Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B405B3B11
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 16:49:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE69D169D;
	Fri,  9 Sep 2022 16:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE69D169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662734967;
	bh=mdhZkaxa/CxSMkzspvB5Zss+2WgNsjGPlDIZT6qZvVI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQrloRtU3vOnYqxDkbeM7+EjtrcDuU5sGV7lgolJcuKTX5sxLbImKf4kVR1SHt8nR
	 3w/ZOBfnyibONCWqHz/V+GG1fg4C5xJ08FGtJMyAWbV/BmWKS4cn+91TDiKBz0cAxH
	 GVSAfQWRygf0S3aVWSDanD4RlSZz3885g8ZTQirM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DDEBF80105;
	Fri,  9 Sep 2022 16:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98824F80533; Fri,  9 Sep 2022 16:48:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5706EF80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 16:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5706EF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oSwLJRjz"
Received: by mail-lf1-x131.google.com with SMTP id k10so3100851lfm.4
 for <alsa-devel@alsa-project.org>; Fri, 09 Sep 2022 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1Xo/jW7kVhmeqMUm5EF08mo1H5Vri/2WuJWKrRFmb7g=;
 b=oSwLJRjzmYKuS+doOBb65HxYI1YvbLxdKYdXpEje79++9Rj1by9DOE3k1VsooF9TIi
 e1Zw/CBaIz4ppk1yg0D2DzrJ3BqUVC/s5M+XfT+sbBpSbVtUV8yvrTbr8zU8IsiuD/9Q
 imV9nLMCE6NvZqsMvABIpeSeQemrLi8gsmeRK6Oq0HqGj2QCBNh9leOg6HlWzbN3nOAo
 mZ1n8zgg03r08QMwFeNkL7VKyNXEMam8owJq7zQ8XDYklw7YPzkmEtyTFUjqBWZMQlIS
 zn/6hF9iLLJMo++8frY2amYwOd/Mqkna3KylzJt+ZJrEtZJ5hPrXaOBTFSTrRgMXBFTc
 NbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1Xo/jW7kVhmeqMUm5EF08mo1H5Vri/2WuJWKrRFmb7g=;
 b=bZ/sygVYzdrD1lwoy/wpXpfXVknICCKGfYppTemZJKFTL7TknrMyFi7J/jTLQmywlg
 uxQ+Ol9XdZ3YQT5HHrk1bbL5v6DnKDduiIjghKe9yBql5pFG55unMBoE5b3uEUKm+G5V
 qhZriN8zT9yMIVk+FHP47E1b85JRlNZmIfc3vHCyVIaOOesDaz7jmSIHBDFiuKuVRfV8
 sRN9IJZgE4PcOHXXCSDzxwX/6QnlFfEPHDN5ZWyVoMv7ZlXvAkiYMdn+CdpBB26JaPKP
 W7OUEOhNIZPvTHseIaEBGtOL2AjXyOMSxMHL4XpaO8RdBdz56MUci3zCX+g06MhDHATk
 jQWw==
X-Gm-Message-State: ACgBeo3S+e9NH+JRBM6pCXKMKwaxFw/HhQGDyLf+Z6z1zbpifN3o9o4D
 BRUyDbxUPtoVmp+qLyTPkE9P2g==
X-Google-Smtp-Source: AA6agR7hWKag4xt7p0pT/feHrJNaWeiDP8haudHJ81x1EwlDjlpYjrTrYeTknUWM4guN+yv0LjJEgw==
X-Received: by 2002:a05:6512:3ba3:b0:497:ad1e:e9ab with SMTP id
 g35-20020a0565123ba300b00497ad1ee9abmr3921833lfv.619.1662734885375; 
 Fri, 09 Sep 2022 07:48:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 g5-20020a2ea4a5000000b0026707e5a611sm111621ljm.20.2022.09.09.07.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 07:48:04 -0700 (PDT)
Message-ID: <ac0c63a1-9298-568f-d06f-ef7d77ca00ff@linaro.org>
Date: Fri, 9 Sep 2022 16:48:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: cs42l42: Add 'cs42l83' compatible
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-2-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909135334.98220-2-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 asahi@lists.linux.dev, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matt Flax <flatmax@flatmax.com>
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

On 09/09/2022 15:53, Martin Povišer wrote:
> CS42L83 is a publicly undocumented part found in Apple machines, similar
> (almost identical) to CS42L42. Share the binding schema of CS42L42 for it.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
