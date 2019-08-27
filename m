Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A99A1D32
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:40:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF7616B2;
	Thu, 29 Aug 2019 16:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF7616B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089630;
	bh=dOpQwCEtQZq5RclalOtXxEk/jxFUJ5QEeKcK9wCCm5Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J1fZpdnKAuN8gk2Q6/gPbKiDBvwKh1rTtZ08Q+gWcB150R7RadNuYj5BKx1q+exVP
	 VfIXpTyuu3mqk/2k/qoFH+5lt7boriJFae0fNQKIDTgHPdhzM/d6eF1IwCIY6XsjKQ
	 AVqZFp3DJ1iQ+jrg3ky+sXMPdcvTk7LDbAmV1K9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62843F80CBD;
	Wed, 28 Aug 2019 00:31:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1432FF80CB9; Wed, 28 Aug 2019 00:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACFFFF80CB9
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 00:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACFFFF80CB9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Migu+if6"
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C760F20856;
 Tue, 27 Aug 2019 22:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566945087;
 bh=z3lcNGmdvmqEXqVEX9g8KC0XV/I/hJtGSWKjLohh+3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Migu+if62iFs5FV4qKaJ8LZCNRwNok5KflTlEHuwAOZ9iaxShqp/IWMO+EImucQVc
 HD2pxOhjBOWs6s1j223Xn/n0+4yOH4Bg3uGkzkILe9q+GbkxbFe6WtEy54XmNqcZSV
 mFh7XfmdHOserrq/VomMnyq6vQFKnxrs0/zG1cPs=
Date: Tue, 27 Aug 2019 17:31:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Message-ID: <20190827223125.GB9987@google.com>
References: <20190827134756.10807-1-kai.heng.feng@canonical.com>
 <20190827134756.10807-2-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827134756.10807-2-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-pci@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ALSA: hda: Allow HDA to be runtime
 suspended when dGPU is not bound
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Aug 27, 2019 at 09:47:56PM +0800, Kai-Heng Feng wrote:
> It's a common practice to let dGPU unbound and use PCI port PM to
> disable its power through _PR3. When the dGPU comes with an HDA
> function, the HDA won't be suspended if the dGPU is unbound, so the dGPU
> power can't be disabled.

Just a terminology question:

I thought "using PCI port PM" meant using the PCI Power Management
Capability in config space to directly change the device's power
state, e.g., in pci_raw_set_power_state().

And I thought using _PS3, _PR3, etc would be part of "platform power
management"?

And AFAICT, _PR3 merely returns a list of power resources; it doesn't
disable power itself.

> Commit 37a3a98ef601 ("ALSA: hda - Enable runtime PM only for
> discrete GPU") only allows HDA to be runtime-suspended once GPU is
> bound, to keep APU's HDA working.
> 
> However, HDA on dGPU isn't that useful if dGPU is unbound. So let relax
> the runtime suspend requirement for dGPU's HDA function, to save lots of
> power.
> 
> BugLink: https://bugs.launchpad.net/bugs/1840835
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  sound/pci/hda/hda_intel.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 99fc0917339b..d4ee070e1a29 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1285,7 +1285,8 @@ static void init_vga_switcheroo(struct azx *chip)
>  		dev_info(chip->card->dev,
>  			 "Handle vga_switcheroo audio client\n");
>  		hda->use_vga_switcheroo = 1;
> -		hda->need_eld_notify_link = 1; /* cleared in gpu_bound op */
> +		/* cleared in gpu_bound op */
> +		hda->need_eld_notify_link = !pci_pr3_present(p);
>  		chip->driver_caps |= AZX_DCAPS_PM_RUNTIME;
>  		pci_dev_put(p);
>  	}
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
