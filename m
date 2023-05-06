Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 928EA6F8FB5
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 09:12:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F94C2AA6;
	Sat,  6 May 2023 09:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F94C2AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683357174;
	bh=40PdCTLTcEJxLZ7g+1HtdAimxOwBFKF+OTi07ozBwGY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LF933slfzfGjW0u6RhmOc2+MDZeGsvOO6Are9ofTgYsUlQWmG9pSJLQ1Z+TvOLacc
	 6Ye6fH0Sk9+d58q6c/N5v7/80F7D5P5dEga9uXj64oY+64zWu7fJHdLLli6LBvgVYF
	 RsWmmYv3U12DodqkiO+eMbtC9r3mGCL/vgHOab08=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 335F5F80529;
	Sat,  6 May 2023 09:12:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44B28F8052D; Sat,  6 May 2023 09:12:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51FD2F80087
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 09:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51FD2F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=a2a01UoO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B62661803;
	Sat,  6 May 2023 07:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D72C433D2;
	Sat,  6 May 2023 07:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683357109;
	bh=40PdCTLTcEJxLZ7g+1HtdAimxOwBFKF+OTi07ozBwGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2a01UoOnYcEjso0sVHUS9d64nG7PFQsMi2IPddxb4cOYtdsEjPCU2EBC/qgce22n
	 r6+T2AcvTkiSyRyP9IdomDlDptQuCym400tub4KL0hrmND5Ik46aP1KTngmRCFas2w
	 LzzctOBHMHwwOyUBOrbY2eyRFlfpx1ijEeUsvmas=
Date: Sat, 6 May 2023 15:59:18 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: patch for 5.10.stable (sound/oss/dmasound)
Message-ID: <2023050658-reburial-magenta-8bce@gregkh>
References: <36efe6f3-009c-e849-f9d7-6a643edad8e0@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36efe6f3-009c-e849-f9d7-6a643edad8e0@infradead.org>
Message-ID-Hash: YWXHNXHO232DXFALCZEYDHRPPQTSMZ5K
X-Message-ID-Hash: YWXHNXHO232DXFALCZEYDHRPPQTSMZ5K
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable <stable@vger.kernel.org>, Sasha Levin <sashal@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWXHNXHO232DXFALCZEYDHRPPQTSMZ5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 05, 2023 at 10:40:13PM -0700, Randy Dunlap wrote:
> Please apply
> 
> commit 9dd7c46346ca
> Author: Randy Dunlap <rdunlap@infradead.org>
> Date:   Tue Apr 5 16:41:18 2022 -0700
> 
>     sound/oss/dmasound: fix build when drivers are mixed =y/=m
> 
> to the 5.10 stable tree. The kernel test robot <lkp@intel.com> reported a build
> error on 5.10.y and this patch fixes the build error.

Thanks, I've also added it to 5.15.y as you don't want to upgrade and
have a regression.

thanks,

greg k-h
