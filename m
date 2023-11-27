Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB97F9BB5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 09:29:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 813BA847;
	Mon, 27 Nov 2023 09:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 813BA847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701073794;
	bh=zkIajtumZwqOpyIXYiKzh7afVZjXgDnAjVN67KB4Nlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DidPbedxh5VboyWsqeRuevMDIe4Uq3MAL1JK5iHf8Kuofnt5sFRh8UczCAI2l6XnA
	 +PmwsCgVgg/PjQnh2CMCNzDsL53WR7e1VMeC6IGKpH1J0DQMG39ygVy4IeA/DqhPWk
	 RTU5fsqUICVbfcc8cYBeKn7/BDMuchdN/gPGBG40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA637F80580; Mon, 27 Nov 2023 09:29:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED0EF80254;
	Mon, 27 Nov 2023 09:29:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AD9BF80236; Mon, 27 Nov 2023 09:29:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30C79F8016E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 09:29:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30C79F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PCG7Yqk0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8A0D6B8345C;
	Mon, 27 Nov 2023 08:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E8AC433C7;
	Mon, 27 Nov 2023 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701073738;
	bh=zkIajtumZwqOpyIXYiKzh7afVZjXgDnAjVN67KB4Nlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCG7Yqk0IfGUKmVsDhCjnubH3mc95XUFU5wIkJ8Rlwey4P+qEJXOJ3l7F3h9zUWPJ
	 su8x78HsvwdKDB3OJNkqZpkMCbcdDSwePwhUXt7TQZFqZtfOFHUez30wk2US3dNJ3m
	 PE3Z/Lpa/b+UaLCXu6ElIJv4IVfVNFHeAPHUFqSeRGgB8k3XEt7UcUe6hVJMlmY+2w
	 QMUzXjEb0XZzEtVszH8qAsqiWoTzB8+wQ0U5Z8k7x1msftlCUxb5amAz1XSqcIGp4F
	 bT5ju7o3CLSNJEUo2KLoicEkJrKPrJx6qkpJqErcK+yjk8rcF9LmVuWwej6k8Y3CQ+
	 SQwgxxmUwTGTQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r7Wzc-0002jY-1S;
	Mon, 27 Nov 2023 09:29:24 +0100
Date: Mon, 27 Nov 2023 09:29:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/1] ASoC: soc-pcm.c: Make sure DAI parameters cleared
 if the DAI becomes inactive
Message-ID: <ZWRTZLi9SqarEUXa@hovoldconsulting.com>
References: <20230920153621.711373-1-chancel.liu@nxp.com>
 <20230920153621.711373-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920153621.711373-2-chancel.liu@nxp.com>
Message-ID-Hash: CJ5KFACN6YH5726TQQ6O5R2PHBRI252T
X-Message-ID-Hash: CJ5KFACN6YH5726TQQ6O5R2PHBRI252T
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 20, 2023 at 11:36:21PM +0800, Chancel Liu wrote:
> The commit 1da681e52853 ("ASoC: soc-pcm.c: Clear DAIs parameters after
> stream_active is updated") tries to make sure DAI parameters can be
> cleared properly through moving the cleanup to the place where stream
> active status is updated. However, it will cause the cleanup only
> happening in soc_pcm_close().
> 
> Suppose a case: aplay -Dhw:0 44100.wav 48000.wav. The case calls
> soc_pcm_open()->soc_pcm_hw_params()->soc_pcm_hw_free()->
> soc_pcm_hw_params()->soc_pcm_hw_free()->soc_pcm_close() in order. The
> parameters would be remained in the system even if the playback of
> 44100.wav is finished.
> 
> The case requires us clearing parameters in phase of soc_pcm_hw_free().
> However, moving the DAI parameters cleanup back to soc_pcm_hw_free()
> has the risk that DAIs parameters never be cleared if there're more
> than one stream, see commit 1da681e52853 ("ASoC: soc-pcm.c: Clear DAIs
> parameters after stream_active is updated") for more details.
> 
> To meet all these requirements, in addition to do DAI parameters
> cleanup in soc_pcm_hw_free(), also check it in soc_pcm_close() to make
> sure DAI parameters cleared if the DAI becomes inactive.
> 
> Fixes: 1da681e52853 ("ASoC: soc-pcm.c: Clear DAIs parameters after stream_active is updated")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

For the record, this change incidentally also fixed the remaining click
sounds I heard when stopping pulseaudio (e.g. on reboot) with the Lenovo
ThinkPad X13s, which have also been discussed here:

	https://lore.kernel.org/lkml/ZTukaxUhgY4WLgEs@hovoldconsulting.com/

Johan
