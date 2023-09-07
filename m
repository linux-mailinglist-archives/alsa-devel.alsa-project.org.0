Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9703797493
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 17:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4BA0950;
	Thu,  7 Sep 2023 17:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4BA0950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694101207;
	bh=tteNpLIFLw5MS+k+dFBVbckGuhwk/VpXStJ/V7Yltdg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O+MOZaK4r+0fDT9QTpjJfozCSm85n4iYyspNLvFn0+8mnlZgHYLUg5O+s6bXttREQ
	 4+BMIGZQYD3NvkXdXDMo0hf8W6cajDdh5OzEsgEndTXgQ3Xw/Dl00WL9pvnXX8vGIu
	 8T+Tm4WSWsU0vuGtM0f64ZwIasvrHlzpeeZOpNd4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE0D5F80494; Thu,  7 Sep 2023 17:38:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73D16F80431;
	Thu,  7 Sep 2023 17:38:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50120F80494; Thu,  7 Sep 2023 17:38:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCF7FF800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 17:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCF7FF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vBDAI4/P;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EwXU7EZK
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5352521860;
	Thu,  7 Sep 2023 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694101131;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZEqj/TaMjwHlTs/viCIGXa1aFhlVcHEDbr8DfvrhoN8=;
	b=vBDAI4/PiCVn0AfPsBB++vFHV29E9kYYThDdSDAKY8U39NWoxg3qaUZwqlvn9vYxMrxsI5
	7y7Vcvo8lubTaAyvP76ZYuxoesuoQxlimCWSz8rDvbXICY4YT2m9tw53ueSspATKfQ54Jn
	+EM58KQCjqr6sU+x5BuX5wPA9ONiojI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694101131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZEqj/TaMjwHlTs/viCIGXa1aFhlVcHEDbr8DfvrhoN8=;
	b=EwXU7EZKC+nUnxytU6JT1R0nmGcVE9XPQDvpF0P0Gr8AQTIgiw7A2ewAsWC2zsCm174trU
	JAEhfGyY/upGdvCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B42B5138FA;
	Thu,  7 Sep 2023 15:38:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id R8TKKoru+WTZAwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 07 Sep 2023 15:38:50 +0000
Date: Thu, 07 Sep 2023 17:38:50 +0200
Message-ID: <874jk6at85.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<lgirdwood@gmail.com>,
	<andersson@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<gregkh@linuxfoundation.org>,
	<Thinh.Nguyen@synopsys.com>,
	<broonie@kernel.org>,
	<bgoswami@quicinc.com>,
	<tiwai@suse.com>,
	<robh+dt@kernel.org>,
	<agross@kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<quic_jackp@quicinc.com>,
	<quic_plai@quicinc.com>
Subject: Re: [PATCH v5 12/32] sound: usb: Export USB SND APIs for modules
In-Reply-To: <20230829210657.9904-13-quic_wcheng@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
	<20230829210657.9904-13-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: PPG53LZMO2X6IJYCO6PXC7UX7OMJUQUI
X-Message-ID-Hash: PPG53LZMO2X6IJYCO6PXC7UX7OMJUQUI
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPG53LZMO2X6IJYCO6PXC7UX7OMJUQUI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 29 Aug 2023 23:06:37 +0200,
Wesley Cheng wrote:
> -/*
> - * hw_params callback
> - *
> - * allocate a buffer and set the given audio format.
> - *
> - * so far we use a physically linear buffer although packetize transfer
> - * doesn't need a continuous area.
> - * if sg buffer is supported on the later version of alsa, we'll follow
> - * that.
> - */
> -static int snd_usb_hw_params(struct snd_pcm_substream *substream,
> -			     struct snd_pcm_hw_params *hw_params)
> +int snd_usb_attach_endpoints(struct snd_usb_substream *subs,
> +				struct snd_pcm_hw_params *hw_params)

This doesn't only "attach" endpoints, but it does more other things
that are needed for PCM hw_params procedure.  I'd rather keep
hw_params in the function name instead of creating completely
different one.

Ditto for hw_free.


thanks,

Takashi
