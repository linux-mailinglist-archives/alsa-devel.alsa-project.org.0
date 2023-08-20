Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E57781D2C
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 11:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC5A43E8;
	Sun, 20 Aug 2023 11:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC5A43E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692524070;
	bh=kDnTcqSTQdlLHPpQOf5RRj+TVFls2LmJQQQrfzPriCk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p7KB1AnqIDybISaryppJQkMIFnwA7yA9RbIqITaBbaZj+Hw/LypCsp+uos7L6YhPN
	 jbUJxFtOmjIJOa4IQ/1d6zQjiR9aUK+P/8GoRAwdQ1c0DhjwcVetrBOWQEWiOI2IMW
	 dYdW7eczlBXYw1Rxigao4TTLqmkraZPi5gRLypUk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 484C5F800F8; Sun, 20 Aug 2023 11:33:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E44EF800F8;
	Sun, 20 Aug 2023 11:33:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD072F80199; Sun, 20 Aug 2023 11:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61CAEF80027
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 11:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61CAEF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=fViGGRzX
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 8074516C004A;
	Sun, 20 Aug 2023 12:32:56 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVhDgEjmY7wN; Sun, 20 Aug 2023 12:32:55 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1692523975; bh=kDnTcqSTQdlLHPpQOf5RRj+TVFls2LmJQQQrfzPriCk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fViGGRzXCd7v5DsOstN+pqTrYAkAg0Mae2L6QgAcM8zUeelBB64Kq3LLNCcKY4Wug
	 0J76mfBHwpyBXU44E7hTzxipE58kkhGkXBYd3SrC6pbpx3UQvB2QJ9VjBK9cWkVxAs
	 469J+R8h41J5X1jKqxUaS3ayCd0HVWWhGc3EboUA=
To: Mark Brown <broonie@kernel.org>
Cc: =?utf-8?B?5rKI5LiA6LaF?= <zhuning0077@gmail.com>, yangxiaohua
 <yangxiaohua@everest-semi.com>,
 Zhu Ning <zhuning@everest-semi.com>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
In-Reply-To: <8cddbe1c-20d7-4b8f-ba02-f86bbb5a54c5@sirena.org.uk>
References: <141a3320-ff65-459f-9d00-c8bed691dcfc@sirena.org.uk>
 <87lejpwxzf.fsf@mutex.one> <ZBr9rJn50ovG1w9W@sirena.org.uk>
 <87ttycjyw3.fsf@mutex.one> <ZBty1CdPaWm0IcRi@sirena.org.uk>
 <87r0t9uc08.fsf@mutex.one> <ZCRCqJ7oG6oefo9g@sirena.org.uk>
 <87zg2pxtog.fsf@mutex.one>
 <d2be9183-87fd-4cc4-a239-9401b5b88364@sirena.org.uk>
 <87o7j5b9bd.fsf@mutex.one>
 <8cddbe1c-20d7-4b8f-ba02-f86bbb5a54c5@sirena.org.uk>
Date: Sun, 20 Aug 2023 12:32:52 +0300
Message-ID: <878ra683ej.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: TIIAZMB3EV73LHGHY2YBRN23A2DTBWWH
X-Message-ID-Hash: TIIAZMB3EV73LHGHY2YBRN23A2DTBWWH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIIAZMB3EV73LHGHY2YBRN23A2DTBWWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Mark Brown <broonie@kernel.org> writes:

> You'd need to pull the relevant supplies out of DAPM and handle them in
> the CODEC suspend/resume callback.

Can you please suggest an approach that would be acceptable to you?
In the original patch series I sent, you didn't agree to the approach
to disable the jack detection in the machine driver suspend callback
and re-enable it in the resume callback. You suggested to do it in the
CODEC suspend/resume callbacks. As I explained previously (and Zhu Ning
confirmed in his email) this wouldn't work, since as long as the jack
detection is enabled, the CODEC suspend/resume callbacks do not get
called.
The second option (which you also do not seem to agree) is to enable
idle_bias_on.

So I don't know how to continue with this and merge this new machine
driver.
