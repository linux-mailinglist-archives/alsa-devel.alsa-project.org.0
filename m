Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B1A20E0D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 19:37:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C1A416C2;
	Thu, 16 May 2019 19:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C1A416C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558028244;
	bh=doJeM+9YA6KZWzaokqvXB1IeCEORUBEGbfV+TdNKSTU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H4Uh4XHnvHoa0z681ODxN6MCN2kYtR6Wdi8udXC4Jxv3g/cUMthn71Bt32y6G54SF
	 ilJgmhARr1ogHlU227rzjI2xVOD95rnS7HfvgmsaiKb2EpHSbb7PAcdoh0XJ7pJlTx
	 GyeBya66Lf65dq3de/RC/GMQI3t0ZZHC2OMzmhkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 659B0F8078F;
	Thu, 16 May 2019 19:35:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E467F896B6; Thu, 16 May 2019 19:35:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCA75F806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 19:35:33 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0A288A003F;
 Thu, 16 May 2019 19:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0A288A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1558028133; bh=thDo5uZixT0Sl8Kf5+Nharn0ink1l48njDqNFUhMjhE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Jvmcz+M8cYoo3frfsup3E9V0Gr38dYt5LfhSJyOf+IF2OMS/lwFp+B1phUPXWb1Dc
 DkJ8mOXYNclrQ7CUVHF46joomiqkyeXuNPRuzPPlccsDoNltfB8V1kfpcAOAfeEXnH
 jpLZtMr+yxHtpmyzT8hhXgs43vjuc2RdmMnbM+iU=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 16 May 2019 19:35:28 +0200 (CEST)
To: "Channaiah Vanitha (RBEI/ECF3)" <Vanitha.Channaiah@in.bosch.com>,
 Takashi Iwai <tiwai@suse.de>
References: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
 <1557901597-19215-7-git-send-email-vanitha.channaiah@in.bosch.com>
 <s5hk1erhgx2.wl-tiwai@suse.de>
 <293476c61233469cbffdd5a7688a8879@in.bosch.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e959837a-bdf3-75cd-11bc-41cda842fb50@perex.cz>
Date: Thu, 16 May 2019 19:35:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <293476c61233469cbffdd5a7688a8879@in.bosch.com>
Content-Language: en-US
Cc: "Wischer Timo \(ADITG/ESS\)" <twischer@de.adit-jv.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 6/6] pcm: Update pcm->avail_min with
 needed_slave_avail_min, after reading unaligned frames
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

Dne 16. 05. 19 v 19:26 Channaiah Vanitha (RBEI/ECF3) napsal(a):
> Hello  Takashi-san,
> 
>>  Can we avoid adding such a hack in the core code?
>>  Basically the issue is very specific to direct-plugins, so this sort of workaround should be implemented locally there instead.  I guess we can do similar tricks by overriding the calls in the callbacks.
> 
> Issue can be seen without direct plugins too with involvement of only hw which reports unaligned hw ptr. As I have explained in below  detailed description:
> "Also, this issue can be seen without dsnoop plugin, when HW reports unaligned hw_ptr For e.g. "

Which hardware exactly? The hw_ptr should be reset when the streaming starts.
It appears that the problem is specific to the direct plugins only when the
period wakeups are a bit different than for the direct hardware access.

						Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
