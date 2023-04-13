Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2688D6E0E65
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 15:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED37F1B;
	Thu, 13 Apr 2023 15:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED37F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681391979;
	bh=LlTlpOSLIFeGkBTNYqnmnhJMP5bmVkH3Olp1rQGN9eU=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=aVSN0rv3c7WgUf2pYJxkiwsjaKpasf1f9kdy24VcZaEV9t+bXCkDrB0Sp1GWRtmgi
	 bI5D0C7LWbf9foJc0f1WjT7fNwaK2UNUll0uBvAR006NzpvtJzBfzBOm+3Ivq9KU+j
	 PRFOPIc9fAH02LPZiZwzNWd3ezBtTN6Y3gLNkGVM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A53BF804F2;
	Thu, 13 Apr 2023 15:18:02 +0200 (CEST)
Date: Thu, 13 Apr 2023 15:17:40 +0200
Subject: Re: [PATCH 1/7] ASoC: mediatek: mt8188: remove supply AUDIO_HIRES
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-2-trevor.wu@mediatek.com>
In-Reply-To: <20230413104713.7174-2-trevor.wu@mediatek.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDMFGF4RVDILLXPQWRYMWN3VAAIQQB7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168139188055.26.14928988090322368867@mailman-core.alsa-project.org>
From: AngeloGioacchino Del Regno via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE47BF8032B; Thu, 13 Apr 2023 15:17:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6B72F800E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 15:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6B72F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=YJVtAcCK
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F5626603218;
	Thu, 13 Apr 2023 14:17:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681391864;
	bh=AKdwCtT8AfTALdA/zT12K56nin3cggmWrGxfMSOgZfU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YJVtAcCK0erupdx7mB0Yi+0evnU4PRAj7tacSem0um7VfGlqlvhRaRAD4yWjHmsQ4
	 f3sgHre/YRWFk2c5CxLvY7rqKMU4k0d8WON0H25AUVd3quopPamB7MniHkDSkAYbAu
	 IwglaX143kKSBm3a/T4fgG+eybIGrSXbMNkpjWVCDD7z3JxGF0Mw6AgSRvvdpad1DQ
	 1CXmFCfGfURTcyCokZKs4jk9z7CsjLB2i+G9KbMfrLZHFnRM0mnATSTRoD+N4pjoE1
	 oqBkCfpKQeTYKDUXvyEevV2FDXqDWmdrpGAheRQBijSKpb4UQjQU2w0a0l+eDyWQK7
	 AL7Vw7RWcPEuQ==
Message-ID: <b59fd0d6-b08e-9c80-a2f0-6b6084038353@collabora.com>
Date: Thu, 13 Apr 2023 15:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/7] ASoC: mediatek: mt8188: remove supply AUDIO_HIRES
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-2-trevor.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230413104713.7174-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MDMFGF4RVDILLXPQWRYMWN3VAAIQQB7X
X-Message-ID-Hash: MDMFGF4RVDILLXPQWRYMWN3VAAIQQB7X
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDMFGF4RVDILLXPQWRYMWN3VAAIQQB7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 13/04/23 12:47, Trevor Wu ha scritto:
> AUDIO_HIRES is not required in MT8188. Because top_audio_h is disabled
> when hires clock is not used, set_parent is a redundant operation.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

