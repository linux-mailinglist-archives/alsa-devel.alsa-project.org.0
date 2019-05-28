Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB412CC48
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 18:40:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA879183D;
	Tue, 28 May 2019 18:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA879183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559061643;
	bh=YtZvHT+OfizeADd1YGXdzAyZH/UFNno7OBAsXAXjpeQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYk+DW+jMt+F4rMb4+Zh4dQfYOd6+BLM0c+gIxOThCiif9P5Wg0YEE+y+NPDxTPTE
	 INfw1G0a6TqdNsvI/aJVBEIbIXByK3G8HahIZXSt4Tk4FzjdQ/U1EBR6ezIRIQfZB0
	 A9un9lZNTdbiGQhdS3rWPVlMPJx6VnjhUk85GIrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49EF6F8065A;
	Tue, 28 May 2019 18:38:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5566EF89706; Tue, 28 May 2019 18:38:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C99CAF8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 18:38:53 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CCD48A0040;
 Tue, 28 May 2019 18:38:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CCD48A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1559061532; bh=pyCo33Y0IPFnH3pml02zzj63ISwtCxHU+XlZiEUH6XE=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=Am2j9xcI9eFWUCYD+iLCmfbi0OhfZZJLTphndpolJc31Kc6A82UMkJ4pnjDFnbJD5
 rKy3x8rgsi2vS0NKS7uBWuVZjzWt3T3RRSwnw6cJrJkQk1ffH1cHPqYVTpx/PtpwWg
 9/q3L09wElmq9UJzj8U1ZrfUBM7tymZmbc/hC8Nk=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 28 May 2019 18:38:48 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>, Connor McAdams <conmanx360@gmail.com>
References: <s5hblzmvdcq.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <9668d632-c5c9-5114-39cb-0e8a105a547c@perex.cz>
Date: Tue, 28 May 2019 18:38:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hblzmvdcq.wl-tiwai@suse.de>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Merging the new firmware files for CA0132 into
	alsa-firmware
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

Dne 28. 05. 19 v 16:54 Takashi Iwai napsal(a):
> Hi,
> 
> it seems that Connor's previous attempt to put a couple of ca0132
> firmware files into linux-firmware tree didn't go through,
> unfortunately.  And now I'm thinking of taking them into alsa-firmware
> package as a stop-gap.  We already distribute other ca0132 firmware
> files, so the addition shouldn't be a big problem.
> 
> Jaroslav, what do you think?

No problem. The same situation is for the SoC SOF firmware files (drivers are
in kernel, firmware files are missing). Perhaps, we can release those files
quickly in alsa-firmware and then migrate them slowly to linux-firmware.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
