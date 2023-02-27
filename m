Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 388BD6A3D82
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 09:54:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90ECF82B;
	Mon, 27 Feb 2023 09:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90ECF82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677488074;
	bh=iEJK2js/QFKtD1YBikNmsiO1EV/a4sU1Z5jrwed3io0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LyhNB6DGtLN4Au9wVtFTgLz0ZZrj6Hc2i3OePHgdtNoQrPkq80peR6UadGOF+ZkfS
	 C/rduJgF6NNVc0CMSf+tm+U5s3r3Bg+pNae+VvWtdW5v6b9ze2EomaODl0oLyyekcn
	 CR3iaj6x7WoS1lIU5KpQNItFLtylQDBmi6gx8tBM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07F4CF80520;
	Mon, 27 Feb 2023 09:52:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCBF9F804B1; Mon, 27 Feb 2023 09:52:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00D4EF802BE
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 09:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00D4EF802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=nXIw6c9u
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 378FD6602E18;
	Mon, 27 Feb 2023 08:52:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677487939;
	bh=iEJK2js/QFKtD1YBikNmsiO1EV/a4sU1Z5jrwed3io0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nXIw6c9uepzxTtSl0nQDclZZXaC9DCFuuldSYTHEf0h67pgRSdtiV/qfdUbljhGVm
	 DhjyeRK5DFNP3Vm3HpG7VssLeohHBMa2gF/KbP6sZUDAA23zeXq39PyQdKmSS7MZKH
	 c1FZPyM9wQYjFDyMK3yduGIkw2lvgrMdDL1tyS2ksFuyTuFoAeo8gQzrRD/8BTae9c
	 UktRx12LOLfLBwJIdzsANnXb6p722Uk++TFxotni6nCh65fFLrmSiZ9TUOWqttwBcf
	 IlrN219DYistwEets45mAoJcObeKRLVTFaWGs1GXOYTOyH3JVWXQIzxMg+xoewVm41
	 FE0taioDTwuuQ==
Message-ID: <6fed4310-f6fb-b1cd-b337-38ac0db1db8b@collabora.com>
Date: Mon, 27 Feb 2023 09:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] ASoC: mt8192: Fix event generation for controls
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-2-9a85f90368e1@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-2-9a85f90368e1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TGN4KUEPPW3XIPB3C2V3AMF5BF5YWFTA
X-Message-ID-Hash: TGN4KUEPPW3XIPB3C2V3AMF5BF5YWFTA
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TGN4KUEPPW3XIPB3C2V3AMF5BF5YWFTA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 24/02/23 15:03, Mark Brown ha scritto:
> ALSA controls put() operations should return 1 if the value changed and 0
> if it remains the same, fix the mt8192 driver to do so.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

