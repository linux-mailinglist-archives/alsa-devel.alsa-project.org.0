Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9983168B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 11:17:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84DB020E;
	Thu, 18 Jan 2024 11:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84DB020E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705573047;
	bh=JMbYM00ktv6N3fMPqoMMx6o808pPwvTODFKljmaBcEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WbEiJHZ3xJlebV2aLStXOayYpa2Mbn2u5aSxxSuAREmBlcu0omlHXLZOps5TtMFgn
	 Ybw0TR+9krXNKgTke2HGqQnmglw9AEFnO8h7XiwduR3XZSR15thQOVJqDzbeeItmwc
	 Ds0e2hozCV4GaJH1AKcpPQhvNXRL9HU7EdzPC7Ik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6305BF804F1; Thu, 18 Jan 2024 11:16:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 755F7F80548;
	Thu, 18 Jan 2024 11:16:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4B6EF801F5; Thu, 18 Jan 2024 11:16:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2379F80074
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 11:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2379F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=BweA1x00
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6B4260B8B;
	Thu, 18 Jan 2024 10:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24747C433F1;
	Thu, 18 Jan 2024 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705572994;
	bh=JMbYM00ktv6N3fMPqoMMx6o808pPwvTODFKljmaBcEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BweA1x002vL10adzB9oGUI6jXdiHopouRWLjoTW3rQ24TZPDD+LD5KZhl9pDBb9Xi
	 x/Z2tbfG3ke4KNsm5Te20bUeiLL0NEtWkXPHA8/2VFNZjDMqlSOQec3C6rvqtL6SY0
	 3i/2KLm3F+Se8BGJAVhUTR1peAthVc8r0n9GLm2Q=
Date: Thu, 18 Jan 2024 11:16:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, kernelci-results@groups.io,
	bot@kernelci.org, stable@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: kernelci/kernelci.org bisection:
 baseline-nfs.bootrr.deferred-probe-empty on at91sam9g20ek
Message-ID: <2024011816-overstate-move-4df8@gregkh>
References: <65a6ca18.170a0220.9f7f3.fa9a@mx.google.com>
 <845b3053-d47b-4717-9665-79b120da133b@sirena.org.uk>
 <2024011716-undocked-external-9eae@gregkh>
 <82cda3d4-2e46-4690-8317-855ca80fd013@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82cda3d4-2e46-4690-8317-855ca80fd013@sirena.org.uk>
Message-ID-Hash: WZQ7ODMOIXYONR4NWHWTBBZ3B3RFHXWG
X-Message-ID-Hash: WZQ7ODMOIXYONR4NWHWTBBZ3B3RFHXWG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZQ7ODMOIXYONR4NWHWTBBZ3B3RFHXWG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 17, 2024 at 01:52:59PM +0000, Mark Brown wrote:
> On Wed, Jan 17, 2024 at 06:55:09AM +0100, Greg Kroah-Hartman wrote:
> 
> > This is also in the following kernel releases:
> > 	4.19.240 5.4.191 5.10.113
> > do they also have issues?  Does 6.1 and newer work properly?
> 
> Current kernels work well, I've not had reports generated for the older
> kernels but it's possible they may be forthcoming (the bisection does
> tend to send issues slowly sometimes).
> 
> > And wow, this is old, nice to see it reported, but for a commit that
> > landed in April, 2022?  Does that mean that no one uses this hardware?
> 
> I suspect it's just me, it's in my test lab.  I don't routinely test
> stable (just let KernelCI use it to test stable).
> 
> > I'll be glad to revert, but should I also revert for 4.19.y and 5.4.y
> > and 5.10.y?
> 
> I'd be tempted to, though it's possible it's some other related issue so
> it might be safest to hold off until there's an explicit report.  Up to
> you.

I'll just drop it from 5.15.y for now, thanks!

greg k-h
