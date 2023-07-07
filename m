Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 945FF74B1CD
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 15:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 839193E7;
	Fri,  7 Jul 2023 15:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 839193E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688736712;
	bh=XkM5fI108OLI61Ld0/rQxbLfnDNbbtay3MtNfjLqr6w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=myt2mkRgtqXSO1db/rgwF5dqnihxUp5wr5zhYlL+1tkaXaEs5uXho0KTSDaxv6mFC
	 +6VbkpmYO44OWCI59BJ3UJOIupzVVP8jsKR2SLlI5IW3lXvZaLdkGWPurlbVFUwuAW
	 fjS2F5wyUouLDvPm0qU5NxvfZZw7LyJdUX2ffOwE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C32DCF80093; Fri,  7 Jul 2023 15:31:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62D0EF80124;
	Fri,  7 Jul 2023 15:31:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1CD4F80125; Fri,  7 Jul 2023 15:30:55 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B547F80104
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 15:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B547F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OfKupCDL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VPllrIwj
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7C1F22695;
	Fri,  7 Jul 2023 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688736648;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dML+Bci7dvwejb6fUN7elzw5DqVmGNwoDlI56jXp5jo=;
	b=OfKupCDLFLkgEOE1Gv6MCWiNkK7+GW6YUeLeaUAOcWOc9SFKx4HPAJ4fBbSuQPNMe9J7rl
	Glj83gAjHi7uHvlsmhLpkqgkXY2HMBMSMkUYZzYDnCPDa7cP5wK14AxxNkbhdRf73RslgL
	j8kKcs6TP8gXFbxN8MydDSZNJM9TPBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688736648;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dML+Bci7dvwejb6fUN7elzw5DqVmGNwoDlI56jXp5jo=;
	b=VPllrIwjpS28/Oy40IrMqdng/0BqwT/L23bu9CyaTHtRoWcVsnu6tNlmyJsv1E2uX8oZdw
	nfLc5Tzn6sMsbfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FB6F1346D;
	Fri,  7 Jul 2023 13:30:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Vd3gJYgTqGQIWgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 07 Jul 2023 13:30:48 +0000
Date: Fri, 07 Jul 2023 15:30:48 +0200
Message-ID: <87wmzbkfw7.wl-tiwai@suse.de>
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
In-Reply-To: <3450ef1e-cb20-4242-b482-41d3d34c4564@sirena.org.uk>
References: <20230705125723.40464-1-srinivas.kandagatla@linaro.org>
	<ZKfAUOOcGoBanHHu@hovoldconsulting.com>
	<efaf5960-bcc5-6d52-5552-e1505a13b635@linaro.org>
	<87y1jrkgdx.wl-tiwai@suse.de>
	<3450ef1e-cb20-4242-b482-41d3d34c4564@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: FDUNM5GSZG6ZKBV76XSSTXIV7SSZ76XC
X-Message-ID-Hash: FDUNM5GSZG6ZKBV76XSSTXIV7SSZ76XC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDUNM5GSZG6ZKBV76XSSTXIV7SSZ76XC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Jul 2023 15:22:45 +0200,
Mark Brown wrote:
> 
> On Fri, Jul 07, 2023 at 03:20:10PM +0200, Takashi Iwai wrote:
> > Srinivas Kandagatla wrote:
> 
> > > yes, the highest value corresponds to lowest dB which is why its inverted.
> 
> > Ouch, that's a bad design choice...
> 
> It's moderately common - typically in these cases the control is
> described in the datasheet as an attenuation control rather than a gain,
> and this usually corresponds to the physical implementation being only
> able to make signals smaller relative to the reference.

Yeah, I see the use case.  The problem is, however, that we're using
the very same dB info for both gain and attenuation.  That means,
application has no idea how to interpret those dB values -- to be
added or to be subtracted.

We should have defined a new TLV type for attenuation to
differentiate, and define the TLV macro to give proper min/max.


Takashi
