Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E38C9D42
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:30:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37C8FEC0;
	Mon, 20 May 2024 14:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37C8FEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716208237;
	bh=uY3bUq+e3lxa4vHrJlyjRfMSTQosZevDA/L1XSfHsLM=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Poo5ixtD9IU6JM1WQViRI46tmhiUnn19qOnRzvHGHs7pzeGAU7l5NXlPLVKoLiQ8s
	 iloX1m8TQh3Z+WAHTVEobsrW3rbGMJ2P+ZEWXH0FuAKNui1VHfFTz+tra8RaA+fDK0
	 Jczugjb24P12qDdqGQIVdsLQUV0w6veOBuArI6C0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32E49F80852; Mon, 20 May 2024 14:27:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E3C7F8081A;
	Mon, 20 May 2024 14:27:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C4D4F8026A; Mon, 20 May 2024 14:23:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6A57F800DF
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6A57F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HpS+DvDw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=i0Dq/yNX;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=2Dk2NLHk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ynBkPNpE
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D98005D1E7;
	Fri, 17 May 2024 09:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715938588;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UPzBXPSRlnHCmqCWOcUK/HIW7wwc5Ae979hc1NuTveU=;
	b=HpS+DvDwLJydjr2Dk6+btSO9Gl2VnqSFPCMD00uKbDoNsRVYJTip4MU3dewE5TobuCKqL+
	dsm7Bn/tulAZ/gOETw0hc69BLr+Hsx3bpwikvgVWTBn/AZ5DXpXCqq02Mm5a61zuHCKQje
	ROcdtJh0WwRJ6lFJ0MtpiPP3tX3rf4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715938588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UPzBXPSRlnHCmqCWOcUK/HIW7wwc5Ae979hc1NuTveU=;
	b=i0Dq/yNXDMjnTCnsEBdTCIK4MpvK7YJQjar2FYDV7f+5OGAb0y7PFEoEZl0XOw4iOMYOQd
	1O5w+nstIC8MPQBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715938587;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UPzBXPSRlnHCmqCWOcUK/HIW7wwc5Ae979hc1NuTveU=;
	b=2Dk2NLHkjjlt6sDLEzCbd+uuXNGULV6QS8hIeJfTrzxUnisqN++eOcq9dH/nVmfzPZ6AOA
	2a+vaS6sXYE6y99UB59Hl+oeQdec9BI5N6IA5B37eApL7a5dr0geuFkuuXyopilMmqa6EK
	m5WdL09RdB/GD6heeb2TOsG0cYUoH2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715938587;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UPzBXPSRlnHCmqCWOcUK/HIW7wwc5Ae979hc1NuTveU=;
	b=ynBkPNpEfsmD4/SSns6GXbYHKwuK2tMuIycCDYTh97oaH6Wq2RIZf9sqqs0/BGZS2l3qY3
	jG3il5+AdcmsETCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7352E13991;
	Fri, 17 May 2024 09:36:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qJj2GhslR2Z/fwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 May 2024 09:36:27 +0000
Date: Fri, 17 May 2024 11:36:44 +0200
Message-ID: <87seygzsnn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Subject: Re: [RESEND PATCH v5 1/3] ASoC: tas2781: Fix wrong loading calibrated
 data sequence
In-Reply-To: <20240517092039.688-1-shenghao-ding@ti.com>
References: <20240517092039.688-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,139.com,alsa-project.org,vger.kernel.org,intel.com,ti.com,irl.hu,fpt.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: OT675MEEJWCLLZRK2ZJWZRYYOOAAM7BX
X-Message-ID-Hash: OT675MEEJWCLLZRK2ZJWZRYYOOAAM7BX
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, andriy.shevchenko@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com, bard.liao@intel.com,
 yung-chuan.liao@linux.intel.com, kevin-lu@ti.com,
 cameron.berkenpas@gmail.com, baojun.xu@ti.com, soyer@irl.hu,
 Baojun.Xu@fpt.com
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 May 2024 11:20:36 +0200,
Shenghao Ding wrote:
> 
> Remove declaration of unused API which load calibrated data in wrong
> sequence, changed the copyright year and correct file name in license
> header.
> 
> Fixes: ef3bcde75d06 ("ASoc: tas2781: Add tas2781 driver")
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

First off, this breaks the build.  You are removing the function that
is still called.  You will remove the caller in a later patch, but
it's still there at this point.  That's what Andy suggested for the
whole time.

Try to apply only this patch and build module.  You'll get a compile
error.  This must be avoided.

Second, it makes little sense to split the patches in that way.
A copyright year change can be folded into the same patch.  If any, a
patch to correct the ifdef as a separate patch, as it's completely
irrelevant with the fix itself.


thanks,

Takashi
