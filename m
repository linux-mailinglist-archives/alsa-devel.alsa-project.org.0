Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC417B3EDD
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 09:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D7B3DF3;
	Sat, 30 Sep 2023 09:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D7B3DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696060164;
	bh=2U0iD3gdL6LQFqNuQisPjagQo4ampNnCxpAxvRD1OKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bwgo/qnIjoOnkKTdYHt8Lhc6hcrbAshaIQYlkP3G8IJi0y7ng4GQYWyqysrBQfaY0
	 GHBGY853rSO2n5I4lcz3CYVZMs14BtqSfPTrAHe2sUHdGhyjgFSItVp9mhFIpBBshq
	 CUK1YRcweoK4ytpfgsvQzJxrvcJz4sH0x9f5PxA8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B68F2F8055A; Sat, 30 Sep 2023 09:47:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46B7BF8055A;
	Sat, 30 Sep 2023 09:47:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6FA0F801D5; Sat, 30 Sep 2023 09:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B1BCF800AE
	for <alsa-devel@alsa-project.org>; Sat, 30 Sep 2023 09:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B1BCF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tVyw5F/6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LAqBoxiE
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 528331F461;
	Sat, 30 Sep 2023 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696060054;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gx6ZDz4Ci8UnJkKANfhVZGkBcGUTdk3xx4yitDS/fZE=;
	b=tVyw5F/6QCdOLj7if58Md+ZUR3nQm5otb9P0XHIhBqFbLZApUQ1NQatbqUVE4G7oGw/McN
	Sauwj+P9w4DO6xVUutJhlHltXJp0h6ELlMzWm7zVW+6ccUs5O94lCVSP3x3AxSQ7dKf0QS
	SSBI34uRRmojSmc+VRINxSp/HNK5gxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696060054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gx6ZDz4Ci8UnJkKANfhVZGkBcGUTdk3xx4yitDS/fZE=;
	b=LAqBoxiE9Bu4pTBaXLkV3o/Yv7UIoPrZpDTYRIcdlVx/v5Ewl/G/YFnfumzW2yMFKqkPfm
	UEfBLLkW98IkioBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 408AA13499;
	Sat, 30 Sep 2023 07:47:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zeNlD5bSF2XbMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 30 Sep 2023 07:47:34 +0000
Date: Sat, 30 Sep 2023 09:47:33 +0200
Message-ID: <s5httrc5ch6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: cirrus_scodec: fix an error code
In-Reply-To: <5eea7fd5-67c8-4ed4-b5b3-b85dfb7572cc@moroto.mountain>
References: <5eea7fd5-67c8-4ed4-b5b3-b85dfb7572cc@moroto.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 62YZP26QXNSHTFNCVPTHQER4XY4NLTXB
X-Message-ID-Hash: 62YZP26QXNSHTFNCVPTHQER4XY4NLTXB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/62YZP26QXNSHTFNCVPTHQER4XY4NLTXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Sep 2023 14:44:01 +0200,
Dan Carpenter wrote:
> 
> The "ret" variable is zero but we should return -EINVAL.
> 
> Fixes: 2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied now.  Thanks.


Takashi
