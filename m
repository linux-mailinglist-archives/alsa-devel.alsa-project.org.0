Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DE675B10F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 16:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6BA1F7;
	Thu, 20 Jul 2023 16:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6BA1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689862773;
	bh=G5fPN0kPkKt67yNIppezBMGcf5NzC1HJMKQ5gus+Rrs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UcX+fYpqPlwdX0dYAYUkwvoBo0W+hfLNVV99wUP9VduAGxe6Vl/BmWAXQOKD6BVv7
	 JM4+A+4AbKltb7KpnZrVMG1FuBsZLEP52yyWwKSDoFCvN0qhe04oq4MCe6GAWpyNU4
	 8IYaVg+cdIUa51op6fouHcy+TB8KtZdnUZhK08qQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AE69F8053B; Thu, 20 Jul 2023 16:18:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3BE3F8032D;
	Thu, 20 Jul 2023 16:18:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1835F8047D; Thu, 20 Jul 2023 16:18:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DBD8F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 16:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DBD8F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=b8+L1zWc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FgYNfpzg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B4A0222C6C;
	Thu, 20 Jul 2023 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689862691;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2amP83fa5zZSlbjt8pOmiwJucj8YYw68bEe3RLres6c=;
	b=b8+L1zWcTxcG2gOrb48R+FjSCZVzvDweD26ePr6mTRjiRcHirgf2ZFpxDFTRi3S94vccRf
	jhTIQWknqIRc0ldojk0uVvy+pO3/7v9hgXPdnmZYdiwAuioeFK4C49P58brJ27/dgcJAC+
	Pg3+Rzm8sWiPsrlQ4nZHB0ezTY07aY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689862691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2amP83fa5zZSlbjt8pOmiwJucj8YYw68bEe3RLres6c=;
	b=FgYNfpzgrzLwBtwMhwJla/WpOxUF0YVGwq0iZlaV2toZEjXkHfLzJKC2gy1WW2K+6lqkiJ
	5K0UZSwCxutOEVBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81F8C138EC;
	Thu, 20 Jul 2023 14:18:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YvX4HiNCuWT2bQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 14:18:11 +0000
Date: Thu, 20 Jul 2023 16:18:11 +0200
Message-ID: <87wmyuis4c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi
 Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 06/11] ALSA: hda: hda_component: Add pre and post
 playback hooks to hda_component
In-Reply-To: <20230720133147.1294337-7-sbinding@opensource.cirrus.com>
References: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
	<20230720133147.1294337-7-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VIGXEUBFGNMQEE5IT7FVLTDSLC2OALIC
X-Message-ID-Hash: VIGXEUBFGNMQEE5IT7FVLTDSLC2OALIC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIGXEUBFGNMQEE5IT7FVLTDSLC2OALIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jul 2023 15:31:42 +0200,
Stefan Binding wrote:
> 
> These hooks can be used to add callbacks that would be run before and after
> the main playback hooks. These hooks would be called for all amps, before
> moving on to the next hook, i.e. pre_playback_hook would be called for
> all amps, before the playback_hook is called for all amps, then finally
> the post_playback_hook is called for all amps.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

It's better to combine this and patch 9 for the actual calls, so that
we know the full effect of the changes.


thanks,

Takashi

> ---
>  sound/pci/hda/hda_component.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
> index 534e845b9cd1d..f170aec967c18 100644
> --- a/sound/pci/hda/hda_component.h
> +++ b/sound/pci/hda/hda_component.h
> @@ -15,5 +15,7 @@ struct hda_component {
>  	struct device *dev;
>  	char name[HDA_MAX_NAME_SIZE];
>  	struct hda_codec *codec;
> +	void (*pre_playback_hook)(struct device *dev, int action);
>  	void (*playback_hook)(struct device *dev, int action);
> +	void (*post_playback_hook)(struct device *dev, int action);
>  };
> -- 
> 2.34.1
> 
