Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D227E529
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 11:31:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAEAA1810;
	Wed, 30 Sep 2020 11:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAEAA1810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601458262;
	bh=E5jMR1uNTe1L1MFq42jTbhD0bCTDzkujetOYu/my4ds=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u0Sz8gWdSQekLogMlTvMXB9BP8DHpwus0oMpGnDMDMSKEOWWFjQUxZLnBpEwH/4pB
	 sBqe26Iqk8UVLsr2uCDgomcMrrPKrzkJ0kiJ6o11DKfsbh4aWw8D8D0GgCqunTpk72
	 wFKYVvHIeDry18HGkKLdd9q7q1b5hInGW13N5V7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A591F801F9;
	Wed, 30 Sep 2020 11:29:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44426F801ED; Wed, 30 Sep 2020 11:29:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A748F800DF
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 11:29:03 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 90D53A0040;
 Wed, 30 Sep 2020 11:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 90D53A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1601458142; bh=bR9dESD5mFz5xQYDbACDEOfVajcRcrhIeUc/sCWsofI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=387TcnaeTDrdYdqYn2nXodhlEedoxg3qLeKVpxHfoxFYnazFMyoa0hY6WEZFsS71t
 7dK7FzbR1STgPw7remI6ndoxii+GU5fyOVExUx885UW4wNd8/HoCUqto3x7rFqLJmr
 uwS3vGISb6I+Zp1xZ7jedrUk6VwWk2lBYk5fqN88=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 30 Sep 2020 11:28:59 +0200 (CEST)
Subject: Re: [PATCH] ALSA: hda - Don't register a cb func if it is registered
 already
To: Takashi Iwai <tiwai@suse.de>
References: <20200930055146.5665-1-hui.wang@canonical.com>
 <bd05e1be-96e8-14bf-011c-b43d165abf17@perex.cz>
 <s5h8scriprf.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8da67a4f-d9a4-14a0-a4b0-d93f7cb649ce@perex.cz>
Date: Wed, 30 Sep 2020 11:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <s5h8scriprf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org
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

Dne 30. 09. 20 v 11:21 Takashi Iwai napsal(a):
> On Wed, 30 Sep 2020 09:19:50 +0200,
> Jaroslav Kysela wrote:
>>
>> Dne 30. 09. 20 v 7:51 Hui Wang napsal(a):
>>> If the caller of enable_callback_mst() passes a cb func, the callee
>>> function will malloc memory and link this cb func to the list
>>> unconditionally. This will introduce problem if caller is in the
>>> hda_codec_ops.init() since the init() will be repeatedly called in the
>>> codec rt_resume().
>>>
>>> So far, the patch_hdmi.c and patch_ca0132.c call enable_callback_mst()
>>> in the hda_codec_ops.init().
>>
>> Won't be better to handle this double invocation at the callback call time? I
>> believe that some refcounting and pointing to one allocated callback structure
>> for all instances is better.
> 
> IMO, Hui's fix is correct in this case; otherwise it'll result in
> endless number of allocations at each time the runtime resume is
> performed.  So I'm going to take it as is.

I meant to allocate the structure only once with refcounting and multiple
invocation protection. In the proposed change, you lose the bindings. But as
you prefer.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
