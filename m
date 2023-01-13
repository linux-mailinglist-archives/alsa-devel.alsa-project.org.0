Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0401B66924D
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 10:07:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 699A4A56B;
	Fri, 13 Jan 2023 10:06:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 699A4A56B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673600829;
	bh=eh4f3y7XPQ+W7jewaiTsBJqaQ0YB0FrhhRWt817C6Y4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KraCEJfJbEExnhrGjoNhjkutpr8H0Z60it2m+B4QlFCySvktClO4aSwhGgExFE8fs
	 DrCB+UeODX4zLGV/XHNtz9c/pQLqAmP1gIwBUCp2pdhZorJqY2gx8eKFo2g54MnLGI
	 x+zevdwMIAszpiZVQ8vFbv2soEhXh50Q1rID4Jh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D25FEF8026D;
	Fri, 13 Jan 2023 10:06:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21A7FF803DC; Fri, 13 Jan 2023 10:06:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88278F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 10:06:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88278F8026D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D38D76102A;
 Fri, 13 Jan 2023 09:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4C4C433D2;
 Fri, 13 Jan 2023 09:05:55 +0000 (UTC)
Message-ID: <649a45a5-1680-dd71-ed74-df16d4353638@xs4all.nl>
Date: Fri, 13 Jan 2023 10:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 20/22] media: remove sh_vou
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Christoph Hellwig <hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-21-hch@lst.de>
 <Y8EPvllOwhODRUiP@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Y8EPvllOwhODRUiP@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 13/01/2023 09:01, Laurent Pinchart wrote:
> Hi Christoph,
> 
> Thank you for the patch.
> 
> On Fri, Jan 13, 2023 at 07:23:37AM +0100, Christoph Hellwig wrote:
>> Now that arch/sh is removed this driver is dead code.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  drivers/media/platform/renesas/Kconfig  |    9 -
>>  drivers/media/platform/renesas/Makefile |    1 -
>>  drivers/media/platform/renesas/sh_vou.c | 1375 -----------------------
> 
> You can also emove include/media/drv-intf/sh_vou.sh. With that, and the
> corresponding MAINTAINERS entry dropped,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

And with that you can also add my Ack:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
>>  3 files changed, 1385 deletions(-)
>>  delete mode 100644 drivers/media/platform/renesas/sh_vou.c
> 

