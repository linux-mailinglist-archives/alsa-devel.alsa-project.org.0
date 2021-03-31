Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08C35088F
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 22:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2813A166D;
	Wed, 31 Mar 2021 22:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2813A166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617224149;
	bh=yJBlYP34YdXMuOTHAeXct8VLKxId/g65XDDJG/wkC0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHbmZjixXGbjyZXwkDQHdku1hGuoL/N3Dqvh1oSHZSmChMDF52nVoyww2GNuR2Ug5
	 AVjh8JvJuNd9AwxawwyilkFCy39xWXB3BDdRMrWhD/cNHQY+hMjaTjeWEBSUy/foPt
	 lU74GIl8ofyd7LBhCbm0vU83kip2uvtuIdMO5LjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D1F8F8016E;
	Wed, 31 Mar 2021 22:54:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1E5EF8015A; Wed, 31 Mar 2021 22:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3A84F8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 22:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3A84F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZD2HX7dp"
Received: by mail-qk1-x734.google.com with SMTP id o5so228375qkb.0
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 13:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7oCy1w6QqRWAMLLlHq52FiMuYDq9rGNxpWfkayieEM4=;
 b=ZD2HX7dpuoZH2EBGwdeGihh8VlDGecLXpe/fVZsYYBbdGJdSHjyrMrU/it2siQ6I4l
 O92WJ8+WiQJkfzk98tkGPl89Q834DnXu0+uYNfy8geyahJgEoMkHTUKMWELA8n8tG+qi
 2M5FhNCSmk5i5C81nx0CD93YHERmARVSx/hOp/lF6OQYHRthhMB2iv+Wj+/F2hqRtW/w
 P4S8Ee5xcUuRe7eMYy1cEQT5WuXqe673RFAeSyg0tnvyMNn8gCYaw7YZ0JTdDINOtJ56
 9gQZUjYJQExVTgOGVDtjXp95aMSO6+KwM/2Ki1remkEjE/W4TUacNTpg/6vuxprLkaiy
 1PoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7oCy1w6QqRWAMLLlHq52FiMuYDq9rGNxpWfkayieEM4=;
 b=L4WhLhNJZVjiIVLYpCUz3k3peTDaOxkn6ukxMiICPw/guNI9eSTnxRKrkCladzxXjE
 TE16t03hn+d1DUz0NOWwMFNaGh6ub9Uqiv/VZ6p9o5YnK7RpHeBpZ65gMwQNXeIBlkwV
 qQGUqTRdaLuyeEYiFsbknUCaIuHCMgF3M94KHMujf649Q8A3bX+QdfvtDIj0+frPiEbS
 KBnBJpNJZmWomsf/EoHmiUKjOvd32hZHG25xrZNoynOWFgwccwqxKMRwDUQZQ4tnPMIE
 KkHsTZlb0EcDCw5WWvRmNi6Y0xACqa6ooo/mG2WvgRVbuHddpPQ1PLaawBaRT7j0bQiU
 aBqA==
X-Gm-Message-State: AOAM531YSoLYZofY/JPaTnLPkTk0WfhX0HaepIQTFtvS6qAYDmUcNO14
 kocqay47/+gq+xeg9W97nRCLBKgnII2avJn1mRU=
X-Google-Smtp-Source: ABdhPJy5qsL08BvT8qxhe8JUcNPH7QibgSfvkQgiy2aYUh+Vl2iZ3YY/VK79RFLjzdQ5x4Sx4pZC1JYz7c385mscTiw=
X-Received: by 2002:a05:620a:10a6:: with SMTP id
 h6mr5144947qkk.366.1617224049165; 
 Wed, 31 Mar 2021 13:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsVg8oCOSHrqx_7rU_KAYugOaYxmJ1vLvrS_wAah0VKFVZ05w@mail.gmail.com>
 <CAEsQvcuTb_3meXw-X08v1MduNpCA3xA6SXq-ezuJrcC7tP+faw@mail.gmail.com>
 <CAOsVg8rE8772qnGAHwFuK4+A9QA-AcDqAH4PkLJJf2GH3tmiVQ@mail.gmail.com>
In-Reply-To: <CAOsVg8rE8772qnGAHwFuK4+A9QA-AcDqAH4PkLJJf2GH3tmiVQ@mail.gmail.com>
From: Geraldo <geraldogabriel@gmail.com>
Date: Wed, 31 Mar 2021 17:58:47 -0300
Message-ID: <CAEsQvcvjf-o7x8t06cCB3hwMNXZYf=xJWsbnGdTmt=CXP2HJQA@mail.gmail.com>
Subject: Re: [PATCH] Fixing most Roland-related devices' USB audio
To: Lucas <jaffa225man@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

OK, as for styling and standards your code LGTM but I'm not the Maintainers
:-) and they may be hesitant to add code for untested devices.

I found myself in a similar situation to you. I was hesitant to join
alsa-devel because of the volume but I thought I may give it a try, maybe
there will be testers for my patch there.

But nope, no beta-testers here. We might have to try other open forums
other than alsa-devel

Em Qua, 31 de mar de 2021 14:49, Lucas <jaffa225man@gmail.com> escreveu:

> Thanks Geraldo, I'll consider that.  I am fairly certain that this patch
> won't make matters worse for anyone, because applying it to the VG-99
> (which apparently doesn't need it), proved that it works fine with or
> without the patch.  Then, again, there may be similar code for the VG-99
> always in use, specific to just it.  I could try it with my UA-4FX to see
> if it continues working...  Thanks for the pointers!
>
> On Wed, Mar 31, 2021 at 11:45 AM Geraldo <geraldogabriel@gmail.com> wrote:
>
>> Lucas, you can always email the maintainers if you're 100% sure this
>> patch will work for everybody etc., just be sure to read
>> /usr/src/linux/MAINTAINERS first.
>>
>
