Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AACEE701C8C
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 11:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D4C6A4E;
	Sun, 14 May 2023 11:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D4C6A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684056151;
	bh=QgDfnfr2efMi8/Dx4SMahQg4L0TgVuwNXNEqGQP3B9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fPsHcbT6KBb9fztgF3EVpMVqitSxULYmMJiDtBxU1F5F5/S4R9Ky0hXKc83a4KFZ9
	 bXP4EPPe4XpwMJjCJQLGIUVyHK4SgQ8B+a/XXH+sNG8ZC9NJPfdhu/iovg3OgeRRVn
	 cDrz9GzjvILClo/4iF8U05MIeEqIAgjY5F8VyYGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84BB9F8025A; Sun, 14 May 2023 11:21:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08916F8025A;
	Sun, 14 May 2023 11:21:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CAFBF80272; Sun, 14 May 2023 11:21:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7005FF80087
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 11:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7005FF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QpgO/QJZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ernnJwYM
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED0AD22043;
	Sun, 14 May 2023 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684056070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NrSVGuN+ZkxpGnBq9VKUcBsPewYH/G3H0ud++SHyqbo=;
	b=QpgO/QJZg2n4S4sEymYKQ+VxgADrvGa1ctJTJRfJsTZIX3dMxhRsFq0NkVATQFCZXJh3Sb
	AMdI32XW2aMiLRODBHYAhrIqiL15afWYwy6uj/eH/kfF0/fNdsEiAvAeyawDkO7YOn/swW
	7r2bCaase5KBE8U76mljZZGO/r5MWwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684056070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NrSVGuN+ZkxpGnBq9VKUcBsPewYH/G3H0ud++SHyqbo=;
	b=ernnJwYMplEK4bqZIK9iCYJ69gRhfvoYnM7M0SDoYFwZXFwDbEEv6VGuFKz1JMpAeklBih
	h9ZARNAI7gJW6zBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99E29138F5;
	Sun, 14 May 2023 09:21:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 52S+JAaoYGSxUAAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 14 May 2023 09:21:10 +0000
Date: Sun, 14 May 2023 11:21:10 +0200
Message-ID: <877ctb8e0p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: corbet@lwn.net,
	akpm@linux-foundation.org,
	perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org,
	himadrispandya@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 1/3] docs: admin-guide: add valsa driver documentation
In-Reply-To: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 4IIB47V3CYZBPGL4DG2TR5NRJE4A574M
X-Message-ID-Hash: 4IIB47V3CYZBPGL4DG2TR5NRJE4A574M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IIB47V3CYZBPGL4DG2TR5NRJE4A574M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 13 May 2023 22:20:35 +0200,
Ivan Orlov wrote:
> 
> Add documentation for the new Virtual ALSA driver. It covers all possible
> usage cases: errors and delay injections, random and pattern-based data
> generation, playback and ioctl redefinition functionalities testing.
> 
> We have a lot of different virtual media drivers, which can be used for
> testing of the userspace applications and media subsystem middle layer.
> However, all of them are aimed at testing the video functionality and
> simulating the video devices. For audio devices we have only snd-dummy
> module, which is good in simulating the correct behavior of an ALSA device.
> I decided to write a tool, which would help to test the userspace ALSA
> programs (and the PCM middle layer as well) under unusual circumstances
> to figure out how they would behave. So I came up with this Virtual ALSA
> Driver.
> 
> This new Virtual ALSA Driver has several features which can be useful
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
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>  Documentation/admin-guide/index.rst |   1 +
>  Documentation/admin-guide/valsa.rst | 114 ++++++++++++++++++++++++++++

We have already subdirectories for the sound stuff
(Documentation/sound/*), and this should go to there, I suppose
(unless there is somewhere dedicated for each selftest scenario).


thanks,

Takashi
