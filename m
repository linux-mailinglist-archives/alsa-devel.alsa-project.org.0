Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD414DD71
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 16:00:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90A391677;
	Thu, 30 Jan 2020 15:59:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90A391677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580396436;
	bh=ZMN9kOTHBshmPh6sEnrRF2TGhLO5z6ABnbBH0gw8IuA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mDNKzGLsPZC5Q2z7GwPEW9rjGtFTTncYlqrrqwHe2HaBsGqGcbjnrks2m7c3Iz0JL
	 k5TqkCCEilpS1AkvuAZbXplfsfEhcXhQlF5Qt22wlvK9Fgsg1wQtTkAaONz0LxObA7
	 CjUZXvxDQjSwabUBCy6hDwdQvUPtYui/Jg0q+t3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD116F80123;
	Thu, 30 Jan 2020 15:58:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36043F800F1; Thu, 30 Jan 2020 15:58:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [IPv6:2a01:4f8:212:88::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FC3CF800F1
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 15:58:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FC3CF800F1
Received: from aquila.ladisch.de (x2f7f810.dyn.telefonica.de [2.247.248.16])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id 841975785909;
 Thu, 30 Jan 2020 15:58:47 +0100 (CET)
To: Ben Dooks <ben.dooks@codethink.co.uk>, Dmitry Osipenko
 <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
 <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
 <2ff97414-f0a5-7224-0e53-6cad2ed0ccd2@gmail.com>
 <35667c85-67b5-6f6f-ffe8-4fe3455ea4bb@codethink.co.uk>
 <96ed04cb-24ab-7e4d-bd44-6a4bb7c046ac@ladisch.de>
 <8161fc88-fa8c-ec92-cc14-1caa5c6f2fe7@codethink.co.uk>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <182fd434-f15a-f049-1ba1-83bd864b4590@ladisch.de>
Date: Thu, 30 Jan 2020 15:58:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <8161fc88-fa8c-ec92-cc14-1caa5c6f2fe7@codethink.co.uk>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.101.4 at webclient5
X-Virus-Status: Clean
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] (no subject)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ben Dooks wrote:
> On 30/01/2020 09:31, Clemens Ladisch wrote:
>> S24_LE:  24-bit samples in 32-bit words, aligned to the LSB
>> S32_LE:  24-bit samples in 32-bit words, aligned to the MSB
>>
>> It is very unlikely that your hardware implements S24_LE.
>
> Which is wrong, since this is exactly what the hardware implements.
>
> The DMA fetches 32 bit words, and then the front end dispatches only
> 24 bits of these to the I2S/TDM

Which 24 bits?  Is the padding in the first byte (S32_LE) or in the
last byte (S24_LE)?


Regards,
Clemens
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
