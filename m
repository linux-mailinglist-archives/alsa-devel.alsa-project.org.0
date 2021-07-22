Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD373D1F9C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 10:05:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63CE716AE;
	Thu, 22 Jul 2021 10:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63CE716AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626941107;
	bh=bJfmMi8jyqGnM0QKfNLbu1MGsPI7HrdDIdJn2LiDJkE=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gZR/5mxBwLhhvNtNwuGdkF29XP5ZmmJ4m5YKQNry3VB2PL8T2+Zz3cjsj7EhhQmDd
	 CvjSVEprJ4bQvwPz6TyQbSTOhrw3MlnsMdfEzTzoA934LHHI1xpGxgkaj10uY1qCKm
	 UMqt/uI3rA/IJgM9tLQ8HT392gvcXASLTSuiO/Oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9A70F800DA;
	Thu, 22 Jul 2021 10:03:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1AE8F80227; Thu, 22 Jul 2021 10:03:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from hypra.fr (hypra.fr [62.210.38.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75049F800F2
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 10:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75049F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hypra.fr header.i=@hypra.fr
 header.b="DvZ0zHT2"
Received: from [192.168.43.205] (unknown [37.165.132.112])
 by hypra.fr (Postfix) with ESMTPSA id 91C1E5853B3;
 Thu, 22 Jul 2021 10:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hypra.fr; s=mail;
 t=1626941010; bh=bJfmMi8jyqGnM0QKfNLbu1MGsPI7HrdDIdJn2LiDJkE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=DvZ0zHT22zhn2NNJD1EeDHm4uWjz8gM8BN5QtnowR2KoGxVLHxSHyywOQxoJvZHBJ
 zar5sorqAW01NCB9n24XOVm1uiEbDiVLmC5bwMFb9BWjKAUAVdqDY0xE9+PfiYpsUj
 YVe7tCBgg08YbJKDgTORpTuX3pN65X9QI+k0MDFQ=
Subject: Re: Any way of making this Intel SoC sound cluster work?
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <2b85cc42-7446-2f7b-734c-1c3edbe3bcdd@hypra.fr>
 <f1d9a696-a462-1187-0dd9-14884ed9e97c@linux.intel.com>
From: Valentin Villenave <vvillenave@hypra.fr>
Message-ID: <dece2b48-9883-5503-c07c-69af4fd01838@hypra.fr>
Date: Thu, 22 Jul 2021 10:03:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f1d9a696-a462-1187-0dd9-14884ed9e97c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Le 21/07/2021 à 15:11, Pierre-Louis Bossart a écrit
> I suggest we continue the thread on the GitHub issue 2955

Hi Pierre, I’ll do that indeed.  Many thanks!

Cheers,
-- V.
