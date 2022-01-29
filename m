Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 471064A2B72
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 04:34:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3DE61712;
	Sat, 29 Jan 2022 04:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3DE61712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643427282;
	bh=AqS+T53oSMfTsklME5wFD2BNwcePUKud1G6jeZ5/fBc=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pD/pI944WIZmYlkIl165XqHPbwcQB6ZwfEg91gjBp28N8lUQjY1hE0gZx6tGRhdj7
	 qp8jXhHFV0yMzZMr2Xh0j4R9A0ojKO2L/4Xq1ypcZgMaGzNKCmkPm0m2UV2gacQ8AE
	 +cef5GDa/+P5+RD1J5U2GN/S6QwMvHAkHJV0n3gY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D91F80212;
	Sat, 29 Jan 2022 04:33:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7377F801F7; Sat, 29 Jan 2022 04:33:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A127F800CE
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 04:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A127F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ft1K6ec+"
Received: by mail-wr1-x434.google.com with SMTP id v13so14372288wrv.10
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 19:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=MEEV8WH7gcIBaywuZqpSloW8+fQPmSsXYorwBGkwcEQ=;
 b=ft1K6ec+bpsSUrO6sHzilNhZI5D7ygOV6cUs23pfaPUJ86HDBgX0unZVVHu1tlpSzV
 S3HLok9V9mqEFkQpws5xw3ogn4wQonCdzOjENUWOUKy8jo4+t3fYvLRvRDxuVO+D/A8n
 uVVH1VpoDrgOPq8e6nNviJBhGUMnUUFf351smOMUpH42GpfGrQUlo0HiNEt2nPCdDija
 Nq1cTeDQUAxClEhhGfdNvCub+wDMVFSBMW86P6wTCiyT0VBQQyrZ/86VMrYpRGJ/eYAN
 FSNbmr2PQVAZT2m7sVIM3lcR8LHGZiXTF1Eg54+4IXZ+i/y0eIvKSj1+PNMrNzT/eDp0
 Bv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=MEEV8WH7gcIBaywuZqpSloW8+fQPmSsXYorwBGkwcEQ=;
 b=5E6FqvZaHyiWz1rwrPo0WKTR77lJGUsB2xgs/EuORpEtKeuyqUtDNm0bFfOJy92tr4
 vS1bV/KA4dY+uwKhG8aSJlrb1WggV1THWBQjII+WmnCFpPwNOIHAgoQWdSZt1o56O6ll
 RVGQlQ3FCrpXodcAmoODaSrM6q9wngKIoKS+3EH+ZyispsLPZRLgfCpKz+C2K7e9Qelg
 HwpkWsxzkq3IBkoQvJgK6kyrJwZH1IzXbO1xBkhkK42PAs9NTibIEWvidgRg3NISNSTe
 3nxXdEJjjAWVVE3UdfH7fHIKhSVtNE+lf0QiAc3kKrc5/EgCYeDn5+7LIo+4oqX0CS2h
 skWQ==
X-Gm-Message-State: AOAM532dOQKFDo07mfNkxLHVnd8WxvAyA4fU7Xn4+LlrxRWM2c5lIVEB
 b1j1Hy/yJs4q1b0geyLNglI=
X-Google-Smtp-Source: ABdhPJyiMDc7MH6tbWAjV3Be75ZoFQZE5hbcKQdm0LjQKmgM7IzYGTiitEr0vIiW8lRjpb0lPUKvKQ==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr9289806wrs.626.1643427210591; 
 Fri, 28 Jan 2022 19:33:30 -0800 (PST)
Received: from [10.96.0.6] ([85.203.46.187])
 by smtp.gmail.com with ESMTPSA id j19sm3551042wmq.17.2022.01.28.19.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 19:33:30 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] ALSA: core: possible deadlock involving waiting and locking
 operations
To: perex@perex.cz, tiwai@suse.com, broonie@kernel.org, o-takashi@sakamocchi.jp
Message-ID: <56766037-972e-9e5b-74c1-88633a72a77f@gmail.com>
Date: Sat, 29 Jan 2022 11:33:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel <linux-kernel@vger.kernel.org>
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

Hello,

My static analysis tool reports a possible deadlock in the sound driver 
in Linux 5.10:

snd_card_disconnect_sync()
   spin_lock_irq(&card->files_lock); --> Line 461 (Lock A)
   wait_event_lock_irq(card->remove_sleep, ...); --> Line 462 (Wait X)
   spin_unlock_irq(&card->files_lock); --> Line 465 (Unlock A)

snd_hwdep_release()
   mutex_lock(&hw->open_mutex); --> Line 152 (Lock B)
   mutex_unlock(&hw->open_mutex); --> Line 157 (Unlock B)
   snd_card_file_remove()
     wake_up_all(&card->remove_sleep); --> Line 976 (Wake X)

snd_hwdep_open()
   mutex_lock(&hw->open_mutex); --> Line 95 (Lock B)
   snd_card_file_add()
     spin_lock(&card->files_lock); --> Line 932 (Lock A)
     spin_unlock(&card->files_lock); --> Line 940 (Unlock A)
   mutex_unlock(&hw->open_mutex); --> Line 139 (Unlock B)

When snd_card_disconnect_sync() is executed, "Wait X" is performed by 
holding "Lock A". If snd_hwdep_open() is executed at this time, it holds 
"Lock B" and then waits for acquiring "Lock A". If snd_hwdep_release() 
is executed at this time, it waits for acquiring "Lock B", and thus 
"Wake X" cannot be performed to wake up "Wait X" in 
snd_card_disconnect_sync(), causing a possible deadlock.

I am not quite sure whether this possible problem is real and how to fix 
it if it is real.
Any feedback would be appreciated, thanks :)


Best wishes,
Jia-Ju Bai
