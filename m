Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BD37B9B5D
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11C26E0D;
	Thu,  5 Oct 2023 09:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11C26E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696490895;
	bh=n3+HxBKSaQu/VH7yK/mFBkVZ+E1E/JKcoRMjA6dSozM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eIs/P/8paSG+G1lWJwqX1X7BwA+fCiks6bnCZf5WzMpqnJXB2Epn3+oIqVxLlhogQ
	 ceqKPPkr4WLBQ+/1EzRIBPhHFLUkR2xFNK7U0Fe4tBcM1gybCBHRKxNrmxZjuABwZj
	 9r9YZwVhEiiezxEVdwt698kLjRZjMOECGZ7zpidw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52574F80549; Thu,  5 Oct 2023 09:26:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C68C8F80310;
	Thu,  5 Oct 2023 09:26:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 134E3F80549; Thu,  5 Oct 2023 09:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 909F1F800C1
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 09:25:05 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id ABF0B2C82;
	Thu,  5 Oct 2023 09:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz ABF0B2C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1696490704; bh=uqageofBxJ1YtP/KDEuhMZfcT6e54HWw74KlynWoEMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B5+7rsupQ8yJzg8v+25jomnkh/wd4XGVIuJqGInSAuotujuHTDpz5eNJmv4XLLbSf
	 1MPrYeZlpEWUEsT5Z39PpWuBOwFSAZtT5lIbb0q4Q8kGE0xzr3OzLrZ/ehKED5MpIk
	 QO8RH3lr1pTEzU4N4EBqThsMS18aSsyodO4N0hws=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  5 Oct 2023 09:25:00 +0200 (CEST)
Message-ID: <caa80bb4-7e24-3e7b-91ea-e3ccbdd2af6d@perex.cz>
Date: Thu, 5 Oct 2023 09:25:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] ALSA: aloop: Add control element for getting the
 access mode
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230927113555.14877-1-ivan.orlov0322@gmail.com>
 <20230927113555.14877-2-ivan.orlov0322@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230927113555.14877-2-ivan.orlov0322@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BR7CHKZPWJSXM7WCFNO3ASLSXLT4B6Q3
X-Message-ID-Hash: BR7CHKZPWJSXM7WCFNO3ASLSXLT4B6Q3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BR7CHKZPWJSXM7WCFNO3ASLSXLT4B6Q3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27. 09. 23 13:35, Ivan Orlov wrote:
> Add new control element 'PCM Slave Access Mode' which shows the access
> mode (interleaved/non-interleaved) for the PCM playing device. Add
> corresponding control change notification calls.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

