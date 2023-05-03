Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F926F5BB3
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 18:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2830B12E9;
	Wed,  3 May 2023 18:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2830B12E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683129814;
	bh=z8RIZOiHkqRn0qEz1Tumlr4Newe+r7OIH8Cg666iDqg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hLBcGMtb3fuHP1Ch9wZkz1hAbXchjdczWY9cYw18jm1FIuDi3FDlIEdt679MkeeVv
	 y94bovf7kHg+693k6SmmAAZp4IG9cqKwJ68jbgx+6ffSNE+9Td0AISIRueOHaWgLTd
	 CwIREE2s0mCXZgFxB/LEPQ73YMi7nkyAku7jVAKE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CBC5F8032B;
	Wed,  3 May 2023 18:02:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2276AF8049E; Wed,  3 May 2023 18:02:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 333C4F80087
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 18:02:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6EA8411E9;
	Wed,  3 May 2023 18:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6EA8411E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683129748; bh=kPI8WRecLu1DnKOFj6MgJCmAIYBj9x0OReMy1iCCSJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RIKLqMmrVb0I5ZjmtjBTSSUElpKXKQ2kA1M38Z40Pg+TfSW/6bsTiN+m7RWfh4mXI
	 ZSiMGQ7HHZTvBURuKGwEUx/J+WWy+tQUQQrZgimpgAi6V41oF6FbMpkLQBMZYcyR8G
	 38+FpMuilfsafAmED6fNb4I/RQ3d5haAxI1/tQHs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  3 May 2023 18:02:25 +0200 (CEST)
Message-ID: <66b5e011-17f6-8c71-4f0e-dad66b401a26@perex.cz>
Date: Wed, 3 May 2023 18:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] conf/emu10k1: remove compat with two decades old drivers
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org
References: <20230503155530.2121516-1-oswald.buddenhagen@gmx.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230503155530.2121516-1-oswald.buddenhagen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: THLQK6QXEIZQVWGMH2574UIW7G2VZPAX
X-Message-ID-Hash: THLQK6QXEIZQVWGMH2574UIW7G2VZPAX
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THLQK6QXEIZQVWGMH2574UIW7G2VZPAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03. 05. 23 17:55, Oswald Buddenhagen wrote:
> There really isn't much of a point to clutter the files with this.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

Applied. Thanks.

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

