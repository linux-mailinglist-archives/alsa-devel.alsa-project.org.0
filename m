Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E8B338333
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 02:37:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F36B16EA;
	Fri, 12 Mar 2021 02:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F36B16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615513027;
	bh=zFhhzUlbXW0uxKLX5Qqsg3IWfN0HTIe/P0My2yDth3A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AzRW/zfINq14656vSjllkX8AXyMzKeEN9oeJmdP9kka+JHhRqWRSbTeeM4xPTB1Ea
	 OMhHrGiRnnaFKVosZE7L1PjpgmD7saulVncEsIO7AsilCEgyEVeFLZxnz+oDSmeDOZ
	 L6LM8AiomM6WYDIIVE5BKU7ERbY3kGev1/ST6l7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC12BF80256;
	Fri, 12 Mar 2021 02:35:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7A26F80227; Fri, 12 Mar 2021 02:35:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E8A9F800BF
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 02:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E8A9F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="DLevjcsQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="A8evHGT9"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 256A65C0108;
 Thu, 11 Mar 2021 20:35:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 20:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fmkW3jmmNeTA0aPRSLWc6S0vcYy
 +i8yDMntLXn5Y734=; b=DLevjcsQweklSBmE9GBjLkirHxf6zh6pzDITW9bCkdq
 3bYAjw3kOI9zuWuP6zNTsYhF7LHH11Uh1zRnigCzo7SBAhAj3xuVO0Q/91ld6VoD
 TB7a40cPUsp1lHsCR20d4bWQ6Oo3ACC9I2MwpxzNHgF1FQCoKG6zF+pXL6pfCV/g
 sargHkvV1hYCgA3zNIdLdX4ygXPLA13Icsc1ZwW39CDaSfmB4iggo0P6ryfrbsMS
 35FD63RleAWqwXDHU+D3azOcQY+WfugqLpnbPPQTSRTBgvIS0VyvDFffU8WBp9pd
 zdizIGClRS3sgSvFSJtk9e6i278yHiTWAwc1FxzACvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fmkW3j
 mmNeTA0aPRSLWc6S0vcYy+i8yDMntLXn5Y734=; b=A8evHGT9b/Ocw+HprTfIN1
 108FamZX57PglQWNCF+IOGWb1+Aeg/MbAcXtt4Jc94dSQ2wuWOgiShL0mFlYpC0n
 +LW+dTPWW1v0QtAMy5WWKx/OpDC/uCfD8h7tEEeSx8HgXBc6Pb5jRkCJxCzEfCVd
 eU1KTFaLMh+WGsRmQUqH3sJuDKZkD1bP4mkCthY71wqKnEBQC72bKFYGLXFgV5Nq
 t7FTnK2doNFf5nWVzV/uOVL0iW4H3QCV7FjGb3xTreBiNXvwP2lRECXRZxGVf2gf
 zvuuk5ErLKsqwU+/eqW1pRMWvYMq7QSeK3IbHhSDTBZGmMc2RzHBHbx2bvt8BZBg
 ==
X-ME-Sender: <xms:WMVKYN3dEOV2kqHAL4TvC4CdzFn7agNgjMKSCD-b6WoGmBhdy6V7cQ>
 <xme:WMVKYEEhNSWQSIOH3-h7TU8rVlHctrSaUdjo9Y8qSZFT0JQ-IdqjDGeTn6O7VUmV7
 AdjXQiMIBNbp-FDd7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvuddgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnheplefhueegvd
 ejgfejgfdukeefudetvddtuddtueeivedttdegteejkedvfeegfefhnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:WMVKYN7my5B4ZLwTTSnefKnl0LJOe1CWc-31SIjCZ_BzSW2irY3h6w>
 <xmx:WMVKYK0syHVgwzPP-ykAp3J0MlpmbbxtjHJ4NKd-6WuDri1N9fMUCQ>
 <xmx:WMVKYAE4HnDkqe1mxokxKM2UsV9tbKvfb261Q0yRr2kGAKY9dqmmEw>
 <xmx:WsVKYDzbqWhq1pySpJaNNiOwk_NdU4P4RP_ilAE0vMltaVdR3FJOnA>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44C781080064;
 Thu, 11 Mar 2021 20:35:20 -0500 (EST)
