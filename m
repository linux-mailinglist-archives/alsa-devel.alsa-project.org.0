Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5DA5F327C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 17:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF0AB172C;
	Mon,  3 Oct 2022 17:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF0AB172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664810931;
	bh=3bjNg0senpYsxg8iTNTIKcaF3n/KIdd0MQRGjKWJwCk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FfkKZb59M8E1OjnwwI2U0bzC9irBuRHUXXCvfSi/nUSeSgAKC34vckiHjL4D+4oDV
	 SLQhPQBWfnIm22Wgf3Yy9ZLmMzIZ4zUdW4ioiEo6HufixV8yDNC4v0GNta0fKgMN22
	 3CezVb5JGPDzNePV6g1hawsURFcwgZbgQSUK9Yv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF0FDF80431;
	Mon,  3 Oct 2022 17:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93D7EF800CC; Mon,  3 Oct 2022 17:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81120F800CC
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 17:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81120F800CC
Received: by m.b4.vu (Postfix, from userid 1000)
 id BEF24604B9E6; Tue,  4 Oct 2022 01:57:37 +1030 (ACDT)
Date: Tue, 4 Oct 2022 01:57:37 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Split endpoint setups for hw_params and
 prepare (take#2)
Message-ID: <Yzr/aQ3nSTPeGDq1@m.b4.vu>
References: <20220920181106.4894-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920181106.4894-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
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

On Tue, Sep 20, 2022 at 08:11:06PM +0200, Takashi Iwai wrote:
> This is a second attempt to fix the bug appearing on Android with the
> recent kernel; the first try was ff878b408a03 and reverted at commit
> 79764ec772bc.

I found that full-duplex audio for Scarlett devices was broken in
5.19.11 but working again 5.19.12, presumably due to this. escuta at
https://linuxmusicians.com/viewtopic.php?p=148734#p148734 reported
that it was broken from 5.19.9 but 5.19.8 worked (they also reported
that 5.9.12 didn't work, which I can't explain).

5.19.12 and 6.0.0 work for me, but 6.0.0 + your v2 patch makes the
gnome sound settings app crash when setting the output device to
Scarlett if the input device was already set to Scarlett.

Using the gnome-control-center (42.3) app (Fedora 36, PipeWire 0.3.59,
WirePlumber 0.4.11) to test:

- Kernel 5.19.11: can't set both input and output device to Scarlett;
  changing output to Scarlett makes the input device switch to
  something else, and changing the input device to Scarlett makes the
  output device switch to something else

- Kernel 5.9.12 & 6.0.0: can set both input and output device to
  Scarlett, all good/normal

- Kernel 6.0.0+v2 patch: if both input and output device are already
  set to Scarlett, works fine. Change output device to something else
  then back to Scarlett, the settings app hangs. Kill the app, restart
  it, the input & output device are both Scarlett & it appears to work
  fine again until you change the output device to Scarlett when the
  input device is already Scarlett. Changing it in the other order
  (set input device to Scarlett when output device is already
  Scarlett) works no problem.

Regards,
Geoffrey.
