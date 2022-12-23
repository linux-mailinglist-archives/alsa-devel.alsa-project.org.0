Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD396554A5
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Dec 2022 22:02:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35A7C8F68;
	Fri, 23 Dec 2022 22:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35A7C8F68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671829328;
	bh=q5K0mHrhshnLXGGdlmtcpVhvRppbgORwXLwni8whZHA=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uf8QZLZd1cVfjkGvqeXqh5+IaTZVaVdhDrTiN69oe4R8AytaV0YCqOgzsiov0gE/1
	 aXcM7jVP+6vIEvdW1CKWrQUGlFIR+Ck+j/ivU3dT6MsNec/RIbKVbi7CFlvYeco6/s
	 EUusOFIEY2w5etAY04DwA/irqQvWt7YTva7hDd1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04149F803DC;
	Fri, 23 Dec 2022 22:01:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E0E4F804B0; Fri, 23 Dec 2022 22:01:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from disco.pogo.org.uk (disco.pogo.org.uk [93.93.128.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E887F8024D
 for <alsa-devel@alsa-project.org>; Fri, 23 Dec 2022 22:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E887F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=xwax.org header.i=@xwax.org header.a=rsa-sha256
 header.s=swing header.b=bYimCWOF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xwax.org;
 s=swing; h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:
 Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FXqZMTadCVW374CKFjghDnXy8gVlUK8LZPDpO0a8FEc=; b=bYimCWOF4Pdlg3meDHAH8SDUIN
 3b7tof7oJ84a/gVGxPKHBogMmFcJavb1VhEqAzd649JTOGX0lrurmxM7cm/hkqjx1OQsvY0iAC7PG
 UP8qqSbI521YKlIvzdXrFOnWt5xUQbtiZWIqI7EkhAP0c6EZ2FAU6eEyTppGg9BMK6zs=;
Received: from cpc93788-hari17-2-0-cust1237.20-2.cable.virginm.net
 ([82.39.100.214] helo=stax)
 by disco.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95 (FreeBSD)) (envelope-from <mark@xwax.org>)
 id 1p8pA6-0000Wu-Cs; Fri, 23 Dec 2022 21:01:02 +0000
Received: from localhost (stax.localdomain [local])
 by stax.localdomain (OpenSMTPD) with ESMTPA id a6b4ca07;
 Fri, 23 Dec 2022 21:00:59 +0000 (UTC)
Date: Fri, 23 Dec 2022 21:00:59 +0000 (GMT)
From: Mark Hills <mark@xwax.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: rt5650 on HP Chromebook G5 Setzer faults
In-Reply-To: <06af4d22-1032-bc2e-b9da-ebfd966d144d@linux.intel.com>
Message-ID: <2212232048170.25609@stax.localdomain>
References: <2212181230200.24243@stax.localdomain>
 <06af4d22-1032-bc2e-b9da-ebfd966d144d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 19 Dec 2022, Pierre-Louis Bossart wrote:

> On 12/18/22 7:02 AM, Mark Hills wrote:
> > HP Chromebook (11a, G5 "Setzer") uses snd_soc_sst_cht_bsw_rt5645 module
> > and presents a device "rt5650".
> 
> can you share the result of 'aplay -l', wondering which platform driver you
> are using.

I've pasted below; "rt5650 [sof-bytcht rt5650]" is in the output.

> > Audio works briefly, until after about 30 seconds it's interrupted by a
> > square wave or short buffer cycling.
> 
> If this is with the SOF driver, there's a known issue and a known workaround,
> please add this to /etc/modprobe.d/alsa-base.conf
> 
> options snd_sof sof_debug=1

Thanks. It does indeed appear to be a workaround. I didn't notice any 
additional debug in dmesg.

For my own interest, do you have a URL or link to the origin of this 
workaround?

I did however manage to trigger the same sound when Firefox opened the 
audio input device in another tab while playing a YouTube video. I didn't 
see a bug report in dmesg. This isn't a use case I'm too worried about 
yet.

But this has certainly improved stability to the point that it's usable! 
Thank you.

-- 
Mark



$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 7: HDMI 1 [HDMI 1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 8: HDMI 2 [HDMI 2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: rt5650 [sof-bytcht rt5650], device 0: PCM (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: rt5650 [sof-bytcht rt5650], device 1: PCM Deep Buffer (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0

