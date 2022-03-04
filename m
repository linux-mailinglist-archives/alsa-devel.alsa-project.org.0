Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB74CE3AA
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Mar 2022 09:40:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AF3E1B1A;
	Sat,  5 Mar 2022 09:39:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AF3E1B1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646469630;
	bh=91eD2uF3bLL4OIvpk8Nx67yZ00oHnR0gxNTiwOVnYaM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JBIjkLOAnkJte+7l7HapMfQLsxmzYIfFGCw2rMBEmooM7EQK5sIHFrnbmDZN75zaf
	 SnT2TWIqLKsVR6Tb8N9BUIZ+pCLWkD4glGG2K7EoIWrxMRv7mD3p0OXqF7w235yuyK
	 DCLmQZ13Eqs+B2qzrs08khmXqsK+bueZTkaJ67zM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 549E5F80538;
	Sat,  5 Mar 2022 09:36:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35492F801EC; Fri,  4 Mar 2022 08:00:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26229F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 08:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26229F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UcHSzcmM"
Received: by mail-pf1-x436.google.com with SMTP id e15so5302819pfv.11
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 23:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0a+oQu3LYTAbOOyoILb+F/zkApGIum0yjd+xPCLEHo4=;
 b=UcHSzcmMAevEFsqxc8gimvoSIew96LrW3UYvjfgkcaeLb/Edql9668oTELTgMdhcyh
 uwTLYgNgPfuwuQfZCbkLtuIX59UkP2xXrD0mK6eOfNdOu/KSihdjQUFHL7gwAFzgpb4Z
 PeSQfhLMwS3uLkuXfSSL1QQyblGTA4kTyWBkcty1viz6EkWmIbbGn99xu95lY6jAsJ0c
 CbisDo/RPFGn8gAJnKluj00ht4OQ80XaXmCEvGalnXTnvAWrV5UWFfWh6kgUBnLZJvSQ
 W0PYU136vUwP4grvjJEIhDxHc0WM1lPQ2cysIXPjh+breTQ07tU9AM0RgZ3Jr4UsSFjT
 NaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0a+oQu3LYTAbOOyoILb+F/zkApGIum0yjd+xPCLEHo4=;
 b=xqNzVb9C7gJD693JiRm8V0bOuNztRLlxPglJnjxuCZ213JYwbXvvln96klCm5hbIoT
 bR0A/e5y1A9MP0G/lIlC+rVs2rxVEHz7qCH1VfLy9uZRBifk/pYVEc5KhzKg57P3dGV5
 srUEhW0X6aclFytqgI5fY2ut4hGyJn25pXjRurksqArq15cgiWvCqcXejeq3obC/8Qv0
 sJoRd+Cbv3PqGiEQXH8LwzpX4JFQtwZx9A7OEaiXWs3FQsiDFsk7GK8JEfHeOgbAOi83
 9LD58MiW1uZh/TCir6bzjYpZoL9axWNbn64rxSXgUTIxPgB8ci+g7hf+R1rOH6/o4sSI
 NI4Q==
X-Gm-Message-State: AOAM533NFHLeKPkx5UosmHpDWUuKrGVnhrTV6kkEP9D4BlENErNeNTCb
 /vWnZhRqRuxaziPOuXiElG8=
X-Google-Smtp-Source: ABdhPJxBFOb3A6C/RlDh1uHGrWM51HjSkR68cXfNAhNGErUbSC2hd/FilwMHkJmidt1eEHAWD7GVrA==
X-Received: by 2002:a05:6a00:cc7:b0:4ec:c6f3:ad29 with SMTP id
 b7-20020a056a000cc700b004ecc6f3ad29mr41958698pfv.66.1646377221067; 
 Thu, 03 Mar 2022 23:00:21 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 f6-20020a654006000000b00346193b405fsm3665134pgp.44.2022.03.03.23.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 23:00:20 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: daniel.thompson@linaro.org
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Fri,  4 Mar 2022 14:59:57 +0800
Message-Id: <20220304065957.16799-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303121824.qdyrognluik74iph@maple.lan>
References: <20220303121824.qdyrognluik74iph@maple.lan>
X-Mailman-Approved-At: Sat, 05 Mar 2022 09:36:45 +0100
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, gustavo@embeddedor.com,
 linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org, c.giuffrida@vu.nl,
 amd-gfx@lists.freedesktop.org, torvalds@linux-foundation.org,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, h.j.bos@vu.nl, jgg@ziepe.ca,
 intel-wired-lan@lists.osuosl.org, nouveau@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 bjohannesmeyer@gmail.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 jakobkoschel@gmail.com, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-sgx@vger.kernel.org, nathan@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 xiam0nd.tong@gmail.com, david.laight@aculab.com,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 christian.koenig@amd.com, rppt@kernel.org
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

