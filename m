Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A574471949
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 09:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDDDD1AE9;
	Sun, 12 Dec 2021 09:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDDDD1AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639297606;
	bh=Nxg/T7LTiN98okU15PL/Wn+gVrLMjOD3yin6g5GdJCM=;
	h=To:References:Subject:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uto/sAvq0aWaqtrvUFtA2a3oF8vrO+xn5C6fJU2mo7A5tIowe9Y2uSICiz+3xL+TG
	 FjKuauVggf10QNdjwHdu67L1+k5NBflfPizV00AwYn+neFa5U6DSNp/aBayjLdF5VD
	 3dFaNd8Fshm9dIFTEPSs3zs0FRunDm3QeHWc44qQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95B63F80529;
	Sun, 12 Dec 2021 09:23:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31B4CF804CC; Sat, 11 Dec 2021 19:34:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B426F804AE
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 19:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B426F804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net
 header.b="KrWL5/Ph"
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4JBGdH1bRNzDyPd
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 10:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1639247651; bh=Nxg/T7LTiN98okU15PL/Wn+gVrLMjOD3yin6g5GdJCM=;
 h=To:References:Subject:From:Date:In-Reply-To:From;
 b=KrWL5/Phb+cITb7/c4C4KLL9DqZFrHkVpAToeS3iOd8gUoMxejH2Fr/G1fcw9fJ5x
 58bxxsYOhINNNsRTnFnFjq0GYGIOA02Tdvbcf2+ILPizxYBX+cXNeAdmjg8g3Y7t4b
 1Z4EfqPLbtcw5XvMUiMaXeeae59KGYhukjkX+mxE=
X-Riseup-User-ID: 0BCD44199FF510A58BFF42977CC0D4DEDB91F43BBE66F634ADA4ED31B285795C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4JBGdG6fQDz1xmv
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 10:34:10 -0800 (PST)
To: alsa-devel@alsa-project.org
References: <977e3179-89a8-6abf-8a8f-7afe13c44dee@leemhuis.info>
Subject: Re: Is it a regression? 5.15.5: No sound with speaker-test. 5.12.13:
 it works.
From: Paxton Evans <paxton@riseup.net>
Message-ID: <aeedbdcc-14a6-1431-da1b-5de07c305948@riseup.net>
Date: Sat, 11 Dec 2021 13:34:09 -0500
MIME-Version: 1.0
In-Reply-To: <977e3179-89a8-6abf-8a8f-7afe13c44dee@leemhuis.info>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Sun, 12 Dec 2021 09:23:26 +0100
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

Hi,

I'm sure I'm nowhere near as technical as the other users on this list, 
but found this thread by searching about the same problem: I had sound 
with older kernels, but no sound with 5.15.5 (or 5.15.6). I can "see" 
the audio playing in equalizers like Pavucontrol, but no sound actually 
plays, and ALSA's speaker-test doesn't play anything either.

This is on a MacBook 2,1 with the audio device listed as "Intel 
Corporation NM10/ICH7 Family High Definition Audio Controller (rev 02)" 
and is driven by snd-hda-intel. I've set no options that I know about.

Since I've never mailed this list before, would someone mind letting me 
know the proper way to do a helpful test for the ALSA developers? 
Preferably on a live image or something like that, just so I can have as 
clean and helpful of an environment as possible. Again, sorry for my 
ignorance.

Thanks,

Paxton

