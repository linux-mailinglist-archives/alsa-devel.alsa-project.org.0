Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDCD4F9DAC
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 21:31:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235F11817;
	Fri,  8 Apr 2022 21:30:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235F11817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649446303;
	bh=Eowgv0LUyI0h3TKSreTC6v5RJaOKYzw3jWl00qAco9s=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D39VoA1sjg5tS94YkCUunzdoJZyeq2I5Tr85rTMfcPcZ1KLhPYC7Rx7zskt/yx2k0
	 xVWSlmSRTv3HLeG+ohQwFhfghIVdUDfHKo16NA6zW1CyccJWiRfLqg8xVM1BQUJ/Nt
	 7QGRoqhqktvfMjxITbOCEYLpYXn0Hx3nyrebHhEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8822FF80311;
	Fri,  8 Apr 2022 21:30:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58AB2F8014E; Fri,  8 Apr 2022 21:30:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D5F8F80128
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 21:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D5F8F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mZzVK7FH"
Received: by mail-ej1-x62c.google.com with SMTP id p15so19229597ejc.7
 for <alsa-devel@alsa-project.org>; Fri, 08 Apr 2022 12:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=eRUN0O5EZKDnJuwUUP97OSxnpH8ov14n5wR5REHvJZs=;
 b=mZzVK7FHZIFCsSyHnbfH6HWHkpO6Aw7td1acOjEZGhSeQSFEOyrmwkOCdtN4jTuitc
 py6sfGQTjDjmVaSfTBLWc/rzjdDlcj3JAL7t5Ub5MLwBBCOQerlQpkm3+jMCWX2VBAod
 V5nZ+R0JnS/JhjqvLF9U9Kqg8KP+f7qhqY+S8KUFxOKSoc1bcCT9IykIkJvsqJnhkJXO
 t89T94FBPpMXZOZMV39tvIAkTf7SJNS6kCuQ2qjz4M7Bq0gnmwKVDhnTAfVapAOlgy9G
 2vgCSG3N2q1RoN2EA8LMka3VO0nETUPsnkY6vWvz0KczYdtI16L3yiieQyg+26JfZuRU
 iJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=eRUN0O5EZKDnJuwUUP97OSxnpH8ov14n5wR5REHvJZs=;
 b=hbhGu566sZ+dR3VoqvI2xXjrYCFK653L+gSD15LilURdTkNvaEgqa41v5rLR86vx0w
 WWDPlgsAM2eMjSmkP6dE6X86bq2RqnYr4n5apNH7hEna+hb1hgYR7h/MNhZvjUe3cfiT
 OstoqMZHP1yv3A++MWDPYxtKG4ltRpPj2FoXtluXu2AUVHrPM7d9uWRUJyKZSByPjred
 eJq1Zw8POg5vJA26PzCLRpT9zbz/m7XObpMWPNtxqpydnnPsy/dZBQFn4bDmkx9xSpcO
 Tb9Hc+sx92H88L3GOatlij+8L7zS9w7JPo7XN0GnTmoQYKLL88mSe5dHPjYDOkvpnziA
 moLA==
X-Gm-Message-State: AOAM532PvZbJXPAk9aGG4zh1QJRMkBXm44HxHv07Rv4yfAZvlg88lZBX
 91YZHABmJbpukCGtn4V1vTjCB/bTVuadGxJRRKA=
X-Google-Smtp-Source: ABdhPJxHQ9FtGhzGtlVx/DGJUCTvQriPFtvSLkwFOlCwLrkrLW4xQwEFMc69pgF2HGhZZ4Jkc9pXxATYIC8/XAcHcbI=
X-Received: by 2002:a17:906:32d0:b0:6ce:e1cf:3f2e with SMTP id
 k16-20020a17090632d000b006cee1cf3f2emr19073698ejk.214.1649446231443; Fri, 08
 Apr 2022 12:30:31 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 8 Apr 2022 16:30:19 -0300
Message-ID: <CAOMZO5AadRQ6B-xbvZenppf6YHMcWERoYuo=kr_gRx03aPsOeg@mail.gmail.com>
Subject: imx8mn: Using the easrc driver
To: "S.j. Wang" <shengjiu.wang@nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Adam Ford <aford173@gmail.com>
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

Hi Shengjiu,

I am running kernel 5.18-rc1 on an imx8mn-ddr4-evk board.

The following playback devices are available:

# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: imxspdif [imx-spdif], device 0: S/PDIF PCM snd-soc-dummy-dai-0
[S/PDIF PCM snd-soc-dummy-dai-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: wm8524audio [wm8524-audio], device 0: HiFi wm8524-hifi-0 [HiFi
wm8524-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: wm8524audio [wm8524-audio], device 1: HiFi-ASRC-FE (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
#

I would like to use the sample rate conversion (provided by the easrc driver):

# aplay -D hw:1,1 /media/f2bjrop1.0.wav
Playing WAVE '/media/f2bjrop1.0.wav' : Signed 16 bit Little Endian,
Rate 16000 Hz, Mono
Warning: rate is not accurate (requested = 16000Hz, got = 32000Hz)
         please, try the plug plugin

, but the playback does not play at the correct speed. It plays at a
much faster rate.

The f2bjrop1.0.wav file I got from:
http://www.fit.vutbr.cz/~motlicek/speech_hnm.html

What should be done for the easrc to convert the sampling rates properly?

Thanks,

Fabio Estevam
