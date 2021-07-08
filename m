Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1A33C1581
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 16:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B3B915E2;
	Thu,  8 Jul 2021 16:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B3B915E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625756111;
	bh=rpsXE9AJLSqA8Kv/HQrm10YwdRvBtb3W8EuH96A9sRY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q1bmBU1FLzGJ8mRd5bu2HfKtDj47rBMTZKMtP5p/NRUkQDfiii66jjiU9GzomTLpI
	 wDHbr8114nXEl6AOWREy5akDMmV0CQFI0ssTSbFjG0q4mEL6Yu/Hc92XC88sWM0E3H
	 Bn1H5MucYYQaCxo1YLjfBOa4s3UQLTlG5ataiAwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84547F80259;
	Thu,  8 Jul 2021 16:53:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23CECF80249; Thu,  8 Jul 2021 16:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEC63F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 16:53:31 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E7812A003F;
 Thu,  8 Jul 2021 16:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E7812A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1625756009; bh=50Pcd5aTX9wikvo2sIBF0vJ6IcrjySrof/14/tpqP8k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=phgeDJEeL3CJ2C+r+weBuDGCtGDMtCBf8XucknY8xtRV+9n1UxbGse81CzdL9m7Ru
 AntvgEqAMSaowOfV+vTJPwyqirFmSYAYpmlhCPFRLL4DZVRlhH4VHxn85oxOFgnFsJ
 gt6H/bNUob/HValmw35d8rWFyLg9tbCG5ViZFM0Q=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  8 Jul 2021 16:53:20 +0200 (CEST)
Subject: Re: [Patch v2] ALSA: compress: allow to leave draining state when
 pausing in draining
To: Robert Lee <lerobert@google.com>, Takashi Iwai <tiwai@suse.de>
References: <20210708020815.3489365-1-lerobert@google.com>
 <s5ho8bd59q4.wl-tiwai@suse.de>
 <CAOM6g_Cv6rsLOAb0+Lr_YkjHpKfw+zvWXH0X5LKR=Z4dtXGRng@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e2705267-4400-bb7f-e96a-9b103872c0a1@perex.cz>
Date: Thu, 8 Jul 2021 16:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOM6g_Cv6rsLOAb0+Lr_YkjHpKfw+zvWXH0X5LKR=Z4dtXGRng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, zxinhui@google.com, carterhsu@google.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 bubblefang@google.com
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

On 08. 07. 21 15:47, Robert Lee wrote:
> Hi Takashi,
> 
> It is a little complex to describe the design in detail, but try to
> explain simply
> what issue we meet.
> 
> If w/o the change,  after user resumes from the pause, our system would call
> snd_compr_drain() or snd_compr_partial_drain() again after it returns from
> previous drain (when EOF reaches). Then it will block in this drain and no one
> wake it up because EOF has already reached. I add this change to return from
> the previous drain.

It looks like that the driver does not call snd_compr_drain_notify() so the
state is not updated to SETUP on EOF.

> Actually, I am wondering how the pause-during-drain can keep the state in
> DRAINING. It should have a different design. :)

I already proposed to add a new state (because it's a new state), but the
conservative way was elected to avoid user space changes.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
