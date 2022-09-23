Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D725F5E7661
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 11:00:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78C6F827;
	Fri, 23 Sep 2022 10:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78C6F827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663923646;
	bh=TtjCeYOKDFThjw+4dvKD2IYNwoiHybT6ddMpEd9VHdE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=New/A55j/gYHeRYLC+WyICqIXmC40AVvz6AW6zLFjsNZ62S2d/aBNTjn/rRdDs+/D
	 12+Yn+MG9bOSgkQd+4c4K5puNYn+GYN6l68YjOgtTLpCwlgnv5WM0CWGJYZ3pAfFYM
	 aGa9JQE4Soy5QqmQ9DShWpiLrPpPWfxuj27DZFDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D029F8055C;
	Fri, 23 Sep 2022 10:58:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D731AF80557; Fri, 23 Sep 2022 10:58:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62295F80224
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 10:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62295F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="O74axDIW"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 05B17660223B;
 Fri, 23 Sep 2022 09:58:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663923496;
 bh=TtjCeYOKDFThjw+4dvKD2IYNwoiHybT6ddMpEd9VHdE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O74axDIWWHuxdFAV+18mWU5cgcKNGxmjpgM/CgsKtwAObBN/wV0cYBMzAEI369zv6
 q5ADViaqzPXApn8bP2RUEMEjpTTFEHjTStXgxWdciXUqeQd5Lu5eOX92TkD8TJ5JKQ
 L/iNYYK/PYvFFzp9GDYIiRZSRLGWzBfxlIRAOBdR2oXrm+dhxxFc8BCSZI4BJyzvE8
 m6bZ8zu2lfizlkrTpA74weDDW+bYyCjnRXalbuM5Q29pRMMdN1xp+SVRO9weaEtvLR
 U61NcolypqZzUfkg0EkjeKMv24pPw3gx6YeMMz3GgxLDnyY/3UhneImx1x72qQNAM4
 0XW0jUfiSW62g==
Message-ID: <2e65843f-75b5-2e66-f7a0-96ac8925a1f5@collabora.com>
Date: Fri, 23 Sep 2022 10:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/6] ASoC: mediatek: mt8195: Expose individual headset
 jack pins
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20220922235951.252532-1-nfraprado@collabora.com>
 <20220922235951.252532-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220922235951.252532-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
 Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
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

Il 23/09/22 01:59, Nícolas F. R. A. Prado ha scritto:
> The rt5682 codec is able to distinguish between two event types:
> headphone insertion/removal and headset microphone insertion/removal.
> However, currently, the mt8195 ASoC driver exposes a single kcontrol
> for the headset jack, so userspace isn't able to differentiate between
> the two events.
> 
> Add a definition for the headset jack pins, so that a separate jack
> kcontrol is created for each one, allowing userspace to track and handle
> them individually.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Nit: for the title... ASoC: mediatek: mt8195-mt6359: ....

Apart from that,


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[On MT8195 Cherry Tomato Chromebook]
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


