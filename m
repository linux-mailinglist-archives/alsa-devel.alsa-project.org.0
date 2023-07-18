Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E73B6757374
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 07:53:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D12AEA;
	Tue, 18 Jul 2023 07:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D12AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689659590;
	bh=+S6VN0CEl3gnUHVaGn8b8f/RfU2Q/EC/9mVkNK/eJOo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XNYUsfjZdvpqmt+eF5FPDwLwprXn86mMtRuf4G4jhReGapId7cwuBuzRMfHkNkxgd
	 XihIOYUe4PBxHDbSFTMTmBldNfc3j8CtFKa6R7mjglbrMEsCDggmTu+z6gJo/LIecx
	 4RLSJiRXp9UEB96Vr6VDE444m9vE3Yz2QwY0dIoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB3F2F800D2; Tue, 18 Jul 2023 07:52:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F60F8032D;
	Tue, 18 Jul 2023 07:52:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68248F8047D; Tue, 18 Jul 2023 07:52:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D68FDF8027B
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 07:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D68FDF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=X5ddLOyl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UixYD5s7
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3FD92218F9;
	Tue, 18 Jul 2023 05:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689659520;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GKTCHsPZDxJHkQIHvvHyKTZbXmSt1k7/MALwL+L6NSA=;
	b=X5ddLOylPh4ISr9lzuTnDKSUSVATs36cH384xGmMFhjBfI6UFttBSxnCZco4R//zrNKNqD
	rKlWh6z9B6YuN8rB3hbt31yZtQiW8TwtKMUvVbRVsVce8rnI13UTVlv8k5yYBvApROi6AJ
	qfp9vs3tGPZQ1pL0ZlteJkIGpG2XYwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689659520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GKTCHsPZDxJHkQIHvvHyKTZbXmSt1k7/MALwL+L6NSA=;
	b=UixYD5s7eSu6lwcq/9BddjWZVV92ZcA/yqFgbimriQ9jGg6DH50rNPhxDJKkSbbRfeJDxy
	wPeEyL155JxVqEBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EBD02133FE;
	Tue, 18 Jul 2023 05:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 29gNOH8otmQ/dgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 05:51:59 +0000
Date: Tue, 18 Jul 2023 07:51:59 +0200
Message-ID: <87zg3tojgg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v2 0/5] ASoC: Improve coverage in default KUnit runs
In-Reply-To: 
 <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
References: <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: KI7KP7QWJRRLKV32EHDTIYEA63EHYRMS
X-Message-ID-Hash: KI7KP7QWJRRLKV32EHDTIYEA63EHYRMS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KI7KP7QWJRRLKV32EHDTIYEA63EHYRMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jul 2023 02:28:41 +0200,
Mark Brown wrote:
> 
> We have some KUnit tests for ASoC but they're not being run as much as
> they should be since ASoC isn't enabled in the configs used by default
> with KUnit and in the case of the topology tests there is no way to
> enable them without enabling drivers that use them.  This series
> provides a Kconfig option which KUnit can use directly rather than worry
> about drivers.
> 
> Further, since KUnit is typically run in UML but ALSA prevents build
> with UML we need to remove that Kconfig conflict.  As far as I can tell
> the motiviation for this is that many ALSA drivers use iomem APIs which
> are not available under UML and it's more trouble than it's worth to go
> through and add per driver dependencies.  In order to avoid these issues
> we also provide stubs for these APIs so there are no build time issues
> if a driver relies on iomem but does not depend on it.  With these stubs
> I am able to build all the sound drivers available in a UML defconfig
> (UML allmodconfig appears to have substantial other issues in a quick
> test).
> 
> With this series I am able to run the topology KUnit tests as part of a
> kunit --alltests run.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Changes in v2:
> - Add support for building ALSA with UML.
> - Link to v1: https://lore.kernel.org/r/20230712-asoc-topology-kunit-enable-v1-0-b9f2da9dca23@kernel.org
> 
> ---
> Mark Brown (5):
>       driver core: Provide stubs for !IOMEM builds
>       platform: Provide stubs for !HAS_IOMEM builds
>       ALSA: Enable build with UML
>       kunit: Enable ASoC in all_tests.config
>       ASoC: topology: Add explicit build option

Those look like sensible changes.

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
