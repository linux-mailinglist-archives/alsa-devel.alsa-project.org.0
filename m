Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0686766460
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 08:41:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF17B827;
	Fri, 28 Jul 2023 08:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF17B827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690526481;
	bh=nvjEvYWC818S/gK9ndRKLk27Dao+Ey1nPAZw2eSJY2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jx3YSM/zDqFNUItIJnrvP2S1Feose43ah781jnMPvACa8PeyzdsibNlX0PFpnxr19
	 VPgjBhaU8Tl2j4Y+xRlwMjtASMZr+ZwLjvpHlYNvM0pr52vU3WoTYfm7Vl89qTZ5ZO
	 WrAhUdttl+y4FtfUa5+bM4gP6JtG+L1esCPP4cBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08B39F802E8; Fri, 28 Jul 2023 08:40:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 842CEF80163;
	Fri, 28 Jul 2023 08:40:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B9E6F8019B; Fri, 28 Jul 2023 08:40:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CBA8CF80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 08:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBA8CF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eBpRklMf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=R1b0Ocgu
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB07721A20;
	Fri, 28 Jul 2023 06:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690526413;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XlKgVuBwxhBrU+hJz3skBfkXqX/gjlpigbuPenxR+bc=;
	b=eBpRklMf4kgW3llIiRyhrQExSIw1EJ8BDlWkHRseOATFi/5nhpNeNB2sNrMaZ3Zo1WtwKt
	gtfN8bEJUHdri7VSAX9P7vkEcxfcTbInPnzfrz7B0D97SMZ3TuuKvn32u5HWUqPRJd+J5D
	PlMx4gEuNmSj2wvrx1u/QMknhzhZGnU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690526413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XlKgVuBwxhBrU+hJz3skBfkXqX/gjlpigbuPenxR+bc=;
	b=R1b0Ocgu31yF3wBLbFHlfoCbniug7+w05J6NxZE3jfL/mRtBH2LyQOXVz/FLfS+J5dZrgC
	3CC9RIYLgyf1icAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A7EA133F7;
	Fri, 28 Jul 2023 06:40:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id n5WvJM1iw2RzMgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 28 Jul 2023 06:40:13 +0000
Date: Fri, 28 Jul 2023 08:40:13 +0200
Message-ID: <871qgs4jzm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org,
	Tejun Heo <tj@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3] um/drivers: fix hostaudio build errors
In-Reply-To: <20230728043013.27776-1-rdunlap@infradead.org>
References: <20230728043013.27776-1-rdunlap@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: EUIMQIQIIOSD3JC3I2RRQNHK4ECYOCYS
X-Message-ID-Hash: EUIMQIQIIOSD3JC3I2RRQNHK4ECYOCYS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUIMQIQIIOSD3JC3I2RRQNHK4ECYOCYS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 28 Jul 2023 06:30:13 +0200,
Randy Dunlap wrote:
> 
> Use "select"s to ensure that the required kconfig symbols are set
> as expected.
> Drop HOSTAUDIO since it is now equivalent to UML_SOUND.
> 
> Allow SOUND with UML regardless of HAS_IOMEM. Otherwise there is a
> kconfig warning for unmet dependencies. (This was not an issue when
> SOUND was defined in arch/um/drivers/Kconfig. I have done 50 randconfig
> builds and didn't find any issues.)
> 
> This fixes build errors when CONFIG_SOUND is not set:
> 
> ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_cleanup_module':
> hostaudio_kern.c:(.exit.text+0xa): undefined reference to `unregister_sound_mixer'
> ld: hostaudio_kern.c:(.exit.text+0x15): undefined reference to `unregister_sound_dsp'
> ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_init_module':
> hostaudio_kern.c:(.init.text+0x19): undefined reference to `register_sound_dsp'
> ld: hostaudio_kern.c:(.init.text+0x31): undefined reference to `register_sound_mixer'
> ld: hostaudio_kern.c:(.init.text+0x49): undefined reference to `unregister_sound_dsp'
> 
> and this kconfig warning:
> WARNING: unmet direct dependencies detected for SOUND
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: d886e87cb82b ("sound: make OSS sound core optional")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: lore.kernel.org/r/202307141416.vxuRVpFv-lkp@intel.com
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: linux-um@lists.infradead.org
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: linux-kbuild@vger.kernel.org
> Cc: alsa-devel@alsa-project.org

Reviewed-by: Takashi Iwai <tiwai@suse.de>


I'm not sure who should take it.  If it's preferred through sound.git
tree, let me know.


thanks,

Takashi
