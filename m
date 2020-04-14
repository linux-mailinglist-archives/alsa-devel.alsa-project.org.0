Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4FB1A757B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 10:08:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD2016A1;
	Tue, 14 Apr 2020 10:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD2016A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586851734;
	bh=U+3eZH7hflXB93UplIGze9jOouvdurlHRu0PUGcoVfc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e7ayc6szVcJ+qp0XFKopVLl9BQsFqlHTf9G5Ym/vvIlN1K0yEGNG5n83kClKGt7lD
	 4IPrF2qg3c4D2chqPWGHTkLDHHtNllyM8X2Rmq7iNCmFaHqCd/CXlJ2cvCpaWbUFOD
	 mk9dJnHiDD9kRXhiJ0HirLaYLNV+0ULz5BzWhpdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE212F800B9;
	Tue, 14 Apr 2020 10:07:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05DEFF8013D; Tue, 14 Apr 2020 10:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 060F8F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 10:07:04 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 85104A003F;
 Tue, 14 Apr 2020 10:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 85104A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1586851623; bh=PB4KzaZ5knlKGRNYnyckPpvf3UxxNIBEajwP1yPF+8g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bOfz5BQlNkgCcHIgLcLwFI9ZOoAwfB3/LgVT+eB6TblNYcagCNBjflvcaZY29djna
 L0Np/xfsiVaE9L4Wn2hsUW1LHG/xrbRszdLF6FQNPj7Tl9fUBesyvdlZHU5mZkrNBr
 mqqT3qT46bhJReXHPlw1E7hxux+ZMKA+lLgRm9KQ=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 14 Apr 2020 10:07:00 +0200 (CEST)
Subject: Re: [PATCH] bytcht-es8316: fix Speaker or Headphone no sound if
 enable Mic or Headset
To: Hans de Goede <hdegoede@redhat.com>, youling257 <youling257@gmail.com>
References: <20200413145957.22459-1-youling257@gmail.com>
 <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d6146d62-a20a-f6a0-64f0-65cea7253948@perex.cz>
Date: Tue, 14 Apr 2020 10:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
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

Dne 13. 04. 20 v 17:46 Hans de Goede napsal(a):
> Hi,
> 
> On 4/13/20 4:59 PM, youling257 wrote:
>> alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Mic, Speaker will no sound.
>> alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Headset, Headphone will no sound.
> 
> I see the problem, so the idea of the global EnableSequence is
> to set defaults and then the EnableSequence of currently active
> devices run on top.

It's ok, it's just a wrong use of the alsaucm command. The PA should activate 
HiFi verb only once. Those two commands run the verb EnableSequence twice.

The correct test should be:

alsaucm -i -c bytcht-es8316 set _verb HiFi
alsaucm>> set _enadev Speaker
alsaucm>> set _enadev Headphone
alsaucm>> set _enadev Mic
alsaucm>> set _enadev Headset

... you may run the enable commands with a delay for tests.

The current UCM is designed for one task (application). I am playing with an 
idea to extend the alsactl state daemon to preserve the UCM settings and state 
for multiple applications using an RPC mechanism (dbus?).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
