Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68848201D0E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 23:23:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF516167B;
	Fri, 19 Jun 2020 23:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF516167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592601816;
	bh=jYUh1OvYrshMJqDzcix8yeNN5XKDASTudD7yHVLHVK4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJH54mEZjj2rCoZwrcW4EEjjLm9oWrfDMEVMEjnYIdkuvklaSIMlvdGh08Cd6r10S
	 dz4qa2nGOh1NuAX5jh984tYcqnX0xFK1lx5LTp7QawdEJaacc75NXwYVrrx4uoN2+q
	 00YgFS+zoEkDHyNnzT9Fil7EkwA9iNIZlvBPXzRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1439EF80232;
	Fri, 19 Jun 2020 23:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E554AF80252; Fri, 19 Jun 2020 23:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17A18F800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 23:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17A18F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="slqG5au9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Sender:Content-Type:MIME-Version:References:Message-ID:In-Reply-To:
 Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8jixx48ROAprPrsxlN+g/qmKQ2/7h41ZfAVylQvQKgg=; b=slqG5au9BDPG7pe79H9808afFH
 MvqXQcV9IdbYGEXtnZIN7OUoX+kQDr20vTt6khzBb7E722gzz+J70XCP6rrayyWPQMTdl0Mn/RwOU
 YW4Xbd+Vaf1NAMYIbO3snVO4WOdYYjq8QGfOnQHFtdayGkAjd/xV/xK6oM4pJsLYikky1CtP420sj
 tBwFUQqgBTVcoDHrLgZQ1s6NLLK3VPs7ZCMrHbU5bGvu4qsLgaHM4zjs7eqx6oQOdZGQ7Q1LNsU4d
 nPumM2hHfT00dLDtTtEIVVBKAYKq8IOQTTD4xvf3uo9xMrj3qBIgBHrUj3g14Z2DHR4wGx3eFfMZC
 9rhpE3Rg==;
Received: from [2001:470:1d21:0:6e15:36bd:8667:43d5] (helo=tamla.localdomain)
 by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jmOSH-00051k-GZ; Fri, 19 Jun 2020 22:21:45 +0100
Received: from mark (helo=localhost)
 by tamla.localdomain with local-esmtp (Exim 4.92.3)
 (envelope-from <mark@tamla.localdomain>)
 id 1jmOSQ-0003fW-Mu; Fri, 19 Jun 2020 22:21:54 +0100
Date: Fri, 19 Jun 2020 22:21:54 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Giuliano Pochini <pochini@shiny.it>
Subject: Re: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
In-Reply-To: <20200619215655.07b6f3ed@wc1>
Message-ID: <2006192200200.12984@tamla.localdomain>
References: <2006161409060.30751@stax.localdomain>
 <20200616131743.4793-3-mark@xwax.org> <20200617000134.60c5e2b5@wc1>
 <2006171158070.2561@stax.localdomain> <20200619215655.07b6f3ed@wc1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 19 Jun 2020, Giuliano Pochini wrote:

> On Wed, 17 Jun 2020 12:14:42 +0100 (BST)
> Mark Hills <mark@xwax.org> wrote:
> 
[...]
> > You might be able to do the comparison before wrapping pipe_position, 
> > but hopefully you'll consider my patch in reply to Takashi has more 
> > clarity.
> 
> Your patch is very interesting. I didn't take into account the idea of 
> advancing the position by full periods only. If the PCM subsystem hasn't 
> changed much since I last checked (I wrote the driver many years ago), 
> it should work fine (and I'm sure you tested it). But I don't know if 
> something else requires better resolution.

It's funny, but I didn't take account of the opposite; that there was any 
merits to polling inbetween the interrupts for better resolution.

Takashi pointed out the need for this and we had some discussion. Check 
the other thread, where I provided a newer revision of the code.

The good thing is I think we can have all the things we want and be bug 
free, just I have to understand the specification.

It would be great if you would like to take a look at the newer code for 
any problems you can see. I was going to run it for a few days then turn 
it into some patches.

-- 
Mark
