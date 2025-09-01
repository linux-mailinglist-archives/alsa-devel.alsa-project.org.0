Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE3AB3DA5B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Sep 2025 08:56:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E5F3601EE;
	Mon,  1 Sep 2025 08:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E5F3601EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756709777;
	bh=XljtXRCZzIxYAlR1PIAIjUGBOYO+G+RkoGDswVj7SAs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OfDM0q591PSIkKsl9Boh5w4hubecj9VUd2aqNqEs/X++JC5irRLV8T8o6LpRfbt7R
	 2z09AZHLW0ciDg4nIVz9pdz1IoxIqtsQlbdvEzDsD22Z1UoGFsy07N8vdPWw25prbH
	 8WJE+HCJ834vKeNMYSCwf/plZ0vA/EKY+Cn3JLTc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9528DF805CB; Mon,  1 Sep 2025 08:55:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56538F805C6;
	Mon,  1 Sep 2025 08:55:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC8B8F804FF; Mon,  1 Sep 2025 08:55:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2286FF802DB
	for <alsa-devel@alsa-project.org>; Mon,  1 Sep 2025 08:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2286FF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UCooQjBn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=35/JeQv4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=UCooQjBn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=35/JeQv4
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9ADBC1F38C;
	Mon,  1 Sep 2025 06:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1756709715;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0g/Mxe5U1Ti0oZ802PkuJxT0wUhmW2w166QeYUk3FxU=;
	b=UCooQjBn3lHpCAWwQCL44G3WoblnYxLnRKDVID4aUDX2dKFa2W8pyHeRkjB1fS67OURDlQ
	H6OXXq0HBazZChWA8VNsan5OPJWuEC26MVyXsNMacznBMZ170nFufxWQpDzoz1tKB/Dss2
	DtaoHwrCAx3jxsAf8tYuZChWO/sdQkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756709715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0g/Mxe5U1Ti0oZ802PkuJxT0wUhmW2w166QeYUk3FxU=;
	b=35/JeQv4CXbKPgYiwXgQN8PJKNFZBLVctoxYTehnlHsIxcaU3fwx4bJY35DMvSF/Ti1p7x
	bmtkC3IEPbHKDGDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UCooQjBn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="35/JeQv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1756709715;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0g/Mxe5U1Ti0oZ802PkuJxT0wUhmW2w166QeYUk3FxU=;
	b=UCooQjBn3lHpCAWwQCL44G3WoblnYxLnRKDVID4aUDX2dKFa2W8pyHeRkjB1fS67OURDlQ
	H6OXXq0HBazZChWA8VNsan5OPJWuEC26MVyXsNMacznBMZ170nFufxWQpDzoz1tKB/Dss2
	DtaoHwrCAx3jxsAf8tYuZChWO/sdQkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756709715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0g/Mxe5U1Ti0oZ802PkuJxT0wUhmW2w166QeYUk3FxU=;
	b=35/JeQv4CXbKPgYiwXgQN8PJKNFZBLVctoxYTehnlHsIxcaU3fwx4bJY35DMvSF/Ti1p7x
	bmtkC3IEPbHKDGDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50A72136ED;
	Mon,  1 Sep 2025 06:55:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NLMgEVNDtWiUPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Sep 2025 06:55:15 +0000
Date: Mon, 01 Sep 2025 08:55:14 +0200
Message-ID: <877byifyr1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	broonie@kernel.org,
	andriy.shevchenko@linux.intel.com,
	13564923607@139.com,
	13916275206@139.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	baojun.xu@ti.com,
	Baojun.Xu@fpt.com
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Fix the order of TAS2563
 calibrated-data
In-Reply-To: <3afb62060097eeafbf9faed33654f7f6612596f4.camel@irl.hu>
References: <20250831124313.438-1-shenghao-ding@ti.com>
	<3afb62060097eeafbf9faed33654f7f6612596f4.camel@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,fpt.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: 9ADBC1F38C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: VII2BGZROVW24ZVD4QYSPXJ6LGTMPXZC
X-Message-ID-Hash: VII2BGZROVW24ZVD4QYSPXJ6LGTMPXZC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VII2BGZROVW24ZVD4QYSPXJ6LGTMPXZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Sep 2025 08:18:06 +0200,
Gergo Koteles wrote:
> 
> Hi Shenghao,
> 
> On Sun, 2025-08-31 at 20:43 +0800, Shenghao Ding wrote:
> > A bug reported by one of my customers that the order of TAS2563
> > calibrated-data is incorrect, the correct way is to move R0_Low_%d
> > and insert it between R0_%d and InvR0_%d.
> > 
> 
> A similar fix is ​​already in Takashi's tree for tas2563.
> https://lore.kernel.org/all/20250829160450.66623-1-soyer@irl.hu/

Right, I already took Gergo's fix on for-linus branch.
Likely included in 6.17-rc5.

> But I think, tas2781 also needs one for the order and one for the
> endianness.
> I left it out because it's easier for you with documentation.

If anything is missing for 6.17, please submit the fix ASAP.


thanks,

Takashi
