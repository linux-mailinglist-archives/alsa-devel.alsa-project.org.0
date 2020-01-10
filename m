Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D79136A1F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 10:45:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3825A1712;
	Fri, 10 Jan 2020 10:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3825A1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578649524;
	bh=wz4Z8+hjd85yyN0YVnTiCRXpUxEkSw4YjJBQVNrbTXc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sv27XSkxROHTLjp9Sa1kCtnVOPePYJZhekHBExg8+Tfiq79CMfRFMPxtdFiqZSDfV
	 yk+ZNdxs3mFHonCnAUq9O1H8kNCVLXf9nl0bqMv8uE9K/UfqWVOnlQu7Xw3njaN9wv
	 p2Zh0iMzF4T6nL0ZEUsdjtF39XFM+Rpb6DzH2rTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD66F8010B;
	Fri, 10 Jan 2020 10:43:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F361DF8011C; Fri, 10 Jan 2020 10:43:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76848F800E4
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 10:43:33 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 477EEA003F;
 Fri, 10 Jan 2020 10:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 477EEA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1578649413; bh=PWmIHEghTU1BU+I0q/9CNp37xpdRYOruF+56lY2aRWM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=veb+mi8NwaztLeFbSWAPaOm6BXPvetTynnMLIo9EGfHpV+sge99LmtWNxl/R+B9iO
 B7gTZ1be1tuUbY95XA8gP1L2eRsEnQhkQNYQVLyuRx9dNxmDFBrtbj0QQhhAHUCyWl
 jiJe+NRGULxb1NHmf3aSgqzrKErbm2GY+2rs3maM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 10 Jan 2020 10:43:27 +0100 (CET)
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, bhelgaas@google.com,
 tiwai@suse.com
References: <20191018073848.14590-1-kai.heng.feng@canonical.com>
 <20191018073848.14590-2-kai.heng.feng@canonical.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <10e35320-b7a8-0bcf-92d1-61aa5c057f58@perex.cz>
Date: Fri, 10 Jan 2020 10:43:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191018073848.14590-2-kai.heng.feng@canonical.com>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v6 2/2] ALSA: hda: Allow HDA to be runtime
 suspended when dGPU is not bound to a driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 18. 10. 19 v 9:38 Kai-Heng Feng napsal(a):
> Nvidia proprietary driver doesn't support runtime power management, so
> when a user only wants to use the integrated GPU, it's a common practice
> to let dGPU not to bind any driver, and let its upstream port to be
> runtime suspended. At the end of runtime suspension the port uses
> platform power management to disable power through _OFF method of power
> resource, which is listed by _PR3.
> 
> After commit b516ea586d71 ("PCI: Enable NVIDIA HDA controllers"), when
> the dGPU comes with an HDA function, the HDA won't be suspended if the
> dGPU is unbound, so the power resource can't be turned off by its
> upstream port driver.
> 
> Commit 37a3a98ef601 ("ALSA: hda - Enable runtime PM only for
> discrete GPU") only allows HDA to be runtime suspended once GPU is
> bound, to keep APU's HDA working.
> 
> However, HDA on dGPU isn't that useful if dGPU is not bound to any
> driver.  So let's relax the runtime suspend requirement for dGPU's HDA
> function, to disable the power source to save lots of power.

This patch breaks the HDMI audio detection at least on some platforms (Lenovo 
P50 for example) with nouveau and the proprietary nvidia driver. Those laptops 
have the external HDMI/DP ports connected to dGPU instead the iGPU. The ACPI 
PR3 is set.

The runtime PM off fixes this problem:

echo on > /sys/bus/pci/devices/0000\:01\:00.1/power/control

But I don't think that it's the best solution. My proposal is to create a pr3 
check blacklist to keep power for the HDMI audio for those machines. Also we 
may add a new module parameter for snd-hda-intel to control this. Other ideas?

					Jaroslav


> BugLink: https://bugs.launchpad.net/bugs/1840835
> Fixes: b516ea586d71 ("PCI: Enable NVIDIA HDA controllers")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v5, v6:
> - No change.
> v4:
> - Find upstream port, it's callee's responsibility now.
> v3:
> - Make changelog more clear.
> v2:
> - Change wording.
> - Rebase to Tiwai's branch.
>   sound/pci/hda/hda_intel.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 240f4ca76391..e63b871343e5 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1280,11 +1280,17 @@ static void init_vga_switcheroo(struct azx *chip)
>   {
>   	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
>   	struct pci_dev *p = get_bound_vga(chip->pci);
> +	struct pci_dev *parent;
>   	if (p) {
>   		dev_info(chip->card->dev,
>   			 "Handle vga_switcheroo audio client\n");
>   		hda->use_vga_switcheroo = 1;
> -		chip->bus.keep_power = 1; /* cleared in either gpu_bound op or codec probe */
> +
> +		/* cleared in either gpu_bound op or codec probe, or when its
> +		 * upstream port has _PR3 (i.e. dGPU).
> +		 */
> +		parent = pci_upstream_bridge(p);
> +		chip->bus.keep_power = parent ? !pci_pr3_present(parent) : 1;
>   		chip->driver_caps |= AZX_DCAPS_PM_RUNTIME;
>   		pci_dev_put(p);
>   	}
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
