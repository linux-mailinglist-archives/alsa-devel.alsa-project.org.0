Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 412488D1921
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 13:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70B0486F;
	Tue, 28 May 2024 13:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70B0486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716894577;
	bh=o9tuEq20eThK1If2jG9YQDwn+YL3GhLVbpw5wMIdEIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EeB7mXo9PDOnXXHcbkjWApJZVekbf+BQO18LEPvtk5Hgq13xjdYNb6C72FV50lbbT
	 gptfyTI0i94DfTuAt9E66MzZUL/7cEbuMl5i/mN4nkg0qoCZVu05byqCwgSzLft+Yi
	 3ygEYroqc3WaPvXj85u/ivmxIHvAcagu9gqAW67c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 612D0F805AD; Tue, 28 May 2024 13:09:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1607F80589;
	Tue, 28 May 2024 13:09:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D188F80149; Tue, 28 May 2024 13:08:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FE5CF800AC
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 13:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE5CF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UBww7Dro;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LZrrQqdS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=UBww7Dro;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LZrrQqdS
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D2E5022690;
	Tue, 28 May 2024 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1716894480;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OUMCjON2Njr+snGHVQ1hWR0AqSuBsUQndjWasr/bdG8=;
	b=UBww7DroLJ8SAowaYNsaOgtLggZqY6aPSNbILSOGKt4Xvn9sT/r4Zf9iZNYB045pLqrusu
	fGCvwVq/sINCa3c9JbHz+7L98BygnlkK4WTcLW8dBy4y6xayueEatn6yk7nJYAlX14+1x1
	hJumnIkbMm1r+7bojTA4+qhM8OoP0D8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716894480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OUMCjON2Njr+snGHVQ1hWR0AqSuBsUQndjWasr/bdG8=;
	b=LZrrQqdSi2kZfcxUtR8Wy4bF2vuQXDR/Nit0QRilOElINuWyZnT+BbQoRqe/mKqOSeZzge
	HrSjibb9SqaYYhCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1716894480;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OUMCjON2Njr+snGHVQ1hWR0AqSuBsUQndjWasr/bdG8=;
	b=UBww7DroLJ8SAowaYNsaOgtLggZqY6aPSNbILSOGKt4Xvn9sT/r4Zf9iZNYB045pLqrusu
	fGCvwVq/sINCa3c9JbHz+7L98BygnlkK4WTcLW8dBy4y6xayueEatn6yk7nJYAlX14+1x1
	hJumnIkbMm1r+7bojTA4+qhM8OoP0D8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716894480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OUMCjON2Njr+snGHVQ1hWR0AqSuBsUQndjWasr/bdG8=;
	b=LZrrQqdSi2kZfcxUtR8Wy4bF2vuQXDR/Nit0QRilOElINuWyZnT+BbQoRqe/mKqOSeZzge
	HrSjibb9SqaYYhCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF11913A6B;
	Tue, 28 May 2024 11:08:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YozLLRC7VWZVDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 May 2024 11:08:00 +0000
Date: Tue, 28 May 2024 13:08:22 +0200
Message-ID: <87sey26vo9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ALSA/hda: intel-dsp-config: reduce log verbosity
In-Reply-To: <20240527193808.165652-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193808.165652-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.25 / 50.00];
	BAYES_HAM(-2.95)[99.80%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: J3OGTI65ANXIYK624F3F2IZNXNF6V4LB
X-Message-ID-Hash: J3OGTI65ANXIYK624F3F2IZNXNF6V4LB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3OGTI65ANXIYK624F3F2IZNXNF6V4LB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 May 2024 21:38:08 +0200,
Pierre-Louis Bossart wrote:
> 
> The information on PCI class/subclass was interesting in the Skylake
> timeframe, since the DSP was only enabled on a limited number of
> platforms. Now most Intel platforms do enable the DSP, so the
> information is less interesting to log.
> 
> When a DSP driver is used, the common helper may be called multiple
> times due to deferred probes, but there's no reason to print the same
> information multiple times. Using dev_info_once() covers all the
> existing usages for internal cards with DSPs. External cards don't
> rely on DSPs so far.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Applied now, thanks.


Takashi
