Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5087DCA0
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 09:38:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E16B233E;
	Sun, 17 Mar 2024 09:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E16B233E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710664706;
	bh=c+bbqGjD9ItjCEUMB5GJWo/HLn/d82hm11kvr0sPDsM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YTQ+CpVZLn2/2BTFkRps0zq/cc/ruMsnuhCJFPbT3m01mg9vtU1Z9PFbK3HG64phT
	 AZn3b52u5JuFcemTLTN7P2XCA+JVHi5lZzoEjaqvLeeKWBN0loBOD1EPoWY7MrBXW/
	 oQS+hJpWp6beuRXmLQKHywECi/Ustg2CBpqlcqn8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFA07F805AC; Sun, 17 Mar 2024 09:37:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C26A4F805C2;
	Sun, 17 Mar 2024 09:37:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1C5CF804E7; Sun, 17 Mar 2024 09:37:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27AE5F8025F
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 09:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27AE5F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=idxnekbf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q+RUdSnE;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=idxnekbf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q+RUdSnE
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1B0D20887;
	Sun, 17 Mar 2024 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710664624;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CA32GN7w7Gy0elzjx0zMFbSvrRho6U8r0Mxwq6cnA2k=;
	b=idxnekbftCX5aURAKySfor03E7Z8WxA1OBVdEQRJyPjMu1UQyMwUaSlB8oyKUaHQ9DvoCm
	qsjOuVYVLeODL1XH2tTUhZYPHwsBEyykKURk0pyqP60jTuH0mpZ7+hvalgpxMTj6y3BemA
	UH5QMC8bCZQRgjkXXVEjgy0BnN50KmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710664624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CA32GN7w7Gy0elzjx0zMFbSvrRho6U8r0Mxwq6cnA2k=;
	b=Q+RUdSnEsCPdcGF5ICkX/BnzBGBvlSvISciuueVmtVI3VAvUC+tSWnJaoJ5gYDLmglKGsc
	DMsWB8EWfr4JHpAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710664624;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CA32GN7w7Gy0elzjx0zMFbSvrRho6U8r0Mxwq6cnA2k=;
	b=idxnekbftCX5aURAKySfor03E7Z8WxA1OBVdEQRJyPjMu1UQyMwUaSlB8oyKUaHQ9DvoCm
	qsjOuVYVLeODL1XH2tTUhZYPHwsBEyykKURk0pyqP60jTuH0mpZ7+hvalgpxMTj6y3BemA
	UH5QMC8bCZQRgjkXXVEjgy0BnN50KmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710664624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CA32GN7w7Gy0elzjx0zMFbSvrRho6U8r0Mxwq6cnA2k=;
	b=Q+RUdSnEsCPdcGF5ICkX/BnzBGBvlSvISciuueVmtVI3VAvUC+tSWnJaoJ5gYDLmglKGsc
	DMsWB8EWfr4JHpAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80D2A1349D;
	Sun, 17 Mar 2024 08:37:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1rtbHbCr9mUjSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 17 Mar 2024 08:37:04 +0000
Date: Sun, 17 Mar 2024 09:37:03 +0100
Message-ID: <874jd59rv4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: core: add kunitconfig
In-Reply-To: <20240317024050.588370-1-o-takashi@sakamocchi.jp>
References: <20240317024050.588370-1-o-takashi@sakamocchi.jp>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.998];
	 RCPT_COUNT_TWO(0.00)[2];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Authentication-Results: smtp-out2.suse.de;
	none
Message-ID-Hash: XND5LRZRHN6EYLNVZDBWN4LPSCLMPHXE
X-Message-ID-Hash: XND5LRZRHN6EYLNVZDBWN4LPSCLMPHXE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XND5LRZRHN6EYLNVZDBWN4LPSCLMPHXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 17 Mar 2024 03:40:50 +0100,
Takashi Sakamoto wrote:
> 
> It is helpful to add .kunitconfig if we work with the tools provided by
> KUnit project. The file describes the series of kernel configurations to
> satisfy the dependency to build the target test.
> 
> For example:
> 
> $ ./tools/testing/kunit/kunit.py run --arch=arm64 --cross_compile=aarch64-linux-gnu- --kunitconfig=sound/core/
> [11:35:13] Configuring KUnit Kernel ...
> Regenerating .config ...
> Populating config with:
> $ make ARCH=arm64 O=.kunit olddefconfig CROSS_COMPILE=aarch64-linux-gnu-
> [11:35:19] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=arm64 O=.kunit olddefconfig CROSS_COMPILE=aarch64-linux-gnu-
> Building with:
> $ make ARCH=arm64 O=.kunit --jobs=8 CROSS_COMPILE=aarch64-linux-gnu-
> [11:37:35] Starting KUnit Kernel (1/1)...
> [11:37:35] ============================================================
> Running tests with:
> $ qemu-system-aarch64 -nodefaults -m 1024 -kernel .kunit/arch/arm64/boot/Image.gz -append 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot' -no-reboot -nographic -serial stdio -machine virt -cpu max,pauth-impdef=on
> [11:37:35] ============== sound-core-test (10 subtests) ===============
> [11:37:35] [PASSED] test_phys_format_size
> [11:37:35] [PASSED] test_format_width
> [11:37:35] [PASSED] test_format_endianness
> [11:37:35] [PASSED] test_format_signed
> [11:37:35] [PASSED] test_format_fill_silence
> [11:37:35] [PASSED] test_playback_avail
> [11:37:35] [PASSED] test_capture_avail
> [11:37:35] [PASSED] test_card_set_id
> [11:37:35] [PASSED] test_pcm_format_name
> [11:37:35] [PASSED] test_card_add_component
> [11:37:35] ================= [PASSED] sound-core-test =================
> [11:37:35] ============================================================
> [11:37:35] Testing complete. Ran 10 tests: passed: 10
> [11:37:35] Elapsed time: 142.333s total, 5.617s configuring, 136.047s building, 0.630s running
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Applied now.  Thanks.


Takashi
