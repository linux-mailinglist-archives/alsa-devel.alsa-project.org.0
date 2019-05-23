Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4F2791D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 11:22:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EEA31672;
	Thu, 23 May 2019 11:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EEA31672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558603331;
	bh=UHV0XlIAKSUge+gss25Q71m6hoFfVFeUaSdBGlls84s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UyZMddQWT0rMExEYRU1i3eGeDYnqzidVUt9/vIzVgE7CvS3uhUYuqPDPG30b2EQZT
	 czzQd+RDGivxhESqpSutJCQuMPK+6t6GShhdtTpgkJlXVtpzDOfAYp31K47Cok3Dm2
	 YXxNajpHeL0D9UWI+Y17GMlndbDoQu5akSakOPxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7C0CF89707;
	Thu, 23 May 2019 11:20:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DD39F89674; Thu, 23 May 2019 11:20:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 548FFF80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 11:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 548FFF80C0F
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 02:20:17 -0700
X-ExtLoop1: 1
Received: from buildpc-hp-z230.iind.intel.com (HELO buildpc-HP-Z230)
 ([10.223.89.34])
 by orsmga001.jf.intel.com with ESMTP; 23 May 2019 02:20:15 -0700
Date: Thu, 23 May 2019 14:50:34 +0530
From: Sanyog Kale <sanyog.r.kale@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190523092034.GA23777@buildpc-HP-Z230>
References: <20190522162528.5892-1-srinivas.kandagatla@linaro.org>
 <4744834c-36b1-dd8d-45fa-76c75eb3d5cb@linux.intel.com>
 <2dc66f9d-e508-d457-a7d6-c06c4336e7b8@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2dc66f9d-e508-d457-a7d6-c06c4336e7b8@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: vkoul@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] soundwire: stream: fix bad unlock balance
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, May 23, 2019 at 09:43:14AM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 22/05/2019 17:41, Pierre-Louis Bossart wrote:
> > 
> > 
> > On 5/22/19 11:25 AM, Srinivas Kandagatla wrote:
> > > This patch fixes below warning due to unlocking without locking.
> > > 
> > > ?? =====================================
> > > ?? WARNING: bad unlock balance detected!
> > > ?? 5.1.0-16506-gc1c383a6f0a2-dirty #1523 Tainted: G?????????????? W
> > > ?? -------------------------------------
> > > ?? aplay/2954 is trying to release lock (&bus->msg_lock) at:
> > > ?? do_bank_switch+0x21c/0x480
> > > ?? but there are no more locks to release!
> > > 
> > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > ---
> > > ?? drivers/soundwire/stream.c | 3 ++-
> > > ?? 1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> > > index 544925ff0b40..d16268f30e4f 100644
> > > --- a/drivers/soundwire/stream.c
> > > +++ b/drivers/soundwire/stream.c
> > > @@ -814,7 +814,8 @@ static int do_bank_switch(struct
> > > sdw_stream_runtime *stream)
> > > ?????????????????????????? goto error;
> > > ?????????????????? }
> > > -?????????????? mutex_unlock(&bus->msg_lock);
> > > +?????????????? if (mutex_is_locked(&bus->msg_lock))
> > > +?????????????????????? utex_unlock(&bus->msg_lock);
> > 
> > Does this even compile? should be mutex_unlock, no?
> > 
> > We also may want to identify the issue in more details without pushing
> > it under the rug. The locking mechanism is far from simple and it's
> > likely there are a number of problems with it.
> > 
> msg_lock is taken conditionally during multi link bank switch cases, however
> the unlock is done unconditionally leading to this warning.
> 
> Having a closer look show that there could be a dead lock in this path while
> executing sdw_transfer(). And infact there is no need to take msg_lock in
> multi link switch cases as sdw_transfer should take care of this.
> 
> Vinod/Sanyog any reason why msg_lock is really required in this path?
>

In case of multi link we use sdw_transfer_defer instead of sdw_transfer
where lock is not acquired, hence lock is acquired in do_bank_switch for
multi link. we should add same check of multi link to release lock in
do_bank_switch.

> --srini
> 
> > > ?????????? }
> > > ?????????? return ret;
> > > 

-- 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
