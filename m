Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C802C74B228
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 15:48:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A4BF210;
	Fri,  7 Jul 2023 15:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A4BF210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688737732;
	bh=pUkMYB0aQ7oN4oHeFq2bAZDp/50VOTZISIYLzaLXV6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Aqy2Hh28LPIYtadjew/tmlzbcztASKcuAWm5INANNL7hvO46dOMWblaLWCW4OszHn
	 9VFUcfWuLMcPJX5W3XjOArKrMK6dHxBdwkFjqI3dYVctr4XthIaLL5un3uNQ7bSdzI
	 Q24RInSDW40Dxyt8djqquKYRzjEY6zXdLhdu4FHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A73BF80104; Fri,  7 Jul 2023 15:47:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3675CF80124;
	Fri,  7 Jul 2023 15:47:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AB72F80125; Fri,  7 Jul 2023 15:47:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 00D45F80104
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 15:47:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00D45F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1Rvu2ZI3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rbbizk1m
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8783D1FDB4;
	Fri,  7 Jul 2023 13:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688737668;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ETpM6o6K3HAUc8/fEUMdngpEDYf73Gw3CZHJcQEwIE=;
	b=1Rvu2ZI3LCC2U75nKNYFIbH1685AZPBZgMhIhXg1JsXZ5hchph7KyuRJLwu10H514uE4cS
	Fw84dJMAjDd450a7CdXDUeoBg/7zi7CHxKLvJGTo3tHoq/2DxJ/wk5abn7M8hIQUfTmX41
	Go9UkGZ7M8IUuFfDZjdqTcEDc8zyuXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688737668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ETpM6o6K3HAUc8/fEUMdngpEDYf73Gw3CZHJcQEwIE=;
	b=rbbizk1mlChErDAs5iKWukmT8SiygTtVQyL5+BgIc4oLm0xvCKpa/BGmfIBYLCwjfRFReM
	Pznr7h+BGhzALjAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 443501346D;
	Fri,  7 Jul 2023 13:47:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id LrDjD4QXqGQGYgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 07 Jul 2023 13:47:48 +0000
Date: Fri, 07 Jul 2023 15:47:47 +0200
Message-ID: <87v8evkf3w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
In-Reply-To: <f1041542-bd97-41d9-96b9-c6e5fef6b096@sirena.org.uk>
References: <20230705125723.40464-1-srinivas.kandagatla@linaro.org>
	<ZKfAUOOcGoBanHHu@hovoldconsulting.com>
	<efaf5960-bcc5-6d52-5552-e1505a13b635@linaro.org>
	<87y1jrkgdx.wl-tiwai@suse.de>
	<3450ef1e-cb20-4242-b482-41d3d34c4564@sirena.org.uk>
	<87wmzbkfw7.wl-tiwai@suse.de>
	<f1041542-bd97-41d9-96b9-c6e5fef6b096@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: JHAOYCE5EIMAM664YPBDHHSB6SAZSKY3
X-Message-ID-Hash: JHAOYCE5EIMAM664YPBDHHSB6SAZSKY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHAOYCE5EIMAM664YPBDHHSB6SAZSKY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Jul 2023 15:35:29 +0200,
Mark Brown wrote:
> 
> On Fri, Jul 07, 2023 at 03:30:48PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > It's moderately common - typically in these cases the control is
> > > described in the datasheet as an attenuation control rather than a gain,
> > > and this usually corresponds to the physical implementation being only
> > > able to make signals smaller relative to the reference.
> 
> > Yeah, I see the use case.  The problem is, however, that we're using
> > the very same dB info for both gain and attenuation.  That means,
> > application has no idea how to interpret those dB values -- to be
> > added or to be subtracted.
> 
> > We should have defined a new TLV type for attenuation to
> > differentiate, and define the TLV macro to give proper min/max.
> 
> The ASoC generic control stuff supports inverting the value prior to
> presentation to userspace so it's masked there (instead of writing the
> number userspace sees to the register we subtract the number from the
> maximum value and write that to the register), pulling that up further
> to the ALSA core might be nice I guess?

I believe yes.  Though, I'm still not sure how we can improve the
mismatch of dB min/max.  The dB values of those inverted controls
reflect the result of subtraction, no?


Takashi
