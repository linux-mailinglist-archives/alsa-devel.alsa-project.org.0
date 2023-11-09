Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC0F7E6D5E
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 16:25:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7834B4E;
	Thu,  9 Nov 2023 16:24:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7834B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699543502;
	bh=NIEumJyJmbmB/ccC4gvq40iR6HjLrkzh6Pu6m+nDgXo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LgCrNluQpub+Hj8n9BkXmD8Rhv1Ifto25o8CnljCU6xGZXd/fl51zbHeYZW/eTbXd
	 CMAbwTFtf532Gt9sXlfFNRvKzAV6EgLQLUIa6D0q16Ck593y4wbAvlFODVSGHHHDw1
	 dZMncrUSyRw6ynWGbsdTHpeG3JjYn5lChKtGX01I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8176F800ED; Thu,  9 Nov 2023 16:24:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FC81F80166;
	Thu,  9 Nov 2023 16:24:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9845EF80169; Thu,  9 Nov 2023 16:24:06 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 129A7F800ED
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 16:24:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 129A7F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AX6//s2h;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sGI+3L4J
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4515F1F8B3;
	Thu,  9 Nov 2023 15:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699543440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvmlhQ7BA4pksq2hWlAaCMOjMJihL8/Vw8k+MsBKlV4=;
	b=AX6//s2hqHuTrXRA9wrl13UgzDU0KLe8szLA+MbJJBtUj7M4lI+F/ZpKX2RXry5fs715ch
	oXZoJo/lRUgrxzuEuF/p15MBGGSg4ZFI5blrfMF1HPQh6Zwry7oZb8sBdYXkAJi4oTEFna
	7B/KAN+xUGT2n+tiJkpxaDv9kaKgqFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699543440;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvmlhQ7BA4pksq2hWlAaCMOjMJihL8/Vw8k+MsBKlV4=;
	b=sGI+3L4JVtETmsesvZJbl+rV1gp+lEXMHBZJgmGIDj4wCGpF/sX2mDbNk7Kc+TmyBekxxD
	gCGqOklafC3JGQAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25D6813524;
	Thu,  9 Nov 2023 15:24:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gdFXCJD5TGU/CgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 09 Nov 2023 15:24:00 +0000
Date: Thu, 09 Nov 2023 16:23:59 +0100
Message-ID: <87fs1frlv4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "vitaly.torshyn@gmail.com" <vitaly.torshyn@gmail.com>
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/1] [Patch v2] ALSA: HDA: Asus UM5302LA: Added quirks for
 cs35L41/10431A83 on i2c bus
In-Reply-To: 
 <CAHiQ-bCMPpCJ8eOYAaVVoqGkFixS1qTgSS4xfbZvL4oZV9LYew@mail.gmail.com>
References: 
 <CAHiQ-bCMPpCJ8eOYAaVVoqGkFixS1qTgSS4xfbZvL4oZV9LYew@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GUUDTBBMKFHABFYJVMS6TTPCEGVPW6QK
X-Message-ID-Hash: GUUDTBBMKFHABFYJVMS6TTPCEGVPW6QK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GUUDTBBMKFHABFYJVMS6TTPCEGVPW6QK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Nov 2023 15:36:55 +0100,
vitaly.torshyn@gmail.com wrote:
> 
> 
> Hi Takashi,
> 
> Proposed second revision of the patch that fixes the initialization of CSC3551
> on the UM5302LA laptop.
> Patching the DSDT table is not required since ASUS did add _DSD entry.
> Nothing new introduced but reused work started by Stefan B.
> 
> Currently there is no official firmware available for 10431A83 on cirrus git
> unfortunately.
> For testing used 104317f3 (which is also seems on i2c bus):
> 
> $ cd /lib/firmware/cirrus/ && \
> for fw in $(find ./ -name '*104317f3*'); do newfw=$(echo $fw | sed 's/104317f3
> /10431a83/g'); echo echo "$fw -> $newfw"; ln -s $f $newfw; done
> 
> With the patch applied to 6.6.0 and obviously symlinks to 104317F3 FW,
> speakers work and to my surprise they sound quite good and loud without
> distortion.
> 
> Probably confirmation from the cirrus team is needed on firmware.
> 
> Signed-off-by: Vitalii Torshyn <vitaly.torshyn@gmail.com>

Now I merged the patch, but at the next time, please try avoiding MIME
patches.  I had to edit and modify manually.  At best, try to submit
via git-send-email.

Also, please update the patch for the latest sound.git tree at the
next time, too.  There was a conflicting update and the manual
adjustment was needed.


thanks,

Takashi
