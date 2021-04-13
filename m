Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499235E31B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 17:46:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9FAB167B;
	Tue, 13 Apr 2021 17:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9FAB167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618328761;
	bh=7maV0whMJ3nYVkXOfUcP13Q0+K1Yecv4bf/PilEKo7g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGrALauyS3IuhGmgggdgfDn3T4HtcbC5t00NtsTspl9yh5Y/Xle08jqmq4oKZrJES
	 +fSf1P+zyPPo3/4w9G4XMaTQFLPCOlN3y/XGTTOS9r5+fiQCO4Muuxj6qZVEG2A9rP
	 tLDY802rJibs1SNbXxCgAZ957hIXhilFyOSiLXTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38D37F8022D;
	Tue, 13 Apr 2021 17:44:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19908F800EB; Tue, 13 Apr 2021 17:44:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E22EF800FF
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 17:44:18 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B2E76A0040;
 Tue, 13 Apr 2021 17:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B2E76A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618328656; bh=WN3cIlngzuhirVfLN8XZccDftzCpZWmuQCyPYDi5A8c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SFUdDoYF0098YPwBFct5I2K37TvuhoH2gc+4pgWIRz4XiaJEZhQ9UGir/UzqGP9sj
 m4Ozc39NircDEF731s7+IacBghpUIwkVrCamoS4BCFC83ARWzmNzxa2zvXMb9q9qgr
 Qvbz/+y1a/xExsgBIfvJCcqLb0QU7niHieEgoq2Y=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 13 Apr 2021 17:44:12 +0200 (CEST)
Subject: Re: [PATCH v4] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>, David Henningsson <coding@diwic.se>
References: <20210410120229.1172054-1-coding@diwic.se>
 <s5him4r3k1d.wl-tiwai@suse.de>
 <e912ae71-5b52-8b1f-b3fa-b9bb6420be29@diwic.se>
 <s5hy2dmw6ga.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <321d2fa0-0835-7e12-c0b4-ec74ff0d108c@perex.cz>
Date: Tue, 13 Apr 2021 17:44:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5hy2dmw6ga.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Dne 13. 04. 21 v 17:27 Takashi Iwai napsal(a):
> On Mon, 12 Apr 2021 21:32:37 +0200,
> David Henningsson wrote:
>>
>>> One thing I'm considering is how to inform the current framing and the
>>> timestamp mode to user-space.  Currently we have only the ioctl to set
>>> the values but not to inquiry.
>>
>> Yes, this is the same as we do with PCM. There is no ioctl to get
>> current hw/sw params either.
>>
>>> Should we put those new information into the info or the status ioctl?
>>
>> I would prefer neither, because it is not necessary and creates an
>> inconsistency with PCM.
> 
> Well, honestly speaking, ALSA PCM API design is no best one you should
> refer to...  IMO, it should have had the symmetric get function, too.
> I guess it worked without such ioctl because the current PCM status is
> exposed via proc file.  Without a way for inquiry of the current
> status, we may have had trouble for debugging.
> 
> In that sense, it might make sense to extend the proc entry of the
> rawmidi status output, too.

The parameters can be cached in the user space. The "set" ioctl should return
an error, if the parameters are not accepted and the caller should check the
protocol version, if the newly added extensions are supported. So, this type
of ioctl can be added only when really necessary.

I see the only use when you pass the file descriptor to another process, but
usually, there's another channel to pass the setup, too.

The proc file is much better, because you can get the information without any
special tool and anytime.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
