Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 663E079A37C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 08:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 983AD846;
	Mon, 11 Sep 2023 08:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 983AD846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694413600;
	bh=08lofrqjAGRKjfNplRlu/OMwfS8cZiS06yTeM0Xc8TQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MLe/KZWEqo8IxOHiRvrOu5x4QNuu/+sh72lb6A/QqDq1aVbZs7+/K0kM0WbOSkhls
	 LC4fuvY0h1xwStPIkFKelVOWx4F6XPou6y6wFgigfDoTCXAPXNPRawxEQl1QZNWpNJ
	 H5B6gZavR+DvQPVVOD4b4Cyt8YB5erPEWF72qgkc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31E4EF8047D; Mon, 11 Sep 2023 08:25:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D612CF80246;
	Mon, 11 Sep 2023 08:25:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DCC4F80425; Mon, 11 Sep 2023 08:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86D9EF801F5
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 08:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86D9EF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xyMLOs6h;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=s2a40M/q
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 112B921958;
	Mon, 11 Sep 2023 06:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694413523;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PH3nLgA++aI7ngrpwVIf+G8JCCb7Y1s9hPQ/U05+fO8=;
	b=xyMLOs6hhN6+OB80X0EeqHhc0ymbSFWl7chIYxPGQ9vkOBLohZIMKMsIADuC/a1UqSrgaN
	VvvwTAPSCi1uhwOwLiOedXHtofEWmWqZ4WBX7zGxAPIYjLdt4/j4um2q7raJ3oRhszUL3o
	Mwf9umqYJDweaz8hY6I+CzHOwhmwdbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694413523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PH3nLgA++aI7ngrpwVIf+G8JCCb7Y1s9hPQ/U05+fO8=;
	b=s2a40M/qVi8+qqVdWR4Q0c0x74QpZ1AmGaGTdCu6VSnWuZjEGflA7+Torgli4Ewqhe+OWi
	7tuAGCHjF2ZPhVAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCD3413780;
	Mon, 11 Sep 2023 06:25:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UJfqLNKy/mSuRAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 11 Sep 2023 06:25:22 +0000
Date: Mon, 11 Sep 2023 08:25:22 +0200
Message-ID: <87tts16xbh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Mark Brown <broonie@kernel.org>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 00/11] Improve CS35l41-based audio codec drivers
In-Reply-To: <2b7a8897-05dc-4856-bb1a-a38b1e41b447@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
	<4a658238-b5cf-44fc-802b-f09f8d5e0ad1@sirena.org.uk>
	<2b7a8897-05dc-4856-bb1a-a38b1e41b447@collabora.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WOVAGEX5UOFM6RYIEZGBR7UZTZHFIOLS
X-Message-ID-Hash: WOVAGEX5UOFM6RYIEZGBR7UZTZHFIOLS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOVAGEX5UOFM6RYIEZGBR7UZTZHFIOLS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Sep 2023 19:27:42 +0200,
Cristian Ciocaltea wrote:
> 
> On 9/7/23 20:21, Mark Brown wrote:
> > On Thu, Sep 07, 2023 at 08:09:59PM +0300, Cristian Ciocaltea wrote:
> > 
> >>  - Added 3 new patches providing some HDA related fixes
> > 
> > Do these have any interaction with the rest of the series?
> 
> Yes, PATCH v2 04/11 changed the signature of cs35l41_global_enable()
> function which is also used by HDA - this is how I noticed the
> additional issues.

OK, then feel free to take my ack for HDA side:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
