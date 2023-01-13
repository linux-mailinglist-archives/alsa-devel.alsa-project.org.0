Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D99668FE6
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 09:02:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB2C45FD;
	Fri, 13 Jan 2023 09:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB2C45FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673596930;
	bh=cznkdyRGPN+MgO59A5w6zSqYoDDyC4/o8zwGoYFpT/4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EN2clYaPlhLxSFLC0bRunm5kOumnktxriHAXHAsJiJoj8sal/rVU1p9yzcUUOolec
	 0dCOMkAW0wx5Uj+CFvBF4YQd10vq+70m4LR+vOu1RP8V22NBmebglT3wadKeGlHreq
	 QdNYS4kZA9lFtOtqXcse+xhXY7wkwrmw9s2N6SOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90E59F80425;
	Fri, 13 Jan 2023 09:01:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E799EF802E8; Fri, 13 Jan 2023 09:01:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4E1BF80539
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4E1BF80539
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=X3sDjCHv
Received: from pendragon.ideasonboard.com (85-76-5-15-nat.elisa-mobile.fi
 [85.76.5.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64BE84D4;
 Fri, 13 Jan 2023 09:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673596863;
 bh=cznkdyRGPN+MgO59A5w6zSqYoDDyC4/o8zwGoYFpT/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X3sDjCHvncH8nOCQqph3lRWmzA+o7ZBGUupBaWsIqvlyia+dSiapzD4cCl/9rmiPJ
 B4jr8NUwZemj7FrJVUMSVm/jr/syT5jAqqHnHz/VIkiEeZojpijB4wyQF8mSckYAYI
 I5Uhh6NRqZJYChzv/4ySxybQmm9DouIDL6rp5RZU=
Date: Fri, 13 Jan 2023 10:01:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/22] media: remove sh_vou
Message-ID: <Y8EPvllOwhODRUiP@pendragon.ideasonboard.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-21-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-21-hch@lst.de>
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

On Fri, Jan 13, 2023 at 07:23:37AM +0100, Christoph Hellwig wrote:
> Now that arch/sh is removed this driver is dead code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/media/platform/renesas/Kconfig  |    9 -
>  drivers/media/platform/renesas/Makefile |    1 -
>  drivers/media/platform/renesas/sh_vou.c | 1375 -----------------------

You can also emove include/media/drv-intf/sh_vou.sh. With that, and the
corresponding MAINTAINERS entry dropped,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  3 files changed, 1385 deletions(-)
>  delete mode 100644 drivers/media/platform/renesas/sh_vou.c

-- 
Regards,

Laurent Pinchart
