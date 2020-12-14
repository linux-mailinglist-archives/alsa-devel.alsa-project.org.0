Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BBD2D941D
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 09:25:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A1991750;
	Mon, 14 Dec 2020 09:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A1991750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607934329;
	bh=U0+WN//bevmJCbaLA/4cT+rVgT6WoMmqDj5K4ofHn5M=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZ+o6BXW8Vxpgsq811m3N/Jh7Hka4sZawV9SUN3SDgzTTD5bAx+apkJFTFVOLilGH
	 V/H2DFbF9Bd+Id7BtswXSouCY1pq2mdAAuhr2icaVq0sUFFukWV7oK2nGaRh3m+zTb
	 jqoM+xAjM/zrOqG9cF94DgmEtfsBO8idZfvzdfE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 703A0F80129;
	Mon, 14 Dec 2020 09:23:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C543F801F7; Mon, 14 Dec 2020 09:23:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16C06F80129
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 09:23:39 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0C025A0040;
 Mon, 14 Dec 2020 09:23:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0C025A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1607934219; bh=aSUhKr3cWbLQf+NgkRmnFYl4CfdKOSfau/v8JoMq78c=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=QtBFHqNdIaGYHnZqNoEA2nspk1gjOO73KhDQ47POeAR2Lbx6kFT7G0HT9gbIm4yq5
 bfgCMlDcPew1qvyNCKvNGVlJN9v+s7/gokK5rkqW9Xv7JZ3gGXohWi4hcvAHg5hzeE
 v3I3dVrYnuMO8mWQfLgRe17oII8ecwAUH1dgMhjs=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 14 Dec 2020 09:23:36 +0100 (CET)
Subject: Re: [PATCH alsa-lib 1/3] chtnau8824: Fix mono speaker config not
 working
To: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20201206124718.14060-1-hdegoede@redhat.com>
 <64ced200-a23c-cf5a-7f21-392561cb74da@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <840442b7-88e4-aebc-eb90-f0616820c61f@perex.cz>
Date: Mon, 14 Dec 2020 09:23:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <64ced200-a23c-cf5a-7f21-392561cb74da@redhat.com>
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

Dne 06. 12. 20 v 13:50 Hans de Goede napsal(a):
> Hi,
> 
> Patch prefix should have been "PATCH alsa-ucm-conf", I have fixed this in
> my git config now, sorry about that.

Thanks for your patches. I applied them all to the alsa-ucm-conf repo.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
