Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F2850F247
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 09:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE601745;
	Tue, 26 Apr 2022 09:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE601745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650957890;
	bh=5fk3UncjZsfQcWkg2Emc3bmiRBiLOjeduQYcMDvURZc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uG/6e6LRu1U8UtfNFkSek9eyxHlRZqzhjZByXS9BkJI+2IssUauypbcrhFz4+zWFA
	 GZ/Wj3leY9Q7elQY2Enm1rhTrKOpXWgxNTmj8Jk/6ekGw6yDkRrkytq8UNnGPJIpI+
	 bnFjluSyZQUcJCbp2/dnHZpXLRmQl/2St3LyJzuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D0EEF80105;
	Tue, 26 Apr 2022 09:23:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE2ECF80105; Tue, 26 Apr 2022 09:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8042CF80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 09:23:42 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B92A0A003F;
 Tue, 26 Apr 2022 09:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B92A0A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1650957821; bh=IdiFJmcRs9yTWV5wZIeGmImwQx8sDp7AgupKVj1KhvA=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=1+mjTKjz3nnKDI3chgtEJtLtoGto3Eh4z4f27kB7o6/kuZrL2l7tNo/b/sM7xvYGi
 mh6lM3DHosaORYUxP3/eRrpqs1b2cbCz/tA7CryR+pPFhsRuZwZ7pMay1IUZM8B0fS
 vPn2CFdNl2mJ7IAkz3kp6aTr+ukvvF/Z2pfd2irI=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 26 Apr 2022 09:23:38 +0200 (CEST)
Message-ID: <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
Date: Tue, 26 Apr 2022 09:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Request for setup of new repositories
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <YmagC3V3t0k84k9A@workstation>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <YmagC3V3t0k84k9A@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

On 25. 04. 22 15:20, Takashi Sakamoto wrote:
> Hi Jaroslav, Iwai-san,
> 
> Thanks for your maintenance for alsa-project organization in github.com.
> Currently I'd like to add new three repositories under the organization
> as a part of my work for ALSA firewire stack.
> 
> I've been maintaining libhinawa since 2014 and recently realized that
> current design is not necessarily convenient since it includes two
> functions; operation to Linux FireWire cdev, and operation of ALSA HwDep
> cdev. Currently I'm working for new library to split the latter operation.
> Then I'd like you to setup below repositories:
> 
>   * 'libhitaki'
>   * 'libhitaki-doc'
>   * 'hitaki-rs'
> 
> The library itself and its Rust binding are utilized by
> 'snd-firewire-ctl-services'[2], thus it's preferable to register them under
> 'GObject Introspection' Team.
> 
> Thanks for your assist for my work.

Hi Takashi,

All is set on github. Let me know, if you need other changes.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
