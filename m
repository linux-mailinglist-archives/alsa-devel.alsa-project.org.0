Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42354398CAC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 16:24:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B78FC16FC;
	Wed,  2 Jun 2021 16:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B78FC16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622643889;
	bh=cEZUezywMgX5vR/D3t0QvKikngNRDFHs2Ki3SJ0Xpuk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xb+6Kzw5s09Wu08ExFf5zWdvllmLboDtKh95mzhhUrTHM6T7MwuKUUu6HXJ02pmQc
	 C0UpBaqlFBlhfMnMo7Uc2X4dTgfUGYZpGtYVMmBicQuonrYv/IEyujveYZooTnOExA
	 tzSWZFlOtkqL3FGBbhSchVsM3Qu2FZXN4o7ZnH38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C22C9F80430;
	Wed,  2 Jun 2021 16:23:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAA37F80254; Tue,  1 Jun 2021 10:48:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66A50F80141
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 10:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66A50F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MBOgPX8Z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 886C661370;
 Tue,  1 Jun 2021 08:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622537267;
 bh=cEZUezywMgX5vR/D3t0QvKikngNRDFHs2Ki3SJ0Xpuk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=MBOgPX8ZH57ze1iAkkC/l2BOuVL3FOn20aZDjoZSw1jg9q+l7xb2rZTF6NtRhrI8F
 OMtiubpyveaCTSnBhhLgfCDTeNs4BW9DbwOnvwNm/qzCWXbnRvE6cR2EFj8VNIEttD
 LXimyUmi3rNBsKfJV7lFug9FZuv3n/7mqsdA46ciLhsiZoBy0swgETx4LKicZ4e2+/
 aR+pq+AdK5JgDR9QcPkuWcms3+pfN/5CSTl8/Ch63eTUq2BCHKhgsRaCqVPbLACXCi
 yeTOjXIClj7UB87btlifu4y4bpNOg30tSIwVFt4Iu6GhzLaHHiO6AyQngiTrzTxIII
 UAoHWdQ6LBsOw==
Message-ID: <a2e780be6b81443630aa72eb9c5c919061e309b8.camel@kernel.org>
Subject: Re: [PATCH v2 07/12] drm/vc4: hdmi: Set HDMI_MAI_FMT
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel.vetter@intel.com>,  David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai
 <tiwai@suse.com>
Date: Tue, 01 Jun 2021 10:47:40 +0200
In-Reply-To: <20210525132354.297468-8-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-8-maxime@cerno.tech>
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
> The hardware uses this for generating the right audio
> data island packets when using formats other than PCM
> 
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

