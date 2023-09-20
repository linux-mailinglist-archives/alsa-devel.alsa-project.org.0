Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7ED7A94B4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A45B8A4B;
	Thu, 21 Sep 2023 15:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A45B8A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302659;
	bh=Bjzs6vE96cK07D/9ToAmxDT8i6qNyV/w1UdIh3Vxogg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l60cFncHM1r6lOlV/EMQbgSA+6vm+mS1xg6emX2j6kpCaL1rmbauAwiiy0k5GPUo0
	 qAARPMM3BEkbT3kjU5uRLfMHicDUkXq794M4a8ofWXATdeDBmUs4fkO1MhwC3QVGku
	 dvOleq9T+OA93u20LmSE6qbgIiUFzLV+WglEMIyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A042F805BE; Thu, 21 Sep 2023 15:22:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8CDCF805BE;
	Thu, 21 Sep 2023 15:22:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC654F8025A; Wed, 20 Sep 2023 04:48:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-6.5 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 00265F800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 04:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00265F800AA
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8BxHOsWXQpl_SEqAA--.10712S3;
	Wed, 20 Sep 2023 10:46:46 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxP90HXQplwS4MAA--.26420S3;
	Wed, 20 Sep 2023 10:46:44 +0800 (CST)
Message-ID: <c505a778-bc37-93be-1ac1-c3d651ae1525@loongson.cn>
Date: Wed, 20 Sep 2023 10:46:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/5] Add the pci_get_base_class() helper and use it
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20230825062714.6325-1-sui.jingfeng@linux.dev>
 <BL1PR12MB514444DF0C2E304A46DE0F4BF7E3A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: 
 <BL1PR12MB514444DF0C2E304A46DE0F4BF7E3A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxP90HXQplwS4MAA--.26420S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr45ZFW8ZF4rJr43KF4rWFX_yoW8ur4kpF
	43AF4YkF1kJrsrGr97Wrn3uF18G3ykXryrJr1v934I93s0vrnIqan7Cw4Du39IvrWY9a1q
	qrWIyr12g34YqagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
	VUUUUUU==
X-MailFrom: suijingfeng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RLPCOIGF5AHBMQPIVRH2LQCJRY3KD3FG
X-Message-ID-Hash: RLPCOIGF5AHBMQPIVRH2LQCJRY3KD3FG
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:22:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RLPCOIGF5AHBMQPIVRH2LQCJRY3KD3FG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,


On 2023/8/25 21:18, Deucher, Alexander wrote:
> [Public]
>
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Sui
>> Jingfeng
>> Sent: Friday, August 25, 2023 2:27 AM
>> To: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: alsa-devel@alsa-project.org; Sui Jingfeng <suijingfeng@loongson.cn>;
>> nouveau@lists.freedesktop.org; linux-kernel@vger.kernel.org; dri-
>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; linux-
>> pci@vger.kernel.org
>> Subject: [PATCH 0/5] Add the pci_get_base_class() helper and use it
>>
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> There is no function that can be used to get all PCI(e) devices in a system by
>> matching against its the PCI base class code only, while keep the sub-class code
>> and the programming interface ignored. Therefore, add the
>> pci_get_base_class() function to suit the need.
>>
>> For example, if an application want to process all PCI(e) display devices in a
>> system, it can achieve such goal by writing the code as following:
>>
>>      pdev = NULL;
>>      do {
>>          pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev);
>>          if (!pdev)
>>              break;
>>
>>          do_something_for_pci_display_device(pdev);
>>      } while (1);
>>
>> Sui Jingfeng (5):
>>    PCI: Add the pci_get_base_class() helper
>>    ALSA: hda/intel: Use pci_get_base_class() to reduce duplicated code
>>    drm/nouveau: Use pci_get_base_class() to reduce duplicated code
>>    drm/amdgpu: Use pci_get_base_class() to reduce duplicated code
>>    drm/radeon: Use pci_get_base_class() to reduce duplicated code
>>
> Series is:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks a lot.


What to do next then?

By the way, Bjorn, what's your opinion?
I'm ask because I don't know what to do next with this series.

As they belong to different system of Linux kernel,
the rest of patch (0002 ~ 0005) depend on the first one.

I think, merge the 0001-patch firstly, then wait it arrive at drm-misc, alsa branch.
Or, to do something else?

