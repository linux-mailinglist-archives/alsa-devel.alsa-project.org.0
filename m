Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3FD7A4E02
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 18:05:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5292DEC;
	Mon, 18 Sep 2023 18:04:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5292DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695053103;
	bh=AK1rbXX9OFHjt2Nf/vVo4VmuO4/7zP5FL/s75eIJruE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kn2P5AjqtW1IjXdxTbDwdtye2h6ZS6Be06ncsP9p19DDPaZYfPiUGPXXxjThd5dKQ
	 GTPWTBrrqKwXFMuWNJP3TZ5yegB01wy4jYJkNPOw52ZHl5YvdAYUjqbuyHGKGVBMTF
	 t8andt1C4LDV49V6FfJFGqAUjD70VWHVGgpHoqg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDBB1F8055A; Mon, 18 Sep 2023 18:04:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7308FF8025A;
	Mon, 18 Sep 2023 18:04:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B236AF8025A; Mon, 18 Sep 2023 18:04:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9862EF80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 18:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9862EF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tJEAZfRs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/Ki7iBXE
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5CEE41FFC4;
	Mon, 18 Sep 2023 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695053046;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zhMUK9UW4puMA8+e626q/mX4DpZltH/tBVHAy2TFCdk=;
	b=tJEAZfRsLkUu4aMKUxrBPhlu7dn/4lIYaOFDG725MGfTiQoOK59n3oguMRTTWVgDK0hre/
	aemckBS0zFm+brYTOdc36vlkL63/+1oblQ0i1rlcw/0slNt7SCB6Ee/W+iL4qzac1PoUgx
	ZOkY+GH3zvs3OVEM9jh6cR/eAJIURMs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695053046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zhMUK9UW4puMA8+e626q/mX4DpZltH/tBVHAy2TFCdk=;
	b=/Ki7iBXE+G+gu7eOVT8x3eSsxDtnHhCDuewKxAp9FtPP+vQ5W6i+FByGuDrWXfs9TPjVNc
	jBkq4fSgK6QGRZAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2266C13480;
	Mon, 18 Sep 2023 16:04:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id TYNnB/Z0CGVcbwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 18 Sep 2023 16:04:06 +0000
Date: Mon, 18 Sep 2023 18:04:05 +0200
Message-ID: <87edivzcwa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] Support mute notifications for CS35L41 HDA
In-Reply-To: <20230908133421.2483508-1-sbinding@opensource.cirrus.com>
References: <20230908133421.2483508-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GXPL236ZVM6LBDXG4GRAV6ICQHRWOVVW
X-Message-ID-Hash: GXPL236ZVM6LBDXG4GRAV6ICQHRWOVVW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXPL236ZVM6LBDXG4GRAV6ICQHRWOVVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 08 Sep 2023 15:34:19 +0200,
Stefan Binding wrote:
> 
> Some systems use a special keyboard shortcut to mute speaker audio.
> On systems using CS35L41 HDA which have this shortcut, add a
> mechanism which uses ACPI notifications to determine when the
> shortcut is pressed, and then mute the amps inside the driver.
> 
> Since this is not a normal mute mechanism, it does not go through
> userspace. To allow userspace to be able to track this special
> state, add an ALSA control which tracks the state of this forced
> mute
> 
> Stefan Binding (1):
>   ALSA: hda: cs35l41: Add read-only ALSA control for forced mute
> 
> Vitaly Rodionov (1):
>   ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA

JFYI, I didn't take those patches due to the errors 0-day bot showed.
Please resubmit the fixed patch set.


thanks,

Takashi
