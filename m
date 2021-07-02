Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9733B9BBA
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jul 2021 06:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EE361673;
	Fri,  2 Jul 2021 06:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EE361673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625201936;
	bh=X5xsv3+zXIyPkIvXyeRqKZTdP5nAnsvg6LtG0uLBQvA=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=awgJ3epPhoPGITu5jSXpp3ITvBAQSVEAM9dhn3cwolrWyLOaHCfRTYpapX/YyxBxR
	 VjYb/QQJQrVTV2Jm9iPpfg09Fq2ZfoNss4H2Urb9msPtzD3e8d8fKPFtAAey7XB+88
	 JWiYIAMvO1ZgEuprzNjmsFZEqxluI8yu9xI/mD64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3294EF80229;
	Fri,  2 Jul 2021 06:57:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC862F80229; Fri,  2 Jul 2021 06:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86338F80165
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 06:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86338F80165
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 4024741DF4;
 Fri,  2 Jul 2021 04:57:14 +0000 (UTC)
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, tiwai@suse.de
References: <20210601081753.9191-1-o-takashi@sakamocchi.jp>
 <20210601081753.9191-3-o-takashi@sakamocchi.jp>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/3] ALSA: dice: perform sequence replay for media clock
 recovery
Message-ID: <546e8029-d6ef-509b-9d1d-f70982606d50@marcan.st>
Date: Fri, 2 Jul 2021 13:57:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210601081753.9191-3-o-takashi@sakamocchi.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

On 01/06/2021 17.17, Takashi Sakamoto wrote:
> This commit takes ALSA dice driver to perform sequence replay for media
> clock recovery.

Just wanted to report back that I've been running tiwai/for-next 
including this patch and others for about a week now, and everything 
works great on a Focusrite Saffire 26; it's more stable than ffado with 
JACK and PipeWire also works. Thank you for finally fixing this!

One thing: I've noticed that on these interfaces, each 
transmitter/receiver gets a different PCM device (e.g. on this one, two 
capture PCM devices and one playback PCM device). I assume that 
bonding/simultaneous use is left for userspace to do, and that it can be 
done sample-accurately, right? This might be a little annoying for JACK, 
though not an issue for PipeWire as far as I know. With libffado on 
these DICE devices, the library takes care of bonding all the tx/rx 
groups into one set of channels.

Tested-by: Hector Martin <marcan@marcan.st>

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
