Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD12C750974
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:18:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D4C2DEE;
	Wed, 12 Jul 2023 15:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D4C2DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689167916;
	bh=rMk4VihN1gS4yZC8RgDQHYr1VWB4KQSCo0flpY2dHc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nnrjTQWo0WuLdwX0PXn1ETYoCdVd5V+146dOszR8hulPRN/WyTfck0kFn3ony/Kwr
	 crU3NYlgcbeaFaAHZDkf2snDal56F1rSOwwZIg2cV8uRNloo1VoSUzZxZKAziXDGHC
	 fm8Jb75tOk5OyP/fkR6KTLvUU3MRN89Lanta5sGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EC06F80611; Wed, 12 Jul 2023 15:14:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9419EF80610;
	Wed, 12 Jul 2023 15:14:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 795FBF80249; Wed, 12 Jul 2023 14:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D407F80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 14:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D407F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=hn8H70Zy
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso71536145e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689166241;
 x=1691758241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYsJ63thWaEnF2bdwDOY9GkDlg8P9/us46x/m6A1eFI=;
        b=hn8H70Zyxu8TQrRfZIDwdYKutfQz+JQgByvxMUo15F+OMIywfFp+Qe1KHa4SIyr4wo
         bqkkofWAawRDiaIa5iVwlqDsQ3Qq0VR8tdn/waIy4t/Nb5At258o9quiRvf8x/6b4qAJ
         zWcyLaHmENBOVZpWUM/XrYn4XXcgKwXqi87Xr/6ntu7TiQ+DjPCKfHzB4X3/04rzZ3hQ
         Rwr4z+XHlzVAPJ0AJC/Pr8NOpE0M8HahqrV9k6qGPN1q52NhccZEW4X5jWZBmrELwYlX
         Ast0Hj2NW8cGb8NnubWNxSSxBuwJCNUFkTo6xtIkeVB1+Ejj/jh5XGpsSw4lmPfFgiK8
         HpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689166241; x=1691758241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYsJ63thWaEnF2bdwDOY9GkDlg8P9/us46x/m6A1eFI=;
        b=GSjiYoGFM0RgfLpCC9zbvAH8KfeYblORTcwMb/XU7VG9KZkFog1GJw4aDsl6AmZ3/j
         sDgD27L9nAH07nE89c9eVRpjcxlInHpDgsga6bNNr+NAHx4fE0sS8TROw+F5nj4J9VNF
         ENy02Lag6owUqjJ2DZpa5IsiWmUMRVkkp2hj2FD03xNlu56jRNGx29GFqH0U1cxQke04
         FAGQVaaNSTfhGIRK1hVI9FX0VNsKYPDLPAlI4Ajhj3raqc9Ge11lVaJOT0qk14cdW0i7
         nhgvnkSadshbsll+uoCH2XHO1VWnkCL7rusGl+H9kU4L74K+poFElSAhJ+NeGVifV3uC
         lIJg==
X-Gm-Message-State: ABy/qLZB3jkTzPILSR4824ivhzV6baUBUKTD0p09Ht97y3dl3hMG3dLE
	YAiwftzu5By198oj+uaQ2a2e+Q==
X-Google-Smtp-Source: 
 APBJJlHyphLNHtPrSUBpgCjJ2oqeaRUQji6SkdMtP6DiMk3xvuG5d//Mi73F/YxpSOuHVBAbBidBYw==
X-Received: by 2002:adf:ed4c:0:b0:314:212f:360b with SMTP id
 u12-20020adfed4c000000b00314212f360bmr16925439wro.17.1689166240964;
        Wed, 12 Jul 2023 05:50:40 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 y17-20020adfee11000000b0031274a184d5sm5023825wrn.109.2023.07.12.05.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 05:50:40 -0700 (PDT)
Message-ID: <5c24ae39-5114-1b79-a952-e7a364a1f2de@baylibre.com>
Date: Wed, 12 Jul 2023 14:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND 2/2] ASoC: dt-bindings: mediatek,mt8188-afe: add
 memory-region
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230712070821.23971-1-trevor.wu@mediatek.com>
 <20230712070821.23971-3-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230712070821.23971-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AO3JT6CGL57QYRLREOGEGZJ22B75ZKRV
X-Message-ID-Hash: AO3JT6CGL57QYRLREOGEGZJ22B75ZKRV
X-Mailman-Approved-At: Wed, 12 Jul 2023 13:14:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AO3JT6CGL57QYRLREOGEGZJ22B75ZKRV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/07/2023 09:08, Trevor Wu wrote:
> Add memory-region property to utilize the reserved memory region.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
