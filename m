Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8C67CFFA0
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 18:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B2A69F6;
	Thu, 19 Oct 2023 18:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B2A69F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697733032;
	bh=6ZrzZbm/x8LD3u+efs0HMDQoU4nWuI8QQk+2TxyKbWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W5w2zOrO2Gmxt/E1QgpXHrhwpQ1640/w8YJRwmKV5cKoQxJZyzAb2L/bs9a77pD1U
	 YDMU3nGt77EVbZ7dHtKx4Zvcqx1SVld6dAl+lK9sY5T9qZ16T0mHOisgY6tmf7gJ3F
	 WBuXY4bj7tFtRvSzzQMUO73yA9u+VQ1cD9h3fRRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE38F8057A; Thu, 19 Oct 2023 18:28:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C37E1F80571;
	Thu, 19 Oct 2023 18:28:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA500F8025F; Thu, 19 Oct 2023 18:25:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E25AF8019B
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 18:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E25AF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=rvJDA5dW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 790E261A05;
	Thu, 19 Oct 2023 16:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3009C433C7;
	Thu, 19 Oct 2023 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697732729;
	bh=6ZrzZbm/x8LD3u+efs0HMDQoU4nWuI8QQk+2TxyKbWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rvJDA5dWYhzwJpCvDC0MyyRki6d9KriNJU4H35fncMFasX3Efj2/PD/U5nwJZVr2J
	 5M2wfWK8x8Pm0vznldydlvAFjVZfvRGTTBzwOIVKHda3z5pi06qnqIE78+ry0Ddz1Q
	 m6t/b6M2o3C5S/HZLFX4+9GXDjENZwXuP0uURjZo=
Date: Thu, 19 Oct 2023 12:25:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: Re: Migrating this list to a different platform (take 2)
Message-ID: <20231019-extinct-importer-8e3fce@meerkat>
References: <20231017-coroner-blurt-edffe8@meerkat>
 <8f62db8c-b10c-0256-a56c-28b998d1a3bc@perex.cz>
 <20231019-posture-cache-fe060b@meerkat>
 <9879e427-5dd0-43ee-bacb-0b0b452ea348@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9879e427-5dd0-43ee-bacb-0b0b452ea348@sirena.org.uk>
X-MailFrom: konstantin@linuxfoundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: F2XWN3HG3WXHAEPAAZPNBHYO2MIY6WXZ
X-Message-ID-Hash: F2XWN3HG3WXHAEPAAZPNBHYO2MIY6WXZ
X-Mailman-Approved-At: Thu, 19 Oct 2023 16:28:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F2XWN3HG3WXHAEPAAZPNBHYO2MIY6WXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Oct 19, 2023 at 03:34:18PM +0100, Mark Brown wrote:
> > There's a third option -- instead of migrating the alsa-devel list, we can
> > migrate all activity to linux-sound@vger.kernel.org. It's an existing list
> > that currently sees about 5 messages a year (and most of them are cc'd to
> > alsa-devel anyway).
> 
> That would definitely work well from my point of view.

Okay, since it doesn't really affect anything, I've reconfigured the patchwork
side of things to accept patches sent both to alsa-devel and linux-sound. If
you do want to go down the route of shifting everything towards linux-sound,
the next step (once everyone is in agreement), is to make the changes to
MAINTAINERS. You don't have to do all subsystems at once, you can start with
the SOUND subsystem to trial things out and then shift others if everything is
working correctly.

-K
