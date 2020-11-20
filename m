Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1252C2DA6
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:02:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B9061705;
	Tue, 24 Nov 2020 18:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B9061705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237348;
	bh=29/AaAKKWIjlxKBDiu42mXe16/c3LUzQvTdn0Wctw9g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcPKDIHB7kNaS0lC8zFubve7C36LyPpOcFlOmESMFmSzA1JEH3RLu7mSzZt8IGSnO
	 9YlHmPu6NFaMp4U7v92TJ/TwBhZ6KL5Khja4m2QK4QGtkwrl7tuojyJooMtjfDAAjZ
	 69KGZQq6x1RpOVg12wZK0cW5EGBXMsctO6EsyvyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6634F804ED;
	Tue, 24 Nov 2020 17:58:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4212F8016C; Fri, 20 Nov 2020 23:21:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28EF9F800F3
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 23:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28EF9F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="th/UjqVc"
Received: by mail-yb1-xb44.google.com with SMTP id o71so9981598ybc.2
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 14:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=29/AaAKKWIjlxKBDiu42mXe16/c3LUzQvTdn0Wctw9g=;
 b=th/UjqVcversiy9gEUr46cKRrhHywr0iTgf9mzUejm+T3/Jtu2c6ftjob7N1dnOe2S
 rGVMit/4Gqy7ZDqW+do8x9wI8RCPt/cmuWncILsoBuux3CBAtfG8gT+eTL8wiBVSM5EH
 rDgxqkIvK+vUXnfhgj71GxYIUQH1hInVNMbCl5+3prik9RGhi+hsmul85xXuf9uJVr2L
 NGLQGWDmOXXHg4l9XujW0HrVyacbE3Q1QSLAkLJ0BjE5AdFqhLyeU3T8/6+nJ9hH0JSR
 o1vAVeqr6Bt+/W6rGIwrn7PuvAvMGRmk1Avx4k6vjCg8etglRiDTMnimrqKcX/KEsNCP
 0CAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29/AaAKKWIjlxKBDiu42mXe16/c3LUzQvTdn0Wctw9g=;
 b=n6Kv3e6B1c/bmTPNt1BczwxarB4WxQcmOlUVnlzOCW26yX/wmaXhqSMvC8I7ADyj/K
 xezEbgTr5gwya7CGqRowNZ59bg4j6XM3PBkCufHaNROdklKwsjBjXCLCk+2AcTNgreye
 NpnpwOcQZNpfElL8C53S7ifvMsZa4fPozrU87FaW/h+YKdWDIThBKgOEagEpoXtAlI0m
 o0xtDJiCB7BIQANdLxXq1s2GKL+HHOkzO9w9x3h3jHMHFPt4HvPibfyHr0DJ4+a8N8Ic
 2zP9+pJESqldwp4cdEEra3oQtYAbQ1QEgVMN82SMfxOB8wNzQzEPpoOf/np7a8MzROOr
 a+RA==
X-Gm-Message-State: AOAM530LN5Nu1BAOhrqrD9WJiDNP22Bd5tHA5p/xfm34b8JcdS5mS2xo
 1EN7ZESbiDD5gKMSEE1JpZoIJadjm9MXLU4Uj/0=
X-Google-Smtp-Source: ABdhPJzYUhkcjTyH5GIcOV5fWMsl+OUdzem471zLY9usW3RhV8izQIRbyESMTmZwFikqgbfOQQqVvSSQCZzBPJX4q90=
X-Received: by 2002:a5b:40e:: with SMTP id m14mr22113400ybp.33.1605910888617; 
 Fri, 20 Nov 2020 14:21:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2020 23:21:17 +0100
Message-ID: <CANiq72=E_gEVvqUUTSqU4zegC2=yZSTM4b=4G-iofp6d3=UgWQ@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:08 +0100
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
 Kees Cook <keescook@chromium.org>, Linux-MM <linux-mm@kvack.org>,
 Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
 netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

Hi Gustavo,

On Fri, Nov 20, 2020 at 7:21 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Hi all,
>
> This series aims to fix almost all remaining fall-through warnings in
> order to enable -Wimplicit-fallthrough for Clang.

Thanks for this.

Since this warning is reliable in both/all compilers and we are
eventually getting rid of all the cases, what about going even further
and making it an error right after?

Cheers,
Miguel
