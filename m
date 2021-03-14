Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A4C33A237
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 02:43:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30DAA173A;
	Sun, 14 Mar 2021 02:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30DAA173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615686230;
	bh=0jiVAgYFynpbXcTHGWIduI1QpxHJWrCbFFwu/HmS9EM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UGXJUgLtzjKEcoy347fuCXpyxZIaG7PEWYTB09wjVCUi4AKx2XgQU4SY2Pnl3KJ67
	 intbOgGYu0SYr0jydLHNmXhsqqFGtJUOVUSMl7C4VZ5quwwuwKzLbaKJT+6v8U3r/x
	 wPgohVe4U6AK210LDcEu6NuquT1zRIm+xrpZZxvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C3F8F80256;
	Sun, 14 Mar 2021 02:42:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 368A0F80227; Sun, 14 Mar 2021 02:42:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B5F6F8012A
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 02:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B5F6F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="a1UWXE6r"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pYV1kVR7"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DCEFEF94;
 Sat, 13 Mar 2021 20:41:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 13 Mar 2021 20:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=RHGHJxdi3PuHMJ16uvqg2W894Dl
 CWtbmOt8iG0GifrA=; b=a1UWXE6rMK0cJ9Qoiv1ZQh6kCfbDfcW347bMf0OcNYy
 GeJ3nwewe87s4nnYi8m66+NzS22rU9BQDE9KdvkU4eTMxvY28jH9ruXbvdqsZcGa
 i81reik1X9ixCHQ2yGdef0zSBiL0To1LguAcvSHYrpLyTjsujN0uEkqrx51sopcX
 4QnLB6QM8tv1o3tK/Sekeh3aqPf6NsqnN91fLdG7S89kXPeDBQyquVpJ9PzO82xb
 x0j8nYdhoSVm6+9OCYNzcGMOeD+a/PUVih9/TxK17WiTnBq6B8BZPYjhJFdwOm+4
 UGCJd7pREYNIjeya7ZkERlMHkTQAqe6Fj421IUMQiZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RHGHJx
 di3PuHMJ16uvqg2W894DlCWtbmOt8iG0GifrA=; b=pYV1kVR7WWjlSbEpCC7BxS
 lzhiaV3pQnbC9OH+xQVfcvQlL8oDculW4jcqhkXlFyQerZK0mpsKUt9NOY5UvirN
 tZ7K4+BQNcgmmTUWtAxBfG5EYdeZ7RBqI5DDVPDT3sCKPTF3y/Tg3KVjNJ6UwRww
 Jr41rFwUhrqR2+XHgU1rmn8Duwnoe5TEBtWSwAZZ9/cIrxgHTfze+hXD9J/QVBrg
 4CWGy7UlZhMMRZHz5e9Ga/LjnECwCAwZHUiW+KMF/tO/nAzioLFWB4YheuXBFHbK
 qFtaeK+J50F3YMI3ujiUEAscsL+Ep8u3EvOc8jOejuQZIEc3eA742kIx+Uk86srA
 ==
X-ME-Sender: <xms:5mlNYFnrkvHanv_LPTLrxTwofdbJUq8eljiK9nMSkEd7DEomyUNnIQ>
 <xme:5mlNYA1HAkfB-vgAT6w2qb8-3f0r6jXOhIhcFGHPTCLLRXL4Tw_IxsI8Dy0QuQpjr
 43wutrj2nYJEEKUGHY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvhedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepleefleeike
 eiieevtdfffeeiheefhfdufeeiieffhfetffefheefvdevuddugfdtnecuffhomhgrihhn
 pehgihhthhhusgdrtghomhenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:5mlNYLpGKgXGHPwnPDyDUqW5BY5M403RorUWTs5xZSeNHz7yE8CIFw>
 <xmx:5mlNYFml5vJCfygozdGxsIyhtOYBP5Uo9-N8_dswz4CNFDk1zkZdng>
 <xmx:5mlNYD0hEn0lpTc6faL9JCpGoguuWAhUg8KeJ7rS5bjQYKpEbQnHhg>
 <xmx:52lNYIhuEVnxo0AWP7knCWk7XVvSnLISy5hvYvSU6gOoSUcbD6GaOA>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0BAE11080057;
 Sat, 13 Mar 2021 20:41:57 -0500 (EST)
Date: Sun, 14 Mar 2021 10:41:55 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: alsa-lib's new API issue (snd_ctl_elem_id_compare)
Message-ID: <20210314014155.GA42985@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210308125817.GA212288@workstation>
 <5e26625d-3db1-0600-47f8-057c0101d6b1@perex.cz>
 <20210309003803.GA215306@workstation>
 <cfadffa0-b89f-13d2-5b52-67842cc4b372@perex.cz>
 <20210311124628.GA407735@workstation>
 <bb3e0483-e348-2b9a-14cc-ca01992c73dd@perex.cz>
 <20210312013517.GA412450@workstation>
 <c1714fde-4638-bd24-c8c4-9fc0c63ba1a5@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1714fde-4638-bd24-c8c4-9fc0c63ba1a5@perex.cz>
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

