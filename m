Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCB5113DAF
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 10:20:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC541674;
	Thu,  5 Dec 2019 10:19:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC541674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575537649;
	bh=cWYxuSrUSYzu28VmJFVEfuUylUnSOea+T+M5AHSj0Os=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IxGbVMJnyZbwbW7gmZ4LW5xmtnCmwO+urXEO2IhxXS6kEoObc5rRXMZ/4QT54qxKD
	 1Gu9+vZrA7he7cNqSM61wr35S3RrTP1Ykm/40Bs67xz6PGhizcJhk6Jp5Y7XuPrIaX
	 +GmpE1UFCSU41V+snKwCjylQeeab+AcXs+v1FfeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C7C0F800F6;
	Thu,  5 Dec 2019 10:18:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B24F800F6; Thu,  5 Dec 2019 10:18:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD527F800B4
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 10:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD527F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="lgf9fTIK"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 27B372305C;
 Thu,  5 Dec 2019 10:18:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1575537492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/Tl9y0vlxprYCBrvMb1aya8Frr3Lyxlo7NlxWTMqUU=;
 b=lgf9fTIKUVaOWWjXw/69XcooxlrBdTSukoRwUQcp1g0v/iSfnIdYWw+ete1aMsIxdMWXZO
 +36NxPACCHWHppH36Gg7oSGBQRvd7i3DE5L8XyacL/MHGEw5nVY8Nf1FE6RED7DZzTdSmC
 OMxzTgAFh2qQ1Csg8+1STlDZxi+7KTk=
MIME-Version: 1.0
Date: Thu, 05 Dec 2019 10:18:10 +0100
From: Michael Walle <michael@walle.cc>
To: Daniel Baluta <daniel.baluta@gmail.com>
In-Reply-To: <CAEnQRZCnQAUVowOJw5aPe9rYWU5DKR4bFbmQLYV2BzYqOhRJmQ@mail.gmail.com>
References: <20191128223802.18228-1-michael@walle.cc>
 <CAEnQRZCnQAUVowOJw5aPe9rYWU5DKR4bFbmQLYV2BzYqOhRJmQ@mail.gmail.com>
Message-ID: <a5accae02f840f7e25099c2ccd7b02ff@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 27B372305C
X-Spamd-Result: default: False [1.40 / 15.00]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[12]; NEURAL_HAM(-0.00)[-0.696];
 FREEMAIL_CC(0.00)[alsa-project.org,lists.ozlabs.org,vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com];
 SUSPICIOUS_RECIPS(1.50)[]
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: add IRQF_SHARED
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Daniel,

Am 2019-12-05 09:43, schrieb Daniel Baluta:
> On Fri, Nov 29, 2019 at 12:40 AM Michael Walle <michael@walle.cc> 
> wrote:
>> 
>> The LS1028A SoC uses the same interrupt line for adjacent SAIs. Use
>> IRQF_SHARED to be able to use these SAIs simultaneously.
> 
> Hi Michael,
> 
> Thanks for the patch. We have a similar change inside our internal tree
> (it is on my long TODO list to upstream :D).
> 
> We add the shared flag conditionally on a dts property.
> 
> Do you think it is a good idea to always add shared flag? I'm thinking
> on SAI IP integrations where the interrupt is edge triggered.

Mhh, I don't really get the point to make the flag conditionally. If
there is only one user, the flag won't hurt, correct?

If there are two users, we need the flag anyway.

> AFAIK edge triggered interrupts do not get along very well
> with sharing an interrupt line.

So in that case you shouldn't use shared edge triggered interrupts in 
the
SoC in the first place, I guess.

-michael
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
