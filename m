Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747AD10439F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 19:48:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC2EF173A;
	Wed, 20 Nov 2019 19:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC2EF173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574275722;
	bh=PrJNN1MzKBubteq2gyWgrFGF5iK9CTy+nvNATYYfnNM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q36/l+OK+urdIem6NPD2iwE7K1zTBsMd57IZRKMkrh2kqyLPJRSOSFnUR2D4jQGzH
	 Q7YPiAcAQ6TAKF1og7H6r8qiOFFqyf9XrKmbUes3LEpOymS9fhlP82HqA+OM46exXe
	 fpbVMKkWWhJxOESovxd96D8jNpbPtW6yovDshL5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40DD3F8013F;
	Wed, 20 Nov 2019 19:46:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD632F8013D; Wed, 20 Nov 2019 19:46:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27FD3F800F0
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 19:46:52 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0355CA0040;
 Wed, 20 Nov 2019 19:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0355CA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574275612; bh=iOkWgKa6LtW7fqW5h7O9a21Xvqap/Ml5RPs8LvvR/Oo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LFl40MKq+YFj7z92f2W0H68hxnPnep9St0djy+KrZiXBGKk3Fvv/0gC2iRKNogVFZ
 QAheL2/QPhOSsqXj7kH+e4Zb3/0IcYYUE7jB89R2WOMhrwU5kjp0B7P2SfQ3Xb9vQC
 dN3utf4l3iKj7HEcf09h1mKpGhZobmysoOvMqXeA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 20 Nov 2019 19:46:47 +0100 (CET)
To: Mark Brown <broonie@kernel.org>
References: <ef29c9d6-b359-a9df-f8fa-d547b02bc8d2@perex.cz>
 <20191120181946.GC5705@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <4fde7eec-4a5a-c882-87d2-177cfc808126@perex.cz>
Date: Wed, 20 Nov 2019 19:46:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191120181946.GC5705@sirena.org.uk>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] ASoC, DMI and UCM
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 20. 11. 19 v 19:19 Mark Brown napsal(a):
> On Wed, Nov 20, 2019 at 11:04:38AM +0100, Jaroslav Kysela wrote:
> 
>> 	I would like to discuss the way we use DMI information for the board
>> identification in ASoC for the user space (long card name). It's a bit
>> redundant information, because DMI is already exposed through
>> /sys/class/dmi/id/ to the user space nowadays.
> 
>> 	My idea is to add 'DMI:sysfs' ctl info component string for the appropriate
>> ASoC driver to detect the existence of this dmi interface. Then I can add
>> the sysfs support to the ucm2 conditions.
> 
> I'm not clear what adding the component string does here - is the
> intention just to say that the card is built in to the machine and hence
> DMI can be used?  If that is the case something more generic that'd also
> work with other firmware interfaces might be good.

Yes, basically, it would mean that the sound card is integrated to the 
motherboard thus the DMI info can be used for the special configs. I already 
added sysfs support to alsa-lib ucm substitution.

Thinking more -  we don't need this probably urgently for ASoC drivers, 
because they all work with the integrated (built in) hardware, but it might 
make sense for other drivers. Probably another component identifier should be 
selected like 'integrated' or 'builtin' or so.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
