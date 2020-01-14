Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FD713AA81
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:18:03 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86D8C2F5A;
	Tue, 14 Jan 2020 12:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86D8C2F5A
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD18F8029A;
	Tue, 14 Jan 2020 12:23:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B347FF80273; Tue, 14 Jan 2020 12:23:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1DD6F8014E;
 Tue, 14 Jan 2020 12:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1DD6F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="SwwwzMlA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579000975;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=NEm4r2L6YMhWhTiesiaJYXaO8wIDHtA2KYWEMI8ZPKg=;
 b=SwwwzMlAK9WzmF6/q67kjcqELmmUREJMtD3h1zmBEIfE/TI6U/HIfo+z2/CU5+H7hw
 bcEedHkhfsRIUqHdGv5lE0VtSe3sxJGgv8hbo5KBZhJaXWSGt1COcWjDXh8SfVHQi3jV
 WwsYMr5Mpt8NJNmxvZdlM6k++qCGufFZ2RIvtjZiXBFPK9c/rQBkEhujlNHuedHTXcYj
 Gdqdh0OpFL7dYaYYrxE0tmFDtNv2q6IowKZ3unDcQ9ohAP77+/ddDcSMTL9Hcjv/3j/Z
 5H2vhAg+C0OMXwOrs54my3RgF7HfO9jZxnfcWreoS465IaKrUcNdR7TFn4p5jRMjmh1c
 S45g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7IOGU5qzCB3a93viaVr"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0EBMrUL9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Jan 2020 12:22:53 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 14 Jan 2020 12:21:03 +0100
Message-Id: <20200114112110.51983-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>
Subject: [alsa-devel] [PATCH alsa-ucm-conf 0/7] DB410c/msm8916-wcd UCM
	fixes/additions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is a collection of fixes/refactoring/additions for the DB410c UCM files.
My goal is to also make them usable for other MSM8916 devices, e.g.
the three MSM8916 smartphones which can run mainline Linux since
https://lore.kernel.org/linux-arm-msm/20190722092211.100586-1-stephan@gerhold.net/

For now this is just preparation - this patch series refactors the DB410c
UCM configuration into re-usable device fragments that can be included
when needed.

By the way: it seems like the UCM2 conversion (specifically,
commit 14facf88b56 ("DB410c: adapt to ucm2") breaks PulseAudio because
the Playback/CaptureChannels were moved from all the "SectionDevice"s to
"SectionVerb":

I: [pulseaudio] alsa-ucm.c: UCM available for card msm8916
I: [pulseaudio] alsa-ucm.c: Set UCM verb to HiFi
W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device DigitalMic, assuming stereo duplex.
W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device SecondaryMic, assuming stereo duplex.
W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device PrimaryMic, assuming stereo duplex.
W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Handset, assuming stereo duplex.
W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Earpiece, assuming stereo duplex.
W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Headphones, assuming stereo duplex.
W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Speaker, assuming stereo duplex.
I: [pulseaudio] module-alsa-card.c: Found UCM profiles
E: [pulseaudio] alsa-ucm.c: No sink and source at HiFi: DigitalMic
E: [pulseaudio] alsa-ucm.c: No sink and source at HiFi: SecondaryMic
E: [pulseaudio] alsa-ucm.c: No sink and source at HiFi: PrimaryMic
E: [pulseaudio] alsa-ucm.c: No sink and source at HiFi: Handset
E: [pulseaudio] alsa-ucm.c: No sink and source at HiFi: Earpiece
E: [pulseaudio] alsa-ucm.c: No sink and source at HiFi: Headphones
E: [pulseaudio] alsa-ucm.c: No sink and source at HiFi: Speaker
I: [pulseaudio] alsa-ucm.c: Set ucm verb to HiFi

It seems like PulseAudio does not inherit them from "SectionVerb",
but I'm not sure if this is a problem in PulseAudio or alsa-lib.
Restoring Playback/CaptureChannels for all the "SectionDevice"s fixes the problem.

Stephan Gerhold (7):
  DB410c: Rename Handset to HeadsetMic
  DB410c: Split devices into re-usable fragments in codecs/msm8916-wcd
  codecs/msm8916-wcd: Speaker: Reset volume on disable
  codecs/msm8916-wcd: Headphones: Drop invalid RDAC2 MUX value
  codecs/msm8916-wcd: Earpiece: Add missing Enable/DisableSequence
  codecs/msm8916-wcd: SecondaryMic: Select correct input
  codecs/msm8916-wcd: Add ConflictingDevice for capture devices

 ucm2/DB410c/HiFi.conf                     | 128 +---------------------
 ucm2/codecs/msm8916-wcd/DigitalMic.conf   |  18 +++
 ucm2/codecs/msm8916-wcd/Earpiece.conf     |  22 ++++
 ucm2/codecs/msm8916-wcd/Headphones.conf   |  29 +++++
 ucm2/codecs/msm8916-wcd/HeadsetMic.conf   |  22 ++++
 ucm2/codecs/msm8916-wcd/PrimaryMic.conf   |  20 ++++
 ucm2/codecs/msm8916-wcd/SecondaryMic.conf |  22 ++++
 ucm2/codecs/msm8916-wcd/Speaker.conf      |  21 ++++
 8 files changed, 160 insertions(+), 122 deletions(-)
 create mode 100644 ucm2/codecs/msm8916-wcd/DigitalMic.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/Earpiece.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/Headphones.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/HeadsetMic.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/PrimaryMic.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/SecondaryMic.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/Speaker.conf

-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
