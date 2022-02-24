Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 927AE4C45F6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:21:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BF671DE3;
	Fri, 25 Feb 2022 14:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BF671DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795293;
	bh=7y0qBUn+4Mr6bFU20/TGub2HSOx+UgE/hIlmL27DAVc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sjsp238ZLC2t3xwpmaZdK+WuST6FwY+XunLFXvaNGjC9mgZCtPSE/3lqFtnRCcMmY
	 9Kgi0t87/XmHeCOcD5hbzZvCpUcnKoKY1NGblDcpU56l8/RxmV3Ym/MMeP8/oyvxkN
	 xbzyZ4GBYPHgARManbkmiTr89yQuzKQPNl+7Wa2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28A37F805F9;
	Fri, 25 Feb 2022 14:11:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81144F80118; Thu, 24 Feb 2022 18:56:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 323A2F80118;
 Thu, 24 Feb 2022 18:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 323A2F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gnuweeb.org header.i=@gnuweeb.org
 header.b="D7aZtVyL"
Received: from [192.168.88.87] (unknown [36.78.50.60])
 by gnuweeb.org (Postfix) with ESMTPSA id 5107C7E2A3;
 Thu, 24 Feb 2022 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
 s=default; t=1645725371;
 bh=7y0qBUn+4Mr6bFU20/TGub2HSOx+UgE/hIlmL27DAVc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D7aZtVyLlCng7VVCYtJk2rzO6vsimwfxamI03avJnlQmAyFkNPTTJvxRG/Jg4tl2j
 5kpRJDZD/gyCBx4UAGS2cJcv8MDcy4kUXgdLKzLClwG429hsY2UFpZdVVzeUPepMQK
 INoaznkuuMgo01rQR2SB2xknWIZXiTNtbEDJXCq1KhUMNil0//085azpQLy/txcx6U
 L/91ntrOD5KGFdQYd6JErvSfH71zayGAoklWMSA7Qnv/VSqfKxK5n7+uF3sc1NEiG3
 +PBfs1ansVMY3NUFhUiz2zYBPhLkV7FF/oOL8Wlkqgj4uGSOntQvG73n2+YnhRhNcJ
 Hak+Nrgofj+EQ==
Message-ID: <5188759c-fd7a-4dbb-0f56-db74200603a8@gnuweeb.org>
Date: Fri, 25 Feb 2022 00:56:02 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220224145124.15985-1-ammarfaizi2@gnuweeb.org>
 <Yhe/3rELNfFOdU4L@sirena.org.uk>
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
In-Reply-To: <Yhe/3rELNfFOdU4L@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:19 +0100
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

On 2/25/22 12:26 AM, Mark Brown wrote:
> On Thu, Feb 24, 2022 at 09:51:24PM +0700, Ammar Faizi wrote:
>> From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
>>
>> Do not call snd_dma_free_pages() when snd_dma_alloc_pages() returns
>> -ENOMEM because it leads to a NULL pointer dereference bug.
>>
>> The dmesg says:
>>
>>    <6>[109482.497835][T138537] usb 1-2: Manufacturer: SIGMACHIP
>>    <6>[109482.502506][T138537] input: SIGMACHIP USB Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:1C4F:0002.000D/input/input34
>>    <6>[109482.558976][T138537] hid-generic 0003:1C4F:0002.000D: input,hidraw1: USB HID v1.10 Keyboard [SIGMACHIP USB Keyboard] on usb-0000:00:14.0-2/input0
>>    <6>[109482.561653][T138537] input: SIGMACHIP USB Keyboard Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:1C4F:0002.000E/input/input35
> 
> Please think hard before including complete backtraces in upstream
> reports, they are very large and contain almost no useful information
> relative to their size so often obscure the relevant content in your
> message. If part of the backtrace is usefully illustrative (it often is
> for search engines if nothing else) then it's usually better to pull out
> the relevant sections.

I will strip the irrelevant information in the v2.

-- 
Ammar Faizi
