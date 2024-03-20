Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D45E880B64
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 07:42:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 467002BB2;
	Wed, 20 Mar 2024 07:42:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 467002BB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710916944;
	bh=d6qqe+CcxcZwDIvWYASOYtEhNU2vRznl+aN0TMXpQww=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VmM8R2GUPkY3qDDeh4xs96Kc1/9GO0PxtKK5Jlo3kLmJilmm/JFHLtyBaBNnxysbs
	 oc9xc1lim3XJ0qYOeMzvOCa9JwDFE6IWL8uZrhckz1hniLeTSPz3fQg379DOtzPfSh
	 7GiQzTLr8SnTyzja7QKxt8YjyedaC9YKkoGLJE20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4385AF802DB; Wed, 20 Mar 2024 07:41:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD683F805A0;
	Wed, 20 Mar 2024 07:41:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5754F804E7; Wed, 20 Mar 2024 07:40:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45AD0F80088
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 07:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45AD0F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=2ZZnQQN0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YvRwyAT2;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=2ZZnQQN0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YvRwyAT2
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B049A208EE;
	Wed, 20 Mar 2024 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710916803;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jC+l//3VhPKjEGqWhaYo6RUPp1tDuk8RHwlk+nw1GpM=;
	b=2ZZnQQN09Aicvy4m4208HmmA6cL6HnNJenPwasJs1JAC+POwW6cQJ7+ayUomg8x7JizWfJ
	IYrSM3SU+2FDuz1EGYnnkCtIvrCZ28CmUFmf1nsMsU1+NQc5eZyC48shhtxtWmXRnBNTOi
	rgwS9H8dLykOBta7Y3AqsufeGE+n0Ds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710916803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jC+l//3VhPKjEGqWhaYo6RUPp1tDuk8RHwlk+nw1GpM=;
	b=YvRwyAT2jMqIeJZ+a4VifNt6r+s5tBVMnbzBT3x/fgGqzCFLgusf8+Q4yAzQg3fMPqr4lA
	MptCjtde94FbqJCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710916803;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jC+l//3VhPKjEGqWhaYo6RUPp1tDuk8RHwlk+nw1GpM=;
	b=2ZZnQQN09Aicvy4m4208HmmA6cL6HnNJenPwasJs1JAC+POwW6cQJ7+ayUomg8x7JizWfJ
	IYrSM3SU+2FDuz1EGYnnkCtIvrCZ28CmUFmf1nsMsU1+NQc5eZyC48shhtxtWmXRnBNTOi
	rgwS9H8dLykOBta7Y3AqsufeGE+n0Ds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710916803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jC+l//3VhPKjEGqWhaYo6RUPp1tDuk8RHwlk+nw1GpM=;
	b=YvRwyAT2jMqIeJZ+a4VifNt6r+s5tBVMnbzBT3x/fgGqzCFLgusf8+Q4yAzQg3fMPqr4lA
	MptCjtde94FbqJCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88F5B136CD;
	Wed, 20 Mar 2024 06:40:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CdgEIMOE+mVkHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Mar 2024 06:40:03 +0000
Date: Wed, 20 Mar 2024 07:40:03 +0100
Message-ID: <87v85htni4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tim Crawford <tcrawford@system76.com>
Cc: alsa-devel@alsa-project.org,
	productdev@system76.com,
	Jeremy Soller <jeremy@system76.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirks for some Clevo laptops
In-Reply-To: <20240319212726.62888-1-tcrawford@system76.com>
References: <20240319212726.62888-1-tcrawford@system76.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.98 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.15)[-0.754];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.73)[98.81%]
Message-ID-Hash: EWXTA46OL2UKYBBPL6C552AEKBZ56OCR
X-Message-ID-Hash: EWXTA46OL2UKYBBPL6C552AEKBZ56OCR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWXTA46OL2UKYBBPL6C552AEKBZ56OCR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Mar 2024 22:27:26 +0100,
Tim Crawford wrote:
> 
> Add audio quirks to fix speaker output and headset detection on some new
> Clevo models:
> 
> - L240TU (ALC245)
> - PE60SNE-G (ALC1220)
> - V350SNEQ (ALC245)
> 
> Co-authored-by: Jeremy Soller <jeremy@system76.com>
> Signed-off-by: Tim Crawford <tcrawford@system76.com>

Thanks, applied now.


Takashi
