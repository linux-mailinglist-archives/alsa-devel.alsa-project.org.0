Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37189210E15
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 16:53:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEEE4168C;
	Wed,  1 Jul 2020 16:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEEE4168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593615220;
	bh=Dq5whM44wnWttBYmnnVvlJ7we8oy330ugPRIjJO/KzU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFRhUPxDOL2e0NIYgga4dxgzKhnBeSlsuyH6UDyxJ4rmk+EJCSwv3LRHRfr60/uzy
	 3yKyAA91jUf6V6TicJHVPrM1QkeL+tI+rC1GXDaYyNm91GzsiG6ar7zhJegIuDeXNL
	 /Rnt1Ja6h5UQ3hsTzL8Dqd/PzfXTCFXCWAry3rPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFF9BF80217;
	Wed,  1 Jul 2020 16:51:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B8F3F80217; Wed,  1 Jul 2020 16:51:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from denise.shiny.it (denise.shiny.it [185.206.84.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBE14F801D8
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 16:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE14F801D8
Received: from wc1 (localhost [127.0.0.1])
 by denise.shiny.it (8.15.2/8.15.2) with ESMTP id 061Epi5m022388;
 Wed, 1 Jul 2020 16:51:45 +0200
Date: Wed, 1 Jul 2020 16:51:51 +0200
From: Giuliano Pochini <pochini@shiny.it>
To: Mark Hills <mark@xwax.org>
Subject: Re: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
Message-ID: <20200701165035.2be3cb2e@wc1>
In-Reply-To: <2007011320590.17595@stax.localdomain>
References: <2006161409060.30751@stax.localdomain>
 <20200616131743.4793-3-mark@xwax.org> <20200617000134.60c5e2b5@wc1>
 <2006171158070.2561@stax.localdomain> <20200619215655.07b6f3ed@wc1>
 <2006192200200.12984@tamla.localdomain>
 <20200629000139.0212fa11@wc1>
 <2007011320590.17595@stax.localdomain>
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

On Wed, 1 Jul 2020 13:25:07 +0100 (BST)
Mark Hills <mark@xwax.org> wrote:

> On Mon, 29 Jun 2020, Giuliano Pochini wrote:
> 
> > Since I could not reproduce that problem before, except in some rare 
> > random circumstances, I'm not a good tester at all. At most I can say 
> > that your patch does not make things worse :)
> 
> What software are you using on the device, and are you using x86_64 and 
> dmix?
> 
> I think some issues might be exaggerated by dmix which has a unique way
> of opening the device several times. And then chromium exercises dmix a
> lot with all of its threads/forks. That would I presume be how it
> exercises races between pcm_pointer and interrupts.

x86_64 now. When I wrote the driver I had a powermac. I also can test it on
a x86_32 laptop with an Indigo-IO card.

I tested both plughw and dmix, but I don't use the latter often.


-- 
Giuliano.
