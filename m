Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB471AB049
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 20:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EAB21663;
	Wed, 15 Apr 2020 20:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EAB21663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586973794;
	bh=lviBmEBXyPoO8ImukLlCzyJqaHikaqB07+H+6JdkSqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtYn4htH4BMYJxxoKLRCNHyxZfBm5eIWGVHJd7DxWe/vwoq1lpGOBQycwrDTghq+u
	 ORRmL2PtuzkOcPwUOSu6/wP5fxXgruYfuktrCvkBJiV4qlE+wtuc1mI2GkUE+JPNqI
	 i/2oxxd4G9qI8NCV1TtSWr10gC7exZE03V/ltqMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22D15F80229;
	Wed, 15 Apr 2020 20:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4164BF80245; Wed, 15 Apr 2020 20:01:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61BD5F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 20:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61BD5F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OWFk25m0"
Received: by mail-vs1-xe2f.google.com with SMTP id p28so417925vsg.13
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 11:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qdKLq0NZlku3Nq34ZCae+lTPN25Hf7+glYBao5E+6g8=;
 b=OWFk25m0jFOHy1KBnmjt214aFJmDmPs95Zah/DzJUnhakQvZYDlzUuZSGOhcPcvopo
 K15DpDgRLGOQsiiY/8BciP6ANfOiTpjMxUKnz9ZO4Rpn8DW+iyx5BWhHHF4AVKKlM/Ac
 Ce5hKhx6B8Kdp3Drt8ENUd0bJ3y51jYFWzi7ydSF2g39yQDreJVXgYNy22zBh1xHjcSS
 4jfGg590PdET/PX3wJ59kk73NVT+0fKCjIUK47+yZgZ16A7FZyslpXXxVCNJWw1iHUOI
 ceGtn0GTyqe0is2qCpod6XgExQ4aJnjLwl1O9O1cfli4YP7LM0Kmxr5C69xSZX3XTnmW
 r5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qdKLq0NZlku3Nq34ZCae+lTPN25Hf7+glYBao5E+6g8=;
 b=YqKjdJWspcueX3wCpSc0TybnzhPZrw/PrfMDpQ92tD2Io/iNY20NdAdwEs9/ap+6Jx
 Bkudf/EdmEZjZx5/nB3bi74T56S56HQYL63KgzG5SMfXxuGXiXY7hPE8D3tWW9APBZHE
 A6iGtMVIjy2nHhTKJnqDHndIi+Fi6j2xwWtfShr9kss4V/+jFI8JjFp9FyUxQVTnLFv0
 QQ74Ra+UIQzxMjobEB7HcledtNR4jRDYBbfmNETEwHHWdns3PRr8jjYmp4OFbrArE3Wu
 JuBT4DUq2cHSOi0sgBBMXTgaYdUqAXge3VQ78etllwp81/nKPKV+PEJJgIuM/r5RP21F
 qDag==
X-Gm-Message-State: AGi0PuYdt8DhUGP5/EcnaLGeurAduzIahtmlgmdhsygUUNEeafbFO+7S
 sPa/i2hcOV8KUW+4xk4dyaVBuZfLjYT5c9xx5kM=
X-Google-Smtp-Source: APiQypK2EQbfo5zzw73/eDYAr98lggC/KsXp1Oi2zcNkh1O83WIp+1ubTuB4STcbIgzTW6ee8DBuUooEhR9lSrxuASI=
X-Received: by 2002:a67:d00e:: with SMTP id r14mr5374891vsi.43.1586973678448; 
 Wed, 15 Apr 2020 11:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2dokvhFWfXev+JMfKnCxCPdLrFgG7xqf=8Dt5N92BPqOGKcA@mail.gmail.com>
 <efc2d79c-7d08-2d7c-9e4d-18f93b1ca302@linux.intel.com>
In-Reply-To: <efc2d79c-7d08-2d7c-9e4d-18f93b1ca302@linux.intel.com>
From: Jaime Perez <19.jaime.91@gmail.com>
Date: Wed, 15 Apr 2020 20:01:05 +0200
Message-ID: <CAM2dokt+MZrN_8=BkxXR1-c-r4yPQXSkM7vVzK6U2tNrZChdDQ@mail.gmail.com>
Subject: Re: Baytrail audio not working on next branch
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

it works

thanks!

El mi=C3=A9., 15 abr. 2020 a las 17:43, Pierre-Louis Bossart (<
pierre-louis.bossart@linux.intel.com>) escribi=C3=B3:

>
>
> On 4/15/20 5:10 AM, Jaime Perez wrote:
> > tested 20200409 20200413 20200414 tags
> >
> > maybe related issue
> >   https://bugzilla.kernel.org/show_bug.cgi?id=3D201787
>
> yes, please try the patch shared yesterday on alsa-devel, thanks!
>
> [RFC TEST] ASoC: soc-dai: revert all changes to DAI startup/shutdown
> sequence
>
>
>
