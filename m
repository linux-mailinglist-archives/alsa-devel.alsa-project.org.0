Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C50F35F67B
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 12:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4361E16A2;
	Thu,  4 Jul 2019 12:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4361E16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562235616;
	bh=Dfr4U1GPkt5prtHPxpxGOUsNUptsD3SKRtb1eK6UnZs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFGmbJga4FKUt9zsF0t2cME0kHB+HT0qJOomBWbG0OFscxWReX1tRNJqxReb57F8V
	 9QsoZtnXwSXmu83+PATfkeYhOhhqf7lRXzTMhHMnCuTl+cyTmd1EQZwlcOS7JffGSm
	 FRtfU70CdbNAOy8AjuxiW7Hk/26N0Q8d5bl13tVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80379F800E7;
	Thu,  4 Jul 2019 12:18:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6523F80111; Thu,  4 Jul 2019 12:18:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86D86F800E8
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 12:18:28 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B5940A0040;
 Thu,  4 Jul 2019 12:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B5940A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1562235507; bh=1OOnEG/S3yrpiBt7jEl2wBZk31YwruiGMmMtDh80aiw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LrJWyWOfrhBE/CdX9i/Zk6d0LXkQt2t/7SVxWVBmqmnnb0/kAbnCc68KUPVyFr5pH
 1QYinUK+Dqj3xQ4lTRkWToKoHskbKpvSjbCB+6jT375VG2pi+W6dT7oQfb6AMGUbha
 PaQnr1iQFS8Hqx6KGYutNaqNZYwF8r7R8Y3mb1Ck=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  4 Jul 2019 12:18:24 +0200 (CEST)
To: "Channaiah Vanitha (RBEI/ECF3)" <Vanitha.Channaiah@in.bosch.com>
References: <1561976891-17886-1-git-send-email-vanitha.channaiah@in.bosch.com>
 <645a08c3-0e40-6148-3831-4987bf7d0673@perex.cz>
 <8292ab7db32e4621865c2180a0a808a1@in.bosch.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <556614e1-acba-635c-beed-6484fb887299@perex.cz>
Date: Thu, 4 Jul 2019 12:18:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8292ab7db32e4621865c2180a0a808a1@in.bosch.com>
Content-Language: en-US
Cc: "Wischer Timo \(ADITG/ESS\)" <twischer@de.adit-jv.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] GIT: Regarding the issue we are facing in the
 commit 37728639ae05de702825d96bd1d42e24ae772248
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

Dne 03. 07. 19 v 14:17 Channaiah Vanitha (RBEI/ECF3) napsal(a):
> Hello Jaroslav-san,
> 
>> I think that it would be probably best to force the parameters for your hardware (--period-size and --buffer-size arguments for aplay or the time counterparts - --period-time and --buffer-time). The refining rules might not select the perfect configuration in some cases.
> 
> I tried to force parameters "period-size" in multiples of 2ms as our hardware supports 2ms period time data and buffer-size=twice period size.
> But still I face the issue.

There is no exact 2ms period size for the rate 11025Hz, because it's float
number 21.9780 (period size)... You may try values like 15,35,45,105 (anything
which can match 11025 / PERIOD_SIZE without the remainder).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
