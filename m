Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93960C96A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 12:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A12755AC;
	Tue, 25 Oct 2022 12:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A12755AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666692450;
	bh=VUGneu/GkKsEmT+PsR4f+B8IGy/eQwLdVzDz2FlK9lc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abBGpFlE+oIOR01PXnB7Ll7g9zNeL5piPV+tZYX6xHmUAN6/wJV153n2ZNu3tEV1z
	 bQtFODYI54dgguxTkWv+drgwGwU9bMp3SoS/nHUdasAyhw6TOB/naHaNpouG5Fffvd
	 BxpBARDeDVFDBghjSpltNfeugdxDy0/byFHcrAzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 093CAF80448;
	Tue, 25 Oct 2022 12:06:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FB21F80431; Tue, 25 Oct 2022 12:06:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FBC2F80100
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 12:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FBC2F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="iOlw4dlT"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 576B66600363;
 Tue, 25 Oct 2022 11:06:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666692386;
 bh=VUGneu/GkKsEmT+PsR4f+B8IGy/eQwLdVzDz2FlK9lc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iOlw4dlTjzXRVQ1CT2YdYh77UHzv1fjxXQd5xg4emPrpVJc/2t++4xZYC8XA3BDPU
 UBTj7AMjXsbclKU3CP8qhVXAuFdoJxcW5qgbK+IAiTwmz+55/LdbwFTwx9wCInlBoa
 FxfMnPUv/fSYvpiXfnd05I+kLzzvugqV3AduZyvdbjqGlZhqnmGZTpMpAiuZY8sG9g
 JZ3dtrHD0kIdGjaBwvQU2gEIQaV9oMioeJXnk8WsYV+eyP+LFUzXBcxxBGL14+l2PH
 6DPxutnTohLkzhbfocvwg1bb9Qas69D66ofJOsDKb/rymnR86W6/ga8dnLR2wei41r
 IRzWN9T22iBfg==
Message-ID: <dcf284c6-dee5-d726-7f8f-c4ff1be99ddb@collabora.com>
Date: Tue, 25 Oct 2022 12:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and
 MICVDD supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024220015.1759428-3-nfraprado@collabora.com>
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

Il 25/10/22 00:00, Nícolas F. R. A. Prado ha scritto:
> The rt5682s codec can have two supplies: AVDD and MICVDD. They are
> already used by sc7180-trogdor-kingoftown.dtsi, so document them in the
> binding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

I also don't like these uppercase supply names... I wonder if it's worth changing
the driver to get "avdd" *or* "AVDD" (so, if "avdd" fails -> backwards compat)...

...this way, we can change the devicetree to use the lowercase names without
breaking abi.

Of course, this commit would need to be changed to document only the lowercase
supply names.

Driver-wise, we have a rt5682s_supply_names array... we could do something like:

static const char *rt5682s_supply_names_legacy[RT5682S_NUM_SUPPLIES] = {
	[RT5682S_SUPPLY_AVDD] = "AVDD",
	[RT5682S_SUPPLY_MICVDD] = "MICVDD",
};

static const char *rt5682s_supply_names[RT5682S_NUM_SUPPLIES] = {
	[RT5682S_SUPPLY_AVDD] = "avdd",
	[RT5682S_SUPPLY_MICVDD] = "micvdd",
};

for (...) assign_supply_names;
ret = devm_regulator_bulk_get(...);

if (ret) {
	for (...) assign_legacy_supply_names;
	ret = devm_regulator_bulk_get(...)
	if (ret)
		return ret;
}

What do you think?

Cheers,
Angelo
