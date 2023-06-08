Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E18729D52
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8BA1847;
	Fri,  9 Jun 2023 16:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8BA1847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322285;
	bh=7RqGqOsNILvPhjzFOTtSU1SzogNsvaTLmUBm1N/KmOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HfFj3LwLMe0ceR1M6ft5fIsywEtbVuGdO16fwuxjit8iU/e9EzRWBL2mfIns3U/U/
	 ZYk3tuSmba6HrKcLlCdrgIcWEdOO10V8BCuX3d0SaFFzNItfpqHMVl7lhuRKHKYhFt
	 lqV4AaOSeNZ9O4Jlh4oc/76Qz8jGaf55phTvEd7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72D1FF805FC; Fri,  9 Jun 2023 16:47:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60925F805E1;
	Fri,  9 Jun 2023 16:47:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BF1FF80199; Thu,  8 Jun 2023 11:32:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06296F80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 11:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06296F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=2zfWTuEM
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f732d37d7cso3035275e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 02:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686216764;
 x=1688808764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qh+AyXkdA/v/9kzVTrAL99NIpdi0mGHc3m8uGx6UR50=;
        b=2zfWTuEMe3vS7U9zuJsMP2vQfKn8N+zqkxv+/d/SAkFZXyxO/JlkYJDJfYLoU2SzYk
         HOFfN7F+urIh30E6sqIClU5tRfZTXUkCUe5PetIsu0eLjLOfYWfhzb2tTFKWHusiTsLa
         3C99D0XgCaxBQkWubyObQpI8fGvpsqVVnxy9I41a0tNssosTD5paCXmH0ORLOBGmZfeF
         SREg7sdTJ8a4fI3a0h3g/UuzMW6WFAtA2NNxlRMyMHnXhtlvuDZC2i0pjONTDk8A34Zk
         cgd9iHTXTqP4YkCLMJV1Wg+TESY2Ck6rPjmQHkeLZPiAhYPdDEAONBsrmPxEMrT3sAdq
         Ml5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686216764; x=1688808764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh+AyXkdA/v/9kzVTrAL99NIpdi0mGHc3m8uGx6UR50=;
        b=UxLKsW/LQt+fP/7+1inVrPFO7G8MijSwVfLrItW5QVNwvNJQu7okDlIO+cNYh15fUm
         hdp2KCUtTUvWYNXkQkpo9sjXTEjzjIc/86tvwV2yWJUqgppvk3K1EtBVKwZtEypP+ezT
         xuihRMyjQts4ums6hQMb7Enp7+EMnXKP/D+7V19Yt6iCEkxxtlc9BPDL1bs8aYG0LkZ+
         2m8LBnHpwDAsBKMWdERCzv6DJ8659a1e4+ceFlLEeY0gds8YPkz6GZsUx+AErpRJaa6F
         wlPIAG0gbY0kcevt/k27gwVfuvZUvwpw4/Y4j/eOKtoX/mpsaSDmxvHkSNn5CuzjcGtb
         KXPw==
X-Gm-Message-State: AC+VfDz/FqprmM+0QUjlEBYvAhDGjRUZiNrKdXRvaBiEm2GTIOvvtuc4
	TeLDGfvu28FwktjB9gB6f20KGA==
X-Google-Smtp-Source: 
 ACHHUZ4niH/W18GVbLuK2FNm3lOVu/Kuf0O3YTklSvQmuP4gcU0NpNfou88IFGerHEFcQg4ETn2BUw==
X-Received: by 2002:a7b:c5d5:0:b0:3f4:2ae5:b35d with SMTP id
 n21-20020a7bc5d5000000b003f42ae5b35dmr846586wmk.40.1686216763972;
        Thu, 08 Jun 2023 02:32:43 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 l5-20020a7bc345000000b003f735d6fa74sm4719624wmj.9.2023.06.08.02.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:32:43 -0700 (PDT)
Message-ID: <c8976700-6d22-3f7a-73c8-6986504cebff@baylibre.com>
Date: Thu, 8 Jun 2023 11:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608084727.74403-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: COOUPGU6AHK7IQLLNQ554CFCSUAWERJT
X-Message-ID-Hash: COOUPGU6AHK7IQLLNQ554CFCSUAWERJT
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/COOUPGU6AHK7IQLLNQ554CFCSUAWERJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> This code triggers a Smatch static checker warning and does sort of
> look like an error path.
> 
> sound/soc/mediatek/mt8188/mt8188-mt6359.c:597 mt8188_max98390_codec_init() warn: missing error code? 'ret'
> 
> However, returning 0 is intentional.  Make that explicit.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

