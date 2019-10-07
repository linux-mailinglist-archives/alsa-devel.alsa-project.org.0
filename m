Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3BCEC28
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 20:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7ACE1616;
	Mon,  7 Oct 2019 20:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7ACE1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570474316;
	bh=Gxy3Io8dzLT3uMXVm+bNYJIqwEZyv502Uv5TLxb5x5Y=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gi6Q+dWqv/F4r1bVVPlT/wgReqNRcr91oHatVGURjulQ8H7YbvClbJuPcDnJWshJn
	 CH9k6NnuC09UGnOULnCKCI/ZojJN/hvvJ+k60OOzzix2IG48dc1lOISLhC6IVUIf5C
	 A4htkdANr+xb4pPsHr2uWV0HZEh3lD27n1+m1R0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35396F802BE;
	Mon,  7 Oct 2019 20:50:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A68BF802BE; Mon,  7 Oct 2019 20:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C6CCF800BF
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 20:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C6CCF800BF
Received: from mail-pg1-f198.google.com ([209.85.215.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1iHY57-0004gJ-3c
 for alsa-devel@alsa-project.org; Mon, 07 Oct 2019 18:50:05 +0000
Received: by mail-pg1-f198.google.com with SMTP id z7so10714963pgk.11
 for <alsa-devel@alsa-project.org>; Mon, 07 Oct 2019 11:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=j3n/ZkJyjbkCNJF6jyQHAc6ep3KG8jgIKugTOiAIquA=;
 b=NDu12f6Z7WT7llMGdHSSoGRm/wlO073TFycAwULDka5zWBgCy5mkI0XUIWV2SdN72B
 TO0snM6bzYDECfcLffkkrz3krqBhXU0Z+moqe5VJqichCVzSwv7VxzfgnZ2/WTyk2Ra4
 eNuw+qMcmIQff3lGcPOaw5TZ1d/wxi+tJrTOvDceQD8Rzn7F0y/DFwL6lAplJKMvdac8
 Aj0k3+FUSb8yY6dQtKfrve0CE5ehQqPVfcbHRdcHw9OSYnYPbP5vajzdS09IHMSs+Ngn
 GyR7+f6Jcw0ExsWusu7WoK+JSfUrygNcnBquX2uVoFl+22/C7N3+qXwVaXCJVmMlTVmY
 5+gQ==
X-Gm-Message-State: APjAAAWiYAVwxhY6PAkjEISy+Yo+qOqKWgBGBTB7vBKVs3P+9T54fek+
 LyG6Qr/fBavaPMKJG0ciGSQfzt3l6Wnz+c5z+USpUlknriue1Ng3JlaYEi92pUlda4RvrNpgX+2
 VTc++MMI+7lJKXKcMY1dyzF3CFM2i5us5c66bi9EM
X-Received: by 2002:a63:cf4a:: with SMTP id b10mr31888997pgj.276.1570474203735; 
 Mon, 07 Oct 2019 11:50:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYyjrNHb+/upkDF34lQqoJHpIsoJNhShTHUYsAQiE+4k5gVsln5/4pRkvWxwYkZjhr4KZGLQ==
X-Received: by 2002:a63:cf4a:: with SMTP id b10mr31888961pgj.276.1570474203258; 
 Mon, 07 Oct 2019 11:50:03 -0700 (PDT)
Received: from 2001-b011-380f-3c42-ecd4-c98e-b194-f9c1.dynamic-ip6.hinet.net
 (2001-b011-380f-3c42-ecd4-c98e-b194-f9c1.dynamic-ip6.hinet.net.
 [2001:b011:380f:3c42:ecd4:c98e:b194:f9c1])
 by smtp.gmail.com with ESMTPSA id ce16sm223338pjb.29.2019.10.07.11.50.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 11:50:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20190925113255.25062-2-kai.heng.feng@canonical.com>
Date: Tue, 8 Oct 2019 02:49:56 +0800
Message-Id: <F3E69B3D-E11B-4D99-905A-CC5927D61D6C@canonical.com>
References: <20190925113255.25062-1-kai.heng.feng@canonical.com>
 <20190925113255.25062-2-kai.heng.feng@canonical.com>
To: tiwai@suse.com
X-Mailer: Apple Mail (2.3594.4.19)
Cc: Bjorn Helgaas <bhelgaas@google.com>, Linux PCI <linux-pci@vger.kernel.org>,
 alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 2/2] ALSA: hda: Allow HDA to be runtime
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Takashi,

> On Sep 25, 2019, at 19:32, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
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
> 
> BugLink: https://bugs.launchpad.net/bugs/1840835
> Fixes: b516ea586d71 ("PCI: Enable NVIDIA HDA controllers")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Do you still have any concern on this patch?
Please merge [v5 1/2] and this patch [v4 2/2] if you think it's good.

Thanks!

Kai-Heng

> ---
> v4:
> - Find upstream port, it's callee's responsibility now.
> v3:
> - Make changelog more clear.
> v2:
> - Change wording.
> - Rebase to Tiwai's branch.
> sound/pci/hda/hda_intel.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 240f4ca76391..e63b871343e5 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1280,11 +1280,17 @@ static void init_vga_switcheroo(struct azx *chip)
> {
> 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
> 	struct pci_dev *p = get_bound_vga(chip->pci);
> +	struct pci_dev *parent;
> 	if (p) {
> 		dev_info(chip->card->dev,
> 			 "Handle vga_switcheroo audio client\n");
> 		hda->use_vga_switcheroo = 1;
> -		chip->bus.keep_power = 1; /* cleared in either gpu_bound op or codec probe */
> +
> +		/* cleared in either gpu_bound op or codec probe, or when its
> +		 * upstream port has _PR3 (i.e. dGPU).
> +		 */
> +		parent = pci_upstream_bridge(p);
> +		chip->bus.keep_power = parent ? !pci_pr3_present(parent) : 1;
> 		chip->driver_caps |= AZX_DCAPS_PM_RUNTIME;
> 		pci_dev_put(p);
> 	}
> -- 
> 2.17.1
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
