Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C1C872598
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 18:25:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54813206;
	Tue,  5 Mar 2024 18:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54813206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709659506;
	bh=ulWrTp+lCV+gMNzuEsMt7+NdH9m0bIisaeuCfQ/H8QE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lkdhZoxZmvHc4rSxEzUyOclJCQEHIdc+m+ZqKHuJWmuqNIYSYETc+OnEkntMRA5x9
	 LhHaKPSh5QsvuEVcrRCzSSlBMRe+VhpIriIMmrOj3rMD35eYEvDoLqCgloq7feonzJ
	 6JzaRUFDXuU4U4oc41uomVEJkfpGGltKU/p7l3hA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3141EF805A8; Tue,  5 Mar 2024 18:24:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCE9CF802E8;
	Tue,  5 Mar 2024 18:24:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E14FF8024E; Tue,  5 Mar 2024 18:24:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D705AF80088
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 18:24:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D705AF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QrNdYMDP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8A5A7CE1CE8;
	Tue,  5 Mar 2024 17:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE591C433F1;
	Tue,  5 Mar 2024 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709659458;
	bh=ulWrTp+lCV+gMNzuEsMt7+NdH9m0bIisaeuCfQ/H8QE=;
	h=Date:From:To:Cc:Subject:From;
	b=QrNdYMDPC/2tFJec41XasQKtNc041wNjuL5OO8PQ1hxCSb/ldGPYzjb0+xAueLtB5
	 QyGGFFB3eXPzuD8MP59Xwfh4Q5HbPZ8mqASpYcTd/uywW43rD4H0J6Y2l6jP+aH9Uz
	 03CnagADHeI4OrUvpjlxgEASx3VuVKCwrrhQOEKaV79BM2FUL/npnEXTRwFEVStAk+
	 KZDzeX71Cfeehmxe/IkcDIVpGK5wnQChaFYQc8HqYHKfZqCElrcT+MmF5Kd+FYfu1c
	 Q3jROYzeJxzSaf9T4pG53d9VHi2Cy9BP1G15pbrsOa9L7MgDEd0WXxq/+tRS7S1poW
	 iu/QSAT4pDzlA==
Date: Tue, 5 Mar 2024 11:24:15 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: [PATCH 0/2][next] firewire: Avoid -Wflex-array-member-not-at-end
 warnings
Message-ID: <cover.1709658886.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 7XQHK763LJ5UHJDEB4W6MXJOBZ5DSZ6L
X-Message-ID-Hash: 7XQHK763LJ5UHJDEB4W6MXJOBZ5DSZ6L
X-MailFrom: gustavoars@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XQHK763LJ5UHJDEB4W6MXJOBZ5DSZ6L/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

-Wflex-array-member-not-at-end is coming in GCC-14, and we are getting
ready to enable it globally. So, we are deprecating flexible-array
members in the middle of another struct.

There are currently a couple of local structures (`u` and `template`)
that are using a flexible `struct fw_iso_packet` as header for a couple
of on-stack arrays.

We make use of the `struct_group_tagged()` helper to separate the
flexible array from the rest of the members in the flexible structure,
and, with this, we can now declare objects of the type of the tagged
struct, without embedding the flexible array in the middle of another
struct.

We also use `container_of()` whenever we need to retrieve a pointer to
the flexible structure, through which the flexible-array member can be
accessed.

With these changes, we fix a couple of -Wflex-array-member-not-at-end
warnings.

Gustavo A. R. Silva (2):
  firewire: Avoid -Wflex-array-member-not-at-end warning
  ALSA: firewire-lib: Avoid -Wflex-array-member-not-at-end warning

 drivers/firewire/core-cdev.c  |  9 +++++----
 include/linux/firewire.h      | 16 +++++++++-------
 sound/firewire/amdtp-stream.c |  8 +++++---
 3 files changed, 19 insertions(+), 14 deletions(-)

-- 
2.34.1

