Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B4577CE90
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 16:56:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 619293E8;
	Tue, 15 Aug 2023 16:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 619293E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692111383;
	bh=9B0DbEpKj/7dMR+D5JHM407xJkkN1X8qOC5mVpxZeCw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XyZHbIaQJV/UNQxlFzg6+ltKHCRO5f9CdjHmXko0oP6QHM0X6+XzK5g8jzVvEGrLM
	 GsoFtvg+W4HwqoQk9K06UlUD8uOQ5KJDoYjieEcfqnIFzmplMTcd6ila5GkjQ2DTh6
	 DSG4vB5A8ZO3+ssrzBrdVYPVmN3OWY3s3yHhRBcA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A28F6F801EB; Tue, 15 Aug 2023 16:55:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58FB8F8016A;
	Tue, 15 Aug 2023 16:55:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49291F8016D; Tue, 15 Aug 2023 16:55:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F0867F800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 16:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0867F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hS9voDS/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jQk0O+C1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7EB7D21998;
	Tue, 15 Aug 2023 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692111325;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLDnJdtBboOzyyIx903oCw+Ll6926wvxH5IbOUNGaQ0=;
	b=hS9voDS/OSWD6QL8twRLl9yKCOqm5wgvH6z9kjjEzFh8Sey2ADyI6UsuZXrXx/cc1y0+SW
	xuPei76pkDyd3KyNaIVKG+lDB/DrFS+WzZB2XvSHfNl6Ism2B2s4A3Xc+TcU+NP9aqaI8L
	bukQe/jaSJ9MqhuHAZjPQjZKSzmwSQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692111325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLDnJdtBboOzyyIx903oCw+Ll6926wvxH5IbOUNGaQ0=;
	b=jQk0O+C1+0bfvjNW5sl3Ztgl9WeuelKU0EwYysvH1/Yl8VoxUSwio+nNKflPp5QmI/Dcd3
	NG+dmVm0jWb13sBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 55FFB13909;
	Tue, 15 Aug 2023 14:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6O/9E92R22Q9YgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 14:55:25 +0000
Date: Tue, 15 Aug 2023 16:55:24 +0200
Message-ID: <87wmxwxsmb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 21/25] ASoC: dmaengine: Convert to generic PCM copy ops
In-Reply-To: <ZNuE5UunDd40e8vW@smile.fi.intel.com>
References: <20230814115523.15279-1-tiwai@suse.de>
	<20230814115523.15279-22-tiwai@suse.de>
	<ZNuE5UunDd40e8vW@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: LVGPVEAOAVAW3YZGX4CU2KFAWI2NVX5L
X-Message-ID-Hash: LVGPVEAOAVAW3YZGX4CU2KFAWI2NVX5L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVGPVEAOAVAW3YZGX4CU2KFAWI2NVX5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 15 Aug 2023 16:00:05 +0200,
Andy Shevchenko wrote:
> 
> Can be compressed to a single conditional:
> 
> 	if (is_playback && copy_from_iter(dma_ptr, bytes, buf) != bytes)

I prefer keeping the changes minimalistic in this kind of conversion
unless it becomes too ugly.  Then it's more clearer what's actually
changed.


thanks,

Takashi
