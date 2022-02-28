Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C82A4C9FD5
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:50:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A35711F36;
	Wed,  2 Mar 2022 09:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A35711F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211039;
	bh=7QSR0bm9I7LZ1ABGEJBV79SefiKYiYXEhFBH78auvFw=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rn80jvMnluySxP131TBgwAQdamGEPWHbvDDK8D1V+3m6klb8/wHk07SLzo4bLtEgw
	 8LkuUqsQ4LLTwajp4C1Tgrcn/az7+qQLujI9ijgBFSgoG84KXxnaW1D/jWW/iSLWk5
	 GEaekFyGcGYD+dzevGE+Uc9zLrAGAfuEl7pFsZyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91BDDF80683;
	Wed,  2 Mar 2022 09:34:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 255E9F8013C; Mon, 28 Feb 2022 23:05:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10D26F80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 23:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10D26F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SsE2iptd"
Received: by mail-ej1-x635.google.com with SMTP id qa43so1097377ejc.12
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 14:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rjAgW0TZYa01aB+RWuD5jL6/P65QVmPGzGS1fypwqkM=;
 b=SsE2iptdX/xTNU84zbtZf+FZ8hKTkJX9H9ZM578+fdgJrDU7+0yGKs3Y1+Ec8zM22z
 4L/SCSccM9eH+aBbsU9p5ll5VTrDlXvOt1QFHQZ0QoX++s1RFseEQQ8VJGBWAvwFCFIq
 jeFzH1SGTYgHS7irPmR7cmG6wYjaX3+E6LxhLklpw86+z7E18Zuelcsa1QvD5X9AuKj5
 NYlhLrqxXUYjh+QgOiXwDeMKoQqdSp4BR7hulFUTvSZMfnkNflEuO+lrt30n2JUf7UIn
 5TdA8KwzIEgmQjPXnxPtLxIzLgpwPLiA+LehnjNWRY5HBdt4E59Tm/VNBLrMAmAi/DS2
 EEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rjAgW0TZYa01aB+RWuD5jL6/P65QVmPGzGS1fypwqkM=;
 b=G6awTRMgTEgZ1XsHJDjz4Dmex1b4bba7kQ2HtuSv1F9Duzbr/4a8MOQK/ruXWNoSLT
 GYZMsJIrwPbkDyhuDsvyA2jbis61zGKUpqZFJLjE2WYzepzvj7umS/ZLm/0I1UBI3fKS
 RofM7WaCcjayGTHeJUzfxAqsI479uOVFXs1npGGv9uh4nSGrkHoCvhQA2AGRn2GdppFL
 ibmHBRG3U7ldquxwUXZqCY8ukP6AfJqy01tAgmHdenYKdAk2qQ+M3uuaC7cgAuGvINBu
 84eiBd8s/WZFwJUhYttS+gnGvo/lwPGdK0Y+eYjnDH7/76oVOlHL7vCvhHKlRxpidfrW
 uB7Q==
X-Gm-Message-State: AOAM533ycuHtTVO90hlN0bwJNwED6jjECPZHiqo2zrxLRXNHRqBc/nzQ
 5PGYtqSFT7r2/vU/WSC/9js=
X-Google-Smtp-Source: ABdhPJy9dyrpbH/urhqhSpy7WKh/oklsnc56vlW33h3ZTWE1g0yI8U4qpehenqdC8nVSV7dV3sC9Vw==
X-Received: by 2002:a17:906:370f:b0:6ce:6e7:7344 with SMTP id
 d15-20020a170906370f00b006ce06e77344mr16083589ejc.654.1646085929715; 
 Mon, 28 Feb 2022 14:05:29 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a17090606c200b006a728f4a9bcsm4769566ejb.148.2022.02.28.14.05.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 14:05:29 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
Date: Mon, 28 Feb 2022 23:05:26 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <192A6D7F-E803-47AE-9C7A-267B4E87C856@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:34 +0100
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
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



> On 28. Feb 2022, at 21:56, Christian K=C3=B6nig =
<christian.koenig@amd.com> wrote:
>=20
>=20
>=20
> Am 28.02.22 um 21:42 schrieb James Bottomley:
>> On Mon, 2022-02-28 at 21:07 +0100, Christian K=C3=B6nig wrote:
>>> Am 28.02.22 um 20:56 schrieb Linus Torvalds:
>>>> On Mon, Feb 28, 2022 at 4:19 AM Christian K=C3=B6nig
>>>> <christian.koenig@amd.com> wrote:
>>>> [SNIP]
>>>> Anybody have any ideas?
>>> I think we should look at the use cases why code is touching (pos)
>>> after the loop.
>>>=20
>>> Just from skimming over the patches to change this and experience
>>> with the drivers/subsystems I help to maintain I think the primary
>>> pattern looks something like this:
>>>=20
>>> list_for_each_entry(entry, head, member) {
>>>      if (some_condition_checking(entry))
>>>          break;
>>> }
>>> do_something_with(entry);

There are other cases where the list iterator variable is used after the =
loop
Some examples:

- list_for_each_entry_continue() and list_for_each_entry_from().

- (although very rare) the head is actually of the correct struct type.
		(ppc440spe_get_group_entry(): =
drivers/dma/ppc4xx/adma.c:1436)

- to use pos->list for example for list_add_tail():
		(add_static_vm_early(): arch/arm/mm/ioremap.c:107)

If the scope of the list iterator is limited those still need fixing in =
a different way.

>>=20
>> Actually, we usually have a check to see if the loop found anything,
>> but in that case it should something like
>>=20
>> if (list_entry_is_head(entry, head, member)) {
>>     return with error;
>> }
>> do_somethin_with(entry);
>>=20
>> Suffice?  The list_entry_is_head() macro is designed to cope with the
>> bogus entry on head problem.
>=20
> That will work and is also what people already do.
>=20
> The key problem is that we let people do the same thing over and over =
again with slightly different implementations.
>=20
> Out in the wild I've seen at least using a separate variable, using a =
bool to indicate that something was found and just assuming that the =
list has an entry.
>=20
> The last case is bogus and basically what can break badly.
>=20
> If we would have an unified macro which search for an entry combined =
with automated reporting on patches to use that macro I think the =
potential to introduce such issues will already go down massively =
without auditing tons of existing code.

Having a unified way to do the same thing would indeed be great.

>=20
> Regards,
> Christian.
>=20
>>=20
>> James
>>=20
>>=20
>=20

- Jakob

