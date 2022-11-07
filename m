Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBDF61EDE4
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 09:56:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1375F82A;
	Mon,  7 Nov 2022 09:55:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1375F82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667811402;
	bh=hPwj94MWF/Zorm4aOBb95Urft2bovYV2W04S1cTWGpQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJD4eSWjO80zgKo0oC/0KNR3lxRCBsiB41W6RYUOBP7Bp1CXYt2fs27nmAhlUVlIm
	 dGnIbQeAlxSiTE7XSwbkTER/iMAa9ocDIil379hiZy07dNvgSb4fygHR77voSz4+Mm
	 wy17l5D4jO+AQQOdIGDQ5op0VeOTGRHrfKxTqqWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B784CF800EC;
	Mon,  7 Nov 2022 09:55:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE629F8025A; Mon,  7 Nov 2022 09:55:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2180F800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 09:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2180F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="U35RMGne"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A663460F2E;
 Mon,  7 Nov 2022 08:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC35C433C1;
 Mon,  7 Nov 2022 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1667811336;
 bh=hPwj94MWF/Zorm4aOBb95Urft2bovYV2W04S1cTWGpQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U35RMGne0xH8ZNoPjGnGEQNHXhydjeJay4ZD0dftxSs4ryFXkVreJDf5WVNy++xCN
 IWOfk4huOJmbpu8GqCf1Vgbup4aML+wbdgk6V1a06w48LScZosF8ewz2irqjCK7raN
 JW61OwoAquq0QqUoMePtaPRsbQSdz0KAKevnBYp8=
Date: Mon, 7 Nov 2022 09:55:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: John Veness <john-linux@pelago.org.uk>
Subject: Re: [PATCH] ALSA: usb-audio: Add quirks for MacroSilicon
 MS2100/MS2106 devices (5.10)
Message-ID: <Y2jIBPGASBqZ4A/L@kroah.com>
References: <20221103181544.18958-1-john-linux@pelago.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103181544.18958-1-john-linux@pelago.org.uk>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
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

On Thu, Nov 03, 2022 at 06:15:44PM +0000, John Veness wrote:
> [ Upstream commit 6e2c9105e0b743c92a157389d40f00b81bdd09fe]
> 
> Backported to 5.10.
> 
> Treat the claimed 96kHz 1ch in the descriptors as 48kHz 2ch, so that
> the audio stream doesn't sound mono. Also fix initial stream
> alignment, so that left and right channels are in the correct order.
> 
> Signed-off-by: John Veness <john-linux@pelago.org.uk>
> Cc: <stable@vger.kernel.org> # 5.10

Now queued up, thanks.

greg k-h
