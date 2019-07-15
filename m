Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 437356821D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 03:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD4211668;
	Mon, 15 Jul 2019 03:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD4211668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563155491;
	bh=XlwOx/cYqHc6gxFGToWRizMIpfJfkU1EQd7c/yYM87M=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E8vbZvixBRke7ZXazHXJ/vibKKYd2XT2kvAX52z9rg0daPQsLK5D3ddUgPOC2RZfD
	 TJ/zvf1kIDnQpuXHqBxhhYmhDTvP4NBKgHSpwn0I5W+lfJgj4tDznnn28avUgpGCeO
	 UNCMqxKCTTYAutEDCqtdLaOY61Bdtq1j86WfIyqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9AD8F80368;
	Mon, 15 Jul 2019 03:49:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA097F80367; Mon, 15 Jul 2019 03:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ED09F800C6
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 03:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ED09F800C6
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 38B3098B5C5526AAB0F1;
 Mon, 15 Jul 2019 09:49:34 +0800 (CST)
Received: from kjyxapp05.zte.com.cn ([10.30.12.204])
 by mse-fl2.zte.com.cn with SMTP id x6F1nEK2021347;
 Mon, 15 Jul 2019 09:49:14 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
 Mon, 15 Jul 2019 09:49:13 +0800 (CST)
Date: Mon, 15 Jul 2019 09:49:13 +0800 (CST)
X-Zmail-TransId: 2b055d2bdb991216d4ce
X-Mailer: Zmail v1.0
Message-ID: <201907150949139435825@zte.com.cn>
In-Reply-To: <4545ce50-493c-8faa-fdcd-5aee3ca30792@web.de>
References: 1562989575-33785-3-git-send-email-wen.yang99@zte.com.cn,
 4545ce50-493c-8faa-fdcd-5aee3ca30792@web.de
Mime-Version: 1.0
From: <wen.yang99@zte.com.cn>
To: <Markus.Elfring@web.de>
X-MAIL: mse-fl2.zte.com.cn x6F1nEK2021347
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: wang.yi59@zte.com.cn, alsa-devel@alsa-project.org, xue.zhihong@zte.com.cn,
 lgirdwood@gmail.com, sbkim73@samsung.com, tiwai@suse.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, krzk@kernel.org,
 broonie@kernel.org, s.nawrocki@samsung.com, cheng.shengyu@zte.com.cn
Subject: Re: [alsa-devel]
	=?utf-8?q?=5B2/2=5D_ASoC=3A_samsung=3A_odroid=3A_fix?=
	=?utf-8?q?_a_double-free_issue_for_cpu=5Fdai?=
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

> > The cpu_dai variable is still being used after the of_node_put() call,
> 
> Such an implementation detail is questionable.
> https://wiki.sei.cmu.edu/confluence/display/c/MEM30-C.+Do+not+access+freed+memory
> 
> 
> > which may result in double-free:
> 
> This consequence is also undesirable.
> https://cwe.mitre.org/data/definitions/415.html
> 
> 
> Now I wonder if two update steps are really appropriate as a fix
> instead of using a single update step for the desired correction
> in this software module.
> Should a commit (including previous ones) usually be correct by itself?

Thanks.
These two updates fix two different bugs.

One of them is the use-after-free issue introduced by bc3cf17b575a:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bc3cf17b575a7a97b4af7ddcf86133175da7a582

-       ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
+       cpu_dai = of_parse_phandle(cpu, "sound-dai", 0);
+       of_node_put(cpu);
+       of_node_put(codec);
+
+       ret = snd_soc_of_get_dai_link_codecs(dev, codec, codec_link);
        if (ret < 0)
                goto err_put_codec_n;

and the other is the double-free issue introduced by d832d2b246c5:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/sound/soc/samsung/odroid.c?id=d832d2b246c516eacb2d0ba53ec17ed59c3cd62b#n318
and n303, n308.

So we sent two patches to fix them separately.

--
Regards,
Wen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
