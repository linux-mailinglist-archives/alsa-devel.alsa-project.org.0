Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776F2D318C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 18:57:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEAAB16DF;
	Tue,  8 Dec 2020 18:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEAAB16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607450250;
	bh=R3HW9P45mu7kNUUvSe+bueDnLe08t5ueL40F8ksFKCY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EEIs3ZoFTXNrCtEGW8ild2CazCuRNkbeYwoSYqx0TxE9CjMqP8pMoXOpiZGVI+pBK
	 ZnsEcotoVfxVE0OmYylRkWTuy0geDqlj70v92sJw2pku/eoqn1tf3AKOJY6NM5aTC0
	 sPFnWrAr9iFb3YhGBg8EP5NLRPwu9TVgVhd6OytQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E23C2F80218;
	Tue,  8 Dec 2020 18:55:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74226F8019D; Tue,  8 Dec 2020 18:55:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44F81F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 18:55:46 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 08ECBA003F;
 Tue,  8 Dec 2020 18:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 08ECBA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1607450146; bh=pxLIJSD2VV7eQf3XQiFScTKhxEmJG2e472cF6LiDKHA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=z7Ways7y8lGlQ1H+C3K6cCuMWr3sMB64TN9xWgaCTzxbMpS42W0FPmtY4XZURTjeQ
 vMGj1mOxTETCGXumvK0DDOuhFHi2EMp4uElR+7fnmZArtTFaKiwGtP9KMKaEYk00J6
 M2ySt0FFrLOuq1tr+aaT/FFzGU6aCH+22TUyPfjo=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Dec 2020 18:55:41 +0100 (CET)
Subject: Re: [PATCH] ASoC: AMD Renoir - add DMI table to avoid the ACP mic
 probe (broken BIOS)
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20201208153654.2733354-1-perex@perex.cz>
 <s5h4kkww9j3.wl-tiwai@suse.de> <20201208174002.GH6686@sirena.org.uk>
 <2e4587f8-f602-cf23-4845-fd27a32b1cfc@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <c75e79af-7aa0-5781-9dbd-bdfe2bd50381@perex.cz>
Date: Tue, 8 Dec 2020 18:55:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <2e4587f8-f602-cf23-4845-fd27a32b1cfc@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Dne 08. 12. 20 v 19:06 Mukunda,Vijendar napsal(a):
> 
> 
> On 08/12/20 11:10 pm, Mark Brown wrote:
>> On Tue, Dec 08, 2020 at 05:24:32PM +0100, Takashi Iwai wrote:
>>
>>> BTW, both Raven and Reonir drivers point to the very same PCI ID,
>>> and both drivers will be probed for this machine (and both to be
>>> skipped).
>>
>> Ugh, that's not good.  It's not even super obvious from the code that
>> this is happening.  Seems like it should be one core driver which
>> instantiates the components for Raven and Reonir as appropriate, the PCI
>> driver is pretty thin at present anyway.
>>
> 
> Raven and Renoir has same PCI ID but both platforms have different 
> revision ID. Raven platform revision id is 0x00 where as for Renoir it 
> is 0x01.

I don't see pci->revision early check in the probe callbacks.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
