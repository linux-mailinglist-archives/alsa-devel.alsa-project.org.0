Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6B017492E
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 21:21:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD2516A9;
	Sat, 29 Feb 2020 21:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD2516A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583007703;
	bh=ueOaxK/zgIk/AjCqNubwBWNelE1LLH+6rfNBSXfp8KE=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NC7dmO+KkwxsbTtWP9IvUQrlDsWGfP9W7x/AHi6v6rV+PYc5Lm2kEudWU/kcyIvsc
	 tBXauCrLzXbWcZQhRrEXNVTcZc7/3zcDcrV8l04hQi9ceetgcH5GKbifaVagGPG/qm
	 ErxEKKrnfw5DwQE5ksTX+i6XQuNXHhZvprmkWmyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 174E5F80142;
	Sat, 29 Feb 2020 21:20:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37061F8013E; Sat, 29 Feb 2020 21:19:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D59E2F800C6
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 21:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D59E2F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XRyvMKme"
Received: by mail-oi1-x236.google.com with SMTP id v19so6415676oic.12
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 12:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=k2veXv48XbVfwn++UHuxC6fTvBC/lr5gppS+oTaJF2M=;
 b=XRyvMKmeaArR3qGMNGpAYWZk9PPK0PpvHQSVzwk/b/TlAcZLwraA77AQV1Oc+Dn9GV
 pH6VG3H7g8UNgJwtIs5pBDDQHUfxGFcxHFMs6Bi32SjC+eGf5yYC5/LfBawGoeRHQdmp
 l1iS9tqkTAjL1/u2jhpFvR7wY9OjPQHg/sxcwWN1SMmO/iwG7VTO7YAVl6ZGoHeAML8m
 XJiwP6syGMW+XOMKSxmku6yrJkwZaMv1qmc74mzMuk9y/JVJSfM1O6skq8N6HFM04IZE
 hlyzXqGboHGAf9d1rbpTuvzGDlQMwPoSdOU6ofgGKpTP9XHhb4CNob1oYNPSeG4SVhOA
 lq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=k2veXv48XbVfwn++UHuxC6fTvBC/lr5gppS+oTaJF2M=;
 b=NpPnRfYlE2tVXA7rpLk/QHhtRpJPjFFKeFZQABaNHabrP0yVxCR4Z/gI+EZW4bpEHE
 Rz/mzSjy7MVJrj3GpZFXKpWkMN5UDtGflGKXui728IROPcfIDCz8KvdmD/bhK+Fo2+qW
 brDAAwtDYto98UBT2KEHpi8/6BxRnp6BJifnALfBQ3sT7DOOv1/YdrFUA/CfUIPLxkFv
 pZY29d1vqxtLenv/dnqzXwQ40O4XS6JgssyEXkMS1cPRA3ZZGbYg8YsOW+AWGuEvDLl8
 5r3gh3zeg6yJl4xK0SgZ/4Bkpsw9f0O+4h3mSAM9Pgi5JZg6lTmos5nOecqM7KStGnAu
 T/yA==
X-Gm-Message-State: APjAAAUAPMBU+rLq7MFKRQg/NhOOSpS+9V+BCoIBJ6k/eN+f2scYz8Qg
 smLXEG75VmNEh+R0Son90hOudKGC
X-Google-Smtp-Source: APXvYqxczM5NuAektqAPOkWAFN8FDgKohDhztFP80AjeaPWwvK5XEFpbJi2aI0xv6AZPBG0KASa2Dg==
X-Received: by 2002:a05:6808:8fc:: with SMTP id
 d28mr7292664oic.152.1583007592162; 
 Sat, 29 Feb 2020 12:19:52 -0800 (PST)
Received: from [10.135.248.227] ([70.118.4.59])
 by smtp.googlemail.com with ESMTPSA id v14sm3161126oia.42.2020.02.29.12.19.51
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Feb 2020 12:19:51 -0800 (PST)
To: alsa-devel@alsa-project.org
From: "Thomas J. Moore" <darktjm@gmail.com>
Subject: alsa-lib 1.2.2 kills my unity3d games
Message-ID: <ef4b66db-5271-2ed4-fc8a-cdfbd45910a3@gmail.com>
Date: Sat, 29 Feb 2020 14:19:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Sorry if this has already been reported, but I only really subscribed to 
report this bug, and nothing recent in the archive jumped out at me.

Some time after Jan 12, some change in my (Gentoo Linux) system caused 
67 of my 72 commercial, closed-source unity3d games to crash on startup. 
  gdb was no help, but strace showed alsa activity before two crashes, 
and, sure enough, reverting alsa-lib to 1.2.1.2 cured it.

I bisected to this commit (5ee5ef31b "namehint: correct the @args check"):

https://git.alsa-project.org/?p=alsa-lib.git;a=blobdiff;f=src/control/namehint.c;h=4927ef973c326bef41e33b87714de87b31c1f752;hp=808df6b507336b8f6d6e618a0cfa520d62a3b4fc;hb=5ee5ef31b5ff3fb7c904054cb9cac7478a727f7c;hpb=ebdd2b6cdb8119cf75f0dd0a3b283d271b3a547e

I don't know what the exact problem is, but reverting just this commit 
was enough to make everything work again (and its later modification in 
6055f8a58 which doesn't make sense looking at the code as the function 
always returns 0 and str may still be NULL on exit, but adding a check 
for NULL str is not enough to stop unity3d from crashing).
