Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF51750A3A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:59:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EBBA206;
	Wed, 12 Jul 2023 15:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EBBA206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689170368;
	bh=7tOqmZH6ntOQ9pEbQBqICFHKwM2n3IYS7V926rY9cPM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cpQ1U8annGOISt6QYtGrPWf10aDFTUxX4U1IhsbNZ4lY4qFVDUoCCEi8uugw4WEM6
	 QoiPeN7BXxbIm7NBgwV9SRA3BY5TzRp2ckYsoiffcQ5R4SCkA8OV4MhGtxSsXkOguy
	 +ELdlglVFWXiJVfUXv8WtuywbzR/Z5LACY75ozIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11713F80535; Wed, 12 Jul 2023 15:58:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE743F80236;
	Wed, 12 Jul 2023 15:58:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE9D7F80249; Wed, 12 Jul 2023 15:58:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BC7E4F800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 15:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC7E4F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Z04wkh3f;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sU6j/Xpm
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45E7222442;
	Wed, 12 Jul 2023 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689170309;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vmnWkhwcT+j/yNyryv4vHMBg8+Hgy12YEYyYHcUPGFc=;
	b=Z04wkh3fjSv21r2LyaRc13YefJ+/1zm6wcqsSZSWO5PIa090rRzq6m+7nAvlmbg8EkeHe7
	+M/zNb0GRT6nCX6t3xbElOb8VSGv2ZtzD1SQsb98Z8vZ+CFCst+oLegS9nhM0QWCF5eua+
	jVaIMULmhR/0UT/w/5M9Kphwj9zMzFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689170309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vmnWkhwcT+j/yNyryv4vHMBg8+Hgy12YEYyYHcUPGFc=;
	b=sU6j/Xpm7cZtQeaajrsPkPTv/Ay2zJ7gcFn2GBsin3ftZvA+XLRZBORhvUl7PCB6to+mWb
	2p33fre/Z+L0jtCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3990D133DD;
	Wed, 12 Jul 2023 13:58:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iK2WDYWxrmSXfgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 12 Jul 2023 13:58:29 +0000
Date: Wed, 12 Jul 2023 15:58:28 +0200
Message-ID: <87r0pdjkor.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Symbolic Debugger" <happy.debugging@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
In-Reply-To: 
 <168916837549.20.16800242816564295866@mailman-web.alsa-project.org>
References: <168839241976.20.1297601488525827705@mailman-web.alsa-project.org>
	<168916837549.20.16800242816564295866@mailman-web.alsa-project.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: O47XN6PA7JKC4WMOID3AWMBY67Q7CO5V
X-Message-ID-Hash: O47XN6PA7JKC4WMOID3AWMBY67Q7CO5V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O47XN6PA7JKC4WMOID3AWMBY67Q7CO5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 15:26:15 +0200,
Symbolic Debugger wrote:
> 
> A question about the implementation of notification messages (name, endpoint and function blocks)
> 
> The spec defines that these notification only get sent upon receiving a Discovery message. 
> 
> Does this mean that the ALSA driver will poll at specific intervals to send a discover message or  can the device send a notification even without a discovery message from the ALSA driver ? I could imagine a function block info / name, or endpoint info/ name or endpoint info change (i.e when the device changes the number of function block)

It's handled in ALSA UMP core code.  It doesn't poll but just
interprets each incoming UMP messages and responds to it (e.g. when a
notification comes from the device, ALSA core will update the
information accordingly to be visible to user-space).

The change of FB info is indeed allowed by the device, AFAIK.  And,
this can notify via the corresponding UMP Stream messages.  For
example, reassigning UMP Groups in a FB is a valid scenario, and this
will be informed via UMP Stream messages.  For the FBs that will never
change Groups, there is a "static blocks" flag (which was quite
recently introduced).  I guess most of devices mark this, as it's
compatible with the former MIDI 2.0 USB devices.

BTW, the USB MIDI 2.0 gadget function driver is under development.
It's almost ready, and my plan is to submit likely for 6.6 kernel
(that is, in the next week or so).  You can find the patches in
topic/midi20-gadget branch of my sound.git tree.


Takashi
