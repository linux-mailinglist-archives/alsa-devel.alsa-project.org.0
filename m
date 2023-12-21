Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD5281B288
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 10:37:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEDD783E;
	Thu, 21 Dec 2023 10:37:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEDD783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703151452;
	bh=w076BQh5dHLwPvxVT09CAQD0wPnab9geAUgUysm4WGs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FaL+hTjhcf4DjcRipXgS62alanmlRQ/G8u4tyP8/ggyFiJggQuS6SbLYLbyvZelEo
	 PlMXnktbiN+U4NYyZbraj3HXcOv+XcodefiZqrrEVtbdutdlNkSAnSzJ9EkjFnM2S2
	 QuiJfO+AeqwM2qZ4KfZjdxvmW9Ud16/LPGJDyY8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 897F6F80587; Thu, 21 Dec 2023 10:37:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3845F80571;
	Thu, 21 Dec 2023 10:37:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64872F80153; Thu, 21 Dec 2023 10:36:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16103F800F5
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 10:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16103F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SrTer4no;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ywr/+jLd;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=SrTer4no;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ywr/+jLd
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 06671219C7;
	Thu, 21 Dec 2023 09:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703151406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jpyugYPGDfPA4iIibcSdhT+W1y7H878ZPzo94O2QO9Y=;
	b=SrTer4noz9f3Vv5AJNW7fbhZz6IpSKxYmIOZhaRbqF3wZcZofHc2rlu7DRc4Twt1h+46mN
	BJavC4ZTehvQo11uYePVz6X50O6kxMfzB6GggA1LdCq8hanYUAXyAFDbIAnNkBM06Iqb/X
	vvVrFoZpewZuHOnFAx/DyB0sV+M4V0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703151406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jpyugYPGDfPA4iIibcSdhT+W1y7H878ZPzo94O2QO9Y=;
	b=ywr/+jLdUvdcx/DsHk66OtrAzI5xtR4IqrRoFeCbY28FnFw3/wmxUM1TA9IO6UB3+zUYJ0
	8oU65GJxZ8o2oNDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703151406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jpyugYPGDfPA4iIibcSdhT+W1y7H878ZPzo94O2QO9Y=;
	b=SrTer4noz9f3Vv5AJNW7fbhZz6IpSKxYmIOZhaRbqF3wZcZofHc2rlu7DRc4Twt1h+46mN
	BJavC4ZTehvQo11uYePVz6X50O6kxMfzB6GggA1LdCq8hanYUAXyAFDbIAnNkBM06Iqb/X
	vvVrFoZpewZuHOnFAx/DyB0sV+M4V0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703151406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jpyugYPGDfPA4iIibcSdhT+W1y7H878ZPzo94O2QO9Y=;
	b=ywr/+jLdUvdcx/DsHk66OtrAzI5xtR4IqrRoFeCbY28FnFw3/wmxUM1TA9IO6UB3+zUYJ0
	8oU65GJxZ8o2oNDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5A3513725;
	Thu, 21 Dec 2023 09:36:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XcWkNy0HhGVDNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Dec 2023 09:36:45 +0000
Date: Thu, 21 Dec 2023 10:36:41 +0100
Message-ID: <s5hzfy3ucba.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/3] Support Dell models without _DSD
In-Reply-To: <20231220165829.160711-1-sbinding@opensource.cirrus.com>
References: <20231220165829.160711-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.75 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.44)[97.45%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SrTer4no;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="ywr/+jLd"
X-Rspamd-Queue-Id: 06671219C7
Message-ID-Hash: 55YABBKCTPGL4NSCIX2X5LTE5T7GXXEV
X-Message-ID-Hash: 55YABBKCTPGL4NSCIX2X5LTE5T7GXXEV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55YABBKCTPGL4NSCIX2X5LTE5T7GXXEV/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Dec 2023 17:58:26 +0100,
Stefan Binding wrote:
> 
> Add Quirks and driver properties for Dell models.
> Driver properties are required since these models do not have _DSD.
> Additionally, some laptops, including some of these, have an issue
> with their BIOS which causes the SPI speed to be set too slow.
> To ensure a decent performance for laptops with this slow speed,
> disable firmware loading. Running without firmware results in lower
> volume.
> 
> Stefan Binding (3):
>   ALSA: hda: cs35l41: Support additional Dell models without _DSD
>   ALSA: hda: cs35l41: Prevent firmware load if SPI speed too low
>   ALSA: hda/realtek: Add quirks for Dell models

The series doesn't seem applied cleanly.
Could you rebase to my for-linus branch and resubmit?

Though, I feel that it's a bit too much for 6.7 at this very late
stage.  So, I'll likely skip this series and apply to 6.8.


thanks,

Takashi
