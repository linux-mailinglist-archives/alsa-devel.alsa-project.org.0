Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FADB3DE76B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 09:45:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C038E1706;
	Tue,  3 Aug 2021 09:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C038E1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627976752;
	bh=LCNzsD9EhK5VGfPRdZ4PxttswqiHh+zpIiUmwE8dAak=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ESXLXy0/t1shvCr5FWotcU5uhFoTNUdXS+OvL3jCVCLvfyQcylLDOc9Yv64MmcRAA
	 hRumeceZb65dzirPedWasNSScPszbeFuFBB44L79nOe+5/hfXU3fkZipDh0aF3irZc
	 xlN7s6QKV71f0Q4NW+UfZzImVFu0HSprXXIu2oIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32BE2F80082;
	Tue,  3 Aug 2021 09:45:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87B1AF8016D; Tue,  3 Aug 2021 09:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net
 [194.109.24.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B634F8016D
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 09:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B634F8016D
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud8.xs4all.net with ESMTPA
 id Ap6amSoLKXTlcAp6bmkGIh; Tue, 03 Aug 2021 09:44:53 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 1DB541626F6;
 Tue,  3 Aug 2021 09:44:52 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id Z6OIK6OGfcEP; Tue,  3 Aug 2021 09:44:51 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 65D0C1626C7;
 Tue,  3 Aug 2021 09:44:51 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id 5475516097B; Tue,  3 Aug 2021 09:44:51 +0200 (CEST)
Date: Tue, 3 Aug 2021 09:44:51 +0200
From: folkert <folkert@vanheusden.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: aconnect occasionally causes kernel oopses
Message-ID: <20210803074451.GY890690@belle.intranet.vanheusden.com>
References: <20210802061845.GQ890690@belle.intranet.vanheusden.com>
 <s5him0oz5zq.wl-tiwai@suse.de>
 <20210802091012.GR890690@belle.intranet.vanheusden.com>
 <s5hczqvyj8m.wl-tiwai@suse.de>
 <20210802152117.GT890690@belle.intranet.vanheusden.com>
 <s5h5ywnydlz.wl-tiwai@suse.de>
 <20210802195349.GV890690@belle.intranet.vanheusden.com>
 <s5h1r7bxbiv.wl-tiwai@suse.de>
 <20210803074050.GX890690@belle.intranet.vanheusden.com>
 <s5ho8afvuqg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5ho8afvuqg.wl-tiwai@suse.de>
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfPKtAdJY0Zkoqjq95eSKB19ysmIajR3c5L16rdhimi37MqNHxNkAT+yEHX6hM/ARXjRmg3Ak+1tZeR730eACeTclPKxZSg/USY9q9LYmWiho+EMmPZHF
 XSbmlY8Y4oKH+inrdAjzNsgYJikErcx8gEOm8yxTl5W6V5tmcXkR8hGx2y6SWWzaO5vzXHLH6y/wzQTJ2D0Yzr5LeL17MEgyXotK6mMYP/HaoNEzrUHKl7JA
 2F+ThF7RG8z/VPcU3XuJdw==
Cc: alsa-devel@alsa-project.org
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

> > To which kernel version should I apply it?
> > Because:
> > 
> > folkert@oensoens:~/linux-5.11.0$ patch -p1 < ~/alsa-patch.diff 
> > patching file sound/core/seq/seq_ports.c
> > patching file sound/core/seq/seq_ports.h
> > patching file sound/core/seq/seq_ports.c
> > Hunk #1 succeeded at 526 (offset 12 lines).
> > Hunk #2 succeeded at 538 (offset 12 lines).
> > Hunk #3 succeeded at 547 with fuzz 2 (offset 12 lines).
> > Hunk #4 FAILED at 602.
> > 1 out of 4 hunks FAILED -- saving rejects to file sound/core/seq/seq_ports.c.rej
> 
> Did you scratch the previous patch?  AFAIK, the latest patch should be
> applicable to 5.11 and older cleanly.

I did.
It also fails on 5.13.7.
