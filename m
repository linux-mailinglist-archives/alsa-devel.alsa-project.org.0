Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 032653AB3CF
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 14:40:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 830CB16EB;
	Thu, 17 Jun 2021 14:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 830CB16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623933610;
	bh=Q5NtboXxz5okc7t8baNPU0E+WNNZqiOCjel2cyAQz3Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r0J9RRaiuYsNdArvYAflEDs3s9cSdioNTCl+PG5ylfA6swXib5Em9LlL5pCEHKLIw
	 dVN/UzEizTLkTVyqH/bJt4j8UuimaM+UFUKfV/gF/LqzQT3vRGSWdD05+UiPJgjoeE
	 2QOqIvEPGWB2Pvs8/DB9G1Lg4/23rNbUkg5qVUZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E56CFF80148;
	Thu, 17 Jun 2021 14:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A0AFF8025A; Thu, 17 Jun 2021 14:38:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C608EF8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 14:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C608EF8016D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623933514724359035-webhooks-bot@alsa-project.org>
References: <1623933514724359035-webhooks-bot@alsa-project.org>
Subject: a52 plugin crashing pulseaudio
Message-Id: <20210617123841.3A0AFF8025A@alsa1.perex.cz>
Date: Thu, 17 Jun 2021 14:38:41 +0200 (CEST)
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

alsa-project/alsa-plugins issue #28 was opened from quequotion:

Ever since f11e7a8994111f971bc881d4069f768472452f4f, the recent commit that brings the a52 plugin up to speed with ffmpeg's requirement for s32le format sampling, sending any audio via plug:a52 from any pulseaudio client crashes pulseaudio.

I [posted this log](https://gist.github.com/quequotion/78972bac339f5249cf6b383519cdcedf) earlier in #23, in which audio from mpv crashes pulseaudio.

I have tried other clients since and they all crash the same way.

This is with a default pulseaudio configuration, as shipped in Archlinux, and the following `/etc/asound.conf`:

```
# Alsa Resampler
 defaults.pcm.rate_converter "speexrate_best"

# Use PulseAudio by default
pcm.!default {
  type pulse
  fallback "sysdefault"
  hint {
    show on
    description "Default ALSA Output (currently PulseAudio Sound Server)"
  }
}

ctl.!default {
  type pulse
  fallback "sysdefault"
}

defaults.namehint.showall on
defaults.namehint.extended on
```

To enable the use of plug:52 in pulseaudio without configuring it manually, I select the "Digital Surround 5.1 (IEC958/AC3) Output" profile in `pavucontrol`.

Pulseaudio, as far as I know, is agnostic of how ALSA plugins work internally. This leads me to think there is something not getting done right in the new patchset, even if it is tolerable in an ALSA-only setup.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/28
Repository URL: https://github.com/alsa-project/alsa-plugins
