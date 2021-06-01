Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6E398CAB
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 16:24:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47D0216F3;
	Wed,  2 Jun 2021 16:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47D0216F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622643875;
	bh=iRLwwh/jf6neXOQQgfnhI6BrCzqxxsNJFTOUKbWjbxU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KjPHRGIS2MH5FfhazHPpyaw1crWp5Gjluab0wHT6fpWJR27mDP1aZayfCdRAnmRq6
	 L5/QBRoxkszMEpqNncHm/kXT+t+RVgFCNQcwRtdYHATUXjoGj1qPRF1FU4QzmdDyW6
	 2OCyKGtFVNOijVaswQtzfBR+fetXU7/+MgyB+nMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC6ADF80273;
	Wed,  2 Jun 2021 16:23:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5B73F80254; Tue,  1 Jun 2021 10:46:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8089EF801DB
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 10:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8089EF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sIrl/fVj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60BC061370;
 Tue,  1 Jun 2021 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622537158;
 bh=iRLwwh/jf6neXOQQgfnhI6BrCzqxxsNJFTOUKbWjbxU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=sIrl/fVjSuZJc/8yYTG/dJgXF2S6Ulce6iDkG+5AKFvWM2npcdzHGjvr/bhghCsZF
 gpJE2khsRcmBOfZpvtpHnKPnhJQHPS2ueehX2SI7BCGwJn5gNg09TOyvmk6VwPasQl
 hGz0UQs7t1mG2u7JfCBEfI4j+86J1KWkdEbM9wydpaBKZ1jeprBZzT+74L3/Y/jb2O
 jQalFjmxg6vOnopGnjuRLf6MOjheSfjBdCke3btHg+vBqi+MHF4SVyhI5S8Ijoj8kx
 EcGYGkt1N+lSF8t2cp9YYGCDZOIMGva80GMffTImgfkezk7SLoDtdDjkDKonezD74D
 d9pZAvCCOVmCg==
Message-ID: <4552aaf531b0619a2d7a7cc4bcf2d049c44b4b74.camel@kernel.org>
Subject: Re: [PATCH v2 06/12] drm/vc4: hdmi: Set HD_CTL_WHOLSMP and
 HD_CTL_CHALIGN_SET
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel.vetter@intel.com>,  David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai
 <tiwai@suse.com>
Date: Tue, 01 Jun 2021 10:45:49 +0200
In-Reply-To: <20210525132354.297468-7-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-7-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 02 Jun 2021 16:23:04 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 linux-doc@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Dom Cobley <popcornmix@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
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

On Tue, 2021-05-25 at 15:23 +0200, Maxime Ripard wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> Symptom is random switching of speakers when using multichannel.
> 
> Repeatedly running speakertest -c8 occasionally starts with
> channels jumbled. This is fixed with HD_CTL_WHOLSMP.
> 
> The other bit looks beneficial and apears harmless in testing so
> I'd suggest adding it too.
> 
> Documentation says: HD_CTL_WHILSMP_SET
> Wait for whole sample. When this bit is set MAI transmit will start
> only when there is at least one whole sample available in the fifo.
> 
> Documentation says: HD_CTL_CHALIGN_SET
> Channel Align When Overflow. This bit is used to realign the audio
> channels in case of an overflow.
> If this bit is set, after the detection of an overflow, equal
> amount of dummy words to the missing words will be written to fifo,
> filling up the broken sample and maintaining alignment.
> 
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

