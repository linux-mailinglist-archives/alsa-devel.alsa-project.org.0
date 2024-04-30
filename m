Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F169E8B6BC1
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 09:31:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75F6682A;
	Tue, 30 Apr 2024 09:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75F6682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714462284;
	bh=lweGfDIlGI2nmsgmRB1WBR7R2QWr5hP78T1d5i2qsj8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pf9cU7IQkURNUow+nYORAwlmGDbOXLrJIKIbn6tom+jKJjoB2ZAiNHDyE7CEiVrJS
	 kbI9e1MGqui99eo28sz/WFujaWiWnkvCWo+x9TCTfNU/mI6naXY6PFoi6lKnokhm/J
	 Pdz2ZWsR5QJlBBh4AAPhP2AzL51zQCL/qBNMf3io=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35BBCF8058C; Tue, 30 Apr 2024 09:30:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A5F3F80570;
	Tue, 30 Apr 2024 09:30:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2743EF80266; Tue, 30 Apr 2024 09:29:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7142AF8003A
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 09:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7142AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=kEySrfs2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gCvtzm7i;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=kEySrfs2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gCvtzm7i
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7D2C41F7C7;
	Tue, 30 Apr 2024 07:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714462149;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=69ZdtCtJjvr3V5TXSmtMXF57C4EjGwdpN/08M8Ut6SQ=;
	b=kEySrfs2e/papNB7c33RAcjpYFHuM0BbA6aXi0jYdZpKfmTX36UURTU4tlNO2fjcma9CnQ
	VC5IXT4Fp1hnnndqiWaBDVsB9U9N6lV/eVdl92/cjeJt1IwbNBIT7GyB/ZRpjUg+YJf6if
	vAkQhQ9PIZTDH3CseWUz2FY3GbozWLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714462149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=69ZdtCtJjvr3V5TXSmtMXF57C4EjGwdpN/08M8Ut6SQ=;
	b=gCvtzm7iVM1AABXqCJvvc2njO8UJCGR3lLVj8/SREf69eae9eJTWfcZ1ZqmPsApGBuRjX9
	qoqsyj7Ftsg+PWCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714462149;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=69ZdtCtJjvr3V5TXSmtMXF57C4EjGwdpN/08M8Ut6SQ=;
	b=kEySrfs2e/papNB7c33RAcjpYFHuM0BbA6aXi0jYdZpKfmTX36UURTU4tlNO2fjcma9CnQ
	VC5IXT4Fp1hnnndqiWaBDVsB9U9N6lV/eVdl92/cjeJt1IwbNBIT7GyB/ZRpjUg+YJf6if
	vAkQhQ9PIZTDH3CseWUz2FY3GbozWLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714462149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=69ZdtCtJjvr3V5TXSmtMXF57C4EjGwdpN/08M8Ut6SQ=;
	b=gCvtzm7iVM1AABXqCJvvc2njO8UJCGR3lLVj8/SREf69eae9eJTWfcZ1ZqmPsApGBuRjX9
	qoqsyj7Ftsg+PWCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49239133A7;
	Tue, 30 Apr 2024 07:29:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X5C2EMWdMGYRNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Apr 2024 07:29:09 +0000
Date: Tue, 30 Apr 2024 09:29:21 +0200
Message-ID: <87edannwa6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/2] ALSA: hda: cs35l41: Ignore errors when configuring
 interrupts to allow laptops with bad ACPI to play audio
In-Reply-To: <20240429154853.9393-1-sbinding@opensource.cirrus.com>
References: <20240429154853.9393-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.58 / 50.00];
	BAYES_HAM(-2.28)[96.64%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: KK7E5NN4DW6Z3ZQQZ7HUXVMADKHDWI43
X-Message-ID-Hash: KK7E5NN4DW6Z3ZQQZ7HUXVMADKHDWI43
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KK7E5NN4DW6Z3ZQQZ7HUXVMADKHDWI43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Apr 2024 17:48:51 +0200,
Stefan Binding wrote:
> 
> Some laptops have a bad _CRS defined for its interrupt.
> This errors out inside the driver probe for CS35L41 HDA.
> However, there is no fix in software for this bad configuration,
> and it is unlikely to get a new BIOS, therefore it is better to
> allow the laptop to continue probe, instead of erroring out inside
> the probe. The interrupt is only used for Error Detection and
> recovery, without the interrupt the driver will continue to function,
> but errors will not be detected, and recovery will require a reboot.
> 
> Also add support for ASUS ROG 2024 laptops.
> These laptops were released without _DSD, so need to be added into
> the CS35L41 config table. Quirks for these laptops already exist.
> 
> Stefan Binding (2):
>   ALSA: hda: cs35l41: Ignore errors when configuring IRQs
>   ALSA: hda: cs35l41: Add support for ASUS ROG 2024 Laptops

Thanks, applied both patches to for-next branch now.


Takashi
