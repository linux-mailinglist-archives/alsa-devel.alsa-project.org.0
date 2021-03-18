Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9F2340A4E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 17:39:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA2E41693;
	Thu, 18 Mar 2021 17:38:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA2E41693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616085539;
	bh=JYpIuDIkcUFkJAQ593hznKDjU051iEonZ4LBKmQsU8o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BWe2nGms46y9Ol4S4KhPWeESct5WjsOfLIC7hOSdX/dBRqxmC7P8Vh7+pepAoH2rJ
	 VuzFqG9yYmm9PBAtQ73MUBTmw1pVYw5we1DMJP/P+uaUGZPiE4s4mq0KKSMjB1s9h0
	 se3gLqkosKIuPSgM5gUfb2Pc8+B79GMT6RjnOBes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59320F80163;
	Thu, 18 Mar 2021 17:37:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 982A4F80165; Thu, 18 Mar 2021 17:37:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3B17F80124
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 17:37:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3B17F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="MHV1hC75"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="SirTUKf4"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 915641670;
 Thu, 18 Mar 2021 12:37:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 18 Mar 2021 12:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=eb/viqPxupZhsPgkpOhpbzXI59/
 9KzFss3Hur49TkGs=; b=MHV1hC75s0tnzBrHeswyV0gffVnm8FDkoDgBlGuELmu
 52XzBI433ZuXQd6rP0VR9BO5axY9sC9NwF+GjZF/S8a3eN5S+O46xPitLn/JR1XF
 XgRBpBaUVbM9PX9d7WzhqzZpoHKirGCo9zRN+JRSCozpNA5HUIQi/zAGZgnvXY3K
 jS1gL2QN2szbqF7eJna/Sju3OqJYVDqtj9V+eSU4TVoiyxqZtIsH6EiPPEnVhCP4
 HNlJmuQoHnSC/YSa+ext5JC02yKxT+QVyA3wwe9NGSdisyO8imG2QFiI+5fDWElx
 mlT2tSa4x/JoaQLr3ajcpf+oGMqwgWLSMxbG8sgT8kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eb/viq
 PxupZhsPgkpOhpbzXI59/9KzFss3Hur49TkGs=; b=SirTUKf4fMSKKsXwJ1lcbj
 wBMPgGAFk/uPBoEI+J/bkQzOe6d4B6ariBJnbNzCEmS9PYueeo/cJBTvu73ZTSDo
 6/LzAKijFtgbA991F3ozLqm30vJ03u2w68/ICSlwD2bgaZkQ2hJgqMhb8Nzl6DLb
 f/ij5Wk9M5via9+xVYpKfvSPZPWrfnUepTYNuBM2APQglLm1dIMc8hh0FI5bjI2n
 19WsDSB396L/64U1Kgckq3jpec+HaGP7CXSKVn8gzJGL1iprqIy8m+LhKuZAKioN
 izNXnMxN1h9sdTgqOQO7rN5reS0kkSb6sHyFUXzZL1w7wtK9MV7UX744v3sIhmWQ
 ==
X-ME-Sender: <xms:v4FTYPPykdo6RaTSro42r0bB5g4K4y4flBIvhOJjkRo4bR-Jok6Wew>
 <xme:v4FTYIbg_38qwMpPP14jxW_iLyBM2c3rTP8afOTcNOuaVr9dQ6pv203kierx6LSHW
 44H-jk222JrDDiQckM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnheplefhueegvd
 ejgfejgfdukeefudetvddtuddtueeivedttdegteejkedvfeegfefhnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:v4FTYA6tAsNJ3fo2QM5CUxR8gKUON0MYvWObP5GCcUueRs2eITh1lQ>
 <xmx:v4FTYPBY-yZ_N1kcEUGUEqVqoSPe70Phz1TIpYWw-DoweBRHmLVslg>
 <xmx:v4FTYP5lnSZQLJlvBS8SOtrp2XRjyVxWl9Whol2LYhEnshw7BJaaSQ>
 <xmx:wIFTYOZAZD4-GwMBoNiu7UQpBvOKrhyHG7rd6Uf6AxfKY4Wg82lvqw>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0C49F1080057;
 Thu, 18 Mar 2021 12:37:17 -0400 (EDT)
Date: Fri, 19 Mar 2021 01:37:15 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [alsa-lib][PATCH 0/6] add API of equality and comparison for a
 pair of control element IDs
Message-ID: <20210318163715.GA273829@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.de,
 tanjeff@cccmz.de, alsa-devel@alsa-project.org
References: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
 <16eab1c6-03ef-fb06-9e5d-888de1cb63b4@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16eab1c6-03ef-fb06-9e5d-888de1cb63b4@perex.cz>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, tanjeff@cccmz.de
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

On Thu, Mar 18, 2021 at 12:42:30PM +0100, Jaroslav Kysela wrote:
> Dne 18. 03. 21 v 11:30 Takashi Sakamoto napsal(a):
> > Hi,
> > 
> > This patchset is a fix for bug issued in the message thread[1].
> > 
> > In this development period, alsa-lib got new API as implementation for
> > one of comparison algorithms to a pair of control element IDs. However,
> > it has several issues.
> > 
> > At first, the name, 'snd_ctl_elem_id_compare()', is inappropriate since it
> > implements one of comparison algorithms. The name itself implies the
> > algorithm is single and unique for control element ID. However, the
> > target structure, 'struct snd_ctl_elem_id', is hybrid and compound one.
> > We can not find such single and unique comparison algorithm for it.
> > 
> > Secondary, it subtracts a pair of values in fields of 'unsigned int' type
> > in storage size of the type. It brings integer overflow.
> 
> I don't think that this extra handling is really required. The unsigned /
> signed conversions are well known and the overflow results with a negative
> signed value. Why add more branches to the instruction chain?
 
