Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0FC3470E6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 06:33:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67E10167C;
	Wed, 24 Mar 2021 06:32:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67E10167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616564024;
	bh=Lu0Za9IlCvLNENdD1cyjSlHHt/qcoM20IPlDTwMziHU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jl3B6JkubvsSgq/vMZQoGeaIbi7c/rt90xsspeZgdZkThvj3GaJCP8wNWvtssCxNi
	 HvbPFmM6i3rdPyek0hz/eWYidLk95HpotxiNXlmJFinlBTCkrmrNz+RPmj7zkWWmX0
	 CV8gyLaYrjSEGFI+SUidZqwOErxhChNBIm5h7qQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE8E8F801D5;
	Wed, 24 Mar 2021 06:32:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BDA6F80104; Wed, 24 Mar 2021 06:32:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E2FDF80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 06:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E2FDF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="Vo3VtY7y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gT+iPIScTSrdaf+pEYFiAROVSjqIw2qWx0cAll4zqX0=; b=V
 o3VtY7yc+xOd/zE3jZUAWYuVsPFNqJAMAHb681k74Fwjliz0auvcfxLZHwc88SkrVQHljp1dlG1so
 hScQdgr6Na47oLv8YS5ffuqeIxw+lylbPjBFIs1m4svPoDILzmzOKAntCyNsRG3cQ3+9ILZExCJx+
 P1KQVKKkfISwgvlzLIljKT82qBnY4ATHlS7wrYcQr6NHu6ZzqLSvJDkmN+mNP26svvp8jF89hapg5
 y1Vsp7EmG4IPEX1wD/6K0b7AseOQte0QJQEXE6V/yfewMHDg7icxoaalkInVFskjvSOY3YhFKxJGe
 hfe7QCE2xItKd9XtpNLDH0fFSOxjFihDw==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lOw7l-005YhP-B8; Wed, 24 Mar 2021 06:32:09 +0100
From: David Henningsson <coding@diwic.se>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 0/1] sound: rawmidi: Add framing mode
Date: Wed, 24 Mar 2021 06:31:53 +0100
Message-Id: <20210324053154.34107-1-coding@diwic.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: coding@diwic.se
Cc: David Henningsson <coding@diwic.se>
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

Hi,

When writing an application that records midi (and e g saves it to disk), ultra-low latency isn't really needed, all we need to know is exactly when the midi message came in. The application can then wake up once a second or so, to write the incoming data, including an accurate timestamp for every event, to disk.

As far as I can see, the rawmidi interface does not support such a feature at all. There is a snd_rawmidi_status syscall, but its timestamp field is not even filled by the kernel (!). But even if that was fixed, it would not fix the problem as there could be several midi events in the buffer with different timestamps.

You could use the seq interface, it does support timestamps, but I can see at least two potential problems with this:

First, the seq code runs in a work queue, not in the actual IRQ. This means that midi event is timestamped too late, especially so if the work is delayed for some reason.

Second, seq hard-codes the timestamp type to monotonic - there is no monotonic_raw, so the timestamp would be affected by NTP changes.

Also, the timespec uses 32-bit for sec and nsec, but I suspect this is less of a problem (unless people constantly record midi for sixty years or so...).

So here's a patch that adds a new "framing" mode that stuffs all MIDI data into 16 byte frames, 8 bytes of timestamp, one byte length, up to seven bytes of data. I'll follow up with an alsa-lib patch if this gets merged. 

David Henningsson (1):
  sound: rawmidi: Add framing mode

 include/sound/rawmidi.h     |  1 +
 include/uapi/sound/asound.h | 18 ++++++++++++++-
 sound/core/rawmidi.c        | 45 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 62 insertions(+), 2 deletions(-)

-- 
2.25.1

