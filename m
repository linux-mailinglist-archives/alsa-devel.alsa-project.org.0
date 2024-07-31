Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8A59431CD
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 16:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4C62DA0;
	Wed, 31 Jul 2024 16:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4C62DA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722435321;
	bh=ogBT7l0i4QVNkp9oJgjPiFWGf4JLwRpgrdPNtDsOemw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GUlximdZ5kGua8Y7LqcU3kFyX+M1xXUOcTFMm86V7KrakX7H+v25XqBmbdiC4d7kv
	 vycWK/u3g3HlmZl6Y7x7z6vbIfWm8OfXjCDSG/2VD8vwXZAiqwuXQ8sOJ0Qh0bH6Nt
	 C/oXe7hMogjE3hPGPSupSRiQ9eSSQXpuNF/Cm7gQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 698CDF805B2; Wed, 31 Jul 2024 16:14:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87514F805E2;
	Wed, 31 Jul 2024 16:14:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF56DF802DB; Wed, 31 Jul 2024 16:08:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from legeek.net (unknown
 [IPv6:2a01:e0a:d77:fcd0:ba27:ebff:fe50:cb42])
	by alsa1.perex.cz (Postfix) with ESMTP id 1113DF8007E
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 16:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1113DF8007E
Date: Wed, 31 Jul 2024 14:06:03 +0000
From: Sylvain BERTRAND <sylvain.bertrand@legeek.net>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH][LINUX][ALSA][USB AUDIO CLASS 1] wrong channel ids for
 surround
Message-ID: <ZqpEyxz+vgLLDEMI@freedom>
References: <ZqIyJD8lhd8hFhlC@freedom>
 <87h6c5zzch.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h6c5zzch.wl-tiwai@suse.de>
X-MailFrom: sylvain.bertrand@legeek.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K6C25GFR4B47PZUQKGDJGIPQVTRLJM2O
X-Message-ID-Hash: K6C25GFR4B47PZUQKGDJGIPQVTRLJM2O
X-Mailman-Approved-At: Wed, 31 Jul 2024 14:14:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6C25GFR4B47PZUQKGDJGIPQVTRLJM2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 31, 2024 at 11:26:38AM +0200, Takashi Iwai wrote:
> Could you submit a properly formatted patch (with a patch description
> and your Signed-off-by tag) to linux-sound ML
> (linux-sound@vger.kernel.org) instead?

Hi,

I tried to send that patch to the lkml, but some admins removed grey listing
and I use a domestic smtp server (with DNS SPF though), then I was blocked.

(I don't use only noscript/basic (x)html browsers, then "Big Tech" email
services are not available for me)

(I have a github account, and github is still working with noscript/basic
(x)html... as for now... then I did report an issue there)

If you have time and accept to do it, I don't mind you or somebody else doing
that on my behalf. What matters is this being fixed I guess.

best regards,

-- 
Sylvain

