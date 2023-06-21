Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F62738B6B
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 18:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 606AD209;
	Wed, 21 Jun 2023 18:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 606AD209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687365329;
	bh=OSQt3l4/9L4uL/sUFVx2iXPy/m6UKENdMkc1xdWX6Kc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Am/sXDOe+WeT4l8HA3nPL2BrMXKjPcI2xCR+nn6YW7yqsu3TgFR7IBQLvBIh3Bs8k
	 XmQwHMcIw9rovsQbk0zJe4TA//eoDTzTkNn6ssp8KFmxoEjDd2P96YIPUeD/PN/lQm
	 YA7EUcQ6dHWfha1zQv/KhSW5vjzIdG7MbSdVzYfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEB54F801F5; Wed, 21 Jun 2023 18:34:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B170F80132;
	Wed, 21 Jun 2023 18:34:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F660F80141; Wed, 21 Jun 2023 18:34:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 829E9F80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 18:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829E9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bzbna+hl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UlBAF8kO
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AEB272199E;
	Wed, 21 Jun 2023 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687365262;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nP97CZRMi7DzHuqo3ZRpLhOQxus1icZrg2m4Gx76Tsw=;
	b=bzbna+hlHAKeGsV1/PiehUW/1VgYgGkIixL5MqK8MJcl85KtxZQAErWUxpwpK0MNH/5wjz
	iDD9V1MjrFlFn8pM9yO9KUZelNSqIG7zPZzUtpHgH80tRcYZHsUJRGjs8huyCGN6PTowBb
	zcycPg0NGa579PoAZ33AAP60Wc2ctMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687365262;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nP97CZRMi7DzHuqo3ZRpLhOQxus1icZrg2m4Gx76Tsw=;
	b=UlBAF8kOJR4yUNnNtzxj7DprWyeel6m/433ZEs5yCwgIsE7i3cpXIG8pW0OylRnXjPsCQH
	ic+uOb6ZgkuZJ8Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B0B1133E6;
	Wed, 21 Jun 2023 16:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nXcMHY4mk2ToQgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 21 Jun 2023 16:34:22 +0000
Date: Wed, 21 Jun 2023 18:34:22 +0200
Message-ID: <87352krcz5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22N=EDcolas_F=2E_R=2E_A=2E=22?= Prado
 <nfraprado@collabora.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shuah Khan <shuah@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/alsa: pcm-test: Decrease stream duration
 from 4 to 2 seconds
In-Reply-To: <5c2d5213-5299-44f1-9611-26002c8a5d3a@notapiano>
References: <20230620220839.2215057-1-nfraprado@collabora.com>
	<20230620220839.2215057-3-nfraprado@collabora.com>
	<33bea0d3-b8dd-4936-812e-392166df4437@sirena.org.uk>
	<443f697b-fecf-6e8e-0b76-65257aff7da8@perex.cz>
	<9069ad0c-d166-4620-a3de-a36ab233cab0@sirena.org.uk>
	<5c2d5213-5299-44f1-9611-26002c8a5d3a@notapiano>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AWLFOML36HYL3HPARBEDGOQ56NNV24AL
X-Message-ID-Hash: AWLFOML36HYL3HPARBEDGOQ56NNV24AL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWLFOML36HYL3HPARBEDGOQ56NNV24AL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Jun 2023 18:03:22 +0200,
Nícolas F. R. A. Prado wrote:
> 
> On Wed, Jun 21, 2023 at 03:39:12PM +0100, Mark Brown wrote:
> > On Wed, Jun 21, 2023 at 04:08:47PM +0200, Jaroslav Kysela wrote:
> > 
> > > I think that the problem is somewhere else here. The overall test timeout
> > > should be calculated dynamically. All tests may be queried for the maximal
> > > expected interval based on the hardware/software capabilities. It's a bit
> > > pitfall to have a fixed time limit where the realtime tests depend on the
> > > number of devices.
> > 
> > I tend to agree here, unfortunately Shuah hasn't responded to queries
> > from Nícolas about this which I imagine is what inspired this patch.  We
> > also have problems with mixer-test on one of the Dialog CODECs with a
> > couple of 64k value controls and no cache only mode.
> 
> Yes, exactly. I've tried increasing the timeout for this test to a larger fixed
> value previously, and later asked for more information on how to deal with the
> kselftest timeout. [1]
> 
> Since I didn't hear back, I thought this patch would be a way to at least
> mitigate the issue for now, without limiting the test coverage, which was a
> concern with having limited scopes for the test.
> 
> I've just noticed that in the mean time a way to override the timeout when
> running kselftest has been introduced [2], so I suppose we could use that to
> work around the timeout limitation in CI systems and be able to run through
> completion on the different hardware at the lab. But I still believe, like you
> do, that calculating the timeout at runtime based on the hardware would make
> much more sense, though if there's such a desire to keep kselftests under the
> 45s mark, I'm not sure if it would be acceptable.
> 
> [1] https://lore.kernel.org/all/5302e70d-cb58-4e70-b44f-ff81b138a2e1@notapiano/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f6a01213e3f8

So, we're back to square...  Unless anyone has a strong objection, I'm
inclined to take this as a workaround for 6.5 for now, as the merge
window deadline is coming.  We can improve things at the same time for
the future kernel, too.


thanks,

Takashi
