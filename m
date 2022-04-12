Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA7B4FDD9A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 13:23:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D340817E2;
	Tue, 12 Apr 2022 13:22:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D340817E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649762595;
	bh=r7fBuTvFYRdPFrmzD+7U7RqUHTF1PPbEMSRC3WYKj3s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SHC1uhnJeV3ED8GcYyDJ3NSAkGhf2XDAmM8IVuH+asE93oke8VXgf2EtKcddVobEN
	 jifY9c2Pp25Q+WTi+EVxD6xG+oRssgRqqzcsNt/GhRvfr0G0Tk6lPwb65RgJeZwgdz
	 lMj8GGtCATKmxIEy6M7gups1jZdkR97RtXz6Cxkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D564F80245;
	Tue, 12 Apr 2022 13:22:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96787F80154; Tue, 12 Apr 2022 13:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 406A8F80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 13:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 406A8F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pX+4232Q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Y9uncMXn"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5710C5C0269;
 Tue, 12 Apr 2022 07:22:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 12 Apr 2022 07:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1649762527; x=1649848927; bh=KP
 ZFl+zUr69t/646Egboka8UL5M06q8AkE3vXXNQoBs=; b=pX+4232Q9TXW4yP/a1
 R1BxNARz4dR7D5YCwTYdaxr8INFIhb6PIbl04Xt5SNCHXNRHrZRnpT2dvlHbGwOU
 I6AILER+nvsN0bABWf9bKj6a4yiOvXJC9a14I1RxUmCStSqRgpOTbcLdTeygZdly
 m2pWlOMsLVsXx2AWtJKdnVkL3nZQo1yRuTLpKeKmrrFY+DZiSq0/QC6aHJ+R7aM3
 8EwXfSAckZ7NQZrtA0cwzB912d+SriEG+XbkA4TBmmOBxVuWIr9tdnEnYoAgGk0m
 xcNAru2x8O+lppc6f8XeJDA1R0PoFMJswevoGuDDPqAVC+828OlJGsrIR9w7DwB9
 2/2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1649762527; x=
 1649848927; bh=KPZFl+zUr69t/646Egboka8UL5M06q8AkE3vXXNQoBs=; b=Y
 9uncMXn45ChqGDxw2b0yQ2I94QzNXR7JpqEVynwVDzS2+cpO+udMiLWZ/xckC/iq
 CMXKS33zrHvkxDQuDEgphtKEI+h8rEFw+v4UTZbtic2/mmDRm+Wf9qYkbblVtP85
 3f7uJU1cTxpM5pmTKRw72vkKFLywOGaLMhDThlUswG9nj9iCzoKJSt9muDpGALnj
 MAZbH1oKBjF7p2gJJYXFGJ6GmtM1iIjppOGXxFWdO6CPMwAREY4/OJY9bOq3sxyd
 yKbh4q88tMV/QVqC3Z8/4pjZyrd/JrQgWTDGmuhQVMSC068YvuxONAJsW8f13B72
 5wMgyJQX8fdBPmArOua6A==
X-ME-Sender: <xms:32BVYlCrjQaPzYvPv4vqKOcGH9ZCUAXn2ZN1i1bTuPVPyWj0TPhQQw>
 <xme:32BVYjjt8aeiWoaD4luldVl5THVoqekv3B1Z__LNnnhVN0pUOFP2hCXLjJzA4q5Hk
 ovptberySGlFxm_wOY>
X-ME-Received: <xmr:32BVYgmpIhT0s0u6Lhz4qfmwtPwfF05PNdc0zbxz5U2-f_rgpR-a0G3V2nHix00KU6MplkTWqSNZthBLXnjyOHpaSzLV8wQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekkedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:32BVYvx6z53PZlSYybX2_mafXMos7XQZvTr45aetqSXm2kUwUny-rQ>
 <xmx:32BVYqSJab63oi5Z4eGeu2vcxLWABnZLnOhe2YJwGpT_6fSRt2pWTQ>
 <xmx:32BVYiaPr4CXRM0Tvvlu0qw4e3ytFHvpvmbFoL9q40H4uRLISXcUxg>
 <xmx:32BVYlenlpUsI2pcOriw7JETAvYNGXr5178WFBhJLV19DeeFR2IqiA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 07:22:05 -0400 (EDT)
Date: Tue, 12 Apr 2022 20:22:04 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] firewire: add kernel API to access CYCLE_TIME
 register
Message-ID: <YlVg3I8kLIcBLZAE@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
References: <20220411070124.GA12881@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411070124.GA12881@kili>
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
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

On Mon, Apr 11, 2022 at 10:01:25AM +0300, Dan Carpenter wrote:
> Hello Takashi Sakamoto,
> 
> The patch baa914cd81f5: "firewire: add kernel API to access
> CYCLE_TIME register" from Apr 5, 2022, leads to the following Smatch
> static checker warning:
> 
> 	drivers/firewire/core-cdev.c:1235 ioctl_get_cycle_timer2()
> 	error: uninitialized symbol 'cycle_time'.
> 
> drivers/firewire/core-cdev.c
>     1209 static int ioctl_get_cycle_timer2(struct client *client, union ioctl_arg *arg)
>     1210 {
>     1211         struct fw_cdev_get_cycle_timer2 *a = &arg->get_cycle_timer2;
>     1212         struct fw_card *card = client->device->card;
>     1213         struct timespec64 ts = {0, 0};
>     1214         u32 cycle_time;
>     1215         int ret = 0;
>     1216 
>     1217         local_irq_disable();
>     1218 
>     1219         ret = fw_card_read_cycle_time(card, &cycle_time);
>     1220         if (ret < 0)
>     1221                 goto end;
>                          ^^^^^^^^
> "cycle_time" not initialized on error path.
> 
>     1222 
>     1223         switch (a->clk_id) {
>     1224         case CLOCK_REALTIME:      ktime_get_real_ts64(&ts);        break;
>     1225         case CLOCK_MONOTONIC:     ktime_get_ts64(&ts);                break;
>     1226         case CLOCK_MONOTONIC_RAW: ktime_get_raw_ts64(&ts);        break;
>     1227         default:
>     1228                 ret = -EINVAL;
>     1229         }
>     1230 end:
>     1231         local_irq_enable();
>     1232 
>     1233         a->tv_sec      = ts.tv_sec;
>     1234         a->tv_nsec     = ts.tv_nsec;
> --> 1235         a->cycle_timer = cycle_time;
>     1236 
>     1237         return ret;
>     1238 }

Thanks for the report. Indeed, it leaks the unidentified value on kernel
stack to userspace. I'll post fix later.


Regards

Takashi Sakamoto