For this kind of question, it's preferable to write actual test:

```
int main()
{
  snd_ctl_elem_id_t *l, *r;

  snd_ctl_elem_id_alloca(&l);
  snd_ctl_elem_id_alloca(&r);

  snd_ctl_elem_id_set_device(l, 0);
  snd_ctl_elem_id_set_device(r, UINT_MAX);

  assert(snd_ctl_elem_id_compare(l, r) < 0);

  return 0;
}
```

The assertion hits. For conversion detail:

```
$ cat test1.c
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main()
{
	unsigned int a, b;
	int diff;

	a = 0;
	b = 10;
	diff = a - b;
	printf("%08x\n", diff);

	a = 0;
	b = UINT_MAX;
	diff = a - b;
	printf("%08x\n", diff);

	return EXIT_SUCCESS;
}
```

The above test results in 0x00000001 for -UINT_MAX case under x386/x86_64,
like:

```
$ gcc -m32 -o ./test1 ./test1.c ; ./test1
fffffff6
00000001
$ gcc -m64 -o ./test1 ./test1.c ; ./test1
fffffff6
00000001
```

We can see integer overflow in both machine architectures due to
calculation under 32 bit storage.

Well, let us prepare 64 bit storage for both of minuend and subtrahend
to get negative value in 64 bit storage. In the case, narrower conversion
to 32 bit integer is unavoidable since it's assigned to integer value
returned from the function in your implementation. In the case, converted
value is _not_ negative according to assignment rule in C language
specification.

```
$ cat test2.c
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main()
{
	unsigned int a, b;
	long long diff;
	int ret;

	a = 0;
	b = UINT_MAX;

	// Calculate under 64 bit storage, then assign to 64 bit storage.
	diff = (long long)a - (long long)b;
	printf("%016llx\n", diff);

	// Narrower conversion occurs now.
	ret = (int)diff;
	printf("%08x\n", ret);

	return EXIT_SUCCESS;
}
$ gcc -m32 -o ./test2 ./test2.c ; ./test2
ffffffff00000001
00000001
$ gcc -m64 -o ./test2 ./test2.c ; ./test2
ffffffff00000001
00000001
```

We can see easy example in the clause of 'Assignment operators' in the
specification. This is the reason to use condition branches in the patchset.

> > Tertiary, it has simple bug to compare subdevice field in the same structure.
> 
> Good catch.
> 
> > Essentially, equality is different from comparison. In a point of programming,
> 
> Yes, but in this case, there's no benefit to have things separated. Add inline
> functions if you like to create application helpers which may be replaced by
> the functions in the future. If we really need a super CPU optimized equality
> check functions, we can add them later. The full compare functions must return
> zero, if the values are equal.
> 
> I prefer minimal API changes here.

Any comparison algorithm for the structure needs 64 bit storage and narrowing
conversion to 32 bit integer for return value in the case to use no condition
branches. Apparently, equality check and comparison has different overhead in
their implementations. We need two set of functions for them in both points of
semantics and optimization.

Our ancestor has already considered for the issue similar to the above,
then make theory to distinguish comparison from equality check. It's
better behaviour to respect the theory against own implementation.

> > implementation for comparison algorithm can have more overhead than
> > implementation for equality. In this meaning, it's better to add different API
> > for them.
> > 
> > This patchset adds new API below:
> > 
> >  * for equality
> >    * snd_ctl_elem_id_equal_by_numid()
> >    * snd_ctl_elem_id_equal_by_tuple()
> >  * for each comparison algorithm
> >    * snd_ctl_elem_id_compare_by_numid()
> >    * snd_ctl_elem_id_compare_by_tuple_arithmetic()
> >
> > I've got bothered to decide the name of API for the case to use tuples.
> > Here I use the word, 'tuple', which comes from documentation of alsa-lib[2].
> 
> The tuple naming is a bit new and I would prefer fields or so here. The ID is
> represented by the number or group of fields. Also arithmetic suffix makes the
> function name longer. The new function may use other name (if any will be
> implemented later).
> 
> Also, I don't like l and r argument naming. We should follow strcmp() and
> don't try to invent something new here.
> 
> Also my old function should be just renamed. No add + remove is necessary for
> the modifications of the touched code.
> 
> Resume:
> 
> 1) rename snd_ctl_elem_id_compare() to snd_ctl_elem_id_compare_fields()
> 2) add snd_ctl_elem_id_compare_by_numid()
> 
> .. optionally ...
> 
> 3) add snd_ctl_elem_id_equal_by_numid() - as inline using compare fcn
> 4) add snd_ctl_elem_id_equal_by_fields() - also inline

As I described, your old implementation is not acceptable just by renaming.
Although the idea of inline definitions is itself preferable. I suspect whether
inline definition for your comparison algorithm is really less overhead than
function call.

Anyway I'll post revised version of patchset later.


Thanks

Takashi Sakamoto
