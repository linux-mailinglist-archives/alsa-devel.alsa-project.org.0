Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0121174CFC6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 10:21:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 174B43E7;
	Mon, 10 Jul 2023 10:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 174B43E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688977282;
	bh=3hCiieA+CmSOBqFOrT0SoUW2r/HHX8jAiPaQcevfvjw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NciT5FsqZfOTXY58MGXY1/XpkBj/aIl+NBwIIsMhxPAbtXiwLuKCsCilo8RfY0/MN
	 4xND9VpH7QquMldWQy9LnNjiBH3xAhQiwovJY8MoF/pF4FF9/2TSrXwG7Lstp+QqFk
	 4FC60oBo/rlexUL/0V+vglMmM2ZI7xppd/3r0vIY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC0EF8053B; Mon, 10 Jul 2023 10:20:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD0A8F80153;
	Mon, 10 Jul 2023 10:19:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A996AF80249; Mon, 10 Jul 2023 10:19:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A925F80093
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 10:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A925F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=G4vEUbok;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mO+ukF0y
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8D6351F38D;
	Mon, 10 Jul 2023 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688977190;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9c1Hyfa0qbZcmFBIiXA4YT0W5pWsuJ23T868Rm8ntrE=;
	b=G4vEUbokaMCTFfE3zvzK8FXiJOo6Bty0CkY3QoHJtalaNhvolPfJ/smYBe8loijQaYuk4l
	dxbvCGQf//pQSVG0Wb4M7C7NVBcIK8Iu4Md7WBrlACDtQ2rUL49kGUbF7T5t2XkM8BHBcX
	b45sI7ICema9q6Q38HvlV+bSbYCWhvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688977190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9c1Hyfa0qbZcmFBIiXA4YT0W5pWsuJ23T868Rm8ntrE=;
	b=mO+ukF0yxY4sZwLLdtFPXTD9hMZaME+nplule9TTUrRr8UQqt7ARS0rYr5T3Tc8FGA2DOt
	F74+13edVJnoIZBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CD4313A05;
	Mon, 10 Jul 2023 08:19:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NijtESa/q2SjCgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 10 Jul 2023 08:19:50 +0000
Date: Mon, 10 Jul 2023 10:19:49 +0200
Message-ID: <87jzv8i3fe.wl-tiwai@suse.de>
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
In-Reply-To: <56aecc8d-2f6c-42c0-a13a-89c84cf53773@sirena.org.uk>
References: <20230705125723.40464-1-srinivas.kandagatla@linaro.org>
	<ZKfAUOOcGoBanHHu@hovoldconsulting.com>
	<efaf5960-bcc5-6d52-5552-e1505a13b635@linaro.org>
	<87y1jrkgdx.wl-tiwai@suse.de>
	<3450ef1e-cb20-4242-b482-41d3d34c4564@sirena.org.uk>
	<87wmzbkfw7.wl-tiwai@suse.de>
	<f1041542-bd97-41d9-96b9-c6e5fef6b096@sirena.org.uk>
	<87v8evkf3w.wl-tiwai@suse.de>
	<56aecc8d-2f6c-42c0-a13a-89c84cf53773@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: TS5E7QL6MQ4D24NMHNF3SUMBPVLZS3L5
X-Message-ID-Hash: TS5E7QL6MQ4D24NMHNF3SUMBPVLZS3L5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TS5E7QL6MQ4D24NMHNF3SUMBPVLZS3L5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Jul 2023 17:06:24 +0200,
Mark Brown wrote:
> 
> On Fri, Jul 07, 2023 at 03:47:47PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > The ASoC generic control stuff supports inverting the value prior to
> > > presentation to userspace so it's masked there (instead of writing the
> > > number userspace sees to the register we subtract the number from the
> > > maximum value and write that to the register), pulling that up further
> > > to the ALSA core might be nice I guess?
> 
> > I believe yes.  Though, I'm still not sure how we can improve the
> > mismatch of dB min/max.  The dB values of those inverted controls
> > reflect the result of subtraction, no?
> 
> Yes, the dB scale presented to userspace is reversed relative to the
> ordering in the registers.

Right, the TLV min/max corresponds to the control values, and they
don't mean the raw register values.

BTW, this thread made me wonder whether it makes sense to give some
sanity checks (maybe with CONFIG_SND_DEBUG) in ALSA core.
e.g. read_tlv_buf() in sound/core/control.c can perform some tests
before actually passing to user-space.


Takashi
