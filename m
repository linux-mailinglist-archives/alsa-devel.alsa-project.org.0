Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4BD649A63
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 09:52:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24A402140;
	Mon, 12 Dec 2022 09:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24A402140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670835120;
	bh=+TCCovkk1aO9l4Twe3DVfO+F8Eil43Bb8teXw9Jn25Y=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VdNcpvIN6SRYsb5gLmacxVcyMyIws8rALOfO3CLywz4bdHzGiJ2cIIff0hoQvLRa9
	 F9oPL/vyRAFpkKMTreZ1Hfy63hXDnogKAI29EjSN9BPYdaloVqf0NNKADwuwu+DX6k
	 SXe+P6K1b8KzUdRZptHbUZjSLg5qn9nmfPRva+dM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16463F80115;
	Mon, 12 Dec 2022 09:51:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40DABF804D7; Mon, 12 Dec 2022 09:50:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64288F804B4
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 09:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64288F804B4
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=kNTbRx/6
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5D80166016B4;
 Mon, 12 Dec 2022 08:50:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1670835055;
 bh=+TCCovkk1aO9l4Twe3DVfO+F8Eil43Bb8teXw9Jn25Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kNTbRx/6pBe0MLj/3uqg2/HpIYonPNdnQclLvjOkSMixhW4qLpr0hb2xLhbF+vnVg
 LWrdXNJf2x6yaLyCij61DZTIUMFk4gBgJXtrTwr6Dz2IcE8HvlpWlF+ykwz/5aTBpF
 floxa8J9GF3sUWHRxIkdc0wcMuSXozbGOMAxzfFwSaVhjFvSfx+pP+Ah25gebsL3aU
 T9upxykE5i1VentgJeX+8m11NrMKek+2Phv5UWCPyUq2CD4Oger40M9ppy1OyiAst7
 pqzIMYakR7Ik/2u2/LNPFXCC2MUqeAFP3qQogF/e/DJB6pvarq/lleT1z06ZRfNcq7
 QFA0twT9kH7Ew==
Message-ID: <2caaf016-c60d-3f4d-cfcc-e34a5629f359@collabora.com>
Date: Mon, 12 Dec 2022 09:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add sof be ops to check audio
 active
To: Curtis Malainey <cujomalainey@google.com>, YC Hung <yc.hung@mediatek.com>
References: <20221209031053.8444-1-yc.hung@mediatek.com>
 <CAOReqxh=27P7PogzhFr+37XBfRh5Nxu1x46JpdCH=ZRDVhRbeQ@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAOReqxh=27P7PogzhFr+37XBfRh5Nxu1x46JpdCH=ZRDVhRbeQ@mail.gmail.com>
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
Cc: alsa-devel@alsa-project.org,
 "Nicolas F . R . A . Prado" <nfraprado@collabora.com>,
 linux-kernel@vger.kernel.org, whalechang@google.com,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 09/12/22 19:27, Curtis Malainey ha scritto:
> On Thu, Dec 8, 2022 at 7:11 PM YC Hung <yc.hung@mediatek.com> wrote:
>>
>> In MT8195 SOF design, both DSP and audio driver would access audio
>> registers. Before DSP accesses audio registers, audio power and clock
>> should be enabled. DSP will hang up if DSP access audio register but
>> audio power and clock are disabled. Therefore, we add audio pm runtime
>> active checking before accessing audio registers in SOF BE's callback
>> hw_params function to avoid this situation.
>>
>> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> 
> Acked-by: Curtis Malainey <cujomalainey@chromium.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

