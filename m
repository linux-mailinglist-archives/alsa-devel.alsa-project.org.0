Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FE172616A
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 15:36:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B27F1FE;
	Wed,  7 Jun 2023 15:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B27F1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686144988;
	bh=GkmGtaDriZa23J554i4NcPZheNmaoGUuuXmeaQnyLDE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=leiYgD+svDUwNFzZAow1XJ1/yjkzt6dkV+vbwacXgH7WHfmzc9QgEdA/bm/8zkG6g
	 W0bk5ytIG1f+96G+KiwOLEMWM8gP4vCqINND8I33H52qhY8uOPD6PpHpRZ0zJeqsfs
	 RPB4nd7wIATYNlWOMa9iM9Z8zS30QTuHiLTZmhe8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79BAEF80494; Wed,  7 Jun 2023 15:35:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07670F80130;
	Wed,  7 Jun 2023 15:35:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86BB1F80199; Wed,  7 Jun 2023 15:35:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 677F0F80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 15:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 677F0F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oTdZBSxn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jkIjQP+4
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC54C1FDAA;
	Wed,  7 Jun 2023 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686144925;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYiTeYmwLMBlpKvFU+nNSlpL2e+cOtcyKH6DxhJ12bE=;
	b=oTdZBSxnsMNNnKsTVUYGnj1R+CFFp6oJFX1LZD2LOn7NxJ03J2hx5m06KB3yhl+47oM4Qk
	3rC1hqbqThHZv3AcZqsAHFUwGRDnCgp3zcvtNlk1Uez3IlfPt65ZKOs2hp0831I2xcFGgx
	hhqvJ4HnuUT+kLiXAOlzfih0pUm8pRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686144925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYiTeYmwLMBlpKvFU+nNSlpL2e+cOtcyKH6DxhJ12bE=;
	b=jkIjQP+4LWHQuK8dPKrwoIRgYghRjTfYsAXtJBvC5sFDLFGG80lhe7Rs3ilL2p+G8p8VG9
	zFIyAPWuoplKj4Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C97E81346D;
	Wed,  7 Jun 2023 13:35:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id i5G+MJ2HgGQSbQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 07 Jun 2023 13:35:25 +0000
Date: Wed, 07 Jun 2023 15:35:25 +0200
Message-ID: <87ilbzgztu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	broonie@kernel.org,
	skhan@linuxfoundation.org,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org,
	himadrispandya@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v4 1/3] docs: sound: add 'pcmtest' driver documentation
In-Reply-To: <20230606193254.20791-1-ivan.orlov0322@gmail.com>
References: <20230606193254.20791-1-ivan.orlov0322@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: O642BV7NH6TQMY3V7UYITBI6TR5JNB75
X-Message-ID-Hash: O642BV7NH6TQMY3V7UYITBI6TR5JNB75
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O642BV7NH6TQMY3V7UYITBI6TR5JNB75/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Jun 2023 21:32:52 +0200,
Ivan Orlov wrote:
> 
> Add documentation for the new Virtual PCM Test Driver. It covers all
> possible usage cases: errors and delay injections, random and
> pattern-based data generation, playback and ioctl redefinition
> functionalities testing.
> 
> We have a lot of different virtual media drivers, which can be used for
> testing of the userspace applications and media subsystem middle layer.
> However, all of them are aimed at testing the video functionality and
> simulating the video devices. For audio devices we have only snd-dummy
> module, which is good in simulating the correct behavior of an ALSA device.
> I decided to write a tool, which would help to test the userspace ALSA
> programs (and the PCM middle layer as well) under unusual circumstances
> to figure out how they would behave. So I came up with this Virtual PCM
> Test Driver.
> 
> This new Virtual PCM Test Driver has several features which can be useful
> during the userspace ALSA applications testing/fuzzing, or testing/fuzzing
> of the PCM middle layer. Not all of them can be implemented using the
> existing virtual drivers (like dummy or loopback). Here is what can this
> driver do:
> 
> - Simulate both capture and playback processes
> - Check the playback stream for containing the looped pattern
> - Generate random or pattern-based capture data
> - Inject delays into the playback and capturing processes
> - Inject errors during the PCM callbacks
> 
> Also, this driver can check the playback stream for containing the
> predefined pattern, which is used in the corresponding selftest to check
> the PCM middle layer data transferring functionality. Additionally, this
> driver redefines the default RESET ioctl, and the selftest covers this PCM
> API functionality as well.
> 
> The driver supports both interleaved and non-interleaved access modes, and
> have separate pattern buffers for each channel. The driver supports up to
> 4 channels and up to 8 substreams.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

Now I merged all three patches.


thanks,

Takashi