On Thu, 3 Mar 2022 12:18:24 +0000, Daniel Thompson wrote:
> On Thu, Mar 03, 2022 at 03:26:57PM +0800, Xiaomeng Tong wrote:
> > On Thu, 3 Mar 2022 04:58:23 +0000, David Laight wrote:
> > > on 3 Mar 2022 10:27:29 +0800, Xiaomeng Tong wrote:
> > > > The problem is the mis-use of iterator outside the loop on exit, and
> > > > the iterator will be the HEAD's container_of pointer which pointers
> > > > to a type-confused struct. Sidenote: The *mis-use* here refers to
> > > > mistakely access to other members of the struct, instead of the
> > > > list_head member which acutally is the valid HEAD.
> > >
> > > The problem is that the HEAD's container_of pointer should never
> > > be calculated at all.
> > > This is what is fundamentally broken about the current definition.
> > 
> > Yes, the rule is "the HEAD's container_of pointer should never be
> > calculated at all outside the loop", but how do you make sure everyone
> > follows this rule?
> 
> Your formulation of the rule is correct: never run container_of() on HEAD
> pointer.

Actually, it is not my rule. My rule is that never access other members
of the struct except for the list_head member after the loop, because
this is a invalid member after loop exit, but valid for the list_head
member which just is HEAD and the lately caculation (&pos->head) seems
harmless.

I have considered the case that the HEAD's container "pos" is layouted
across the max and the min address boundary, which means the address of
HEAD is likely 0x60, and the address of pos is likely 0xffffffe0.
It seems ok to caculate pos with:
((type *)(__mptr - offsetof(type, member)));
and it seems ok to caculate head outside the loop with:
if (&pos->head == &HEAD)
    return NULL;

The only case I can think of with the rule "never run container_of()
on HEAD" must be followed is when the first argument (which is &HEAD)
passing to container_of() is NULL + some offset, it may lead to the
resulting "pos->member" access being a NULL dereference. But maybe
the caller can take the responsibility to check if it is NULL, not
container_of() itself.

Please remind me if i missed somthing, thanks.

> 
> However the rule that is introduced by list_for_each_entry_inside() is
> *not* this rule. The rule it introduces is: never access the iterator
> variable outside the loop.

Sorry for the confusion, indeed, that is two *different* rule.

> 
> Making the iterator NULL on loop exit does follow the rule you proposed
> but using a different technique: do not allow HEAD to be stored in the
> iterator variable after loop exit. This also makes it impossible to run
> container_of() on the HEAD pointer.
> 

It does not. My rule is: never access the iterator variable outside the loop.
The "Making the iterator NULL on loop exit" way still leak the pos with NULL
outside the loop, may lead to a NULL deference.

> 
> > Everyone makes mistakes, but we can eliminate them all from the beginning
> > with the help of compiler which can catch such use-after-loop things.
> 
> Indeed but if we introduce new interfaces then we don't have to worry
> about existing usages and silent regressions. Code will have been
> written knowing the loop can exit with the iterator set to NULL.

Yes, it is more simple and compatible with existing interfaces. Howerver,
you should make every developers to remember that "pos will be set NULL on
loop exit", which is unreasonable and impossible for *every* single person.
Otherwise the mis-use-after-loop will lead to a NULL dereference.
But we can kill this problem by declaring iterator inside the loop and the
complier will catch it if somebody mis-use-after-loop.

> 
> Sure it is still possible for programmers to make mistakes and
> dereference the NULL pointer but C programmers are well training w.r.t.
> NULL pointer checking so such mistakes are much less likely than with
> the current list_for_each_entry() macro. This risk must be offset
> against the way a NULLify approach can lead to more elegant code when we
> are doing a list search.
> 

Yes, the NULLify approach is better than the current list_for_each_entry()
macro, but i stick with that the list_for_each_entry_inside() way is best
and perfect _technically_.

Thus, my idea is *better a finger off than always aching*, let's settle this
damn problem once and for all, with list_for_each_entry_inside().

--
Xiaomeng Tong
