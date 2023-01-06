Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB265FDFF
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:32:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 887AB8C3F;
	Fri,  6 Jan 2023 10:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 887AB8C3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672997533;
	bh=n746WgD3hqttiDAK36u3HftdObyZG67fDL/mR38hR5Q=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=S+fLAz/ds+I5jRNtRjGRcKBP7RQu1jwrsLjGt09oZ5E0usAOAjvV2caKFSYJnxnhC
	 2HEBcu22Ym8JDJEtW3CFgxy6HWHMHcwPp1deyjuRsP6dFdCDSw5nIi3iPra+uEOlFP
	 WcqDog7sOsuw6VHGS1nQDGWruFTjagohcCePOLa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44502F80238;
	Fri,  6 Jan 2023 10:31:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10CA8F802DB; Fri,  6 Jan 2023 10:31:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0581CF80217
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0581CF80217
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=X/Onrk6e
Received: by mail-wm1-x336.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so3119462wmk.4
 for <alsa-devel@alsa-project.org>; Fri, 06 Jan 2023 01:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CZjG2mq/svTWuMsxUlV/QkAtUpSagHTF3MdrXvGlnMo=;
 b=X/Onrk6esOLc6UKBZ9gFTOBbEd9e2UYboopTQ9CjpuH+roaQL9t2jX7kxjfIblL6OG
 PdI9stFBwI6RL6oZ987u6ejHNjqPy30kdX3ywW/AAqI7wQocv6uJmaPkHUWfot+HArC3
 NTIgnzv5ATPWBVvKaXtjft/86oFARp4FPaaKhwpP209VtEPV2aBfktdCtNPcojAUfF3U
 1oSVLVu7Upz/qaNRRhoSHwctU+/+LiiIotnEnQ68/9GIoXsNNxSyE4SwQjtRn8xChRCh
 m3Z9wBo7rYGDrxGOtHV5szJEQbkr7RwB4OnQeeWoyjmhYly4MhyN4SaRXGTmiDFEhDjV
 QITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CZjG2mq/svTWuMsxUlV/QkAtUpSagHTF3MdrXvGlnMo=;
 b=4p18mJG3akf43k/V8gnBuoYa+5BBldo/jvipsTvnPDTW0N9vivSVdMJu0WUlz8lLVE
 ZyRSbRnhODhXBdIiFvNuVPGipLMvmh+GjC+tznafpyKfNou3ZyWhZYflfvBy1H+KTscE
 x8PN2wRbXLisdUVY3XQZDQdDaMW100dFpSXM1GoVre929GZC6UjmlRMJcTS4EpGhgwUL
 CXfJcNEZAaD/uLZXdyFin0VthB6ryUArcpnlNSpKzGv9tTIpAhLbrpHHBQzYW9ph2IWs
 tKwQI0B8iqwZ0zUAac0g56lyHwrfaAKSohB5G5KeuK9dHNmBuR5Hb+gu2ITy/+bfm6kI
 8U7g==
X-Gm-Message-State: AFqh2kpaKaB3r5nbL58DaHGOby1J3grWjc8saENVOduCUYYngVbvzur+
 RJAgBRyXedlAe/IVlRlkytI=
X-Google-Smtp-Source: AMrXdXvw9WwEvOpVfOOUeziF2fx8X3i+YbCzEWKqgR5DddpDhVd6o0PZB+ZVRZXXbYmUxjp65cILhw==
X-Received: by 2002:a05:600c:a4a:b0:3d3:3d1b:6354 with SMTP id
 c10-20020a05600c0a4a00b003d33d1b6354mr39153505wmq.3.1672997476149; 
 Fri, 06 Jan 2023 01:31:16 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003d973d4fb28sm5628609wms.4.2023.01.06.01.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 01:31:15 -0800 (PST)
Date: Fri, 6 Jan 2023 12:31:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: o-takashi@sakamocchi.jp
Subject: [bug report] ALSA: firewire-motu: notify event for parameter change
 in register DSP model
Message-ID: <Y7fqYJnNC02zsFkW@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Takashi Sakamoto,

The patch 634ec0b2906e: "ALSA: firewire-motu: notify event for
parameter change in register DSP model" from Oct 15, 2021, leads to
the following Smatch static checker warning:

	sound/firewire/motu/motu-hwdep.c:92 hwdep_read()
	warn: inconsistent returns '&motu->lock'.

sound/firewire/motu/motu-hwdep.c
    27 static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
    28                        loff_t *offset)
    29 {
    30         struct snd_motu *motu = hwdep->private_data;
    31         DEFINE_WAIT(wait);
    32         union snd_firewire_event event;
    33 
    34         spin_lock_irq(&motu->lock);
    35 
    36         while (!motu->dev_lock_changed && motu->msg == 0 && !has_dsp_event(motu)) {
    37                 prepare_to_wait(&motu->hwdep_wait, &wait, TASK_INTERRUPTIBLE);
    38                 spin_unlock_irq(&motu->lock);
    39                 schedule();
    40                 finish_wait(&motu->hwdep_wait, &wait);
    41                 if (signal_pending(current))
    42                         return -ERESTARTSYS;
    43                 spin_lock_irq(&motu->lock);
    44         }
    45 
    46         memset(&event, 0, sizeof(event));
    47         if (motu->dev_lock_changed) {
    48                 event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
    49                 event.lock_status.status = (motu->dev_lock_count > 0);
    50                 motu->dev_lock_changed = false;
    51                 spin_unlock_irq(&motu->lock);
    52 
    53                 count = min_t(long, count, sizeof(event));
    54                 if (copy_to_user(buf, &event, count))
    55                         return -EFAULT;
    56         } else if (motu->msg > 0) {
    57                 event.motu_notification.type = SNDRV_FIREWIRE_EVENT_MOTU_NOTIFICATION;
    58                 event.motu_notification.message = motu->msg;
    59                 motu->msg = 0;
    60                 spin_unlock_irq(&motu->lock);
    61 
    62                 count = min_t(long, count, sizeof(event));
    63                 if (copy_to_user(buf, &event, count))
    64                         return -EFAULT;
    65         } else if (has_dsp_event(motu)) {
    66                 size_t consumed = 0;
    67                 u32 __user *ptr;
    68                 u32 ev;
    69 
    70                 spin_unlock_irq(&motu->lock);
    71 
    72                 // Header is filled later.
    73                 consumed += sizeof(event.motu_register_dsp_change);
    74 
    75                 while (consumed < count &&
    76                        snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
    77                         ptr = (u32 __user *)(buf + consumed);
    78                         if (put_user(ev, ptr))
    79                                 return -EFAULT;
    80                         consumed += sizeof(ev);
    81                 }
    82 
    83                 event.motu_register_dsp_change.type = SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE;
    84                 event.motu_register_dsp_change.count =
    85                         (consumed - sizeof(event.motu_register_dsp_change)) / 4;
    86                 if (copy_to_user(buf, &event, sizeof(event.motu_register_dsp_change)))
    87                         return -EFAULT;
    88 
    89                 count = consumed;
    90         }

Smatch complains that there is no "} else {" path which unlocks.


    91 
--> 92         return count;
    93 }

regards,
dan carpenter
