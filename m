Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DD17BB373
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 10:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F8CE10E;
	Fri,  6 Oct 2023 10:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F8CE10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696582010;
	bh=+QGTbs0PKLm0Vf/5zpwCiUOxyLtqiFAIbDtuxkX1zBQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MSqkRPH5YMbMktzLQpFz/lGkWyiGXIybxm3xXldYe3hAhkdGWQq8TFo24RIAa++EU
	 tZ85104ljBkztFyaRiPFr93Ho0EnIlQWagFSxdiiEHEUzwBMz/b9Ueziv7JsM2tcGD
	 fGcGW5vV+GaQRKPkGwntKhPmwX9poa9sQTvaCTXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 882F7F80552; Fri,  6 Oct 2023 10:45:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32AF9F80310;
	Fri,  6 Oct 2023 10:45:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7057FF8047D; Fri,  6 Oct 2023 10:44:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F16EAF801EB
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 10:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F16EAF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=E7lDi/16;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2O3hMjHz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A6A3F1F8A4;
	Fri,  6 Oct 2023 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696581863;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MoQdbnuKO1w6sODFUz+7uIcyFrhzqRX6HUxbmD1gDpE=;
	b=E7lDi/16NsK4mF0pPODq3x1S637KMxa4Z+zqn0YfBAhAMTPS85qSdZWM29T7YZzJKwbwn9
	F6mIQUApmoGLP7Q5bxnn1MWWCeYYLN8x//1HUvzcj5xnV89Qpql/W2aOtdUF9atYbjGZem
	TWQWJuqgjXV/1kpIfmpA2XPuDzrBtTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696581863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MoQdbnuKO1w6sODFUz+7uIcyFrhzqRX6HUxbmD1gDpE=;
	b=2O3hMjHzp1kDqrw4YHpx4guuf71lEyxWcZi+STLFydqHocCsCFlyL9G5mq8/PrOQDMCuoa
	Rvr1IsX/p++5lqAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E01813A2E;
	Fri,  6 Oct 2023 08:44:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uHjiGefIH2XqHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 08:44:23 +0000
Date: Fri, 06 Oct 2023 10:44:22 +0200
Message-ID: <87y1ggw36h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [PATCH v3 0/4] ALSA: hda: Abstract and update HOST-stream setup
 procedure
In-Reply-To: <20230926080623.43927-1-cezary.rojewski@intel.com>
References: <20230926080623.43927-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ODYLENSCDK7ONHGAQAOSMACCCJRPL2PM
X-Message-ID-Hash: ODYLENSCDK7ONHGAQAOSMACCCJRPL2PM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODYLENSCDK7ONHGAQAOSMACCCJRPL2PM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Sep 2023 10:06:19 +0200,
Cezary Rojewski wrote:
> 
> The patchset targets two intertwined topics:
> 
> The driver shall poll SDxFIFOS to ensure a valid value is set by the
> controller after programming SDxFMT. Due to amount of users and
> limited-number of configuration available in our CI when compared to
> overall possibilities on the market, the check is non-blocking.
> 
> Second topic relates to stream setup procedure. The procedure differs
> between HDAudio controller device revisions. Right now those differences
> are handled directly by a platform driver. Existing top-level
> 'if (pci->device == APL)' could be replaced by a abstraction in lower
> parts of the code instead.
> 
> With that done, the two users are updated accordingly. In avs-driver
> case, this updates the flow to the recommended one.
> 
> Changes in v3:
> - fixed issues pointed out by scripts/kernel-doc
> 
> Changes in v2:
> - fixed ->host_setup assignment in patch 02/04
> 
> Cezary Rojewski (4):
>   ALSA: hda: Poll SDxFIFOS after programming SDxFMT
>   ALSA: hda: Introduce HOST stream setup mechanism
>   ASoC: Intel: avs: Use helper to setup HOST stream
>   ASoC: Intel: Skylake: Use helper to setup HOST stream

Sorry for the late reaction, as I've been (still) off since the last
week.

Now applied now to for-next branch.


thanks,

Takashi
