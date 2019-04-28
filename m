Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F5DB6B4
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 22:41:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECA13860;
	Sun, 28 Apr 2019 22:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECA13860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556484071;
	bh=MwRn9KjCIV+EqCQE9XWwBNPEPiANblNOjRYAs4Ygnt8=;
	h=Date:From:To:To:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=scGBOW2QPjRY3hNfrf2u3JaXBvbHjZOwjx4dGrm+Up44/AUgtEMTMMXNO/O76MWgi
	 laS4IYS+96Y79u1ti3C4hyS7FgmvWpzLFUZ4QoK8kN3zS/AylDvI/id0IeODDvWYFn
	 S2FyIWUq7A8aMWK8Oid1vIAqdBMJ2jxkJP3WRB4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A176BF8962C;
	Sun, 28 Apr 2019 22:39:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7348BF80CAD; Sun, 28 Apr 2019 22:39:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 202D1F806E7
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 22:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 202D1F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RJqrfOzP"
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B415206C1;
 Sun, 28 Apr 2019 20:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556483958;
 bh=BcIkruMxQI9bHf1CUEkN3QezvjQj9ZyTIt1oqaknML4=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=RJqrfOzPeJl68Thq5nbKY2CMQMrU8M9S2ra4o7TEhZyzaI+/WmklRB/QPlJW2BRIc
 CEmAkadzpiRBb/04E1POPWhCQ4iNg4uRQ2638ju5m99q2W3BuzQ4mX16j66/L/8VRB
 ySHUQt3VroTrrv/sS55DZ4iudgrQDvqeICJsVs38=
Date: Sun, 28 Apr 2019 20:39:17 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20190428160411.GA12815@kroah.com>
References: <20190428160411.GA12815@kroah.com>
Message-Id: <20190428203918.2B415206C1@mail.kernel.org>
Cc: , alsa-devel@alsa-project.org, stable@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [alsa-devel] [PATCH] sound: USB: line6: use dynamic buffers
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.0.10, v4.19.37, v4.14.114, v4.9.171, v4.4.179, v3.18.139.

v5.0.10: Build OK!
v4.19.37: Build OK!
v4.14.114: Failed to apply! Possible dependencies:
    a8eaad7b04ea ("ALSA: line6: stop using get_seconds()")

v4.9.171: Failed to apply! Possible dependencies:
    a8eaad7b04ea ("ALSA: line6: stop using get_seconds()")

v4.4.179: Failed to apply! Possible dependencies:
    790869dacc3d ("ALSA: line6: Add support for POD X3")
    97d78acfb870 ("ALSA: line6: Allow different channel numbers for in/out")
    a8eaad7b04ea ("ALSA: line6: stop using get_seconds()")

v3.18.139: Failed to apply! Possible dependencies:
    16d603d32d34 ("staging: line6: Move audio endpoints to properties")
    25a0707cf6bc ("ALSA: line6: Improve line6_read/write_data() interfaces")
    410dca8d99ae ("staging: line6: Define a device type enum")
    4cb1a4ae4afb ("staging: line6: Rename capability macros")
    4d947546c3fb ("staging: line6: Use explicit indexes when defining properties")
    5c3396f909aa ("staging: line6: Remove `device_bit' from properties")
    61864d844c29 ("ALSA: move line6 usb driver into sound/usb")
    790869dacc3d ("ALSA: line6: Add support for POD X3")
    7b3e4d47ca37 ("staging: line6: List out capabilities individually")
    7b9584fa1c0b ("staging: line6: Move altsetting to properties")
    951dd316119c ("staging: line6: Split out POD HD500 interfaces")
    9e165be72f49 ("staging: line6: Move control endpoints to properties")
    ccddbe4a9953 ("ALSA: line6: Split to each driver")
    daf54a59f37c ("staging: line6: Cleanup device table")
    e474e7fd404b ("ALSA: line6: Return EIO if read/write not successful")
    e64e94df9916 ("ALSA: line6: Add delay before reading status")
    f3dfd1be08cc ("ALSA: line6: Return error if device not responding")
    f45be7dcc9e5 ("staging: line6: Remove idVendor and idProduct macros")


How should we proceed with this patch?

--
Thanks,
Sasha
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
