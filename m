Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A53EE632E93
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 22:15:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1713B1672;
	Mon, 21 Nov 2022 22:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1713B1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669065342;
	bh=aQjNw4oCAkbjiXCmmD75lHabB6K/hjDK2WLDaNEzpvM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AlSf6Ad8RlGuCdN38PgzS7cfN0H8vvF5kZtEwMYktZvdqV/Dsfmr22GX8Ayq0b/qX
	 JfzoHIs4lv46nRnQUeqJnZ574+CxFeytSCcoc+u0PNQyAsX9dZgixGnHPXPGT59v6n
	 E5JMfO9sznDMrUYn7XIJNPjY+tKxeUGspVbKfb/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ED60F800EC;
	Mon, 21 Nov 2022 22:14:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22D57F8028D; Mon, 21 Nov 2022 22:14:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD6DBF800F3
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 22:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD6DBF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=carlh.net header.i=@carlh.net
 header.b="RKNxNBWe"
Received: from [164.90.213.35] (helo=main.carlh.net)
 by smtp.hosts.co.uk with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim) (envelope-from <unknown@carlh.net>) id 1oxE7l-0008nT-AU
 for alsa-devel@alsa-project.org; Mon, 21 Nov 2022 21:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=carlh.net; 
 s=rsa1;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pzvl3lcVr/zerYxZODxBXNmLbrwzU2xUbHDqALim7Js=; b=RKNxNBWeursP8gZitReiGxex+A
 UrdNnQEas4cchALvI2YKhcVFzTRk4S3HEPy0u4ZzSjxSbYGt8b0EKtmJAkyV2b8tZzWZx3TRmd4iS
 Y9AxFi+dF6SXPHptl2ttk4mJdR4CuS0avRSzWBi5o4qQBnBXqK7gWSfjuyVQ8cGt/hTOcH3ywl9Ph
 jWPYTSBIxo17beYLOvxROXljtde+WscGFrISEYJxApTkY9L9mT4NH/uUhW5W7ex5PODarvWWlAAAx
 7O+zHZ4hia9mvgsBRcpNN8xNBtbC/jqMJ+1jHa5n9Dzjl5Una60AZYg4SvtthlNOkXfIdd5sRuv7r
 ARL3xDDg==;
Received: from carl (helo=localhost)
 by main.carlh.net with local-esmtp (Exim 4.94.2)
 (envelope-from <unknown@carlh.net>) id 1oxE7j-00AYTF-Dw
 for alsa-devel@alsa-project.org; Mon, 21 Nov 2022 21:14:39 +0000
Date: Mon, 21 Nov 2022 21:14:39 +0000 (GMT)
From: Carl Hetherington <lists@carlh.net>
To: alsa-devel@alsa-project.org
Subject: Query about xrun on usb/pcm
Message-ID: <b4e71631-4a94-613-27b2-fb595792630@carlh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam_score: -1.9
X-Spam_bar: -
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

Hi all,

I wonder if anybody has any clues/suggestions about problem I'm seeing
with an XMOS-based USB sound card.

As far as I can see, the card has endpoint 0x82 set up for capture data,
0x2 for playback data, and 0x82 is also used as the sync endpoint for
playback.  I'm assuming that's a fairly common arrangement?

I am testing it using simultaneous playback and capture, and simulating
a high-CPU-load case by sleeping for long enough to cause a lot of
xruns.  After some random time, I see a failure case that I'm struggling
to explain.  It goes like this:

There's an XRUN on the playback PCM, so __snd_pcm_xrun happens, then
  stop_endpoints() happens, and:
      it decides not to stop 0x82 because its running is > 1
      it stops 0x2, so its state goes to EP_STATE_STOPPING

Then the ALSA userspace code calls prepare on the playback PCM to get it
going again.

This ends up in wait_clear_urbs(), which does nothing with 0x82 as it is
still running.

At this point, the prepare thread is interrupted by an XRUN on
the capture PCM. With this PCM, there is no sync endpoint, and 0x82 is the data
endpoint.
In the xrun handler:
  stop_urbs() sets 0x82 to EP_STATE_STOPPING.
  ... and the xrun handler finishes.

Then we end up back in the prepare for the playback PCM.
wait_clear_urbs() then sets 0x2 to STOPPED, and the prepare is finished.

Now, snd_usb_endpoint_start() is called on 0x2 and that is fine.  Next,
snd_usb_endpoint_start() is called on 0x82 and that fails because its
state is still STOPPING.

At this point things seem broken.

Does anyone have a hint about where in this sequence things are going
wrong, and maybe even why?

I'm more than happy to clarify anything I can, or provide more debugging
information.

Thanks in advance!
Best,
Carl


