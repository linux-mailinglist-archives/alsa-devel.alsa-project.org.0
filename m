Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A61F03404E3
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 12:44:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AADA16AB;
	Thu, 18 Mar 2021 12:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AADA16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616067857;
	bh=M42q2v1HnmCB3/V6simOuqyPftE2YtKuuyDlVbPJ86c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TXr5tSL1lEmP8XyqEb+d6FmtwyPndO/8pOh+jqIsTEMGc8Ae8RnZS3Pys0AwfYgO6
	 zHeIeUeMxgWLCRn9Np5+wFjzwsS1qdy+uXAVs/x6RpAz5izc8uHonvcOy5eDROC8RO
	 0V+ghBJxoAbbQDR5G4wcDYW9BwQNHtBg6XXTS5y4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C968F80171;
	Thu, 18 Mar 2021 12:42:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A01EF80165; Thu, 18 Mar 2021 12:42:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10669F80124
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 12:42:36 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 65A46A0046;
 Thu, 18 Mar 2021 12:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 65A46A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616067755; bh=Sj8WgCVIlYTIU33D92Fvx/vkyMZw4quiYl2MICq267s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Tp7eWzR4yyqO59QgEu9o9K9U5xrCxyYGKsRq4yGKO0ugVXpK/5LI2yDStLftOOsqf
 9EbYAqs0XmxyyReRcH7hcoWNtyakMQ/KVrnuQ4N2sXL1XF8XloSgZSrf1wfIS+pJuO
 nH+UImYQZ3E8jq5GJtzPNJSx0GTBn4/xBpDQXTcU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 18 Mar 2021 12:42:31 +0100 (CET)
Subject: Re: [alsa-lib][PATCH 0/6] add API of equality and comparison for a
 pair of control element IDs
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, tiwai@suse.de
References: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <16eab1c6-03ef-fb06-9e5d-888de1cb63b4@perex.cz>
Date: Thu, 18 Mar 2021 12:42:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tanjeff@cccmz.de
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

Dne 18. 03. 21 v 11:30 Takashi Sakamoto napsal(a):
> Hi,
> 
> This patchset is a fix for bug issued in the message thread[1].
> 
> In this development period, alsa-lib got new API as implementation for
> one of comparison algorithms to a pair of control element IDs. However,
> it has several issues.
> 
> At first, the name, 'snd_ctl_elem_id_compare()', is inappropriate since it
> implements one of comparison algorithms. The name itself implies the
> algorithm is single and unique for control element ID. However, the
> target structure, 'struct snd_ctl_elem_id', is hybrid and compound one.
> We can not find such single and unique comparison algorithm for it.
> 
> Secondary, it subtracts a pair of values in fields of 'unsigned int' type
> in storage size of the type. It brings integer overflow.

I don't think that this extra handling is really required. The unsigned /
signed conversions are well known and the overflow results with a negative
signed value. Why add more branches to the instruction chain?

> Tertiary, it has simple bug to compare subdevice field in the same structure.

Good catch.

> Essentially, equality is different from comparison. In a point of programming,

Yes, but in this case, there's no benefit to have things separated. Add inline
functions if you like to create application helpers which may be replaced by
the functions in the future. If we really need a super CPU optimized equality
check functions, we can add them later. The full compare functions must return
zero, if the values are equal.

I prefer minimal API changes here.

> implementation for comparison algorithm can have more overhead than
> implementation for equality. In this meaning, it's better to add different API
> for them.
> 
> This patchset adds new API below:
> 
>  * for equality
>    * snd_ctl_elem_id_equal_by_numid()
>    * snd_ctl_elem_id_equal_by_tuple()
>  * for each comparison algorithm
>    * snd_ctl_elem_id_compare_by_numid()
>    * snd_ctl_elem_id_compare_by_tuple_arithmetic()
>
> I've got bothered to decide the name of API for the case to use tuples.
> Here I use the word, 'tuple', which comes from documentation of alsa-lib[2].

The tuple naming is a bit new and I would prefer fields or so here. The ID is
represented by the number or group of fields. Also arithmetic suffix makes the
function name longer. The new function may use other name (if any will be
implemented later).

Also, I don't like l and r argument naming. We should follow strcmp() and
don't try to invent something new here.

Also my old function should be just renamed. No add + remove is necessary for
the modifications of the touched code.

Resume:

1) rename snd_ctl_elem_id_compare() to snd_ctl_elem_id_compare_fields()
2) add snd_ctl_elem_id_compare_by_numid()

.. optionally ...

3) add snd_ctl_elem_id_equal_by_numid() - as inline using compare fcn
4) add snd_ctl_elem_id_equal_by_fields() - also inline

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
