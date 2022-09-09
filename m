Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A895B2FE6
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 09:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3B61698;
	Fri,  9 Sep 2022 09:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3B61698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662708958;
	bh=zNSBueW1a9+ysgM0uoEjVV/0yBh6M55W7WUMoLNV9iU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DIyjFvlDoPsN+4jd6rjEYpn8IONtPn3syr+VUvyL4GuHnYvJvMXeDYO13mskJiUFc
	 LLDWxcVykVete0bKZIi2aVIFlsgWfVYu4wgTccAedK9bgsxd4WYQXbxtKXxYw5f5V8
	 CK72K3R9Mt8kjBJ9wd27pIWdoqXluWMnO3GeJ1AE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9521AF804C2;
	Fri,  9 Sep 2022 09:34:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E5B6F803DD; Fri,  9 Sep 2022 09:34:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4599FF8016D
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 09:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4599FF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="hVi/M4Of"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A9A4D6601FB2;
 Fri,  9 Sep 2022 08:34:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662708861;
 bh=zNSBueW1a9+ysgM0uoEjVV/0yBh6M55W7WUMoLNV9iU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hVi/M4OfDsOClQHIHRxGdUN6r+kDmBjqFhVpdzqFyhLMXFzquFsQUJL9xroW7hWy7
 V6PQYpJq98BI4U2VjYGd4GDdmkWzKuxg7xMnKVW/RrIuxvmxnhCoq9HeprO77IwBe8
 b4SoHT7kWINV6Trz6Mc6EcfN/HZ3ZCO9CTU+ce/eZxpGn1BjzZv77Xeoc7S7upbzqu
 3YltU28Ww7hKTP1nDsHhbJILW+39sw5LC5tLPw7qVd35yHKICX03eXrHcPW4lh4ihk
 pzCD6gDDVY+0njb3CRAi+arcmFS/o8t+nMXu9If7DCtzxz+sGOMbFVMykD44LuwREu
 qHfu7O6aI0r5A==
Message-ID: <37b895ac-2876-4821-b3c7-6bf75c4d701e@collabora.com>
Date: Fri, 9 Sep 2022 09:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 09/10] ASoC: mediatek: mt8186: Configure shared clocks
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <20220908161154.648557-10-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908161154.648557-10-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
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

Il 08/09/22 18:11, Nícolas F. R. A. Prado ha scritto:
> i2s0 and i2s1 are paired input/output connected to the same codec and
> should share the same clock. Likewise for i2s2 and i2s3. Set the clock
> sharing for each pair during the codec's initialization.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


