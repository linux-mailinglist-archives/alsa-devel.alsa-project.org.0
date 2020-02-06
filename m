Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB356154423
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 13:37:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F0A169F;
	Thu,  6 Feb 2020 13:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F0A169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580992670;
	bh=AvxCFg6wrMOSLPvSEGRenEwb6WRGod2EJ2Psov+MtFI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZT4haq2cS8s4zogZ+VXU/5Y0RDycMhX+FU2GlJRBlXfPEZwDfj0CK9IUfIkVXua2p
	 KJ9geTwM3mvji1g1RsekR1Ba133h3+tn/dtrSG9vPPwkn66/1fJVZ/f9K4SdGjE91/
	 ncokxZ5KhwDlv4CyoqHyMhtw7+Cgln5oE8HNH3B4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26CDDF8015B;
	Thu,  6 Feb 2020 13:36:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42017F80162; Thu,  6 Feb 2020 13:36:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9EAC4F800AB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 13:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EAC4F800AB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A7B630E;
 Thu,  6 Feb 2020 04:36:01 -0800 (PST)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03BE73F68E;
 Thu,  6 Feb 2020 04:35:59 -0800 (PST)
To: Mark Brown <broonie@kernel.org>
References: <cover.1580950046.git.robin.murphy@arm.com>
 <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
 <20200206114606.GM3897@sirena.org.uk>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ad2c941a-9724-510e-959f-3cca3cab1dc2@arm.com>
Date: Thu, 6 Feb 2020 12:36:04 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206114606.GM3897@sirena.org.uk>
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, pgwipeout@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE
 control explicit
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

On 2020-02-06 11:46 am, Mark Brown wrote:
> On Thu, Feb 06, 2020 at 01:07:12AM +0000, Robin Murphy wrote:
>> The RK3328 reference design uses an external line driver IC as a buffer
>> on the analog codec output, enabled by the GPIO_MUTE pin, and such a
>> configuration is currently assumed in the codec driver's direct poking
>> of GRF_SOC_CON10 to control the GPIO_MUTE output value. However, some
> 
> This makes sense but it is an ABI break so is going to need
> quirking for existing boards that unfortunately rely on the
> existing behaviour.

Yeah, that's where it gets tricky - there doesn't seem to be a nice way 
to differentiate between "no GPIO because old DT" and "no GPIO because 
the enable is hard-wired/irrelevant and GPIO_MUTE doesn't do what you 
think it does", and it seems really improper to introduce a DT property 
for the sole purpose of telling a Linux driver not to assume something 
it shouldn't really have in the first place.

My opinion fell on the side of a minor ABI break being the lesser of two 
evils, given that the worst case once people start enabling this codec 
on Renegade/ROC-CC boards (which I was only anticipating, but have just 
discovered is happening already[1]) results in unexpectedly stuffing 
3.3V into the SD card and SoC I/O domain while both are in 1.8V mode, 
and that the change would only really affect one other current board 
(Rock64), where most mainline users are likely to be upgrading their DTB 
in lock-step with the kernel anyway.

I guess the existing (mis)behaviour could be predicated on an 
of_machine_is_compatible() check for Rock64 boards - it's ugly, but 
should do the job if you feel it's more important to be 100% strict 
about not regressing supported systems for any possible kernel/DTB 
combination.

Thanks,
Robin.

[1] 
https://github.com/armbian/build/commit/18b24717be9639b65b86db3dbcf2b42fe73ca12c
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
