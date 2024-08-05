Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A87947666
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 09:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F32DE5E99;
	Mon,  5 Aug 2024 09:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F32DE5E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722844517;
	bh=8ovik4tZwzi1xl97ga7M/9sRpiNXu3A2yAVl/ALhG40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S3XZo7FHxjYojgS5RMrVTC//RLUuDPM5w42fHUmhyTFH8DVrtz5ThMgwPGXFGiKNC
	 6wijPBhORhhLrAo1HkOn6k9YBpdfD1eb/h5SGN+5gzFG8VSVMAOmACTMeJZMAGv/P5
	 dj4Yp74U2iypKboXq3LYNiRFmxr2O50pVGMTQf2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41656F805B1; Mon,  5 Aug 2024 09:54:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD705F805A0;
	Mon,  5 Aug 2024 09:54:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CAFEF802DB; Mon,  5 Aug 2024 09:49:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EAED5F800E3
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 09:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAED5F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=P9cK75WJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5u1MD5jp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=P9cK75WJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5u1MD5jp
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1AF7321B7A;
	Mon,  5 Aug 2024 07:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722844155;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/oIjTtOdQZC83coUM4LDj6b9/ldcdBlQly3TQ8twlU=;
	b=P9cK75WJTVLY7jAaqJwg2JYjwN1+9HoYIQ3nNDhMZiRHQVAUxKYfpYbUe9WAGFR3waWWZ/
	XciNlVa3zPjw0K+91q0TveO3o/Q2ysXGXV37Ba4Da/Jjm5+qP3ZF1NafJY4q4+tpZ34Lyu
	c3v5AF4TcUYy5rwFqZU9udU9LaIAQy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722844155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/oIjTtOdQZC83coUM4LDj6b9/ldcdBlQly3TQ8twlU=;
	b=5u1MD5jpy2NQA/TjpU0Fh/cpYudF7dqSwf6MAl2a5IwrXl5L4S66yVnhxg/LeG9zO1oD0u
	pAi2hkY0wjLyOgDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P9cK75WJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5u1MD5jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722844155;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/oIjTtOdQZC83coUM4LDj6b9/ldcdBlQly3TQ8twlU=;
	b=P9cK75WJTVLY7jAaqJwg2JYjwN1+9HoYIQ3nNDhMZiRHQVAUxKYfpYbUe9WAGFR3waWWZ/
	XciNlVa3zPjw0K+91q0TveO3o/Q2ysXGXV37Ba4Da/Jjm5+qP3ZF1NafJY4q4+tpZ34Lyu
	c3v5AF4TcUYy5rwFqZU9udU9LaIAQy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722844155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/oIjTtOdQZC83coUM4LDj6b9/ldcdBlQly3TQ8twlU=;
	b=5u1MD5jpy2NQA/TjpU0Fh/cpYudF7dqSwf6MAl2a5IwrXl5L4S66yVnhxg/LeG9zO1oD0u
	pAi2hkY0wjLyOgDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF3A113254;
	Mon,  5 Aug 2024 07:49:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cztJNfqDsGZ9UAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Aug 2024 07:49:14 +0000
Date: Mon, 05 Aug 2024 09:49:53 +0200
Message-ID: <877ccvl87y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Stop creating ALSA Controls for
 firmware coefficients
In-Reply-To: <20240801155047.456540-1-sbinding@opensource.cirrus.com>
References: <20240801155047.456540-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1AF7321B7A
Message-ID-Hash: UUNFGJH7WBKC2NWGSIAEBB7I7JDLORC6
X-Message-ID-Hash: UUNFGJH7WBKC2NWGSIAEBB7I7JDLORC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UUNFGJH7WBKC2NWGSIAEBB7I7JDLORC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Aug 2024 17:50:44 +0200,
Stefan Binding wrote:
> 
> When the CS35L41 loads its firmware, it has a number of controls to
> affect its behaviour. Currently, these controls are exposed as ALSA
> Controls.
> 
> These controls were never intended to be exposed to users but the
> firmware doesn't mark them hidden, so make the driver ignore them.
> 
> Any changes in the coefficients handled by these controls needs to
> be matched to the individual system by SSID, which is already handled
> using the tuning file, when firmware is loaded, so UCM should not be
> setting these controls anyway.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Applied to for-linus branch now.  Thanks.


Takashi
