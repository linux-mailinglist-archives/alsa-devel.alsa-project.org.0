Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039763F678
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:45:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F3D1185E;
	Thu,  1 Dec 2022 18:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F3D1185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916706;
	bh=My2BzfRa3otj71H0tet6hCUkETBLWbQZeeLUjvPJ4Dk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KRyAJLxhdX7lt0FSNcqfNA8APS7KHhWEkxYYy+HK9B+QXkkK7svS4dGK+sHrx+H7d
	 tNFgqDNsWOrpJCpVSGdmc3cUwDWPVGn0cqmZWVZw4KWnpBEpMLeE1Z/PLFCLCKzXsW
	 aP5PjEewS/vRADayKYYKkFyLTw9hbeDQXKiWvLM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14746F80116;
	Thu,  1 Dec 2022 18:42:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE3A7F80162; Thu,  1 Dec 2022 18:42:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_FAIL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCCBBF80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:42:27 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3BA6FA0046;
 Thu,  1 Dec 2022 18:42:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3BA6FA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1669916547; bh=2ucO9Lt57QgFG0n6/VtpYwFCiWHoaAKYvu3pZkweeFQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CN4dxb0fH+MXJRow9EJBMzMtzaCAZWQNN4bHsdNNWbpILV3GOl/3ZUALpIRytXXLn
 m4RgdueywCN+TPY3PJqQSV2nVrMAE42NYc2/k8lus/pMyaKLH02tEQ8iORqjjCN53t
 Mmlk5Juz5C4QpEBZzsSAT4vHYRn7WzuY0QVEVgFM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  1 Dec 2022 18:42:22 +0100 (CET)
Message-ID: <a55212fc-a676-2335-b861-94ba8d10f207@perex.cz>
Date: Thu, 1 Dec 2022 18:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/6] kselftest/alsa: pcm-test improvements
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Shuah Khan <shuah@kernel.org>
References: <20221130000608.519574-1-broonie@kernel.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20221130000608.519574-1-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
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

On 30. 11. 22 1:06, Mark Brown wrote:
> This series provides a bunch of quick updates which should make the
> coverage from pcm-test a bit more useful, it adds some support for
> skipping tests when the hardware/driver is unable to support the
> requested configuration and then expands the set of cases we cover to
> include more sample rates and channel counts.  This should exercise
> switching between 8kHz and 44.1kHz based rates and ensure that clocking
> doesn't get confused by non-stereo channel counts, both of which are I
> expect common real world errors, at least for embedded cards.

The current code allows to override "test.time1 {} test.time2 {}" blocks in 
the configuration files which is equivalent to "test { time1 {} time2 {} }". 
This changeset will introduce configuration lookups like 
"pcm.0.0.PLAYBACK.44k1.2.big {}" which creates another configuration 
structure. The '.' (compound level delimiter) should not be used in the test name.

My original idea for the next improvement was to parse the 
"pcm.0.0.PLAYBACK.test" compound and gather the tests for the given pcm. If 
this compound is missing, we can continue with the hard-coded defaults.

About the skips - the test should probably keep to support also the exact 
parameters. For example - if the hardware must support 6 channels, it should 
not be a skip but an error. Everything may be broken, including the PCM 
configuration refining.

I just sent the patch with my changes for comments [1]. It's just the base 
code which may be extended with your requirements. The skips may be 
implemented using configuration field like 'skip_if_rate_error yes' or so.
Let me know, if I can stack your changes on top, or perhaps, you may be 
willing to adapt them.

					Jaroslav

[1] https://lore.kernel.org/alsa-devel/20221201173333.2494019-1-perex@perex.cz/

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
