Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C7659ABE
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 17:57:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEF2F2299;
	Fri, 30 Dec 2022 17:56:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEF2F2299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672419448;
	bh=Uu02HemsdL1nARAXtimYwAhSSbOTE7cQRauPbs8ElKc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lswKPmLBOJWpzIheh6YV2tvBe9sb0p/PJp01jWjFisj4VywfusyBnB3uoCFe7zS1w
	 Tb1IL+oD7C5H07CTZA+80VidGR8I93FFCDrkC53pwjxHJYiIuxN/SEn2fEBwS0w+md
	 Fzv+AmeBXQDjjtYJ+ZirFrDBe8Jskdmm8YY3KujA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5CC5F8023B;
	Fri, 30 Dec 2022 17:56:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 649BDF8042F; Fri, 30 Dec 2022 17:56:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
 FROM_SUSPICIOUS_NTLD_FP,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,
 URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
 version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3BF0F80310
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 17:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3BF0F80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=0x1bi.xyz header.i=@0x1bi.xyz header.a=rsa-sha256
 header.s=gm1 header.b=Lz3XuVD7
Received: (Authenticated sender: ben@0x1bi.xyz)
 by mail.gandi.net (Postfix) with ESMTPA id 35876240003
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x1bi.xyz; s=gm1;
 t=1672419385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ek5cKWxDp5nUX1vHri/V+6iFqB/9Bx/G0Tn9LkuIiHE=;
 b=Lz3XuVD70h1yP8ycqv9KOJodpZm8m6AlgaFHinbqo8P4BhNT9JOGqvd4FZl6YY6diMppBv
 8ZT4jKZYLUGOpdcbeSvtLaFxBmwEJiA+ncf4isNuYei83vy4PvX/V2KXJiDzOQgbcBzK2l
 1XJdyTtiuz3Dd8kIyNVJHu6E56ZYOq4XPnjYr+I2Dc6zTLrL4cUdDsMWNY8pcNQghXRfEw
 Wrv/KZVZHi5TogvYFr67F3gx+rj69PyVupOxEH9CH498z+8KfvleSjagoRV+5ze701xm2+
 h3V1kiZC3YmfPhY0Cx/BYzKPteJcciVd+HsufHq/CPosjZfRj0nlCppVB1RoqQ==
MIME-Version: 1.0
Date: Fri, 30 Dec 2022 11:56:24 -0500
From: ben@0x1bi.xyz
To: alsa-devel@alsa-project.org
Subject: Tthinkpad Z13 No Sound From Builtin Laptop Speakers - Possible
 Problems From Codecs ALC287 And ALC3306
Message-ID: <4613ccefbaef2190699100feb391fd39@0x1bi.xyz>
X-Sender: ben@0x1bi.xyz
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello, all;

I've discovered that on the Thinkpad Z13 latpop the builtin speakers 
don't work.
When plugging in headphones through the headphone jack sound is played 
from the
headphones, however no sound has ever been heard from the speakers.

There's already been many complaints leveled against the codecs used by 
this
laptop, namely ALC3306 and ALC287 (the Lenovo spec sheet says the codec 
used
is ALC3306 however alsa displays ALC287).

I'm wondering if there's anything I can do to resolve this issue, and 
more
importantly how can this issue be prevented for other laptops with 
similar specs.

Below is an output of some relevant commands

$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: Generic [HD-Audio Generic], device 3: HDMI 0 [HDMI 0]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 0: Generic [HD-Audio Generic], device 7: HDMI 1 [HDMI 1]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 0: Generic [HD-Audio Generic], device 8: HDMI 2 [HDMI 2]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 0: Generic [HD-Audio Generic], device 9: HDMI 3 [HDMI 3]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 0: Generic [HD-Audio Generic], device 10: HDMI 4 [HDMI 4]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 1: Generic_1 [HD-Audio Generic], device 0: ALC287 Analog [ALC287 
Analog]
   Subdevices: 1/1
   Subdevice #0: subdevice #0

$ aplay -L
null
     Discard all samples (playback) or generate zero samples (capture)
default
     Default ALSA Output (currently PipeWire Media Server)
pipewire
     PipeWire Sound Server
hdmi:CARD=Generic,DEV=0
     HD-Audio Generic, HDMI 0
     HDMI Audio Output
hdmi:CARD=Generic,DEV=1
     HD-Audio Generic, HDMI 1
     HDMI Audio Output
hdmi:CARD=Generic,DEV=2
     HD-Audio Generic, HDMI 2
     HDMI Audio Output
hdmi:CARD=Generic,DEV=3
     HD-Audio Generic, HDMI 3
     HDMI Audio Output
hdmi:CARD=Generic,DEV=4
     HD-Audio Generic, HDMI 4
     HDMI Audio Output
sysdefault:CARD=Generic_1
     HD-Audio Generic, ALC287 Analog
     Default Audio Device
front:CARD=Generic_1,DEV=0
     HD-Audio Generic, ALC287 Analog
     Front output / input
surround21:CARD=Generic_1,DEV=0
     HD-Audio Generic, ALC287 Analog
     2.1 Surround output to Front and Subwoofer speakers
surround40:CARD=Generic_1,DEV=0
     HD-Audio Generic, ALC287 Analog
     4.0 Surround output to Front and Rear speakers
surround41:CARD=Generic_1,DEV=0
     HD-Audio Generic, ALC287 Analog
     4.1 Surround output to Front, Rear and Subwoofer speakers
surround50:CARD=Generic_1,DEV=0
     HD-Audio Generic, ALC287 Analog
     5.0 Surround output to Front, Center and Rear speakers
surround51:CARD=Generic_1,DEV=0
     HD-Audio Generic, ALC287 Analog
     5.1 Surround output to Front, Center, Rear and Subwoofer speakers
surround71:CARD=Generic_1,DEV=0
     HD-Audio Generic, ALC287 Analog
     7.1 Surround output to Front, Center, Side, Rear and Woofer 
speakersnull

Thanks in advance.


Ben Raskin
