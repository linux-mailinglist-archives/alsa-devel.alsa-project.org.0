Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE43ADF6F
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 18:48:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E2716D2;
	Sun, 20 Jun 2021 18:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E2716D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624207680;
	bh=Y31jmsRcaqFnZo7RKnrHXVB7zTEa8kDp8MOJnKYyrPw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jb1zMWpJgI47hZOZmh+8GTwiP5de1T6gK5WHQXxRDnvvK5AnfCc+6ZtR8oJHaFbZw
	 qZ+i0W8HYi+EPFDDfDhOmhmU3l4SFjbe4QYPJqwb3ZT3MMPShBbfLJkjYUxdd2nfQR
	 +9UyJjwGcQnjFVdq01fcEcG0qJEzvGteoNWquESo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EE79F80424;
	Sun, 20 Jun 2021 18:46:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2946DF80271; Sun, 20 Jun 2021 18:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E270F80166
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 18:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E270F80166
Received: by m.b4.vu (Postfix, from userid 1000)
 id 9AA4C61E2871; Mon, 21 Jun 2021 02:16:15 +0930 (ACST)
Date: Mon, 21 Jun 2021 02:16:15 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH V2 00/14] Cleanup before adding Scarlett Gen 3 support
Message-ID: <20210620164615.GA9148@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

Hi Takashi,

Here is version 2 of a set of patches which is some cleanup of the
Scarlett Gen 2 mixer driver in preparation for adding Scarlett Gen 3
support.

One review comment I got (from Hin-Tak) was:

> 40+ patches is a lot, for modifying just one file. I would collapse
> it all into one and break it up again to under 10, maybe, broadly
> into "functionally-equivalent re-org", "small isolated bug fixes",
> "additional functions, not yet used", "hooking up those new
> functions", etc?

I'm not sure that I agree with that comment -- I tried to follow the
Documentation/process/submitting-patches.rst advice of "Separate each
logical change into a separate patch" for easy review of the
individual pieces, but perhaps I went too far in that direction?

Please let me know if I should combine some of these patches together.

After this set of patches I have a second set of patches almost ready.
They add a few features to the Gen 2 support and update the code ready
to add Gen 3 support:

  ALSA: usb-audio: scarlett2: Add usb_tx/rx functions
  ALSA: usb-audio: scarlett2: Update initialisation sequence
  ALSA: usb-audio: scarlett2: Fix 6i6 Gen 2 line out descriptions
  ALSA: usb-audio: scarlett2: Always enable interrupt polling
  ALSA: usb-audio: scarlett2: Add "Sync Status" control
  ALSA: usb-audio: scarlett2: Merge common line in capture strings
  ALSA: usb-audio: scarlett2: Reformat scarlett2_config_items[]
  ALSA: usb-audio: scarlett2: Improve device info lookup
  ALSA: usb-audio: scarlett2: Move info lookup out of init function
  ALSA: usb-audio: scarlett2: Remove repeated device info comments
  ALSA: usb-audio: scarlett2: Add scarlett2_vol_ctl_write() helper
  ALSA: usb-audio: scarlett2: Add mute support
  ALSA: usb-audio: scarlett2: Allow arbitrary ordering of mux entries
  ALSA: usb-audio: scarlett2: Split struct scarlett2_ports
  ALSA: usb-audio: scarlett2: Fix Level Meter control

The final set of patches adds Gen 3 mixer support and then adds
support for the new Gen 3 features:

  ALSA: usb-audio: scarlett2: Add Gen 3 mixer support
  ALSA: usb-audio: scarlett2: Add support for "input-other" notify
  ALSA: usb-audio: scarlett2: Add Gen 3 MSD mode switch
  ALSA: usb-audio: scarlett2: Move get config above set config
  ALSA: usb-audio: scarlett2: Allow bit-level access to config
  ALSA: usb-audio: scarlett2: Add support for Solo and 2i2 Gen 3
  ALSA: usb-audio: scarlett2: Add "air" switch support
  ALSA: usb-audio: scarlett2: Add phantom power switch support
  ALSA: usb-audio: scarlett2: Add direct monitor support
  ALSA: usb-audio: scarlett2: Label 18i8 Gen 3 line outputs correctly
  ALSA: usb-audio: scarlett2: Split up sw_hw_enum_ctl_put()
  ALSA: usb-audio: scarlett2: Add sw_hw_ctls and mux_ctls
  ALSA: usb-audio: scarlett2: Update mux controls to allow updates
  ALSA: usb-audio: scarlett2: Add speaker switching support
  ALSA: usb-audio: scarlett2: Update get_config to do endian conversion
  ALSA: usb-audio: scarlett2: Add support for the talkback feature

If you'd like to see the commits so far all at once, please check this
branch:

https://github.com/geoffreybennett/scarlett-gen2/commits/scarlett-gen3-for-next

Thanks,
Geoffrey.

Geoffrey D. Bennett (14):
  ALSA: usb-audio: scarlett2: Remove incorrect S/PDIF comment
  ALSA: usb-audio: scarlett2: Fix 18i8 Gen 2 PCM Input count
  ALSA: usb-audio: scarlett2: Coding style improvements
  ALSA: usb-audio: scarlett2: Remove unused/useless code
  ALSA: usb-audio: scarlett2: Remove interrupt debug message
  ALSA: usb-audio: scarlett2: Remove redundant info->button_count
  ALSA: usb-audio: scarlett2: Rename buttons/interrupts/vol
  ALSA: usb-audio: scarlett2: Rename struct scarlett2_mixer_data
  ALSA: usb-audio: scarlett2: Add temp variable for consistency
  ALSA: usb-audio: scarlett2: Fix data_mutex lock
  ALSA: usb-audio: scarlett2: Fix scarlett2_*_ctl_put() return values
  ALSA: usb-audio: scarlett2: Fix union usage in mixer control callbacks
  ALSA: usb-audio: scarlett2: Don't copy struct scarlett2_config
  ALSA: usb-audio: scarlett2: Remove hard-coded USB #defines

 sound/usb/mixer_scarlett_gen2.c | 425 +++++++++++++++++---------------
 1 file changed, 224 insertions(+), 201 deletions(-)


base-commit: f8fbcdfb0665de60997d9746809e1704ed782bbc
-- 
2.31.1

