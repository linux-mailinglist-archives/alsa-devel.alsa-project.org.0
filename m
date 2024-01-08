Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E35826884
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 08:23:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22331741;
	Mon,  8 Jan 2024 08:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22331741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704698592;
	bh=wX4z+IzLRGM0XvF5iGdbSdRJf02cubjOoGaxk9MP6kM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qImYzBEdAR3WfkC9haRsO5QRmaDlbXd/nz4MY5/bFl1YIaANmZnqjrtjlDIGxRUV0
	 KRRn60fz7B1wRZ+OaLrzUxRQ+EmkrOFoWnELOUrQFzc04cG3nEnoc6YvwkSS2GLP8z
	 Nr3eGbteXxHTgVLzrb/3d36hfBMwGdZj7ch6lp6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B031F80567; Mon,  8 Jan 2024 08:22:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8DCDF8057F;
	Mon,  8 Jan 2024 08:22:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E5D2F80254; Mon,  8 Jan 2024 08:19:48 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DBCBF8014B
	for <alsa-devel@alsa-project.org>; Mon,  8 Jan 2024 08:19:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DBCBF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bceWRJ+n;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uAPZZfa6;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=bceWRJ+n;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uAPZZfa6
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6530D21F78;
	Mon,  8 Jan 2024 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704698347;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1F/HB+aTQucs7+KUpLKfUatA/tQ40h4SJR9H1t4/bcQ=;
	b=bceWRJ+nsbmmd100vxfDA+tVgJPoE05NKipdmeNHZojLYgkUGl6mzhdPC3y+VcZaJprQxr
	sUxjBU+p9Cyg0KuES+V0oskpAQ7MgC9C4TDVq4DW0ePM2M//HaqslfOQXByDjj/QIr0Yr7
	V6dxJUNlra4nhrwhPc//QtKu39W9OUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704698347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1F/HB+aTQucs7+KUpLKfUatA/tQ40h4SJR9H1t4/bcQ=;
	b=uAPZZfa6H60yaDHsdUw8uiqwG3/7QRfGTyEBVnqciZZ2BejbPsJQY4eOh/SOjRE3oFzSOC
	kvpD9i3fvbUOYpCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704698347;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1F/HB+aTQucs7+KUpLKfUatA/tQ40h4SJR9H1t4/bcQ=;
	b=bceWRJ+nsbmmd100vxfDA+tVgJPoE05NKipdmeNHZojLYgkUGl6mzhdPC3y+VcZaJprQxr
	sUxjBU+p9Cyg0KuES+V0oskpAQ7MgC9C4TDVq4DW0ePM2M//HaqslfOQXByDjj/QIr0Yr7
	V6dxJUNlra4nhrwhPc//QtKu39W9OUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704698347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1F/HB+aTQucs7+KUpLKfUatA/tQ40h4SJR9H1t4/bcQ=;
	b=uAPZZfa6H60yaDHsdUw8uiqwG3/7QRfGTyEBVnqciZZ2BejbPsJQY4eOh/SOjRE3oFzSOC
	kvpD9i3fvbUOYpCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BFEE13496;
	Mon,  8 Jan 2024 07:19:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HjC/COuhm2WIaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 08 Jan 2024 07:19:07 +0000
Date: Mon, 08 Jan 2024 08:19:06 +0100
Message-ID: <87il44i979.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.8
In-Reply-To: <20240107223730.5D4C4C433C8@smtp.kernel.org>
References: <20240107223730.5D4C4C433C8@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-0.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[14.49%]
Message-ID-Hash: F5WPCTAOX3BBZJMC7M7PZHOOOM3FGFHU
X-Message-ID-Hash: F5WPCTAOX3BBZJMC7M7PZHOOOM3FGFHU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5WPCTAOX3BBZJMC7M7PZHOOOM3FGFHU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 07 Jan 2024 23:37:21 +0100,
Mark Brown wrote:
> 
> The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:
> 
>   Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.8
> 
> for you to fetch changes up to 67508b874844b80ac49f70b78d67036c28b9fe7e:
> 
>   ASoC: pxa: sspa: Don't select SND_ARM (2023-12-29 17:41:15 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.8
> 
> This is a relatively quiet release, there's a lot of driver specific
> changes and the usual high level of activity in the SOF core but the
> one big core change was Mormioto-san's work to support more N:M
> CPU:CODEC mapping cases.  Highlights include:
> 
>  - Enhanced support for N:M CPU:CODEC mappings in the core and in
>    audio-graph-card2.
>  - Support for falling back to older SOF IPC versions where firmware for
>    new versions is not available.
>  - Support for notification of control changes generated by SOF firmware
>    with IPC4.
>  - Device tree support for describing parts of the card which can be
>    active over suspend (for very low power playback or wake word use
>    cases).
>  - ACPI parsing support for the ES83xx driver, reducing the number of
>    quirks neede for x86 systems.
>  - Support for more AMD and Intel systems, NXP i.MX8m MICFIL, Qualcomm
>    SM8250, SM8550, SM8650 and X1E80100.
>  - Removal of Freescale MPC8610 support, the SoC is no longer supported
>    by Linux.

Pulled now.  Thanks.


Takashi
