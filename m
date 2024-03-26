Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5E588B975
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 05:34:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 835EC22AD;
	Tue, 26 Mar 2024 05:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 835EC22AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711427672;
	bh=IhgcPJahWSRqfjJwBrShpUw5E2m43EnaA2Mt/ATePLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tP1TV8dyKQi2EVn+Sw8KZxX7oDphVNp6C5Dfqc59U3+xK7l3S6UWjX5bw9OCUQrv5
	 jc/oLXzqSSEJ5dYAXT2LM/Htv0ckMjmnMaj9CPVCZO0ELDmM4816kp8l1Xfc1GV+x1
	 focs90cOYRs0H41bCNhlmA3Vi9bfmOJqQc0JsMkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C293F8057E; Tue, 26 Mar 2024 05:34:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F380DF8057C;
	Tue, 26 Mar 2024 05:34:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68D9AF8025F; Tue, 26 Mar 2024 05:33:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wfout5-smtp.messagingengine.com
 (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F972F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 05:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F972F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=j++kSQ/g;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=L2eG5ok8
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id 044F31C000A7;
	Tue, 26 Mar 2024 00:33:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 26 Mar 2024 00:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1711427602; x=
	1711514002; bh=J1PIXRG0tyhvH3hge9TpL3+zsAlh+77DoXH9DaFIs9c=; b=j
	++kSQ/g5nHKE5YjDucGr5xoVotGPBsW1jkMQtS0eDswn6msQijgd4Vgo/P2R2FSU
	hgI7URMx3qkYKaA1g7IAkFTGTjrxAXHVhgeRnwVuBV9Z+4KdVM5lJbdj4ZIk/4SI
	2WxJRNhJu4npw8B8AUwCAxmzDikeIa2MPOZrlFUz4Gmsq92rmtCwxUT/tGObRyVZ
	fRUpM+JObVAR4Qv+bLcvPDPjdMiCgjt1yhxdxVedJeifkJIx4RCr5jG12E3wY3gS
	XSRN7BVsgV4fv74/xDdDCUwYAwBiHVJ+Dq8MMwHv/MDlBwxjxpQahyys7e5cj8g5
	cg+xCtI4E8qO8T3aGIl6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711427602; x=1711514002; bh=J1PIXRG0tyhvH3hge9TpL3+zsAlh
	+77DoXH9DaFIs9c=; b=L2eG5ok8zkYt4QDNArV9lwAs2w4HfoYNzvCcifPRkmfT
	Y5rOJq5blihrVCwwU8BpIj3xEAJcFXLnsThOcfytE9m1aHGcl1U+CRC1J2eT0Lq7
	Hoaut4xU1plVUTK/oGB1gg9fVpJa7aAKnSDyMgYCu1KHx+GacRjqxG+8NwNO/Do/
	RCucjFJS5kTM0SYHMwpkMc80aFXpfJhuyJirl+YA0K4t0EUOEQVxlkf9B+eUTkSC
	ZUCE9ote0WSb/3hhx6K/NUqwzV8q4VYHI0pVi04R9eAGSg9shGbUxYCSP/5Uugxo
	/aIYpqUCRpU9BaBoktENTVr8iaYe6KY8ayDjpkIs7Q==
X-ME-Sender: <xms:EVACZmgHmhDsH4I1C3WHZh-z4rNYFVh9a7dQbSHrqgRMjOdLWlB8mA>
    <xme:EVACZnCzEsBhx9Dp0icVi0CTTdMN37RGzryk_rsbsUuMDDu61ZCc6jdUKb6amDKS-
    qkY791PODvpa4tujic>
X-ME-Received: 
 <xmr:EVACZuFezRcNC_YeXn6eKh_1lQ_nbsM_Ruxm57yZua5pI2GYzk6cQnZmyPXZAFflgyvBOFbhqn3hccBZ2OHKX2fIQW5bAsdsCxY>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrudduvddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepvdeugeejleeuhfeggeehieejhfefheeuledvfedv
    fedtfeduvefgheehgefftddtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:EVACZvT3_n-MhYpbtkopfVa5aZ3_ChW1_xcuI1taeMxraG_A6z-law>
    <xmx:EVACZjyPiPvXPNr5STCXdOFtnkJ0hW-UPBWnCFLcVyvBaGLpkuPbQQ>
    <xmx:EVACZt6AC14-EPQIMlS7NHcR6Jmjz9pe4cu4D3B6t_JzAs_zFHXlbg>
    <xmx:EVACZgzk8iMyCUJn2XlB2cwWZnF3pgw2zrXhxFgAFxsfCor3l7yb4A>
    <xmx:ElACZrf9UXW5o6B7lug2NVk4d3lvchLaArWvU7KUl69nHzrVjwb0VgCeDAc>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 00:33:19 -0400 (EDT)
Date: Tue, 26 Mar 2024 13:33:17 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] ALSA: firewire-lib: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <20240326043317.GA125304@workstation.local>
Mail-Followup-To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZgIsBqoMb7p3fMDr@neat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgIsBqoMb7p3fMDr@neat>
Message-ID-Hash: 27WFKMFQEP63EKNFBEZPLEUBYFBFBINX
X-Message-ID-Hash: 27WFKMFQEP63EKNFBEZPLEUBYFBFBINX
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27WFKMFQEP63EKNFBEZPLEUBYFBFBINX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Mon, Mar 25, 2024 at 07:59:34PM -0600, Gustavo A. R. Silva wrote:
> Use the `DEFINE_FLEX()` helper for an on-stack definition of a
> flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> sound/firewire/amdtp-stream.c:1184:46: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Link: https://github.com/KSPP/linux/issues/202
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> Changes in v2:
>  - Use DEFINE_FLEX() helper instead of a new tagged struct.
> 
> v1:
>  - Link: https://lore.kernel.org/linux-hardening/d3a764eb76909b16b8a22d9ff530e5edf0e59e6b.1709658886.git.gustavoars@kernel.org/
> 
>  sound/firewire/amdtp-stream.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

It looks good to me.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

I remark that the change requires a commit d8e45f2929b9 "overflow: Change
DEFINE_FLEX to take __counted_by member"), added to v6.9-rc1.


Thanks

Takashi Sakamoto
