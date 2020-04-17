Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4C01ADCD7
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 14:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35CA31663;
	Fri, 17 Apr 2020 14:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35CA31663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587125042;
	bh=zf0LPgg+aBMkBtgtSLhwJ4yAE7j3NA2+SUXg+NSr4bo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rIbOUQdVMi7KEJeqg1AMp6SF2Au7WfWrohjITwZRhp1uYZ+ewJ+QqqNMUHLVoxUzc
	 EisNLt/73vTDsM7ER5rnfTkzwQbKSLrujFa+UPbGszw4lj+jtNy/Xn8EP5OLfMmwy4
	 kH9Fm0Hct4lUUhKp/YCkzot4M4totqfo+jAGWXeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41244F800AB;
	Fri, 17 Apr 2020 14:02:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1139BF80245; Fri, 17 Apr 2020 14:02:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6013F800DE;
 Fri, 17 Apr 2020 14:02:04 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DC25CA003F;
 Fri, 17 Apr 2020 14:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DC25CA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1587124923; bh=U4NdJyZ4tbMrS0ovBXH6Mx+bJnG5Y0Ivq+S0n7jrA0g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=z49LEccKmZZfF+qJGwG8SKDeFYU9zMNqjjnHggVAPxIRw6MXQEECzq6jvAdAOj0oA
 d3+oV0DjzZfCTafFs3IiGM/8vOZQKzQWWx1Sy4ZNecbAWA7URA351/KsgrQYav0qPP
 SIS84YRRAN/XX9znSZP1eqWzqC/hhnX/zcdiSurQ=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 17 Apr 2020 14:02:00 +0200 (CEST)
Subject: Re: [PATCH alsa-lib] conf: USB-Audio: Fix S/PDIF output of ASUS Xonar
 AE
To: Ivan Mironov <mironov.ivan@gmail.com>, patch@alsa-project.org
References: <20200326194645.164265-1-mironov.ivan@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1f0f0b42-3ebf-fbe9-c6da-db5b12317bb1@perex.cz>
Date: Fri, 17 Apr 2020 14:02:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326194645.164265-1-mironov.ivan@gmail.com>
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

Dne 26. 03. 20 v 20:46 Ivan Mironov napsal(a):
> ASUS Xonar AE is a PCI-Express card containing USB controller:
> 
> 	USB controller [0c03]: ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller [1b21:1142]
> 
> and the actual USB sound card:
> 
> 	ID 0b05:180f ASUSTek Computer, Inc. XONAR SOUND CARD
> 
> As other Xonar USB sound cards, it uses second device for digital
> output.
> 
> Signed-off-by: Ivan Mironov <mironov.ivan@gmail.com>
> 
> diff --git a/src/conf/cards/USB-Audio.conf b/src/conf/cards/USB-Audio.conf
> index 89811086db1d..3f4c421b7e2c 100644
> --- a/src/conf/cards/USB-Audio.conf
> +++ b/src/conf/cards/USB-Audio.conf
> @@ -40,6 +40,7 @@ USB-Audio.pcm.iec958_device {
>   	"USB Sound Blaster HD" 1
>   	"Xonar U7" 1
>   	"ASUS XONAR U5" 1
> +	"XONAR SOUND CARD" 1
>   	
>   	# The below don't have digital in/out, so prevent them from being opened.
>   	"Andrea PureAudio USB-SA Headset" 999
> 

Merged. Thank you.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
