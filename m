Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D33191A1
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 18:55:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDB84171F;
	Thu, 11 Feb 2021 18:54:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDB84171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613066122;
	bh=d+8LRQqpKVD6phls2QxfN5FWPv4gXCxNxLnI4oSBHZk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXG6xvTJry6ItchZ4f48aFLGww30LUTC6M2c+ilG7b5pRW/mqH3+6GKKo5Z6hjlXT
	 HyP2tMniLxT0sV+5iIrMynJO8boSvbMgjgVzZlHhiGDB7x2t79GTGzeeN0PgwEe8qL
	 twjMUIQGv6RnYUxJ6QR61dF1Gu2WidPreYhiW+j4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDBD0F8028D;
	Thu, 11 Feb 2021 18:53:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEC32F8028B; Thu, 11 Feb 2021 18:53:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE76DF80264
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 18:53:27 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3FF80A0042;
 Thu, 11 Feb 2021 18:53:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3FF80A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613066005; bh=2Buyth78DdJIxlRXC8xCHg4bBbbdxfaPJ90Cu3W4zPA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IYyzuH+gNYnIqv0tljdBS8HD2XftjIWpIvEOGoEsRnOIgbWtNJFOIlFPeS5mmH3gI
 fuFmvrCE5TGlz2I8S/dc7XVFhltZtgHlUdvpfEDxUr1i5pK5pRj+PTK7eXhgZMJBvo
 +KuSC/jCpm/rWBnnjDiBUyNJHHEYXigzlSE+XP5M=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Feb 2021 18:53:21 +0100 (CET)
Subject: Re: [PATCH 0/5] ALSA: control - add generic LED trigger code
To: Takashi Iwai <tiwai@suse.de>
References: <20210211111400.1131020-1-perex@perex.cz>
 <s5h1rdmfrvo.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3c84c275-0c62-d2f4-38ad-be6accb3b159@perex.cz>
Date: Thu, 11 Feb 2021 18:53:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5h1rdmfrvo.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Perry Yuan <Perry.Yuan@dell.com>
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

Dne 11. 02. 21 v 18:15 Takashi Iwai napsal(a):

>> Jaroslav Kysela (5):
>>   ALSA: control - introduce snd_ctl_notify_one() helper
>>   ALSA: control - add layer registration routines
>>   ALSA: control - add generic LED trigger module as the new control
>>     layer
>>   ALSA: HDA - remove the custom implementation for the audio LED trigger
>>   ALSA: control - add sysfs support to the LED trigger module

> One thing I still miss from the picture is how to deal with the case
> like AMD ACP.  It has no mixer control to bundle with the LED trigger.
> Your idea is to make a (dummy) user element and tie the LED trigger
> with it?

Yes, the user-space code which guarantee the silence stream should create an
user space control with the appropriate LED group access bits. The alsa-lib's
softvol PCM plugin can do this silencing for example.

> Another slight concern is the possible regression: by moving the
> mute-LED mode enum stuff into the sysfs, user will get
> incompatibilities after the kernel update.  And it's not that trivial
> to change the sysfs entry as default for each user.
> It needs some detailed documentation or some temporary workaround
> (e.g. keep providing the controls for now but warns if the value is
> changed from the default value via the controls).

I don't think that we have a user space application which is using those
controls (Pulseaudio or so..) in an abstract way. I think that it's really
minor issue. We should probably concentrate for the main designed purpose
(notify about the mute / silent state) and handle those add-on features as an
experimental stuff.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
