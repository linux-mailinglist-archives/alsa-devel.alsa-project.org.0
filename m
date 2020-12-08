Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43E2D27C8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 10:36:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F340016C3;
	Tue,  8 Dec 2020 10:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F340016C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607420218;
	bh=JGb1tBGQO+TXww0TVyWmbvWXSuU9O9NnWnZ324EP4cs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l4QIvKYDKzPX80UhCJ7wAkHUzXd7R5YIjHk+MYelEX7wlrgNafBoSt9BcjVL5cof5
	 P+VzTZxJEQEcUQhQJvXW1nqZtrQW0WYgHm4m/5tu0pwJKX4KGbUWshow3h3uR2OZl5
	 pHMHrwN2C+8LI75bTF8AQYomhYu14C96TOyxc9Rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E8E8F80218;
	Tue,  8 Dec 2020 10:35:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05C33F8019D; Tue,  8 Dec 2020 10:35:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5D8BAF800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 10:35:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D8BAF800E1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1607420111685517073-webhooks-bot@alsa-project.org>
References: <1607420111685517073-webhooks-bot@alsa-project.org>
Subject: Unable to use ALSA JACK PCM plugin on Debian 10 and on raspbian
Message-Id: <20201208093522.05C33F8019D@alsa1.perex.cz>
Date: Tue,  8 Dec 2020 10:35:22 +0100 (CET)
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

alsa-project/alsa-plugins issue #15 was opened from UgoPoddine:

Hello everyone,

a) I have installed libasound2-plugins from repository on a Debian Buster machine (4.19.0-12-rt-amd64 #1 SMP PREEMPT RT Debian 4.19.152-1 (2020-10-18) x86_64 GNU/Linux)  and on a raspberry PI3 (5.4.79-v7+ #1373 SMP Mon Nov 23 13:22:33 GMT 2020 armv7l GNU/Linux) up-to-date (none of these running  pulseaudio of course)
b) I have modified  my .asoundrc configuration file according to https://jackaudio.org/faq/routing_alsa.html
c) I can see jack and rowjack virtual devices in aplay -L
d) starting qjackctl I'm unable to see the expected new capture_x devices. Of course jack runs correctly with physical devices (eg. PC mic or USB mic)
e) jack is at jackd 0.125.0rc1 version
f) Alsa is at Version k4.19.0-12-rt-amd64 on the AMD64 machine, at Version k5.4.79-v7+ on the RaspberriPI machine
e) any attempt of playing test files over jack device (aplay -D pcm.jack <wav file> ) generates the error :

ALSA lib pcm_plug.c:1286:(_snd_pcm_plug_open) Unknown field playback_ports
aplay: main:828: audio open error: Invalid argument

Can you help ?

Thank-you
Best regards
Ugo Poddine

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/15
Repository URL: https://github.com/alsa-project/alsa-plugins
