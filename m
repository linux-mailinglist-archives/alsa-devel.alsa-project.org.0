Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 018BA6BC981
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 09:43:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5C831144;
	Thu, 16 Mar 2023 09:42:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5C831144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678956190;
	bh=Gd7Vc/x1hTti5XFqGotRWQCbvm7OXZRiPQYoT2BOsQk=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=ArtXmuiV8zA+i/DeoOGnvRmHCCkdeCzBBrD0Fvs+2/lFzuhocjgnrSIKO3fKYLtrp
	 +lRtjNQXWMXyq5k4fleO5jbfPIVeQF6ftzZW/OfZa5EmkxHdJE0CZ87yUF9MsIpsbQ
	 TC8PZ2V4Gtyzl09WxMqXQAq1AE9+PQV1VaQU8ZcA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E9D6F804FE;
	Thu, 16 Mar 2023 09:42:19 +0100 (CET)
Date: Thu, 16 Mar 2023 09:42:00 +0100
Subject: Re: [PATCH 107/173] ASoC: mediatek: mt2701-afe-pcm: Convert to
 platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-108-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-108-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AELEGNKXPNCQ4X3ZWR3V3JKMIL7HRNOZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167895613807.26.7982939456994247360@mailman-core.alsa-project.org>
From: AngeloGioacchino Del Regno via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59218F804FE; Thu, 16 Mar 2023 09:42:14 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D393F8016C
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 09:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D393F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ijImz1+J
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4828C660309C;
	Thu, 16 Mar 2023 08:42:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678956124;
	bh=cG6H7BTbIv6IpK2irAivbNXa/2Qr4JqONKmvATOLV8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ijImz1+JQAmDxTa9tJTv5P0BZl460gGJZaDLPFTqLq25jdVRfa9y6dE3GYvwyLsKj
	 zTgSU28UYOlSzBXNTtPNZ70VlI+AKHbHEZ5fTJvhWjR4Da5+mVQkYri0L0hMGfHDlu
	 Nclmybo8CmrweRlCxrQPBML0zs2YzNwsz3p9MPM+S33RVyTkJzm4zgkPomOSVEXiCG
	 x6tBo/AM2IiUvudxG/PsdIiWiBwvOUoB+TWH4rodMTp8nNXcvBtnbQd6XzXjncM2ma
	 r0o1VsC7KLoA/4vdx1v+Go8/xX50khaxwvA/ebD6a23b6hEVMV/MeOYnvSKviBQ7yt
	 sO/gOy6NJ1MWQ==
Message-ID: <c99b261c-6859-c5c5-1aea-780b1c8fe381@collabora.com>
Date: Thu, 16 Mar 2023 09:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 107/173] ASoC: mediatek: mt2701-afe-pcm: Convert to
 platform remove callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-108-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230315150745.67084-108-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AELEGNKXPNCQ4X3ZWR3V3JKMIL7HRNOZ
X-Message-ID-Hash: AELEGNKXPNCQ4X3ZWR3V3JKMIL7HRNOZ
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AELEGNKXPNCQ4X3ZWR3V3JKMIL7HRNOZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 15/03/23 16:06, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


