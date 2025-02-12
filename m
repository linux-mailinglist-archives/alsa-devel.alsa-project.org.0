Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F90EA31FF8
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2025 08:28:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CAB360276;
	Wed, 12 Feb 2025 08:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CAB360276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739345316;
	bh=Iph/hlnOouwb8lFk08QEfpJMJKP+e/wvR7Qi5Lk6xd4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g/B3RXGlpfNipqFLDBWRDwcu4BiAj1DclXLqJQ7B8SR+fs8pjQEnJBb2sRAw1fFH0
	 P1edUatTkINemz5UkpiFSpQrt65pkC+EEZO+d3chYTd19Zj7g2iBW3/+3DKpPGWPgl
	 wJiJJh7vBEGoRE16NzeOd7PLujkAkst/Gi1MnDC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B92F8020D; Wed, 12 Feb 2025 08:28:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABB58F805B6;
	Wed, 12 Feb 2025 08:28:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57B12F8051F; Wed, 12 Feb 2025 08:27:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96BD7F8020D
	for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2025 08:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96BD7F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=v7bWenjp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kFZJufXc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=v7bWenjp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kFZJufXc
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B971D1FF19;
	Wed, 12 Feb 2025 07:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1739345267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmAqJDtxtPT/B4My6qRZkO4rZFgf9SVoU27wxXTllQ=;
	b=v7bWenjpHAnNm5+qY873PuQjwJn2EGyqwbuIm6Km8FI5aOZtojWrB7cm8WJV+V/ylrC+ww
	hAiaSCW+/v6O8WTFOcs5xEYIJXu/bt5R5ypiF7IbTDlpaxFYL94RJYrKTSMwN3UASTyBM6
	pDJigtDsNKRW/FutR7BmfkKvZDlIBPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739345267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmAqJDtxtPT/B4My6qRZkO4rZFgf9SVoU27wxXTllQ=;
	b=kFZJufXchEry4sCr18asfm99g7JKFS6Vhe3oTiCn/MWuroz3+RU4j1UdhHj761KZO+5Efo
	ffylJM5via5VV0DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1739345267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmAqJDtxtPT/B4My6qRZkO4rZFgf9SVoU27wxXTllQ=;
	b=v7bWenjpHAnNm5+qY873PuQjwJn2EGyqwbuIm6Km8FI5aOZtojWrB7cm8WJV+V/ylrC+ww
	hAiaSCW+/v6O8WTFOcs5xEYIJXu/bt5R5ypiF7IbTDlpaxFYL94RJYrKTSMwN3UASTyBM6
	pDJigtDsNKRW/FutR7BmfkKvZDlIBPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739345267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmAqJDtxtPT/B4My6qRZkO4rZFgf9SVoU27wxXTllQ=;
	b=kFZJufXchEry4sCr18asfm99g7JKFS6Vhe3oTiCn/MWuroz3+RU4j1UdhHj761KZO+5Efo
	ffylJM5via5VV0DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93BB013AEF;
	Wed, 12 Feb 2025 07:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A7kyInNNrGczGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Feb 2025 07:27:47 +0000
Date: Wed, 12 Feb 2025 08:27:47 +0100
Message-ID: <87frkjmxl8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: "bugzilla-daemon@kernel.org" <bugzilla-daemon@kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	" (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: [Bug 219743] [REGRESSION,
 BISECTED] ASUS GA402XY Headset mic stopped working after 6.12.2
In-Reply-To: <0474a095ab0044d0939ec4bf4362423d@realtek.com>
References: <bug-219743-196757@https.bugzilla.kernel.org/>
	<bug-219743-196757-RLkOfxHF9E@https.bugzilla.kernel.org/>
	<0474a095ab0044d0939ec4bf4362423d@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: LUCARSLCT5MXU6XWUNEWKMGE5Q3XX4CD
X-Message-ID-Hash: LUCARSLCT5MXU6XWUNEWKMGE5Q3XX4CD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUCARSLCT5MXU6XWUNEWKMGE5Q3XX4CD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Feb 2025 07:55:20 +0100,
Kailang wrote:
> 
> Fixup headset MIC no function.

Applied now.  Thanks.


Takashi
