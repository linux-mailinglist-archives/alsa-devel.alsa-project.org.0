Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E5321C2D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 17:04:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 049061675;
	Mon, 22 Feb 2021 17:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 049061675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614009883;
	bh=4vAMY54tRWten5ztKI6y2Tv8QEL7q9snlvQ+KLASmL0=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vsCuRK7/c47lm6KIw4aWmgYuv9NAmJFLrg6VhSaBFB4zA2q59LfqpoO3eJ6UThYOL
	 nRweWwrgl29/BRvOxR9DMzmO+zy8QCbldTPBlpgOZ+5UN/XBJXWrpqFq1rgnrWjzE4
	 ZOuaD6TTc9XfIvineB2ONubrVV9G7ndVvc8zxIDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5265AF800CE;
	Mon, 22 Feb 2021 17:03:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C5ECF8016C; Mon, 22 Feb 2021 17:03:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C1E8F800CE
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 17:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C1E8F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Y+n0N6Ff"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6033d5b20000>; Mon, 22 Feb 2021 08:02:58 -0800
Received: from [10.25.103.29] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Feb
 2021 16:02:56 +0000
To: Linux-ALSA <alsa-devel@alsa-project.org>
From: Sameer Pujar <spujar@nvidia.com>
Subject: Query on sysclk source
Message-ID: <6dd48118-b56b-fd83-00b9-d34558603b21@nvidia.com>
Date: Mon, 22 Feb 2021 21:32:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614009778; bh=z+u3okmTFH7WSkn4Ab9LOPf0Ho+3qhZNK/CPxdqT8g8=;
 h=To:CC:From:Subject:Message-ID:Date:User-Agent:MIME-Version:
 Content-Type:Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=Y+n0N6Ffx1T2reWcTAWJjZRpGOTFhoAp3uEWkfCuzuq6pnptT6GUG9o+HHEzVAwx0
 RowzIJYbOfR6z7vGKQ1elm5VDTpWmJReQMjeJvsMN2CvPi23ozbFMv2abXmq6tU1Ov
 qAJaY4O9vxnTWv3dxmXzg0NdAyr3820U4wrdHeUFLEhX9soHxhx7YEWP45D/xhw/SJ
 BaM3R90xmP62PGibrrllL7gO9Xkub7e1aqoaaP05AbTrvwP+TBA/jJQ8zeZTFGPACb
 YvVugUJmiU+Yhl3qilHnz+z2Wz/Ed1CH5muaUiphhdJ7Xy6yMbuc71MZGOzZQb/kgG
 VV9TUlLXUuczw==
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Mark Brown <broonie@kernel.org>
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

Hi All,

I do have a query for snd_soc_dai_set_sysclk(). It takes 'clk_id' as 
argument which is used for sysclk source purpose in some drivers and in 
some it seems to be used for clock ID specifically. Please see below 
references.
   - 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/atmel/sam9g20_wm8731.c#n105(clk_id 
as sysclk source)
   - 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/atmel/sam9x5_wm8731.c#n50(clk_id 
as sysclk source)
   - 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/boards/bytcr_wm5102.c#n78(clk_id 
actually seems refer to specific clock id)

To add snd_soc_component_sysclk() takes both 'clk_id' and 'source' 
arguments.

Currently snd_soc_dai_set_sysclk() has following implementation.
------------------------------------------------------------------
/    int snd_soc_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,//
//                   unsigned int freq, int dir)//
//    {//
//        int ret;//
//
//        if (dai->driver->ops &&//
//dai->driver->ops->set_sysclk)//
//            ret = dai->driver->ops->set_sysclk(dai, clk_id, freq, dir);//
//        else//
//            ret = snd_soc_component_set_sysclk(dai->component, clk_id, 
0,//
//                               freq, dir);//
//
//        return soc_dai_ret(dai, ret);//
//    }/
-------------------------------------------------------------------

The 'source' for snd_soc_component_set_sysclk() is hardcoded to 0 
always, which may not be the case always. Please see below.
   - 
https://elixir.bootlin.com/linux/v5.11/source/sound/soc/samsung/bells.c#L161

Hence I am wondering if 'clk_id' argument is being used inconsistently 
for snd_soc_dai_set_sysclk() and should we rather have a separate 
'source' argument for this as well?


Thanks,
Sameer.
