Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C289872DE5F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 11:56:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D92B8827;
	Tue, 13 Jun 2023 11:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D92B8827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686650197;
	bh=kDt+MeozlcPfE384o/5LKd64kj66NomoX9MvBxwk8PU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bx2OmzxOM48xt8gO4/dQTldTaTey0spgmYV0LHPTmfUoQlDjfIWC+SGFNfo660skO
	 yzous+6y9bGvSAzY4W27dmZJHe6ffJT0IKBIgD8LFO5/bhl2gRFFt/JKf6DqWZiS0k
	 eTK6faw/aYKjYrF7m2n0MdRvXd2I7nYs+yP+tm1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F3CF80093; Tue, 13 Jun 2023 11:55:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 480B1F80093;
	Tue, 13 Jun 2023 11:55:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A96F7F80149; Tue, 13 Jun 2023 11:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21DFDF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 11:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21DFDF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Mv/vVjRT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DY+yVkmY
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 69EA81FD6D;
	Tue, 13 Jun 2023 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686650117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P265Uv6CcvavmFR5gq/Gw0Drohun0A3BXfzFYfOVCjk=;
	b=Mv/vVjRTUYdmUgz4jK2/qs07f2XV91aV9ZgTpFL6ExMcWzsCOtCR2JbwR2U2Iy23moqcKG
	X/of1TalAJHkt72TBvolS67yyXUdpWwFP3FWiT9DEIdP1dHCQRbXsCPWvyOaN5Egls6IKk
	ZaQ3fncZaBX7/q2E6sPH6SL5zfXPQQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686650117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P265Uv6CcvavmFR5gq/Gw0Drohun0A3BXfzFYfOVCjk=;
	b=DY+yVkmYUjd9A5eaevhIWViGx4qzSfwb9m2rqdAiEobI3Zm7emi0inBNNvdYoPDgLmK6Jp
	sWaG0xrxLrG3/JBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2FECC13345;
	Tue, 13 Jun 2023 09:55:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id LcSkCgU9iGS+YgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 09:55:17 +0000
Date: Tue, 13 Jun 2023 11:55:16 +0200
Message-ID: <87mt13elff.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Thierry Reding" <thierry.reding@gmail.com>,
	Sameer Pujar <spujar@nvidia.com>,
	<alsa-devel@alsa-project.org>,
	<linux-tegra@vger.kernel.org>,
	"Oswald Buddenhagen" <oswald.buddenhagen@gmx.de>
Subject: Re: [PATCH] ASoC: tegra: Fix Master Volume Control
In-Reply-To: <20230613093453.13927-1-jonathanh@nvidia.com>
References: <20230613093453.13927-1-jonathanh@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: RE5WXOE7VIWLQR3D23LLB2BCEOFVYTH2
X-Message-ID-Hash: RE5WXOE7VIWLQR3D23LLB2BCEOFVYTH2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RE5WXOE7VIWLQR3D23LLB2BCEOFVYTH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 11:34:53 +0200,
Jon Hunter wrote:
> 
> Commit 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations") corrected
> the PCM wait_time calculations and in doing so reduced the calculated
> wait_time. This exposed an issue with the Tegra Master Volume Control
> (MVC) device where the reduced wait_time caused the MVC to fail. For now
> fix this by setting the default wait_time for Tegra to be 500ms.
> 
> Fixes: 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Hm, it's still not clear why it fails.  The commit above changes the
timeout of wait_for_avail() to the full-buffer + 10% margin.  In
thoery, the loop should abort after the full buffer read, and that
must be enough.  If there were a large FIFO behind, it might be
overflow, but the fifo_size of Tegra driver seems 4, so it's
negligible.

If extending the timeout "fixes" the problem, it might indicate that
the period update IRQ is triggered too late.  Could you measure the
timing of each snd_pcm_period_elapsed() and wait_for_avail() call?


thanks,

Takashi


> ---
>  sound/soc/tegra/tegra_pcm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
> index 468c8e77de21..0b69cebc9a33 100644
> --- a/sound/soc/tegra/tegra_pcm.c
> +++ b/sound/soc/tegra/tegra_pcm.c
> @@ -117,6 +117,9 @@ int tegra_pcm_open(struct snd_soc_component *component,
>  		return ret;
>  	}
>  
> +	/* Set wait time to 500ms by default */
> +	substream->wait_time = 500;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(tegra_pcm_open);
> -- 
> 2.34.1
> 
