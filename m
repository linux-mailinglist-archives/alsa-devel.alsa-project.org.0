Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2A81D46AB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 09:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A9271669;
	Fri, 15 May 2020 09:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A9271669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589526400;
	bh=upNdoDczq0LfOqv/wUOK/hzajMfTetVf10l01Gag/Tk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GoFOwnva1R7ic4fa0g6fwkLLDIe4LDNYMVbhJUzsige041ApY6rzqycxuizCrX5WU
	 K+mN/hudgw7CollUZqc4yZzpqgjZ+dzjWolOYgplBbujJ5wRUOxoj6DouWC7MYOcNp
	 /tcUQuzdzO1GdXrQcA6RufDZKz2Y01jOvlvA/1Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88591F80253;
	Fri, 15 May 2020 09:04:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5F34F80247; Fri, 15 May 2020 09:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51E09F800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 09:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51E09F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RMRETnVn"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45F27206F1;
 Fri, 15 May 2020 07:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589526288;
 bh=upNdoDczq0LfOqv/wUOK/hzajMfTetVf10l01Gag/Tk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RMRETnVnkQEW3dtg+dPNVeiStdHFenIHmCY1Ph/Z4njZNYmMxKKz/M2LnoFVvBdvz
 Ng36mEKLZka2tF5ACfdGCWOoKN4tA4x495KM3lyewy5VCA9K9QeLTDZ4ViAIwUru9B
 fTNTF76NRSSrxVoHbF9GuZL3p4YUgtOIvPeK9TSI=
Date: Fri, 15 May 2020 09:04:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Brent Lu <brent.lu@intel.com>
Subject: Re: [PATCH] ALSA: pcm: fix incorrect hw_base increase
Message-ID: <20200515070446.GA1226131@kroah.com>
References: <1589515779-20987-1-git-send-email-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589515779-20987-1-git-send-email-brent.lu@intel.com>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Baolin Wang <baolin.wang@linaro.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Richard Fontana <rfontana@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, paulhsia <paulhsia@chromium.org>
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

On Fri, May 15, 2020 at 12:09:39PM +0800, Brent Lu wrote:
> The hw_base will be increased by runtime->buffer_size frames
> unconditionally if the runtime->status->hw_ptr is not updated for over
> half of buffer time. As the hw_base increases, so does the
> runtime->status->hw_ptr which could lead to invalid return value when
> user space program calls snd_pcm_avail() function.
> 
> By updating runtime->hw_ptr_jiffies each time the HWSYNC is called,
> the hw_base will keep the same when buffer stall happens, so does the
> hw_ptr.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/core/pcm_lib.c | 1 +
>  1 file changed, 1 insertion(+)

Is this a bugfix needed for older kernels as well?  When did this issue
show up?

thanks,

greg k-h
