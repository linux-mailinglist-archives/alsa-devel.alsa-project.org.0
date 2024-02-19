Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32213859E32
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 09:28:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A519786F;
	Mon, 19 Feb 2024 09:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A519786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708331326;
	bh=iiNpR/KMucHoTl35VBs+bsXrbVFMb8dHMt4hYfcC6Hs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TNek9/NxRRO5bI8ixM5Ok+h8xaMYA8/X3ZwysUSxW0PdsgDyqHHsHzq7xn9knOux7
	 VGJbr7Gt7lt2drC70q2jddFH+jCbTwCYcEgv26T6fS5nhX90/dAUemgQMs8r6I1smb
	 1TXsMIXGu6/yL+Uc1Tk9cesKWfu2RXU3yUznSoEQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52E80F8057D; Mon, 19 Feb 2024 09:28:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24B6BF8047D;
	Mon, 19 Feb 2024 09:28:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8CD4F80496; Mon, 19 Feb 2024 09:25:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD6F3F8019B
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 09:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD6F3F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RyllNQ5X;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mwwsqh5T;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=RyllNQ5X;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mwwsqh5T
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C63E21DD2;
	Mon, 19 Feb 2024 08:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708331119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1KWNTViRt/1frULVE+V+KmyTGRei1ISHfruuRT0LJ2M=;
	b=RyllNQ5X7ye3EkX/WmIctYhbItNYGmUgTI0epq21O40uB0ZZOPPtAMpG8yTS0N6KrT67Fs
	lZ4d2CsyJ1Ok+Skk9SpjPSe105H+Kjdrlb1OT1KNAWOP7c4a5V6TQylyq8bQq/Knf5nRRM
	RGR+HVJztQHrvPVpk0Htp7inSN9AbUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708331119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1KWNTViRt/1frULVE+V+KmyTGRei1ISHfruuRT0LJ2M=;
	b=mwwsqh5TkqdfIDYy8V673fMLpy6c2qlksK2bQ7PG6LgyCcd//22+dmTq+G8Z5XdXBlBwNs
	A71r3NTcIEwSVDDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708331119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1KWNTViRt/1frULVE+V+KmyTGRei1ISHfruuRT0LJ2M=;
	b=RyllNQ5X7ye3EkX/WmIctYhbItNYGmUgTI0epq21O40uB0ZZOPPtAMpG8yTS0N6KrT67Fs
	lZ4d2CsyJ1Ok+Skk9SpjPSe105H+Kjdrlb1OT1KNAWOP7c4a5V6TQylyq8bQq/Knf5nRRM
	RGR+HVJztQHrvPVpk0Htp7inSN9AbUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708331119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1KWNTViRt/1frULVE+V+KmyTGRei1ISHfruuRT0LJ2M=;
	b=mwwsqh5TkqdfIDYy8V673fMLpy6c2qlksK2bQ7PG6LgyCcd//22+dmTq+G8Z5XdXBlBwNs
	A71r3NTcIEwSVDDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2EC6413647;
	Mon, 19 Feb 2024 08:25:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NdDtCW8Q02X/BAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Feb 2024 08:25:19 +0000
Date: Mon, 19 Feb 2024 09:25:18 +0100
Message-ID: <878r3gq2s1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/4] ALSA: oxfw: add support for Miglia Harmony Audio
In-Reply-To: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
References: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-0.39 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWO(0.00)[2];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.09)[64.93%]
Message-ID-Hash: RAQUYMCMOAGVNRQHJLT7L7QVWNB4APKF
X-Message-ID-Hash: RAQUYMCMOAGVNRQHJLT7L7QVWNB4APKF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAQUYMCMOAGVNRQHJLT7L7QVWNB4APKF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 18 Feb 2024 08:41:24 +0100,
Takashi Sakamoto wrote:
> 
> Hi,
> 
> There used to be a company called Miglia Technologies Ltd. in the UK,
> and the company was selling a product called Harmony Audio in 2004. Upon
> obtaining the product by chance recently and examining its internals, it
> was revealed that it utilizes Oxford Semiconductor OXFW970 for its
> communication function in IEEE 1394 bus.
> 
> This patchset adds support for the model.
> 
> Takashi Sakamoto (4):
>   ALSA: oxfw: use const qualifier for immutable argument
>   ALSA: oxfw: support the case that AV/C Stream Format Information
>     command is not available
>   ALSA: firewire-lib: handle quirk to calculate payload quadlets as data
>     block counter
>   ALSA: oxfw: add support for Miglia Harmony Audio

Applied all four patches now.  Thanks.


Takashi
