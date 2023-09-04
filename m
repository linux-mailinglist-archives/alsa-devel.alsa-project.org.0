Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D4D791399
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 10:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1994B825;
	Mon,  4 Sep 2023 10:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1994B825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693816667;
	bh=95fRj8cpZa7uWjfFUAP1aAqIMJzKCDnQz0gfY4gwKkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GSpVVg+s9UPCTp33SF/O/8A7ET8g7etPLeWb94WKVfKO5KBDECOCw755Tr4nuP0B0
	 KbfD7DdwfV9glZkxM5/YcUyZX4vGUFA/LauSm39fL6HldAdqbcIeKPnPb+cWdKcdgZ
	 XEjhmoCSStCwC+28sq0PMXU9RILSiax4KkBUfzaU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F9F2F8047D; Mon,  4 Sep 2023 10:36:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2820DF80431;
	Mon,  4 Sep 2023 10:36:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F2F0F8047D; Mon,  4 Sep 2023 10:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEB94F80141
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 10:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEB94F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=khqvwN1L
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7405D660727F;
	Mon,  4 Sep 2023 09:34:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693816488;
	bh=95fRj8cpZa7uWjfFUAP1aAqIMJzKCDnQz0gfY4gwKkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=khqvwN1Lr+jaHM9QrdEdIdn77+1NkegUGk6y97QZgGhkC3Kk8Nte2+Xlmy8z0OMT5
	 /Dc/CAryTtk8bwJAdnR3eaK2MEywHJuR9ZsX5iGuhk5HxL0WyWzzNGGiBnIgDnflIN
	 gwJPl98nqnkNNVCgSUEUYeGrV22sAzf11+yzJWaQjfNKu40+Re8/Q9IfkXkE5WAt1Q
	 e6sslU1hpMxJD+1O1GUd66flJNWoqGIRzuzDGMZNMSzTsvjqW07RBj/3abKAXWAzmt
	 Kf4gW4azpEkLjfU6D/03qhX5aGx855JD9wWMVfAGRg2lza6vk75KejsIqUS+ymgUx6
	 2KsKZ+ptsgbeA==
Message-ID: <40013c91-4941-1d03-1aa2-083bd6b44afa@collabora.com>
Date: Mon, 4 Sep 2023 10:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND,v3 2/3] ASoC: mediatek: common: revise SOF common code
To: Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230825024935.10878-1-trevor.wu@mediatek.com>
 <20230825024935.10878-3-trevor.wu@mediatek.com>
 <ZOiCVCJMaNX9Xhgy@finisterre.sirena.org.uk>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZOiCVCJMaNX9Xhgy@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2DXUQH427HINL6WWYQ5CI2XH3ZDP62Y4
X-Message-ID-Hash: 2DXUQH427HINL6WWYQ5CI2XH3ZDP62Y4
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DXUQH427HINL6WWYQ5CI2XH3ZDP62Y4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 25/08/23 12:28, Mark Brown ha scritto:
> On Fri, Aug 25, 2023 at 10:49:34AM +0800, Trevor Wu wrote:
>> Originally, normal dai link fixup callback is overwritten by sof fixup
>> callback on mtk_sof_card_late_probe and it relies on the mapping defined
>> on struct sof_conn_stream.
> 
> Angelo?

Sorry Mark, Trevor, I was on vacation, far away from my workstation :-)
Thanks for the ping on this one btw!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
