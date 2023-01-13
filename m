Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E57668F84
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 08:47:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FDC9A455;
	Fri, 13 Jan 2023 08:47:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FDC9A455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673596073;
	bh=wltYQdcEAMz3UcFF0QVHXXUKY2mcn2dIbJ+Vsno/G9o=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oP7GPLa1dXIWFGWUXSqX+CUC12dwKOT6ksLyiSlLdV7/boQFMRtChV7vVe89VM2KY
	 tB22utKCnFkoRZfxBioAo678gRH1paJDBdmei31/VzGCofiDIsL4mg70HjjMkt19Lb
	 xyIoSvgJM45pkzHcxMEPWbv4LMtxxxE2+XqBNFPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CBE0F8026D;
	Fri, 13 Jan 2023 08:46:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 095B7F803DC; Fri, 13 Jan 2023 08:46:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C3A7F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 08:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C3A7F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=LPk9GDnJ
Received: from pendragon.ideasonboard.com (85-76-5-15-nat.elisa-mobile.fi
 [85.76.5.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CD9D4D4;
 Fri, 13 Jan 2023 08:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673596008;
 bh=wltYQdcEAMz3UcFF0QVHXXUKY2mcn2dIbJ+Vsno/G9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LPk9GDnJb8yIAG/qZw7j85ZzRhjxe0eUQN+NAsK+9uT/7opY3bx+SaNPEdtJt/mLy
 7ehj3skE2f1g4W6IvOyNfZJFjCDi/ZIYJt389ghohYbhf6hpvDv0vqO0a1KKztGEE2
 l1/4JdyjqER4jRCS7n87hgkuZ+xUKmlP2i0l0lNc=
Date: Fri, 13 Jan 2023 09:46:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
Message-ID: <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-2-hch@lst.de>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Christoph,

Thank you for the patch.

On Fri, Jan 13, 2023 at 07:23:18AM +0100, Christoph Hellwig wrote:
> This driver depends on ARM && ARCH_SHMOBILE, but ARCH_SHMOBILE can only be
> set for each/sh, making the driver dead code except for the COMPILE_TEST
> case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

No objection from me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/Kconfig                       |   2 -
>  drivers/gpu/drm/Makefile                      |   1 -
>  drivers/gpu/drm/shmobile/Kconfig              |  12 -
>  drivers/gpu/drm/shmobile/Makefile             |   8 -
>  .../gpu/drm/shmobile/shmob_drm_backlight.c    |  82 ---
>  .../gpu/drm/shmobile/shmob_drm_backlight.h    |  19 -
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c     | 683 ------------------
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.h     |  55 --
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c      | 303 --------
>  drivers/gpu/drm/shmobile/shmob_drm_drv.h      |  42 --
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c      | 150 ----
>  drivers/gpu/drm/shmobile/shmob_drm_kms.h      |  29 -
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c    | 261 -------
>  drivers/gpu/drm/shmobile/shmob_drm_plane.h    |  19 -
>  drivers/gpu/drm/shmobile/shmob_drm_regs.h     | 310 --------
>  15 files changed, 1976 deletions(-)
>  delete mode 100644 drivers/gpu/drm/shmobile/Kconfig
>  delete mode 100644 drivers/gpu/drm/shmobile/Makefile
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_backlight.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_backlight.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_crtc.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_crtc.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_drv.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_drv.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_kms.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_kms.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_plane.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_plane.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_regs.h

-- 
Regards,

Laurent Pinchart
