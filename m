Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA20202F87
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 07:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C53316B5;
	Mon, 22 Jun 2020 07:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C53316B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592804102;
	bh=LlY20qnm761fwobPyLQcFs7yCjutoOfn/Lec+Ma6ywc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQzSksgOzN41wn7DbSRkr73JAMQnOT25FAYUlZw0lGAauvo6g5quv0b6Up4rEzPLz
	 5Gw7j1/ceDAusLTYw01YxrvHt1/zaf5EjULpT8PYh99W9IFHuTmIwaYJK1M9T4Uw6E
	 i5xpaPzM/8egFdgLgs3TNkVRulFdH/McmSQiIgho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27EC1F80162;
	Mon, 22 Jun 2020 07:33:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6CF5F8015B; Mon, 22 Jun 2020 07:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52EEEF8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 07:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52EEEF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DkOk2StE"
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C14F25403;
 Mon, 22 Jun 2020 05:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592803989;
 bh=LlY20qnm761fwobPyLQcFs7yCjutoOfn/Lec+Ma6ywc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DkOk2StEX2MqAuyXo6cvvRGNmU5lOPgoP82DRRuUq6wSIvWp1z8LtKcyIX+LapHd1
 2uwlOsmtOfegoQgFFwBoggbbnRzNWcg9O5d+KAFASEzNJEh9HrQqFd7X8fTtxEUqAv
 REqcSnDWPidAtAT1DF1Afzfa8bzyleR2zhLiBoyU=
Date: Mon, 22 Jun 2020 11:03:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/3] ALSA: compress: document the compress audio state
 machine
Message-ID: <20200622053304.GD2324254@vkoul-mobl>
References: <20200619045449.3966868-1-vkoul@kernel.org>
 <20200619045449.3966868-2-vkoul@kernel.org>
 <8e322574-14bc-aaaa-5fdb-751cb8b97fff@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e322574-14bc-aaaa-5fdb-751cb8b97fff@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
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

HI Pierre,

On 19-06-20, 09:22, Pierre-Louis Bossart wrote:
> 
> > +
> > +                                        +----------+
> > +                                        |          |
> > +                                        |   OPEN   |
> > +                                        |          |
> > +                                        +----------+
> > +                                             |
> > +                                             |
> > +                                             | compr_set_params()
> > +                                             |
> > +                                             V
> > +                                        +----------+
> > +                compr_drain_notify()    |          |
> > +              +------------------------>|   SETUP  |
> > +              |                         |          |
> > +              |                         +----------+
> > +              |                              |
> > +              |                              |
> > +              |                              | compr_write()
> > +              |                              |
> > +              |                              V
> > +              |                         +----------+
> > +              |                         |          |
> > +              |                         |  PREPARE |
> > +              |                         |          |
> > +              |                         +----------+
> > +              |                              |
> > +              |                              |
> > +              |                              | compr_start()
> > +              |                              |
> > +              |                              V
> > +        +----------+                    +----------+     compr_pause()      +----------+
> > +        |          |                    |          |----------------------->|          |
> > +        |  DRAIN   |<-------------------|  RUNNING |                        |  PAUSE   |
> > +        |          |                    |          |<-----------------------|          |
> > +        +----------+                    +----------+     compr_resume()     +----------+
> > +              |                              |
> > +              |                              |
> > +              |                              | compr_free()
> > +              |                              |
> > +              |                              V
> > +              |                         +----------+
> > +              |     compr_free()        |          |
> > +              +------------------------>|          |
> > +                                        |   STOP   |
> > +                                        |          |
> > +                                        +----------+
> 
> 
> The STOP state doesn't seem quite right to me, sorry.

We should call it free, Will update

> the direction of the DRAIN-STOP comp_free() arrow seems wrong? Of if it is
> correct, then something's missing to exit the STOP state so that the stream
> can be opened again.

Once stream is freed, it can't be opened again.

But we have trigger stop which is not comprehended here, I will add
compr_stop() above which would transition to SETUP state. And a stopped
stream can be freed up as well, so one more transition from SETUP to
FREE.

Thanks for reviewing
-- 
~Vinod
