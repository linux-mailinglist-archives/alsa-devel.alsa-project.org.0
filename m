Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9B07240AB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 13:17:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9B6825;
	Tue,  6 Jun 2023 13:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9B6825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686050232;
	bh=5pEdumKdvtXScO6aNZx1aflcM0+X9p1ADt2o/O0yqS4=;
	h=Date:To:References:From:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CCHfW5wi0HAEvcE16UHDWG03OVHmBv7uXGjCZt2k2f8OD+DA0U+rmvEvlzSiHDywT
	 JHc/mutcMVrwd4teafmh6bWwzn+SV4GAjwwt6cWV3ArXcoobfFouYS2izKJOI6vVhR
	 YRVeDDQcpTtmmLnQQGuYWxoYpF5yPFX9pFWe+rOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1559F8055A; Tue,  6 Jun 2023 13:15:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30B2CF80520;
	Tue,  6 Jun 2023 13:15:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6519FF80494; Tue,  6 Jun 2023 13:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D6F8F80155
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 13:15:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 42A281E3B;
	Tue,  6 Jun 2023 13:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 42A281E3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1686050128; bh=Ub+SuwhwAG2eaGWTGXctoxxlBkoBAab2/hXPQa7ZHHw=;
	h=Date:To:References:From:Subject:In-Reply-To:From;
	b=M/eOZW3bffBmSs/mBH04waQ6Of5sKlXvTWYKie7/WyGClf+95rdHSxz0fKl0mUQ0m
	 HGgwGva8CzIap7ezO2jxDD3uNisuWiNwwCxCNZXQ5a6B0rT8WqqB2cbLFXZ3eNFk4j
	 YNK6gfr0uPcRCbcBP7VzcRENGBJ74/U/E/y7wdN8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  6 Jun 2023 13:15:26 +0200 (CEST)
Message-ID: <1e1f3e8b-999f-e0e1-7040-22429a431f72@perex.cz>
Date: Tue, 6 Jun 2023 13:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230606093855.14685-1-tiwai@suse.de>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 0/4] ALSA: Fix kctl->id initialization
In-Reply-To: <20230606093855.14685-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2WD7HP4JRX4KNL6QBZNPFCTIKHUY62VK
X-Message-ID-Hash: 2WD7HP4JRX4KNL6QBZNPFCTIKHUY62VK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WD7HP4JRX4KNL6QBZNPFCTIKHUY62VK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06. 06. 23 11:38, Takashi Iwai wrote:
> Inspired by the recent Jaroslav's fix patch, I skimmed over the tree
> and found that there are a few other similar bugs.  Here is a patch
> set to address them.  Most of them are just shuffling the call order,
> while the one in HD-audio is changed to use snd_ctl_replace_id()
> helper.

For all patches in the set:

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

Thanks. I planned to check the other code today later, but you're really fast.

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

