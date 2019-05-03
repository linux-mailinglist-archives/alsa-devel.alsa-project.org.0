Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 082AA12FD2
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 16:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7565317E9;
	Fri,  3 May 2019 16:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7565317E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556892526;
	bh=Kh3y6h4Z8MWOuiUUAcSRnvY81kux+LZnvkoQZ6ssDzY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D/uB4w+lCW4h/jJyTKa0kXxfvKUUAsP1QvL6j6tPlVqhVPuaI09zbJW7A6JIpVv+R
	 t9KAxOq0uW5t8j53IeamRUV1LX9Ewrx1ZoyF4KBL/Yxe/k3+SRvt7VqI/UABJJKrmz
	 QQavUuNzusGtWYgbAfCvCfz8LxWi3oaS3/jtsCXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A947DF80722;
	Fri,  3 May 2019 16:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DA23F896B7; Fri,  3 May 2019 16:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F0BAF80720
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 16:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F0BAF80720
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JHtMIDVU"
Received: by mail-ed1-x544.google.com with SMTP id w11so6152281edl.5
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 07:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bIkHlNqSnjBvKekWU2vvrbH/hm3F1RI6rjhDUHQ8YbQ=;
 b=JHtMIDVUiritOqCWGomzNEQCggPiA6NeSQ3lGRaP2nhvOANoSP4i/iLCUYXt1kwSFI
 8QyVfDuZBxPieJ17zHM/y0bXd2YeHSymPZVFTyWt8dRxqWVspwQ2Ip/G/I5ZGP4RY0G0
 2AtQKu13MoGMrq0Sdl3l/KIHRU98Rd/86IV7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bIkHlNqSnjBvKekWU2vvrbH/hm3F1RI6rjhDUHQ8YbQ=;
 b=isRzcwUzYeNkrO55VOl1u9EneO/PPiHfJcad0Re//BHjte56p9pzs0bQFLn5x6nWWg
 6ToTbpPXU2zI3ZpeQVuPwnosunpNoAwOzA/n+4ev9fXoGeivTVo1878r1eacsqtw6QyY
 ouXKTh0plaFahQTD7SUln/4Vx7NQdP3FKLgEGpnCdsGJRMKg4l6HOsEsEO64b+u6YY6c
 ziZtkCLbWAZhs5LQgULaJdxGrOTzGMMUjda3NY9/DIPQr01he3Ar+kyaEUfCK+c0iat/
 cPSx3zfJKB16nmFu9tvojU53YjM/YqDEmfudaRSCUYRx+6t72VcqKewqzKU2MKseyPqC
 FX9A==
X-Gm-Message-State: APjAAAXSrZ15kBz+QDqCOB6xRb9c0GLxHSLhJFqdjhquG1tEn6brt5Au
 PKZFnhRzWk/6yvbeVLV+d000/wRDwpI=
X-Google-Smtp-Source: APXvYqypWQQ/asfxl847hJX/poQ/rSooSXedgg0SWeq+OVeEo7m46BNEpoOn2+dy5eEY7DfEMgHx2A==
X-Received: by 2002:a17:906:2606:: with SMTP id
 h6mr6460029ejc.211.1556892414739; 
 Fri, 03 May 2019 07:06:54 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50])
 by smtp.gmail.com with ESMTPSA id n3sm353258eja.70.2019.05.03.07.06.52
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 07:06:53 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id m4so6151157edd.8
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 07:06:52 -0700 (PDT)
X-Received: by 2002:a50:9056:: with SMTP id z22mr8689692edz.72.1556892412452; 
 Fri, 03 May 2019 07:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190502172700.215737-1-zwisler@google.com>
 <s5hr29grlz9.wl-tiwai@suse.de>
In-Reply-To: <s5hr29grlz9.wl-tiwai@suse.de>
From: Ross Zwisler <zwisler@chromium.org>
Date: Fri, 3 May 2019 08:06:40 -0600
X-Gmail-Original-Message-ID: <CAGRrVHxXFSOKFW6Di49OwAEnqvak6W+gkpA_TB3ULGe2PHjZ-w@mail.gmail.com>
Message-ID: <CAGRrVHxXFSOKFW6Di49OwAEnqvak6W+gkpA_TB3ULGe2PHjZ-w@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Clemens Ladisch <clemens@ladisch.de>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] MAINTAINERS: update git tree for sound
	entries
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

On Fri, May 3, 2019 at 2:17 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 02 May 2019 19:27:00 +0200,
> Ross Zwisler wrote:
> >
> > Several sound related entries in MAINTAINERS refer to the old git tree
> > at "git://git.alsa-project.org/alsa-kernel.git".  This is no longer used
> > for development, and Takashi Iwai's kernel.org tree is used instead.
> >
> > Signed-off-by: Ross Zwisler <zwisler@google.com>
>
> Ross, would you like to keep @chromium.org as your author address
> while the sign-off is with @google.com?  It's OK and some people even
> prefer giving different addresses, but it's often an overlook.  So,
> just for confirmation.

Hi Takashi,

It's fine to leave the author address as @chromium.org with the
sign-off @google.com.  Thank you for checking.

- Ross
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
