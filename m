Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEB488BB14
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 08:19:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93829233B;
	Tue, 26 Mar 2024 08:18:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93829233B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711437543;
	bh=QB2znJuNJc7Jw3xDnmQHgrPw3SJ62BZDEf9LwLRRtj0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IpVsLhMBYtDNQq7c7YONSLbE0vJCcnJUXhvs3vUTrCpUkSa0xkAEGvgQorHIcELNL
	 nZWESwVGVk0NK0z1FD1+u+6XK5pO7kyRO2aV9pAYPUqrK0b9E/NbXKW9S9eivxr6g2
	 wS7BQU+g+Ls5zCix/A7elu1mFvIZEjk8+Are6aVI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53BB6F805A1; Tue, 26 Mar 2024 08:18:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88D91F8025F;
	Tue, 26 Mar 2024 08:18:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56D4DF8025F; Tue, 26 Mar 2024 08:16:52 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0357CF80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 08:16:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0357CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ss93DTeF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=p/9ZdpiT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Ss93DTeF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=p/9ZdpiT
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 865A0378A1;
	Tue, 26 Mar 2024 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711437401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SudFTEiUfI2unsWkokt8yBfOaCJEwdmvYWm1y/DzONg=;
	b=Ss93DTeFG9sYuMPeu2NOamNVGp1y2O+nQyXeDZrMtLXihWjIvrba9Oa7Endx2hc8AX8RVq
	jLe2JqbGUCtUqqHZXldbtwzQKj8ydPHX5e11ZP0sgxCV77I9Zax27P2uoTexdYkuzYCMgK
	dOc2nd/qpPFqj7TPav5G6dKASrWsFq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711437401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SudFTEiUfI2unsWkokt8yBfOaCJEwdmvYWm1y/DzONg=;
	b=p/9ZdpiTRT6das/OoDxTgu/JxL8fXwUIdzpaW7qFg6yCbi/+32eXjla3Ue6gfMhHWvP9g4
	kXOFiNRpbYVDXVCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711437401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SudFTEiUfI2unsWkokt8yBfOaCJEwdmvYWm1y/DzONg=;
	b=Ss93DTeFG9sYuMPeu2NOamNVGp1y2O+nQyXeDZrMtLXihWjIvrba9Oa7Endx2hc8AX8RVq
	jLe2JqbGUCtUqqHZXldbtwzQKj8ydPHX5e11ZP0sgxCV77I9Zax27P2uoTexdYkuzYCMgK
	dOc2nd/qpPFqj7TPav5G6dKASrWsFq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711437401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SudFTEiUfI2unsWkokt8yBfOaCJEwdmvYWm1y/DzONg=;
	b=p/9ZdpiTRT6das/OoDxTgu/JxL8fXwUIdzpaW7qFg6yCbi/+32eXjla3Ue6gfMhHWvP9g4
	kXOFiNRpbYVDXVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3615013306;
	Tue, 26 Mar 2024 07:16:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +DCdC1l2AmZbTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Mar 2024 07:16:41 +0000
Date: Tue, 26 Mar 2024 08:16:42 +0100
Message-ID: <874jctwjhh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Gergo Koteles <soyer@irl.hu>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ALSA: hda/tas2781: add debug statements to kcontrols
In-Reply-To: <377e0f33-697c-4baf-ac48-baff6199dd53@linux.intel.com>
References: <cover.1711401621.git.soyer@irl.hu>
	<cbdc337b911bee0f80f805b936041fd59c1db54a.1711401621.git.soyer@irl.hu>
	<377e0f33-697c-4baf-ac48-baff6199dd53@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.27 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.76)[84.29%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ss93DTeF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="p/9ZdpiT"
X-Rspamd-Queue-Id: 865A0378A1
Message-ID-Hash: 2WL4VE32QNYSURD6MU6EQ3M5TCCA2G7K
X-Message-ID-Hash: 2WL4VE32QNYSURD6MU6EQ3M5TCCA2G7K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WL4VE32QNYSURD6MU6EQ3M5TCCA2G7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Mar 2024 23:01:18 +0100,
Pierre-Louis Bossart wrote:
> 
> 
> 
> 
> > +++ b/sound/pci/hda/tas2781_hda_i2c.c
> > @@ -189,6 +189,9 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
> >  
> >  	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
> >  
> > +	dev_dbg(tas_priv->dev, "%s: %d\n", __func__,
> 
> Nit-pick: you don't need to add __func__ to dev_dbg logs, the user can
> add the information with the dyndbg parameter, e.g.
> 
> options snd_intel_dspcfg dyndbg=+pmf

Since this doesn't always show up, I don't mind to have the function
name shown explicitly there.  OTOH, what bothers me is that all those
messages have a short format "__func__: %d" while the values are
utterly different, depending on the function.  That can be confusing.
IMO, it'd be more user-friendly to indicate what values are presented,
too.


thanks,

Takashi
