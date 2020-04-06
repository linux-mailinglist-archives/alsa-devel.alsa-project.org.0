Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400319F112
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 09:41:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A51681662;
	Mon,  6 Apr 2020 09:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A51681662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586158905;
	bh=MzPnEkk6eq+2QYuE+6HLuekJyUbOuUVnYwInBPWZII8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iThdDRNBKumGKqzCisvOfR+H9PN7nIsDyGeEhuL41KqE4dsyJnIojeqHyqUyqLSVh
	 iTKFQ6acyJWXAT7mcBiIBRgQKX3G22NWGZ4LFWYM7TChdAcUgbTKsnaUlX3k4x6+O4
	 S+qKEo8hO2JA6AsBxawRPsFO3EAeWZucb4kKzsNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3CBEF80150;
	Mon,  6 Apr 2020 09:40:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B5D8F80143; Mon,  6 Apr 2020 09:40:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D16C1F80140
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 09:39:57 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A16B0A003F;
 Mon,  6 Apr 2020 09:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A16B0A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1586158794; bh=STkl02HnLxcPFpOGX8B4xuXasbsmLQtucRPgWYimGDU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=G3HWG01OjvcQSVZCySo/9liBw54ECN9eIjABo56OR9X36Q4Lpj1CerrJpUI3fPgYY
 po/wxVNbW8LUHcfEzWuovj0Kv70sI2XGXz/LFOLMKK+3QkxI92VArwi0QyfxYjQOed
 fwEJvqdNG2UdUHP4zB5YhN+wUOcEwFhwWU3JhC2I=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  6 Apr 2020 09:39:52 +0200 (CEST)
Subject: Re: [PATCH 1/5] bytcr-rt5651: Fix dmic check in HiFi-Components.conf
To: Hans de Goede <hdegoede@redhat.com>
References: <20200405183454.34515-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <06bd19cd-e1c0-4be3-4784-2a9bde6a9d2d@perex.cz>
Date: Mon, 6 Apr 2020 09:39:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200405183454.34515-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Dne 05. 04. 20 v 20:34 Hans de Goede napsal(a):
> The kernel sets cfg-mic:dmic not cfg-mic:dmic1 when a digital mic is
> used. The wrong check for cfg-mic:dmic1 causes there to be no "Mic"
> device at all, which causes the check for the ConflictingDevices section
> of the HeadSet (mic) device to fail like e.g. so:
> 
> [hans@localhost ~]$ alsaucm -c bytcr-rt5651 set _verb HiFi set _enadev Speaker
> ALSA lib parser.c:1138:(verb_dev_list_add) error: unable to find device 'Mic'
> ALSA lib parser.c:1433:(parse_verb_file) error: device management error in verb 'HiFi'
> ALSA lib main.c:962:(snd_use_case_mgr_open) error: failed to import bytcr-rt5651 use case configuration -2
> alsaucm: error failed to open sound card bytcr-rt5651: No such file or directory
> 
> This commit fixes this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   ucm2/bytcr-rt5651/HiFi-Components.conf | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ucm2/bytcr-rt5651/HiFi-Components.conf b/ucm2/bytcr-rt5651/HiFi-Components.conf
> index 53ebcbe..d0a573e 100644
> --- a/ucm2/bytcr-rt5651/HiFi-Components.conf
> +++ b/ucm2/bytcr-rt5651/HiFi-Components.conf
> @@ -34,11 +34,11 @@ If.headphones {
>   	}
>   }
>   
> -If.dmic1 {
> +If.dmic {
>   	Condition {
>   		Type String
>   		Haystack "${CardComponents}"
> -		Needle "cfg-mic:dmic1"
> +		Needle "cfg-mic:dmic"
>   	}
>   	True {
>   		<codecs/rt5651/DigitalMic.conf>
> 

Applied. Thanks.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
