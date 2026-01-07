Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90ECFE589
	for <lists+alsa-devel@lfdr.de>; Wed, 07 Jan 2026 15:41:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94ADE601F5;
	Wed,  7 Jan 2026 15:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94ADE601F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767796894;
	bh=Q75PUVfRtuY8QWTxv6BMBpiw7g7hOg3wxodzSzfH9tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CBe7wCPKVVzXZe8HCB77RVCFK7/JAlU7JFulblrgDvARSYUhJPMBS+fsGRgqrjovr
	 ZmUoYf5nepeiQXhJnOE8eYSTlb4WW0T5E5roLIfMfAUMMdIlW16Pk5Ojv88mGtQptS
	 Za6Kv3z6j/Km+8tjJOlzGCBXqNL9sH112TLUCUGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F5C4F805D5; Wed,  7 Jan 2026 15:40:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 583E8F805D5;
	Wed,  7 Jan 2026 15:40:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2569F80448; Wed,  7 Jan 2026 15:39:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E8FCF80088
	for <alsa-devel@alsa-project.org>; Wed,  7 Jan 2026 15:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E8FCF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LvB+4JhK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF5AA6001A;
	Wed,  7 Jan 2026 14:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77913C4CEF7;
	Wed,  7 Jan 2026 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767796795;
	bh=Q75PUVfRtuY8QWTxv6BMBpiw7g7hOg3wxodzSzfH9tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LvB+4JhKbda4mmj0X3qM85nhPeACCBo00ZgxyMhayuSlC0L0OS7D9mSimB8nX5BeX
	 8WuokuV9MKk1J4NrOnxQcRJWsH5d8aGN2b+fXmBuva8SsAjAtsbCFJWNLzLlK8NJAw
	 fiIy5fa9X3gXTqmXtgarkOrjpugV3CeNN6QoWaC196EHcQtyBmeAHXgLMPiDU7GFcE
	 oHXjrt+iyi1LwU0dT5bd+Rx2oOvaN8sLMkyeKfuyzdIHLtRoUgrfOg8ZHe3k0IoqV1
	 m5bCtTgZk3Y1WRXqeu5YyFdWdXo7L7kf5U4kjSbl8lh5b2BEEiB7WqZtoFAKnS4Bjk
	 bYnvf1urtFHZw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vdUhM-000000000ym-15Vg;
	Wed, 07 Jan 2026 15:39:44 +0100
Date: Wed, 7 Jan 2026 15:39:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Simone Flavio Paris <simone.flavio.paris@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [BUG REPORT] arm64: dts: qcom: x1e80100: Audio routing issues on
 ThinkPad T14s Gen 6
Message-ID: <aV5wMKBZMIESIMbC@hovoldconsulting.com>
References: 
 <CAG=QoF1cr3cFzgjRicLSr7KbwygQaHju1WKE_LK_U9Qmsgv13g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAG=QoF1cr3cFzgjRicLSr7KbwygQaHju1WKE_LK_U9Qmsgv13g@mail.gmail.com>
Message-ID-Hash: LR74OKG4XXCJX6WMG3DHAX7VAW4DSU7C
X-Message-ID-Hash: LR74OKG4XXCJX6WMG3DHAX7VAW4DSU7C
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LR74OKG4XXCJX6WMG3DHAX7VAW4DSU7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 07, 2026 at 03:09:10PM +0100, Simone Flavio Paris wrote:

> I am testing the latest experimental kernels on the Lenovo ThinkPad
> T14s Gen 6 (Snapdragon X Elite).
> 
> I have encountered a specific issue with the audio subsystem: while
> the DSP and ALSA stack appear fully functional (firmware loads,
> streams are processed without errors), there is no analog output on
> speakers or headphones.
> 
> I have performed extensive diagnostics and manual mixer path
> configurations to rule out userspace/UCM issues. Below is a detailed
> technical report of the current status, routing attempts, and logs.
> 
> I hope this information helps in refining the machine driver or
> topology profiles for this specific device. I am available to test
> patches if needed.
> 
> [Technical Report]
> 
> Target Hardware: Lenovo ThinkPad T14s Gen 6 (21N1) - Snapdragon X
> Elite (X1E80100)
> OS: Ubuntu 25.10 (Debian-based)
> Kernel: 6.17.0-8-generic #8-Ubuntu SMP PREEMPT_DYNAMIC aarch64

You need to report this to your distro as this is not a mainline issue.

IIUC, Ubuntu disables audio by default until you pass a kernel parameter
due to the lack of speaker protection.

Johan
