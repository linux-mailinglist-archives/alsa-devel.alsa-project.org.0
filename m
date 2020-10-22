Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 279FA2959D1
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 10:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B9D51795;
	Thu, 22 Oct 2020 10:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B9D51795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603353942;
	bh=DeuuMKS3UDlWGQgRFbHCjvAljCXDdjnuVTBpoNLgQf0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=STRI4gXiTEkLOXkDPiA4PKYKfT2Q0bYCZT/lpsb0rgsslfJQZ9ZfwJVXGOFgd2IOI
	 PBNoZjHJey2YUkVaBb35q4mD577Z2flDCRxlvNHlpnXHqj8RG2gMAYdJr/ithmgLGO
	 NHAThQpXcQr+T/L0dvvCwHyClc3v/vtHkR0/0hZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 181CDF8049C;
	Thu, 22 Oct 2020 10:04:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B5D2F804A9; Thu, 22 Oct 2020 10:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DEAR_SOMETHING,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AEA9F800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 10:03:59 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 92FBEA003F;
 Thu, 22 Oct 2020 10:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 92FBEA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1603353835; bh=zK8vG19/hPxCeXJnSg8Mu9SEU1Nk7fk4TP1iF/a4KHY=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=SoLMRQcRMiNHnI7yw9wTYYnnIuKJIXjQYnQ3PaKPqXDZCIsdPEvovJjb3vjL6B7TD
 JQSoCIK8k/HCl9ShrjQNm90kxtM59clh/ZJHe9YVVsqbYsKDWoG3U4RMS30AJUMWq0
 ZugSsC1x1wtMUYGPkUq/V6MZZVl1i1VYsySncTs0=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 22 Oct 2020 10:03:53 +0200 (CEST)
Subject: [alsa-devel mailing list / gmail] Re: Excessive bounces
To: "Eu, acc" <accensi@gmail.com>
References: <CAA+gEba8Q+KgZbao+ur2roSpxbwRAQcshbfR6ZQCAr6cXLq4JA@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <5ba74317-1cc0-80ae-44d9-e9f24c065968@perex.cz>
Date: Thu, 22 Oct 2020 10:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAA+gEba8Q+KgZbao+ur2roSpxbwRAQcshbfR6ZQCAr6cXLq4JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Dne 21. 10. 20 v 23:09 Eu, acc napsal(a):
> Dear Sir
> 
> I received an email to confirm membership on alsa-devel list.
> 
> I have doubled checked configuration, possible invasion of my systems. It is
> strange because I use Gmail for reading the list, there is more than 5 GB of
> available space, and not other reason for the bounces.
> 
> The only curious point is that email from several regular developers, even
> Jaroslav at a time, are classified as spam by gmail. I tried to discover the
> reason in the past, but the explanation from Google is that there seems to be
> a lot of spam in alada-devel and and alsa-users lists.

I need the real examples (for alsa-devel). The alsa-users mailing list is on
sourceforge and probably dead.

> Thanks and keep the good work.

[Cc: to alsa-devel]

I'm sorry, but it seems that gmail changed something before several weeks for
incoming e-mail and they have weird message rate limit rules for IP address
and content classification. It basically does not work for the mailing list. I
already tried to contact their support, but I've not received any answer.

I already implemented all protections like DKIM, DMARC, SFP. Verified today
using a dmarc report analyzer tool.

Unfortunately, I cannot do much here. I can assist to fix the issues, but I
need to know, what I can improve. I suggest to use another e-mail service. It
seems that google does not care about users now. Or you should ask them what's
exactly wrong.

The current postmaster.google.com stats for alsa-project.org:

User reported spam rate - 0%
DKIM, DMARC, SFP success rate - all 100%
Encryption - 100%
IP reputation - bad
Delivery errors - 40% - 100%

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
