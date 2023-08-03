Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B9876F385
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 21:38:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7907520C;
	Thu,  3 Aug 2023 21:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7907520C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691091511;
	bh=P0M+BMtHtIHMTuHkmOp7SS8Q1e715kFf0lQ1SHEGD/A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V6x5MpjC9j68fr7xPWJkRCvXEGXRl4F5rUcZVUf0PBOmnFKMpX9kOPVCelUu222vm
	 lCSk0rEPxRsrnaF8VRoqgrXoainEirpz/JftzpvJjaptgYwQm7Qn2KkukbMtOiWOCK
	 HGbSdtpj4u7kq6y/U0oAphfRaV24msEhYMXOF/rQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3673F80535; Thu,  3 Aug 2023 21:37:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C4A8F801D5;
	Thu,  3 Aug 2023 21:37:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82CC5F8025A; Thu,  3 Aug 2023 21:37:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D7F0F8015B
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 21:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D7F0F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=DeJRxVk1
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 6A3EE16C004D;
	Thu,  3 Aug 2023 22:37:31 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkDLHQPYQ4Tw; Thu,  3 Aug 2023 22:37:30 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1691091450; bh=P0M+BMtHtIHMTuHkmOp7SS8Q1e715kFf0lQ1SHEGD/A=;
	h=From:To:Cc:Subject:Date:From;
	b=DeJRxVk1ZC1H6H36SbSolINpFMff0D0HNnOJOnV7f77SvoX+rdzSvN3Fjt49cXuVi
	 lLA0fOSEYKKHoudZdYDTKy5343qvDRS4eqLjgyoP6N6E4G00cISMVV9gBmzF/57s64
	 1pEbpn9nRl+AxkIXxCAbUNwe6r4iQA0S2AiClGFE=
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: <broonie@kernel.org>,
        <alsa-devel@alsa-project.org>,
        <Vijendar.Mukunda@amd.com>,
        <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	<linux-kernel@vger.kernel.org>
Subject: Regression apparently caused by commit
 088a40980efbc2c449b72f0f2c7ebd82f71d08e2 "ASoC: amd: acp: add pm ops
 support for acp pci driver"
Date: Thu, 03 Aug 2023 22:22:07 +0300
Message-ID: <87a5v8szhc.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: DO545R6C6IVPOE3WZWRZKDFF4CTHBB6R
X-Message-ID-Hash: DO545R6C6IVPOE3WZWRZKDFF4CTHBB6R
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DO545R6C6IVPOE3WZWRZKDFF4CTHBB6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I'm trying to develop a sound machine driver based on the acp legacy driver.
The first version of the driver was sent for review on the alsa mailing list this
spring: https://lore.kernel.org/all/20230320203519.20137-1-posteuca@mutex.one

I'm trying to fix some of the issues that were brought up during the review back then,
but when I ported the patches to the latest commit on the for-next
branch, I noticed a regression where I couldn't hear any sound at all.

So I started a bisect session and found that the first bad commit is:
ASoC: amd: acp: add pm ops support for acp pci driver
commit 088a40980efbc2c449b72f0f2c7ebd82f71d08e2
https://lore.kernel.org/lkml/20230622152406.3709231-11-Syed.SabaKareem@amd.com

If I revert this commit sound works as expected. So I started tinkering a little bit
with it and I believe that what happens is that the acp pci driver
enters the autosuspend state and never leaves this state at all.
I noticed this because if I increase the autosuspend delay to a much
larger value, then the sound works until that delay passes.
I added traces and I can see that when the delay expires the suspend callback snd_acp_suspend()
gets called, but the resume callback snd_acp_resume() never gets called.

I'm no expert in runtime power management (though I did read a bit on it), so I don't understand
all the things that happen underneath, but one thing that is not clear to me is who's supposed
to mark activity on this device and keep it from entering autosuspend if the user wants to play
some sound? Shouldn't there be some counterpart that calls pm_runtime_mark_last_busy() ?
I looked through the code and can't find who's calling pm_runtime_mark_last_busy().

Some help here would be welcome. Is there something missing in my machine driver code, or
is the runtime pm handling in acp pci driver wrong?
