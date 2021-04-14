Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F03735F575
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 15:54:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A15371671;
	Wed, 14 Apr 2021 15:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A15371671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618408491;
	bh=Fz69P/UFLC+JButPDY24if5GTuf9nIMckUEMLM886Rw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hSeod4UN38W4bwlbqyK2rdpwU3A6NI6B6F7B+KNkk1OIo4b47Tz4Xj0yAl/5irVDw
	 R8cE7wCVsLAn8SojgIBVihr3A1KlCmD6LMdvgtOsa0Ed1aZUdNng4kLka6ExGTK47K
	 n4YuJb3SfdAMWIhuxdfBsoCbpbqfK4Xg2qC5wsvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A020F800EB;
	Wed, 14 Apr 2021 15:53:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4377F80269; Wed, 14 Apr 2021 15:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF2F9F80128
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 15:53:13 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BFBE8A003F;
 Wed, 14 Apr 2021 15:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BFBE8A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618408391; bh=Zazys/L17AGZ52xqLzf1a4Lu0e9jg5OvOvjz1NE8qfo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UkhGKXqaww5+fcp7JW/S2g2WlKQNpjf1XaAByumbx5ayttKpr9AZvao4dd/fjIzAu
 A/rUaT70KZWJssB5xLCRdjJBVGZ6GNgrrCrjBluJI8F7G7hiETMtiXPAagkvIRiXuV
 16gJmZt+iM23E2Gw3+fTCK07xPvQes7Q2XyyctTE=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 14 Apr 2021 15:53:07 +0200 (CEST)
Subject: Re: [PATCH] ALSA: control_led - fix the stack usage (control element
 ops)
To: Takashi Iwai <tiwai@suse.de>
References: <20210414105858.1937710-1-perex@perex.cz>
 <s5ho8ehuka5.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <084aff4e-ec8a-1be4-b0d7-06f6b29b9399@perex.cz>
Date: Wed, 14 Apr 2021 15:53:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5ho8ehuka5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Nathan Chancellor <nathan@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>
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

Dne 14. 04. 21 v 14:23 Takashi Iwai napsal(a):
> On Wed, 14 Apr 2021 12:58:58 +0200,
> Jaroslav Kysela wrote:
>>
>> It's a bad idea to allocate big structures on the stack.
>> Mark the variables as static and add a note for the locking.
>>
>> Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> 
> Applied now (with a removal of the duplicated sign-off).

Thank you.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
