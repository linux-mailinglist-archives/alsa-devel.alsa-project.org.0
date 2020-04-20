Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2741B1E91
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 08:07:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C52D168A;
	Tue, 21 Apr 2020 08:06:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C52D168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587449240;
	bh=phWybluJh4Glb6EhiUxSu+xC6rAuN+x8pQS/QuTPatU=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u6xTP33ffIyH6+oIlO0p0a0/um4RPHrLJMCCPxm1q/oG77PVzgtjWX7B0+VXTjEiP
	 wmPfkIpb0vOTqPjx5KNhma65wqN1xLb5/AHP3qttfcLWfmUo1IznWgTUEMce5ApfKh
	 /td+MKcTb8M+z+3q972IREkFQt7Nnok7nle6JJQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F98F8028C;
	Tue, 21 Apr 2020 08:04:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19E03F801D9; Mon, 20 Apr 2020 21:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BA56F800C8
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 21:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BA56F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=zzywysm.com header.i=@zzywysm.com
 header.b="DHwk8VKE"
Received: by mail-qk1-x741.google.com with SMTP id v7so12176813qkc.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zzywysm.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1CahSbHOz6rwR75qjwbzvpk5/lxzAsXTVlJJFrluNmk=;
 b=DHwk8VKEaaVWe6umPwn75HeYPWa4/to4TPUyIyniHa8w0VjI4jbFRgfwiJbMPyVTBF
 XIxMCwftVuZ5LMDuVHb9gd/oo9bVOeOag3KnWsbyRKiBySEDw18VNG9po6wPOgaX+JV0
 U696lIpKGeSvPcCzw56gqM/agX1+2/QWVes4jWwOX1kSM0DMbVae9AqQEle3/5swq1WR
 3E0xc6MJg7TbdMO3xq2INKKP9cMKexf1GETBAnT4Wc/qvIJu4eZ79zfLThZbNisSrGcf
 uNvuImd6aWtDGh5xTm0hSIil3sDlm0TTj3TRSR1SEsiBL/e+4Ps6DP19SkF+CcVNT33D
 HkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1CahSbHOz6rwR75qjwbzvpk5/lxzAsXTVlJJFrluNmk=;
 b=t0CVV36O5R0q107NIkm27g47RXRczbe3Crx2Lz+VQKVt5ms6RLys1CX8tEQaGFl4MD
 vTt458Yk9PcTUeZQxnmrOebdqMWPqtulLBFzUdn46gdARUsx7lANq0xGmRZ+8sHA/BHA
 vZNf4gu38Ym5CQLrPxMG8qaZtQkFcJRKGRNwIQrBB8IyYiuMN16VXsnHb1+KM7Tbk9SD
 R0vN/cIfzRIJHWJ41Yvwm+JU/yRXADPz572RI2JmZrXH4UZufeqaKtzjHjACu290YVs1
 +gbVlke+EiVgmccBZOilPPjo4UfszMoH7J3uD3sJ3XFSLEa9MmHYC8SI+Jb4tL7uR2/6
 62Aw==
X-Gm-Message-State: AGi0PuaJlrCJXuOHcK8X426Ear3yRqjXXpNTYWOKwSqVRqDPYtb2Ltg8
 1KozZxRSfTAKJTI7bv8P7gsbXw==
X-Google-Smtp-Source: APiQypLbKFRt3y7j9cRt5ohxKGUgZ2cg5IXsM72wAdwrD/eEvlPuY2BnSQ46fW3IHvQ9kSE9m6xMag==
X-Received: by 2002:a37:5284:: with SMTP id g126mr18284316qkb.51.1587412716060; 
 Mon, 20 Apr 2020 12:58:36 -0700 (PDT)
Received: from [10.19.49.2] (ec2-3-17-74-181.us-east-2.compute.amazonaws.com.
 [3.17.74.181])
 by smtp.gmail.com with ESMTPSA id j2sm241058qtp.5.2020.04.20.12.58.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 12:58:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 2/9] fix empty-body warning in posix_acl.c
From: Zzy Wysm <zzy@zzywysm.com>
In-Reply-To: <CAHk-=wjSzuTyyBkmMDG4fx_sXzLJsh+9Xk-ubgbpJzJq_kzPsA@mail.gmail.com>
Date: Mon, 20 Apr 2020 14:58:31 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <F8B969BE-A2B1-4E6D-8746-BBFBE6399328@zzywysm.com>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-3-rdunlap@infradead.org>
 <CAHk-=wjSzuTyyBkmMDG4fx_sXzLJsh+9Xk-ubgbpJzJq_kzPsA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Tue, 21 Apr 2020 08:04:34 +0200
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 target-devel <target-devel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Chuck Lever <chuck.lever@oracle.com>,
 linux-input@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, "open list:NFS, SUNRPC,
 AND..." <linux-nfs@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>
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


> On Apr 18, 2020, at 1:53 PM, Linus Torvalds =
<torvalds@linux-foundation.org> wrote:
>=20
> Thirdly, there's a *reason* why "-Wextra" isn't used.
>=20
> The warnings enabled by -Wextra are usually complete garbage, and
> trying to fix them often makes the code worse. Exactly like here.
>=20

As the instigator of this warning cleanup activity, even _I_ don=E2=80=99t=
 recommend
building with all of -Wextra.  Doing so on an allmodconfig build =
generates=20
500 megabytes of warning text (not exaggerating), primarily due to=20
-Wunused-parameter and Wmissing-field-initializers.

I strongly recommend disabling them with -Wno-unused-parameter=20
-Wno-missing-field-initializers since the spew is completely =
unactionable.

On the other hand, -Woverride-init found a legit bug that was breaking =
DVD
drives, fixed in commit 03264ddde2453f6877a7d637d84068079632a3c5.

I believe finding a good set of compiler warning settings can lead to =
lots of=20
good bugs being spotted and (hopefully) fixed.  Why let syzbot do all =
the work?

zzy

