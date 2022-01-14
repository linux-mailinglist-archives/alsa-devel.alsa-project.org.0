Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C14D148E304
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 04:42:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E3D01FCB;
	Fri, 14 Jan 2022 04:41:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E3D01FCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642131760;
	bh=vWr9BA0ImIREzKlRnss3glkwXVJXZDkWpPs4w/sklEw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txiYbno18IMXf8Es4QvgPuzR1gdIEy/Ec8B2itDrPpTvHs4TnlnmYqdmwak8tAZmm
	 gAJia0Vzpr+swWo2If4FEG1kCmkWvCENE8u7t9lz0ogDsQrxvYsHguyPunfKzvQq76
	 7iIoaxp2EIQk9NRXtOzPv5uf7836eFVe7y0YxuGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC491F80310;
	Fri, 14 Jan 2022 04:41:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA7AFF8030F; Fri, 14 Jan 2022 04:41:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 804BDF80054
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 04:41:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 804BDF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GqnD7fVw"
Received: by mail-oi1-x229.google.com with SMTP id i9so10665633oih.4
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 19:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3vuHmubA7NBDeSjuXqC7P1p+i2CcuSRvh/FPtVKp0pY=;
 b=GqnD7fVw9W41GxxUp3bF++kIKya9l5a7Fpbf57Pc8XwClyzYQCTttqF0280Xi4OzhM
 9Ecn075NqTNl9hgrfW9mAPubg0nBTgZwkjbbmr4o76XnfTqsMVw/GxO86no3GLrMZ5MM
 hDUfBERoy7Fa5q9z4nUWUnSovOIJHlue8tdf1Ex5HQYHZL7jh2ANB/PGwbD/L3dbU03Y
 6LkDrfhBoqANlSdU8ezFmnP6QnGWqFGq/ddRYz9FIqxkvaxzS+RN5ODEPmg/jw2tqLnp
 WgHJh+UjKTo/aheI6hLeyrNQbADAV3+q+DeG+i6i+Pbxg1H39s7X91vc0CzV+jFoIG0C
 jKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3vuHmubA7NBDeSjuXqC7P1p+i2CcuSRvh/FPtVKp0pY=;
 b=6h/OOptK4ZySqfbg2sjUxzQ0h1iH7Yqbe6MxQWY1bjr86oZUqGaom0TUd+jbL9Mpcr
 uf+PXJ/1pK03/7KfWO1TkKtwASGXovWGUsvbpte2Ey/u3MVlB2zPX35HWdjEmGwCvZ13
 PHc0tZXyvBw68PlTo/phiFwGfxp7G2NNhilt6gORFUy2gA9x3a6sj95ZbNgZIqFY9zEm
 Rma7qfEElfDZ2xAhykC8aOQCQdgJ+Higk1tD8xNqt3kUPVuTDr2KhqcRDvo3Es1qh/rv
 zlE9mPrDuM7ppOQRsboMY70xQQhUNAl4PgpVPVpVdsa7MYPS4e2RQKkZRbOYZBp5cKBA
 KtVQ==
X-Gm-Message-State: AOAM533mlCv60BuQrMsYCYB8Y1xAL5IkP1P25xD7szgeAoh8nZ5Knke2
 AmpRoYZojaCZv2toQy5mAOk=
X-Google-Smtp-Source: ABdhPJxTlLkJdl9K7Pkuosn/X5g4m0DOXhzwkeSHpitLYWIZBNMgTs/ahKTbvmRl7AS7RMTVvSgnxA==
X-Received: by 2002:a54:481a:: with SMTP id j26mr5749807oij.143.1642131684146; 
 Thu, 13 Jan 2022 19:41:24 -0800 (PST)
Received: from geday ([2804:7f2:8002:f237:d475:1acd:9c67:d4cd])
 by smtp.gmail.com with ESMTPSA id b24sm1196233oti.68.2022.01.13.19.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 19:41:23 -0800 (PST)
Date: Fri, 14 Jan 2022 00:41:39 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Nandakumar Edamana <nandakumar@nandakumar.co.in>
Subject: Re: Behringer UMC202HD issues and a partial solution
Message-ID: <YeDw89KZOh4yG7c8@geday>
References: <d61a41eb-a820-b1ca-dcf6-f447f80494a8@nandakumar.co.in>
 <YeB2zEnPlwVEKbTI@geday>
 <e1a7d67d-9862-3085-4e01-091ca443d2df@nandakumar.co.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a7d67d-9862-3085-4e01-091ca443d2df@nandakumar.co.in>
Cc: alsa-devel@alsa-project.org
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

On Fri, Jan 14, 2022 at 08:04:08AM +0530, Nandakumar Edamana wrote:
> Thank you very much for the kind reply.
> 
> > You made the dmesg warning go away, but that didn't necessarily solve
> > the underlying issue. May I ask that you post the "lsusb -v -d
> > 1397:0507" ?
> 
> Here it is, connected to a USB 2.0 port (xHCI still enabled).
>

Thanks, Nandakumar!

Have you tried unloading the snd-usb-audio module and the reloading it
with implicit_fb=1 as in "modprobe -r snd-usb-audio" and "modprobe
snd-usb-audio implicit_fb=1" ?

If not, try it. If it works and your playback issues are gone then
your device may just need a quirk. If it doesn't work we still
have dyndbg to go through.

Last but not least, please use a vanilla kernel for these tests.

Thank you,
Geraldo Nascimento
