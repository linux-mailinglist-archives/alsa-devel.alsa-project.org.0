Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3C20CAD8
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 00:04:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAAEB1678;
	Mon, 29 Jun 2020 00:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAAEB1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593381862;
	bh=AKxB/KByGwKPOZjfElEjXzlOSRyCC4vZgiDhIk3CYu8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYsZJzYi9zsvHa+5NhKfWSM3K/9W1pI5NfIrDKaanHh2vKo24aCXIKmWHh4ZoD+ld
	 D9LN2qFL3kV4EPfLVbjCoqQg/0xOMuxcs4zLqenp8Zm59udXnIprRgN8luFR+0sLDh
	 qoS6BlUYLHhvf3OaEOnbj9b8Y/GQD39E0ZTW3kic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D18D8F800B4;
	Mon, 29 Jun 2020 00:02:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5906F8022D; Mon, 29 Jun 2020 00:02:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from denise.shiny.it (denise.shiny.it [185.206.84.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 166D5F800B4
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 00:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 166D5F800B4
Received: from wc1 (localhost [127.0.0.1])
 by denise.shiny.it (8.15.2/8.15.2) with ESMTP id 05SM2Rl5008557;
 Mon, 29 Jun 2020 00:02:27 +0200
Date: Mon, 29 Jun 2020 00:02:32 +0200
From: Giuliano Pochini <pochini@shiny.it>
To: Mark Hills <mark@xwax.org>
Subject: Re: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
Message-ID: <20200629000139.0212fa11@wc1>
In-Reply-To: <2006192200200.12984@tamla.localdomain>
References: <2006161409060.30751@stax.localdomain>
 <20200616131743.4793-3-mark@xwax.org> <20200617000134.60c5e2b5@wc1>
 <2006171158070.2561@stax.localdomain> <20200619215655.07b6f3ed@wc1>
 <2006192200200.12984@tamla.localdomain>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Fri, 19 Jun 2020 22:21:54 +0100 (BST)
Mark Hills <mark@xwax.org> wrote:

> On Fri, 19 Jun 2020, Giuliano Pochini wrote:
> 
> > On Wed, 17 Jun 2020 12:14:42 +0100 (BST)
> > Mark Hills <mark@xwax.org> wrote:
> > 
> [...]
> > > You might be able to do the comparison before wrapping pipe_position, 
> > > but hopefully you'll consider my patch in reply to Takashi has more 
> > > clarity.
> > 
> > Your patch is very interesting. I didn't take into account the idea of 
> > advancing the position by full periods only. If the PCM subsystem
> > hasn't changed much since I last checked (I wrote the driver many years
> > ago), it should work fine (and I'm sure you tested it). But I don't
> > know if something else requires better resolution.
> 
> It's funny, but I didn't take account of the opposite; that there was any 
> merits to polling inbetween the interrupts for better resolution.
> 
> Takashi pointed out the need for this and we had some discussion. Check 
> the other thread, where I provided a newer revision of the code.
> 
> The good thing is I think we can have all the things we want and be bug 
> free, just I have to understand the specification.
> 
> It would be great if you would like to take a look at the newer code for 
> any problems you can see. I was going to run it for a few days then turn 
> it into some patches.

I looked at your code and I think it's OK. I'm using it for some days
without any problem. I also stressed it with pretty tight timings and it
worked fine all the time.

Since I could not reproduce that problem before, except in some rare random
circumstances, I'm not a good tester at all. At most I can say that your
patch does not make things worse :)


-- 
Giuliano.
