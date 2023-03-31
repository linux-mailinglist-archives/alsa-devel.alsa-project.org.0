Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F18A46D361C
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Apr 2023 10:13:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 476421FC;
	Sun,  2 Apr 2023 10:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 476421FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680423229;
	bh=yhCB0mI36C1VXatllcxVdD37VyFTD32kM/CXmmPUDRU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ENqfnknhokrM+t73D97qujdfdfyB7uN+45nRKxzv73YjQpNG6aJy5OSanNo8RoCcY
	 wCUjB+4JCaG32bY0Rb4PR7Ugei4bBCwxXc7B7Xqanqg461YNnS+tegjbM6fP2Fpyjc
	 wdY0L0jYPMlp5UHIBInxjC0BwSWvdaJUCf5EUihc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19A57F80534;
	Sun,  2 Apr 2023 10:11:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E484F80290; Fri, 31 Mar 2023 20:00:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F097F8024E
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 19:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F097F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G1D8nHt7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16F1762B09;
	Fri, 31 Mar 2023 17:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76957C4339B;
	Fri, 31 Mar 2023 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680285589;
	bh=yhCB0mI36C1VXatllcxVdD37VyFTD32kM/CXmmPUDRU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=G1D8nHt7mY4QHYjVSreZwIPtiuLDaabAtWocpbJtrJ2MYaR0gzqFECe7B93cs9Hce
	 AzbGZbY9xUXrJkwcz2Ek8BrtZ2x3/c6l4cM96QxJt8wDa8BoivQVSJfORSLlMcLJF5
	 lg8LvTNlOaQcClUikShZQxd8G54PCm6b0YSdfSM4WxZjz4yRFJZRFe3ar3lBZvt+XX
	 TY0agh7lNUTXJplBLDZbF3uNvpc4lXJXo3a1g06I8H+5GuSzT6GUTfe93xEzix5Gu+
	 lsyMXaRJF7E0M3nkEkeBlpog1f+wMCW5MGV5cS5Cz/XIXAIJgATnZM7IQ/ABurPysP
	 61ffw9d4d1ISg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 59DC8C395C3;
	Fri, 31 Mar 2023 17:59:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: perex@perex.cz, bugs@lists.linux.dev, tiwai@suse.com,
 alsa-devel@alsa-project.org
Message-ID: <20230331-b216392c1-7a8e13d80aac@bugzilla.kernel.org>
In-Reply-To: <20230331-b216392c0-c38b1eac72db@bugzilla.kernel.org>
References: <20230331-b216392c0-c38b1eac72db@bugzilla.kernel.org>
Subject: Re: Asus ROG Zephyrus GX701L sound problem
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Fri, 31 Mar 2023 17:59:49 +0000 (UTC)
X-MailFrom: bugbot@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QO4A6BMB5H4MB5PNBOGS4X2QH4QZHAWI
X-Message-ID-Hash: QO4A6BMB5H4MB5PNBOGS4X2QH4QZHAWI
X-Mailman-Approved-At: Sun, 02 Apr 2023 08:08:24 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QO4A6BMB5H4MB5PNBOGS4X2QH4QZHAWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

rakic.iwan writes via Kernel.org Bugzilla:

Any news?

View: https://bugzilla.kernel.org/show_bug.cgi?id=216392#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

