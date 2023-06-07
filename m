Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B37725A20
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 11:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9935586E;
	Wed,  7 Jun 2023 11:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9935586E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686129749;
	bh=LMRaz3hCR5DNi4pyizWt3HYrTC6iOlLpegiUHzbOdXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GUiHWfixOoZXpPGbhXihv16L2LjzURO4uQIXsacOmtVMvtgCsuQPYod6yzkAuXyDq
	 yJ6BnpW9g2kPouPbywEwG6hX/lynpIHsrKm9CPcmqTvVqv0y6OkBo4kp6dcU6uFpqv
	 lVJ+YD2ERWChE7F0XYU6v1Zyj7+u9cObcj2+/0bY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E1AAF805EF; Wed,  7 Jun 2023 11:19:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D40BFF805EF;
	Wed,  7 Jun 2023 11:19:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A145AF80199; Wed,  7 Jun 2023 11:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C367F80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 11:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C367F80155
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Bxa+pKS4Bk5hYAAA--.352S3;
	Wed, 07 Jun 2023 17:18:03 +0800 (CST)
Received: from [192.168.100.8] (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxTMpIS4BkSjYEAA--.6544S3;
	Wed, 07 Jun 2023 17:18:01 +0800 (CST)
Message-ID: <ec543e3f-8e68-5c02-ad89-fa9a72883112@loongson.cn>
Date: Wed, 7 Jun 2023 17:18:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 0/4] Add Loongson HD Audio support
Content-Language: en-US
To: tiwai@suse.com
Cc: perex@perex.cz, chenhuacai@loongson.cn, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <cover.1686125797.git.siyanteng@loongson.cn>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <cover.1686125797.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTMpIS4BkSjYEAA--.6544S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw1rZrW7ZF43ZF43Cw45Arc_yoWkArgEy3
	ySqFWkCFyUG3Z7AayIyrs5JrZxXayUA348G3Z3tr48Xanayrsxtr4DCr13ur1xXFn5Gr15
	Xr1vgr4rAr12qosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2uc_DUUUU
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: USNXHQPX5E2LXZU2J4A5Y467ECJKSBK6
X-Message-ID-Hash: USNXHQPX5E2LXZU2J4A5Y467ECJKSBK6
X-Mailman-Approved-At: Wed, 07 Jun 2023 09:18:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USNXHQPX5E2LXZU2J4A5Y467ECJKSBK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


在 2023/6/7 16:51, Yanteng Si 写道:
> v3:
> * Adding some comments.
> * Seting polling_mode flag.

I'm sorry that I sent this patch series comments without indentation, 
I'll modify it and resend it.


Thanks,

Yanteng

>
> v2:
> * Handling with two new flags added to struct hdac_bus.
>
> v1:
> * The Loongson HDA controller is compatible with High Definition Audio
>    Specification Revision 1.0a.
>    See <https://loongson.github.io/LoongArch-Documentation/Loongson-
>    7A1000-usermanual-EN.html#hda-controller>
>
> Yanteng Si (4):
>    ALSA: hda: Add Loongson LS7A HD-Audio support
>    ALSA: hda: Using polling mode for loongson controller by default
>    ALSA: hda: Workaround for SDnCTL register on loongson
>    ALSA: hda/intel: Workaround for WALLCLK register for loongson
>      controller
>
>   include/linux/pci_ids.h     |  3 +++
>   include/sound/hdaudio.h     |  3 +++
>   sound/hda/hdac_controller.c |  5 ++++-
>   sound/hda/hdac_device.c     |  1 +
>   sound/hda/hdac_stream.c     |  6 +++++-
>   sound/pci/hda/hda_intel.c   | 20 ++++++++++++++++++++
>   sound/pci/hda/patch_hdmi.c  |  1 +
>   7 files changed, 37 insertions(+), 2 deletions(-)
>

