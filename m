Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41514AE157
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 19:47:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48FAE17C9;
	Tue,  8 Feb 2022 19:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48FAE17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644346042;
	bh=Sio1Cib/ndP1GsZmxKgam9eiC3k6UcSrw9Al0Y3Jebw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eYGSatyrHSGrSp0kS8NVD5/tpq+rvRF7ZjriWGRpUjlqUmstWP4JtJDwyZaRR4ZwI
	 2bL4fJjAwofnQ3CBc8+twlWSLnn9idUB7NzLeL6PfrwG88azl5IT/pqy6mUUAOVqfy
	 XnP30zmINFGg7WQ6Vfn3SsdGQeVB1JiHu8v+p+hY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B04F800EB;
	Tue,  8 Feb 2022 19:46:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98CB5F8013C; Tue,  8 Feb 2022 19:46:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7A02F800EB
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 19:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A02F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="Rv0+L7pP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1644345967;
 bh=mgba46R4ONRjV4DYAX9AkYI0wu7RttvyVzb71ZfZx5I=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Rv0+L7pPYtMpgNHlt/3AljL66i9raNzcgd+uQNOThlkcjdSCYdZVjgb/2jcfe3XfU
 Wma4TaqLSw5BBpvFlZ0OOeuFEo1zGZ3FmRIz/IdXTk6NgbH471dn8g+dmeZxiICKig
 idR6qqa09j0Eq8P115GN69dK3fVd4pub5PYfSceY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [185.196.22.219] ([185.196.22.219]) by web-mail.web.de
 (3c-app-webde-bap22.server.lan [172.19.172.22]) (via HTTP); Tue, 8 Feb 2022
 19:46:07 +0100
Message-ID: <trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22>
From: dmummenschanz@web.de
To: alsa-devel@alsa-project.org
Subject: Cannon Lake PCH cAVS (ALC892) not detected by kernel driver
Date: Tue, 8 Feb 2022 19:46:07 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:DeY/SOQEd3lzhP00o1YDDyBJu1VfcrGpxJ94Qx9pfFkQo7pzaGlugo+15l7cxj+Pa3pSe
 hjRlAshvlyN8BvVHcKl6hnF87+KzuQc8VI5BOhsCHM0d4Ide8C+r8w0Hik4df4v0aKn0K1S07Hao
 sK8FG5MWMy2he1L8AXCsZHbpa4kf8rY40/PwTcK2lPpLY16nwwEvMr69LWTDz8RSd90vhVlHmxRx
 J7c/QLUFvNsTljK+2N6bZaBBqPDocCOY87vw2ke/MebCNmXtXa8pwv2iY9AzUERS4POHka6dZ7ja
 FI=
X-UI-Out-Filterresults: notjunk:1;V03:K0:laFHSQlYuCg=:JsjpIH3vWFwAB/H3SEjSeA
 3FMThG8L+l0i5y9zHIjQ97EaomocfL77xQh2IpHp6eIagNX3B64A2jg0EXxcJ0iOIiY1yR86v
 dDyciFqy/u8t99fTFYqyEdnl6xztmRyjOI+VwO8IvGhFIOYhate6PgqZVMkGg0DzTwWnsaO0P
 gloE+QEeGiW5OZrCLPYDQPMbRwao45ml+ZXVuQ9fpLRAEmWPxRIIRaLzKXYM2g3XORIaaifsY
 jQwAZHyDqJl4qU81tPrHxktrfOFFvU8uJs9EFS+4E7+jLOw4SercCZnpLL7AIcJt4vCpnH9BX
 8vzeToiJl0/EoNfawwGaSjuqlMg8gloDPvEpP/k1b54U8JEJ7sRSsv1g3lJ7dJGOSuXmXYQ0q
 L5p7WzW/ZhBGhV+MzVpnUscr1LZy28/0Kiwa4oKTyzZ0SEDDXRHAPGrtBGAOFuhuw/LNMecIb
 ym72Cvn2djrgrj6QnDVTw8y801itghl99VNhk4xWKVIcVnSB66Zs2HP15GejlhnGqttsWaWHQ
 LdOh8c9CihNWLyzV2fdt0ccw1ivsUK9lrZNpQO+eMDWbQShcBXc6pmMF6hWEyZxL1z9Ftl0uh
 uUmv4SDcEr2QsBPjzSz2agsHl/vvXr5NptfPpWlqwKjTu8yS+snl5mwHj7KFzW/sit4/jKXb5
 BFPtJJtxd/RWnAaqDC44cWu7pNAYw26AFb4dsvLDddcEB14mOFJFzhaWDuMYBi9+GcFqovwCj
 FRBwIXJTXK8+sPTW6THTQY94ULZ0LD126NdeimRXM6Csds5NEXsnhYIOOOrar5CdAR0xt3iAI
 po/OaSD
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

   Hello,

   the audio chip Cannon Lake PCH cAVS ALC892 does not get recognized on
   my system. Only the HDMI devices are recognized.

   lspci shows the following audio device:
   00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)

   dmesg only shows:

   [  189.559786] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops
   i915_exit [i915])
   [  189.581395] input: HDA Intel PCH HDMI/DP,pcm=3 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input20
   [  189.581503] input: HDA Intel PCH HDMI/DP,pcm=7 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input21
   [  189.581628] input: HDA Intel PCH HDMI/DP,pcm=8 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input22
   [  189.581711] input: HDA Intel PCH HDMI/DP,pcm=9 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input23
   [  189.581849] input: HDA Intel PCH HDMI/DP,pcm=10 as
   /devices/pci0000:00/0000:00:1f.3/sound/card0/input24


   ALSA-info file:
   http://alsa-project.org/db/?f=96102ee84f258d1cac83ed33795356550181511c

   There is a workaround availble:

   echo auto | tee /sys/devices/pci0000\:00/0000\:00\:1f.3/power/control
   echo 1 | tee /sys/devices/pci0000\:00/0000\:00\:1f.3/remove
   echo 1 | tee /sys/bus/pci/rescan

   unfortunately this doesn't work for me. The device never shows up.
   Sound on winX works fine on this device btw.
   I'm happy to assist with any attempts to make the sound work.
