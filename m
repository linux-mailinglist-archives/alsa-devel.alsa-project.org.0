Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449365D684
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 15:49:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 288B4B4CC;
	Wed,  4 Jan 2023 15:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 288B4B4CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672843744;
	bh=09wTvcxHTmmniui+CQCQ60L025woUIgSOa72R2fQfjY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HoGF0pXeF7t+w7pEL5psTBjYgtYqo/cGhFcLh0EZmVVoxlFojtqEWNFzWwcRqAs2R
	 wfJBqylKOinWa3dFLq0PWppd1Ba/kdan77BkrfSpvyQwQtD2V9GwJWXl+BQ0oUcQ6w
	 6GQXAzx9TTqSnEFjGMxVRm/R2sOcSGqKpMceF+xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12FA9F8024E;
	Wed,  4 Jan 2023 15:48:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08F5FF80238; Wed,  4 Jan 2023 15:48:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA766F80238
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 15:48:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA766F80238
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=cyVTpqqB
Received: by mail-ot1-x32c.google.com with SMTP id
 k44-20020a9d19af000000b00683e176ab01so15946842otk.13
 for <alsa-devel@alsa-project.org>; Wed, 04 Jan 2023 06:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s4IRr68MatcS5enSJ+4EyfBihOdqulU9DD8OJv71rX0=;
 b=cyVTpqqBgR+DLc3/b4X7pbrsHIhFZ8b9/sb8OvVJZj421M6qv+O/7IAMBY2Y3PasKp
 e/NFl+Yy9J+l03eMBeZEeMN0tVFqSP0IiC4kWCz+0CZbqM9VflKNLj+rI2TvfccAcAfd
 0gXxpj0+upTyhKN0znkURqxfLQEWxYp6Kmg64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s4IRr68MatcS5enSJ+4EyfBihOdqulU9DD8OJv71rX0=;
 b=7DE6KxoyuLuPNedXd33JV7PbNQcWFeqztO18WKf0CdM7EarR3rGEEnA2//0fXKc/Rg
 oiVb/r9Ewpmso29lMMw827FhqvxpfJnSCoKRSgtPzc9m2Wpzps7CrJfmBpMb/Ec//ATN
 d/VkczjoasYH37IQeoTQoGjwX3ZMtjZQeAqKZm4S/zaUsXAIIAtDNnD5A2JgY8ocwggM
 KdVfq5kTbkyoPPzU8/eqaRH/Q0nPu/NDJDkqhoTo5Ff83q7xpLpdGrEJF1SldM1v3GtQ
 fPAX2MunbpyOnhOnhwDB7bm9nQhEgGHpgGtoJlK2QfXJnOgt4zRIYE0sMy7JJojGTNkM
 icog==
X-Gm-Message-State: AFqh2kryMmtLaDcH3qaSZGuveDevK4DZPEcWW18OInsI9DSln8NPTxyv
 lHSi2OWjRpSgf28vqdsyjdvuTF6mIV4TARCVqId3wQ==
X-Google-Smtp-Source: AMrXdXv73rNorkMl6cG0cOQ7nvMTlCtZinuYWTFUsuzOa7bcFehB5DdMFB01EPykptneOgFz3/6BlqeBf0Gjl0o3V74=
X-Received: by 2002:a05:6830:1c8:b0:66e:b992:749f with SMTP id
 r8-20020a05683001c800b0066eb992749fmr2595450ota.52.1672843686199; Wed, 04 Jan
 2023 06:48:06 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
 <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
 <878rijr6dz.wl-tiwai@suse.de>
 <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
 <87zgazppuc.wl-tiwai@suse.de>
 <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
 <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
 <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
 <CAC2975Jw63j26DhvDjiLc7dXwaRz=eK0aWNuErQ8dkEn_Gemjg@mail.gmail.com>
 <87ilhmpvdt.wl-tiwai@suse.de>
 <CAC2975LFWnK6f05j5my4=ebmhS0bVhigz8VH6cbaUtVT+ADxbA@mail.gmail.com>
 <87zgaymkcx.wl-tiwai@suse.de>
In-Reply-To: <87zgaymkcx.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Thu, 5 Jan 2023 01:47:29 +1100
Message-ID: <CAC2975LK6xuQ_PaD9vk_5Uwi4ZmZa30TZKfstyAhx2tv0YU9xQ@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 5 Jan 2023 at 01:42, Takashi Iwai <tiwai@suse.de> wrote:
fb425e1121ceef2b9d1b3ffccc195d55707
>
> Oh, did you test with 6.2-rc?  I checked the reverts only on top of
> the 6.1.0.  From there, you can revert all mentioned commits cleanly
> and should build.
>

I was basing everything on 6.1.2

> In anyway, do I understand correctly that the bug still persists at
> the revert of the commit 2be79d58645465351af5320eb14c70a94724c5ef, and
> it's fixed by the revert of ac5e2fb425e1121ceef2b9d1b3ffccc195d55707?

Yes that is correct.

>
> If so, what happens if you revert only
> ac5e2fb425e1121ceef2b9d1b3ffccc195d55707?
>

I just tested this, and that also fixes the issue.

--
Michael
