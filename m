Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDAF660091
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 13:52:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6DCB133E9;
	Fri,  6 Jan 2023 13:52:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6DCB133E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673009576;
	bh=H71k6deDZg8krxhqcQfj61cqZCeLPPHHcYtYkggq5Ac=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Evo0vsw1nQQATbi1QfXMRP2gl9r/UlJvuHcR0+SjAgOrXIjvg/pho91rhrBTATs9l
	 jUpWOO5SmIUZWssCGLMsKAJMC9d0AgHG3oVSeZ6GJ9s6Ly054QCEi9txI6Uib+xxII
	 WQC1CUprS9m5FvHoLVoIxyE0hX6tH/uBOEH+YJv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F601F800C0;
	Fri,  6 Jan 2023 13:51:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04CE1F8024D; Fri,  6 Jan 2023 13:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 172D9F800C0
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 13:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 172D9F800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QKz4eUtW
Received: by mail-wm1-x32c.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so3852193wml.0
 for <alsa-devel@alsa-project.org>; Fri, 06 Jan 2023 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nTsgZ28jw0QdfrpJIONpqgGy2v8hslyq6OA+g4F+h4g=;
 b=QKz4eUtWJGIN6xx+hgENT3rYclWDWorckUkLY2b6epk5NAQyzG/2rigaT0TizpLUFE
 ALfsOB35gYpVVqt8Cgv+z3AwMavRkDwXbC+d4dZX1C1HRDGNX6r7dVmJ/qKgxXV95Iac
 nMSElVESL61gXwbisyFgmoMVcEB2mPNhbI+b5xq9MqtbexFZx8cHvT2xQKsgfikuiM9f
 n7f+g/lF1f1IhWUw5u0lK9k49scLWs/vjIVbnP0Rx4wm5tZLQDtuapQm6jUbd9/i5Oei
 1QHcxS2O1V2xYPkOIlXuV26SsofQhFl+QD82RzOt7q4V3wnH/9H3fZNgVsn89IeQ9loW
 E8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nTsgZ28jw0QdfrpJIONpqgGy2v8hslyq6OA+g4F+h4g=;
 b=IGRjieDEti8yVs4kNX0PW4kiIOHaVZFQHLLgDgn1dJCUg/bWMmGTI5E/L3kIm3IPVE
 f+6e7+GBAjhH0UGuAnLS4bVK8LfiNVU4MqQeZQIKHpzjO+gAefUptLr6gyc74U2+XsLr
 e/zE4OAabRyYS6Hi2pLz3HiXMAd/n6ZQtJmFBWd6bUnDcT9r0glQmGMexe8CTUFenSF9
 6RnHYAtN6hRe26mwHf0xsBy20tpjHv8y3G2M77tyOhcW0ktbNSBxWy+fpM13q/sLlj9T
 qwGobL2W+bwFnsfMnV0KQY4EZ4rCg843OSDAluPyaOF/HqfCXaFyk5gzslyEegyF2FDp
 xU3A==
X-Gm-Message-State: AFqh2koSqusX/cxXYrVnCsadjmvv2bh4q0+FEmOKPsEEFw4IxxpsUwBO
 nm/bfxocSkxEJa5Do7AfebroWQ==
X-Google-Smtp-Source: AMrXdXt5ojTkfrGJboYK1DOEsuCMBlujKf37GSSKrlMZUfz9L62/8O1IxRWaAJjnDohiyFLrZq9ilw==
X-Received: by 2002:a7b:cd99:0:b0:3d3:5506:1bac with SMTP id
 y25-20020a7bcd99000000b003d355061bacmr39829602wmj.30.1673009513375; 
 Fri, 06 Jan 2023 04:51:53 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c1d8900b003d9d23ab449sm1659288wms.29.2023.01.06.04.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 04:51:52 -0800 (PST)
Message-ID: <3b4fba35-c34d-b8d5-99e7-e44456b67803@linaro.org>
Date: Fri, 6 Jan 2023 13:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 10/13] ASoC: dt-bindings: mediatek,mt8188-afe: add
 audio afe document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20230105081606.6582-1-trevor.wu@mediatek.com>
 <20230105081606.6582-11-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105081606.6582-11-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 05/01/2023 09:16, Trevor Wu wrote:
> Add mt8188 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8188-afe.yaml   | 208 ++++++++++++++++++
>  1 file changed, 208 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

