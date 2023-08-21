Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74012782745
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 12:42:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5743E1EB;
	Mon, 21 Aug 2023 12:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5743E1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692614577;
	bh=SkZfZpMy9PfzIsaBDDSOEZt4A0CLZUL7NOnPZk2jO8s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ewjxZqmbSSSvqIz8MSUvwG7Taju6X9/gJIeVVjIk/Dpc1ISd2Cc8B8EG1pFCU03gx
	 s3yatLdfuEh6RhuxFQl8Lg23DNz5h0cGIetXQLM1WU8eGUsZn0QjvxkdIV4Fr6JlDJ
	 3FoTS87hxDf279qDUblIfp9286RJwdbHndvND0qo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B917F8025F; Mon, 21 Aug 2023 12:42:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21DC6F8016C;
	Mon, 21 Aug 2023 12:42:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35E58F80199; Mon, 21 Aug 2023 12:42:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1675F800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 12:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1675F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=urDAlWPD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RNXlpjbr
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7021622B43;
	Mon, 21 Aug 2023 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692614513;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqB0kM7taH/USJhaXlPTjbflSdtweo+SFWnDZz/F+z0=;
	b=urDAlWPDYQoJpW23PLti9o2PeDifSQIfrmDloGIQs8yFAB1P2jX+/xWD3OmxvrON4YyJcC
	zOCygg0u8UaXf7shPSm825LUsPPySyElbBMPZ/udb1iDus8o2T3sEEKNR40eJ34z5n0iMq
	g8cd/qEATDR4TaiumVkvbhfJqHMA2tE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692614513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqB0kM7taH/USJhaXlPTjbflSdtweo+SFWnDZz/F+z0=;
	b=RNXlpjbrbxBr/xoskPm5dLvBtUAYGcm0Afy9svGjIDyrM4e58mh33p4KcDS76viJSvAWP8
	ietsGXNUtGos7XDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 422A313421;
	Mon, 21 Aug 2023 10:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9zXPDnE/42SgBAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 21 Aug 2023 10:41:53 +0000
Date: Mon, 21 Aug 2023 12:41:52 +0200
Message-ID: <87cyzg8yof.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: hda/realtek: Fix spelling mistake "powe" ->
 "power"
In-Reply-To: <20230821080003.16678-1-colin.i.king@gmail.com>
References: <20230821080003.16678-1-colin.i.king@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: SVWR3MHTS6XLNBVXVKAFTWHY3CZGNMVT
X-Message-ID-Hash: SVWR3MHTS6XLNBVXVKAFTWHY3CZGNMVT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVWR3MHTS6XLNBVXVKAFTWHY3CZGNMVT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 21 Aug 2023 10:00:03 +0200,
Colin Ian King wrote:
> 
> There is a spelling mistake in a quirk entry. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, applied now with the Fixes tag 3babae915f4c.


Takashi
