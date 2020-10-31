Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7592A3DF4
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:47:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ACD7176E;
	Tue,  3 Nov 2020 08:46:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ACD7176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389668;
	bh=/T6viNBwqidpm/gq8SyhfpbxsE2mYwrRxNH/filv/2U=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S3xnhlf2oxR7HSEmzDG1p2hIBKOA8vY5h9gMJtyiR3ZlOvuEpS1ZbgqXxSNMieFUE
	 nTfk/VHBea24O7/b/yJbPk7QICuu8DMerJmGC0D2gPDM4jVbuGWSY+u+UxBmCrpOB9
	 vLDgD/hqdt7ogicsCeyaH370L7BXkoTbxj8EX56Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B59AAF804BC;
	Tue,  3 Nov 2020 08:45:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 025FEF8020D; Sat, 31 Oct 2020 23:25:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5559BF80147
 for <alsa-devel@alsa-project.org>; Sat, 31 Oct 2020 23:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5559BF80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="czrJ3n7X"
Received: by mail-lj1-x229.google.com with SMTP id y16so10915647ljk.1
 for <alsa-devel@alsa-project.org>; Sat, 31 Oct 2020 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=8fNklmkNr8iHyaH8smigzBzZRWGUYBMATChxKrG2KQs=;
 b=czrJ3n7XfDEi8yrSyF9x6PZvp4TWX6QgWxvhoLbr4grkzGI1yPHGUDmO2YI42h4bJo
 IqXdy5E20a2kxDCpywi9IdXKMSS4dwtFhpIci9GvYJKEUetzEPlLFyDZM3naU/EJsH4p
 crGZSq5/bpq8yfLWtwa1wCNU30N6xTx0GO+DGZQ4XhzyBNWXIWHc7E+1KI4zXLi7fS+B
 VVWv3ZCyMZRarYyRrFn+S/iuXmq+pqczImErB/cswjKoZ5/WQzPp6vM6dtFh3xkeK3Nn
 7cYfRRUzCz83EsCltNYR67gmX/S9VTQH7egY+w3hITRqCtCw4joYocXxjtz6Ckv/4gOH
 bpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=8fNklmkNr8iHyaH8smigzBzZRWGUYBMATChxKrG2KQs=;
 b=Q52PmlJBRZWqLbQF61KbYXOtcFqaZc2/YwVMHs0pcaGhAtuMDzd7RIAu8ZS++IWjs3
 I9JPZ1KZlsdcq79QQ3Jy2GVHjXzrap9IHjLAiUABYj1vIrzQFGtbpi6LF91W6kSAh6nD
 52G2WRKDcG8IxzHld6rD50Xmwtc7UeKa8YXcSKwVkGyKiY96k1pR3Oj8bb4F7gC0ODfy
 M5QLs3l6QSOyr/Pi8ccp4pyA4iHu8DTSptYNExreUO/QVwWj6KLQBu087KTeqRiT/TWK
 kof+/ATaL71nhdu9klSO3Dd395cn7P2xnKDieZcVNZAREkx6PZr6A3pQV1eVE9X5Uof7
 h0gw==
X-Gm-Message-State: AOAM53311724Ad3ZL84VZ/6h4Ko4o9TlWuGVnPWAFmlQVjMuD+JKUpBZ
 BoKMpjdLi2rsdJcoUYDa2hczHHpMvTBWv1C6
X-Google-Smtp-Source: ABdhPJyUCzj/u3ip3dbg53y8dWEo+HdFf2sTsZ/p9QnfpxNPlbg4drkeCnqehxQMwQchCKB8BhRTpA==
X-Received: by 2002:a2e:54f:: with SMTP id 76mr3540574ljf.73.1604183131856;
 Sat, 31 Oct 2020 15:25:31 -0700 (PDT)
Received: from [10.5.0.2] ([185.176.221.172])
 by smtp.gmail.com with ESMTPSA id l6sm1123690lfc.8.2020.10.31.15.25.30
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Oct 2020 15:25:31 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: Marcin Kocur <marcin2006@gmail.com>
Subject: AIM SC808
Message-ID: <761be2c5-f80b-3d46-cc64-30607724498f@gmail.com>
Date: Sat, 31 Oct 2020 23:25:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:21 +0100
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

Hello all,

I own this card since recently:

03:00.0 Audio device: C-Media Electronics Inc CM8888 [Oxygen Express]
     Subsystem: C-Media Electronics Inc HDA Controller
     Flags: bus master, fast devsel, latency 0, IRQ 31, IOMMU group 7
     Memory at fcd00000 (32-bit, non-prefetchable) [size=16K]
     Capabilities: <access denied>
     Kernel driver in use: snd_hda_intel
     Kernel modules: snd_hda_intel

and I found out it doesn't work great. Only headphone output is 
functioning, RCA line out does not (haven't checked the rest). I found 
models list in 
/usr/lib/modules/5.9.2-arch1-1/build/Documentation/sound/hd-audio/models.rst 
and tested them all using a rmmod / modprobe bash script but none of 
them seems to enable RCA output.

Windows drivers have possibility to switch between headphone and RCA 
output from manufacturer's app (there is a click sound coming from 
electronics of the card when I do this).

I never tampered with low level hardware and I'm not familiar with ALSA 
development but what I was thinking is that maybe an ALSA snd_hda_intel 
developer would be interested in receiving this card for tests?

-- 
Pozdrawiam / Greetings
Marcin Kocur █

