Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E2C70F659
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 14:27:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20F9A204;
	Wed, 24 May 2023 14:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20F9A204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684931276;
	bh=RdCSMoK1jz8qKQqoWQWNfqMg7FRlQSEw16KR+ZpeTHc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YN++3ou3Wr4SF7e3RLx5CC4TOXhwEQk+m1vNvRkyhCyS9KYDqWqwevb1/wYFt1/tg
	 hWDUKS+9PXU6+AUbgVa65ElLr7ut5DrB0r1DpiCHiRkn4iBMH4PoqC3OnCeje9ejfJ
	 O2hE2UD9ThxET28gw6eE9oiEJn1VedWlrJN7vZTc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22708F80548; Wed, 24 May 2023 14:26:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3525F8016A;
	Wed, 24 May 2023 14:26:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61AA0F8016A; Wed, 24 May 2023 14:24:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D401F8026A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 14:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D401F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1kySVWl3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=V6WqKmS0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4BEF9220DF;
	Wed, 24 May 2023 12:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684931015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H/nWbKe3Z8+xQ9At2iUlyT7hyUtbqXWl1JfLw+THLpc=;
	b=1kySVWl3pYeX0D5VqMD88/SAUJxePvgmJOgC/QpIHA2klMg7lnofyAbW5rhrNwm0KFg/2E
	C/vRjZv5iwwWylmSFJcKUn+f/8nH/NL0SuF4+yHQD1EgCwcvNR4DH2+noPt1Id+cS7Yijd
	L/SYcKUDSi3H0mvYkXrGp7Gdu+Azfrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684931015;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H/nWbKe3Z8+xQ9At2iUlyT7hyUtbqXWl1JfLw+THLpc=;
	b=V6WqKmS0GWD7/be54InL00gUEMWUaQx2rSNKozDm+mtBPbfl6Ve6U1NOeLRtw+qstefz6v
	vleWDMJFKMsjgaBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EC4713425;
	Wed, 24 May 2023 12:23:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id skSIAscBbmRrZAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 24 May 2023 12:23:35 +0000
Date: Wed, 24 May 2023 14:23:34 +0200
Message-ID: <871qj5ex4p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bin Li <bin.li@canonical.com>
Cc: tiwai@suse.com,
	libin.charles@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	hui.wang@canonical.com,
	kailang@realtek.com
Subject: Re: [PATCH] ALSA: hda/realtek: Enable headset onLenovo M70/M90
In-Reply-To: <20230524113755.1346928-1-bin.li@canonical.com>
References: <20230524113755.1346928-1-bin.li@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 7DLQVUKCCJEBRAGDPG3WX767P7K4YP7F
X-Message-ID-Hash: 7DLQVUKCCJEBRAGDPG3WX767P7K4YP7F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DLQVUKCCJEBRAGDPG3WX767P7K4YP7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 24 May 2023 13:37:55 +0200,
Bin Li wrote:
> 
> Lenovo M70/M90 Gen4 are equipped with ALC897, and they need
> ALC897_FIXUP_HEADSET_MIC_PIN quirk to make its headset mic work.
> The previous quirk for M70/M90 is for Gen3.
> 
> Signed-off-by: Bin Li <bin.li@canonical.com>

Thanks, applied now.


Takashi
