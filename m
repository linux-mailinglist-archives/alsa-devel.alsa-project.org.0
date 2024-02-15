Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC011855BD8
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Feb 2024 08:52:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC6EDB71;
	Thu, 15 Feb 2024 08:52:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC6EDB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707983543;
	bh=gahLnnsNTqmUik4SdEeXvaqgZ4vCmG45RsllVXdj/mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k9Jt1VPFt2zp7U/Hj7URI8iMrDEgPQMbINMfNJqOHvAgJbf1WaOJapQ+KVOTvhMgG
	 obJPSehncpo55FZr4rgykQprAZOOvZeV9VMSKvaQWNs3LsSfS+pJWubh6zzoaQCWBa
	 KQJmGpbJH50jAVipPfcslROCcpsituFC8cpsiJVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 274E6F805A1; Thu, 15 Feb 2024 08:51:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FE48F80567;
	Thu, 15 Feb 2024 08:51:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF07FF8025A; Thu, 15 Feb 2024 08:49:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D60DF800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Feb 2024 08:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D60DF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=qajf8PZ6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94A6361C55;
	Thu, 15 Feb 2024 07:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6981C433C7;
	Thu, 15 Feb 2024 07:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707983332;
	bh=gahLnnsNTqmUik4SdEeXvaqgZ4vCmG45RsllVXdj/mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qajf8PZ65kKGyotnqyIUZ3vlSkpstKVFTdqCpNtt11yZc3WQx0TBIeEixG38eBjtF
	 dQqDmJTsG/G5wsnuGVF8KapV2qoQO5WOO8TzkkTkg7Dn5t3dStmcx0CXS5nF0PGms9
	 s3OFz8TRzd2nuSJQYkDvFpQtkCeofc/Pulf3+EIQ=
Date: Thu, 15 Feb 2024 08:48:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: struct bus_type cleanup
Message-ID: <2024021539-boxcar-shown-c829@gregkh>
References: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
Message-ID-Hash: SOBZJ2XKZSOEPVMUALUJHDXNYQ7FFXHX
X-Message-ID-Hash: SOBZJ2XKZSOEPVMUALUJHDXNYQ7FFXHX
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOBZJ2XKZSOEPVMUALUJHDXNYQ7FFXHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 14, 2024 at 04:28:27PM -0300, Ricardo B. Marliere wrote:
> This series is part of an effort to cleanup the users of the driver
> core, as can be seen in many recent patches authored by Greg across the
> tree (e.g. [1]).
> 
> ---
> [1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22
> 
> To: Johannes Berg <johannes@sipsolutions.net>
> To: Jaroslav Kysela <perex@perex.cz>
> To: Takashi Iwai <tiwai@suse.com>
> Cc:  <linuxppc-dev@lists.ozlabs.org>
> Cc:  <alsa-devel@alsa-project.org>
> Cc:  <linux-sound@vger.kernel.org>
> Cc:  <linux-kernel@vger.kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
