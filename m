Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9187FAF086
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 19:35:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6E451686;
	Tue, 10 Sep 2019 19:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6E451686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568136939;
	bh=pR4+xIXziZGxvz7umQQwEjTSJoNMJEfpbOvymIf3aj8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=SB8FnE0gSvrzAldbXQ9+2MNEsdKvLm5vOsiA39rIrcoIDgT34O/o7frg5xOHH5U4w
	 GS81q6VlI7TKnhZZSootq+98ZkYmBBfwjy9/HGz0MTe0w6EaRQvFNUFlYo8n8Tw8/r
	 +/XMq33+GegE9eT/gEWntpApVGOPMfaQ7qmD0rTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18021F80321;
	Tue, 10 Sep 2019 19:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02A07F80368; Tue, 10 Sep 2019 19:33:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from egnor-li.ofb.net (egnor-li.ofb.net [IPv6:2600:3c01:e000:283::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3147CF800C9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 19:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3147CF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ofb.net header.i=@ofb.net
 header.b="OTf82RgZ"
Received: from ofb.net (163.242.197.104.bc.googleusercontent.com
 [104.197.242.163])
 by egnor-li.ofb.net (Postfix) with ESMTP id 9C49C117FC6;
 Tue, 10 Sep 2019 17:33:46 +0000 (UTC)
Received: from localhost.localdomain
 (host86-142-59-18.range86-142.btcentralplus.com [86.142.59.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by ofb.net (Postfix) with ESMTPSA id 59D7D3E923;
 Tue, 10 Sep 2019 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ofb.net; s=ofb;
 t=1568136826; bh=JU2ZXIZGbMWL0+yeFomgN69JKrPct9nPBiJ4k97a2r8=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=OTf82RgZVZaF3E7b4QB3skh/DFh/+A2QSyN1ZcVzxhVXHfajnzjmCvG6VfIB7flrS
 SXYUYL2ic3lVmmHGPJJIZDfrPQP5ybNiwLk0Uex+1fLyPO/+FPfbZ1tnE5xy+nf0jK
 HmA7A5UdCEtZIJ4ZnUqcY2qp8dosePGr+DseqU/0oizdyNb6+t6tXpXDkc8zSgeASz
 IZswJKyuw5mY6RZGQlLJrfFpiB6SjetxVc3UarqKcVoT7us5atsPly1ppz25R/ucTT
 +2THeZbN3qX4bqDDbWaEiIXGzb75rMlZGMMGhsTmm0gSWT1bxf09bwRZ4WV8dOPtZ6
 Xv2hRILO3wt9Q==
Received: from frederik by localhost.localdomain with local (Exim 4.92.2)
 (envelope-from <frederik@localhost.localdomain>)
 id 1i7k1R-00038U-5M; Tue, 10 Sep 2019 10:33:45 -0700
Date: Tue, 10 Sep 2019 10:33:45 -0700
From: frederik@ofb.net
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190910173345.63bv2xa4vlkxicxj@localhost>
References: <20190904164706.gwjbcywbj7emnwvr@localhost>
 <s5hv9u19x2f.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hv9u19x2f.wl-tiwai@suse.de>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] parameter for pulse device?
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
Reply-To: frederik@ofb.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Sep 09, 2019 at 07:52:24PM +0200, Takashi Iwai wrote:
>It depends on how pcm.pulse is defined.  If it's defined to take an
>argument, it can work like that.  (Or sometimes you may need to pass
>the argument explicitly like "pulse:{device=mointor}".)
>
>The standard pcm.pulse definition provided in alsa-plugins repo
>doesn't take the argument, and that can be the reason.

Thank you Takashi. Would it be easy to change alsa-plugins so that it takes an argument? Is there a chance that this change would be accepted?

If you can point me to the section of code in e.g. "plughw" where argument parsing is done, then I would probably end up modifying alsa-plugins myself, just to simplify what I am doing.

Thanks,

Frederick
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
