Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0BB31ADA6
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Feb 2021 20:04:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E05816A8;
	Sat, 13 Feb 2021 20:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E05816A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613243049;
	bh=hJCxOzsBAtSkblsT/YIOieRg+F36SSwIPXatrZFK/ns=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jg51VrZQXd0lm2fcJ/zmXpjSZo0uRw3JBxP56B1EaOSgvnG7pNy3zU98p8uypC4lA
	 U3vI2gXvTPY2BF1ZVoEvEese0VNbNWzZNHKJsDytNjUQx5NXH7NKQbTNn679cYAAFF
	 ovnImKOp7NgEq0EoPKWyxMHPpYSsSHqJGnsFbyyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9096AF800F0;
	Sat, 13 Feb 2021 20:02:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C661EF801D5; Sat, 13 Feb 2021 20:02:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43DF3F80087
 for <alsa-devel@alsa-project.org>; Sat, 13 Feb 2021 20:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43DF3F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=izotope.com header.i=@izotope.com
 header.b="a1YG0Pvk"
Received: by mail-lf1-x135.google.com with SMTP id v5so4309468lft.13
 for <alsa-devel@alsa-project.org>; Sat, 13 Feb 2021 11:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=izotope.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=51eRBltOVNHL92G3weDICUbgo0MLN4yygREnAhajsac=;
 b=a1YG0PvkjkRGHJcJuoUx3Jzfxb3Wc/6QZzBS+Qu/eqKEpe+1O2ErW4IDb5/yRHPl7h
 thjoMmsya1zzbpttBVgk6OfNmrdbESWryFTV+UfrQkQYzpXt5VJH4ivky8xSMygs7VxT
 jxF4MeEMUNGAfJWFLoVPKRcsyV/hxFWm9d0e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=51eRBltOVNHL92G3weDICUbgo0MLN4yygREnAhajsac=;
 b=a+sz8s6+FHO2rGOoDciI8t0/DOZMYnr2tC1tTac0imSxKwA0XQ0noHngp5ssf9aP99
 G7n7ZXrKB0/ibmZl83DmcfFsXpC75aJwl+3/uvi0c5366IvTux6OB0KajCgVjXYbHOh5
 n+ePOql1SS9o0SK6tcfGheXXRET/OM4eroW6pDQOMh6aYpOhswPMOpqujLApEokBKzxH
 SfAsAexHjh3jclmHZy6eIToTkxXGiFP49GPJik+YrQuBtKTydQP3+S3YdCSE4pYAIXvL
 C4Owo6pnEKYpiCH66gaeo4vRSceMcKkgFMnQ6pyGjW6tkHPiLriexFDtQeK6X7ZQAn3u
 FLgA==
X-Gm-Message-State: AOAM530K0iUeDlk33W+IEynV+bhaKswlYry8M5ZFQ8E+NgKCq/6DpvGg
 o7p1k8u0Fd7kW5FLe14WN6iQ85sLaVVBLn/C/zHdlwXcyVTHVA==
X-Google-Smtp-Source: ABdhPJykZ7aXknOPaiqgP3h6BnIz0tEsYwMzvHHOj+BtWGd7T1B8TO7INMjeIjxoFUyLgtqt7d22v3TxPFrG9d/db+g=
X-Received: by 2002:ac2:43d6:: with SMTP id u22mr4368109lfl.247.1613242945152; 
 Sat, 13 Feb 2021 11:02:25 -0800 (PST)
MIME-Version: 1.0
From: Matt Campbell <mcampbell@izotope.com>
Date: Sat, 13 Feb 2021 14:02:13 -0500
Message-ID: <CAMDowVUiR4TN9pthhpQzy+Z+MVRR8t9T3vb5r+nsdVCeFpOmeA@mail.gmail.com>
Subject: mixer controls not updating when changed in another process for ASoC
 aux devices
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

I am using the snd-soc-simple-card driver to glue together a DAI, Codec,
and a few aux devices that have custom drivers for pre-amp control. When I
have two instances of alsamixer open and change the output control (a
control  that is part of the main Codec driver) that change immediately
shows in the second instance of alsamixer. However, when changing any of
the controls that come from an aux device, these changes do not show up in
the second instance. Exiting and re-launching the second alsamixer will
then show the changes. I would expect these controls to behave the same as
the main codec master output level with immediate update in all instances.

I'm speculating that the aux devices might be treated differently in a way
that is causing the unexpected behavior. I haven't been able to identify
anything through a few hours of code inspection, but I'm far from an expert
on the internals of ASoC. I'm hoping someone on this list might be able to
confirm or deny that suspicion and possibly help me get to the bottom of
this.

 A few other possibly relevant details:
* This happens both with snd-soc-simple-driver and a different custom
in-house platform driver that uses aux devs.
* I am on an older version of the kernel (4.14.2). I scanned logs between
the head of master and that version for ASoC changes and nothing popped out
to me as relevant.
* The aux dev causing this is an in-house driver for the THAT 5xx3 series
of pre-amplifier controller that we intend to upstream. I'm happy to share
code from that if it helps.

Best,
~Matt
-- 
Matthew Campbell
Principal Engineer
mcampbell@izotope.com

iZotope, Inc.
www.izotope.com
