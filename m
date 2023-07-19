Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 312897593D5
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 13:07:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4256D1F7;
	Wed, 19 Jul 2023 13:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4256D1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689764860;
	bh=YICeBMNNUm6Kfdt4vH0PtiIJaF2RLzPgaMaif4wz0Ug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TMYFT3j5ig9BAnCyICIfHF4YjQ6ynIf5TNctKKRr/EzT4M9fLJzfV+ESKLcP6j+CM
	 nNFLVKzxH9nJs6P7bQYl/gY2qkluyhLVffQnc22RGefQk6KHRsFw0F3J+ltVfvXmAz
	 8KZKnQ4JE2VN/YBUMNaBXIk8nMR/BUUfI1VjVypg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92E07F80535; Wed, 19 Jul 2023 13:06:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E4DF8032D;
	Wed, 19 Jul 2023 13:06:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FA89F8047D; Wed, 19 Jul 2023 13:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECA9FF800D2;
	Wed, 19 Jul 2023 13:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA9FF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZRBryRaU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VMZpJWhg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 75EB221B39;
	Wed, 19 Jul 2023 11:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689764800;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=obmWiWImRjD/Aq1w/uPMq54qv6xAK5oohwBpl7RYP4g=;
	b=ZRBryRaUazVWjqfV7e4lE3CdxhWdgTojvZP+U56CL0NHxVLUu6k4mMCnLQXXD7rh4fTYNt
	8jMZJBZgz0RkVZpgPq6hNi7aevcz3jdoXSy8JKrWnVbYzeB+Mt6ywXsthCFaQVKBoS+MXW
	tiIhIK4Z2g+OJsT9iYinMkhKDzyGNZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689764800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=obmWiWImRjD/Aq1w/uPMq54qv6xAK5oohwBpl7RYP4g=;
	b=VMZpJWhglK65wtBGZ8aonWzISb7PUxnGB8fcKpM8pQjC2FuZOEb4EVApAeYzVD5jBrn0K+
	f5++XUp8RatuOsCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C4B11361C;
	Wed, 19 Jul 2023 11:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QbxcDsDDt2R1VQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 19 Jul 2023 11:06:40 +0000
Date: Wed, 19 Jul 2023 13:06:39 +0200
Message-ID: <875y6g5feo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Alsa-devel <alsa-devel@alsa-project.org>,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 6/7] ASoC: SOF: Intel: Remove deferred probe for SOF
In-Reply-To: <66d22637-069f-5262-2249-6041ef9d4614@linux.intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
	<20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
	<alpine.DEB.2.22.394.2307181922160.3532114@eliteleevi.tm.intel.com>
	<874jm0modf.wl-tiwai@suse.de>
	<66d22637-069f-5262-2249-6041ef9d4614@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: V3NM3FIMN75FIAI3I4RLP5L5WZZV3SGN
X-Message-ID-Hash: V3NM3FIMN75FIAI3I4RLP5L5WZZV3SGN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3NM3FIMN75FIAI3I4RLP5L5WZZV3SGN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 11:48:06 +0200,
Maarten Lankhorst wrote:
> 
>     The 60 seconds timeout is a thing "better than complete disablement",
>     so it's not ideal, either.  Maybe we can add something like the
>     following:
>     
>     - Check when the deferred probe takes too long, and warn it
>     - Provide some runtime option to disable the component binding, so
>       that user can work around it if needed
>     
> A module option to snd_hdac_i915_init would probably be the least of all evils
> here.

Yes, probably it's the easiest option and sufficient.


thanks,

Takashi
