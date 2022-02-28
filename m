Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D40004C9FB9
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:47:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76D931EED;
	Wed,  2 Mar 2022 09:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76D931EED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210827;
	bh=0lzbVtk+imrXfi2cYiTyhRv0m5uKIiVhrltGFMvRR9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2iGI5Ja2nT2pQyM10DozwEwipvABBgrFhaAP86DbKSvKUv/E6/upu84KTb8PmxAZ
	 ReNOIAJOwHRiPvFqJhg5xtRNCRv/a8T/aPGSL2M7zIR+R89v9eHuaYUdZ7j0FHG2mp
	 dm9ZPApgbdQPCUuyuehWIPQyve0MPSOHPQN8W0QM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83D52F80621;
	Wed,  2 Mar 2022 09:34:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A85CF8013C; Mon, 28 Feb 2022 21:17:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODYSUB_1,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19792F80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 21:17:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19792F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.b="Jhdls+Dd"
Received: by mail-ed1-x529.google.com with SMTP id w3so19185082edu.8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 12:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LeZ8UzRXrDw4d1M4BG6ctt9COK0EF5j9qtOsLWtMfJg=;
 b=Jhdls+DdmLi+4DWS7o2GehQ/Yg8vWPth9HxY0ymuDsFhiEF5hlRLzgd1PV4wJ4dLVJ
 JdRWd6PhVxu3cPtesSY0XREEgjw/sVhI1zgx2ECNJUHRlykk7MmbqhfMtkifVM/LmgYS
 6chNfwYqW0eu75y5MSRY9nnHOEZnFkvhMXNYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LeZ8UzRXrDw4d1M4BG6ctt9COK0EF5j9qtOsLWtMfJg=;
 b=AcRn9KSynBF7rLrhc8smb0ncf/wXsxYzGHNvCaZn6SCpCUjiY+bR8CAQxKMwB3h4wx
 0V00odulC3LCe4Z+DBLYUO6Idvbz8wfqTNCK5J6hKR73wY2L+o9JjP6wvMX8CBB1fwT4
 noI+c12FMm4cpgFHjVlXkkmk5p2vKMJbis3IQJ9ogw/5MIjs9GamByXZEOeMh7UQ9vEg
 S2jk8MEevXWpe6wc4+qI4+AQWNhtph/7aDylNY+H72+ROdTJRlTGWp7kJs33ZUCM+GRD
 WghBfkAMc0uUV0pOonTcSjGrhlbqKTCH/FSx/f/XGRuRoDIbWau04OWc45Fmrjfi5ynP
 kBsg==
X-Gm-Message-State: AOAM531StlrK8N+ojh4iYJM4yj9bn6DTeN61l7+OU3H1hGoz33BekgF3
 IrBNQabvPz86hnVb94SpDCurVrWIhCFQfKJWlLU=
X-Google-Smtp-Source: ABdhPJyRXvTUlFK+b8Y6/WhVXwnpLfLFX9XKXT2I4p/JqdE3CREyDpiWupIXQtOc24+SZixMvNsGRg==
X-Received: by 2002:a05:6402:38e:b0:410:c1a9:60aa with SMTP id
 o14-20020a056402038e00b00410c1a960aamr21464368edv.336.1646079420705; 
 Mon, 28 Feb 2022 12:17:00 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 h12-20020a056402280c00b00412ca9508b7sm6548913ede.17.2022.02.28.12.17.00
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:17:00 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id d17so17189588wrc.9
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 12:17:00 -0800 (PST)
X-Received: by 2002:ac2:4d91:0:b0:443:127b:558a with SMTP id
 g17-20020ac24d91000000b00443127b558amr14027806lfe.542.1646079041191; Mon, 28
 Feb 2022 12:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
In-Reply-To: <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:10:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
Message-ID: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="0000000000008601b205d919a4ad"
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:36 +0100
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
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

--0000000000008601b205d919a4ad
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 12:03 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Side note: we do need *some* way to do it.

Ooh.

This patch is a work of art.

And I mean that in the worst possible way.

We can do

        typeof(pos) pos

in the 'for ()' loop, and never use __iter at all.

That means that inside the for-loop, we use a _different_ 'pos' than outside.

And then the compiler will not see some "might be uninitialized", but
the outer 'pos' *will* be uninitialized.

Unless, of course, the outer 'pos' had that pointless explicit initializer.

Here - can somebody poke holes in this "work of art" patch?

                     Linus

--0000000000008601b205d919a4ad
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_l074y7ca0>
X-Attachment-Id: f_l074y7ca0

