Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E3FD971
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 10:39:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 990A51667;
	Fri, 15 Nov 2019 10:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 990A51667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573810786;
	bh=s5/X22gbWnxtCDHr9s0v4gqPCok9WsKcVAdNk778nBs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ca/LAAF8OlRyd6DPKkwBMk4ISBiTHbmtcdGSnNA5fADb/B7SZrEKa7FRsMk5Y6CBA
	 HniIoOaoJvkDCDaLLuU5CH3OpEtgjfMuf9R2UftRPUIvZy57lSbRkW0jbnDE4Lz2F2
	 iaf8Cjikor7VqJyjREbme0I1d1jLTGhqwFu5TUPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAFF5F800CC;
	Fri, 15 Nov 2019 10:38:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A082F80103; Fri, 15 Nov 2019 10:38:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FDFFF8007E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 10:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FDFFF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ivdSKmnH"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce71f10000>; Fri, 15 Nov 2019 01:37:53 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 15 Nov 2019 01:37:54 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 15 Nov 2019 01:37:54 -0800
Received: from [10.24.218.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 09:37:52 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20191114033704.18171-1-nmahale@nvidia.com>
 <s5hr22an3p1.wl-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <d1d804c6-a21d-67ed-8348-4ccb9950426d@nvidia.com>
Date: Fri, 15 Nov 2019 15:07:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <s5hr22an3p1.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573810673; bh=B7Py/AOEt0wle8S7StvFnXWWIfdonU3TOab6GKdWUB0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ivdSKmnHjbFANFAz9YwLmf5skc+anYgK5qw0z/5NCaLjTwac+x4gh4sl5p3Wz941A
 hRZnmAHMh6D2cN3ODmSJTFkd5lzkWW82FA6YJFx8M1TszKdCC2ghoKSrSuxVwnhHmn
 lNes7/bB1q13a96DH70kvggoblerkgcEQ+BETR6TDZLj6BjGKpxJZjhE/NGeX4/Lth
 JcNzsqoJIxSIQUws7E6vOlijMw6rkW1/PZyhdScQJMKkmdxQimFH5yFbfXhuE8nzDr
 KSXtnbPPJVNWuTccPtAk/RWLVTBXKmnv1rwmhGz+BrdupZH1ND0MoFRV4rBuqbORGG
 uyBGFFibIGYaQ==
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH v1 0/5] ALSA: hda - Add DP-MST support for
	NVIDIA codecs
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

On 11/14/19 4:08 PM, Takashi Iwai wrote:
> On Thu, 14 Nov 2019 04:36:59 +0100,
> Nikhil Mahale wrote:
>>
>> Today, DisplayPort multi-stream transport (DP-MST) audio is not
>> supported on codec drivers which don't use the audio component
>> (acomp) binding.
>>
>> The commit ade49db337a9 (ALSA: hda/hdmi - Allow audio component for
>> AMD/ATI and Nvidia HDMI) added the DRM audio component binding for
>> the NVIDIA codec drivers, but the traditional HD-audio unsolicited
>> event code path is still in use by the proprietary NVIDIA graphics
>> driver.
>>
>> This patch set adds DP-MST audio support for non-acomp codec drivers
>> which use the traditional HD-audio unsolicited event code path. This
>> patch set adds DP-MST support for NVIDIA codecs.
>>
>> The patch set has been tested for HDMI/DP-SST/DP-MST(4 dp-mst audio
>> streams) configurations on NVIDIA Kepler and Maxwell GPUs, using
>> both the nouveau driver and the proprietary NVIDIA graphics driver.
> 
> Thanks for the patch.  The logic looks good, but there are a few
> concerns in implementation details.  Will comment in the reply of each
> patch.

Thanks Takashi, I am sending out 2nd version of patch set in which
I tried to address you concerned.

Thanks,
Nikhil Mahale

> The timing is a bit late for merging into 5.5, though, for this kind
> of non-trivial changes.  It'll be likely applied after 5.5 merge
> window, so for 5.6.
> 
> 
> Takashi
> 

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
