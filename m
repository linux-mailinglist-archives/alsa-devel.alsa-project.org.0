Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D45C171A3A2
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:05:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35339839;
	Thu,  1 Jun 2023 18:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35339839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685635507;
	bh=47U77481J8R45xXOIvay+70BtesXIQ5aQ4HfME31dZw=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ro/q9nwNpBjkT20TxtFNC3O0GfUkbfqM6PflL/qSHg8TryGkFqN6/4pq39H+NyxWf
	 B7E5Ly5i8DZDW2nvDEF2lk/stwYZmxLf3mcYyhqAaWYpWPbU5rEK0PmV9eJ/q9wqLa
	 5VKgnDBacr24Zl8jteUsRssPJuWLAo97RppFWoE0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75448F805B0; Thu,  1 Jun 2023 18:02:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6210F805B0;
	Thu,  1 Jun 2023 18:02:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0DE5F80249; Sat, 27 May 2023 21:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 328FDF8001F
	for <alsa-devel@alsa-project.org>; Sat, 27 May 2023 21:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 328FDF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iGIh//w1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 63E6360D33;
	Sat, 27 May 2023 19:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B184CC433D2;
	Sat, 27 May 2023 19:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685215699;
	bh=47U77481J8R45xXOIvay+70BtesXIQ5aQ4HfME31dZw=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=iGIh//w1R0aZbi6rkc8qZritYorqCU5chD0p5r/4uyFSRoECVlXCsdnhUcbLwdXDL
	 WGh67k0fcNYUJSVFII2t1HF1ZjwlynBKywpt5ghxPnBds+aW98VlaYih7JZgP5MmmV
	 zu3NLXtpLf5QxuCJohSIwJjuFhzUgp1WCb/E6QJ6Ftsi9yUTDfWUbqsjIw6WbXbPKq
	 cF2U9ZRt8Q6US9zOc8szJSdJbyaXAqLxQD9YFscLOlVB0rxj3wgmXRqLsb8m8NpBe5
	 RlAwVO6TK5IirXWpeeCuYcRGVdaovv7DRTK1RSf//ScqVCzDruiptudSp3ZR/9KwFA
	 f6cdSNdJN+92g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8C086C4166F;
	Sat, 27 May 2023 19:28:19 +0000 (UTC)
Date: Sat, 27 May 2023 19:28:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: bugs@lists.linux.dev, tiwai@suse.com, alsa-devel@alsa-project.org,
 perex@perex.cz
Message-ID: <20230527-b216392c2-2360e52d040f@bugzilla.kernel.org>
In-Reply-To: <20230331-b216392c1-7a8e13d80aac@bugzilla.kernel.org>
References: <20230331-b216392c1-7a8e13d80aac@bugzilla.kernel.org>
Subject: Re: Asus ROG Zephyrus GX701L sound problem
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
X-MailFrom: bugbot@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4FESBZKRI5CWE57SCVJDLGVIKPXIHPYG
X-Message-ID-Hash: 4FESBZKRI5CWE57SCVJDLGVIKPXIHPYG
X-Mailman-Approved-At: Thu, 01 Jun 2023 16:02:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4FESBZKRI5CWE57SCVJDLGVIKPXIHPYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

mpagano writes via Kernel.org Bugzilla:

(In reply to Ivan from comment #1)
> Any news?

There at least an acknowledgement of the growing problem and a statement that it's being worked on.

https://lore.kernel.org/lkml/1991650.PYKUYFuaPT@fedora/

View: https://bugzilla.kernel.org/show_bug.cgi?id=216392#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

