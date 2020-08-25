Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02171250FFB
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 05:27:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F8D31661;
	Tue, 25 Aug 2020 05:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F8D31661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598326078;
	bh=JjmCa0YLrRln5IbtVF1KjoPJCVLB/W1p3zdefBadhJw=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITOtzVQfX+QhTOp6ztAiG0/U/NrgktM1+n4Oz4/SfRA8Xv1boyqtDmkmzPliC9hf+
	 /5dGuF/GI65b5jSzzmdSu73QaF4SnO1MCs9fprPxh5ynyi5YrovnQzWiLHs1Dpobvb
	 3bAMwG/mQN/LPugp79yUUQuDhTaOOeIhTAqP2B/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F4060F80245;
	Tue, 25 Aug 2020 05:26:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59BDFF8025A; Tue, 25 Aug 2020 05:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63D09F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 05:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D09F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Nwdj8Qyh"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4484560000>; Mon, 24 Aug 2020 20:24:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 24 Aug 2020 20:26:05 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 20:26:05 -0700
Received: from [10.25.97.151] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 03:25:59 +0000
From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 3/9] ASoC: audio-graph: Identify 'no_pcm' DAI links for
 DPCM
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
 <1596605064-27748-4-git-send-email-spujar@nvidia.com>
 <87pn7ofs19.wl-kuninori.morimoto.gx@renesas.com>
 <97f325a6-96cc-11c5-8027-8c0a159e3da0@nvidia.com>
Message-ID: <2d3aa11e-3c56-1f7a-3d41-2457f973d55b@nvidia.com>
Date: Tue, 25 Aug 2020 08:55:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97f325a6-96cc-11c5-8027-8c0a159e3da0@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598325846; bh=f90dV3PFmjB+t9TM7uNV45655xT1b8n/JEproPmBO70=;
 h=X-PGP-Universal:From:Subject:To:CC:References:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language;
 b=Nwdj8QyhrFYJkndCQk2cBqm2aWEQ/HuK3eU/t3aUGvdixMh/ynSoBAfgwqZY8ZrSV
 16QqEUlr537FprNyJ6N0B16DoF5h3RrQIBz9xgRLQd9cCrKMCpryNL2lhTkm5OeZFl
 B0A19HXbOl3qtOffBeYB7Xky/AjpO6VVuMU1Cf9PsXnBQtRfjyrgwOwjHX6SF0sa/1
 DkPKzEzmLNibLduSylROupNshDx8BDAEKQEyQRFXOOTYOiqvJU5rx4cVV8OulD0TYk
 oL6+YP3/cH73jg7KQessUCdITlSVjr6XnJrj0B+O1ofmX2Tm19KN6q6EYYNLCPIlOt
 fzjHhRzb3bjmg==
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 nwartikar@nvidia.com, lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

Hi Morimoto-san,

>> (snip)
>>> +static bool soc_component_is_pcm(struct snd_soc_dai_link_component 
>>> *dlc)
>>> +{
>>> +     struct snd_soc_dai *dai = snd_soc_find_dai(dlc);
>>> +
>>> +     if (dai && (dai->component->driver->pcm_construct ||
>>> +                 dai->driver->pcm_new))
>>> +             return true;
>>> +
>>> +     return false;
>>> +}
>> This snd_soc_find_dai() will indicate WARNING
>> if .config has CONFIG_LOCKDEP for me.
>>
>> Maybe implement it at soc-core.c with client_mutex lock
>> is needed.

I tried testing this with LOCKDEP config enabled at my end. It seems I 
don't see warning originated from above function. Are you suggesting 
that, in general, snd_soc_find_dai() should be called with client_mutex 
held?

However I do see below warning and stack which is not related to above 
function call.
   dump_backtrace+0x0/0x1c0
   show_stack+0x18/0x28
   dump_stack+0xc8/0x128
   __warn+0xa0/0x15c
   report_bug+0xc8/0x180
   bug_handler+0x20/0x80
   brk_handler+0x6c/0xc0
   do_debug_exception+0xd8/0x1f0
   el1_sync_handler+0x98/0x128
   el1_sync+0x7c/0x100
   snd_soc_find_dai+0x10c/0x120 [snd_soc_core]
   snd_soc_dai_link_set_capabilities+0xc0/0x168 [snd_soc_core]
   graph_dai_link_of_dpcm+0x3a4/0x410 [snd_soc_audio_graph_card]
   graph_for_each_link+0x174/0x220 [snd_soc_audio_graph_card]
   graph_probe+0x174/0x270 [snd_soc_audio_graph_card]

May be *snd_soc_dai_link_set_capabilities**()* requires similar fix?


Thanks,
Sameer
