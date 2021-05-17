Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B80AD382C56
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 14:38:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60289828;
	Mon, 17 May 2021 14:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60289828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621255137;
	bh=jJ8OFk2LQnwrSgjoNHq171wQiQ37b4nGcXTeBQ/fq4c=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ac5sokubQsmJ90soVFlung+jgSMdiXNf16vNWaaFU5/HFVDvRvN5tcqH0KLb+N/y8
	 jTTy0l6NBAJ9IbhGSVGQgt1efVe/MQN8a9SD141ppT7/JoigOGdAH/RtF0qM32g+gB
	 vfdRZrs8y6kkBAF91+khN7AD/aLslp8XEqYDUP50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCC21F80082;
	Mon, 17 May 2021 14:37:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74FC3F80169; Mon, 17 May 2021 14:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42168F80169
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 14:37:19 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A2DAEA003F;
 Mon, 17 May 2021 14:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A2DAEA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1621255038; bh=R1bU6Jrq/5ExtiJ+ZqoPvl2rIJ5SXZsHVPE/kICrvGU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Hbe7FrAUjKOjlq0QuUBLaza2c5/bIuVEAQO2H1LWkhwnq9hwwsNEMwkT16ApsrNvt
 6ik2kEc7FzZLB1KLByBtybu+rY/BhMhFZn3pwQPQQCR4tYM3CrT0jAIwoBLHhIm5rx
 Y9Lix8LjcCstBAnfmNQOINvKplK77guOAR8XK4U4=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 17 May 2021 14:37:15 +0200 (CEST)
Subject: Re: [PATCH] sound: rawmidi: Add framing mode
To: David Henningsson <coding@diwic.se>, tiwai@suse.de,
 alsa-devel@alsa-project.org
References: <20210515071533.55332-1-coding@diwic.se>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a75a9440-beef-06f1-11fb-e7ee4a1c6af0@perex.cz>
Date: Mon, 17 May 2021 14:37:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210515071533.55332-1-coding@diwic.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 15. 05. 21 v 9:15 David Henningsson napsal(a):
> This commit adds a new framing mode that frames all MIDI data into
> 32-byte frames with a timestamp.
> 
> The main benefit is that we can get accurate timestamps even if
> userspace wakeup and processing is not immediate.
> 
> Testing on a Celeron N3150 with this mode has a max jitter of 2.8 ms,
> compared to the in-kernel seq implementation which has a max jitter
> of 5 ms during idle and much worse when running scheduler stress tests
> in parallel.
> 
> Signed-off-by: David Henningsson <coding@diwic.se>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