Date: Fri, 12 Mar 2021 10:35:17 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: alsa-lib's new API issue (snd_ctl_elem_id_compare)
Message-ID: <20210312013517.GA412450@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210308125817.GA212288@workstation>
 <5e26625d-3db1-0600-47f8-057c0101d6b1@perex.cz>
 <20210309003803.GA215306@workstation>
 <cfadffa0-b89f-13d2-5b52-67842cc4b372@perex.cz>
 <20210311124628.GA407735@workstation>
 <bb3e0483-e348-2b9a-14cc-ca01992c73dd@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb3e0483-e348-2b9a-14cc-ca01992c73dd@perex.cz>
Cc: alsa-devel@alsa-project.org
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

On Thu, Mar 11, 2021 at 02:22:45PM +0100, Jaroslav Kysela wrote:
> > Hm. I believe that you agree with the fact that we can make various
> > algorithms to compare a pair of IDs for control elements. When focusing
> > on fields except for numid, we can make the other algorithms against your
> > implementation, since the ID structure is compound one. Each of the
> > algorithms can return different result.
> > 
> > Here, I'd like to shift the discussion to the name of new API. Although it
> > has the most common name, 'snd_ctl_id_compare', it just has one of
> > comparison algorithms. I have a concern that the name can gives wrong idea
> > to users that the ID structure for control element had design to be able to
> > be compared by itself and it would just be a single comparison algorithm.
> > 
> > I suggest to rename the new API to express that it implements one of
> > comparison algorithm. In a case of numid comparison, it would be
> > 'snd_ctl_id_compare_by_numid()'. For your case,
> > 'snd_ctl_id_compare_by_name_arithmetic' or something suitable.
> 
> Perhaps, we can add a third argument defining the sorting algorithm, so we
> don't bloat the symbol tables so much when we add a new sorting type (enum).
> It would mean that the function cannot be used as a direct argument to
> qsort(), but I think that the apps add usually an extra code to own callback
> depending on containers, anyway. Is it more appropriate for you?

I've already investigated the idea you describe, however I concluded
that it has more complexity than convenience.

For example, the prototype would be:

```
int new_api(const snd_ctl_elem_id_t *l, const snd_ctl_elem_id_t *r,
            int (*algorithm)(const snd_ctl_elem_id_t *,
                             const snd_ctl_elem_id_t *));
```

For usage with qsort_r(3), programmer should do:

```
int my_algo(const snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
{
   ...
}

qsort_r(base, nmemb, size, new_api, my_algo);
```

On the other hand, the API has name to express itself appropriately and
we have some of such APIs:

```
int the_api_by_algo_a(const snd_ctl_elem_id_t *l,
                      const snd_ctl_elem_id_t *r);
int the_api_by_algo_b(const snd_ctl_elem_id_t *l,
                      const snd_ctl_elem_id_t *r);
int the_api_by_algo_c(const snd_ctl_elem_id_t *l,
                      const snd_ctl_elem_id_t *r);
...
```

The programmer selects one of them, then:

```
qsort(base, nmemb, size, the_api_by_algo_a);
```

Or select one of them dynamically if need:

```
int (*algo)(const snd_ctl_elem_id_t *, const snd_ctl_elem_id_t *);

switch (cond) {
case A:
    algo = the_api_by_algo_a;
    break;
case B:
    algo = the_api_by_algo_b;
    break;
case C:
    algo = the_api_by_algo_c;
    break;
default:
    return -EINVAL;
}

qsort(base, nmemb, size, algo);
```

For the case of hctl/mixer container about which you mentioned,
qsort_r(3) style is convenient for the case that programmer need to
re-implement own comparison algorithm. However the decision is still
up to the programmer, in short:

```
int my_algo(const snd_ctl_elem_id_t *l,
            const snd_ctl_elem_id_t *r,
            void *arg);
qsort_r(base, nmemb, size, my_algo, my_arg);
```

Here, I think it more worth to share algorithms than keeping less entries
in symbol table in shared library. Just the thought of it, I can devise
some algorithms below:

 * by numid
 * by name arithmetic (=your implementation)
 * by the words 'playback' and 'capture', case-insensitive or sensitive
 * by device and subdevice


Regards

Takashi Sakamoto
