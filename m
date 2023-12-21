Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F27A681B048
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 09:28:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F20A857;
	Thu, 21 Dec 2023 09:28:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F20A857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703147293;
	bh=KkgaE+EbdPoWBaUMSOz+/8AfBhj0F/5nrF4b1TI+Urw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WM1cosiKhiLm6rYlvOvc3acELUhhusEQxQ9kyYj0TFoC6ake5XrRDIjHOF2qidpO/
	 hqqpk01HF1Ul8opB1p8XRc2WE0Vj0+ZuGu7jyT+WBVHDIjvvmr1Z40kiDDGsIllrQq
	 vb6mp9jQYOgGz56cEzQNzViHilJywtBzj6u33iW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D84BF805C6; Thu, 21 Dec 2023 09:27:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40EFDF8057D;
	Thu, 21 Dec 2023 09:27:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A891F80153; Thu, 21 Dec 2023 09:27:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EBA9F80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 09:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EBA9F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NsBzmEU2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MduD/OyC;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=NsBzmEU2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MduD/OyC
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31C7F21DEF;
	Thu, 21 Dec 2023 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703147237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKp3YiZy1ZxIc9SwUP95Vg6JO6tzrcO5b4SC5IzLdq8=;
	b=NsBzmEU2d+P37EyBExsC/Z6DTYQI9iqIlvpUn+twgj9Y8GZsve+PU+IXIhhC51m/va6w2n
	KeXuDYY4bzlSXjp2LEx2FO9X6WRmRh9qAn/3wg3Z6+TaKHPwG+lm/trlTHfvVW0D8NmRln
	s9vGhp+Vg6F6lpi8n5bj07EuEIc35Ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703147237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKp3YiZy1ZxIc9SwUP95Vg6JO6tzrcO5b4SC5IzLdq8=;
	b=MduD/OyC0ojhHmHYUJkqHih/DAlKwLbast8YTvKL3Z6Bp/u40bguqGg0Gx+j/WJr7uE+j2
	CTOky/F/DOpCTBAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703147237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKp3YiZy1ZxIc9SwUP95Vg6JO6tzrcO5b4SC5IzLdq8=;
	b=NsBzmEU2d+P37EyBExsC/Z6DTYQI9iqIlvpUn+twgj9Y8GZsve+PU+IXIhhC51m/va6w2n
	KeXuDYY4bzlSXjp2LEx2FO9X6WRmRh9qAn/3wg3Z6+TaKHPwG+lm/trlTHfvVW0D8NmRln
	s9vGhp+Vg6F6lpi8n5bj07EuEIc35Ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703147237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKp3YiZy1ZxIc9SwUP95Vg6JO6tzrcO5b4SC5IzLdq8=;
	b=MduD/OyC0ojhHmHYUJkqHih/DAlKwLbast8YTvKL3Z6Bp/u40bguqGg0Gx+j/WJr7uE+j2
	CTOky/F/DOpCTBAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 182A413AC2;
	Thu, 21 Dec 2023 08:27:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iAh3BeX2g2U1IgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Dec 2023 08:27:17 +0000
Date: Thu, 21 Dec 2023 09:27:16 +0100
Message-ID: <s5h34vwufiz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 2/2] ALSA: hda: cs35l41: Only add SPI CS GPIO if SPI is
 enabled in kernel
In-Reply-To: <s5h8r5puwea.wl-tiwai@suse.de>
References: <20231219162232.790358-1-sbinding@opensource.cirrus.com>
	<20231219162232.790358-3-sbinding@opensource.cirrus.com>
	<s5h8r5puwea.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.83 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.73)[93.37%]
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID-Hash: GUEEEQHIHXEDWYRSQG4PCCHIZRLX6A2W
X-Message-ID-Hash: GUEEEQHIHXEDWYRSQG4PCCHIZRLX6A2W
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GUEEEQHIHXEDWYRSQG4PCCHIZRLX6A2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Dec 2023 09:10:37 +0100,
Takashi Iwai wrote:
> 
> On Tue, 19 Dec 2023 17:22:32 +0100,
> Stefan Binding wrote:
> > 
> > If CONFIG_SPI is not set in the kernel, there is no point in trying
> > to set the chip selects. We can selectively compile it.
> 
> I guess it should with IS_REACHABLE() instead of IS_ENABLED()?
> It can be still CONFIG_SPI=m while CONFIG_SND_HDA_*=y.

In anyway, I applied the patches as is for now, as it should work in most cases.
Let's see whether the use of IS_REACHABLE() is required.


thanks,

Takashi
