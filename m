Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C97679E8D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 17:23:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9076CE0E;
	Tue, 24 Jan 2023 17:22:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9076CE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674577422;
	bh=NTFRYN5IySlxO3ote3vFFVLmhVHnZnzwXVg82S5ERyc=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BjPeGtPgufxsYZk3BBjWaCUGw73Stw0KWx4MdydHlX9FlevkEnnliLWEjqUhxj8Pk
	 MPO8mRWJxsMnHj3t43VG0/mqWkOpp3Ui5i55A2ib0Y7in/O7d3KE12MA91MhgNqu0c
	 rQF+eDEGK1VItOlEeB+XcpbWPl/F1priKx7NG4V8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE10CF800FB;
	Tue, 24 Jan 2023 17:22:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD47F8027D; Tue, 24 Jan 2023 17:22:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9B13F800FB
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 17:22:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B13F800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mbuki-mvuki.org header.i=@mbuki-mvuki.org
 header.a=rsa-sha256 header.s=google header.b=V8inYfam
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-4c131bede4bso225547647b3.5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 08:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbuki-mvuki.org; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=l/2rXGFvQGg5PvOXxQh+dsp0oKYBZJfQmboa2WXrfEI=;
 b=V8inYfamgWxFxkhUQa+Uyy9X7Nsvww0hzuyd4cwvPzj2IoD57je+7b1c2bp1Uux+us
 tFuJMIf+kDoCOWRjgyRkZGNIypdE50kjLb8EiSwmjbggxdkLGu48VyYJSSeZlGJ2IdMS
 l1gVHXMvatFQltHNFXrLqYkjGjxyT8Z3zlzr4W09bOORBij5L51+ETdBJNng2TI4QNnA
 rCHBA+Kj7R4Af0+ITtmmxSXVfX4Z/0LW4PxutabMs0um0KH2dqxCwlwNB7PALLe2kVzd
 wz9ltIo1L/OaUeXZT1+qbvuQY+gYXoBuY9LcS44uX+XsUCULqsW+LJv0g0bkqlgokfgy
 c4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l/2rXGFvQGg5PvOXxQh+dsp0oKYBZJfQmboa2WXrfEI=;
 b=hIW+ev1JRgvKGOm7wrwxaI/cpPTQe/HTSXYcxrBn4BI5siP2HM8aXv6YuY6Xv6yV9r
 PSl/YrZSoZCMG//2fWeobSKmBq1USZQFtqe3p9K9a0B3IXxuFCjS4w+Os3NvEbvhpADk
 SQgrYp5sRVGeOg+Z74Q+F+c58HimJim9DtxqL+KLaD7iaOTGWJ7yTgyuXl6ryeqq8j0Z
 6HEVzkA8bG+TuB1yDrv2anTGynVHMxr1JQ6uGAirPo22wKMc4ag+iUm36wTWmG/Fsk0l
 ADTVxq2VlozelS+QMpAZ3FbUlYL+tIqsXQSOVLJtdOj54YZxvnUsMEXaTHXaQ9hmkthN
 1F+w==
X-Gm-Message-State: AO0yUKWSpRVsz6QPtp0ZRoXFRLH6siZqBZHdS2JFP3Nd+TPBmTI50ag3
 5m5VYrZfhSS6s4JKnm3+ggq3PXjjB2TAOgV21VCRv40ElHHpsP57d/8=
X-Google-Smtp-Source: AK7set9cBS4Yp3gQj7BMS+zsR9xqyjazX/jREY/hdUIhXyw2pw+2tTilw/IktBW6kp2bLNMgGOmQUbInu8z4Ra7NIMI=
X-Received: by 2002:a0d:df8f:0:b0:506:5648:ea8f with SMTP id
 i137-20020a0ddf8f000000b005065648ea8fmr177688ywe.363.1674577347707; Tue, 24
 Jan 2023 08:22:27 -0800 (PST)
MIME-Version: 1.0
From: Jesse Hathaway <jesse@mbuki-mvuki.org>
Date: Tue, 24 Jan 2023 10:22:17 -0600
Message-ID: <CANSNSoUqROMDVAVb9ZFQbxRdBEAg7k86YHcyihp6hjoEokti6Q@mail.gmail.com>
Subject: Intel sof-hda-dsp breaks suspend after using Pro Audio UCM
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

PipeWire added the Pro Audio profile for UCM devices[^1]. After that
patch was included with PipeWire 0.3.64, my laptop was no longer able to
suspend after the profile was loaded. The problem appears to be on the
kernel side. A bug was opened on PipeWire[^2] as well as the kernel's
bugzilla[^3]. Here is the relevant output from dmesg:

