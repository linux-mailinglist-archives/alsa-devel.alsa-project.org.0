Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905556C893
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jul 2022 11:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9AEF1EF;
	Sat,  9 Jul 2022 11:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9AEF1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657360677;
	bh=PbPaVryS3IfrLqQ1B9Ls9PPUnr4E5iWT9w5+tUrG/SU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H7bE/alQU6b/QfdKDqkCP5mYP2mj/ciCDp9o4FYQLcGMI30mHJhRlzTYWPB9gZ64N
	 PELSFvpaQbxXnK7njtHFEiSrshsToXCqdpwqMFZ1Ivip1up8yJ0FrLIQw1zULRIr6q
	 M+ofwqqgNRcy+itSUmq0Bn+cu0k9rriJ9XVmuCDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E672F80158;
	Sat,  9 Jul 2022 11:56:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77F6EF80245; Sat,  9 Jul 2022 11:56:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C6A5F80158
 for <alsa-devel@alsa-project.org>; Sat,  9 Jul 2022 11:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C6A5F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="riY1cZ27"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B3F4B819C4;
 Sat,  9 Jul 2022 09:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4EBC3411C;
 Sat,  9 Jul 2022 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657360607;
 bh=PbPaVryS3IfrLqQ1B9Ls9PPUnr4E5iWT9w5+tUrG/SU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=riY1cZ27C76IkL7GJt4UKOvxVIoiho/oMGtH2RQ17N/urCtX9PsAD3/2OxUen05PS
 uZJf4HUc0MLgcPvohCH5gu13TXIzsnCIbV/kOzVrqcx+/+Ay0mMqRDEPe+uKUT2SzM
 1Zp4xESSttL5VTpOg3FiBLSwWS6SjIm3xg1qWafdCVsQkPimtkqv8RCpEhk18WQ8Cb
 F/kwALhaLzftWcjWezq7nGbBfR28H7rEJarRZu3sDhiAwSywUL6MW0igrv6jhi/UOl
 Ya+9ljZ7gCKeO3OmvarM4WzmxJ+r9UTaNxllha5Qk5r5UpBa3NkMP+eDijKRkYXPN5
 DUW6U74f/xkpA==
Date: Sat, 9 Jul 2022 10:56:40 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 10/12] docs: alsa: alsa-driver-api.rst: remove a
 kernel-doc file
Message-ID: <20220709105640.376ff45c@sal.lan>
In-Reply-To: <87y1x9xclg.wl-tiwai@suse.de>
References: <cover.1656759988.git.mchehab@kernel.org>
 <3cd6b93b36b32ad6ae160931aaa00b20688e241a.1656759989.git.mchehab@kernel.org>
 <87y1x9xclg.wl-tiwai@suse.de>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

Em Mon, 04 Jul 2022 14:54:19 +0200
Takashi Iwai <tiwai@suse.de> escreveu:

> On Sat, 02 Jul 2022 13:07:42 +0200,
> Mauro Carvalho Chehab wrote:
> > 
> > This file:
> > 	sound/core/compress_offload.c
> > 
> > Doesn't define any docs, as everything is inside the header
> > file. So, drop it, in order to remove a Sphinx warning.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>  
> 
> Hmm, it looks rather like that some comments (at least for exported
> functions) should be marked with kerneldoc markers instead.
> 
> I'm going to fix those comments.

Go for it: adding kerneldoc markers is indeed a better solution :-)

Regards,
Mauro

> 
> 
> thanks,
> 
> Takashi
> 
> > ---
> > 
> > To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH 00/12] at: https://lore.kernel.org/all/cover.1656759988.git.mchehab@kernel.org/
> > 
> >  Documentation/sound/kernel-api/alsa-driver-api.rst | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Documentation/sound/kernel-api/alsa-driver-api.rst b/Documentation/sound/kernel-api/alsa-driver-api.rst
> > index d24c64df7069..3cf8eb4ecaf4 100644
> > --- a/Documentation/sound/kernel-api/alsa-driver-api.rst
> > +++ b/Documentation/sound/kernel-api/alsa-driver-api.rst
> > @@ -86,7 +86,6 @@ Compress Offload
> >  
> >  Compress Offload API
> >  --------------------
> > -.. kernel-doc:: sound/core/compress_offload.c
> >  .. kernel-doc:: include/uapi/sound/compress_offload.h
> >  .. kernel-doc:: include/uapi/sound/compress_params.h
> >  .. kernel-doc:: include/sound/compress_driver.h
> > -- 
> > 2.36.1
> >   
