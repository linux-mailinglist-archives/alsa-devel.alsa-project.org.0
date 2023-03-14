Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6636B8D58
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 09:32:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC457144A;
	Tue, 14 Mar 2023 09:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC457144A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678782733;
	bh=SyRjQwNb2TkJVrz2UqDUCTgr/EKJCFDz2Ylx+j8B7oY=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=iJlZesJhH7oHRzEKNiiFbNG1GVhb8kRFPNvRH9QNsXC3ojObJUcORQA0e4CUJYp6j
	 jzzZIKZtPvj2nsC//uF65T3zuFQwdk5LNpzYSdI8TH2UgFOOb2LQlkVW9J5UrBpuHQ
	 c9bYuyJKLjLpuyajHST18GHoPgBB3OfioD9I+V1I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C6ACF80423;
	Tue, 14 Mar 2023 09:31:23 +0100 (CET)
Date: Tue, 14 Mar 2023 09:30:17 +0100
Subject: Re: [PATCH 2/2] ASoC: mt8192: Move spammy messages to debug level
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
 <20230313212908.2282961-3-nfraprado@collabora.com>
In-Reply-To: <20230313212908.2282961-3-nfraprado@collabora.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5SGLFHDPTQDZL24DGM23NW7WA5BR5L4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167878268327.26.2490909441321922915@mailman-core.alsa-project.org>
From: AngeloGioacchino Del Regno via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 655EEF804B1; Tue, 14 Mar 2023 09:31:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B401F80272
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 09:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B401F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=bgpZlO8/
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E06206603089;
	Tue, 14 Mar 2023 08:30:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678782620;
	bh=7O502ynukGGELoy5eu2smTVAZg2WvwENXfr+mfABoa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bgpZlO8/yAK9Qd9L/27Jk63Ds6t31aAvwlnTD71nc3k/kJLkmhOY3yzU5BjKcNo5W
	 KxEpxBnf9wLDAWdPE2gbsIeEZWuN6ubgCgWVHQbATElIpA7Vz0Qx62wREsoekrmbRz
	 2Yp4vK8AQ+jXsSXvLj2Xc7vhIZ93sC1+Q6fQdFRv2w9Ro1ZOQFjwu16dPa91+ewWow
	 fE0+ophxfOYrV+4QYg9dqUrIXsY02OUkWrFMDT2vQcAcNygHA37mD8cKGspj7nXJwM
	 oh5UdE6yDUiJcjKQ9W/PbELp3qFIA56/SKOyPFQdGWmTfHY9R3KP2VEkn645bt2FRv
	 Bt10L7gE24aKA==
Message-ID: <61425c0f-a486-1503-042b-9327f414684d@collabora.com>
Date: Tue, 14 Mar 2023 09:30:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ASoC: mt8192: Move spammy messages to debug level
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
 <20230313212908.2282961-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230313212908.2282961-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D5SGLFHDPTQDZL24DGM23NW7WA5BR5L4
X-Message-ID-Hash: D5SGLFHDPTQDZL24DGM23NW7WA5BR5L4
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kernel@collabora.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5SGLFHDPTQDZL24DGM23NW7WA5BR5L4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 13/03/23 22:29, Nícolas F. R. A. Prado ha scritto:
> There are many log messages throughout the mt8192 sound drivers that
> print to the info level and are triggered very frequently. Move these
> messages to the debug level to avoid spamming the console.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


