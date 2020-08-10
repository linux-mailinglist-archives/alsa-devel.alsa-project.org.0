Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 625D324019B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 06:49:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13C41663;
	Mon, 10 Aug 2020 06:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13C41663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597034972;
	bh=OfA6Z/SX0xy+bAFZPK2OH6pgCdIYlek7pLYWnisEeCA=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VT4bPT4O8II0A1W7WXfB5KketPQnHWYQWD7R7RrsqtaR5PzCZbCFkthM2h8tYCswW
	 /JhxYVbmjjDWBKIFm0CjExlXDg8PDu7wh+xmdTuX5bBPu5Wvon6iedeV8MPp62sUJp
	 LWH03MokGaLyjfNkoTGKlcBSWSxBlIEmV+Fx4K5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2739BF8022D;
	Mon, 10 Aug 2020 06:47:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD428F8022B; Mon, 10 Aug 2020 06:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01099F800CE
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 06:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01099F800CE
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 20FC241F5F;
 Mon, 10 Aug 2020 04:47:32 +0000 (UTC)
Subject: Re: USB audio cuts 2-3 secs at start
To: Stuart Naylor <stuartiannaylor@outlook.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <mailman.12167.1595955329.5591.alsa-devel@alsa-project.org>
 <DB7P191MB03327F9F65BA389A950607AFA8730@DB7P191MB0332.EURP191.PROD.OUTLOOK.COM>
From: Hector Martin 'marcan' <marcan@marcan.st>
Message-ID: <bcf009b2-9a35-8b2f-5629-2fb991c41ea0@marcan.st>
Date: Mon, 10 Aug 2020 13:47:30 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB7P191MB03327F9F65BA389A950607AFA8730@DB7P191MB0332.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
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

On 29/07/2020 02.08, Stuart Naylor wrote:
> http://alsa-project.org/db/?f=6b107178c9939f235a390c07cb5c1f71d6a6e0c0
> 
> Its an Anker power conf and for some reason the first couple of seconds of aplay do not play via USB.
> 
> Alsa-info above anyone and tips or ideas?

I bet this is just the way the hardware behaves. It probably takes a few 
seconds to turn on its amplifiers and audio path when USB streaming starts.

If it doesn't happen in other OSes, then most likely those OSes 
continuously stream audio to the device even when it is unused. The 
workaround would be to do the same, e.g. use pulseaudio and disable 
suspend-on-idle, or use JACK, or something along those lines that always 
keeps the device running (with silence when no app is using it).

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
