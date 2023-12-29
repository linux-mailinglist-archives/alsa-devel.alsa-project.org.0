Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C3A822251
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:55:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24DB4E80;
	Tue,  2 Jan 2024 20:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24DB4E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704225335;
	bh=dhvDRZ9Wo64TIaoMU1NNvWU90m91iihuni9Ryh3ryKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DYbfj+0oB9Qt9ougJeWieT1tUe4DTUV+6+tgMl+mHAKIzOsGlVy1EB2k+DYh2bw0p
	 Tcy8exUVK8rr8UTMrOMX/HIn2sp40pQUXXmw9kWCk6LHAQAYLkVOl4iXl1rKJQzfRU
	 /MTldZrZhyy3YPyc9MQe7pOqJdmqhl34XGe4WISk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D9FBF80557; Tue,  2 Jan 2024 20:55:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 326BDF805C3;
	Tue,  2 Jan 2024 20:55:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BE81F80424; Tue,  2 Jan 2024 20:54:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CF9FF80224
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF9FF80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tUWWuixr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6SF+C2xV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=tUWWuixr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6SF+C2xV
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 318BE1F7B5;
	Fri, 29 Dec 2023 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703859573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sk1J0IKWRsXdd9QQ2UKg+dEA9+6uBeiucEsOi3WQhHw=;
	b=tUWWuixrP8e4bv2+acfhqoGlfUNPd4+6PkdtkMEA/U3bWiUsKVRny93TaTrqpJOlHguCeK
	pwns1TV2NN7lxCZ25HXN5hd2xQlTS408KAngmLaaGYdP2vM9rBD9VE4fhW1OUPDoBpm1Cx
	kiOSVrH3BxZvus3sskWDb6qcUCFixg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703859573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sk1J0IKWRsXdd9QQ2UKg+dEA9+6uBeiucEsOi3WQhHw=;
	b=6SF+C2xVK72eGGuqchebbs5P0nty+nx4ZITZDA0HgN2m/H/Z5tGBg7MSoslduZ+c5P9nLN
	IeI3eQjarp6TnAAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703859573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sk1J0IKWRsXdd9QQ2UKg+dEA9+6uBeiucEsOi3WQhHw=;
	b=tUWWuixrP8e4bv2+acfhqoGlfUNPd4+6PkdtkMEA/U3bWiUsKVRny93TaTrqpJOlHguCeK
	pwns1TV2NN7lxCZ25HXN5hd2xQlTS408KAngmLaaGYdP2vM9rBD9VE4fhW1OUPDoBpm1Cx
	kiOSVrH3BxZvus3sskWDb6qcUCFixg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703859573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sk1J0IKWRsXdd9QQ2UKg+dEA9+6uBeiucEsOi3WQhHw=;
	b=6SF+C2xVK72eGGuqchebbs5P0nty+nx4ZITZDA0HgN2m/H/Z5tGBg7MSoslduZ+c5P9nLN
	IeI3eQjarp6TnAAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2EB4136D1;
	Fri, 29 Dec 2023 14:19:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PJktMnTVjmXKeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Dec 2023 14:19:32 +0000
Date: Fri, 29 Dec 2023 15:19:32 +0100
Message-ID: <87jzoxxf9n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lorenz Brun <lorenz@brun.one>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Add HP override
In-Reply-To: <20231223150912.3040328-1-lorenz@brun.one>
References: <20231223150912.3040328-1-lorenz@brun.one>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.31 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.01)[48.27%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: PHM5EYZUTUUT4CM3PF47L2MOOB54YYBH
X-Message-ID-Hash: PHM5EYZUTUUT4CM3PF47L2MOOB54YYBH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHM5EYZUTUUT4CM3PF47L2MOOB54YYBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 23 Dec 2023 16:09:11 +0100,
Lorenz Brun wrote:
> 
> This adds an override for a series of notebooks using a common config
> taken from HP's proprietary Windows driver.
> 
> This has been tested on a HP 15-ey0xxxx device (subsystem 103C8A31)
> together with another Realtek quirk and the calibration files from the
> proprietary driver.
> 
> Signed-off-by: Lorenz Brun <lorenz@brun.one>
> ---
> Changes in v2:
> - Use newly-introduced config table instead of function
> - Change boost cap value from 10uF to 24uF after cross-referencing my
>   sources with the preexisting 103C89C6 entry.

This doesn't apply cleanly any longer after the merge of the latest
series from Stefan, unfortunately.  Could you rebase on either
for-next or topic/cs35l41 branch of sound.git tree and resubmit?

Also, the prop_model_table[] is a sorted list.  Please add entries at
the right positions.


thanks,

Takashi
