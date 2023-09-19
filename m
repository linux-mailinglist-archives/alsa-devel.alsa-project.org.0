Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA797A693F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 18:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2B1E20C;
	Tue, 19 Sep 2023 18:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2B1E20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695142581;
	bh=KdGSz4Rd7fTrrimn8yI/GYMncfe9R/OkseV3uDZEmlE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TvvNlweORFIHn8zo/byjin1RCjLwqYw95pJnwLTgU8RASl5ebjY5p3N7EMpoglGuo
	 2IZ9mzUhS+AjorguBTUKyKDDmBj+TdIaaOqT9emzpS6KEmP/EUuUCTxW6mFDBjWHL1
	 hqN3PuCJrmSqVU/R0NakmufWiLhOfViQnGJuyqWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7901FF80551; Tue, 19 Sep 2023 18:55:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D3AEF801F5;
	Tue, 19 Sep 2023 18:55:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65657F8025A; Tue, 19 Sep 2023 18:55:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 678B6F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 18:55:19 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 018B811D3;
	Tue, 19 Sep 2023 18:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 018B811D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1695142519; bh=5LNczy2+dyEHAXUylvE30St6GuD+e3uy+gkBfmJ4xzg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g6Uew+A+HTxwJjlNBwqgEs/e8N6xOdlJQ5wxzPvcT2w/EAIp1/S8qEedhv+CiX3hr
	 5KrkeKXQJCGE/CypLEbmyW6enidBBYsz7ofaXol8RrMV9cKv8XrpRNkDMCmDEqE4yp
	 5Gzvu+qoYS7RpzD3yjUqVBnNRuUmE0UFfa3n4d4s=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 19 Sep 2023 18:55:10 +0200 (CEST)
Message-ID: <eeade51e-e293-ce94-1699-c9aefdc804f3@perex.cz>
Date: Tue, 19 Sep 2023 18:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] kselftest/alsa: pcm-test: Report cards declared in config
 but missing
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, Mark Brown <broonie@kernel.org>,
 Shuah Khan <shuah@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20230919152702.100617-1-nfraprado@collabora.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230919152702.100617-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HCZOHMO3YJV3K3KLKY4PMLXX4O5POXOF
X-Message-ID-Hash: HCZOHMO3YJV3K3KLKY4PMLXX4O5POXOF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HCZOHMO3YJV3K3KLKY4PMLXX4O5POXOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 09. 23 17:26, Nícolas F. R. A. Prado wrote:
> When parsing the configs, keep track of card configurations that match
> the current system but haven't matched any card, and report those as
> test failures as they represent that a card which was expected to be
> present on the system is missing. This allows the configuration files to
> not only be used to detect missing PCM devices (which is currently
> possible) but also that the soundcard hasn't been registered at all.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

