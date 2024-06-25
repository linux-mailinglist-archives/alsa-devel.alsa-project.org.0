Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C95B49169F4
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 16:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10CA086F;
	Tue, 25 Jun 2024 16:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10CA086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719324941;
	bh=9XV83LrXSjRYW1AcuSnVMLu4Y4BncWKJllrwrdhAu4g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CzIOm8e85gaM1/6a/A9/DKiIYvcHfDrjei27jrIDF5VK6bAdhBgBtf5fBln+7+gJH
	 lznA3WFiDK6EM+GAsN5j37L5WBF9ftfYsWMsISlLI9c3myCihvSY2AXfl4dBk5Etxi
	 LqGlqeNAuMPI1DsYQHNK+O7dsMBhNGojGCGIxGrs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97C83F805B0; Tue, 25 Jun 2024 16:15:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62393F805B1;
	Tue, 25 Jun 2024 16:15:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0B91F80495; Tue, 25 Jun 2024 16:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30396F8013D
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 16:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30396F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TMUxoOA8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zr9Qjcmz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=TMUxoOA8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zr9Qjcmz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 22E741F863;
	Tue, 25 Jun 2024 14:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719324445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VBByb5/SaRYwvVsGzkL/+7/3oncmJYY7cYNw+F2rxeQ=;
	b=TMUxoOA8/JD3jby9E5H8QSixYyl+TJJJt3enSQUOvhSqNYBf6rp30FQ3VowY0x0aF6nOtu
	r3jvSonZOFp+Ah+6LZedmZf7fvSZeJEap9LSMUXs6nZezZu8CXx+bjqyaYcZQzuBEDEXh6
	P9o4RFH60uJo6s4CmNY+c1t07Q2FnSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719324445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VBByb5/SaRYwvVsGzkL/+7/3oncmJYY7cYNw+F2rxeQ=;
	b=zr9QjcmzTcJxXBBeOIR5kwRFOiww3EBGKuiv3QoU0bNRQimekw+9hLBnXuOlDHj69+r+3i
	tnktucoedpJe4pCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719324445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VBByb5/SaRYwvVsGzkL/+7/3oncmJYY7cYNw+F2rxeQ=;
	b=TMUxoOA8/JD3jby9E5H8QSixYyl+TJJJt3enSQUOvhSqNYBf6rp30FQ3VowY0x0aF6nOtu
	r3jvSonZOFp+Ah+6LZedmZf7fvSZeJEap9LSMUXs6nZezZu8CXx+bjqyaYcZQzuBEDEXh6
	P9o4RFH60uJo6s4CmNY+c1t07Q2FnSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719324445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VBByb5/SaRYwvVsGzkL/+7/3oncmJYY7cYNw+F2rxeQ=;
	b=zr9QjcmzTcJxXBBeOIR5kwRFOiww3EBGKuiv3QoU0bNRQimekw+9hLBnXuOlDHj69+r+3i
	tnktucoedpJe4pCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EBB6C13A9A;
	Tue, 25 Jun 2024 14:07:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nmXSOBzPemZTJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Jun 2024 14:07:24 +0000
Date: Tue, 25 Jun 2024 16:07:52 +0200
Message-ID: <87tthhktdz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rauty <rautyrauty@gmail.com>
Cc: Gergo Koteles <soyer@irl.hu>,
	alsa-devel@alsa-project.org,
	tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	luke@ljones.dev,
	shenghao-ding@ti.com,
	simont@opensource.cirrus.com,
	foss@athaariq.my.id,
	rf@opensource.cirrus.com,
	wzhd@ustc.edu,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad
 330-17IKB 81DM
In-Reply-To: 
 <CAGpJQTFF=gKN2h105dGhBOEhN0Q1Tpj5hJWpSdQ_-nCoUTzj5A@mail.gmail.com>
References: <20240615125457.167844-1-rauty@altlinux.org>
	<2c9ba341bc95d4b9010bf5f8794c0d14b1c57dc9.camel@irl.hu>
	<CAGpJQTHoBAixmxta2WuZfjHjiK9GXF=hkfPyV7PBD5rt9Z_0WA@mail.gmail.com>
	<CAGpJQTGqxEkfp003QLsp-syUgzDFCmHSmNaoOaem0ZMVf7_=bg@mail.gmail.com>
	<c0a9e15e7926e098bdea97a7d31c32427e0910c9.camel@irl.hu>
	<871q4lm9dp.wl-tiwai@suse.de>
	<CAGpJQTFF=gKN2h105dGhBOEhN0Q1Tpj5hJWpSdQ_-nCoUTzj5A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: SRJP74YACOQ3UOHAFP56GRW6ZB6UEU6L
X-Message-ID-Hash: SRJP74YACOQ3UOHAFP56GRW6ZB6UEU6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRJP74YACOQ3UOHAFP56GRW6ZB6UEU6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jun 2024 16:00:57 +0200,
Rauty wrote:
> 
> On Tue, 25 Jun 2024 at 16:32, Gergo Koteles <soyer@irl.hu> wrote:
> > I still think this breaks Duet 7 sound, because snd_hda_pick_fixup
> > function picks the PCI SSIDs before Codec SSIDs.
> 
> a piece of lspci from Lenovo IdeaPad 330-17IKB 81DM:
> 00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD
> Audio [8086:9d71] (rev 21)
> Subsystem: Lenovo Device [17aa:3837]
> Kernel driver in use: snd_hda_intel
> 
> Since PCI SSIDs are in priority, I will specify it (0x3837).
> Then this patch will not break the sound in the laptop and the change
> will be minimal.

It's not about PCI SSID but the codec SSID.  It's found in the
corresponding /proc/asound/card*/codec#* file.  It might be the same
number as PCI SSID, though.  Please check both Vendor Id and Subsystem
Id lines.

And we need to know those numbers from the conflicting model (Yoga
Diet 7 13ITL6), too.


Takashi
