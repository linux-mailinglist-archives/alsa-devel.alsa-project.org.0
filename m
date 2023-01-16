Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029866BA79
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 10:35:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1D4F52ED;
	Mon, 16 Jan 2023 10:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1D4F52ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673861706;
	bh=l4d/nOWEMwXLposanFY9XKP6QnAoGbIqo4G/neYks9o=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V4f2zXV2xB7OkohLqz2FldaOLOw2UrRiSmFNZ9Qmk1cFJQ+F4yrje2pwounmqNfUG
	 +E7PhPM6kmc3XPgIvyvFK5woAYSHnTcuRrsqWK1huxscGdVHyFD58ifhskuSlVi1/z
	 QKnrvOveyrKyoT3kt4C439383PPEg9cj2V6pTA3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65419F8023A;
	Mon, 16 Jan 2023 10:34:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F25F80482; Mon, 16 Jan 2023 10:34:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0AC7F8023A
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 10:34:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0AC7F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=LgGE1XHp
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 041256602BBC;
 Mon, 16 Jan 2023 09:34:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673861649;
 bh=l4d/nOWEMwXLposanFY9XKP6QnAoGbIqo4G/neYks9o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LgGE1XHpi12/cbaHd5nS1YmPfwt0H+LxxnXyHY+5nqqHsehK2yXFaPdVk6nGpimSG
 mIPiCaYJ1Pe1ChCC8RFscpBoly3H9be/v3SGuoy/1CrTWeQOZi5TgcuYpyyRje2FuY
 VW+KvDQ/ymHou8l/HqxR8mlvsYEnzv4fzcF/4dia1o5KZc6Eg40MJ7Mk4kuKQSbhKr
 SnkJ7IBTD8gBvQ+95Km5vI7c0QjmRBQkfQtbpP9AsDDFbtQHEkwTgyyjyB5avUPiNp
 ZvHdzzu5gquJiT1UzeJkgGjVHNJdeKNEfJqqz4XP2kYuS9aDwzBwDo/EA1VoZTgNLz
 IH7T9Qyp18pVQ==
Message-ID: <0a129474-a3c4-eaf8-26be-1d1acf5c3513@collabora.com>
Date: Mon, 16 Jan 2023 10:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND,v5 11/13] ASoC: mediatek: common: add soundcard driver
 common code
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20230116034131.23943-1-trevor.wu@mediatek.com>
 <20230116034131.23943-12-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230116034131.23943-12-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 16/01/23 04:41, Trevor Wu ha scritto:
> Add common code to support of_node of codec parsing, so codec phandle
> can be assigned by sound-dai in dts.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


