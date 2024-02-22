Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC5860496
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 22:15:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FBE8850;
	Thu, 22 Feb 2024 22:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FBE8850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708636548;
	bh=+xIXD/2/oxIWEfrv3yIZldxrY3+fcQ19267trFYIMr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gma6d5B+u6eD9hG0d4/i0rqOTHrU1/ZYTNVSHZELY2r/YLwEzeNGMJrHEOSrmU2WN
	 VQruIDl6Skm1Wv2iv0NPvKFDmr+EPaQkE7vQF/frkXykqKm/+vGsCS6g5EKfwXj5Zz
	 /vyPy2HKCgYpI+a6SuALh+GlfUuMz0cE6rtt6QEY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC721F80567; Thu, 22 Feb 2024 22:15:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C19DEF805A1;
	Thu, 22 Feb 2024 22:15:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BCB8F80496; Thu, 22 Feb 2024 22:15:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21B6CF800EE
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 22:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21B6CF800EE
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5a0333a9779so60418eaf.0
        for <alsa-devel@alsa-project.org>;
 Thu, 22 Feb 2024 13:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708636507; x=1709241307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwu0gmTsePp7o8N8/VmTdIjFEQ9vkLhfKTZRszY+BUE=;
        b=SQHnZMMGsBOHzNAf2OFh6ueWRprt6bqJXCKAhVWPjVFUepFH8HFrfdM9gVRmuUc2Zw
         X6p7/S6f/ICSE0/AAa5M/DTcjGI5dKLQRTXonQkzIryQDiuVMb5bVXtx2gB6vEkHExnR
         YpPID+ZvR3JtRNWhTaff+AfqmPlfZAUqezvbY7zocLGANHDGhtAFfSfvvBmaonFHs3zC
         cVBXiLGqV9O7fcc4ZmVR/ZKGONqS/yBgGskNy0ek5T29ThFN1tBmfQLHL9WSY0sg2PVn
         p0yM0pQoXP2NG4kCNBa5YNG+XywF+xKSw5KlVoJN6LQTcrToFyMSj+ZCuDkjba5taTAU
         JT3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ2+MKaADr6AnyEP2EQ8nuHR3mYH+XeU6xmW0c+kGPdFyFFZDPRHrHbfutjCVkGegS/hiKu70fLBSARccu/MKrS+svh9+MGqFkuiA=
X-Gm-Message-State: AOJu0YwAjmsDQRGLMCrGa1qBP7Lmg1wR0mK57g8D1pNOklYJ7R5DFRKY
	J46IsXGI6luzVUfRwbkqbH4U0ryZn80Ilhwa3EhLaYSCynojAPoG82n8+FpqdgLQ1JUZ82fFkuq
	y/kgZVmjEzWnFSm9pPhxtVNlJo6U=
X-Google-Smtp-Source: 
 AGHT+IFBhFMeTig5AOkgadvukvOfwWjQ8r353Lb0HZrWECBBPfGC+Dj9rZuEDuEVrBus6h6V0upsu6tQaky4nxbghaA=
X-Received: by 2002:a4a:e757:0:b0:5a0:3c8a:4940 with SMTP id
 n23-20020a4ae757000000b005a03c8a4940mr162016oov.1.1708636507038; Thu, 22 Feb
 2024 13:15:07 -0800 (PST)
MIME-Version: 1.0
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: 
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 22 Feb 2024 22:14:55 +0100
Message-ID: 
 <CAJZ5v0hmD+7iSKKexpUccvMUtjNpd9fHo3vRrshD_s=rb5Vq_w@mail.gmail.com>
Subject: Re: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
To: Dan Williams <dan.j.williams@intel.com>
Cc: gregkh@linuxfoundation.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Marc Herbert <marc.herbert@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-coco@lists.linux.dev,
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OTSD3HWUHJAFCPHPJ4SMRLDX7FPJZSJN
X-Message-ID-Hash: OTSD3HWUHJAFCPHPJ4SMRLDX7FPJZSJN
X-MailFrom: rjwysocki@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTSD3HWUHJAFCPHPJ4SMRLDX7FPJZSJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 22, 2024 at 9:40=E2=80=AFPM Dan Williams <dan.j.williams@intel.=
com> wrote:
>
> It turns out that arch/x86/events/intel/core.c makes use of "empty"
> attributes.
>
>         static struct attribute *empty_attrs;
>
>         __init int intel_pmu_init(void)
>         {
>                 struct attribute **extra_skl_attr =3D &empty_attrs;
>                 struct attribute **extra_attr =3D &empty_attrs;
>                 struct attribute **td_attr    =3D &empty_attrs;
>                 struct attribute **mem_attr   =3D &empty_attrs;
>                 struct attribute **tsx_attr   =3D &empty_attrs;
>                 ...
>
> That breaks the assumption __first_visible() that expects that if
> grp->attrs is set then grp->attrs[0] must also be set and results in
> backtraces like:
>
>     BUG: kernel NULL pointer dereference, address: 00rnel mode
>     #PF: error_code(0x0000) - not-present ] PREEMPT SMP NOPTI
>     CPU: 1 PID: 1 Comm: swapper/IP: 0010:exra_is_visible+0x14/0x20
>      ? exc_page_fault+0x68/0x190
>      internal_create_groups+0x42/0xa0
>      pmu_dev_alloc+0xc0/0xe0
>      perf_event_sysfs_init+0x580000000000 ]---
>     RIP: 0010:exra_is_visible+0x14/0
>
> Check for non-empty attributes array before calling is_visible().
>
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Closes: https://github.com/thesofproject/linux/pull/4799#issuecomment-195=
8537212
> Fixes: 70317fd24b41 ("sysfs: Introduce a mechanism to hide static attribu=
te_groups")

This is not in the mainline, so linux-next I suppose?

> Cc: Marc Herbert <marc.herbert@intel.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  fs/sysfs/group.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index ccb275cdabcb..8c63ba3cfc47 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -33,10 +33,10 @@ static void remove_files(struct kernfs_node *parent,
>
>  static umode_t __first_visible(const struct attribute_group *grp, struct=
 kobject *kobj)
>  {
> -       if (grp->attrs && grp->is_visible)
> +       if (grp->attrs && grp->attrs[0] && grp->is_visible)
>                 return grp->is_visible(kobj, grp->attrs[0], 0);
>
> -       if (grp->bin_attrs && grp->is_bin_visible)
> +       if (grp->bin_attrs && grp->bin_attrs[0] && grp->is_bin_visible)
>                 return grp->is_bin_visible(kobj, grp->bin_attrs[0], 0);
>
>         return 0;
>
