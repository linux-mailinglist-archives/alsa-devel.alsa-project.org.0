Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F26629796CE
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Sep 2024 15:24:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09D59E72;
	Sun, 15 Sep 2024 15:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09D59E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726406671;
	bh=errKGCtfl+LxTRb3ZVsaTPvbepT+cXQro3oA5WbinyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WhJYBv6wrSn76pF2xARORuS7H2u9NvAT1H1uwixk9TwWYY/c6EPhrk6nA5IHpCdhC
	 e93O3RotuxQE8imdMKO5hA+XtmQTGfjCcPOawfA0R94bPcDy80U6t2VDPVHlm43qgx
	 vo7uQZdl7fk7mjL5uJVgs1KtPpamKOM4GSI+Kbjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DEFEF805BA; Sun, 15 Sep 2024 15:23:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24366F805B0;
	Sun, 15 Sep 2024 15:23:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2771F8020D; Sun, 15 Sep 2024 15:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC572F80074
	for <alsa-devel@alsa-project.org>; Sun, 15 Sep 2024 15:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC572F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ulfe+ng1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96D065C5440;
	Sun, 15 Sep 2024 13:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54185C4CEC3;
	Sun, 15 Sep 2024 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726406629;
	bh=errKGCtfl+LxTRb3ZVsaTPvbepT+cXQro3oA5WbinyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulfe+ng10PVo28zS1mPF+MCYhNocOIbmpT5ZL5/HqEeGF92dOVsr7itz4iz3OPfkc
	 AmKkpalgXM27a+EwtSeu38FUfrI7+IuvB7mvkoUXhZYFe+v2l8OXNAZqCtQqgNyjYw
	 r205TCEAVT+Fo6eWSSSVfCJS/eiy/bOKPjzLs1IA=
Date: Sun, 15 Sep 2024 15:23:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	krzysztof.kozlowski@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH stable-6.10 regression] Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
Message-ID: <2024091555-untitled-bunkbed-8151@gregkh>
References: <20240910124009.10183-1-peter.ujfalusi@linux.intel.com>
 <febaa630-7bf4-4bb8-8bcf-a185f1b2ed65@linux.intel.com>
 <2024091130-detail-remix-34f7@gregkh>
 <ZuQnPnRsXaUEBv6X@vaman>
 <ZuXgzRSPx7hN6ASO@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuXgzRSPx7hN6ASO@vaman>
Message-ID-Hash: 3I776ELFX2GFAIFB7WFJV3K5W6FZXUBE
X-Message-ID-Hash: 3I776ELFX2GFAIFB7WFJV3K5W6FZXUBE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3I776ELFX2GFAIFB7WFJV3K5W6FZXUBE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Sep 15, 2024 at 12:45:25AM +0530, Vinod Koul wrote:
> On 13-09-24, 17:21, Vinod Koul wrote:
> > On 11-09-24, 14:31, Greg KH wrote:
> > > On Tue, Sep 10, 2024 at 04:02:29PM +0300, Péter Ujfalusi wrote:
> > > > Hi,
> > > > 
> > > > On 10/09/2024 15:40, Peter Ujfalusi wrote:
> > > > > The prop->src_dpn_prop and prop.sink_dpn_prop is allocated for the _number_
> > > > > of ports and it is forced as 0 index based.
> > > > > 
> > > > > The original code was correct while the change to walk the bits and use
> > > > > their position as index into the arrays is not correct.
> > > > > 
> > > > > For exmple we can have the prop.source_ports=0x2, which means we have one
> > > > > port, but the prop.src_dpn_prop[1] is accessing outside of the allocated
> > > > > memory.
> > > > > 
> > > > > This reverts commit 6fa78e9c41471fe43052cd6feba6eae1b0277ae3.
> > > > 
> > > > I just noticed that Krzysztof already sent the revert patch but it is
> > > > not picked up for stable-6.10.y
> > > > 
> > > > https://lore.kernel.org/lkml/20240909164746.136629-1-krzysztof.kozlowski@linaro.org/
> > > 
> > > Is this in Linus's tree yet?  That's what we are waiting for.
> > 
> > Yes I was waiting for that as well, the pull request has been sent to
> > Linus, this should be in his tree, hopefully tomorow..
> 
> It is in Linus's tree now. Greg would you like to drop commit
> 6fa78e9c41471fe43052cd6feba6eae1b0277ae3 or carry it and the
> revert...?

I can not "drop" a commit that is already in a realease for obvious
reasons :(

> What is the usual process for you to handle reverts?

We just take them like normal.  What is the git id of the revert in
Linus's tree?

thanks,

greg k-h
