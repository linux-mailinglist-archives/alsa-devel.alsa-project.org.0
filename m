Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 913523D48E8
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jul 2021 19:32:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAE2D1762;
	Sat, 24 Jul 2021 19:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAE2D1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627147962;
	bh=5aiJli+yb++e2/swnQDP5tZgP2Y6hc+qnbm1PHQcHTY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TrwE6NpFOFBVpgp+RfsOThKx3kvUMf2wNsWlDoGP9S3vfN3E6PkeY1yCOkBH3EBoc
	 b6JONJYl6BzDElYNaYi4ADwhPJArYdAC8AW2g1+ZfBRPdsaYo/Ck2yjUyY4i2/wgHw
	 +c11EBnB/aZmlvN/qBrEb4upU6C8jKe9tp17LBI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 704BFF80227;
	Sat, 24 Jul 2021 19:31:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F455F80227; Sat, 24 Jul 2021 19:31:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96840F80086
 for <alsa-devel@alsa-project.org>; Sat, 24 Jul 2021 19:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96840F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ePQ10tzs"
Received: by mail-qt1-x82e.google.com with SMTP id t18so3925907qta.8
 for <alsa-devel@alsa-project.org>; Sat, 24 Jul 2021 10:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5aiJli+yb++e2/swnQDP5tZgP2Y6hc+qnbm1PHQcHTY=;
 b=ePQ10tzs3Odaa4hWd7pTBGU0KUaRRl7h85Mvi+7PIazLuTetV1/AT9yw/np8yRPiEA
 8OYyI2y7ApruXQPBWfPPQ4CwiiHqJbU3skiEa+opxcvGPvGKcZEFk8cZLiuB+I0nj3jC
 7xgsUQ+69y4lKsZJuFlX5LqojC02kC/jEyMG4xVq5ltnAlR78ZtyPBWzitccA5F3YWNx
 uz0EXox5fUvaHvg/yptEWrVvi/FWXA/Rc9J1Mf6WOXeMJOyGyx4bOHu1eP404NM+FxRH
 Xx65yAwdwnIq1ESUR2aA8uqpL+R7e/pmji+zKPUT0fxbyVKO8ckC+djF1a0wXcCWTKw2
 QfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5aiJli+yb++e2/swnQDP5tZgP2Y6hc+qnbm1PHQcHTY=;
 b=g9WhCK1VPV7uz+S8zRX/1ttEWu2f2x+5rUT4SUNBFrsvNvj2I3CJF/3Yh6Ln/FcUOQ
 7jBwK4I7yxWPwtjLfAYRnq+hz0nSuggo7vbldeJAET7uWP88j9Y8t2EirUGV48eTjHf9
 XZ4sEVvSw0OF5f5KrotMCwS+K3rXYx/ONupKqVFycMWCE+nEa7WPH4u4YyA4qWDUbczG
 WLAovjQyVzBeQW/1L+kNw8w+j/dbNMBqoxyj/bAmjASwZk6v3IAV4od1TMgs9HxujVIh
 PwcVejE5vMfy7qqZN5Cg63elEERt2Zx1zEhMBqHN3ygpC5WUjAgwZplu0b1i23r3Cwwt
 Nu+w==
X-Gm-Message-State: AOAM531N7/E6d42Y/Lptjh9VG/lf0EM+k8LWdlvfOboTKl8M+lgzTQoR
 PGGfNErdxtp2MQtYxlUz1kejXn/Q3UjMQvtFBOw=
X-Google-Smtp-Source: ABdhPJzRWZ/ZpgT4Bio2AjPpi7ukJ3Iz7D9UKX05DWnNdP82n7Uj15hYEcJDWeTN6Tzv+xIwb2Lmhy1gcCNSN8wIvn4=
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr8588455qtc.229.1627147859062; 
 Sat, 24 Jul 2021 10:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR11MB4441DD575A3395FC92D4AB1BB3E39@DM6PR11MB4441.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB4441DD575A3395FC92D4AB1BB3E39@DM6PR11MB4441.namprd11.prod.outlook.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 24 Jul 2021 14:30:51 +0000
Message-ID: <CAEsQvcv-6Yzoy_2YvcjrZ8EL0moMtUV7eXbfp-LDYb1fe4X+bw@mail.gmail.com>
Subject: Re: Trying to debug in issue in my code
To: "samiam moorecad.com" <samiam@moorecad.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On Sat, Jul 24, 2021 at 8:58 AM samiam moorecad.com <samiam@moorecad.com> wrote:
>
> Hi, I am trying to debug an issue in my code, and want to gain a bit more visibility on the issue.

Hello, Scott!

> I gather that the target routine of the crash, alsa_lib_resampler_process_int(), is in the alsa-plugins module, so I downloaded alsa-plugins-1.2.5
> just so I could gain some insight into what the code is doing when it crashes. I should state quickly here that I believe the crash is my fault,
> but I am just trying to figure out why it is happening.
>
> I was unable to find the routine alsa_lib_resampler_process_int() in that package. Also a ./configure followed by make does not
> work on it (goes to the idea of substituting my own compiled .so for debug purposes):
>
> /home/samiam/projects/alsa/alsa-plugins-1.2.5/usb_stream/pcm_usb_stream.c:480: undefined reference to `snd_config_get_card'

snd_config_get_card is a new function in alsa-lib 1.2.5 and you're
probably linking against an old version of alsa-lib which won't work!
See: https://www.alsa-project.org/wiki/Changes_v1.2.4_v1.2.5

>
> Although obviously I didn't put a lot of effort into making it work.
>
> DId the routine alsa_lib_resampler_process_int() get eliminated in later editions of the plugins? or am I looking in the wrong
> place?

See https://github.com/alsa-project/alsa-plugins/blob/master/pph/speex_resampler.h
and https://github.com/alsa-project/alsa-plugins/blob/3bd62394e75835df5dd0a9874c70213cdf72757d/pph/Makefile.am#L20
From my understanding of that code, it renames
speex_resampler_process_int to alsa_lib_resampler_process_int to avoid
symbol name clashes.

Regards,
Geraldo Nascimento
