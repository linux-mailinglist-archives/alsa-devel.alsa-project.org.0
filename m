Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561046A83B2
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 14:41:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56CC320C;
	Thu,  2 Mar 2023 14:40:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56CC320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677764474;
	bh=mMWsrESvjfmnMDuEERPpvCeQtpETcVIJXaNd5Jb3+QQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a09HsEexny0ipynzJCTnxZ+8ok2YR4DE7E8obBog6RvsIt8YpwH9S6JuFhTBtUo7H
	 qovE0iCN1/NekkxitHjXhxOjjnbKqdCQGtERfxxSgEAJxk1K3GUbzl9XoQ6ZdQDz8g
	 D/ZjEpeaUvnmlEc59J92HzNhRj/xtxf0MbCqK6BM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB742F8025A;
	Thu,  2 Mar 2023 14:40:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7D9AF80266; Thu,  2 Mar 2023 14:40:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB9EAF80236
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 14:40:16 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C5C3911CB;
	Thu,  2 Mar 2023 14:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C5C3911CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1677764415; bh=1ojqldAXRC2ShAktuhgu7Q5BIHoADAyy+kQhzoChmd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HU2qHSb8+KZTSEUZ7/XCvmHxMFrYegERq332sCOdFOmYL8sow/zoO+uMGP5XVCbG8
	 sOQzu4bu3oejRO6mFPm7gj0WuDhIuOvfkR5Zf+edE6Cinr7LbZ4xkHN8747oFWycQi
	 bVh/+A+CVuS54nK/L6yM0ME71TfSRDz8klvOLdnI=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  2 Mar 2023 14:40:12 +0100 (CET)
Message-ID: <70ccc24f-eb80-c8b0-42d4-7e5bba0a7d9d@perex.cz>
Date: Thu, 2 Mar 2023 14:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2] ucm2: Rockchip: rk817: Add ALSA UCM support
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, alsa-devel@alsa-project.org
References: <20230224193320.1503-1-macroalpha82@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230224193320.1503-1-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: J4ANL33BQROH7XGUUKE6PZERVNFZUPYL
X-Message-ID-Hash: J4ANL33BQROH7XGUUKE6PZERVNFZUPYL
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Chris Morgan <macromorgan@hotmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J4ANL33BQROH7XGUUKE6PZERVNFZUPYL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24. 02. 23 20:33, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add ALSA-UCM support for the Rockchip RK817 audio codec. This codec
> is typically configured either with an internal or external amplifier
> as reflected by the longname. This configuration has been tested on
> the Anbernic RG353P (rk817_ext) and the Odroid Go Advance (rk817_int).
> 
> Changes from V1:
>   - Use a constant to control if the output mux is set to HP or SPK.
Applied now.

			Jaroslav

---
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

