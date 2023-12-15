Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47626814239
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 08:17:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D67AA4B;
	Fri, 15 Dec 2023 08:16:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D67AA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702624624;
	bh=ppef1rk3YSqVlBIrLfeFE2ehAwmf1PVl6ACtz60763Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H+mpjzz1fUdIwYaGIuNnFVXEB7r2/XJfuXCwmrpRBkGLnqSZz822npCA9ouUxVhBn
	 JYHo799h/T51BWYaSPtktQdhCAWOFdzU5IszJjZKjRUp3vVfpBMHj8xqXP0mBXc75F
	 NIwDgYSDywdCMe3JomAbMnkBHZowwF34frbFiu0o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FF10F80571; Fri, 15 Dec 2023 08:16:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF31BF80537;
	Fri, 15 Dec 2023 08:16:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF33EF8016A; Fri, 15 Dec 2023 08:14:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 460B1F80114
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 08:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 460B1F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HuUfVCfp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0KMe7wA7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HuUfVCfp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0KMe7wA7
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 309241F81D;
	Fri, 15 Dec 2023 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702624439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DueD1ycJeZpomdNur64/vGkxE0MwuO7XBirtEWUESXQ=;
	b=HuUfVCfp+L4OZuCGMUNjNj2K5u3Z3MXxBjt26N6AHE3o3XUXvArLAyp68XL3A0LoL738LR
	0lSl3LY3Ga3PsnoE5avswzuT/xA7AA8fPXv+FiykNA+ylPDplJcStRORjwsSiAbXKj5JR1
	jKNnRFWD0O+KYgoTl6TNcjozEvFFaew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702624439;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DueD1ycJeZpomdNur64/vGkxE0MwuO7XBirtEWUESXQ=;
	b=0KMe7wA79ifaIm0aeQz0UntgBIGdqNGyyie3rjDoLYS2fkGpFareUueG0rKiaHkX9VY6U5
	PQJtJMznpY6TVyDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702624439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DueD1ycJeZpomdNur64/vGkxE0MwuO7XBirtEWUESXQ=;
	b=HuUfVCfp+L4OZuCGMUNjNj2K5u3Z3MXxBjt26N6AHE3o3XUXvArLAyp68XL3A0LoL738LR
	0lSl3LY3Ga3PsnoE5avswzuT/xA7AA8fPXv+FiykNA+ylPDplJcStRORjwsSiAbXKj5JR1
	jKNnRFWD0O+KYgoTl6TNcjozEvFFaew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702624439;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DueD1ycJeZpomdNur64/vGkxE0MwuO7XBirtEWUESXQ=;
	b=0KMe7wA79ifaIm0aeQz0UntgBIGdqNGyyie3rjDoLYS2fkGpFareUueG0rKiaHkX9VY6U5
	PQJtJMznpY6TVyDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E206E13726;
	Fri, 15 Dec 2023 07:13:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BZfVNbb8e2VyKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 Dec 2023 07:13:58 +0000
Date: Fri, 15 Dec 2023 08:13:58 +0100
Message-ID: <87a5qcos3t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781: select program 0, conf 0 by default
In-Reply-To: 
 <038add0bdca1f979cc7abcce8f24cbcd3544084b.1702596646.git.soyer@irl.hu>
References: 
 <038add0bdca1f979cc7abcce8f24cbcd3544084b.1702596646.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HuUfVCfp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0KMe7wA7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.86 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-0.95)[-0.954];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.89)[99.55%]
X-Rspamd-Queue-Id: 309241F81D
Message-ID-Hash: G24KGZNZO24VR2FNO5NKGJAE7VWGNXVT
X-Message-ID-Hash: G24KGZNZO24VR2FNO5NKGJAE7VWGNXVT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G24KGZNZO24VR2FNO5NKGJAE7VWGNXVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Dec 2023 00:33:27 +0100,
Gergo Koteles wrote:
> 
> Currently, cur_prog/cur_conf remains at the default value (-1), while
> program 0 has been loaded into the amplifiers.
> 
> In the playback hook, tasdevice_tuning_switch tries to restore the
> cur_prog/cur_conf. In the runtime_resume/system_resume,
> tasdevice_prmg_load tries to load the cur_prog as well.
> 
> Set cur_prog and cur_conf to 0 if available in the firmware.
> 
> Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> CC: stable@vger.kernel.org
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thanks, applied now.


Takashi
