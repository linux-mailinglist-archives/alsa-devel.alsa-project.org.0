Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 143331FCC2D
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 13:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E0F51678;
	Wed, 17 Jun 2020 13:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E0F51678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592392980;
	bh=02sKjSwgkPm0JejYfuilPBK0uhpMMCgzckQlPu+G78A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z9pqOOb9e8Jwf/EGWG6873qLdlwpFhCFFI8o0Ysb3IsJvQ4bbLayDRdhv5fmDXY6Y
	 uWi6L09ogNZkXIPttwYnWZfNI0ciFKcu9UDSBeoZBW6nCI11sMbEIjnAdcUlAmEIsG
	 9RuqChZthZfqpOrcNLKpKVO/88NF7ybTtm8L9Z4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52A23F801D9;
	Wed, 17 Jun 2020 13:21:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C5F8F80171; Wed, 17 Jun 2020 13:21:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEF98F800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 13:21:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7E435A003F;
 Wed, 17 Jun 2020 13:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7E435A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1592392865; bh=c4mk5jwbXL0J7ZYL9lgyi61rcpug+iCWUqiaWMZlNIY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=af5Oj6u5jtwZsVkLfECJ/KD1kXOt8njjdoVx+EW5sT6m2y3/P+XhKBV0mAiHmktX+
 3iWyBV2oApecb6BRUYKtaOltYO0ea+ThNMHf86UdtRsVfLfywCgT4kLpH8KSBh6ctm
 PRppqrbf1r0G72eWpGTDX6E7B3lThbgxGSR0pnUQ=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 17 Jun 2020 13:21:02 +0200 (CEST)
Subject: Re: How to populate required string as audio endpoint name in gnome
 audio devices tab
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <7c9bdd7c-efe9-c37c-3fa6-a6f611c43fc3@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ec8c1c5a-a169-8d9c-c897-2bd9ed6593d3@perex.cz>
Date: Wed, 17 Jun 2020 13:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7c9bdd7c-efe9-c37c-3fa6-a6f611c43fc3@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: hui.wang@canonical.com
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

Dne 17. 06. 20 v 7:47 Mukunda,Vijendar napsal(a):
> Renoir platform has onboard dmic + south bridge HD Audio endpoint support.
> For onboard Dmic, Audio endpoint name is populated as "Analog Input"
> in Audio input devices.
> How can we populate name as "Internal Mic" or "Dmic" in audio input
> devices tab  in sound settings?
> 
> Alsa info link: https://pastebin.ubuntu.com/p/4kprhDZYbg/
> Pluse audio info output: https://pastebin.ubuntu.com/p/sdx9Xs234C/

It's question for pulseaudio. For the legacy ALSA code in PA, you need to 
create profile, mixer path and udev rules. The probe mechanism used in PA 
looks for the volume controls and path switches (kcontrol) API to determine 
the device name. If not found, the generic name is used.

It's better to finish the UCM support for this hardware:

https://github.com/alsa-project/alsa-ucm-conf/issues/30

					Jaroslav

> 
> Thanks,
> Vijendar
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
