Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D0A2FCCCB
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 09:38:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B23AF17FA;
	Wed, 20 Jan 2021 09:37:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B23AF17FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611131903;
	bh=WfgSexVBmWWJwjDbfpdE1l95WRywSdFXob3/cEvWMVA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KfpIfE6nP9YHOrIEqX7zDdtVS74UC/5yXFG569XtC+mM7AuXzuKa7R10fKqAaf/bq
	 7L4NdzfQNNNTzE3Is45p3kT+2KDqmsNyxgoAn440uGFDIWUpnhkcb51N8EZpQ6eAaJ
	 Mn+zIdT/XIIavbLZh8qLTrN3I9jXF3TrJI7KaUZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E22D7F80164;
	Wed, 20 Jan 2021 09:37:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 050F7F80253; Wed, 20 Jan 2021 09:37:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0252F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 09:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0252F80164
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id 1459caf7
 for <alsa-devel@alsa-project.org>;
 Wed, 20 Jan 2021 08:37:04 +0000 (UTC)
Received: from baphomet.hell (localhost.hell [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id ad8016aa
 for <alsa-devel@alsa-project.org>;
 Wed, 20 Jan 2021 08:37:04 +0000 (GMT)
Received: from base.nu ([192.168.178.2]) by baphomet.hell with ESMTPSA
 id B5S4ErDrB2B+eQEAnQSWfg (envelope-from <livvy@base.nu>)
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 08:37:03 +0000
Date: Wed, 20 Jan 2021 08:36:59 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: Re: MIDI handshake for Pioneer DJ DJM-250MK2 to enable recording
 LINE/PHONO channels
Message-ID: <20210120083659.dq55wilk2bl7wm6e@base.nu>
References: <435f4228-e323-5caf-9209-1372221e12fb@frantovo.cz>
 <acafdceb-6e84-2166-2e99-150a2ea89f56@mixxx.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acafdceb-6e84-2166-2e99-150a2ea89f56@mixxx.org>
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

Thank you for copying me in.

I would love to support Pioneer devices under Linux ("fully"). I.e:
	for DJM mixers: the ability to use audio and midi IO with ALSA
	and by extension pulse/pipewire/JACK and so on. This is my bias.

I'm partial to things just working™ so would prefer it to be a kernel
module but the inclusion in-tree is not for me to say.

Lets continue this discussion on the Mixxx chat for now.

Kind regards,
Olivia


On Tue, Jan 19, 2021 at 08:46:03PM -0600, Be wrote:
> I discourage doing this in the kernel. If Pioneer did this in their drivers on Windows and macOS, I would recommend doing it in the kernel. But they do not; Rekordbox does it at the application level. Mixxx users are currently unable to use the phono inputs of these devices regardless of OS (see https://mixxx.discourse.group/t/pioneer-djm-250-mk2/17001/29 ). The best way to implement this would be through Mixxx's MIDI controller mapping system so that it works across Linux, Windows, and macOS.
> 
> I am CCing Olivia Mackintosh because the Pioneer DJM 750 likely uses the same or very similar MIDI signals. They could probably share one MIDI script in Mixxx. The Pioneer DJM 900 NXS2 probably uses the same or very similar signals too.
> 
> If you're interested in implementing this in Mixxx, let's continue the discussion in Mixxx's Zulip chat: https://mixxx.zulipchat.com/
> 
> > Dne 19. 01. 21 v 9:54 Takashi Iwai napsal(a):
> > >/I haven't looked closely, but if it's about MIDI messaging, it can be /> >/implemented in the kernel, too (only if it fits better than /> >/user-space), yes. If it's over HID, it's a different story, though. />
> > Yes, it is only MIDI. The scenario is:
> > 
> > 1) send a greeting message to the mixer
> > 
> > 2) receive a greeting message
> > 
> > 3) send another constant message
> > 
> > 4) receive the response
> > 
> > 5) compute something and send it back
> > 
> > 6) receive the confirmation message
> > 
> > 7) start sending a keep-alive message each 200 ms
> > 
> > Specific received messages might be consumed by kernel (invisible for user-space), but others should flow undisturbed to the user-space. The sent messages should be injected and intermixed with normal messages coming from user-space. The kernel should not claim exclusive access to the MIDI device, because user-space tools might want to use it too.
> > 
> > Is there already anything similar, for inspiration?
> > 
> > Franta
> 
> 
> ------------------------------------------------------------------------