IE1ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGFyY2gveDg2L2tlcm5lbC9j
cHUvc2d4L2VuY2wuYyB8IDIgKy0KIGluY2x1ZGUvbGludXgvbGlzdC5oICAgICAgICAgICB8IDYg
KysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IGRhZWI1Yzg4YjUwYi4uY2M0
YjBhMjY2YWYwIDEwMDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtlZmlsZQpAQCAtNTE1LDcg
KzUxNSw3IEBAIEtCVUlMRF9DRkxBR1MgICA6PSAtV2FsbCAtV3VuZGVmIC1XZXJyb3I9c3RyaWN0
LXByb3RvdHlwZXMgLVduby10cmlncmFwaHMgXAogCQkgICAtZm5vLXN0cmljdC1hbGlhc2luZyAt
Zm5vLWNvbW1vbiAtZnNob3J0LXdjaGFyIC1mbm8tUElFIFwKIAkJICAgLVdlcnJvcj1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbiAtV2Vycm9yPWltcGxpY2l0LWludCBcCiAJCSAgIC1XZXJy
b3I9cmV0dXJuLXR5cGUgLVduby1mb3JtYXQtc2VjdXJpdHkgXAotCQkgICAtc3RkPWdudTg5CisJ
CSAgIC1zdGQ9Z251MTEKIEtCVUlMRF9DUFBGTEFHUyA6PSAtRF9fS0VSTkVMX18KIEtCVUlMRF9B
RkxBR1NfS0VSTkVMIDo9CiBLQlVJTERfQ0ZMQUdTX0tFUk5FTCA6PQpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva2VybmVsL2NwdS9zZ3gvZW5jbC5jIGIvYXJjaC94ODYva2VybmVsL2NwdS9zZ3gvZW5j
bC5jCmluZGV4IDQ4YWZlOTZhZTBmMC4uODdkYjJmMzkzNmIwIDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9rZXJuZWwvY3B1L3NneC9lbmNsLmMKKysrIGIvYXJjaC94ODYva2VybmVsL2NwdS9zZ3gvZW5j
bC5jCkBAIC00NTAsNyArNDUwLDcgQEAgc3RhdGljIHZvaWQgc2d4X21tdV9ub3RpZmllcl9yZWxl
YXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAogCQkJCSAgICAgc3RydWN0IG1tX3N0cnVjdCAq
bW0pCiB7CiAJc3RydWN0IHNneF9lbmNsX21tICplbmNsX21tID0gY29udGFpbmVyX29mKG1uLCBz
dHJ1Y3Qgc2d4X2VuY2xfbW0sIG1tdV9ub3RpZmllcik7Ci0Jc3RydWN0IHNneF9lbmNsX21tICp0
bXAgPSBOVUxMOworCXN0cnVjdCBzZ3hfZW5jbF9tbSAqdG1wOwogCiAJLyoKIAkgKiBUaGUgZW5j
bGF2ZSBpdHNlbGYgY2FuIHJlbW92ZSBlbmNsX21tLiAgTm90ZSwgb2JqZWN0cyBjYW4ndCBiZSBt
b3ZlZApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9saXN0LmggYi9pbmNsdWRlL2xpbnV4L2xp
c3QuaAppbmRleCBkZDZjMjA0MWQwOWMuLjcwODA3OGIyZjI0ZCAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9saXN0LmgKKysrIGIvaW5jbHVkZS9saW51eC9saXN0LmgKQEAgLTYzNCw5ICs2MzQs
OSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbGlzdF9zcGxpY2VfdGFpbF9pbml0KHN0cnVjdCBsaXN0
X2hlYWQgKmxpc3QsCiAgKiBAaGVhZDoJdGhlIGhlYWQgZm9yIHlvdXIgbGlzdC4KICAqIEBtZW1i
ZXI6CXRoZSBuYW1lIG9mIHRoZSBsaXN0X2hlYWQgd2l0aGluIHRoZSBzdHJ1Y3QuCiAgKi8KLSNk
ZWZpbmUgbGlzdF9mb3JfZWFjaF9lbnRyeShwb3MsIGhlYWQsIG1lbWJlcikJCQkJXAotCWZvciAo
cG9zID0gbGlzdF9maXJzdF9lbnRyeShoZWFkLCB0eXBlb2YoKnBvcyksIG1lbWJlcik7CVwKLQkg
ICAgICFsaXN0X2VudHJ5X2lzX2hlYWQocG9zLCBoZWFkLCBtZW1iZXIpOwkJCVwKKyNkZWZpbmUg
bGlzdF9mb3JfZWFjaF9lbnRyeShwb3MsIGhlYWQsIG1lbWJlcikJCQkJCVwKKwlmb3IgKHR5cGVv
Zihwb3MpIHBvcyA9IGxpc3RfZmlyc3RfZW50cnkoaGVhZCwgdHlwZW9mKCpwb3MpLCBtZW1iZXIp
OwlcCisJICAgICAhbGlzdF9lbnRyeV9pc19oZWFkKHBvcywgaGVhZCwgbWVtYmVyKTsJXAogCSAg
ICAgcG9zID0gbGlzdF9uZXh0X2VudHJ5KHBvcywgbWVtYmVyKSkKIAogLyoqCg==
--0000000000008601b205d919a4ad--
