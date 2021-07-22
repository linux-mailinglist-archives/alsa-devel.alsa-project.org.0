Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FDB3D2D6F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 22:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867D116FD;
	Thu, 22 Jul 2021 22:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867D116FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626984805;
	bh=0jtYoxP4473mEMKL3RMFcmP8UBLSakGGdnB+FYpmim8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cy8OfXJch8UbyzF355gk4BMDLO+6d34V6YSgHG5haJF+EWGyS0WOApaVCvHmtZX/y
	 rSSa2UljZMY3W+6G22SJz29FiVAdt5bFr9eqzsPN/RgMFIGE7VpFEKVS4H160pCvql
	 W/L5CBJnoaz3zdE1u5ZsLngvL9O91yrKuwGG4YSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB316F802E0;
	Thu, 22 Jul 2021 22:11:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61934F80227; Thu, 22 Jul 2021 22:11:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2578F80114
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 22:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2578F80114
Received: by m.b4.vu (Postfix, from userid 1000)
 id A52AA611D167; Fri, 23 Jul 2021 05:41:40 +0930 (ACST)
Date: Fri, 23 Jul 2021 05:41:40 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/4] ALSA: scarlett2: note gen 3 support + fix four issues
Message-ID: <cover.1626959758.git.g@b4.vu>
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

In the sound-5.14-rc1 merge commit log the highlights included:
"Scarlett2 mixer code fixes and enhancements". I think that the new
support for Gen 3 devices is significant enough to be worth
mentioning.

Can you add to the next update a note along the lines of "Support for
Focusrite Scarlett Solo/2i2/4i4/8i6/18i8/18i20 Gen 3 audio interface
proprietary mixer controls"?

This set of patches is relative to v5.14-rc2 and fixes four issues:

1. The Mute/Dim/MSD Mode controls are missing the direction/function
parts of the syntax of standard control names as per
Documentation/sound/designs/control-names.rst

- This could be considered a breaking-stable change if someone is
  relying on the Mute/Dim control names not changing. I think it's
  unlikely to be a problem as this driver is still considered
  experimental and not enabled by default, but if never changing
  control names is important, then you can drop this patch.

2. The Direct Monitor control on the 2i2 interface is an Enum, not a
Switch.

- This changes a control name, but that control was only introduced in
  v5.14-rc1, so not a problem to change it now.

3. Fixes the mute status not being correctly read when the mute button
is pressed.

- Not applicable for stable; those controls were introduced in
  v5.14-rc1.

4. Sends the correct notification on line out and speaker switching
changes.

- Partly applicable to stable, but will need a separate patch.

Thanks,
Geoffrey.

Geoffrey D. Bennett (4):
  ALSA: scarlett2: Fix Mute/Dim/MSD Mode control names
  ALSA: scarlett2: Fix Direct Monitor control name for 2i2
  ALSA: scarlett2: Correct channel mute status after mute button pressed
  ALSA: scarlett2: Fix line out/speaker switching notifications

 sound/usb/mixer_scarlett_gen2.c | 34 +++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

-- 
2.31.1

