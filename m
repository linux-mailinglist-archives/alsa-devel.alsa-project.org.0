Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0D6721F79
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 09:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27DCB3E8;
	Mon,  5 Jun 2023 09:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27DCB3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685949909;
	bh=oJ2Dw0i8RpInS+WTDBz56PucnxBsenX4w5FaD3NQmfA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ctp8fhAgagIW5LBV9vK2/NP0CM0XRlUSHYZS/A49QdWnjQ2mQe1HGF3ekLkQuiQo5
	 tVRQ2bIxSrNtYkclu6YbzGnc37JprGLqCV9R5ZiCtPBKqziqQZtIra4xeTNwwkFxw5
	 KQtK65pG71+Pzpey1tLfzykvqRe7n6RQ+PL52Nus=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4E37F80527; Mon,  5 Jun 2023 09:24:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FD36F8016C;
	Mon,  5 Jun 2023 09:24:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D82E7F80199; Mon,  5 Jun 2023 09:24:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B567EF80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 09:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B567EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sDoCAFbv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WU1/70Fi
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6A9071F8AE;
	Mon,  5 Jun 2023 07:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685949849;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9sjLa0clT+3NJhkrCrd28lsMJx6THveVIgvZWjxaHeg=;
	b=sDoCAFbvZIDas+7HbGqlRSoY/rqvDJlZF6VkjlMik+WpZ40gq9d2DD9u0zVdnQfQe2sA0+
	fcHPBMDY7pE039XVWwDgZiJ/zAtscO8OZEs+m01Sc4LQjAeMnm66zykKUnRNExaBYzZrrN
	xHouiEhG95zOkEgZNH9QeATNpow33ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685949849;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9sjLa0clT+3NJhkrCrd28lsMJx6THveVIgvZWjxaHeg=;
	b=WU1/70FiCKyXTFJYa1KOvy84xMLeWUxgBcysIRn3vaIMBQYa8ISpUEFz396guR387//2zb
	8N8yht3snDML90AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EBB90139C7;
	Mon,  5 Jun 2023 07:24:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id acdmOJiNfWTcaQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 07:24:08 +0000
Date: Mon, 05 Jun 2023 09:24:08 +0200
Message-ID: <87y1kyid7r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,	James Schulman
 <james.schulman@cirrus.com>,	David Rhodes <david.rhodes@cirrus.com>,	Lucas
 Tanure <tanureal@opensource.cirrus.com>,	Richard Fitzgerald
 <rf@opensource.cirrus.com>,	Wolfram Sang <wsa@kernel.org>,	Krzysztof
 =?ISO-8859-2?Q?Ha=B3asa?= <khalasa@piap.pl>,	Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Vladimir Oltean <olteanv@gmail.com>,	Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,	Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,	Sebastian Reichel
 <sebastian.reichel@collabora.com>,	Adrien Grassein
 <adrien.grassein@gmail.com>,	Peter Senna Tschudin <peter.senna@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,	Corey Minyard
 <cminyard@mvista.com>,	linuxppc-dev@lists.ozlabs.org,
	alsa-devel@alsa-project.org,	kernel@pengutronix.de,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] sound: Switch i2c drivers back to use .probe()
In-Reply-To: <20230525203640.677826-1-u.kleine-koenig@pengutronix.de>
References: <20230525203640.677826-1-u.kleine-koenig@pengutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z4HAXSYKYG2N3MWQCQNBAKYK65EGE2GA
X-Message-ID-Hash: Z4HAXSYKYG2N3MWQCQNBAKYK65EGE2GA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4HAXSYKYG2N3MWQCQNBAKYK65EGE2GA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 May 2023 22:36:40 +0200,
Uwe Kleine-König wrote:
> 
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied now to for-next branch.  Thanks.


Takashi
