Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 825EF659B96
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 20:18:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B102A0F;
	Fri, 30 Dec 2022 20:17:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B102A0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672427893;
	bh=65hyjyx5XnMTSOFPPsR7hrHJruLDZJXFChglmsxJifQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LZ3Fo4U5fw+5tVM1UIRQI2TNtcME4MBR0E5808VAtjPvJ9SCEMeXpceY56lsAfKZw
	 MpnXtJqK87aoMZdZ0l2NA92vh5oAnDJrjZxUGI5Cisd8LYOCwETIetomadjGHn6H2O
	 /JlRAU1aDtDXue/r3hKgGOTfyzNh3DjscMnK/jvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 893EBF8042F;
	Fri, 30 Dec 2022 20:17:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28287F804B4; Fri, 30 Dec 2022 20:17:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D9DFF8023B
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 20:17:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D9DFF8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=Jh2qHaDy
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 720B7A0040;
 Fri, 30 Dec 2022 20:17:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 720B7A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1672427835; bh=vUm728EjzFDbDRwz15s+3qysL+wwFEU0kmEYjDdmHSI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Jh2qHaDyzQaSwo0WGbOWGwpp28B4p7g2Ypb9tsCbATx/vWte0SQ3xxPRmaQ7B1DVV
 WQt+x3p+hYtWsM6lQCtV4dPNZOooxwSM2KKVeUt9LYUXBUUlnkD8gM5MTTQGIXFde6
 nkk29GAayY+7e5+f2SLRpSdvEiQBhrjp55DnM4Vo=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 30 Dec 2022 20:17:12 +0100 (CET)
Message-ID: <4c1fde83-df1c-d04a-b1f4-b75e1f8fd89a@perex.cz>
Date: Fri, 30 Dec 2022 20:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] pcm: rate: fix last_commit_ptr boundary wrapping
Content-Language: en-US
To: Alan Young <consult.awy@gmail.com>, alsa-devel@alsa-project.org
References: <20221230164814.901457-1-consult.awy@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20221230164814.901457-1-consult.awy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: tiwai@suse.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30. 12. 22 17:48, Alan Young wrote:
> Wrap last_commit_ptr using boundary. Was just wrapped to 0, which is
> correct only if the buffer size, and hence the boundary, is an integer
> multiple of the period size.
> 
> Signed-off-by: Alan Young <consult.awy@gmail.com>
> Fixes: 467d69c5bc1 ("Fix CPU hog with combination of rate plugin")
> Fixes: 29041c52207 ("fix infinite draining of the rate plugin in SND_PCM_NONBLOCK mode")

Thanks for this fix. Applied to the alsa-lib's repository.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
