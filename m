Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09858613718
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 13:55:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 427B41680;
	Mon, 31 Oct 2022 13:54:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 427B41680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667220918;
	bh=lOHooi5pohixyKqlZ0SlL3CFISOCTxYrSbEfnF1+q9U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t/EXdi8AUj3c201QrWhMLlC1Y7PGtdRKnOpLnTFmKmdc6XRJOowhfNM84cbeyaJ9R
	 NKYhrpvx4OO6rx1nSNwhofdxIr28lLS3AMKkq6onL0+igcMW+JlvFULL5GhirR3buz
	 xyuMQVo0+KKppMzGbe+C4Nbhw/YN6UeA4OyTIfgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 494B5F80552;
	Mon, 31 Oct 2022 13:53:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 297C8F800F3; Mon, 31 Oct 2022 13:53:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79637F800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 13:53:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79637F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="f499WdNq"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 575B7660283A;
 Mon, 31 Oct 2022 12:53:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667220807;
 bh=lOHooi5pohixyKqlZ0SlL3CFISOCTxYrSbEfnF1+q9U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f499WdNqAR/opycj9EDQkypoD8+F+pU32v5QNpIaXvAGJWJSyJMpHx9SuQvmlec/w
 6XlDwrw2LD3zKJ3Qfm6B7Ka7oZAIKoHtABO3y+e6JfeA8cVk5rfW5NwlhKxRO34FtC
 jDF7xkGTDUyovw1xTniRRPHWgUAwefU7JHHkWVcV37eOV74fIP05+MLBPE08HF8N22
 veTwvG8V0DGweibUPBZyUI857UK/2git4BYwzp/Jv4v7dW8+V0p+pv6Zr/noMiLRaT
 L6CZUE0gOydLD+Qis2oYD3gopsP7JKJLjtSpGmCsEf1Kp2JFnbTDzC7MA7FUBVMjz+
 pgh1oVi5LuFnw==
Message-ID: <a454c363-8683-d59a-c571-1b5b29f68bd9@collabora.com>
Date: Mon, 31 Oct 2022 13:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/8] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and
 MICVDD supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
 <20221028205540.3197304-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221028205540.3197304-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com
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

Il 28/10/22 22:55, Nícolas F. R. A. Prado ha scritto:
> The rt5682s codec has two supplies - AVDD and MICVDD - which are already
> used by sc7180-trogdor-kingoftown.dtsi. Document them in the binding.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

