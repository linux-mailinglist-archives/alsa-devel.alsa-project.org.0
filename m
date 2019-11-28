Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0B10CE50
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 19:05:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C470716EB;
	Thu, 28 Nov 2019 19:05:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C470716EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574964350;
	bh=MRO7qboRap+PmKA7Z0WFFemxVNRZ+lJ9Vm5lJxmoBVE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2N2Pgfss16z+wbxMVb7oVtTlfvEONl9v+sqrcof/snLOrTeFCA5E6FxfsPqzKVoR
	 l8pMeyUzmKcGGh+COXk3bnZ39GMARdwRMKMCm5QXiCQkADBQRE/sudBzUAv/vrSdMM
	 8uysnbyN2fBjwe5GM/ea+2cgQSCI8TtPwhInMMpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F629F801DA;
	Thu, 28 Nov 2019 19:04:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3183F80149; Thu, 28 Nov 2019 19:04:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E681F80106
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 19:04:01 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 470BCA0040;
 Thu, 28 Nov 2019 19:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 470BCA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574964241; bh=uiCmBIIGctz9x94G5DLnYSFyKx6u9s6UM72uAGwa1Mk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=s0ogxJT1fesRcAodNvzeBfLa8pRMuL8qxjex51Ywspel0C5TKDXNK+Drp4DOPDf+z
 U0qLetNy7Vpe3GvsRGkisoh2nIhvEm+QG+caR0GarlDmLZT1G9bQ+27/zjOyBi7I5B
 iwh/QANDYmPsk8Hrirz16Zdmi1wq9LFt5hMtZblI=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 28 Nov 2019 19:03:57 +0100 (CET)
To: Mark Brown <broonie@kernel.org>
References: <20191126103404.29534-1-perex@perex.cz>
 <dd238740-f154-a660-2a80-0ada80183dd2@linux.intel.com>
 <32edec86-ec1c-1809-2278-fecac09ac321@perex.cz>
 <20191126162935.GB4205@sirena.org.uk>
 <48159775-bd7b-b473-7e02-3116ca8dee73@perex.cz>
 <20191128175957.GG4210@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <85ea1adb-6b0d-69bb-e557-90008d1a8acf@perex.cz>
Date: Thu, 28 Nov 2019 19:03:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191128175957.GG4210@sirena.org.uk>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: intel/skl/hda - export number of
 digital microphones via control components
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 28. 11. 19 v 18:59 Mark Brown napsal(a):
> On Thu, Nov 28, 2019 at 03:28:19PM +0100, Jaroslav Kysela wrote:
>> Dne 26. 11. 19 v 17:29 Mark Brown napsal(a):
> 
>>> You've missed the merge window already - it was open before this patch
>>> was sent.
> 
>> So, what now? Rebase on top of Pierre patches? You added another patches to
>> your for-5.5 branch today.
> 
> Since Pierre seems happy with it even if he didn't ack it explicitly
> I'll guess I'll apply it.  If git can figure out applying it after the
> merge window and it doesn't get negative reviews there's no need to
> resend.  If it can't and it doesn't turn up in a bigger series before
> then I'll let you know.
> 

Thank you Mark.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
