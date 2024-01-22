Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E97836E22
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 18:46:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2FC485D;
	Mon, 22 Jan 2024 18:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2FC485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705945590;
	bh=edDM7lfGqltMa9Izn2Q7exVxd+SiKBQ341jD5qmdL2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g5zOX4mnvGQMuHo9h+NSMG7qD01X4wyWui4dG1jiXG5dLvsGQmLQcN4E2oQgHAAv2
	 OZ9I8zkBuz5xesN2XMKUcQTg8FYTX5VQkC3UL7Ph7YVCInmUD+yCmNAHraTtBz+uYa
	 kLL6C0xIutQd+BJ94rmx68KQPVJlfg9pC4u/U5pQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18A9CF8022B; Mon, 22 Jan 2024 18:45:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B0E9F802E8;
	Mon, 22 Jan 2024 18:45:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7047DF8025F; Mon, 22 Jan 2024 18:45:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25007F8020D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 18:45:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25007F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ZvAomMzF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CEDB4B80C63;
	Mon, 22 Jan 2024 17:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155C4C433C7;
	Mon, 22 Jan 2024 17:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705945544;
	bh=edDM7lfGqltMa9Izn2Q7exVxd+SiKBQ341jD5qmdL2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvAomMzFpKuOuUs2LXelYpPMpmhUNaJprpgmh/DPwRn3eydJiDrfRrXbwvYv/n0FJ
	 bG6Lnxl7gJ7qTlODFEIwNTKSwcmk+ihyPoqfEjPF1Sd4f2d3Hlw6FtG9EH+4cfiW9e
	 HYVrTe1SW5Bj5i1UoxtAB8up5RrFNNvRy+gWLHNo=
Date: Mon, 22 Jan 2024 09:45:43 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, kernelci-results@groups.io,
	bot@kernelci.org, stable@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: kernelci/kernelci.org bisection:
 baseline-nfs.bootrr.deferred-probe-empty on at91sam9g20ek
Message-ID: <2024012226-probably-politely-0343@gregkh>
References: <65a6ca18.170a0220.9f7f3.fa9a@mx.google.com>
 <845b3053-d47b-4717-9665-79b120da133b@sirena.org.uk>
 <2024011716-undocked-external-9eae@gregkh>
 <82cda3d4-2e46-4690-8317-855ca80fd013@sirena.org.uk>
 <2024011816-overstate-move-4df8@gregkh>
 <3c7cf19d-cd94-4d94-b4f5-1e0946fd0963@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c7cf19d-cd94-4d94-b4f5-1e0946fd0963@sirena.org.uk>
Message-ID-Hash: BOL74SWPTQJIGWPN2WBHWLRHE73SIREY
X-Message-ID-Hash: BOL74SWPTQJIGWPN2WBHWLRHE73SIREY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOL74SWPTQJIGWPN2WBHWLRHE73SIREY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 18, 2024 at 02:33:17PM +0000, Mark Brown wrote:
> On Thu, Jan 18, 2024 at 11:16:29AM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Jan 17, 2024 at 01:52:59PM +0000, Mark Brown wrote:
> 
> > > > I'll be glad to revert, but should I also revert for 4.19.y and 5.4.y
> > > > and 5.10.y?
> 
> > > I'd be tempted to, though it's possible it's some other related issue so
> > > it might be safest to hold off until there's an explicit report.  Up to
> > > you.
> 
> > I'll just drop it from 5.15.y for now, thanks!
> 
> Thanks.  I've actually just seen that it's also failing on v4.19, and
> went looking and found that v5.4 and v5.10 look like they never passed
> which means it didn't trigger as a report there.

Now queued up the revert for the other branches as well, thanks.

greg k-h
