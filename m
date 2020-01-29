Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3685D14C459
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 02:13:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD32B1665;
	Wed, 29 Jan 2020 02:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD32B1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580260438;
	bh=8tF8EpE/6PzOuRf3C8DAGd7xEzGEoBEDbUbcSgZcMrk=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZhF8NQRdhs/UHRsmjcXJfRS8epC+2IKTAl1rzRTK88VOk7sKxLrqrjO6q+657B5MR
	 hUaiSnsKxQtf7CBlChhSdb9zq88bUy9iNBxk/aiSjycCUsXSYMWWwd5faJONNKmEvv
	 N05LYQR1X3jvt2eBLIwxp+TEfhKiyCLwko4taWjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1964F80082;
	Wed, 29 Jan 2020 02:12:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95D5DF80150; Wed, 29 Jan 2020 02:12:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2986FF800FF
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 02:11:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2986FF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="CN+nWN3w"
Received: by mail-io1-xd36.google.com with SMTP id h8so16699925iob.2
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 17:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=+8eAMlH7/MD23Vz3i2I2sEJF2Jsz3Sr8i03oACJ1qJw=;
 b=CN+nWN3wjqisWxhKYT+z0GYrMZ0xxlkCfPfV5EFSKmd6f6+HPBP8jqHv8THEyffcI4
 AkvjoqSY9Lv9fousm9qx3psxlYVOKAz0nRZXn3tmohVlqFjMfxhgOjU8rKN/uIdIjzPY
 XcLmNPuOvqZbQx9nWQwmcw49BB0F/c0fqHok2qGeqZbKyxkidQvZqHAvdK6I6+DEw6IK
 /RbrV7XNsMuOUNK8pjRLF+t5Cx0RCYQ9AmickJzae6ya9OjoL7MtpAmOaCAyQjeuM/Ab
 YpyjTCHDTCYZVL8bcMOzHD7WqW3VmWCYgd3ff2vYHPq4mxvk4YMYzuQXynhrs/j8c7N0
 +uIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=+8eAMlH7/MD23Vz3i2I2sEJF2Jsz3Sr8i03oACJ1qJw=;
 b=EJ0+OuQOF82dUUeM8X3SDYUVH/bxt+jjVVEdyB2zMjlg5lqg5wBALQ2CB04/iq1CIO
 40/aU/42rwFfVOYIGjneL/gx6mWfw5SNgWyZTNY1C2mjxkyV9FIGAVY9KQTxcu6MmhX4
 QRveC6aZtfP4u7ouDKLNemRG23TzhcglqBvfEOV+KJeU2ddJ/MkMNp7Rmc8Kt/0wez4l
 twpuytOItYIPv9qvCCjh5MIfOQWAcJjkEbEyDWA2lY8ni2WqLwe0RoNJAs6sscOXv4u6
 nhHIUo5cIrVdOAhv0Xg5x2B6vBZsYybBbx7vSdHz+A3YCuT4LHaAT9CrbvoLj9K4Bmgd
 2GVw==
X-Gm-Message-State: APjAAAWUdhmXF7kEYSsioR3TCtcdVxB1dRJBduJh2SnS7HGPtRvu98YT
 ojhPFJjgOKD7XxQvMg7nkx/4PaUJmUX/x0Uw9vhxANlipNU=
X-Google-Smtp-Source: APXvYqyM+rgEP5BEoPkhWyTat2o2cQ0+Orv8rVCQ24fIqAux5kfI1rE/a8VjkiupNfpnsdzmwSZLExUkupNGlD21DPA=
X-Received: by 2002:a02:c988:: with SMTP id b8mr20389055jap.122.1580260309376; 
 Tue, 28 Jan 2020 17:11:49 -0800 (PST)
MIME-Version: 1.0
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 28 Jan 2020 17:11:38 -0800
Message-ID: <CAFQqKeW5b5BEU1cXRzxqmmSNCQ8Qnifn3mivx4yVnrtk7Ho0Tg@mail.gmail.com>
To: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Question about the right fix for a sparse warning
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

We're seeing the following sparse warning in the SOF code:

sound/soc/sof/sof-audio.c:86:31: warning: incorrect type in assignment
(different base types)
sound/soc/sof/sof-audio.c:86:31:    expected restricted
snd_pcm_state_t [usertype] state
sound/soc/sof/sof-audio.c:86:31:    got signed int [signed] [usertype]
[explicitly-signed] state

The line under scrutiny where we assign "state" is as follows:

state = substream->runtime->status->state;

and it is defined as
snd_pcm_state_t state;

There are other places (ex pcm_oss.c) where a similar assignment has been
used as well.

What fixes the issue is a forced cast to snd_pcm_state_t as below before
assigning:
 state = (__force snd_pcm_state_t)substream->runtime->status->state;

Do you think this is acceptable? If not, could you please suggest an
alternative?

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
