Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5946A3DA0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 09:57:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED61A82A;
	Mon, 27 Feb 2023 09:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED61A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677488258;
	bh=Nabh2V3OhfcdWUDcOgtZ+8q4mnBT1gOqHJmj56Q2ln8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uXGjxdJvTnH+kWJiEHDd5EdanTyxdqBSFyzdPbn82kl5Awi1xlbtiI4vsujZ+KzOT
	 WlowQLglGfdsI5yYxr2vF9AlW8uo1X5uH0BqX57SLeKTGwVQJHk0SXxFjWwEyAOSX8
	 AQLk5pH9M42OghOjHVnwMFDzIy8AvN1layAP3mCs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA4DF80548;
	Mon, 27 Feb 2023 09:55:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79E2CF8053D; Mon, 27 Feb 2023 09:55:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F4C6F804B1
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 09:55:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F4C6F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=lAK/EojY
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DAA256602E52;
	Mon, 27 Feb 2023 08:55:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677488118;
	bh=Nabh2V3OhfcdWUDcOgtZ+8q4mnBT1gOqHJmj56Q2ln8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lAK/EojY2B0ppNnfEoiGIf9axgtiRFTXBhAKa2/osAwrX5sP6PdRA/Hv/q3mSeo9v
	 FcDO4DpeZlSS4Mo3I6myLQkVra0p7nTbp4juLNy9S3u5/ifgOMLudLfU+wxvcZPbeq
	 GjXAdxILZULTkUTUMLGnY2KBvWbZcD7hMdI0zzLGUEnGlLHjkdgjKyx8JHldeVq34D
	 MlHiq/GKV9nSAZTFJCu0uGFKLWAkbBze3Pm940zcYSuyVxmljSy1DwIKmbGq/p11+u
	 qxxnUfq3ewwFTW3+uuhXYsKS/Xi7bbfb9397ovnBEHvxk8HxJNBouItqpo0lXiy0rw
	 TEQKod/dDxN5Q==
Message-ID: <68feed7a-a416-c1d6-7564-173313792ff0@collabora.com>
Date: Mon, 27 Feb 2023 09:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] ASoC: mt6358: Fix event generation for wake on voice
 stage 2 switch
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
 <20230224-asoc-mt6358-quick-fixes-v1-1-747d9186be4b@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-1-747d9186be4b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QP4UQWA5DDI7W76XCAA3ZMAGD4KC6URY
X-Message-ID-Hash: QP4UQWA5DDI7W76XCAA3ZMAGD4KC6URY
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QP4UQWA5DDI7W76XCAA3ZMAGD4KC6URY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 26/02/23 13:47, Mark Brown ha scritto:
> ALSA control put() operations should return 0 if the value changed so that
> events can be generated appropriately for userspace but the custom control
> for wake on voice stage 2 doesn't do this, fix it.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


