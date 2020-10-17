Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9321D294DCE
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 15:44:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C985B17B4;
	Wed, 21 Oct 2020 15:44:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C985B17B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603287898;
	bh=8WyVguLu7EmaLMt1Kjbh4qHON1xzN3lw5VCzmcJL8Y8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dmbQBQLMhsWEiU+WYyDnSaqIvkj1HflJwsfMA6Z/fjaRLIicuL+CQSCt2NQqDqfq7
	 Cw1EsoEhpjebhSFDzMluzAcg1q1wfgM4RJKrV4H8zt6i0c0qgJcTduFBldojT3BJZ2
	 Uec2BShRUi61RCLZRdXqpQNWhxKEXL4qqHKUOf/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F4A7F8051D;
	Wed, 21 Oct 2020 15:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DECAF80255; Sat, 17 Oct 2020 23:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3538AF800F4
 for <alsa-devel@alsa-project.org>; Sat, 17 Oct 2020 23:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3538AF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="ntIAxdfj"
Received: by mail-ej1-x644.google.com with SMTP id a3so8423175ejy.11
 for <alsa-devel@alsa-project.org>; Sat, 17 Oct 2020 14:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QU5tUnKrk3cCgEOM6DUuSpHohPcIoidzngrqxPrVqlg=;
 b=ntIAxdfj5B3UZZJPAO3W3zqpuYJdxZe6wmMN+Cg5+tfh5QjsxLbXR5o2amfdJQ2J48
 +r9G2vZiMs4S/e6t6kNU+/1RisTXP2Yspklt8lksB4PhSQjsUISEYusYJeN2p0XCHoqr
 5tX/QI+fZe3GQZJaviemAIYQlGxoIFC7s6aX8R5MJQLi2SOYJ/keQbrc62HNUeJ8pCOI
 7WYztP0OE4axPIRoGDfVK4aq4k9dPY6fZ69Y4fL3/a70qb0GrKtNhloBSbp9yIhwtpgg
 UECkhdkcAFyI2jUc3qFZfU7NKoc+E1dZJHZxhONiRQFFV//aVnbaYjp+hfJUaNjfh3TU
 ik3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QU5tUnKrk3cCgEOM6DUuSpHohPcIoidzngrqxPrVqlg=;
 b=HO+cw/A2eD3FY68V1cPMpi7qc8Y20o3d4JNktNVjy0tmo5rvoWfz/xBV2tKm7bAMEm
 p6w87+e7IU3h65yZ+j/dEBdHHwhyR2EL4L3XV8sdVJijpclxuWmc3c07gXnYP7NBV0MB
 9YXn6TIIHL9fNaGYQsNes65E9hI70TFova+GHUxgoyDF9xt/D48d2thVKRNuqTkKxvQ7
 Fld2JrIA/dp7SNzso9KCYuMJfKDC8OVmtAM258pu4TSdEpRllw/b8i+tK1O6yYxblV0s
 hC6ixK5o7Y35XQc3wlPclzEFChTZX3n4x0CXmY1Oo+cl2WpHM9g5QRWs3h3RHxxy/dUy
 nJsg==
X-Gm-Message-State: AOAM530U2SE3DCPw26FuR0ROqR/5aFNnN4p0QSYAT5eJP+gPQIbplCbb
 wCcjXqAhMIDb8j1MxAjnR+STOIdSWPBGVS1ufR0f3w==
X-Google-Smtp-Source: ABdhPJzde2s6j/g/ekBLPPrgSH2EJqfd3KSDRuhe3Mnzr9w98lVRa6HniOngGCyhNuV4q/eDk1HFvyy/v8IqyEanGTA=
X-Received: by 2002:a17:906:1a19:: with SMTP id
 i25mr9957370ejf.323.1602968492144; 
 Sat, 17 Oct 2020 14:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201017160928.12698-1-trix@redhat.com>
In-Reply-To: <20201017160928.12698-1-trix@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 17 Oct 2020 14:01:22 -0700
Message-ID: <CAPcyv4jkSFxMXgMABX7sDbwmq8zJO=rLX2ww3Y9Tc0VAANY8xQ@mail.gmail.com>
Subject: Re: [RFC] treewide: cleanup unreachable breaks
To: trix@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 21 Oct 2020 15:37:34 +0200
Cc: alsa-devel@alsa-project.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
 storagedev@microchip.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "open list:KEYS-TRUSTED" <keyrings@vger.kernel.org>,
 linux-mtd@lists.infradead.org, ath10k@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, usb-storage@lists.one-eyed-alien.net,
 linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, intel-wired-lan@lists.osuosl.org,
 industrypack-devel@lists.sourceforge.net,
 Linux PCI <linux-pci@vger.kernel.org>, spice-devel@lists.freedesktop.org,
 MPT-FusionLinux.pdl@broadcom.com,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 linux-serial@vger.kernel.org, linux-nfc@lists.01.org,
 Linux-pm mailing list <linux-pm@vger.kernel.org>, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-integrity@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org,
 linux-crypto <linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com,
 bpf@vger.kernel.org, ocfs2-devel@oss.oracle.com, linux-power@fi.rohmeurope.com
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

On Sat, Oct 17, 2020 at 9:10 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> This is a upcoming change to clean up a new warning treewide.
> I am wondering if the change could be one mega patch (see below) or
> normal patch per file about 100 patches or somewhere half way by collecting
> early acks.
>
> clang has a number of useful, new warnings see
> https://clang.llvm.org/docs/DiagnosticsReference.html
>
> This change cleans up -Wunreachable-code-break
> https://clang.llvm.org/docs/DiagnosticsReference.html#wunreachable-code-break
> for 266 of 485 warnings in this week's linux-next, allyesconfig on x86_64.
>
> The method of fixing was to look for warnings where the preceding statement
> was a simple statement and by inspection made the subsequent break unneeded.
> In order of frequency these look like
>
> return and break
>
>         switch (c->x86_vendor) {
>         case X86_VENDOR_INTEL:
>                 intel_p5_mcheck_init(c);
>                 return 1;
> -               break;
>
> goto and break
>
>         default:
>                 operation = 0; /* make gcc happy */
>                 goto fail_response;
> -               break;
>
> break and break
>                 case COLOR_SPACE_SRGB:
>                         /* by pass */
>                         REG_SET(OUTPUT_CSC_CONTROL, 0,
>                                 OUTPUT_CSC_GRPH_MODE, 0);
>                         break;
> -                       break;
>
> The exception to the simple statement, is a switch case with a block
> and the end of block is a return
>
>                         struct obj_buffer *buff = r->ptr;
>                         return scnprintf(str, PRIV_STR_SIZE,
>                                         "size=%u\naddr=0x%X\n", buff->size,
>                                         buff->addr);
>                 }
> -               break;
>
> Not considered obvious and excluded, breaks after
> multi level switches
> complicated if-else if-else blocks
> panic() or similar calls
>
> And there is an odd addition of a 'fallthrough' in drivers/tty/nozomi.c
[..]
> diff --git a/drivers/nvdimm/claim.c b/drivers/nvdimm/claim.c
> index 5a7c80053c62..2f250874b1a4 100644
> --- a/drivers/nvdimm/claim.c
> +++ b/drivers/nvdimm/claim.c
> @@ -200,11 +200,10 @@ ssize_t nd_namespace_store(struct device *dev,
>                 }
>                 break;
>         default:
>                 len = -EBUSY;
>                 goto out_attach;
> -               break;
>         }

Acked-by: Dan Williams <dan.j.williams@intel.com>
