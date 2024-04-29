Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 688108B5DCB
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 17:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21ED823;
	Mon, 29 Apr 2024 17:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21ED823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714404832;
	bh=8IECo8OkMTR2jelHnyvI2VwFXrbvedpGsArS08GD99Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sotSEMJsATjBYfDxL0DY0bg9IjnJuFjA/43K8LA1ZEYVXRkuz6gh/33LjVaE869bj
	 T9oIri79yiRIEAIEWtWzIqRJGM3xcC5y/Hul4IJQjYsXRur8Voj/q3NLv/LhVTnB8D
	 Akzxqm4qC9udG55QQ6dLTmcric6eKkZK0vNjk7cc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0460EF80588; Mon, 29 Apr 2024 17:33:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A04AF80578;
	Mon, 29 Apr 2024 17:33:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D6E5F8028D; Mon, 29 Apr 2024 17:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A459EF800B5
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 17:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A459EF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IWogoiFK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rWuqhu8+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=IWogoiFK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rWuqhu8+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B743338C1;
	Mon, 29 Apr 2024 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714404763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k94lh0MxCewUqNQNuEIjURmcuvKGiUnWiBKGbbZqaCo=;
	b=IWogoiFKwVnJ/2PNvQ5vCNAiOqt0mNfnwZPKz+tABKEcQh1BmASgdw8xoQgDbxWGi6TCq7
	kJ2HtQ7uq69zJBs+Enawck/Qz+32LQNPxtbLu0coO2Bual+AUeC4ZrSsB+xbkADkrNgrW/
	++DhDForMxxUBNOIzC+qv1nNsW4BUx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714404763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k94lh0MxCewUqNQNuEIjURmcuvKGiUnWiBKGbbZqaCo=;
	b=rWuqhu8+ThLq4TqXjXigevPI4T7vYkZh4Y1tugcfTXogxVRX1R4yU+R3cNkfj0zjlRw47m
	LInzEBeKXxMa4VAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714404763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k94lh0MxCewUqNQNuEIjURmcuvKGiUnWiBKGbbZqaCo=;
	b=IWogoiFKwVnJ/2PNvQ5vCNAiOqt0mNfnwZPKz+tABKEcQh1BmASgdw8xoQgDbxWGi6TCq7
	kJ2HtQ7uq69zJBs+Enawck/Qz+32LQNPxtbLu0coO2Bual+AUeC4ZrSsB+xbkADkrNgrW/
	++DhDForMxxUBNOIzC+qv1nNsW4BUx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714404763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k94lh0MxCewUqNQNuEIjURmcuvKGiUnWiBKGbbZqaCo=;
	b=rWuqhu8+ThLq4TqXjXigevPI4T7vYkZh4Y1tugcfTXogxVRX1R4yU+R3cNkfj0zjlRw47m
	LInzEBeKXxMa4VAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 290ED138A7;
	Mon, 29 Apr 2024 15:32:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MxfYCJu9L2ZdIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Apr 2024 15:32:43 +0000
Date: Mon, 29 Apr 2024 17:32:55 +0200
Message-ID: <87wmognpzs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: Re: [PATCH] ALSA: hda: intel-sdw-acpi: fix usage of
 device_get_named_child_node()
In-Reply-To: <8c87a931-9e9b-4922-a126-867da5e0b3df@linux.intel.com>
References: <20240426152731.38420-1-pierre-louis.bossart@linux.intel.com>
	<874jbkp5zz.wl-tiwai@suse.de>
	<8c87a931-9e9b-4922-a126-867da5e0b3df@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-2.99)[99.97%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
Message-ID-Hash: R5CAG2K66ANPY6YNEH6DEINOIIFIZ37O
X-Message-ID-Hash: R5CAG2K66ANPY6YNEH6DEINOIIFIZ37O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R5CAG2K66ANPY6YNEH6DEINOIIFIZ37O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Apr 2024 17:15:19 +0200,
Pierre-Louis Bossart wrote:
> 
> Hi Takashi,
> 
> >> The documentation for device_get_named_child_node() mentions this
> >> important point:
> >>
> >> "
> >> The caller is responsible for calling fwnode_handle_put() on the
> >> returned fwnode pointer.
> >> "
> >>
> >> Add fwnode_handle_put() to avoid a leaked reference.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > 
> > Can we have a corresponding Fixes tag?
> 
> Good question.
> 
> The initial code was in
> 
> 6d2c66695bf3 ("soundwire: intel: transition to 3 steps initialization")
> 
> but then moved with
> 
> 08c2a4bc9f2a ("ALSA: hda: move Intel SoundWire ACPI scan to dedicated
> module")
> 
> I guess a Fixes tag for the latter is good enough, it's a 2021 commit
> and that would probably cover most SoundWire platforms.

OK, let's take it, then.  Applied now.


thanks,

Takashi
