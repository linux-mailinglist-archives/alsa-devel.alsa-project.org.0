Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE447027D8
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 11:08:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0716D8;
	Mon, 15 May 2023 11:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0716D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684141702;
	bh=u9dXxhrKYt+fKpShcWN8cExjKolJcb0+ZWf2/GFzG4Y=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QMEAwQrBnssU2BGDjcR3K2v4RuEC/KdZ4wbl21kjR+mVOZHmBf6uX6rPVMhLETlO9
	 SdHYI7HgzP+kgc71wKe856HH8aJWghWHoSzqgS4sXWP3wLHenHMCZ1r885rcYAWfB+
	 2sDpVbJq0nCUKWOqLzkZD0fsdKT3B6mEjcCyW0hU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 846D7F80544; Mon, 15 May 2023 11:07:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3214CF8025A;
	Mon, 15 May 2023 11:07:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA916F80272; Mon, 15 May 2023 11:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BBEDF8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 11:06:58 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9A2811E3A;
	Mon, 15 May 2023 11:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9A2811E3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684141617; bh=S/hW5EL+RDLU02V6a/Yqqg5HnuY++wu2fGBIyTlZmpc=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=d4El1ktRcDoCF1fbEfSCVGMnUg7XLQkgPL39w9qh1fwWTvloQmykDjIBn6VCXaQMl
	 cPtALkZ/S3H2R6C2kRgl8Uq7i1XW5b8jU4EneiXB/dug960BRc0kTk9UeyMcK7v6kF
	 ywTBai5H5rCV5LFeqCBcE3sME48Nje9WEAjLzimY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 15 May 2023 11:06:54 +0200 (CEST)
Message-ID: <dfe607f4-2cee-be2d-561f-1674e156edc0@perex.cz>
Date: Mon, 15 May 2023 11:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
References: <20230515084106.3447657-1-oswald.buddenhagen@gmx.de>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 1/2] pcm: hw: reinterpret the drain_silence setting
In-Reply-To: <20230515084106.3447657-1-oswald.buddenhagen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Z7SMOD3E6HE5ZGXV4JVSA4REPELD54G4
X-Message-ID-Hash: Z7SMOD3E6HE5ZGXV4JVSA4REPELD54G4
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7SMOD3E6HE5ZGXV4JVSA4REPELD54G4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15. 05. 23 10:41, Oswald Buddenhagen wrote:
> It makes no sense to have a config option which determines the entire
> silencing time, because useful values strongly depend on the period size
> runtime setting.

I would prefer a drain silence mode configuration field for this, if the 
interpretation of the positive value is different. The current value is easy 
to understand and it's really a corner case to not use the default (auto) 
code. Even the period time may be forced in the configuration, so users can 
compute the right value themselves.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

