Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5FB74CDD7
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 09:02:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34892850;
	Mon, 10 Jul 2023 09:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34892850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688972527;
	bh=OQ6bJNXpMj/oMZcbI336u2DFiwGgKM24H3kWNExk2Us=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lUxG/90lr/GkZa/+U0Q9A9SFv49G0o8mopI7P8q3TtYRRrfKC/vpvKI1PLtdzbO0n
	 d+/dVgPH5ocZP/xVq90isD9QKBO8NjEJI/6+tn5Ot5GcqByDAmdPcsQnDpz07/I1Vb
	 ZqnDxUHcwOa9FzqTjYCG0u9a+GFkb3x431C1PCQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FCC8F80571; Mon, 10 Jul 2023 09:00:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37BE6F8055B;
	Mon, 10 Jul 2023 09:00:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94E7BF80551; Mon, 10 Jul 2023 09:00:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F327F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 09:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F327F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SAiFS8bt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VK/0YYUx
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6B2081F38D;
	Mon, 10 Jul 2023 07:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688972411;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8lsYU8eTR/+2vxTT2ktjYy/lbIGikqZVqJISjVkDRtU=;
	b=SAiFS8bt3oIoIjNAkhH/jJ5HPdyfxiXucL0tM8Mli0hsVI313mfFGPPNIvnbqw9dhfE8A8
	R1bQm1u2oLNujzhILJAl8xcqc/A5y2BKAtTFli04SRbB8edImnqWZk6jxtSNh2UY1aFwJZ
	FgOWNst2w50UC9aNhqX3mzKinGjPRBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688972411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8lsYU8eTR/+2vxTT2ktjYy/lbIGikqZVqJISjVkDRtU=;
	b=VK/0YYUxyWgb7TXPucwL/gw+iaHL6jQupqHrwbxhabF/nOZtUMDTBl5vKABHVwtHmgQMiF
	eHC/PJ6YNWbSr8CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30AB61361C;
	Mon, 10 Jul 2023 07:00:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xGgzCnusq2S1YgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 10 Jul 2023 07:00:11 +0000
Date: Mon, 10 Jul 2023 09:00:09 +0200
Message-ID: <87wmz8i746.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: =?ISO-8859-1?Q?=22N=EDcolas_F=2E_R=2E_A=2E=22?= Prado
 <nfraprado@collabora.com>,	Jaroslav Kysela <perex@perex.cz>,
	kernel@collabora.com,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Shuah Khan <shuah@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/alsa: pcm-test: Decrease stream duration
 from 4 to 2 seconds
In-Reply-To: <06b8bfde-e4f1-48ea-aa3e-35d2fe5df046@sirena.org.uk>
References: <20230620220839.2215057-1-nfraprado@collabora.com>
	<20230620220839.2215057-3-nfraprado@collabora.com>
	<33bea0d3-b8dd-4936-812e-392166df4437@sirena.org.uk>
	<443f697b-fecf-6e8e-0b76-65257aff7da8@perex.cz>
	<9069ad0c-d166-4620-a3de-a36ab233cab0@sirena.org.uk>
	<5c2d5213-5299-44f1-9611-26002c8a5d3a@notapiano>
	<87352krcz5.wl-tiwai@suse.de>
	<f5cab2c2-1638-4d19-aff3-d46ed34b857e@sirena.org.uk>
	<87wmzwptu0.wl-tiwai@suse.de>
	<06b8bfde-e4f1-48ea-aa3e-35d2fe5df046@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: RUR2YT3Z6SHP57E3RSCVOZGBRPHJCMK7
X-Message-ID-Hash: RUR2YT3Z6SHP57E3RSCVOZGBRPHJCMK7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUR2YT3Z6SHP57E3RSCVOZGBRPHJCMK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Jun 2023 20:19:46 +0200,
Mark Brown wrote:
> 
> On Wed, Jun 21, 2023 at 08:13:11PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > It feels like it might be good to let it cook for a bit longer before
> > > going to Linus (eg, applying after the merge window) so we've more
> > > chance to see what the impact is on other boards?
> 
> > I'm fine with that option, too.  Are most of selftests performed on
> > linux-next basis, or rather on Linus tree?
> 
> For KernelCI we've got coverage on both.  I can also run stuff on the
> boards I have in my lab on demand of course, but there's more coverage
> in KernelCI.

OK, now I applied those two patches to for-next branch (i.e. for 6.6
kernel).  Let's watch out.


thanks,

Takashi
