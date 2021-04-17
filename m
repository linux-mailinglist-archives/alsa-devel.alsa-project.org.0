Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9DC36328B
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Apr 2021 00:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 740A41684;
	Sun, 18 Apr 2021 00:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 740A41684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618698588;
	bh=W6+W3wxgu/BXY69DJuNh4unzPsGoGJMLvSWGEZQvsKU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pAWZnSTytX6+8+nkmShhYs4l8WzeroU/Zi8jm/ObI9OyevR5vEGru/XOW2BzDVHqI
	 YAQ4jCzmZ20XuIXFs8VDA4fmig0k4Pf1HSNFcinhkpQbJbjQqCW9DI7fVQwBMoU5Kg
	 2MCbPZchEhLV3/aPTSTnSC2JeN/jDgVldzVFRSvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2CCFF8022D;
	Sun, 18 Apr 2021 00:28:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 122E5F8022B; Sun, 18 Apr 2021 00:28:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F182F80128
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 00:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F182F80128
Received: from hellmouth.base.nu (localhost [127.0.0.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id cf230e2b;
 Sat, 17 Apr 2021 22:28:09 +0000 (UTC)
Received: from base.nu ([88.97.23.37]) by hellmouth.base.nu with ESMTPSA
 id WDovOfhge2AqMwEADaPQrA
 (envelope-from <livvy@base.nu>); Sat, 17 Apr 2021 22:28:08 +0000
Date: Sat, 17 Apr 2021 23:26:30 +0100
From: Olivia Mackintosh <livvy@base.nu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] Pioneer devices: engage implicit feedback sync for
 playback
Message-ID: <20210417222630.dpqju7bowvks5nnq@base.nu>
References: <CAEsQvcs9LcciAYjoB64Kt_VaSww4EAW4-qN0ED5jDA0GeeTtDg@mail.gmail.com>
 <20210409110745.kbr5z2jinsaur2ac@base.nu>
 <s5ha6pygqfz.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5ha6pygqfz.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, geraldogabriel@gmail.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> Which kernel version have you tested?  There have been quite a few
> development about USB-audio recently, so something might be missing or
> conflicting?  Let's see.

I have just tested d86f43b17ed4cd751f73d890ea63f818ffa5ef3d with and
without the patch:

  - Without the patch, everything works fine.
  - With the patch, speaker-test times out. I'll try to collect some more
    infomation from dyndb and try to have a look to see what the problem
    is.

There's no obvious mistakes in the patch as far as I can tell.

Olivia
