Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 212FE788130
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 09:47:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A77852;
	Fri, 25 Aug 2023 09:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A77852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692949657;
	bh=IuTK9NsgS0PRLKyyZru/+f+vMAu0EvLVXpX03rYCI9k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JJrWuJ3VsF9Unc28N7nuIDm1Utp6TM9tOTf3WsLuaXVFeaCi/Ow3diMwyx1gMVmfi
	 6ANUVx9VlGayqrCF11N4Q7a9Aq/NFhZfdZ3zB/ryCpUWGZx2Q2USXqIIp3kisI0q/g
	 TOO1idSWZ7ha2aHjJ0agkVzGHCrJGeie4T0iSLJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A3C3F804F3; Fri, 25 Aug 2023 09:46:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA05CF800D1;
	Fri, 25 Aug 2023 09:46:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C116DF8022B; Fri, 25 Aug 2023 09:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A940F800BF
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 09:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A940F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Npq4P0Sr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ea5V48fn
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC9161F8B2;
	Fri, 25 Aug 2023 07:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692949597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYHW6KAJ2Ktr2piU9qkfkyHVUfu3GN5wP2DEKWDIh5E=;
	b=Npq4P0Sr0NS00uimqXFZNAITHggv8U3/7YTiOX3a/EpWFmmU852DmtXoFCnOeWotAEutWA
	9spb3gBFbVTH1AThxu49znUnw4o22Zl5vdNUR5k/MJLRlRLQGEWQNEGaofvsk/2wR7iUzT
	yFNE52xGhsmAA6LrNzSISCDlZS7HkM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692949597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYHW6KAJ2Ktr2piU9qkfkyHVUfu3GN5wP2DEKWDIh5E=;
	b=Ea5V48fnsZaD8UtPOruNlLe/7ojrNjQ8umi0+T8XUFJP/n6EUxZ20IybtSVwos/W+6fM2t
	Xs58fWcpxFD/+LBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C426F1340A;
	Fri, 25 Aug 2023 07:46:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id S83sLl1c6GRqUAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 25 Aug 2023 07:46:37 +0000
Date: Fri, 25 Aug 2023 09:46:37 +0200
Message-ID: <87fs478syq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] ALSA: hda/tas2781: Switch back to use struct i2c_driver's
 .probe()
In-Reply-To: <20230824200219.9569-1-u.kleine-koenig@pengutronix.de>
References: <20230824200219.9569-1-u.kleine-koenig@pengutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KGJBLZKS7ZNLA4AAONQ3QF643ALPWXPH
X-Message-ID-Hash: KGJBLZKS7ZNLA4AAONQ3QF643ALPWXPH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KGJBLZKS7ZNLA4AAONQ3QF643ALPWXPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 24 Aug 2023 22:02:19 +0200,
Uwe Kleine-König wrote:
> 
> struct i2c_driver::probe_new is about to go away. Switch the driver to
> use the probe callback with the same prototype.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied now, thanks.

> ---
> Hello,
> 
> this driver was introduced in next-20230821. As I plan to drop
> .probe_new in next after v6.6-rc1, it would be great if this patch made
> it in until then, too.

Yes, it should be gone in the next linux-next update.
I completely forgot this rename, sorry for that.


Takashi
