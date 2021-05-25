Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C5738FAD1
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 08:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78FA5165D;
	Tue, 25 May 2021 08:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78FA5165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621923694;
	bh=2bGtXOpzSi0KZIl1NI+UE4b8ZJUAlyojhow4cr4ChxM=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XT3xIbdS499uElCI7emY8iFdcrwaUiKkdQrChKWI426mXaeFnPHaYYdkayiw6sjyS
	 woHMyd6HaOojsrcBIqELK2Z/1hW46a9dcRLSVr+lyM6+xOSW9RlMCG3EgmjiaBGYOt
	 FXJn0Yz1M6y4+21uicXKDgX+VCtgI5hUfPix1l4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1279BF8019D;
	Tue, 25 May 2021 08:20:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C691CF801EB; Tue, 25 May 2021 08:20:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C5D0F8011B
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 08:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C5D0F8011B
IronPort-SDR: tfZM2lp/gh4BWr46vPDNBglRyLXdZTDRX2azlENLmpPC5rxedtznoz/Y8rD+GgTUbSMHOck8of
 qYBjvif0wIAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="266010388"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="266010388"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 23:19:50 -0700
IronPort-SDR: 3/D2g46xbq8trLPwMiGEdMfs7O6SHk3Ioz7bz8yNhj3H+w72uBK+JtnxP5YL8Ur0Y4n6R7QOKI
 21X/byLapLdg==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="476259943"
Received: from pujfalus-mobl.ger.corp.intel.com (HELO [10.252.39.140])
 ([10.252.39.140])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 23:19:49 -0700
Subject: Re: [RFC] ALSA: hda: Add Lenovo ThinkStation P340 to
 power_save_denylist
From: "Ujfalusi, Peter" <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.de
References: <20210524112740.19330-1-peter.ujfalusi@linux.intel.com>
Message-ID: <d71b6669-93d5-292b-a5f6-205b2ac6337d@linux.intel.com>
Date: Tue, 25 May 2021 09:19:47 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210524112740.19330-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 5/24/2021 2:27 PM, Peter Ujfalusi wrote:
> On playback start there is a huge plock/pop noise via the green jack used
> in Line out mode.
> 
> The only way I was able to fix it to set the power_save to 0 for the
> snd_hda_intel.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
> Hi Takashi,
> 
> ever since I have this workstation the plock/pop noise on playback start bugged
> me. So far the only solution I have found is to disable the power_save which
> I find acceptable on a desktop compared to the pops.
> 
> The alsa-info.sh output is can be found here:
> http://alsa-project.org/db/?f=414b1b236fc73db386ad4f938bc3b304f6b30b05
> 
> The machine have ALC623 codec and the jacks are correctly discovered and they
> do what they supposed to be.
> When I have the headset connected to the front and audio is routed there the
> line out (green jack) from the back still prodices the plock/pop.
> 
> Is there a known quirk for similar issue or a better way to handle it?
> 
> Thanks you,
> Peter Ujfalusi
> 
>  sound/pci/hda/hda_intel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 79ade335c8a0..e16d93d8291f 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2213,6 +2213,8 @@ static const struct snd_pci_quirk power_save_denylist[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x36a7, "Lenovo C50 All in one", 0),
>  	/* https://bugs.launchpad.net/bugs/1821663 */
>  	SND_PCI_QUIRK(0x1631, 0xe017, "Packard Bell NEC IMEDIA 5204", 0),
> +	/* Loud pluck/pop noise via the green jack on playback start */
> +	SND_PCI_QUIRK(0x8086, 0x06c8, "Lenovo ThinkStation P340", 0),

The PCI ID might be wrong here:
# lspci -nnk | grep -A2 Audio
00:1f.3 Audio device [0403]: Intel Corporation Comet Lake PCH cAVS
[8086:06c8]
        DeviceName: Onboard - Sound
        Subsystem: Lenovo Device [17aa:1048]

0x17aa:0x1048 is the correct one.

alsa-info failed to pick up the CPU, it is i9-10900k

>  	{}
>  };
>  #endif /* CONFIG_PM */
> 

-- 
Péter
