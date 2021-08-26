Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F12FD3F86DA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 13:59:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA6B16A9;
	Thu, 26 Aug 2021 13:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA6B16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629979157;
	bh=VqrmZfvdySGGpRkZfJ9sTmMn3wWb3fwMDv/A6XRJ5g0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tTCxGLxXSLZua/BT6YTWRT1gr6fuD4BUq7IMHMqPsuiyDlHxk3CAzuO2IQwOX5Tvd
	 g1fSUZtmZ0NP8VEBln0+1siBAYu8qt0+OtLdhpAQ5BBbzTvpGq9GwdG7toK/+Ka4R2
	 iXH2j7XCjvtYV04m8K4ccrI7+jkQ/xRCL6idB4c0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9643F8013F;
	Thu, 26 Aug 2021 13:57:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19E61F801D8; Thu, 26 Aug 2021 13:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16E73F8013F
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 13:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16E73F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="lzvupKGm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B82B6102A;
 Thu, 26 Aug 2021 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629979068;
 bh=VqrmZfvdySGGpRkZfJ9sTmMn3wWb3fwMDv/A6XRJ5g0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lzvupKGm6DHeJEI0TqRmS03OkixQqyNvn5fHICulBulOAdMBqEccYq8nc5D2E6XhM
 gWy/yQjptw7v0BYdQVMP3sXyUlMzJb2TDV9Ccg4Kg4G1aHaVRKNtLVfFwr83vd5wme
 FgPiaOq7JB0o7euja3GB3WosZG/JyuK67iUcwAk8=
Date: Thu, 26 Aug 2021 13:57:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Use 'enum' instead of 'oneOf' plus 'const'
 entries
Message-ID: <YSeBuMtUa77AR7Tn@kroah.com>
References: <20210824202014.978922-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824202014.978922-1-robh@kernel.org>
Cc: alsa-devel@alsa-project.org, Vignesh R <vigneshr@ti.com>,
 linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-phy@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 dmaengine@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

On Tue, Aug 24, 2021 at 03:20:14PM -0500, Rob Herring wrote:
> 'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 'enum'
> is more concise and yields better error messages.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Vignesh R <vigneshr@ti.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
