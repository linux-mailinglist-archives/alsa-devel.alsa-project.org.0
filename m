Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F56A3D9D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 09:57:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5690183D;
	Mon, 27 Feb 2023 09:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5690183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677488219;
	bh=EjaYFBwDB7oJOzKkOcfvbq7aToe4HGyjAniTzS7dVhw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A0/+oROKb+bfSyNK/EZPyW8+ncsR6cvAJtoiaUhF7/0K8yaQFaO/d+cmGnEL6fPGg
	 tt0tkD1Fyvwa0/SH9BpetdUI49AHkh/PJM0/NCmnBNyimfrFUEbBjmu8q3pHsFM9DO
	 bNtPTyipSTjiEOQ/32WjWmm9zcqK+HhY5BTpN7zs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E648F8051B;
	Mon, 27 Feb 2023 09:55:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72FB2F8049C; Mon, 27 Feb 2023 09:55:12 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A40FF80236
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 09:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A40FF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=MLMz2grN
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A540B660230B;
	Mon, 27 Feb 2023 08:55:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677488110;
	bh=EjaYFBwDB7oJOzKkOcfvbq7aToe4HGyjAniTzS7dVhw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MLMz2grNB9y1t4yGJYtvRD75Nt9J+f/ogs/R8ktXmFAbKH13/v/9tYE9QwO3c9NEM
	 aOygyoizpYQ9/bN64fSRvRKdUGnZoRBptA+ERmd232Y7fIOlR2SsEyHNx5SKD/nCEd
	 R/JqAN+kB2FnvWH5KFllP037SfHBTbsSIopX8nDg5xm2ol8v5c+K+Fw7MPjlkh3V8M
	 rPRrL89E7Ai8fSbgm3fy8UIKE2i1ti1TyroxwZz0/jQlWO+rpYEyN0FX3in5R5bHc3
	 gcJpzTo1tCn/fEsAC4oWi/cV89pMUYdtjQ25bf0SiZ4/k53jgCz57fE2FQbdQc9wor
	 3Cwmt+bga2vMw==
Message-ID: <d85c5a95-046c-905d-048c-dfe5da7e5f0d@collabora.com>
Date: Mon, 27 Feb 2023 09:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] ASoC: mt8183: Remove spammy logging from I2S DAI
 driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
 <20230224-asoc-mt8183-quick-fixes-v1-1-041f29419ed5@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230224-asoc-mt8183-quick-fixes-v1-1-041f29419ed5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NRIH2APQKWLRHBEADOQAYRPDRTJWFKPT
X-Message-ID-Hash: NRIH2APQKWLRHBEADOQAYRPDRTJWFKPT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRIH2APQKWLRHBEADOQAYRPDRTJWFKPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 26/02/23 13:49, Mark Brown ha scritto:
> There is a lot of dev_info() logging in normal operation in the I2S DAI
> driver, remove it to avoid spamming the console.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


