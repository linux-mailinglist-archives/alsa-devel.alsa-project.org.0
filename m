Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 150607CFF9F
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 18:30:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 310B185D;
	Thu, 19 Oct 2023 18:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 310B185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697733030;
	bh=KlFHzDkHWETKUURh3TlzusTB96Qz1CazX37bVahMeDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UkM/nk1/eGNMPp1sK0wmeyR0dYfwQOeepi57DVurEMSWDsocAnSKFkvzI5ohyQCaC
	 Nz/MiFkPm+ckV+f1EKjX9mtUYf76qeZAluWghZ47UdB6d8tZK9HF0/55735bq2pZWw
	 +73YYh2HWjc9kol3FYucehaRpCk1sCmSvStx8XZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6414F8056F; Thu, 19 Oct 2023 18:28:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41FDAF8055A;
	Thu, 19 Oct 2023 18:28:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E8EF8025F; Thu, 19 Oct 2023 16:32:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C84CF80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 16:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C84CF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=gI9ovYiR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A9F38CE2E07;
	Thu, 19 Oct 2023 14:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56F4C433C8;
	Thu, 19 Oct 2023 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697725932;
	bh=KlFHzDkHWETKUURh3TlzusTB96Qz1CazX37bVahMeDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gI9ovYiRWYh5BBtoepChPsFbIFWgrf2dwW6PSDS+6qrJQFZr5MCzdpnHIIYNjtQgK
	 TzZ7YbvG5CD6Dk0R29M01IyEx2rQJGcumMHFgaQJiXQSoetWmaLE1qFJWO0pzrnd6b
	 0tZFUF4V4zaAsTm9hQI4e6Nq3ItwO9XGLCSynwIA=
Date: Thu, 19 Oct 2023 10:32:11 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.de
Subject: Re: Migrating this list to a different platform (take 2)
Message-ID: <20231019-posture-cache-fe060b@meerkat>
References: <20231017-coroner-blurt-edffe8@meerkat>
 <8f62db8c-b10c-0256-a56c-28b998d1a3bc@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f62db8c-b10c-0256-a56c-28b998d1a3bc@perex.cz>
X-MailFrom: konstantin@linuxfoundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TV5X4PCSRYMAAX7IQMZ4MIZE3UJJ4AXJ
X-Message-ID-Hash: TV5X4PCSRYMAAX7IQMZ4MIZE3UJJ4AXJ
X-Mailman-Approved-At: Thu, 19 Oct 2023 16:28:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TV5X4PCSRYMAAX7IQMZ4MIZE3UJJ4AXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Oct 19, 2023 at 03:57:35PM +0200, Jaroslav Kysela wrote:
> > I'm told that a while back there were some discussions to migrate this list to
> > vger, but the process never really got finalized.
> > 
> > I would like to restart this discussion again, because I am in the middle of
> > vger list migrations and it seems like an opportune moment to bring this up.
> > 
> > There are the following benefits to gain after migration:
> > 
> > - it becomes an open list that doesn't require much moderator involvement
> 
> I think that it may be the main reason to migrate it. How do you handle the
> inbound spam? It's the only reason, why our mailing list is moderated.

We do allow a small amount of spam through, unfortunately, but the combination
of aggressive blocklist checking, spam filtering, and strict content policies
allow us to keep that volume pretty low (1-2 messages a week for most lists).

> > - we can try to set up a forward from the old address, but previous attempts
> >    to do so with mailman had mixed results
> > - if the old address is set up to forward mail to the new address, then anyone
> >    sending to both addresses will get doubles of everything, which can be
> >    annoying
> > - setting up a hard bounce at the old address would probably be preferable,
> >    but it's a "ripping off the bandaid" kind of approach
> 
> Ideally, the e-mail address of the list should be preserved, but I guess
> that an option to redirect DNS MX records to LF servers is not possible,
> right?

Well, it's possible, but that would require us handling all of
alsa-project.org mail, and it's probably not what you want. We *can* set
things up so we treat alsa-project.org as an internal relay, and then you just
pass alsa-devel@alsa-project.org to our lists server, but this is somewhat
fragile as well.

There's a third option -- instead of migrating the alsa-devel list, we can
migrate all activity to linux-sound@vger.kernel.org. It's an existing list
that currently sees about 5 messages a year (and most of them are cc'd to
alsa-devel anyway).

The process would be:

1. Set up https://patchwork.kernel.org/project/alsa-devel/ to source from two
   lists instead of just alsa-devel (we do this already for netdev, which
   sources from both netdev and bpf lists)
2. Change all MAINTAINERS entries from alsa-devel to linux-sound
3. Eventually, this will result in almost no patches being sent to alsa-devel,
   at which point we can evaluate if the alsa-devel list sees little enough
   traffic that it can just be closed or redirected

I think this option is worth considering because it will achieve the desired
effect of removing moderation on submitted patches, keep existing maintainer
workflows, and not require actually migrating the alsa-devel list.

Thoughts?

-K
