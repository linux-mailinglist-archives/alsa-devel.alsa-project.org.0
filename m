Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA9C661FCC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 09:18:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C8974507;
	Mon,  9 Jan 2023 09:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C8974507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673252326;
	bh=y3ww+hrD9L64DGHvNJzFJ3PvBwYr1Lds1rgndTcyagE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qqmz4ufKgU+F3JeiyiFXemDND3PuAedKmBNNZ56OKNQf9/pSAAMFfa96KKq0TfZRh
	 7nNjcI4pm13UhXYmy62xs8/YWR2iUXm3mFEim9Da3fv1t39um4wyrD3joUeAp+g3G3
	 IXRXM3y6QLPYpWkt6tFKScIpyU6yNIYGD+f6ZRUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CFF6F803DC;
	Mon,  9 Jan 2023 09:17:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63832F8030F; Mon,  9 Jan 2023 09:17:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18191F80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 09:17:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18191F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FWCXSx2S
Received: by mail-wm1-x335.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso1583710wms.0
 for <alsa-devel@alsa-project.org>; Mon, 09 Jan 2023 00:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qYX9wRFN9M9pAvKCwuXTe00FVaoWdMPCvEY4Kcg+Jjg=;
 b=FWCXSx2Sys87tHeABJFh3OngaZptR25DmOVLuYIEPpj+XDmF0hlsyR/lS795xn1iKZ
 8cDDl/Bvb4SaSeLmgcMZ19dv3Q4FU9T3Nh1PrHIWvpA7GqsR4REMvwS/yncuVUb+YW2O
 /u4VTv7eegMLXVvPYkC1Cw1jgs5p0wsIOg3DxQLf7++wO1UaUnH6GKf2ODSGNC4VQDBn
 O8UmGfzQViqw9vdxCXruaZEIOXwXbsU/sXo2KsL0RBldYRcHFAJFBCkeW44eU4kZee+s
 asZpaAHVPJUiwii40IOTWyRW9HTRFdVtaWJia2aICGZAsqMbHqeCvIGxTi9cr0wxkdBo
 wdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYX9wRFN9M9pAvKCwuXTe00FVaoWdMPCvEY4Kcg+Jjg=;
 b=35jBp/+VM4F/Dhnr+AnPH4e2yfdRu1h0Lhuyne1HbN0KgONVGOsoPQT+mJzc5pWjz9
 CUIApzDgOitU968+KvPhCQtJYDjGPYY9U60vCn6NAOfp6jM/VRFAkfSe1xtpbn/eD2Pl
 cQ7XaBa5l9EQBg4Bp3mNjs0ag/64ZhmYjPTxK0c10vXbUwRdLVOh22dIdy/f3tgpHRHK
 VOpQx/+r55sfyGZUJeW7uOks8HOxjTk9PYBvRmvebNj9FGAE3BYOl1pwD1bfhYO+1v/r
 AiKEUH3uc02qrqk220HAwqcqCtRa74kczOhZJdUKMydNZOGhSOA9vQbVrAkqmAxg/eok
 cy7w==
X-Gm-Message-State: AFqh2kpgR+1pemuQQggDsKiFu/as7Z7H2gjHqH8nYl06HucMP+nyy/Nr
 3gaNxVakLvgWCW5YjUxzEFBsZnUwhZY=
X-Google-Smtp-Source: AMrXdXvN2nz3vYdAZtB9Nv7tWQXsPVjpLcBTOyfec7lwo9K2nYZlikzPclkh4kmX1euyroIjRZwmAw==
X-Received: by 2002:a05:600c:1d0e:b0:3cf:7c8b:a7c7 with SMTP id
 l14-20020a05600c1d0e00b003cf7c8ba7c7mr45163558wms.39.1673252259042; 
 Mon, 09 Jan 2023 00:17:39 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm16879252wmb.42.2023.01.09.00.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 00:17:38 -0800 (PST)
Date: Mon, 9 Jan 2023 11:17:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Message-ID: <Y7vNna94IE6EnIZ1@kadam>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-15-kiseok.jo@irondevice.com>
 <Y7fplQ18qyhKDC44@kadam>
 <SLXP216MB0077B3BA3C18AD8F5A10F9708CFB9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <Y7lne4CN9tESjAbA@kadam>
 <SLXP216MB00778F6F7D99B56DDFBF603C8CFE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SLXP216MB00778F6F7D99B56DDFBF603C8CFE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Application <application@irondevice.com>,
 kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jan 09, 2023 at 07:33:19AM +0000, Ki-Seok Jo wrote:
> 
> >On Fri, Jan 06, 2023 at 09:55:43AM +0000, Ki-Seok Jo wrote:
> > > 
> > > Hi Dan,
> > > 
> > > I'm sorry. There was an opinion that the pach sent last time was inconvenient to look at because the entire patch aws modified at once.
> > > 
> 
> > What you should have done was just fold everything into two patches:
> > patch 1: add the driver
> > patch 2: add the device tree bindings
> 
> > Instead you did:
> > patch 1: add the driver
> > patch 2: add the device tree bindings
> > patch 3: re-write all of patch 1.
> 
> > Re-writing everything is not allowed, but it's also not necessary.  And also it is against the rules to submit broken code and fix it later.
> 
> > It's a new driver so just fix patch 1 and resend that as a v2 patch.
> > Same for the stuff I mentioned in my bug report.
> 
> > https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
> 
> > regards,
> > dan carpenter
> 
> 
> Thank you for your kindly advise. I read your report and it was very helpful.
> As I understand, I already sent it the wrong way. So I want to pick up the pieces.
> 
> First, I already sent the new driver code a few months ago.
> After that, I got several feedbacks.
> I've edit and test it. So a lot of things changed at once.
> 
> Since I changed so many things, I didn't know what to do, so I just updated it as a patch.
> It's my mistake...
> 
> So I already sent about patch 1 and 2, if I get the feedback, should I send a lot of changes as v2 patch?(not patch 3)
> For each change, should I send patch log per commit?
> 
> Like that:
> Patch 1: add the driver
> Patch 2: add the device tree bindings
> 
> (instead patch 3)
> + Patch v2 1: change 1 about feedback1
> + Patch v2 2: change 2 about feedback1
> + ...
> + Patch v2 10: change 3 about feedback1
> 
> Is it right?

No.

> 
> Or should I revise it again and send it again from v2 patch 1?
> (It's not registered with the kernel source yet..)
> Patch v2 1: add the driver (applied the feedback)
> Patch v2 2: add the device tree bindings
> 

Yes.  Revise again and resend everything as two patches.

regards,
dan carpenter

