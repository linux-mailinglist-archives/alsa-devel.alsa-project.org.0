Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DCC598E04
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 22:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D11F785D;
	Thu, 18 Aug 2022 22:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D11F785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660854514;
	bh=Mnm1EkK+xFlSCKbYpbAd5jiPDAOH9nAsothL3Onnyac=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iX2UlmRXP7eDvltDb9aj6d3zyE4qVPcV++XQeyVQ5Lw2CuWcFHSElQWGZAevCc5hN
	 ZqzEr9JC5m2lYABYOMfoYP49Sfp/PD05UCWVMss9HiU0DEY7GORYZ6DNpN2MFYFHOo
	 wdS96FKkLhy2VJy/pN46GdiYiLVT8/p4YIb/WQTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A00EF80495;
	Thu, 18 Aug 2022 22:27:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1360F800EE; Thu, 18 Aug 2022 22:27:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hermes.661.org (hermes.661.org [192.81.131.210])
 by alsa1.perex.cz (Postfix) with ESMTP id 76897F800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 22:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76897F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=661.org header.i=@661.org
 header.b="qezGKMAB"
Received: by hermes.661.org (Postfix, from userid 1000)
 id B241A499C8; Thu, 18 Aug 2022 20:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=661.org; s=202208;
 t=1660854444; bh=Mnm1EkK+xFlSCKbYpbAd5jiPDAOH9nAsothL3Onnyac=;
 h=Date:From:To:Subject:From;
 b=qezGKMABnBixqjZK/18NYgz5X2mvF1wG5T6b7U9u3JJ/nbGPanfYTOEbAgcjOtaOC
 tW1dfTtkH9VTObqsHP0FleGqFZVF3OadWzC2LatslyHKz+ASlmADFRzp59QPSyER1r
 xthIoSBUPLiEoTdu4Is28znAlsGzFRnsCYXbJRHF1Y+j+S9bxFroOlfLXyEZ9DHaj3
 vq4Uqnqe3Izy6WarPCXtMoNBDdOQnTo7HY//gqE7CITbgFKEapegkaVAPqNlgJWOaz
 D7KnMbDJsgCv97FsIYrXKMGW2PEdd16oAhiyLJHSnQaEA36xAb638QiMF1vT0TNpqt
 gmhwpA6YgfneA==
Received: from localhost (localhost [127.0.0.1])
 by hermes.661.org (Postfix) with ESMTP id AFAAB499B0
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 20:27:24 +0000 (UTC)
Date: Thu, 18 Aug 2022 20:27:24 +0000 (UTC)
From: David Griffith <dave@661.org>
To: alsa-devel@alsa-project.org
Subject: Raising volume past 100%
Message-ID: <f1ffc452-12bd-5955-f36b-a9c8ba4424a@661.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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


After reinstalling Debian on a laptop, I once again had to face the 
problem of how to get volume out of the built-in speakers boosted.  The 
last time I reinstalled, I somehow got the MATE volume control applet to 
let me turn the volume past 100% using the mouse wheel.  Over the past two 
days I've been trying to rediscover what I neglected to write down.

I'm already aware that by bringing up the Sound Preferences dialog, I can 
raise volume to 153% and no further.  I also know that I can use
pulseaudio-ctl(1) or pactl(1) to set the volume at any arbitrary level 
past 100%.

I remember that I went looking for solutions other people found for this 
that involved editing /etc/asound.conf or ~/.asoundrc, but the best I can 
get with that is add an extra slider to alsamixer's display that acts as 
apreamplifier.  I was going off of 
http://alien.slackbook.org/blog/adding-an-alsa-software-pre-amp-to-fix-low-sound-levels/.

What could I have possibly done to make this work the last time?

-- 
David Griffith
dave@661.org

A: Because it fouls the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?
