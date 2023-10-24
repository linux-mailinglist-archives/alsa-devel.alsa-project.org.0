Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0817D4A11
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 10:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C03D850;
	Tue, 24 Oct 2023 10:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C03D850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698136232;
	bh=y6VQewPIt6l+bjj3DnPMyynt5aWnCBl8s5jWO+bDUOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sAjFYF8C6WAXAk9aikrBzAU4pG7pQjqE0BcYda+aGwyaJm+p4/oJEiJM8Ld1kbZ0/
	 pfLNAQ7sNE1728T+rC35aqL565ezSYS7PxUsVPGPAyz+pJr+zbXlpwdYQEoJugOcpv
	 JosuX6/mcxWBSoaNxxZVwd4rfssqH65ulqHpi8YU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9820FF80557; Tue, 24 Oct 2023 10:29:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C680F80157;
	Tue, 24 Oct 2023 10:29:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18132F80165; Tue, 24 Oct 2023 10:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F5F8F80152
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 10:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F5F8F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=NRTXXfLV
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C5BB566072F1;
	Tue, 24 Oct 2023 09:29:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698136167;
	bh=y6VQewPIt6l+bjj3DnPMyynt5aWnCBl8s5jWO+bDUOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NRTXXfLVPezJQBP3em8vk4+lrxWFVXd5zmibFfHwIXDlZf39BQJN2dOLTfgIrgEvp
	 cVhfOszGsMBPHWlqYMva/TtD/IeXaQ5apoe3LG6eeZ+IfVD3SbjUllbqJpaBvWvO+A
	 TSSnpYz8XWANuuDznv25Syg9J76Sj32qvoUw/spfCsgoeVmroBv2ah48ACzLnJMi8x
	 tAVUqh3dspHH3CtjMnX1LX6S9UFxlRv2r2mWgjL5kQUPc0TLd/B4ef6bCOIO/P7s3i
	 FyIZPtXXG9xY3Armm3LLkbtWhI211fnYYNfpYM16co2gtGy6LVNYYZiwpp10K+y9bM
	 d8BsI4F+bDt6A==
Message-ID: <624ec4b3-1b0b-4880-a0dd-2379d3c3d0c0@collabora.com>
Date: Tue, 24 Oct 2023 10:29:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] ASoC: mediatek: mt8186: remove redundant
 assignments to variable tdm_con
To: Colin Ian King <colin.i.king@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231023151704.670240-1-colin.i.king@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023151704.670240-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CYRB5AKC5GUZB36HWRJATLXOOXAGYW2V
X-Message-ID-Hash: CYRB5AKC5GUZB36HWRJATLXOOXAGYW2V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYRB5AKC5GUZB36HWRJATLXOOXAGYW2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 23/10/23 17:17, Colin Ian King ha scritto:
> There are two occurrences where variable tdm_con is being initialized
> to zero and the next statement re-assigns tdm_con to a new value. The
> initializations are redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


