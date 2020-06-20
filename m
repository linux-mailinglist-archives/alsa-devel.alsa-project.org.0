Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 544FF206E49
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 09:54:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 037B7180E;
	Wed, 24 Jun 2020 09:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 037B7180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592985263;
	bh=kEI3MPhdGjtCCZkN6b4lMBSssOj+LqMPhRiP0ncGROI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JFP1jKqhryf4sxAsZ7MaDlnU8y3bw5XHIkt4xOgxv8NAsGbr/rZ+iOMDdY1HIPZcN
	 VDx27xxP1lR39/XZJ/VkWjWZzNhs4DyPwGyz+U47E+Y2Snd2R/lqzqInK744BK/S0R
	 GfO2sU7zSkBOXUomLYpQirCqgs4k/KBX6Ic6r4v8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C9CF802F7;
	Wed, 24 Jun 2020 09:49:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ED59F80171; Sun, 21 Jun 2020 01:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4295F8015F
 for <alsa-devel@alsa-project.org>; Sun, 21 Jun 2020 01:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4295F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uFdI1+Pe"
Received: by mail-wr1-x433.google.com with SMTP id c3so13126496wru.12
 for <alsa-devel@alsa-project.org>; Sat, 20 Jun 2020 16:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6LhEEhgpcAFiDBeQKlOKrseC2xjCp8TaMjb0OXWCG9o=;
 b=uFdI1+Pe7b8U7y8DrVaINzXsTQSSkgu4A0qjF0jWWtHBmhoQQYcwu1fAoWSY9EFSRL
 Gf5/DoVTlHF/vePUNQ+LIbhn4YoNANiDbj/x4Y/rDgvYZWUcJCJLyfiDCdByyac6zANh
 FVdSBLww4ZU41lDt3z8XAfgrergt18YrgxjW3L5ZQKWidpVKRS1VY7PVt5WOHYlRQKhJ
 81kb6Fmiq3xSR/bApAw+njmIxWT6bAn55tmtGAwuui9Dj/pGlLWqqMwDtFvHPIqX3g9i
 CYZGPStI04+Sxspcx6MYbQ+oRL9Vxx6gJdiqK12+KX3XK/A3r86CTXfY/MbC8XRJSu7n
 J2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6LhEEhgpcAFiDBeQKlOKrseC2xjCp8TaMjb0OXWCG9o=;
 b=YsCMcjyqZR9fOZW+j18YTtwRwOr0x49Dqw2ORI+vnAxUx3X0s8C9VhvSvDb/Ie8Op6
 Zrq8Ym7j0nAA6NwdlCCPEVBgplSKnM8/C4oBouxWAn4IV0jr/BGwJuIwxdcZJAfSMZnW
 OA+9EGtiO0Rc5wMYbjFvYceizez3effDdgfRHQHF/gfwxPg2VlWdPw6amgp5l7Gln5co
 536Z6tG1XwKEqYWp24aoJBV8K+Ggt0bTlEYZ2xRyy02tmCe+/ZWS7qqwYo/Bwh6ej9kj
 jiYPN3OVXnu7vouR7RLh+JVMPoIXs+DaeqqHoRUB5o7IwS59cavTDHCpP5bE54KCEzFn
 Fxkg==
X-Gm-Message-State: AOAM530EFHhihI9Ojya6y3BsocTuIrmZlqFLfkBXhVdnP56aZGbQF4VW
 yGs5ha6V2EisCILf0iGE5KqbuL9v
X-Google-Smtp-Source: ABdhPJw4mF+ln5Pkrbt/ITWjK8S+lTxiAD13KBnzBxlXCK34Flzv81HJl+4+ratzsnEKhPo86YNNrQ==
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr11623657wru.95.1592695665228; 
 Sat, 20 Jun 2020 16:27:45 -0700 (PDT)
Received: from gluon.localnet
 (dynamic-2a01-0c23-600b-8e00-5d74-c836-985e-9f5d.c23.pool.telefonica.de.
 [2a01:c23:600b:8e00:5d74:c836:985e:9f5d])
 by smtp.gmail.com with ESMTPSA id 1sm7338126wmf.0.2020.06.20.16.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 16:27:44 -0700 (PDT)
From: Stanislav Kazmin <stas.kazmin@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [HDAudio][ALC295] speakers not working on Acer Travelmate P614
Date: Sun, 21 Jun 2020 01:27:43 +0200
Message-ID: <37040493.jCPR9rdWe6@gluon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Wed, 24 Jun 2020 09:49:30 +0200
Cc: tiwai@suse.de
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

Hello, I have the following problem on my Acer TravelMate P614-51T-G2:

I have all the audio sinks correctly identified (like HDMI, DMic, Headphones) 
but the internal speakers do not produce any sound.

What I have tried so far:

- hard/soft shutdown on Windows and reboot
- disable/re-enable speakers and microphone in BIOS
- uninstall pulseaudio and test alsa alone (so it is defeitely **not** a 
pulseaudio issue)
- switch from sof-hda-dsp to snd-hda-intel driver (without Dmic support)
- retask pins 0x14, 0x16, 0x1b to "Internal Speakers" through hdajackretask 
(only basic, without advanced features)
- removed/reconnected the headphones

`alsamixer` shows all needed sinks and nothing is muted.

I already discussed the issue at sof github https://github.com/thesofproject/
sof/issues/3058 but since the same issue occurs on `snd-hda-intel` legacy 
river, I was advised to communicate with alsa-devel team.

The alsa-info.sh result are linked at http://alsa-project.org/db/?
f=252f92c7a1df3c755d16ee69353b26d2535a4d81

I have tested the kernel 5.8-rc1 but it does not make any difference.

Let me know if I can do anything else to test the issue. 






