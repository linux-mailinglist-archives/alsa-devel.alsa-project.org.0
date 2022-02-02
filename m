Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA87F4A737B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 15:44:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3327174F;
	Wed,  2 Feb 2022 15:44:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3327174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643813095;
	bh=h2CSqb5/UQFRKSWAYAOhzVsSynzEZ3L8m97H6haJ5Vg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UXdZrag6OCG0hvqiDqIZFsI6+7G2wrbjQ3QzHxXQOzO47L//fWc8JaXRg4WMi/uX6
	 M1I4/VgTUyT5wGfaoDrjUePg6AltsfWdEDy3kJZ0C8CvG0mG08m6vx/5LP9f5ga33y
	 nbxwx37gXA8SQBXttY3PS9SowEe/dkrNJFptyGNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB42F804CA;
	Wed,  2 Feb 2022 15:44:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35033F80130; Wed,  2 Feb 2022 15:44:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 218AFF80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 15:43:57 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 61E59A0046;
 Wed,  2 Feb 2022 15:43:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 61E59A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1643813037; bh=27XjbhSUP+dSBwJS6fXJV2xLD1T7F/n1/8/FE8UhM7U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KDjjR185WHRWm4HQQnv50xMvi8Vt2/KOVSUId4veeQCy9PD5cr85K0E4SwI1BePcW
 WdFnkM0l4YqOzKAtO/UM1+hMwZgNKAdD65/KlSQ/FLajJd33xfPuP7V7v91nBUdu1Q
 zGnI+8iphxuiKcZSaLVA2yjOJ9jJ/Uq91ayQ0pKc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  2 Feb 2022 15:43:50 +0100 (CET)
Message-ID: <910978c1-e94f-dcea-7cc1-479d8080c627@perex.cz>
Date: Wed, 2 Feb 2022 15:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/2] kselftest: alsa: Declare most functions static
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
References: <20220202141011.14924-1-broonie@kernel.org>
 <20220202141011.14924-2-broonie@kernel.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220202141011.14924-2-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org
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

On 02. 02. 22 15:10, Mark Brown wrote:
> This program has only one file so most functions can be static.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
