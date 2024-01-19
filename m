Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDF2832C5C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 16:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45372DE;
	Fri, 19 Jan 2024 16:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45372DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705678075;
	bh=X/xd67Fr3PvF8lGpTMnDOMiobvUDHSVg02IBNzMqNGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bfw4DE9N15CtEKKJxz8b9DHKLVFSHUPUbq/RJpyzz6UrQmL2o83+eMcnEoT7lOy/j
	 sK/6XBxvP9A9twcdeH3h4tp01XP32FoDhl+tWeTjxJFrnlVD/nP97UGf9aizD8Q4Qe
	 juNe9Ns9BDtboPS06WqreJiE3ZPODVFfLLPHXi/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F993F8057E; Fri, 19 Jan 2024 16:27:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3409F80236;
	Fri, 19 Jan 2024 16:27:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9775EF800C1; Fri, 19 Jan 2024 16:27:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00495F800C1
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 16:26:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00495F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Smz9BHF+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F7E4CE21FC;
	Fri, 19 Jan 2024 15:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD31C43394;
	Fri, 19 Jan 2024 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705678011;
	bh=X/xd67Fr3PvF8lGpTMnDOMiobvUDHSVg02IBNzMqNGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Smz9BHF+haNafasg95JGgtPJYBBHgYlY+/gV8naiOscTv4jh4wJ879u65MnftYq6a
	 HAUOFwKH1cDjAP5MHxOW36tw5KQInht3bZQ1BFVITR9Yzm9vXVmKVdow6S4SYtSqgK
	 5P9fluDHo1/AH/VYLojyr6pEutOZvF53QmF8Xmc9bryktDxd8fom/RgoGR4lzDD5cG
	 FPvOP3M7jePnZwQt9kQ2nPtv/mNf/zvOtRaTKCxC8PanmTYg2fMFrtE0YKiXhr1Y2l
	 +80VKww/UwvBAfTpHO80c6pItmi8s1lvnZOvi9cprM9bVTGTVr9tUZgiS4FYb1QGtl
	 TxW5g3tXcywrw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rQqlo-0004QS-00;
	Fri, 19 Jan 2024 16:27:00 +0100
Date: Fri, 19 Jan 2024 16:26:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: qcom: sc8280xp: limit speaker volumes
Message-ID: <ZaqUw-9XulJGKH7v@hovoldconsulting.com>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
 <20240119112420.7446-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119112420.7446-3-johan+linaro@kernel.org>
Message-ID-Hash: SDA5KEAW56ZP2AQOZDZBM2HAII5SMVHH
X-Message-ID-Hash: SDA5KEAW56ZP2AQOZDZBM2HAII5SMVHH
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SDA5KEAW56ZP2AQOZDZBM2HAII5SMVHH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 19, 2024 at 12:24:18PM +0100, Johan Hovold wrote:
> The UCM configuration for the Lenovo ThinkPad X13s has up until now
> been setting the speaker PA volume to the minimum -3 dB when enabling
> the speakers, but this does not prevent the user from increasing the
> volume further.
> 
> Limit the digital gain and PA volumes to a combined -3 dB in the machine
> driver to reduce the risk of speaker damage until we have active speaker
> protection in place (or higher safe levels have been established).
> 
> Note that the PA volume limit cannot be set lower than 0 dB or
> PulseAudio gets confused when the first 16 levels all map to -3 dB.

I tracked the down the root cause for this, which appears to be a bug
(feature) in pulseaudio that causes it to reject the dB range if the
maximum is negative:

	https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/447

This happened to work with v3 which limited the PA volume to the single
lowest setting, but would similarly break if anyone wants to set a -1.5
dB limit.

Johan
