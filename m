Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0347770FD85
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 20:09:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F22041E7;
	Wed, 24 May 2023 20:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F22041E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684951773;
	bh=xPlR6m9a7jrUndnmdCq5xmWqaKOc9irQ7/5/a4UdJ7Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OTxMHYf10PjjEpYY+yObE6KaO/p2VPwBnf2UdBMcveW9QdCYGM0/4LDroW6VkZVoi
	 cp892a2FCJtZKyEKO6U7Vq+vCxA+1jsOPiPJjwmwb/HgpQfKJX7ckys60OI+/xPy75
	 SQLKNpt7S8i/ty/t+FxeaSFuzjBLZ3snRCvCp/HI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28734F80548; Wed, 24 May 2023 20:08:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2F1EF80007;
	Wed, 24 May 2023 20:08:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 062EEF80249; Wed, 24 May 2023 20:08:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35647F80007
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 20:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35647F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=W/JGEKPz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LxmziIUK
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE05121CF6;
	Wed, 24 May 2023 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684951702;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jwFVly4kq5P6O0lbSrbMpskCnnMKPILSg3+DmnDJtHM=;
	b=W/JGEKPzGSdFmt/xBO/G+AdQJ1Lk9JJ3bnAxTtHsa8NrfErL9OUyHjbt9FMQ0STCNZzNso
	iFFNf3ZTtlT6caTNOazuu6fKyuT39u+9qxDiqSjuqgfyCj+k7kBqt+g9hMSJBgxrATdVcu
	oDsjGO9xUy5Z2Zl206Z7drjppV6EsFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684951702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jwFVly4kq5P6O0lbSrbMpskCnnMKPILSg3+DmnDJtHM=;
	b=LxmziIUKjKrDoGdbykUCH3t1MtwcU7rTcuug5MKLe/glVgmQR5vZGBAt8RBl8xx1PD8Ih8
	lgNf5mzMkCFUszCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D972133E6;
	Wed, 24 May 2023 18:08:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2aroFZZSbmSDCwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 24 May 2023 18:08:22 +0000
Date: Wed, 24 May 2023 20:08:21 +0200
Message-ID: <87o7m9d2lm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stuart Henderson <stuarth@opensource.cirrus.com>
Cc: Luke Jones <luke@ljones.dev>,
	<linux-kernel@vger.kernel.org>,
	<tiwai@suse.com>,
	<sbinding@opensource.cirrus.com>,
	<perex@perex.cz>,
	<tangmeng@uniontech.com>,
	<andy.chi@canonical.com>,
	<p.jungkamp@gmx.net>,
	<kasper93@gmail.com>,
	<yangyuchi66@gmail.com>,
	<armas@codux.tech>,
	<ealex95@gmail.com>,
	<james.schulman@cirrus.com>,
	<david.rhodes@cirrus.com>,
	<tanureal@opensource.cirrus.com>,
	<rf@opensource.cirrus.com>,
	<patches@opensource.cirrus.com>,
	<alsa-devel@alsa-project.org>
Subject: Re: CSC3551 and devices missing related _DSD bits
In-Reply-To: <b4c202b2-ab29-e2aa-b141-0c967b2c1645@opensource.cirrus.com>
References: <1991650.PYKUYFuaPT@fedora>
	<87jzx3zaf8.wl-tiwai@suse.de>
	<b4c202b2-ab29-e2aa-b141-0c967b2c1645@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 32OOUG7EAPLYF2RZWQFZVBV7D2RIJAGM
X-Message-ID-Hash: 32OOUG7EAPLYF2RZWQFZVBV7D2RIJAGM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/32OOUG7EAPLYF2RZWQFZVBV7D2RIJAGM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 24 May 2023 18:36:04 +0200,
Stuart Henderson wrote:
> 
> 
> > The problem is that this can really easily blow up your machine if
> > some incorrect bit is applied.  And more easily applicable, more
> > chance to break by novice users, simply by believing what a chat bot
> > speaks :)
> > That's the very reason why this kind of change should be via ACPI
> > table officially set up by the vendor.  That said, the question is
> > only who and how can be responsible for this kind of change.  It's
> > no technical issue, per se.
> > 
> > If BIOS can't be updated, at least, the configuration change has to be
> > confirmed by ASUS people.  If ASUS still ignores the inquires and
> > requests, we may put the quirk but with a bit fat warning (and maybe
> > complaints to ASUS) to be shown in the log as a very last resort.
> > 
> > Let's see what happens.
> 
> Thanks Takashi.
> 
> Just a note to say we're not ignoring this and are investigating the
> best way to support released laptops with ACPI incompatible with
> Linux.  We're hoping this is going to be less of an issue going
> forward.  Please bear with us while we look into this.

Good to hear that you're working on it!
Sure, it's no urgent issue and better wait for a proper solution.


thanks,

Takashi
