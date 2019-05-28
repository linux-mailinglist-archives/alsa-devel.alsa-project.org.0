Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4DF2CF54
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 21:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78C761666;
	Tue, 28 May 2019 21:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78C761666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559071290;
	bh=PQFUrsPVQH1jq7CMDVfx+7sMH/pYtKS3uhUB9WMJlW8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=to/ePaEFXRvprwOt8/kkDVIgBPLSW+bENWmdfWzWFrpsskZkfoTiBKYDB2KJPsYPr
	 0sjVrH9NnL2WBIPbs2VHAjZyxb+INxNQCc4fx6x4Bl8t5mrAT0t6YGq/zBfTMXWQkW
	 c7pRy80ifQR8CMXbvz+0wChcefIChec/eWzH00mY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEA0FF896B8;
	Tue, 28 May 2019 21:19:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6275F896EB; Tue, 28 May 2019 21:19:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DB44F8065A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 21:19:41 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A0470A003F;
 Tue, 28 May 2019 21:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A0470A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1559071180; bh=bklUbCLzEJSPb92rWmF5ZqL7YpemLDb/rRb22n9xrms=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sFdh6ZwGC+gqzEUQT/0ZmQJMWucn2tjsrDLw4tzONOVxWyMRAzzK0ndbwUVrFkCKI
 iDJvDEpUUFL9i1u67U8H1a9JLbscjxZpoVvxD4DBUu9wdqEyufWd8kxYpnAZy2Vtbr
 ACmuPucrOy1mlL4JuOLMyL4BJfvB4dYD6GdygQRw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 28 May 2019 21:19:37 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>
References: <s5hblzmvdcq.wl-tiwai@suse.de>
 <9668d632-c5c9-5114-39cb-0e8a105a547c@perex.cz>
 <s5ha7f679o6.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <58dfb36f-47ba-c62f-c39d-e05d000159b7@perex.cz>
Date: Tue, 28 May 2019 21:19:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5ha7f679o6.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Connor McAdams <conmanx360@gmail.com>,
 ALSA development <alsa-devel@alsa-project.org>
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

Dne 28. 05. 19 v 19:47 Takashi Iwai napsal(a):
> On Tue, 28 May 2019 18:38:48 +0200,
> Jaroslav Kysela wrote:
>>
>> Dne 28. 05. 19 v 16:54 Takashi Iwai napsal(a):
>>> Hi,
>>>
>>> it seems that Connor's previous attempt to put a couple of ca0132
>>> firmware files into linux-firmware tree didn't go through,
>>> unfortunately.  And now I'm thinking of taking them into alsa-firmware
>>> package as a stop-gap.  We already distribute other ca0132 firmware
>>> files, so the addition shouldn't be a big problem.
>>>
>>> Jaroslav, what do you think?
>>
>> No problem. The same situation is for the SoC SOF firmware files (drivers are
>> in kernel, firmware files are missing). Perhaps, we can release those files
>> quickly in alsa-firmware and then migrate them slowly to linux-firmware.
> 
> OK, now pushed to alsa-firmware git repo.
> 
> BTW, the situation is slightly different from SOF.  At this time, the
> problem was that it's been submitted by a third person.

Ok, so we don't have a licence for those files? Connor, have you tried to
contact Creative for a permission to use/distribute those files?

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
