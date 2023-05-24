Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3F97125CB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:44:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A8A16C0;
	Fri, 26 May 2023 13:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A8A16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101478;
	bh=/AfAIE4Ql/57xCIxjfHauivPMdY/7NJsGBlHU7vHuP8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jO9i/sXw7wTYTs59d2MsVz+eedeeVt875WzgbBfTas/ffN4THvlMdL7hcTbhU9yzQ
	 yIFNfWsiMIXTC/60+V7Njcid9fK2KZnO6IAKQuvvPphVg84H0FPfWKR8rUZVHM2LW9
	 kGAHJuQ3hvUnxOfQqlrXCUyMJiAIEkngkHeQBYtU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE5EBF805A8; Fri, 26 May 2023 13:42:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7432EF80589;
	Fri, 26 May 2023 13:42:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 246F3F80580; Wed, 24 May 2023 16:51:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C05FF8057B
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 16:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C05FF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=YT+4PyG2
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f603d4bc5bso12385155e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684939869;
 x=1687531869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2DZMvMkI+V5RMAcXCANfBiGO0oQRS/4+8XHUn3qgoQ=;
        b=YT+4PyG2PpzfKSBHI8via/8/85UUkYBO2UQIpGyWv6Za+qBrjWJtqy48/7FF0kjuXS
         RMowXnKeB9ZUFdWVc02eXhlevD7TG5KMShelI1AdHdYOdM2/focKmgSgHkJTQVl1hH1E
         583D9fVRRW7QNbiEQsBi1u+lVIRB+0IiP8nSx5Q3NGOOjOE1p4Fv3Gdxj9zcGgldrsN0
         v+Owz0hzn7fVsVQl/QfZp38PHyTcyN9qsiWdkr2Z04AyMtXOSKDIvDODXJyyQKKt5bJ7
         Q8rffHMfEiZe4LyTr8tGRM0t/YtOcfIAT3wI0MsdXaO+QrL6w6KCtyeSFa3/ARp0/w+i
         fPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684939869; x=1687531869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2DZMvMkI+V5RMAcXCANfBiGO0oQRS/4+8XHUn3qgoQ=;
        b=Pg7d7uDjPXgbyukm8vdmw6MPX4hTdtAP0Ib3iR0dBoS0N9RRtDkhYNufvH4JVYj+d8
         /nEs8E06n7eUy0PCjg/L5ZFO46pazDnSjEtHajcWPbjhMdIam1dRSO+njko6JAeoOEyt
         Squ8l7XsojEk5611zuT3Tt3VTbZC22O7QlNHnPkq2tsm/EhXy5fCQIE1ccqbzwPiHsx6
         +UL81DSLTRKHK2u44bF8UFeQVYMFsVRoPW9pL/v/gPXtOPtFpHb7e2hZix6T2jdNhFb8
         FSJsaoOfYYuGd7p8qiWBoBIWQtDdTQjDTTF6U2G3P7LMlIYMDE8LpqS4vbWQfXU2bBew
         YjHA==
X-Gm-Message-State: AC+VfDy90YArK4Lf7P+3jnncK7TRhj62dWhAxbPiVWnRvX7kuVM8LMlD
	NvKDIE1fBRFrPB7p+1GMn4lVyg==
X-Google-Smtp-Source: 
 ACHHUZ5wWAGNXmRoeycTsyYGzAOS1ytBUa6At8n0AYB/K3UfJLVFRhbZwiqycV6JUKARY/EvMGybsA==
X-Received: by 2002:a7b:c40a:0:b0:3f1:72fb:461a with SMTP id
 k10-20020a7bc40a000000b003f172fb461amr86103wmi.2.1684939869319;
        Wed, 24 May 2023 07:51:09 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 x26-20020a05600c21da00b003f423f5b659sm2675744wmj.10.2023.05.24.07.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 07:51:08 -0700 (PDT)
Message-ID: <e13c2670-4877-7e75-aaa2-623f4ed927c0@baylibre.com>
Date: Wed, 24 May 2023 16:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 5/7] ASoC: soc-dapm.c: clean up debugfs for freed
 widget
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-6-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-6-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: J663KQKZGTBNKONI5AT3K7C2JERBNAMI
X-Message-ID-Hash: J663KQKZGTBNKONI5AT3K7C2JERBNAMI
X-Mailman-Approved-At: Fri, 26 May 2023 11:42:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J663KQKZGTBNKONI5AT3K7C2JERBNAMI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/05/2023 04:19, Trevor Wu wrote:
> When a widget is added to dapm via snd_soc_dapm_new_widgets,
> dapm_debugfs_add_widget is also called to create a corresponding debugfs
> file. However, when a widget is freed by snd_soc_dapm_free_widget, the
> corresponding debugfs is not cleared. As a result, the freed widget is
> still seen in the dapm directory.
> 
> This patch adds dapm_debugfs_free_widget to free the debugfs of a
> specified widget, and it's called at snd_soc_dapm_free_widget to clean
> up the debugfs for freed widget.
> 
> Signed-off-by: Trevor Wu<trevor.wu@mediatek.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

