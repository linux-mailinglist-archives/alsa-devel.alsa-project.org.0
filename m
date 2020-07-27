Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5217222E9A9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:59:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED356166E;
	Mon, 27 Jul 2020 11:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED356166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595843957;
	bh=zTItE3Jdg3eO8Q2WbvkezrybFL286JjzowFktuYuc0Y=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PcBbB8fj2+8jfb1dvkuMH8121M+XdFZm0PUjczJ5dPP8y/6vUqE04uJrilhjQqrOy
	 bVkMqulu8xpMtRJ/J+41soj2mUF/fMmjxNKKu40H7F3is9A3CGdgVE8XuyIkqvukhh
	 zHaIjcfr4t53odrNqRB/UCHcDc4wA1VycbF5tvXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF129F800DE;
	Mon, 27 Jul 2020 11:57:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 770CBF80171; Mon, 27 Jul 2020 11:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06CB4F8013C
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:57:18 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 49738A003F;
 Mon, 27 Jul 2020 11:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 49738A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1595843837; bh=TUE+p9+MZtipz7IyxCseV7k2APG5Vl17jk8eurOOB+o=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=rDo+GOoJIm1uk35OwP5QkP//U2yuYRGFq2tSJ5U1EeEaHoASdDKIDfPUm7l3R5UdJ
 oUiUGnmFUpzzL3UauXg2pVmxbUxFT0izL6aQ4xfbgTRxdXP9o4Y20/VhEk9F9X9eM4
 sn7wgjPn/IQEhzo+oynnoNSH4QRCLVnpmLH0MZDs=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 27 Jul 2020 11:57:15 +0200 (CEST)
Subject: Re: [PATCH] alsaucm: Fix ending with quotes commands
To: Cheng Yueh <cyueh@chromium.org>, alsa-devel@alsa-project.org
References: <20200709062412.348-1-cyueh@chromium.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1fba0c16-4c8c-faf5-f532-1107690ab228@perex.cz>
Date: Mon, 27 Jul 2020 11:57:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709062412.348-1-cyueh@chromium.org>
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

Dne 09. 07. 20 v 8:24 Cheng Yueh napsal(a):
> If we use 'alsaucm -n -b -' with 'get "CapturePCM/Internal Mic"' then
> the alsaucm will report error and stop immediately. The reason is that
> the parse_line in usecase.c appends an empty argument if a command ends
> with quotes.
> 
> This change adds a patch to fix the parse_line function in usecase.c.

Applied. Thank you.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
