Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE0E60C971
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 12:08:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93A2355A5;
	Tue, 25 Oct 2022 12:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93A2355A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666692507;
	bh=JW1CdqgCRsqnGgTQGAjrlKyW6HoCOVr4phtjoxwxRlQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHLcOIhwf5Vfz1+8wQDWcOcBCdABcVk4TSdUKun0vDkag4Th9GOr0AOwsl627NBgY
	 eJ6gT50Zgx58/98lri5wg4ITrQ7Zks7qa6yA6YHPJttAPFgDbb0REY4sZowidJLQlq
	 2FbUSnEvw8nmcp3jxnZJZ6mGHlj6U5qojvCBVZnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39B1CF8047D;
	Tue, 25 Oct 2022 12:07:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B1A3F8047D; Tue, 25 Oct 2022 12:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 631E1F8042F
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 12:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 631E1F8042F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="ERqyKwDa"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ED9D86600363;
 Tue, 25 Oct 2022 11:07:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666692447;
 bh=JW1CdqgCRsqnGgTQGAjrlKyW6HoCOVr4phtjoxwxRlQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ERqyKwDaRLFxX9qvOO+vPHZcIkg52NCWfGHjj6KySZ4sy9wXn4Y/AkBShGgMZH1IT
 bjP30wT3Q5v01vuveUF0h/hizJa2Q7Z3zqEEu8wEfn0eyp84cMYB/6iuiPnCVZY0cK
 mZbqmGjWCTDXI5Otw5mknwGk5N6WHnoP4nC4db/Kbj1mEiwwj/u9HVTGqdWWGNLIMg
 kL3i0zA1ppJeIq8EFmHv8RJ+FIGl3yieTFQA7IIEKJvXuf/Niz0v9xXGu22/u5dV1/
 fSi+Pl79edHsCx332vWYRzv3ijGKvmGtrbvHp1wGxnt/bDUTEXr7xpyzLEearhBJ+x
 yFYMyUAlvflHw==
Message-ID: <48cb7032-14c7-5b2b-120f-570368f0b097@collabora.com>
Date: Tue, 25 Oct 2022 12:07:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 3/4] ASoC: dt-bindings: rt5682: Set sound-dai-cells to 1
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-4-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024220015.1759428-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
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
> Commit 0adccaf1eac9 ("ASoC: dt-bindings: rt5682: Add #sound-dai-cells")
> defined the sound-dai-cells property as 0. However, rt5682 has two DAIs,
> AIF1 and AIF2, and therefore should have sound-dai-cells set to 1. Fix
> it.
> 
> Fixes: 0adccaf1eac9 ("ASoC: dt-bindings: rt5682: Add #sound-dai-cells")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


