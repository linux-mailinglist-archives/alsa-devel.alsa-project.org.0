Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25657C81BD
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 11:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A6D2DF9;
	Fri, 13 Oct 2023 11:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A6D2DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697188573;
	bh=5WjPqQRfjVS0FEJKsuD/gBa+/p/RPvoZNjSd6DRi/I8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DV9gjNMXccMybrBMbTSX6AMiDzqdyO2iHjkqZBiP+neqqASYNZW+lsMP+4FCqEmuk
	 /ffhWbdrSRSC+EnSOHorTp5Obi/orLeHy1y3ASr4IUzxzoZSmA9ZoVZbGWzY0P12VA
	 xd3fTY73DYALfmrr7Drkq45cJQGrEPPXOOZck1NU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18D3FF8055C; Fri, 13 Oct 2023 11:15:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E6A5F802E8;
	Fri, 13 Oct 2023 11:15:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0524AF80310; Fri, 13 Oct 2023 11:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35C66F80166;
	Fri, 13 Oct 2023 11:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35C66F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=lLi3T9YO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eCWLIDHO
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C174921871;
	Fri, 13 Oct 2023 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1697188510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=efOBm3e13ZjEOj+ZGaXSfOb0Hkfg1ATCQXj1BE9CT/M=;
	b=lLi3T9YOusq8Wctbl0n66KEIJZRhNfDyerrLnb7Pe1zQWNzFKaPw2kLCiAhooVCe2YxEbv
	LwUWxooe0UHbboAP+gPikEwlO0HmLPtg5nwJbGOADV8AR/+U2X7OuBwexobfmYdT9m/kyc
	JfyncHoug92gPyW4WDtR13Ah14H0yyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1697188510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=efOBm3e13ZjEOj+ZGaXSfOb0Hkfg1ATCQXj1BE9CT/M=;
	b=eCWLIDHO5dkzaxRvzaXYHOIOJKMneeEod4anzkMO5Ri2hw3Qyp2EW6bVrXKOds4pW+o/po
	Mu3gwtC1+/Y2qYAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 733411358F;
	Fri, 13 Oct 2023 09:15:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zEk2G54KKWU/DQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 13 Oct 2023 09:15:10 +0000
Date: Fri, 13 Oct 2023 11:15:09 +0200
Message-ID: <87il7aopcy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v7 01/13] ASoC: SOF: core: Ensure sof_ops_free() is still
 called when probe never ran.
In-Reply-To: <20231009115437.99976-2-maarten.lankhorst@linux.intel.com>
References: <20231009115437.99976-1-maarten.lankhorst@linux.intel.com>
	<20231009115437.99976-2-maarten.lankhorst@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: WR45YG6HIG2WX5RLQ6L77HYNWTBBIFHQ
X-Message-ID-Hash: WR45YG6HIG2WX5RLQ6L77HYNWTBBIFHQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WR45YG6HIG2WX5RLQ6L77HYNWTBBIFHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 09 Oct 2023 13:54:25 +0200,
Maarten Lankhorst wrote:
> 
> In an effort to not call sof_ops_free twice, we stopped running it when
> probe was aborted.
> 
> Check the result of cancel_work_sync to see if this was the case.
> 
> Fixes: 31bb7bd9ffee ("ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful")
> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Acked-by: Mark Brown <broonie@kernel.org>

Your Signed-off-by tag is missing.

Could you resubmit?


thanks,

Takashi

> ---
>  sound/soc/sof/core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 2d1616b81485c..0938b259f7034 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -459,9 +459,10 @@ int snd_sof_device_remove(struct device *dev)
>  	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
>  	struct snd_sof_pdata *pdata = sdev->pdata;
>  	int ret;
> +	bool aborted = false;
>  
>  	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
> -		cancel_work_sync(&sdev->probe_work);
> +		aborted = cancel_work_sync(&sdev->probe_work);
>  
>  	/*
>  	 * Unregister any registered client device first before IPC and debugfs
> @@ -487,6 +488,9 @@ int snd_sof_device_remove(struct device *dev)
>  		snd_sof_free_debug(sdev);
>  		snd_sof_remove(sdev);
>  		sof_ops_free(sdev);
> +	} else if (aborted) {
> +		/* probe_work never ran */
> +		sof_ops_free(sdev);
>  	}
>  
>  	/* release firmware */
> -- 
> 2.39.2
> 
