Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D746D8225E1
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 01:18:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21AA6E80;
	Wed,  3 Jan 2024 01:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21AA6E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704241128;
	bh=efdJFlETYM8xBfRNxAM0GMfcmYsMPdTJKlr1/nMn8FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qwY3hFg9HRnY683B0orSo0TRBYXMXAeaCuZYGXp8xfY0Ndpde2jZj/SJclD0WEmx1
	 xreaJiCJhSqWfi5Q6GK1PZ6eQgoJP/jl//Cs6+xsPWNZdQL02uEtsrIoYZaGov2KZq
	 TcNMdUwUbwMLw36HQYYgMycB9lNql5xClQzZBTnA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CD58F805BF; Wed,  3 Jan 2024 01:18:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8F74F805C4;
	Wed,  3 Jan 2024 01:18:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3161F80551; Wed,  3 Jan 2024 01:17:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C63AF80533
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 01:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C63AF80533
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=merlins.org
	; s=key; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FOkFG3JsQO68vefg2PdTIP5MphkMJlbl6dquQ/8fPr4=; b=U8YF6nH4qKNdYQfs4dkCcZqT2A
	BJAnyDcBFHPYpA9PtnSRnf94RJZLBZ6hNjuf3cToFBMyRfLLemFGVqrCpZUrvk17409lU+2rAmUZl
	x+dEGbN9yOuBI7HQwckj/ZL7K39+U2aO4Y4olW2ioVZibvLkIXPMdGUleRDm+xnV+bIuXPBYFa9Xq
	hgZexS241MTCaPvskDp9rE1yxcYARdGQ3pSFuPOLrzy4uAg5jOQtf9Qie2XXakkKXhct6+dcTSpf0
	uA8hGYEF9MlFzDjQDTnSNUP+4Zftrc/SDdZ4uk8/POCEjVMxKkfNdgP1P2R2ggAvUuqns0CvcRIf3
	u0waflwA==;
Received: from lfbn-idf3-1-20-89.w81-249.abo.wanadoo.fr ([81.249.147.89]:59766
 helo=sauron.svh.merlins.org)
	by mail1.merlins.org with esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim
 4.94.2 #2)
	id 1rKkDh-0003nt-BH by authid <merlins.org> with srv_auth_plain;
 Tue, 02 Jan 2024 11:14:33 -0800
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.96)
	(envelope-from <marc@merlins.org>)
	id 1rKkDf-005z1P-2b;
	Tue, 02 Jan 2024 11:14:31 -0800
Date: Tue, 2 Jan 2024 11:14:31 -0800
From: Marc MERLIN <marc@merlins.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: sof-audio-pci-intel-tgl/soundwire 6.6.8 kernel outputs no sound
 on speakers but works on headphones => missing alsa-ucm-conf
Message-ID: <ZZRgl9HOLHEnSTmR@merlins.org>
References: <20231223234430.GA11359@merlins.org>
 <alpine.DEB.2.22.394.2401021117370.14041@eliteleevi.tm.intel.com>
 <ZZRP8RqT83cE-S5m@merlins.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZRP8RqT83cE-S5m@merlins.org>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 81.249.147.89
X-SA-Exim-Mail-From: marc@merlins.org
Message-ID-Hash: MWH7NWJZU345RBZDDBCHMQCBQ7ZRKSHT
X-Message-ID-Hash: MWH7NWJZU345RBZDDBCHMQCBQ7ZRKSHT
X-MailFrom: marc@merlins.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWH7NWJZU345RBZDDBCHMQCBQ7ZRKSHT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 02, 2024 at 10:03:29AM -0800, Marc MERLIN wrote:
> First, a big thanks for the quick reply and help.
> For the benefit of archives and the next potential person looking for
> this, my debian system was lacking 
> alsa-ucm-conf
> which for this soundcare is not optional at all. 

For debian users, the other problem is that a lot of firmware is missing
0000:00:1f.3: Direct firmware load for intel/sof-tplg/sof-hda-generic-2ch.tplg failed with error -2
0000:00:1f.3: error: tplg request firmware intel/sof-tplg/sof-hda-generic-2ch.tplg failed err: -2
0000:00:1f.3: you may need to download the firmware from https://github.com/thesofproject/sof-bin/

merlin:~# aptitude search '?broken-reverse-recommends(?installed)' > /tmp/missing
merlin:~# grep firmware /tmp/missing
p  firmware-ath9k-htc - firmware for AR7010 and AR9271 USB wireless adapters
p  fwupd-amd64-signed - Tools to manage UEFI firmware updates (signed)
merlin:~# grep sof /tmp/missing
merlin:~#

This means there are no relevant packages with 'sof' or 'firmware' that
were recommended, and I had to find this:

merlin:~# apt-get install -t unstable firmware-sof-signed

That package was also missing and not suggested by any package is seems,
but it was easier to find thanks to kernel dmesg. That said I had to
look in ubuntu to see what package those files came from as the package
was installed in that test ubuntu image I used and missing from my
debian12

You know this, I'm sure just adding it to the thread for google indexing.

Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
