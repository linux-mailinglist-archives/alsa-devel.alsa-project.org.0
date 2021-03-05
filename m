Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1249232E572
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 10:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99CA817B2;
	Fri,  5 Mar 2021 10:58:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99CA817B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614938376;
	bh=opULiqULWs2gw7JbOiVQeq0AQfrK5gx6q/Hmpt7IaJI=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLarOYturLGiswHJUc1ML6/ibs4RVmLBC4uuboBC/yMGjkshH5GOT4YINluU8iZ11
	 OI6ugKlEHWHjNuv4dwlk0TIzbLZ0MCtxmO8TdnQWDYoHsW1GKBIGCMKSu+o3BN656M
	 Rj1JIT1MnDKzK8iNZSRVXeSB8p/eqySvYprnGxaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65D5EF8026A;
	Fri,  5 Mar 2021 10:58:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6206F8025E; Fri,  5 Mar 2021 10:58:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA33EF800ED
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 10:57:55 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 24E8AA0040;
 Fri,  5 Mar 2021 10:57:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 24E8AA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614938274; bh=EDpY5+mauarDimGt14IqPvJot5rovogk1BYK5cXpLVI=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=iaP+ukH2Hu/ZFPGQWNIMcJRp2EmbW6kmquLTyKQxw02Fg7n1MSWa9UjX20jIzjAnx
 4oXlvD6vxX6K81K73VTZKsashWjwTNR7rr+ngi7hQ+x4zTC8O1b0NW3QzSCwO8o3wN
 8sLJTaSnggO2JXBIjHuQL57dCkK6hWTNhP5c+AkU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  5 Mar 2021 10:57:52 +0100 (CET)
Subject: Re: [PATCH alsa-lib v2 0/3] mixer: Volume control fixes
To: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20210228161304.241288-1-hdegoede@redhat.com>
 <d879513b-7047-8e95-d037-cd45669bb0b3@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d8de7ba5-8e61-8a5d-f800-65a99bcbd33d@perex.cz>
Date: Fri, 5 Mar 2021 10:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d879513b-7047-8e95-d037-cd45669bb0b3@redhat.com>
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

Dne 04. 03. 21 v 22:50 Hans de Goede napsal(a):
> Hi All,
> 
> On 2/28/21 5:13 PM, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v2 of my series of alsa-lib volume-control fixes which I wrote
>> while working on adding hw-volume control to UCM profiles for various
>> x86 ASoC setups.
>>
>> New in v2 is adding an extra entry to the capture_volume_names array
>> for the "ADC PGA Gain Volume" control used in the es8316 codec driver
>> in patch 3/3.
>>
>> Note that patch 3/3 is not strictly necessary to make hw-volume control
>> work. At least the PA hw-vol-control code does not care if the controls
>> are wronly marked as global-volume-controls instead of
>> capture-volume-controls. I mostly wrote patch 3/3 because for
>> correctness reasons, so if it is deemed controversial we can drop it.
> 
> Self-nack, I have some plans to make this more generic and I found
> another set of control-names which need special handling (which is
> the motivation to make the exception mechanism more generic).

I think that we should put the exceptions to a configuration file per driver,
but I haven't a time to propose a complete solution.

BTW: The first patch looks really straight, so I have a plan to merge it.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
