Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF0C61FA27
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 17:42:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB2D1DD;
	Mon,  7 Nov 2022 17:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB2D1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667839328;
	bh=rV0FEWDWEX3pw5xk/P6Od1hD9YTelKAB+AEHNXGucGw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a/gMLzooAChpntVtTljnJXuv3dtnfY0CNd5k5UIQJh5o2kQa5PjxB/zksn7solLSM
	 e9xs9mXUY3XME9DuWRh1kqDzkS8QPetgML9zjw8YqXsa/I+mKhOeMTfKGIQDXfloe5
	 nh9R3dvLTS23UImKOpJT/Tq2uRiG46wL1C6rzTMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7E8DF804BD;
	Mon,  7 Nov 2022 17:41:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAB2CF8025A; Mon,  7 Nov 2022 17:41:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 294B9F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 17:41:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 294B9F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="1kLSFg96"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C650611C2;
 Mon,  7 Nov 2022 16:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A72FC433C1;
 Mon,  7 Nov 2022 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1667839261;
 bh=rV0FEWDWEX3pw5xk/P6Od1hD9YTelKAB+AEHNXGucGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1kLSFg96R6WxIT17jCcSOuD/8/wkolVtUWEQLk7do6PfaB0tcc8Z/ROW20FqiK0sw
 f2obEh4jVYXdqaw0uJVhOCpE622woq5+3NfNZgYoKNEwrsGTwQgMiZrVeTrceqhG2h
 uiuxY1uV/hm6jjzPPcaE4Mykre3OyPJ5gJspyUqA=
Date: Mon, 7 Nov 2022 17:40:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: John Veness <john-linux@pelago.org.uk>
Subject: Re: [PATCH] ALSA: usb-audio: Add quirks for MacroSilicon
 MS2100/MS2106 devices (4.9-5.4)
Message-ID: <Y2k1GvrY8WrX/g4+@kroah.com>
References: <20221107160536.27565-1-john-linux@pelago.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107160536.27565-1-john-linux@pelago.org.uk>
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

On Mon, Nov 07, 2022 at 04:05:36PM +0000, John Veness wrote:
> commit 6e2c9105e0b743c92a157389d40f00b81bdd09fe upstream.
> 
> Treat the claimed 96kHz 1ch in the descriptors as 48kHz 2ch, so that
> the audio stream doesn't sound mono. Also fix initial stream
> alignment, so that left and right channels are in the correct order.
> 
> Signed-off-by: John Veness <john-linux@pelago.org.uk>
> Link: https://lore.kernel.org/r/20220624140757.28758-1-john-linux@pelago.org.uk
> Cc: <stable@vger.kernel.org> # 5.4
> Cc: <stable@vger.kernel.org> # 4.19
> Cc: <stable@vger.kernel.org> # 4.14
> Cc: <stable@vger.kernel.org> # 4.9
> 
> ---
> Backported to 4.9-5.4.

Now queued up, thanks.

greg k-h
