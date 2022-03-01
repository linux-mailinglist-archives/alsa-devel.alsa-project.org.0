Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EED4C8C0A
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 13:54:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F1131B35;
	Tue,  1 Mar 2022 13:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F1131B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646139283;
	bh=geBK4WcKXnL3gfRqFcEBFFhDxaV1Q5HCKUOcLe7m0ww=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f7Of26YFlC51j1iNALkI1mpl6LitTzWYZpfkOt6dAbmiZbih+q2Gt9/o8eCDUI+jl
	 Rg00tNS2gWq1wJXI9A6z4s+gMJaTYNEWKebhyYdNml+MZIgwUKy42KBiF2Kq9ih53R
	 ZoQj0fw1EEy3AjKEro8SRGDo7ig0wW0+Zq0elg60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01C4AF80054;
	Tue,  1 Mar 2022 13:53:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15960F80227; Tue,  1 Mar 2022 13:53:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB7CAF80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 13:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB7CAF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="eEAxS9Rf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646139204;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=E0/pLDycfjg5UgInPN+YotNuJ3zzV/iGM8G9D9KGSHI=;
 b=eEAxS9Rflo+Ob0bTeRyYno/btBHAc3bl0W9FlcftRxUHd/CjSOaBmH6V98VC1zSXFO
 CrB0T5zcWzeIRrqF5VwHMFUuovl3nk90zD50YMk+J/1eCAUaoocNwfV0oPjKZcHYtBlb
 ZRDUNXKt6OiCi3/R00Zs3++uyJAenZRKeBlFEwVLLniV8gnY07rKIqIy96zxRmrWkMHv
 HSH8uweHbFvUxWCp3Ve7Pp+dA0xkuXTDQ+Nn/vZJNbknQikiwtv/8D4WjjybDXQiCn5W
 dQk5XV8DLfJHAp5ouIy6Zg/qVaX+L+CfhBJ4CN2EnUxlwJt8uNlRHThqBVTI+i6jcj4p
 fGlg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK86+6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.40.1 AUTH)
 with ESMTPSA id kdc58dy21CrOa80
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Mar 2022 13:53:24 +0100 (CET)
Date: Tue, 1 Mar 2022 13:53:12 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: codecs: Add Awinic AW8738 audio amplifier driver
Message-ID: <Yh4XOC5+Uam9UMdJ@gerhold.net>
References: <20220301123742.72146-1-stephan@gerhold.net>
 <20220301123742.72146-3-stephan@gerhold.net>
 <Yh4VziYJ2M2aenjz@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh4VziYJ2M2aenjz@sirena.org.uk>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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

On Tue, Mar 01, 2022 at 12:47:10PM +0000, Mark Brown wrote:
> On Tue, Mar 01, 2022 at 01:37:42PM +0100, Stephan Gerhold wrote:
> > From: Jonathan Albrieux <jonathan.albrieux@gmail.com>
> > 
> > The Awinic AW8738 is a simple audio amplifier using an enable GPIO.
> > The main difference to simple-amplifier is that there is a "one-wire
> > pulse control" that allows configuring the amplifier to one of a few
> > pre-defined modes.
> 
> I only have this patch, nothing else from the rest of the series.
> What's the story with dependencies?

Hmm, I definitely sent the whole series to you. Let's wait a bit longer
to see if it will still arrive, otherwise let me know and I can try to
send it again.

It seems to have arrived fully on the mailing list:
https://lore.kernel.org/alsa-devel/20220301123742.72146-1-stephan@gerhold.net/

Thanks,
Stephan
