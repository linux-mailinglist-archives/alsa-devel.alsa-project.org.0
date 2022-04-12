Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00694FDEDF
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 14:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6865F18D8;
	Tue, 12 Apr 2022 14:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6865F18D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649764915;
	bh=L6//NAf79OVqIR55TudHhn198rcH9dh9Z2KUZ94aECY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lHusWNC0NiCNlRuuXqC4YuByb51SikJrqL0Fx1wU3Lx06UVjpxoPgL9glejabd2B5
	 fHIn7yuUxe2DFXrQkw4eNcobKzLLTMATRw8eIGSYBaLIqtF/i0o02hFh4gF6nIelVc
	 P6c3JV9xL7OoYecCW4r4PCaHA7/C+5GZHDpk9ZRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF055F80245;
	Tue, 12 Apr 2022 14:00:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58A50F80154; Tue, 12 Apr 2022 14:00:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 224FBF80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 14:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224FBF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PjTkhyxG"
Received: by mail-ej1-x630.google.com with SMTP id ks6so12210822ejb.1
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 05:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4XT57RJ2zR0pUw59EDpBr/xnn0uf45XYMH4qW2Nnhag=;
 b=PjTkhyxG9YnT/WRgCigk6dnjQLEqvWLBnqJI2oxk5GEFzh065/3zJ6/VA5+CQBLpKU
 ljnXnp3/rV4PlaXn22l0r6QtObTkHsit4HWew6uxkt95zQF27zPcfeMrGu1zLQxT067i
 Vnb36PyoD+EwmuEiS0iLt+ph45Vo5xXTIjcLOg4tzTp2rpSSH9dOf/ofFNfk6B6Siigc
 /BSb05fegwqITJVh7KcYQaq4ovOkCP93LqIZR+8XpYs87wTg2nwjn1wsEOoy9EVhzdf5
 MCoUdVSyTzcG0bX89zamHIuTF1qRxE7G+9cKyrOte0dGyY2UgpMeINiTXpG9D9Ce5usj
 zdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4XT57RJ2zR0pUw59EDpBr/xnn0uf45XYMH4qW2Nnhag=;
 b=S6WrCjksqntdCUGU4DbUfjQvrQzt4gEHu8vlp3c8GnnQme/nzAnSlSNGBNx3KoZvRI
 k0Uwl44/2pq3b7cnEPzMIWXMRGDaZUwGMGjL6X7WQ6NHj2z1CgmOkLDIdluFVXaThRyf
 5CUvT5qVPBlUevyc0Di0CwnbKvuSXAzpOmycBDLyasl7VK0O6LKhOuR83zbLHgAjUpFp
 hIx2PWPqC/6AENBSUtqGpe2rnaMW7p4Ip4MjkKpqKhcHRRU06zuoIrAA0NTYw8ZiOA8+
 wrUiOTZgm82MEejUQZIjX01pGiRcloTZyPktUGHm9X38o5DJyp+nSBTa+7A4ZaJeiKyw
 W+VQ==
X-Gm-Message-State: AOAM532x4txfdQm1wUu2jHPT3S/HS/nbkoGRBxIcrzMc88xrPvvI4on/
 0wjXPg7u5ADOkWzVW1v4MNOFmg==
X-Google-Smtp-Source: ABdhPJz5Rcv2dy4vHSQGWUoNuyDX38ldlJdyBOsnSd7fJARXObJEOMnlXSoDY/87s+k5IVcc4n2vbQ==
X-Received: by 2002:a17:906:3082:b0:6e0:111f:8986 with SMTP id
 2-20020a170906308200b006e0111f8986mr33086544ejv.677.1649764845598; 
 Tue, 12 Apr 2022 05:00:45 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 l14-20020a170906644e00b006e4dae79576sm12802578ejn.14.2022.04.12.05.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 05:00:45 -0700 (PDT)
Message-ID: <54abc3c6-959f-58df-337b-dc847e9d7b1d@linaro.org>
Date: Tue, 12 Apr 2022 14:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: ASoC: fix invalid yaml
Content-Language: en-US
To: Corentin Labbe <clabbe@baylibre.com>, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com, robh+dt@kernel.org
References: <20220411194409.3390002-1-clabbe@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411194409.3390002-1-clabbe@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 11/04/2022 21:44, Corentin Labbe wrote:
> The word "or" is useless and breaks yaml validation.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/sound/tas27xx.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Subject should be reversed for this subsystem, so:
"ASoC; dt-bindings: tas27xx:"

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
