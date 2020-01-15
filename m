Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A5D13CBED
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 19:17:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2884017AB;
	Wed, 15 Jan 2020 19:16:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2884017AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579112264;
	bh=CyOi0Rvu951n4EuY1bmrVvsT9eUo7VzuTIsfIzwS67Y=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L5FPwVz0yE98fyej8bX/ScsH597emW7bThwJYj3mmOiCntdvUKWw0YUL4JbtoKmZh
	 79nQR6/ivt2k505MZDzARGosxlbxvtCYZh4a8muioh9LBRew0/jpHhdY+hpyz+Gpsf
	 knKtJ/jAZB6iROISpQAfKFI1q6K5BM87PYjylS8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DC72F8014B;
	Wed, 15 Jan 2020 19:16:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8E4CF8014B; Wed, 15 Jan 2020 19:15:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E19A6F800CC
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 19:15:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E19A6F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="aLV6LHzp"
Received: by mail-io1-xd36.google.com with SMTP id b10so18770483iof.11
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 10:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=eEkA44QxP5CxKfL7j9wAUj43WkOOHNo1MegPO0V9L+4=;
 b=aLV6LHzpExqIM+VTNL2ujOHaS7p7aYSykAYbcV/1jC1k/lgCUeM4l6k4fPak9+35XE
 ubjS2sb1JRrk89Q9P0sCifmN275gENkzHNcOWWcc7KCcVZi46mOfue9VlZZw1wv+D2g+
 EliD+UXM0Ljy5krLitc0PB1O5Ba+EZ0GS+gSUCOUdoPVbUkt9pVccPSlnc/EhkHBmE1r
 4mUCll8sMvlr6mhsNEMMOc3c/1cYb19KJ6K9VzTu5evb5CcsaNAeR31UpEZiWMUmZNlv
 9Kt0mFfYwb6LzMMeiSE6uuyTT3jtXyFtqNTX7gs9uGKklnjy9DCdUurDevoBIUuAJ2t/
 vI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=eEkA44QxP5CxKfL7j9wAUj43WkOOHNo1MegPO0V9L+4=;
 b=Pu9LnVXH8UvnQASZCibB8h28n40vAioOVEa/JF1bK3djWkRtKOj79+Zw+OurA4OlzC
 bFHByw5WljdJQHszajc+cEVmsBDhcNJslDKSyRKoPVt7aNsnf5+/Ki7t109AlWQoETtO
 q/9iSLk7y3thyAEJfXshKeMQ5AFG+bvW5MdENZpLZPpMH0+7BmLilqYhYVi/GsOLd8GV
 fcPGndbReFjlSyiNiUkg13RPm3kk6Yi0a3QdkAL/niil4SWtLz5RKmBTPLamOE3tzyV/
 fcbEvNwlnqY1YDVE3+W8pqn9EgaQpRIAkTPPgCrigaHCLyA8BPe/0jQT1OxS0fWiUVte
 P7zw==
X-Gm-Message-State: APjAAAWVmVQjI2Z814d6907Y7lpKEEgj9ufSgOzKiMf9nOjEGgtXtwsD
 9SpdqhfLHpR5zrq0PRNSpObbZK+N1yfuXEkdn/q500CM88U=
X-Google-Smtp-Source: APXvYqzzL9MpQoSfyjv17xsuDahhV+wsHVfMm/ftsoe/vg5phDYzyBEEiJDDknxOqmJO5mhOp5sNbZFBBwKHmakZIXE=
X-Received: by 2002:a02:9203:: with SMTP id x3mr24227114jag.62.1579112151484; 
 Wed, 15 Jan 2020 10:15:51 -0800 (PST)
MIME-Version: 1.0
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Wed, 15 Jan 2020 10:15:40 -0800
Message-ID: <CAFQqKeV3fG8=DaV4_rGDL3QH7gG9zEHwS9T41aOag+-cNN9wnQ@mail.gmail.com>
To: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "Vehmanen, Kai" <kai.vehmanen@intel.com>, "Uimonen,
 Jaska" <jaska.uimonen@intel.com>,
 Pierre-louis Bossart <pierre-louis.bossart@intel.com>
Subject: [alsa-devel] Question about runtime PM for HDA codecs
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

Hi Takashi,

Can I please bother you with a question about how to handle the situation
with runtime PM for HDA codec on one of the Intel CML-based platforms with
an ALC285 codec.
Basically, the problem we're facing is that when using the SOF driver,
jack detection doesn't seem to work as intended because the codec gets
suspended right after the headset is plugged in.
After a bit of experimenting, what we found was that calling
snd_hda_set_power_save() with a delay of 0 or something > 0, both help with
fixing the problem.

But, I have a basic question about this. What is the expectation for
enabling the codec runtime PM?
I see that the legacy driver calls snd_hda_set_power_save() based on the
CONFIG_SND_HDA_POWER_SAVE_DEFAULT value. In the case of SOF, we do not
explicitly set this value so it is 0 by default. Also, when the codec is
registered, the runtime PM for the codec is enabled by default without
checking if the power_save delay is set to 0 or not. And later when the
snd_hda_set_power_save() is called from the legacy HDA driver probe, it
sets the use of auto suspend and the delay to be used based on the config.

Would it be correct to remove the pm_runtime_enable() call
in snd_hda_codec_register() and let the codec runtime PM enabling be set
with the call to snd_hda_set_power_save() for both the legacy HDA driver
and the SOF driver?

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
