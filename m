Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A495F0678
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 10:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72865167A;
	Fri, 30 Sep 2022 10:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72865167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664526738;
	bh=hyzAPdeSGpzLQiqFjtdw3u+LQdIwNgVeLAnrDszyXUc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XkewzS38R5dhjS0NHrQajQ9iRKGrFTLq1QkS4osYRe7p7Jbptqd0MxLb9LrcTWKhP
	 RcyWTGS7vSvUoMp5l6xcV3Dx2lovI/yfrDtml1CTt40Ueo/ooJhf1iAsKvd63U6S97
	 EYK+65Q+D6VmR1wSP2hBF6vZQIiR/dMWa0XAEUAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E49A5F800AA;
	Fri, 30 Sep 2022 10:31:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E78B8F80155; Fri, 30 Sep 2022 10:31:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C52D6F800E8
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 10:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C52D6F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="bx7NwB7o"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 02D0066022BC;
 Fri, 30 Sep 2022 09:31:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664526672;
 bh=hyzAPdeSGpzLQiqFjtdw3u+LQdIwNgVeLAnrDszyXUc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bx7NwB7o+zEJHuy1oiC7fF5w0uTmDeG0jn/Yas48CisfPf2O/6C7qapFGW5BSsTjt
 ioRN5aq3EDcFInODuNhuPH//Q93ymyHk5mUBTLT+8L7eBNi75DI+nqj91m8LN7vpNL
 fIiwyaeOux/MdfGk+wn08ABf5jhxChB7KzHRveSC9wj2oEGHVLH1NX2zDkKrBXK8kf
 ZSg6F+tYYsMPWZUf2ySce0a6b87Vib5eurcHzZjCtIyMjuaQZdU1NQFa1F0CJp4T6J
 hEI85V/S4JoH0mtBvph0f0Lv75K2/rZCKcDsZB0JorJwm5ASr/VZtvvK8EIwTs74NB
 aRf2Slw9bcoBg==
Message-ID: <2d378b26-2e08-72ee-a032-20aec436b6f4@collabora.com>
Date: Fri, 30 Sep 2022 10:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] ASoC: mediatek: mt8192-mt6359: Set the driver name for
 the card
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20220929205453.1144142-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220929205453.1144142-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Miaoqian Lin <linmq006@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
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

Il 29/09/22 22:54, Nícolas F. R. A. Prado ha scritto:
> The ASoC core automatically populates the driver name field in the card
> from the card name if left unset. However, since the driver name can be
> at most 16 characters long, wrapping will happen if the card name is
> longer, which is the case for the mt8192-mt6359 driver.
> 
> Explicitly set the driver name for the card in order to avoid said
> wrapping and have a readable driver name exposed to userspace.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


