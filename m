Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D65979431DE
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 16:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 753F42C78;
	Wed, 31 Jul 2024 16:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 753F42C78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722435564;
	bh=DDlLwrsxFMHsqZV2t57k6NTa8ABzfHb6XpafsvaWqwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k2cttShD4eJxjJN2OxgYs1UzAzje/C7IjZpz3nxWZT97eSFZhbcNBcYtgOtxaR+jr
	 m7QBda8KQ8FJ0qhU0BVuwAcQqwKfUKeNu6sSHBf1h28/pAlTklOVP7w+oReRKiKUW2
	 jlCaG0XGponFk2C/+nCA3iuHQnWyq+hHQtqZcebA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4EABF8026A; Wed, 31 Jul 2024 16:18:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5202BF805AB;
	Wed, 31 Jul 2024 16:18:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19650F802DB; Wed, 31 Jul 2024 16:18:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0DCEF8007E
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 16:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0DCEF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=uGoRr7hf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=egq+qiMb;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=uGoRr7hf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=egq+qiMb
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E04D21A4B;
	Wed, 31 Jul 2024 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722435505;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgRQoA5RTmJcsrNllSYec8uXbG0ZQF/SNuQ++hdWKAc=;
	b=uGoRr7hfQhVo2Ej45CDn8Hkskxs2oX6REBo75pUIwYfOodezQssp0CJF/QvDz7m60hMi0q
	Li4mmgxHMhEWJ+HLmnwGHjaKmhmrxREcBGnrNysbAzH6mJJiNVngi7P4YpCFcq8f6kIDSP
	knDzwo9QhdVFkxynIp8GI1kp4rEdHV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722435505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgRQoA5RTmJcsrNllSYec8uXbG0ZQF/SNuQ++hdWKAc=;
	b=egq+qiMbHWpSFLgPJl42dn73e83NQB6XxONrIvWydATWrbcfkvwbNdU+phTOoepyGkMqa0
	DqHfMM6q3/ruTaBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uGoRr7hf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=egq+qiMb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722435505;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgRQoA5RTmJcsrNllSYec8uXbG0ZQF/SNuQ++hdWKAc=;
	b=uGoRr7hfQhVo2Ej45CDn8Hkskxs2oX6REBo75pUIwYfOodezQssp0CJF/QvDz7m60hMi0q
	Li4mmgxHMhEWJ+HLmnwGHjaKmhmrxREcBGnrNysbAzH6mJJiNVngi7P4YpCFcq8f6kIDSP
	knDzwo9QhdVFkxynIp8GI1kp4rEdHV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722435505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgRQoA5RTmJcsrNllSYec8uXbG0ZQF/SNuQ++hdWKAc=;
	b=egq+qiMbHWpSFLgPJl42dn73e83NQB6XxONrIvWydATWrbcfkvwbNdU+phTOoepyGkMqa0
	DqHfMM6q3/ruTaBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35A8113297;
	Wed, 31 Jul 2024 14:18:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9j7tC7FHqmbocAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 14:18:25 +0000
Date: Wed, 31 Jul 2024 16:19:02 +0200
Message-ID: <87sevpbq5l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sylvain BERTRAND <sylvain.bertrand@legeek.net>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH][LINUX][ALSA][USB AUDIO CLASS 1] wrong channel ids for
 surround
In-Reply-To: <ZqpEyxz+vgLLDEMI@freedom>
References: <ZqIyJD8lhd8hFhlC@freedom>
	<87h6c5zzch.wl-tiwai@suse.de>
	<ZqpEyxz+vgLLDEMI@freedom>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4E04D21A4B
X-Spamd-Result: default: False [-3.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: CNVJFWHDB6L4K2ZJZGGUVXJ52P6P5WV2
X-Message-ID-Hash: CNVJFWHDB6L4K2ZJZGGUVXJ52P6P5WV2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CNVJFWHDB6L4K2ZJZGGUVXJ52P6P5WV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 Jul 2024 16:06:03 +0200,
Sylvain BERTRAND wrote:
> 
> On Wed, Jul 31, 2024 at 11:26:38AM +0200, Takashi Iwai wrote:
> > Could you submit a properly formatted patch (with a patch description
> > and your Signed-off-by tag) to linux-sound ML
> > (linux-sound@vger.kernel.org) instead?
> 
> Hi,
> 
> I tried to send that patch to the lkml, but some admins removed grey listing
> and I use a domestic smtp server (with DNS SPF though), then I was blocked.
> 
> (I don't use only noscript/basic (x)html browsers, then "Big Tech" email
> services are not available for me)
> 
> (I have a github account, and github is still working with noscript/basic
> (x)html... as for now... then I did report an issue there)
> 
> If you have time and accept to do it, I don't mind you or somebody else doing
> that on my behalf. What matters is this being fixed I guess.

OK, as the fix is trivial, I'll submit and merge it.


thanks,

Takashi
