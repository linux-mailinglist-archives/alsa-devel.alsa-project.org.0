Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C021E1F7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 23:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36AAE1661;
	Mon, 13 Jul 2020 23:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36AAE1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594675133;
	bh=gn8jjfpfwEqGqWyG9YejaN0CMg9I+SgQ3XyrtERjm0I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S+sneBQD8BTX4lySKz5xLJZIR83kbepgAo19SAxQYHjMZ5Ko0bX77i9re8mEE0TqZ
	 mdQNPHp6YFHT6odnMlWQjfaUF8LJ94weWAJrAL2lSt57iCazL0y3jNKXkxVpcBArlZ
	 XaKIjHRvGujN4huvsfl4MUeLcXx4bnmzbhoJ5www=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D9ACF8023F;
	Mon, 13 Jul 2020 23:17:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C77D3F80229; Mon, 13 Jul 2020 23:17:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFDE6F800B2
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 23:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFDE6F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=horus.com header.i=@horus.com
 header.b="T92rIBRH"
Received: from lenny.lan (178-190-192-205.adsl.highway.telekom.at
 [178.190.192.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "E-Mail Matthias Reichl Lenny",
 Issuer "HiassofT CA 2014" (verified OK))
 by mail.horus.com (Postfix) with ESMTPSA id F21A46409A;
 Mon, 13 Jul 2020 23:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
 s=20180324; t=1594675025;
 bh=3ovIibE6fVKAWmzx0+Hl8p1tXa2oVFQiW9IGf2GA2E8=;
 h=From:To:Cc:Subject:Date:From;
 b=T92rIBRHLcU9leow5KcHx0DxtJg2N2Palp4CbkX59sfEQXraE2o73apjNjo/vZV4n
 95w3UelmzZFpMe8+fltF8UyMKB/O+kg78aGKgKvTOzb/WlgfsqLe+gcrWwFRyHFFtM
 sa2kcq4XYdAZD3M+63etuwOVS102wu/B4oKwtNWY=
Received: by lenny.lan (Postfix, from userid 1000)
 id 66B07202235; Mon, 13 Jul 2020 23:17:04 +0200 (CEST)
From: Matthias Reichl <hias@horus.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/2] iec958 plugin enhancements for HDMI
Date: Mon, 13 Jul 2020 23:17:02 +0200
Message-Id: <20200713211704.19083-1-hias@horus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dom Cobley <popcornmix@gmail.com>, alsa-devel@alsa-project.org
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

Testing with vc4-hdmi / Raspberry Pi 4 showed that the iec958 plugin
was missing two features required for HDMI compatibility:

HD audio bitstreams like DTS HD MA or Dolby True HD are usually packed
into 8-channel 192kHz 16-bit frames but are in fact a single IEC 61937
stream at 768kHz frame rate. So the data in the 8-channel frame has to
be formatted as 4 contiguous IEC 60958 frames.

If channel status bits weren't set, iec958 indicated a sample rate of
48kHz in the channel status bits which the HDMI analyzer complained about
and caused issues with some HDMI devices if it didn't match the real
rate. That was a long outstanding FIXME since the iec958 plugin was added.

With this series HD audio passthrough and PCM audio works fine with
the downstream 5.4 RPi kernel.

Matthias Reichl (2):
  pcm: iec958: implement HDMI HBR audio formatting
  pcm: iec958: set channel status bits according to rate and format

 src/pcm/pcm_iec958.c | 117 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 109 insertions(+), 8 deletions(-)

-- 
2.20.1

