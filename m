Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5432A300
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 07:41:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 844EE173D;
	Sat, 25 May 2019 07:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 844EE173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558762908;
	bh=pDDvh4u66OJYuHqCjhcznRSlpPHwhvVKM5WcG9CoqSM=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m+iQbXWupRUwLzmhn9QEjyDFDLg9RQM6w8OvR75epYpONSNfILg+WZJ9cxY7jkUyh
	 47wtfX/xGhCvaZxo5j90qHEDaDc9uujYRoOZyTKft5qGYst0TpOnUXBoF1e6Z81EVM
	 e7pOZ6a+KlTSS3vc8/9ypTsHGJZCxolzNZzXbCpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F423DF89707;
	Sat, 25 May 2019 07:40:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC5CBF89674; Sat, 25 May 2019 07:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [IPv6:2a01:4f8:212:88::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E2B5F80C0F
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 07:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E2B5F80C0F
Received: from olorin.ladisch.de (x2f7fa47.dyn.telefonica.de [2.247.250.71])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id 3C9755583AC8
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 07:39:54 +0200 (CEST)
To: alsa-devel@alsa-project.org
References: <83B5A2EBEFF68E46AB106DA39CB25921010ED695@IN01WEMBXA.internal.synopsys.com>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <615dcc2e-93fc-dab0-2480-a651a4a5312b@ladisch.de>
Date: Sat, 25 May 2019 07:39:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <83B5A2EBEFF68E46AB106DA39CB25921010ED695@IN01WEMBXA.internal.synopsys.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.4 at webclient5
X-Virus-Status: Clean
Subject: Re: [alsa-devel] arecord doesnt record into file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Aditya Paluri wrote:
> arecord --device plughw:0,2 -r 48000 -f S16_LE -c 2 recorded_sound.wav
>
> And as I see the audio stream getting dumped onto the DRAM/memory, I donot see recorded_sound.wav contain any data on the file system.
> I also see EPIPE error due to overrun.

This is likely to be a bug in the driver (snd_pcm_period_elapsed() does not get called).


Regards,
Clemens
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
