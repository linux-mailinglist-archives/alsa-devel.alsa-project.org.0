Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A308225DF
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 01:18:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23606E7F;
	Wed,  3 Jan 2024 01:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23606E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704241086;
	bh=5ce/TzGIrkmraBAItY2GelPvo+xOgoy8S+0UvHP5qhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m1j2XCytwFlNg3d3fagjvmVGOSmWZJM93v8IPQClof2evVBQa5Wrt0IKSZ6hVuCL+
	 XNheZPe9CVO/vp8hxsqicGoMcZ/ANUYpwBEby8+Gyr9cPJ8PWxxkjbooEFXVw5HWh3
	 9p8D7LHxbiM4MhDkaG9iOK3FwRUPdpap92N7tWJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3D3AF80424; Wed,  3 Jan 2024 01:17:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D1A2F8057A;
	Wed,  3 Jan 2024 01:17:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05739F80551; Wed,  3 Jan 2024 01:17:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 759BDF80022
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 01:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 759BDF80022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=merlins.org
	; s=key; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jEUidlbRkh+sRXZoW4h6WobGnL5gbYzACItvfn2hM+U=; b=g7KAkPF0qoG7mLFbqBmO2qi8CY
	XpyiPHFPcaiIiXMIViLFIM+WNYJHmwua303AS7aMg1KHF4DMdYXD6xESS3N4ATwfEPu1PRnZj6+fN
	SnM4ymPxRALtu1lCSvsW6fgA8xCvv7GudddxcUDqp7vr4quYnB60M+Tgeo5FBGOmTQg7woxqDsRy7
	sDy0DM3Wf4lKYEo67R6NrCY5EtIdoZQXJswZ636VHtt5OqUHmyWQtwA6dTq/SnMZf0vKuQo7Yy4LM
	PTpFe6T5h2ses5bisb3e0rXOWUG7m6/zhDvxbPh70CXCaNXZHiqFZMI83l3ppVfpf4ORZ2Vuo0XXz
	pTXkFU0A==;
Received: from lfbn-idf3-1-20-89.w81-249.abo.wanadoo.fr ([81.249.147.89]:54622
 helo=sauron.svh.merlins.org)
	by mail1.merlins.org with esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim
 4.94.2 #2)
	id 1rKmFY-00062a-7h by authid <merlins.org> with srv_auth_plain;
 Tue, 02 Jan 2024 13:24:36 -0800
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.96)
	(envelope-from <marc@merlins.org>)
	id 1rKmFW-0063xS-18;
	Tue, 02 Jan 2024 13:24:34 -0800
Date: Tue, 2 Jan 2024 13:24:34 -0800
From: Marc MERLIN <marc@merlins.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: sof-audio-pci-intel-tgl/soundwire 6.6.8 kernel outputs no sound
 on speakers but works on headphones => missing alsa-ucm-conf
Message-ID: <ZZR_Et3vvv-bmQ0H@merlins.org>
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
Message-ID-Hash: ESPP5NCMOPZRZX2BC2UNNE25V4OL46TC
X-Message-ID-Hash: ESPP5NCMOPZRZX2BC2UNNE25V4OL46TC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESPP5NCMOPZRZX2BC2UNNE25V4OL46TC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 02, 2024 at 10:03:29AM -0800, Marc MERLIN wrote:
> 1) for sure, debian package alsa-ucm-conf should be required, not
> recommended. It's not big, people who can't keep track of everything
> that changes all the time, have no idea that they need it, and really
> need it installed by default if their hardware requires it.
> I've filed a couple of bugs with them, including on the package
> description that gives little clue that the package can be so essential

Done:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1059871
alsa-ucm-conf should be a required package by libasound2-data, it's essential on some sound hardware

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1059872
alsa-ucm-conf should be a required package, it's essential on some sound hardware

Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
