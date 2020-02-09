Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F215685E
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Feb 2020 03:13:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A322916BC;
	Sun,  9 Feb 2020 03:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A322916BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581214409;
	bh=ky1tJRhoVpa85rU+BpgVkrrTp7z/75+b+QJ4Hs69mRY=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mpVgVwGNR0WR6aXXALQO0dgGhbcwoEIApDKKHXBn3Xrqopo7uQ/UZpzNVaU4FJo78
	 U9dp+JwiZWKcvtFBh5VfkOLonIxO5shKbUqa5PxLz2gDehYQf3js/YD+cRuQti5SJy
	 U8BOq4sNukBGcR4zHvVwmURo1m8oErCzcjvjTg8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F9EF801DB;
	Sun,  9 Feb 2020 03:11:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61F51F80162; Sun,  9 Feb 2020 03:11:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DB54FF80085
 for <alsa-devel@alsa-project.org>; Sun,  9 Feb 2020 03:11:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB54FF80085
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1581214302996119976-webhooks-bot@alsa-project.org>
References: <1581214302996119976-webhooks-bot@alsa-project.org>
Message-Id: <20200209021146.61F51F80162@alsa1.perex.cz>
Date: Sun,  9 Feb 2020 03:11:46 +0100 (CET)
Subject: [alsa-devel] alsa-gobject Add shared library to operate ALSA Timer
	character device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-gobject pull request #6 was opened from takaswie:

This request is to add a new library, libalsatimer, to operate ALSA Timer
character device.

In design of ALSA Timer core, one character device is added to Linux system.
Usually a special file, '/dev/snd/timer' is used for the character device.
Userspace applications can enumerate actual timer device to operate the
character device.

For enumerations of the timer devices, the library includes a global
functions, 'alsatimer_get_device_id_list()'. The timer devices are
identified by 'ALSATimerDeviceId' which is a GObject boxed object to
handle 'struct snd_timer_id'. The other global functions are available
to the timer device, as a wrapper of some ioctl commands below:

 * alsatimer_get_device_info() = SNDRV_TIMER_IOCTL_GINFO
 * alsatimer_get_device_status() = SNDRV_TIMER_IOCTL_GPARAMS
 * alsatimer_set_device_params() = SNDRV_TIMER_IOCTL_GSTATUS

Userspace applications can allocate timer instances and attach them to
the timer device to receive timer events. The library includes
'ALSATimerUserInstance' which is an GObject-derived object to maintain
file descriptor of ALSA Timer character device. Usually, the series of
below calls are expected to use in the order to start emission of timer
events:
 * alsatimer_user_instance_new()
 * alsatimer_user_instance_open()
 * alsatimer_user_instance_attach()
 * alsatimer_user_instance_set_params()
 * alsatimer_user_instance_start()
 * alsatimer_user_instance_stop()

Against the attachment to timer device, there's a way to associate
the instance to the another instance as slave. This is achieved by a
call of 'alsatimer_user_instance_attach_as_slave()'. The
'ALSATimerDeviceId' is the lack of properties relevant to slave
association since the information relevant to slave association in
kernel space is not available for userspace application at all and
the properties are just used to transfer the information from
userspace by one way.

ALSA Timer core supports two types of events, which is switched by
'tread operation'. To handle these two, the library has
'ALSATimerEventData' which is an GObject-derived abstract class.
There are two specialized classes from it; 'ALSATimerEventDataTick'
and 'ALSATimerEventDataTimestamp'. The former is just for tick event
and the latter is for events with its type and timestamp. The selection
is done by a call of attach function with the type of event data.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/6
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/6.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