Hi,

On Fri, Mar 12, 2021 at 11:09:42AM +0100, Jaroslav Kysela wrote:
> Dne 12. 03. 21 v 2:35 Takashi Sakamoto napsal(a):
> > On Thu, Mar 11, 2021 at 02:22:45PM +0100, Jaroslav Kysela wrote:
> >>> Hm. I believe that you agree with the fact that we can make various
> >>> algorithms to compare a pair of IDs for control elements. When focusing
> >>> on fields except for numid, we can make the other algorithms against your
> >>> implementation, since the ID structure is compound one. Each of the
> >>> algorithms can return different result.
> >>>
> >>> Here, I'd like to shift the discussion to the name of new API. Although it
> >>> has the most common name, 'snd_ctl_id_compare', it just has one of
> >>> comparison algorithms. I have a concern that the name can gives wrong idea
> >>> to users that the ID structure for control element had design to be able to
> >>> be compared by itself and it would just be a single comparison algorithm.
> >>>
> >>> I suggest to rename the new API to express that it implements one of
> >>> comparison algorithm. In a case of numid comparison, it would be
> >>> 'snd_ctl_id_compare_by_numid()'. For your case,
> >>> 'snd_ctl_id_compare_by_name_arithmetic' or something suitable.
> >>
> >> Perhaps, we can add a third argument defining the sorting algorithm, so we
> >> don't bloat the symbol tables so much when we add a new sorting type (enum).
> >> It would mean that the function cannot be used as a direct argument to
> >> qsort(), but I think that the apps add usually an extra code to own callback
> >> depending on containers, anyway. Is it more appropriate for you?
> > 
> > I've already investigated the idea you describe, however I concluded
> > that it has more complexity than convenience.
> > 
> > For example, the prototype would be:
> > 
> > ```
> > int new_api(const snd_ctl_elem_id_t *l, const snd_ctl_elem_id_t *r,
> >             int (*algorithm)(const snd_ctl_elem_id_t *,
> >                              const snd_ctl_elem_id_t *));
> > ```
> > 
> > For usage with qsort_r(3), programmer should do:
> > 
> > ```
> > int my_algo(const snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
> > {
> >    ...
> > }
> > 
> > qsort_r(base, nmemb, size, new_api, my_algo);
> > ```
> 
> I meant:
> 
> ```
> int new_api(const snd_ctl_elem_id_t *id1, const const snd_ctl_elem_id_t *id2,
>             snd_ctl_compare_type_t ctype)
> {
>    ...
> }
> 
> int my_algo(void *a, void *b)
> {
> 	struct mystruct *my1 = a;
> 	struct mystruct *my2 = b;
> 	... possible extra code ...
> 	return new_api(&my1->id, &my2->id, SND_CTL_COMPARE_FULL_WO_NUMID);
> }
> 
> qsort(base, nmemb, size, my_algo);
> 
> int my_algo_r(void *a, void *b, void *opaque)
> {
> 	struct config *cfg = opaque;
> 	struct mystruct *my1 = a;
> 	struct mystruct *my2 = b;
> 	.. possibe extra code ..
> 	return new_api(&my1->id, &my2->id, cfg->sort_type);
> }
> 
> qsort_r(base, nmemb, size, my_algo_r, cfg);
> ```
> 
> So I don't see a real drawback in the real use. Of course, each API has some
> pros and cons,

Yep. In alsa-utils, you just use the new API to check equality of a pair
of IDs for control element. At present, there are no codes to call the
new API for sorting purpose.

> but I think that mine is easier for the common cases than the set of functions.

Although I agree that your implementation for the comparison algorithm is
useful, it's just one of some useful algorithms. It is difficult to
handle your algorithm as the most valuable, specific, unique one apart from
the other ones. The name, 'snd_ctl_elem_id_compare' is inappropriate for the
case, since it could exclude possibility to implement the other useful
algorithms.

Actually you need to describe the exclusiveness into the function comment,
"The numid comparison can be easily implemented using snd_ctl_elem_id_get_numid()
calls."[1]. And it interfaces to produce comparison algorithm by numid field as
optimized function (=done by single function call, without two function call
to get numid from opaque pointers).

> The two argument functions can be used directly only with qsort() anyway.

At present, it's a better compromise to implement the set of functions
exposed to applications for each algorithm, I think. When we got many
functions, then start to discuss about the unified-style function for
sorting.

As a first step, let me rename your implementation, then add another
implementation to compare numid field. What do you think about it?


[1] https://github.com/alsa-project/alsa-lib/commit/266618088aa6e17672ffb08a110b2fff2e2f7ad2

Regards

Takashi Sakamoto
