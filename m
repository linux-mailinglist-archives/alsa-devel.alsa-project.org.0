Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D627589146E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 08:40:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCE862CA7;
	Fri, 29 Mar 2024 08:40:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCE862CA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711698053;
	bh=opYRELNRgzeZW7E1JHSDPHg/xw4e1gMY1XsmC5fZYNE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GyGMUtwW0uqGEXWMaIV4j+2W0oPD3kKAjgqSzB9DKNGs6zD9NQllhkuqgigLjhpLI
	 amYF3kXMdXG5upK5S0bigAxXRbq3JZSum0vspSHDVd6R8Rm+rNo0lW2dsOez274CF7
	 KqMHHQ7m1zuAuYBd6JAH0yD3d7BWXdqKJcOOofHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7071AF80093; Fri, 29 Mar 2024 08:40:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C25A6F805A1;
	Fri, 29 Mar 2024 08:40:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A0C6F8025F; Fri, 29 Mar 2024 08:38:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D2DEF801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 08:38:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D2DEF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ezeeq575;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9ZZ1kCM3
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 05FA733D86;
	Fri, 29 Mar 2024 07:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711697889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qr/NlwU4Fj7vdoto26TFYwaxntfyHuHSAx6yQeeZ3q0=;
	b=ezeeq575IMEZ6eYt6/e9VyQIvmrAn8iS8VLRUgA33MmZW+XmtII98nzwkLzzMJc7S92rMe
	VaW6BUIY90WNw77mWVQSSNq3IW5L9etnMLjCRLJMA6vAUQqZ857/AJxxM6gc9PjF9+UnrK
	baMTGPlKKWgDtutoLbKRmlplDe1QoKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711697889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qr/NlwU4Fj7vdoto26TFYwaxntfyHuHSAx6yQeeZ3q0=;
	b=9ZZ1kCM3/Zop7VbM3rcDJMXmFX2tPKOIHVoXFCm9Bogl2kFypo1WSjS2J+trs6yh4LzcFg
	hE5eIcWemm9fdRBA==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id AC93113A9F;
	Fri, 29 Mar 2024 07:38:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 4WqrKOBvBmaEcwAAn2gu4w
	(envelope-from <tiwai@suse.de>); Fri, 29 Mar 2024 07:38:08 +0000
Date: Fri, 29 Mar 2024 08:38:11 +0100
Message-ID: <87o7ax8p3w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ASoC: tas2781: mark dvc_tlv with __maybe_unused
In-Reply-To: 
 <0e461545a2a6e9b6152985143e50526322e5f76b.1711665731.git.soyer@irl.hu>
References: 
 <0e461545a2a6e9b6152985143e50526322e5f76b.1711665731.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.49 / 50.00];
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
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.19)[70.84%]
Message-ID-Hash: OUQXF5L6UXKZGJEAS3RASNAD5WAGUD37
X-Message-ID-Hash: OUQXF5L6UXKZGJEAS3RASNAD5WAGUD37
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUQXF5L6UXKZGJEAS3RASNAD5WAGUD37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 28 Mar 2024 23:47:37 +0100,
Gergo Koteles wrote:
> 
> Since we put dvc_tlv static variable to a header file it's copied to
> each module that includes the header. But not all of them are actually
> used it.
> 
> Fix this W=1 build warning:
> 
> include/sound/tas2781-tlv.h:18:35: warning: 'dvc_tlv' defined but not
> used [-Wunused-const-variable=]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403290354.v0StnRpc-lkp@intel.com/
> Fixes: ae065d0ce9e3 ("ALSA: hda/tas2781: remove digital gain kcontrol")
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thanks, applied now.


Takashi
