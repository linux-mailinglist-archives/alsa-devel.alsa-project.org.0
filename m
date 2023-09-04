Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89129791B2B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 18:11:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D093E8;
	Mon,  4 Sep 2023 18:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D093E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693843915;
	bh=8DyuFsyDnX0EiHlpMoLxILKN3oBdXHN7a4dvCI3K0SU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CDEwrMh+zRaqWizQJ21gepY18iye9+TGQGEW/8nhd2oTxqLyLnnS5ZCokivMLvOzD
	 KvIrD8A0DlAUhzCXwhs2lq2A+UjXz6jUGlZo6aYEisZNFnRyZawwT4hoMksDPI1VWv
	 YSPzdFkUW0OjfGltXiVm1NJHGsGGInKqdU9cjMw8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDC2EF8047D; Mon,  4 Sep 2023 18:11:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1477F80431;
	Mon,  4 Sep 2023 18:11:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B40DFF8047D; Mon,  4 Sep 2023 18:11:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 57F6DF80141
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 18:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57F6DF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=juL2lI0A;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=O88oliK9
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B67D52185A;
	Mon,  4 Sep 2023 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693843856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R4uGAd9yXaePgQxJto6oh+phUUgEE9WjV5RSAiwh4kc=;
	b=juL2lI0AMKt0war/TkSW4ZLxnQOiu8BUIVSGmFokngMwnsKeDOGdolneadrBTckmNcU4wP
	HoMD2eVSYGZ7PzUqV+evE0NW/3usKiC87d44PNOvTAQThBVng6Pwa8eEQqPUkEn8EBPlqt
	6xNtKptbqqIp8I+UFotTFXViDcz6Uow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693843856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R4uGAd9yXaePgQxJto6oh+phUUgEE9WjV5RSAiwh4kc=;
	b=O88oliK9z31tMknh84jKe8CnP8wZQ2sSDtr4WWyY/LR31SRlpqGEUXoroa3YpX820gkPRQ
	lTTxpPwnIn6j+lCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86BD713425;
	Mon,  4 Sep 2023 16:10:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0P7cH5AB9mS2YwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 04 Sep 2023 16:10:56 +0000
Date: Mon, 04 Sep 2023 18:10:55 +0200
Message-ID: <87y1hlj4vk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	<alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda/cirrus: Fix broken audio on hardware with two
 CS42L42 codecs.
In-Reply-To: <20230904160033.908135-1-vitalyr@opensource.cirrus.com>
References: <20230904160033.908135-1-vitalyr@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 2RH4MNG6MCUQR22RY4RD6NWF7SIW5QWH
X-Message-ID-Hash: 2RH4MNG6MCUQR22RY4RD6NWF7SIW5QWH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RH4MNG6MCUQR22RY4RD6NWF7SIW5QWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Sep 2023 18:00:33 +0200,
Vitaly Rodionov wrote:
> 
> Recently in v6.3-rc1 there was a change affecting behaviour of hrtimers
> (commit 0c52310f260014d95c1310364379772cb74cf82d) and causing
> few issues on platforms with two CS42L42 codecs. Canonical/Dell
> has reported an issue with Vostro-3910.
> We need to increase this value by 15ms.
> 
> Link: https://bugs.launchpad.net/somerville/+bug/2031060
> Fixes: 9fb9fa18fb50 (ALSA: hda/cirrus: Add extra 10 ms delay to allow PLL settle and lock.)
> 
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Thanks, applied now (with a slight correction of Fixes tag; it needs
quotes around the commit subject).


Takashi
