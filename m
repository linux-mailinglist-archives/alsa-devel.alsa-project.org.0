Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC068AACD
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Feb 2023 16:01:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B92822;
	Sat,  4 Feb 2023 16:00:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B92822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675522865;
	bh=9GE+tp29+tc18oqa1QTF1Hm2zcOQeHDZ/2v1etKMSD0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UeEYeTVQtOu0O0YZR5dGRodk90fjs3lqezcWrjS/kjwYg0sk437QOV4oFB/74gSnJ
	 45Wh/wSUjEkx6hA7tVgUbeGxmCW2tnAs8wqSuoOu536l/HBAkcmMYazGsKCpyTxxGo
	 djZ7jHy5f528TBZLk7ULWUxS66DA/Jd1/6w4G2kE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1347CF8001D;
	Sat,  4 Feb 2023 16:00:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13AFAF804C2; Sat,  4 Feb 2023 16:00:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 788A8F800E3
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 15:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 788A8F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=lW4JDm7i
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E877F11C2;
 Sat,  4 Feb 2023 15:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E877F11C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1675522788; bh=1N98dNOuZiTvJsGh1rS14E6IlQH8Yq05EKRIHvOvVVk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lW4JDm7i4y1qTsnCuxF1PzG/AA1aF75PN0oOMxvkqQidU9u4ikajxPg0Nmbevag+X
 VwzxGzcO4kB1/gYCgD4/S4Q8eR9GQCUNELVs11SkDCDkctrcLOFiMPgAK1aPT2WSW0
 +uYyntp9SE0V8lavSVOoup6l+jKIjEUEANz7CTHE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat,  4 Feb 2023 15:59:46 +0100 (CET)
Message-ID: <9f1074b7-5292-b806-591f-9b5cba096479@perex.cz>
Date: Sat, 4 Feb 2023 15:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Make ALC4080 front panel audio work on ASUS ROG STRIX X670E-E
 GAMING WIFI
Content-Language: en-US
To: Jesper Juhl <jesperjuhl76@gmail.com>
References: <9523a3d3-230f-a142-6316-ce2369f78b4c@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <9523a3d3-230f-a142-6316-ce2369f78b4c@gmail.com>
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 04. 02. 23 13:05, Jesper Juhl wrote:
> Hi
> 
> In order to have working front panel audio for my computer based on a
> ASUS ROG STRIX X670E-E GAMING WIFI motherboard with ALC4080 audio, I
> need to apply the following patch.
> It would be great if it could be applied up-stream so I (and other
> users with the same hardware) don't have to do this manually in the
> future.

Thank you for your update. This change is already in alsa-ucm-conf repo:

https://github.com/alsa-project/alsa-ucm-conf/commit/88f232df

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