Jan 20 14:10:25 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
DSP detected with PCI class/subclass/prog-if info 0x040100
Jan 20 14:10:25 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
Digital mics found on Skylake+ platform, using SOF driver
Jan 20 14:10:25 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
DSP detected with PCI class/subclass/prog-if 0x040100
Jan 20 14:10:25 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
init of i915 and HDMI codec failed
Jan 20 14:10:25 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
use msi interrupt mode
Jan 20 14:10:29 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
codec #2 probe error, ret: -5
Jan 20 14:10:29 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
hda codecs found, mask 1
Jan 20 14:10:29 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
using HDA machine driver skl_hda_dsp_generic now
Jan 20 14:10:29 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
DMICs detected in NHLT tables: 2
Jan 20 14:10:29 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
firmware: direct-loading firmware intel/sof/sof-tgl-h.ri
Jan 20 14:10:29 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
Firmware info: version 2:2:0-57864
Jan 20 14:10:29 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
Firmware: ABI 3:22:1 Kernel ABI 3:23:0
Jan 20 14:10:29 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
unknown sof_ext_man header type 3 size 0x30
Jan 20 14:10:30 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
Firmware info: version 2:2:0-57864
Jan 20 14:10:30 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
Firmware: ABI 3:22:1 Kernel ABI 3:23:0
Jan 20 14:10:30 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
firmware: direct-loading firmware
intel/sof-tplg/sof-hda-generic-2ch.tplg
Jan 20 14:10:30 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
Topology: ABI 3:22:1 Kernel ABI 3:23:0
Jan 20 14:10:30 skittles kernel: skl_hda_dsp_generic
skl_hda_dsp_generic: ASoC: Parent card not yet available, widget card
binding deferred
Jan 20 14:10:30 skittles kernel: snd_hda_codec_realtek ehdaudio0D0:
autoconfig for ALC287: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
Jan 20 14:10:30 skittles kernel: snd_hda_codec_realtek ehdaudio0D0:
speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
Jan 20 14:10:30 skittles kernel: snd_hda_codec_realtek ehdaudio0D0:
hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
Jan 20 14:10:30 skittles kernel: snd_hda_codec_realtek ehdaudio0D0:
mono: mono_out=0x0
Jan 20 14:10:30 skittles kernel: snd_hda_codec_realtek ehdaudio0D0:    inputs:
Jan 20 14:10:30 skittles kernel: snd_hda_codec_realtek ehdaudio0D0:
  Mic=0x19
Jan 20 14:10:30 skittles kernel: input: sof-hda-dsp Mic as
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input22
Jan 20 14:10:30 skittles kernel: input: sof-hda-dsp Headphone as
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input23
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:32 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:32 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:32 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:32 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:32 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp1 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp1: ASoC: error at
__soc_pcm_hw_params on iDisp1: -22
Jan 20 14:10:49 skittles kernel:  HDMI1: ASoC: error at
dpcm_fe_dai_hw_params on HDMI1: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp2 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp2: ASoC: error at
__soc_pcm_hw_params on iDisp2: -22
Jan 20 14:10:49 skittles kernel:  HDMI2: ASoC: error at
dpcm_fe_dai_hw_params on HDMI2: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 14:10:49 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
ASoC: error at snd_soc_dai_hw_params on iDisp3 Pin: -22
Jan 20 14:10:49 skittles kernel:  iDisp3: ASoC: error at
__soc_pcm_hw_params on iDisp3: -22
Jan 20 14:10:49 skittles kernel:  HDMI3: ASoC: error at
dpcm_fe_dai_hw_params on HDMI3: -22
Jan 20 13:32:15 skittles kernel: PM: suspend entry (s2idle)
Jan 20 13:32:15 skittles kernel: Filesystems sync: 0.015 seconds
Jan 20 13:32:17 skittles kernel: (NULL device *): firmware:
direct-loading firmware iwlwifi-ty-a0-gf-a0.pnvm
Jan 20 13:32:17 skittles kernel: (NULL device *): firmware:
direct-loading firmware regulatory.db
Jan 20 13:32:17 skittles kernel: (NULL device *): firmware:
direct-loading firmware regulatory.db.p7s
Jan 20 13:32:17 skittles kernel: (NULL device *): firmware:
direct-loading firmware intel/ibt-0041-0041.ddc
Jan 20 13:32:17 skittles kernel: (NULL device *): firmware:
direct-loading firmware intel/sof-tplg/sof-hda-generic-2ch.tplg
Jan 20 13:32:17 skittles kernel: (NULL device *): firmware:
direct-loading firmware intel/ibt-0041-0041.sfi
Jan 20 13:32:17 skittles kernel: (NULL device *): firmware:
direct-loading firmware iwlwifi-ty-a0-gf-a0-72.ucode
Jan 20 13:32:19 skittles kernel: Freezing user space processes ...
(elapsed 0.007 seconds) done.
Jan 20 13:32:19 skittles kernel: OOM killer disabled.
Jan 20 13:32:19 skittles kernel: Freezing remaining freezable tasks
... (elapsed 0.001 seconds) done.
Jan 20 13:32:19 skittles kernel: printk: Suspending console(s) (use
no_console_suspend to debug)
Jan 20 13:32:19 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
hda_dsp_set_hw_params_upon_resume: failure in hda_dsp_dais_suspend
Jan 20 13:32:19 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
error: setting hw_params flag during suspend -22
Jan 20 13:32:19 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
PM: pci_pm_suspend(): snd_sof_suspend+0x0/0x10 [snd_sof] returns -22
Jan 20 13:32:19 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
PM: dpm_run_callback(): pci_pm_suspend+0x0/0x170 returns -22
Jan 20 13:32:19 skittles kernel: sof-audio-pci-intel-tgl 0000:00:1f.3:
PM: failed to suspend async: error -22
Jan 20 13:32:19 skittles kernel: PM: Some devices failed to suspend,
or early wake event detected
Jan 20 13:32:19 skittles kernel: nvme nvme0: Shutdown timeout set to 10 seconds
Jan 20 13:32:19 skittles kernel: nvme nvme0: 16/0/0 default/read/poll queues
Jan 20 13:32:19 skittles kernel: OOM killer enabled.
Jan 20 13:32:19 skittles kernel: Restarting tasks ... done.
Jan 20 13:32:19 skittles kernel: random: crng reseeded on system resumption
Jan 20 13:32:19 skittles kernel: PM: suspend exit

alsa-info.sh info,
http://alsa-project.org/db/?f=6fecee24ef2e97b98474250468402a175e761a5e
(without the Pro Audio profile loaded)

Thanks for any help, Jesse

[1]: https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/f62c40c205f84d70d41fef3f3d361b0e4651a50e
[2]: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2960
[3]: https://bugzilla.kernel.org/show_bug.cgi?id=216944
