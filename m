Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8363823ED9
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 10:43:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D6CE9A;
	Thu,  4 Jan 2024 10:43:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D6CE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704361394;
	bh=HA6ooV9l++QsMmLio7h3R/ZioLQ6j2dW+H/ofh16A3M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EQlyXiswNob5bC+AdfunjX++jyvpd0+QYmVqB5KlzScT9xODLntID0sLh8bRiN5y8
	 RNsUoCeVGGbXxiEEPu0XfW4tqPXYF0Jkh8rUCv84gRX/SMbr1fjnKrfa428u3kgRow
	 GP1mveEuVqu93v7cmdWUuIrT+TwIm/A/zW/ePsSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACEC8F80580; Thu,  4 Jan 2024 10:42:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1CC6F80580;
	Thu,  4 Jan 2024 10:42:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64946F804B0; Thu,  4 Jan 2024 10:42:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F1AFF80086
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 10:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F1AFF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=PzZ4zto4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=AlRtKVuy;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=PzZ4zto4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=AlRtKVuy
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2503C21EDE;
	Thu,  4 Jan 2024 09:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704361354;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1BgDm0+zuhPj9lChPaCbqlhdvr7I7RHxGTrTc1Gpt4=;
	b=PzZ4zto4yN3EqhB4UWzpxLgIxRZY898bzUOfdRzd+nFp4V2NEu3cv3OUREocEfqV3g6QdS
	jeJSgxaoDzq2rpysQV/NslcG54C7G31kBQpygYc6C0SZdVR75BR8BRXoLpZHRJ4yGLAIDk
	3OvYcpU0bXktL9W1dvKGxsEfO2B270g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704361354;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1BgDm0+zuhPj9lChPaCbqlhdvr7I7RHxGTrTc1Gpt4=;
	b=AlRtKVuypGdci03xEQ5S6OpBaSgcubbrAAv/tDyabCQaEg9YZWs50Of89oypf+w8orT/iv
	rd5Yj94oHHdYJBBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704361354;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1BgDm0+zuhPj9lChPaCbqlhdvr7I7RHxGTrTc1Gpt4=;
	b=PzZ4zto4yN3EqhB4UWzpxLgIxRZY898bzUOfdRzd+nFp4V2NEu3cv3OUREocEfqV3g6QdS
	jeJSgxaoDzq2rpysQV/NslcG54C7G31kBQpygYc6C0SZdVR75BR8BRXoLpZHRJ4yGLAIDk
	3OvYcpU0bXktL9W1dvKGxsEfO2B270g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704361354;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1BgDm0+zuhPj9lChPaCbqlhdvr7I7RHxGTrTc1Gpt4=;
	b=AlRtKVuypGdci03xEQ5S6OpBaSgcubbrAAv/tDyabCQaEg9YZWs50Of89oypf+w8orT/iv
	rd5Yj94oHHdYJBBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0090C137E8;
	Thu,  4 Jan 2024 09:42:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ib5VOol9lmVOZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jan 2024 09:42:33 +0000
Date: Thu, 04 Jan 2024 10:42:33 +0100
Message-ID: <87a5pla0za.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Hills <mark@xwax.org>
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: Regression in Final Scratch 'ScratchAmp' quirk (DJ interface)
In-Reply-To: <ZZXzhKbCEK04caa2@geday>
References: <05f7b47d-1762-c6aa-ddb1-3c6f6128cf44@xwax.org>
	<ZZXzhKbCEK04caa2@geday>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.44 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.25)[73.31%]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PzZ4zto4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AlRtKVuy
X-Rspamd-Queue-Id: 2503C21EDE
Message-ID-Hash: XLGUC5WVFOHY5AMV5B7Q5G3LKAXLC4PJ
X-Message-ID-Hash: XLGUC5WVFOHY5AMV5B7Q5G3LKAXLC4PJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLGUC5WVFOHY5AMV5B7Q5G3LKAXLC4PJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 04 Jan 2024 00:53:40 +0100,
Geraldo Nascimento wrote:
> 
> On Wed, Jan 03, 2024 at 03:54:29PM +0000, Mark Hills wrote:
> > The ScratchAmp worked perfectly with a quirk, but now that seems to have 
> > regressed and the device is no longer detected [1].
> > 
> > It's design is from 2002, based on class-compliant (Philips UDA1325H) 
> > chips. It hides itself behind a 'vendor specific' description, presumably 
> > as it was launched in a closed system with specific hardware and software 
> > for DJ'ing.
> 
> Hi Mark, great fan of your work with xwax here.
> 
> Perhaps adding USB_DEVICE_VENDOR_SPEC(0x103d, 0x0100) and
> USB_DEVICE_VENDOR_SPEC(0x103d, 0x0101) to quirks-table.h can do the
> trick?

Yes, something like below.

If this doesn't work, try to replace USB_DEVICE_VENDOR_SPEC() with
USB_AUDIO_DEVICE() in the patch.

In anyway, please give lsusb -v output of the specific device, too.


Takashi

-- 8< --
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -169,6 +169,10 @@
 { USB_AUDIO_DEVICE(0x046d, 0x08f6) },
 { USB_AUDIO_DEVICE(0x046d, 0x0990) },
 
+/* Stanton ScratchAmp */
+{ USB_DEVICE_VENDOR_SPEC(0x103d, 0x0100) },
+{ USB_DEVICE_VENDOR_SPEC(0x103d, 0x0101) },
+
 /*
  * Yamaha devices
  */

